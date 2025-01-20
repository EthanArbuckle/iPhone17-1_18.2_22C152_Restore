void sub_1000041C8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  uint64_t v9;

  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004200(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100004228(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void sub_100004244(uint64_t a1@<X8>)
{
  *(void *)(v1 - 8) = a1;
}

void sub_100004250(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_10000426C(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_100004340(uint64_t a1)
{
  qword_100041840 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return _objc_release_x1();
}

id sub_10000457C(uint64_t a1)
{
  kern_return_t MatchingServices;
  id result;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  UARPAppleHPM *v11;
  io_iterator_t existing;

  id v2 = objc_alloc_init((Class)NSMutableArray);
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 24);
  *(void *)(v3 + 24) = v2;

  existing = 0;
  CFDictionaryRef v5 = IOServiceMatching("AppleHPM");
  MatchingServices = IOServiceGetMatchingServices(kIOMasterPortDefault, v5, &existing);
  result = (id)existing;
  if (MatchingServices) {
    v8 = 1;
  }
  else {
    v8 = existing == 0;
  }
  if (!v8)
  {
    uint64_t v9 = IOIteratorNext(existing);
    if (v9)
    {
      v10 = v9;
      do
      {
        v11 = [[UARPAppleHPM alloc] initWithIOService:v10];
        if (v11) {
          [*(id *)(*(void *)(a1 + 32) + 24) addObject:v11];
        }
        IOObjectRelease(v10);

        v10 = IOIteratorNext(existing);
      }
      while (v10);
    }
    IOObjectRelease(existing);
    return [*(id *)(a1 + 32) qEnumerateHPMsWithMagSafe];
  }
  return result;
}

void sub_100004AB4(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) qCreateOrUpdateMagSafeAccessory:*(unsigned int *)(a1 + 48) identifier:*(void *)(a1 + 40)];
  if (!v2)
  {
    id v2 = [*(id *)(a1 + 32) qCreateOrUpdateDongle:*(unsigned int *)(a1 + 48) identifier:*(void *)(a1 + 40)];
  }
  if (![*(id *)(a1 + 40) isEqualToString:kUARPStringUSBCLightningDisconnectNotification])
  {
    CFDictionaryRef v5 = *(NSObject **)(*(void *)(a1 + 32) + 56);
    BOOL v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v2)
    {
      if (v6)
      {
        int v12 = 138412290;
        v13 = v2;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "check for update %@", (uint8_t *)&v12, 0xCu);
      }
      unsigned __int8 v7 = [*(id *)(a1 + 32) qAddAccessory:v2];
      v8 = *(void **)(a1 + 32);
      if (v7)
      {
        [v8 qCheckForUpdate:v2 assetID:0];
        goto LABEL_17;
      }
      CFDictionaryRef v5 = v8[7];
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      v11 = *(void **)(a1 + 40);
      int v12 = 138412290;
      v13 = v11;
      v10 = "Ignore duplicate accessory: %@";
    }
    else
    {
      if (!v6) {
        goto LABEL_17;
      }
      uint64_t v9 = *(void **)(a1 + 40);
      int v12 = 138412290;
      v13 = v9;
      v10 = "Ignore matching for %@";
    }
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v12, 0xCu);
    goto LABEL_17;
  }
  uint64_t v3 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    uint64_t v4 = *(void **)(a1 + 40);
    int v12 = 138412290;
    v13 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Handle disconnection: %@", (uint8_t *)&v12, 0xCu);
  }
  [*(id *)(a1 + 32) qDisconnectDongle:*(unsigned int *)(a1 + 48)];
LABEL_17:
}

uint64_t sub_100005250(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 92);
  return result;
}

void sub_1000053C0(uint64_t a1)
{
  id v2 = *(NSObject **)(*(void *)(a1 + 32) + 56);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    int v3 = 136315394;
    uint64_t v4 = "-[UARPUSBPDUpdater handleBsdNotificationPowerAdapter]_block_invoke";
    __int16 v5 = 1024;
    int v6 = 8;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%s: Requesting Power adapter discovery after %u seconds", (uint8_t *)&v3, 0x12u);
  }
  *(unsigned char *)(*(void *)(a1 + 32) + 92) = 1;
}

id sub_10000548C(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 92) = 0;
  return [*(id *)(a1 + 32) qBsdNotificationReceivedPowerSource];
}

id sub_1000096F8(uint64_t a1)
{
  return [*(id *)(a1 + 32) qSolicitDynamicAsset:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48)];
}

void sub_10000A0C8(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 manufacturer:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000A28C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 modelName:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000A450(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 firmwareVersion:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000A614(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 stagedFirmwareVersion:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000A7C4(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 stats:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000A974(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 hardwareVersion:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000AB38(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 serialNumber:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000AD58(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 appleModelNumber:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000AF0C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 hwFusingType:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000B0C0(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 queryCompleteForAccessoryID:v3 friendlyName:*(void *)(a1 + 48) error:*(void *)(a1 + 56)];
}

void sub_10000B300(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 firmwareStagingProgress:v3 bytesSent:*(void *)(a1 + 48) bytesTotal:*(void *)(a1 + 56)];
}

void sub_10000B550(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 assetSolicitationProgress:v3 assetID:*(void *)(a1 + 48) bytesReceived:*(void *)(a1 + 56) bytesTotal:*(void *)(a1 + 64)];
}

void sub_10000B67C(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) getUARPUSBPDAccessoryForUARPAccessory:*(void *)(a1 + 40)];
  [v2 sendUARPMessage:*(void *)(a1 + 48)];
}

void sub_10000B79C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = [*(id *)(a1 + 40) uarpAccessory];
  uint64_t v4 = *(void *)(a1 + 48);
  uint64_t v5 = 0;
  [v2 recvDataFromAccessory:v3 data:v4 error:&v5];
}

void sub_10000B98C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 assetAvailablityUpdateForAccessoryID:v3 assetID:*(void *)(a1 + 48)];
}

void sub_10000BD8C(uint64_t a1)
{
  id v2 = *(void **)(*(void *)(a1 + 32) + 96);
  id v3 = [*(id *)(a1 + 40) uarpAccessoryID];
  [v2 assetAvailablityUpdateForAccessoryID:v3 assetID:*(void *)(a1 + 48)];
}

id sub_10000C04C(uint64_t a1)
{
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 56), OS_LOG_TYPE_DEBUG)) {
    sub_100022E0C();
  }
  id v2 = [*(id *)(a1 + 40) hpmDelegate];
  unsigned __int8 v3 = [v2 isConnected];

  uint64_t v4 = *(void **)(a1 + 32);
  if (v3) {
    return [v4 qAccessoryTransferComplete:*(void *)(a1 + 40) assetID:*(void *)(a1 + 48) status:*(void *)(a1 + 56)];
  }
  int v6 = v4[7];
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    uint64_t v7 = *(void *)(a1 + 40);
    int v8 = 136315394;
    uint64_t v9 = "-[UARPUSBPDUpdater assetTransferComplete:assetID:status:]_block_invoke";
    __int16 v10 = 2112;
    uint64_t v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "%s: accessory is no longer connected %@", (uint8_t *)&v8, 0x16u);
  }
  return [*(id *)(a1 + 32) qAccessoryUnplugged:*(void *)(a1 + 40)];
}

void sub_10000C48C(uint64_t a1)
{
  if (os_log_type_enabled(*(os_log_t *)(*(void *)(a1 + 32) + 56), OS_LOG_TYPE_DEBUG)) {
    sub_100022EF8();
  }
  id v2 = [*(id *)(a1 + 40) copy];
  uint64_t v3 = *(void *)(a1 + 32);
  uint64_t v4 = *(void **)(v3 + 80);
  *(void *)(v3 + 80) = v2;
}

uint64_t sub_10000C5FC(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_10000C60C(uint64_t a1)
{
}

void sub_10000C614(void *a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&long long v4 = 136315650;
    long long v13 = v4;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = *(NSObject **)(a1[4] + 56);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = a1[5];
          *(_DWORD *)buf = v13;
          v19 = "-[UARPUSBPDUpdater getUARPAccessoryForUARPAccessoryID:]_block_invoke";
          __int16 v20 = 2112;
          uint64_t v21 = v12;
          __int16 v22 = 2112;
          v23 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s: Check match %@ vs %@", buf, 0x20u);
        }
        __int16 v10 = objc_msgSend(v8, "uarpAccessoryID", v13, (void)v14);
        unsigned int v11 = [v10 isEqual:a1[5]];

        if (v11)
        {
          if (os_log_type_enabled(*(os_log_t *)(a1[4] + 56), OS_LOG_TYPE_DEBUG)) {
            sub_100022F70();
          }
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
          goto LABEL_15;
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

void sub_10000C908(void *a1)
{
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v2 = *(id *)(a1[4] + 32);
  id v3 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
  if (v3)
  {
    id v5 = v3;
    uint64_t v6 = *(void *)v15;
    *(void *)&long long v4 = 136315650;
    long long v13 = v4;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v15 != v6) {
          objc_enumerationMutation(v2);
        }
        int v8 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v9 = *(NSObject **)(a1[4] + 56);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v12 = a1[5];
          *(_DWORD *)buf = v13;
          v19 = "-[UARPUSBPDUpdater getUARPUSBPDAccessoryForUARPAccessory:]_block_invoke";
          __int16 v20 = 2112;
          uint64_t v21 = v12;
          __int16 v22 = 2112;
          v23 = v8;
          _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "%s: Check match %@ vs %@", buf, 0x20u);
        }
        __int16 v10 = objc_msgSend(v8, "uarpAccessory", v13, (void)v14);
        unsigned int v11 = [v10 isEqual:a1[5]];

        if (v11)
        {
          if (os_log_type_enabled(*(os_log_t *)(a1[4] + 56), OS_LOG_TYPE_DEBUG)) {
            sub_100022FE4();
          }
          objc_storeStrong((id *)(*(void *)(a1[6] + 8) + 40), v8);
          goto LABEL_15;
        }
      }
      id v5 = [v2 countByEnumeratingWithState:&v14 objects:v24 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
LABEL_15:
}

id sub_10000CBB0(uint64_t a1)
{
  return [*(id *)(a1 + 32) qAccessoryUnplugged:*(void *)(a1 + 40)];
}

void sub_10000CEC0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void sub_10000CEDC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_10000CEF8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_10000D7CC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

uint64_t sub_10000D800()
{
  return v0;
}

int main(int argc, const char **argv, const char **envp)
{
  id v3 = os_log_create("com.apple.accessoryupdater.uarp", "usbpdUpdater");
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)int v8 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "USB-PD UARP updater started", v8, 2u);
  }
  int v4 = AUSandboxPlatformInit(v3, 0);
  if (!v4)
  {
    id v5 = objc_opt_new();
    uint64_t v6 = +[NSXPCListener serviceListener];
    [v6 setDelegate:v5];
    [v6 resume];
  }
  return v4;
}

id sub_10000E9A0(uint64_t a1, void *a2)
{
  return [a2 assetReady:a1 error:0];
}

id sub_10000E9B0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 assetMetaDataTLV:a1 type:a3 length:a4 value:a5 error:0];
}

id sub_10000E9CC(uint64_t a1, void *a2)
{
  return [a2 assetMetaDataComplete:a1 error:0];
}

id sub_10000E9E0(uint64_t a1, void *a2)
{
  return [a2 payloadReady:a1 error:0];
}

id sub_10000E9F0(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return [a2 payloadMetaDataTLV:a1 type:a3 length:a4 value:a5 error:0];
}

id sub_10000EA0C(uint64_t a1, void *a2)
{
  return [a2 payloadMetaDataComplete:a1 error:0];
}

void sub_10000EA20(void *a1, void *a2, uint64_t a3, unsigned int a4, uint64_t a5)
{
  id v11 = a1;
  id v9 = a2;
  uint64_t v10 = +[NSData dataWithBytes:a3 length:a4];
  LOBYTE(a5) = [v9 payloadData:v11 data:v10 offset:a5 error:0];

  if ((a5 & 1) == 0) {
    [v9 abandonAsset:v11 reason:2304];
  }
}

void sub_10000EAD4(void *a1, void *a2)
{
  id v4 = a1;
  id v3 = a2;
  if (([v3 payloadDataComplete:v4 error:0] & 1) == 0) {
    [v3 abandonAsset:v4 reason:2304];
  }
}

uint64_t sub_10000EB44(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (objc_msgSend(a3, "getBytesAtOffset:accessory:buffer:length:bytesCopied:", a6, a1, a4, a5)) {
    return 0;
  }
  else {
    return 35;
  }
}

uint64_t sub_10000EB80(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if ([a3 setBytesAtOffset:a6 accessory:a1 buffer:a4 length:a5]) {
    return 0;
  }
  else {
    return 35;
  }
}

id sub_10000EBBC(uint64_t a1, uint64_t a2, void *a3)
{
  return [a3 rescinded:a1];
}

id sub_10000EBCC(uint64_t a1, void *a2)
{
  return [a2 corrupted:a1];
}

id sub_10000EBD8(uint64_t a1, void *a2)
{
  return [a2 orphaned:a1];
}

uint64_t sub_10000EBE8(void *a1, uint64_t a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = uarpPlatformEndpointAssetRelease2((uint64_t)[a1 uarpEndpoint], 0, (uint64_t)v4);

  return v5;
}

void sub_10000F474(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void *uarpAllocateTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v12 = 0;
  int v6 = UARPLayer2RequestBuffer(a1, &v12, 0x28u);
  result = 0;
  if (!v6)
  {
    unsigned int v8 = *(_DWORD *)a2 + *(unsigned __int16 *)(a2 + 30) + 26;
    if (v8 <= a3) {
      unsigned int v8 = a3;
    }
    unsigned int v11 = v8;
    if (UARPLayer2RequestTransmitMsgBuffer(a1, a2, v12, &v11))
    {
      UARPLayer2ReturnBuffer(a1, v12);
      return 0;
    }
    else
    {
      unsigned int v9 = v11;
      result = v12;
      *((_DWORD *)v12 + 2) = v11;
      uint64_t v10 = *(unsigned __int16 *)(a2 + 30);
      result[2] = *result + v10;
      *((_DWORD *)result + 6) = v9 - v10;
      *((_WORD *)result + 14) = 0;
    }
  }
  return result;
}

void *uarpAllocPrepareTransmitBuffer2(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, char a5)
{
  uint64_t v10 = sub_1000115FC(a1, a2, a4);
  if (v10) {
    goto LABEL_2;
  }
  __int16 v14 = *(_WORD *)(a2 + 96);
  uint64_t v23 = 0;
  unsigned int v15 = 16 * (v14 & 0x7FFF);
  if (UARPLayer2RequestBuffer(a1, &v23, v15)) {
    return 0;
  }
  unsigned __int16 v16 = 2 * v14;
  uint64_t v17 = *(unsigned __int16 *)(a2 + 96);
  if (v17 < v16)
  {
    do
    {
      TransmitBuffer2 = uarpAllocateTransmitBuffer2(a1, a2, 0);
      *(void *)(v23 + 8 * v17++) = TransmitBuffer2;
    }
    while (v16 != v17);
  }
  *(_WORD *)(a2 + 96) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 104));
  *(void *)(a2 + 104) = v23;
  uint64_t v22 = 0;
  if (UARPLayer2RequestBuffer(a1, &v22, v15)) {
    return 0;
  }
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v20 = 0;
    uint64_t v21 = 8 * *(unsigned __int16 *)(a2 + 112);
    do
    {
      *(void *)(v22 + v20) = *(void *)(*(void *)(a2 + 120) + v20);
      v20 += 8;
    }
    while (v21 != v20);
  }
  *(_WORD *)(a2 + 112) = v16;
  UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 120));
  *(void *)(a2 + 120) = v22;
  uint64_t v10 = sub_1000115FC(a1, a2, a4);
  if (v10)
  {
LABEL_2:
    size_t v11 = *((unsigned int *)v10 + 6);
    if (v11 >= a4)
    {
      *((_WORD *)v10 + 14) = a4;
      *((unsigned char *)v10 + 31) = a5;
      bzero((void *)v10[2], v11);
      *(_WORD *)v10[2] = uarpHtons(a3);
      __int16 v12 = uarpHtons((unsigned __int16)(a4 - 6));
      uint64_t v13 = v10[2];
      *(_WORD *)(v13 + 2) = v12;
      *(_WORD *)(v13 + 4) = 0;
      return v10;
    }
    return 0;
  }
  return v10;
}

uint64_t uarpTransmitBuffer2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
  if (v3 >= 2)
  {
    uint64_t v4 = 0;
    do
    {
      uint64_t v5 = *(void *)(a2 + 120);
      if (!*(void *)(v5 + v4))
      {
        *(void *)(v5 + v4) = *(void *)(v5 + v4 + 8);
        *(void *)(*(void *)(a2 + 120) + v4 + 8) = 0;
      }
      v4 += 8;
    }
    while (8 * (v3 - 1) != v4);
  }
  if (!v3) {
    return 11;
  }
  for (i = *(void **)(a2 + 120); *i; ++i)
  {
    if (!--v3) {
      return 11;
    }
  }
  void *i = a3;
  uarpTransmitQueueService(a1, a2);
  return 0;
}

uint64_t uarpTransmitQueueService(uint64_t a1, uint64_t a2)
{
  LODWORD(v2) = *(unsigned __int16 *)(a2 + 112);
  if (!*(_WORD *)(a2 + 112)) {
    return 0;
  }
  uint64_t v4 = a1;
  char v5 = 0;
  while (2)
  {
    while (2)
    {
      int v6 = *(uint64_t **)(a2 + 120);
      uint64_t v2 = v2;
      while (1)
      {
        uint64_t v7 = *v6;
        if (*v6) {
          break;
        }
LABEL_7:
        ++v6;
        if (!--v2) {
          return 0;
        }
      }
      if (*(unsigned char *)(v7 + 32) == 1)
      {
        if (*(void *)(v4 + 296)) {
          return 0;
        }
        goto LABEL_7;
      }
      if (*(unsigned char *)(v7 + 33) == 1) {
        goto LABEL_16;
      }
      int v8 = uarpNtohs(**(unsigned __int16 **)(v7 + 16));
      if (v8 == 0xFFFF)
      {
        a1 = UARPLayer2VendorSpecificCheckValidToSend(v4, a2);
        if (a1) {
          goto LABEL_18;
        }
LABEL_16:
        a1 = uarpTransmitQueuePendingEntryComplete(a1, a2, v7);
        LODWORD(v2) = *(unsigned __int16 *)(a2 + 112);
        if (!*(_WORD *)(a2 + 112)) {
          return 0;
        }
        continue;
      }
      break;
    }
    if (v8 == 3
      && uarpNtohl(*(_DWORD *)(*(void *)(v7 + 16) + 6)) == 9
      && *(unsigned __int16 *)(a2 + 48) <= 2u)
    {
      a1 = UARPLayer2FriendlyNameResponse(v4, a2);
      goto LABEL_16;
    }
LABEL_18:
    if (*(unsigned char *)(a2 + 50) == 1) {
      return 0;
    }
    unsigned int v9 = *(unsigned __int8 *)(v7 + 30);
    if (*(unsigned __int16 *)(a2 + 18) < v9)
    {
      uint64_t v10 = uarpNtohs(**(unsigned __int16 **)(v7 + 16));
      if (v10 == 0xFFFF) {
        uint64_t v10 = UARPLayer2VendorSpecificExceededRetries(v4, a2);
      }
      a1 = uarpTransmitQueuePendingEntryComplete(v10, a2, v7);
      LODWORD(v2) = *(unsigned __int16 *)(a2 + 112);
      char v5 = 1;
      if (!*(_WORD *)(a2 + 112)) {
        return 0;
      }
      continue;
    }
    break;
  }
  *(unsigned char *)(v7 + 30) = v9 + 1;
  *(unsigned char *)(v7 + 32) = 1;
  if (*(unsigned char *)(v7 + 31) == 1) {
    UARPLayer2WatchdogSet(v4, a2);
  }
  *(_WORD *)(*(void *)(v7 + 16) + 4) = uarpHtons(*(unsigned __int16 *)(a2 + 58));
  ++*(_WORD *)(a2 + 58);
  uint64_t v11 = UARPLayer2SendMessage(v4, a2, *(const void **)v7, *(unsigned __int16 *)(a2 + 30) + *(unsigned __int16 *)(v7 + 28));
  UARPLayer2LogPacket(v4, a2);
  if (!v11) {
    return 0;
  }
  *(unsigned char *)(v7 + 32) = 0;
  uarpPlatformEndpointSendMessageCompleteInternal(v4, a2, *(void *)(v7 + 16));
  if (v5) {
    return 0;
  }
  return v11;
}

uint64_t uarpTransmitQueuePendingEntryComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(unsigned __int16 *)(a2 + 112);
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v4 = *(void **)(a2 + 120);
    uint64_t v5 = *(unsigned __int16 *)(a2 + 112);
    while (!*v4 || *v4 != a3)
    {
      ++v4;
      if (!--v5) {
        goto LABEL_15;
      }
    }
    *uint64_t v4 = 0;
    *(_WORD *)(a3 + 32) = 0;
    *(_DWORD *)(a3 + 28) = 0;
    uint64_t v7 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      int v8 = *(void **)(a2 + 104);
      while (*v8)
      {
        ++v8;
        if (!--v7) {
          goto LABEL_15;
        }
      }
      void *v8 = a3;
    }
LABEL_15:
    if (v3 >= 2)
    {
      uint64_t v9 = 0;
      uint64_t v10 = 8 * (v3 - 1);
      do
      {
        uint64_t v11 = *(void *)(a2 + 120);
        if (!*(void *)(v11 + v9))
        {
          *(void *)(v11 + v9) = *(void *)(v11 + v9 + 8);
          *(void *)(*(void *)(a2 + 120) + v9 + 8) = 0;
        }
        v9 += 8;
      }
      while (v10 != v9);
    }
  }
  return 0;
}

uint64_t uarpTransmitQueueProcessRecv(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned __int16 a4)
{
  if (*(_WORD *)(a2 + 112))
  {
    uint64_t v8 = 0;
    uint64_t v9 = (unsigned __int8 *)(a3 + 3);
    uint64_t v10 = (unsigned __int8 *)(a3 + 5);
    int v11 = a4 & 0xFFF8;
    while (1)
    {
      uint64_t v12 = *(void *)(*(void *)(a2 + 120) + 8 * v8);
      if (!v12) {
        goto LABEL_32;
      }
      int v13 = uarpNtohs(*a3);
      int v14 = uarpNtohs(**(unsigned __int16 **)(v12 + 16));
      if (v13 == 7 && v14 == 6)
      {
        if (a4 < 0x12u) {
          goto LABEL_32;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        if (a3[4] != *(unsigned __int16 *)(v18 + 6) || *(_DWORD *)v10 != *(_DWORD *)(v18 + 8)) {
          goto LABEL_32;
        }
        int v19 = a3[7];
LABEL_26:
        int v20 = *(unsigned __int16 *)(v18 + 12);
        goto LABEL_31;
      }
      if (v13 == 13 && v14 == 5)
      {
        if (a4 < 0x24u) {
          goto LABEL_32;
        }
        uint64_t v18 = *(void *)(v12 + 16);
        int v19 = a3[6];
        goto LABEL_26;
      }
      if (v13 == 14 && v14 == 8)
      {
LABEL_47:
        uint64_t v23 = UARPLayer2WatchdogCancel(a1, a2);
        uarpTransmitQueuePendingEntryComplete(v23, a2, v12);
        return 0;
      }
      if (v13 == 15 && v14 == 9)
      {
        if (a4 < 0xAu) {
          goto LABEL_32;
        }
        goto LABEL_30;
      }
      if (v13 == 16 && v14 == 12)
      {
        if (!v11) {
          goto LABEL_32;
        }
LABEL_30:
        int v19 = *(unsigned __int16 *)v9;
        int v20 = *(unsigned __int16 *)(*(void *)(v12 + 16) + 6);
LABEL_31:
        if (v19 == v20) {
          goto LABEL_47;
        }
        goto LABEL_32;
      }
      if (v13 == 18 && v14 == 17) {
        break;
      }
      if (v13 == 20 && v14 == 19)
      {
        if (a4 < 0xCu) {
          goto LABEL_32;
        }
        uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6);
        uint64_t v22 = v9;
LABEL_42:
        if (uarpAssetTagCompare(v22, v21)) {
          goto LABEL_47;
        }
        goto LABEL_32;
      }
      if (v13 == 0xFFFF && v14 == 0xFFFF && UARPLayer2VendorSpecificCheckExpectedResponse(a1, a2) == 1) {
        goto LABEL_47;
      }
LABEL_32:
      if (++v8 >= (unint64_t)*(unsigned __int16 *)(a2 + 112)) {
        return 0;
      }
    }
    if (a4 < 0xEu) {
      goto LABEL_32;
    }
    uint64_t v21 = (unsigned __int8 *)(*(void *)(v12 + 16) + 6);
    uint64_t v22 = v10;
    goto LABEL_42;
  }
  return 0;
}

void uarpTransmitQueuesCleanup(uint64_t a1, uint64_t a2)
{
  UARPLayer2WatchdogCancel(a1, a2);
  uint64_t v4 = *(void **)(a2 + 104);
  if (v4)
  {
    unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
    if (*(_WORD *)(a2 + 96))
    {
      unint64_t v6 = 0;
      do
      {
        uint64_t v7 = *(void ***)(*(void *)(a2 + 104) + 8 * v6);
        if (v7)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v7);
          UARPLayer2ReturnBuffer(a1, v7);
          *(void *)(*(void *)(a2 + 104) + 8 * v6) = 0;
          unsigned int v5 = *(unsigned __int16 *)(a2 + 96);
        }
        ++v6;
      }
      while (v6 < v5);
      uint64_t v4 = *(void **)(a2 + 104);
    }
    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 104) = 0;
    *(_WORD *)(a2 + 96) = 0;
  }
  uint64_t v8 = *(void **)(a2 + 120);
  if (v8)
  {
    unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
    if (*(_WORD *)(a2 + 112))
    {
      unint64_t v10 = 0;
      do
      {
        int v11 = *(void ***)(*(void *)(a2 + 120) + 8 * v10);
        if (v11)
        {
          UARPLayer2ReturnTransmitMsgBuffer(a1, a2, *v11);
          UARPLayer2ReturnBuffer(a1, v11);
          *(void *)(*(void *)(a2 + 120) + 8 * v10) = 0;
          unsigned int v9 = *(unsigned __int16 *)(a2 + 112);
        }
        ++v10;
      }
      while (v10 < v9);
      uint64_t v8 = *(void **)(a2 + 120);
    }
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 120) = 0;
    *(_WORD *)(a2 + 112) = 0;
  }
}

uint64_t uarpPlatformEndpointIsMessageTypePending(uint64_t a1, uint64_t a2, int a3)
{
  if (!*(_WORD *)(a2 + 112)) {
    return 0;
  }
  uint64_t v5 = 0;
  while (1)
  {
    uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
    if (v6)
    {
      if (uarpNtohs(**(unsigned __int16 **)(v6 + 16)) == a3
        && *(unsigned char *)(*(void *)(*(void *)(a2 + 120) + 8 * v5) + 33) != 1)
      {
        break;
      }
    }
    if (++v5 >= (unint64_t)*(unsigned __int16 *)(a2 + 112)) {
      return 0;
    }
  }
  return 1;
}

void uarpTransmitQueueAssetRescinded(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a2 && *(_WORD *)(a2 + 112))
  {
    unint64_t v5 = 0;
    do
    {
      uint64_t v6 = *(void *)(*(void *)(a2 + 120) + 8 * v5);
      if (v6)
      {
        if (uarpNtohs(**(unsigned __int16 **)(v6 + 16)) == 6)
        {
          int v7 = uarpNtohs(*(unsigned __int16 *)(*(void *)(v6 + 16) + 6));
          if (!a3 || v7 == *(unsigned __int16 *)(a3 + 44)) {
            *(unsigned char *)(v6 + 33) = 1;
          }
        }
      }
      ++v5;
    }
    while (v5 < *(unsigned __int16 *)(a2 + 112));
  }
}

void *sub_1000115FC(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t v3 = *(unsigned __int16 *)(a2 + 96);
  if (!*(_WORD *)(a2 + 96)) {
    return 0;
  }
  for (i = *(_DWORD ***)(a2 + 104); ; ++i)
  {
    uint64_t v8 = *i;
    if (*i) {
      break;
    }
    if (!--v3) {
      return 0;
    }
  }
  void *i = 0;
  if (v8[6] >= a3) {
    return v8;
  }
  UARPLayer2ReturnTransmitMsgBuffer(a1, a2, v8);
  return uarpAllocateTransmitBuffer2(a1, a2, a3);
}

void sub_100011900(void *a1, io_iterator_t a2)
{
  id v5 = a1;
  uint64_t v3 = IOIteratorNext(a2);
  if (v3)
  {
    uint64_t v4 = v3;
    do
    {
      [v5 matchingService:v4];
      uint64_t v4 = IOIteratorNext(a2);
    }
    while (v4);
  }
}

void sub_10001196C(uint64_t a1)
{
}

uint64_t sub_100011A58(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) matchingService:*(unsigned int *)(a1 + 40) identifier:*(void *)(*(void *)(a1 + 32) + 16)];
  io_object_t v2 = *(_DWORD *)(a1 + 40);
  return IOObjectRelease(v2);
}

void *uarpZalloc(size_t a1)
{
  return malloc_type_calloc(a1, 1uLL, 0x100004077774924uLL);
}

unint64_t uarpHtonll(unint64_t a1)
{
  return bswap64(a1);
}

unint64_t uarpNtohll(unint64_t a1)
{
  return bswap64(a1);
}

uint64_t uarpHtonl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpNtohl(unsigned int a1)
{
  return bswap32(a1);
}

uint64_t uarpHtons(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpNtohs(unsigned int a1)
{
  return __rev16(a1);
}

uint64_t uarpPlatformDarwinDecompressBuffer(int a1, void *__src, size_t src_size, void *__dst, size_t __n)
{
  compression_algorithm v5 = 1538;
  switch(a1)
  {
    case 0:
      if (src_size != __n) {
        return 51;
      }
      memcpy(__dst, __src, __n);
      return 0;
    case 1:
      goto LABEL_6;
    case 2:
      compression_algorithm v5 = COMPRESSION_LZBITMAP;
      goto LABEL_6;
    case 3:
      compression_algorithm v5 = COMPRESSION_LZ4;
LABEL_6:
      if (compression_decode_buffer((uint8_t *)__dst, __n, (const uint8_t *)__src, src_size, 0, v5) == __n)uint64_t result = 0; {
      else
      }
        uint64_t result = 51;
      break;
    default:
      uint64_t result = 50;
      break;
  }
  return result;
}

uint64_t uarpPlatformDarwinCompressBuffer()
{
  return 50;
}

uint64_t uarpPlatformDarwinHashInfo(uint64_t result, _DWORD *a2, int *a3)
{
  int v3 = result - 1;
  if ((result - 1) > 2)
  {
    int v4 = 0;
    int v5 = 0;
  }
  else
  {
    int v4 = dword_10002B300[v3];
    int v5 = 16 * v3 + 32;
  }
  *a2 = v4;
  *a3 = v5;
  return result;
}

uint64_t uarpPlatformDarwinHashInit(uint64_t result, CC_SHA512_CTX *c)
{
  switch(result)
  {
    case 3:
      return CC_SHA512_Init(c);
    case 2:
      return CC_SHA384_Init(c);
    case 1:
      return CC_SHA256_Init((CC_SHA256_CTX *)c);
  }
  return result;
}

uint64_t uarpPlatformDarwinHashUpdate(uint64_t result, CC_SHA512_CTX *c, void *data, CC_LONG len)
{
  switch(result)
  {
    case 3:
      return CC_SHA512_Update(c, data, len);
    case 2:
      return CC_SHA384_Update(c, data, len);
    case 1:
      return CC_SHA256_Update((CC_SHA256_CTX *)c, data, len);
  }
  return result;
}

uint64_t uarpPlatformDarwinHashFinal(uint64_t result, CC_SHA512_CTX *a2, unsigned __int8 *md, int a4)
{
  if (result == 2)
  {
    if (a4 == 48) {
      return CC_SHA384_Final(md, a2);
    }
  }
  else if (result == 1)
  {
    if (a4 == 32) {
      return CC_SHA256_Final(md, (CC_SHA256_CTX *)a2);
    }
  }
  else if (result == 3 && a4 == 64)
  {
    return CC_SHA512_Final(md, a2);
  }
  return result;
}

void uarpLogError(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(byte_100041850, 0x200uLL, __format, va);
  int v3 = sub_100012D90(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100024514(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void *sub_100012D90(unsigned int a1)
{
  for (uint64_t i = 0; i != 9; ++i)
  {
    int v3 = uarpLoggingCategoryToString(i);
    qword_100042850[i] = os_log_create("com.apple.uarp.embedded", v3);
  }
  if (a1 <= 8) {
    return (void *)qword_100042850[a1];
  }
  else {
    return &_os_log_default;
  }
}

void uarpLogDebug(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(byte_100041A50, 0x200uLL, __format, va);
  int v3 = sub_100012D90(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    sub_10002458C(v3);
  }
}

void uarpLogInfo(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(byte_100041C50, 0x200uLL, __format, va);
  int v3 = sub_100012D90(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v5 = byte_100041C50;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }
}

void uarpLogFault(unsigned int a1, char *__format, ...)
{
  va_start(va, __format);
  vsnprintf(byte_100041E50, 0x200uLL, __format, va);
  int v3 = sub_100012D90(a1);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_100024610(v3, v4, v5, v6, v7, v8, v9, v10);
  }
}

void uarpPlatformDarwinLogError(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(byte_100042050, 0x200uLL, a3, &a9);
  uint64_t v10 = sub_100012D90(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_100024688(v10, v11, v12, v13, v14, v15, v16, v17);
  }
}

void uarpPlatformDarwinLogInfo(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(byte_100042250, 0x200uLL, a3, &a9);
  uint64_t v10 = sub_100012D90(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    uint64_t v12 = byte_100042250;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%s\n", buf, 0xCu);
  }
}

void uarpPlatformDarwinLogDebug(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(byte_100042450, 0x200uLL, a3, &a9);
  uint64_t v10 = sub_100012D90(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    sub_100024700(v10);
  }
}

void uarpPlatformDarwinLogFault(uint64_t a1, unsigned int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  vsnprintf(byte_100042650, 0x200uLL, a3, &a9);
  uint64_t v10 = sub_100012D90(a2);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
    sub_100024784(v10);
  }
}

uint64_t sub_100013410(uint64_t a1, void *a2, unsigned int a3)
{
  if (!a2) {
    return 30;
  }
  uint64_t v4 = uarpZalloc(a3);
  uint64_t result = 0;
  *a2 = v4;
  return result;
}

void sub_100013454(int a1, void *a2)
{
  if (a2) {
    uarpFree(a2);
  }
}

uint64_t sub_100013464(void *a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t result = 30;
  if (a3)
  {
    if (a4)
    {
      size_t v8 = [a1 maxTxPayloadLength] + 36;
      *a4 = v8;
      uint64_t v9 = uarpZalloc(v8);
      uint64_t result = 0;
      *a3 = v9;
    }
  }
  return result;
}

void sub_1000134BC(int a1, int a2, void *a3)
{
  if (a3) {
    uarpFree(a3);
  }
}

uint64_t sub_1000134CC(void *a1, void *a2, uint64_t a3, unsigned int a4)
{
  id v7 = a1;
  id v8 = a2;
  id v9 = [objc_alloc((Class)NSData) initWithBytes:a3 length:a4];
  if ([v7 uarpSendMessage:v9 controller:v8 error:0])
  {
    uarpPlatformEndpointSendMessageComplete((uint64_t)[v7 uarpEndpoint], (uint64_t)objc_msgSend(v8, "uarpRemoteEndpoint"), a3);
    uint64_t v10 = 0;
  }
  else
  {
    uint64_t v10 = 11;
  }

  return v10;
}

uint64_t sub_100013588(void *a1, uint64_t a2)
{
  if ([a1 uarpTransferPause:a2 error:0]) {
    return 0;
  }
  else {
    return 11;
  }
}

uint64_t sub_1000135B4(void *a1, uint64_t a2)
{
  if ([a1 uarpTransferResume:a2 error:0]) {
    return 0;
  }
  else {
    return 11;
  }
}

id sub_1000135E0(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 uarpSuperBinaryOffered:a2 asset:a3 error:0];
}

id sub_1000135F0(void *a1, uint64_t a2, uint64_t a3)
{
  return [a1 uarpDynamicAssetOffered:a2 asset:a3 error:0];
}

uint64_t sub_100013600(void *a1, uint64_t a2, uint64_t a3)
{
  if ([a1 uarpApplyStagedAssets:a2 flags:a3 error:0]) {
    return 0;
  }
  else {
    return 11;
  }
}

uint64_t sub_100013630(void *a1, void *a2, unsigned int *a3)
{
  uint64_t v3 = 30;
  if (a2 && a3)
  {
    uint64_t v6 = [a1 manufacturerName];
    unint64_t v7 = *a3;
    if ((unint64_t)[v6 length] <= v7)
    {
      unsigned int v8 = [v6 length];
      *a3 = v8;
      if (v8) {
        memcpy(a2, [v6 UTF8String], *a3);
      }
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 39;
    }
  }
  return v3;
}

uint64_t sub_1000136C4(void *a1, void *a2, unsigned int *a3)
{
  uint64_t v3 = 30;
  if (a2 && a3)
  {
    uint64_t v6 = [a1 modelName];
    unint64_t v7 = *a3;
    if ((unint64_t)[v6 length] <= v7)
    {
      unsigned int v8 = [v6 length];
      *a3 = v8;
      if (v8) {
        memcpy(a2, [v6 UTF8String], *a3);
      }
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 39;
    }
  }
  return v3;
}

uint64_t sub_100013758(void *a1, void *a2, unsigned int *a3)
{
  uint64_t v3 = 30;
  if (a2 && a3)
  {
    uint64_t v6 = [a1 serialNumber];
    unint64_t v7 = *a3;
    if ((unint64_t)[v6 length] <= v7)
    {
      unsigned int v8 = [v6 length];
      *a3 = v8;
      if (v8)
      {
        id v9 = v6;
        uarpLogDebug(3u, "%s: Serial number %s", "VUARPQuerySerialNumber", (const char *)[v9 UTF8String]);
        memcpy(a2, [v9 UTF8String], *a3);
      }
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 39;
    }
  }
  return v3;
}

uint64_t sub_100013820(void *a1, void *a2, unsigned int *a3)
{
  uint64_t v3 = 30;
  if (a2 && a3)
  {
    uint64_t v6 = [a1 hardwareVersion];
    unint64_t v7 = *a3;
    if ((unint64_t)[v6 length] <= v7)
    {
      unsigned int v8 = [v6 length];
      *a3 = v8;
      if (v8) {
        memcpy(a2, [v6 UTF8String], *a3);
      }
      uint64_t v3 = 0;
    }
    else
    {
      uint64_t v3 = 39;
    }
  }
  return v3;
}

uint64_t sub_1000138B4(void *a1, uint64_t a2, _DWORD *a3)
{
  if (!a3) {
    return 30;
  }
  uint64_t v4 = [a1 fwActiveVersion];
  *a3 = [v4 majorVersion];
  a3[1] = [v4 minorVersion];
  a3[2] = [v4 releaseVersion];
  a3[3] = [v4 buildVersion];

  return 0;
}

uint64_t sub_100013924(void *a1, uint64_t a2, _DWORD *a3)
{
  if (!a3) {
    return 30;
  }
  uint64_t v4 = [a1 fwStagedVersion];
  *a3 = [v4 majorVersion];
  a3[1] = [v4 minorVersion];
  a3[2] = [v4 releaseVersion];
  a3[3] = [v4 buildVersion];

  return 0;
}

uint64_t sub_100013994(void *a1, _DWORD *a2)
{
  if (!a2) {
    return 30;
  }
  uint64_t v5 = 0;
  if (![a1 uarpLastError:(char *)&v5 + 4 lastAction:&v5]) {
    return 27;
  }
  uint64_t result = 0;
  int v4 = HIDWORD(v5);
  *a2 = v5;
  a2[1] = v4;
  return result;
}

uint64_t sub_1000139F4(void *a1, uint64_t a2, uint64_t a3)
{
  if ([a1 uarpAssetSolicited:a2 tag:a3 error:0]) {
    return 0;
  }
  else {
    return 45;
  }
}

id sub_100013A24(void *a1, uint64_t a2)
{
  return [a1 uarpRescindAllAssets:a2 error:0];
}

uint64_t sub_100013A30(void *a1, uint64_t a2, void *a3, unsigned int a4, unsigned int *a5)
{
  uint64_t v5 = 30;
  if (a3 && a5)
  {
    id v9 = [a1 appleModelNumber];
    if ((unint64_t)[v9 length] <= a4)
    {
      unsigned int v10 = [v9 length];
      *a5 = v10;
      if (v10) {
        memcpy(a3, [v9 UTF8String], *a5);
      }
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 39;
    }
  }
  return v5;
}

uint64_t sub_100013ACC(void *a1, uint64_t a2, void *a3, unsigned int a4, unsigned int *a5)
{
  uint64_t v5 = 30;
  if (a3 && a5)
  {
    id v9 = [a1 hwFusingType];
    if ((unint64_t)[v9 length] <= a4)
    {
      unsigned int v10 = [v9 length];
      *a5 = v10;
      if (v10) {
        memcpy(a3, [v9 UTF8String], *a5);
      }
      uint64_t v5 = 0;
    }
    else
    {
      uint64_t v5 = 39;
    }
  }
  return v5;
}

id sub_100013D30(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeController];
}

uint64_t sub_100013E88(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void sub_100013E98(uint64_t a1)
{
}

void sub_100013EA0(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 1672));
  uint64_t v3 = a1 + 40;
  unsigned __int8 v4 = [WeakRetained vuarpSendMessage:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) error:0];

  if ((v4 & 1) == 0)
  {
    uint64_t v5 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      sub_100024970(v3, v5);
    }
  }
}

void sub_100014A40(uint64_t a1)
{
  int v2 = uarpPlatformEndpointRecvMessage(*(void *)(a1 + 32) + 24, (uint64_t)[*(id *)(*(void *)(a1 + 32) + 1640) uarpRemoteEndpoint], (unsigned __int16 *)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "bytes"), objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), "length"));
  if (v2)
  {
    int v3 = v2;
    unsigned __int8 v4 = *(NSObject **)(*(void *)(a1 + 32) + 8);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1000251B8(a1, v3, v4);
    }
  }
}

void sub_10001727C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void sub_100017298(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

uint64_t AUSandboxPlatformInitWithBundleIdentifier(void *a1)
{
  id v1 = a1;
  if (!v1)
  {
    id v1 = &_os_log_default;
    id v2 = &_os_log_default;
  }
  id v3 = v1;
  bzero(v7, 0x400uLL);
  id v4 = v3;
  if (_set_user_dir_suffix())
  {
    if (confstr(65537, v7, 0x400uLL))
    {
      uint64_t v5 = 0;
      goto LABEL_11;
    }
    if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR)) {
      sub_100026284();
    }
  }
  else if (os_log_type_enabled((os_log_t)v4, OS_LOG_TYPE_ERROR))
  {
    sub_100026304();
  }

  uint64_t v5 = 1;
LABEL_11:

  return v5;
}

void sub_1000173D8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_100017644(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100017660(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained bsdNotification];
}

uint64_t sub_100017714(uint64_t a1)
{
  uint64_t result = notify_cancel(*(_DWORD *)(*(void *)(a1 + 32) + 40));
  *(_DWORD *)(*(void *)(a1 + 32) + 40) = -1;
  return result;
}

id sub_1000177C0(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 48) bsdNotification:*(void *)(*(void *)(a1 + 32) + 16)];
}

uint64_t sleepMS(int a1)
{
  return usleep(1000 * a1);
}

uint64_t uarpPlatformEndpointInit2(char *a1, uint64_t a2, unsigned int a3, long long *a4, const void *a5, uint64_t a6)
{
  return uarpPlatformEndpointInit(a1, a2, a3, a4, a5, a6, 0);
}

uint64_t uarpPlatformEndpointInit(char *a1, uint64_t a2, unsigned int a3, long long *a4, const void *a5, uint64_t a6, uint64_t a7)
{
  uint64_t result = 30;
  if (a3 <= 2 && a2 && a1 && a4 && a5)
  {
    uarpZero(a1, 0x260uLL);
    memcpy(a1 + 48, a5, 0x1F0uLL);
    *((void *)a1 + 68) = a2;
    *((void *)a1 + 5) = a6;
    *((_DWORD *)a1 + 144) = 1;
    *((void *)a1 + 74) = a7;
    long long v16 = *a4;
    long long v15 = a4[1];
    *((_DWORD *)a1 + 8) = *((_DWORD *)a4 + 8);
    *(_OWORD *)a1 = v16;
    *((_OWORD *)a1 + 1) = v15;
    if (!*((_WORD *)a1 + 6)) {
      *((_WORD *)a1 + 6) = 4;
    }
    uint64_t result = 0;
    *((_DWORD *)a1 + 138) = a3;
    a1[580] = 0;
    *((_DWORD *)a1 + 146) = 1;
    *((_WORD *)a1 + 300) = 1;
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointAdd(uint64_t a1, uint64_t a2, long long *a3, uint64_t a4)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      if (a4)
      {
        *(void *)(a2 + 40) = a4;
        long long v7 = *(_OWORD *)a1;
        long long v8 = *(_OWORD *)(a1 + 16);
        *(_DWORD *)(a2 + 32) = *(_DWORD *)(a1 + 32);
        *(_OWORD *)a2 = v7;
        *(_OWORD *)(a2 + 16) = v8;
        if (!a3
          || (long long v10 = *a3,
              long long v9 = a3[1],
              *(_DWORD *)(a2 + 32) = *((_DWORD *)a3 + 8),
              *(_OWORD *)a2 = v10,
              *(_OWORD *)(a2 + 16) = v9,
              (unsigned int v11 = *(_DWORD *)(a2 + 4)) != 0)
          && *(_DWORD *)a2
          && *(_DWORD *)(a2 + 8) >= v11)
        {
          if (!*(_WORD *)(a2 + 12)) {
            *(_WORD *)(a2 + 12) = *(_WORD *)(a1 + 12);
          }
          *(_WORD *)(a2 + 48) = 0;
          int v12 = *(_DWORD *)(a1 + 584);
          *(_DWORD *)(a1 + 584) = v12 + 1;
          *(_DWORD *)(a2 + 52) = v12;
          *(unsigned char *)(a2 + 56) = 1;
          *(_DWORD *)(a2 + 58) = 1;
          if (!*(_WORD *)(a2 + 28)
            || (uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 80), 4 * *(unsigned __int16 *)(a2 + 28)), !result))
          {
            uint64_t result = uarpPlatformRemoteEndpointAddEntry(a1, a2);
            if (!result)
            {
              int v13 = *(unsigned __int16 *)(a2 + 20);
              if (!*(_WORD *)(a2 + 20))
              {
                int v13 = 1;
                *(_WORD *)(a2 + 20) = 1;
              }
              *(_WORD *)(a2 + 96) = v13;
              uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 104), 8 * v13);
              if (!result)
              {
                if (*(_WORD *)(a2 + 96))
                {
                  unint64_t v14 = 0;
                  do
                    *(void *)(*(void *)(a2 + 104) + 8 * v14++) = uarpAllocateTransmitBuffer2(a1, a2, 0);
                  while (v14 < *(unsigned __int16 *)(a2 + 96));
                }
                int v15 = *(unsigned __int16 *)(a2 + 20);
                *(_WORD *)(a2 + 112) = v15;
                return UARPLayer2RequestBuffer(a1, (void *)(a2 + 120), 8 * v15);
              }
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointRemove(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uarpTransmitQueuesCleanup(a1, a2);
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 1);
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if (v5)
    {
      uint64_t v6 = 0;
      uint64_t v7 = 8 * v5;
      do
      {
        uint64_t v8 = *(void *)(a1 + 560);
        if (*(void *)(v8 + v6) == a2) {
          *(void *)(v8 + v6) = 0;
        }
        v6 += 8;
      }
      while (v7 != v6);
    }
    UARPLayer2ReturnBuffer(a1, *(void **)(a2 + 80));
    uint64_t result = 0;
    *(void *)(a2 + 80) = 0;
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetIsAcceptable(void *a1, uint64_t a2, unsigned char *a3, __int16 *a4)
{
  uint64_t ActiveFirmwareVersion = 30;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        if (a4)
        {
          *a3 = 1;
          *a4 = 0;
          v16[0] = 0;
          v16[1] = 0;
          uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryActiveFirmwareVersion(a1, a2, v16);
          if (!ActiveFirmwareVersion)
          {
            int v9 = uarpVersionCompare(v16, (_DWORD *)(a2 + 52));
            if (v9 == 1)
            {
              v15[0] = 0;
              v15[1] = 0;
              uint64_t ActiveFirmwareVersion = uarpPlatformEndpointQueryStagedFirmwareVersion(a1, a2, v15);
              if (ActiveFirmwareVersion) {
                return ActiveFirmwareVersion;
              }
              int v10 = uarpVersionCompare(v15, (_DWORD *)(a2 + 52));
              if (v10 == 1) {
                return ActiveFirmwareVersion;
              }
              *a3 = 0;
              BOOL v11 = v10 == 0;
              __int16 v12 = 1280;
              __int16 v13 = 768;
            }
            else
            {
              uint64_t ActiveFirmwareVersion = 0;
              *a3 = 0;
              BOOL v11 = v9 == 0;
              __int16 v12 = 1536;
              __int16 v13 = 1024;
            }
            if (v11) {
              __int16 v12 = v13;
            }
            *a4 = v12;
          }
        }
      }
    }
  }
  return ActiveFirmwareVersion;
}

uint64_t uarpPlatformEndpointAssetAccept(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, 0, 0, 0, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7)
{
  return uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(a1, a2, a3, a4, a5, a6, a7, 0, 0);
}

uint64_t uarpPlatformEndpointAssetAcceptWithPayloadAndDecompressionWindows(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _OWORD *a5, uint64_t a6, unsigned int a7, uint64_t a8, unsigned int a9)
{
  uint64_t result = 30;
  if (a1 && a2 && a3 && (!a6 || a7 && *(_DWORD *)(a2 + 8) <= a7) && (!a8 || a9 && *(_DWORD *)(a2 + 8) <= a9))
  {
    uint64_t v15 = *(void *)(a1 + 568);
    if (v15)
    {
      uint64_t v16 = *(void *)(a1 + 568);
      while (v16 != a3 || *(_DWORD *)(v16 + 304))
      {
        uint64_t v16 = *(void *)(v16 + 712);
        if (!v16) {
          goto LABEL_15;
        }
      }
    }
    else
    {
LABEL_15:
      *(void *)(a3 + 712) = v15;
      *(void *)(a1 + 568) = a3;
    }
    if (a4) {
      *(void *)(a3 + 704) = a4;
    }
    *(_WORD *)(a3 + 72) = 0;
    if (!a5) {
      return 30;
    }
    long long v17 = a5[1];
    *(_OWORD *)(a3 + 80) = *a5;
    *(_OWORD *)(a3 + 96) = v17;
    long long v18 = a5[2];
    long long v19 = a5[3];
    long long v20 = a5[5];
    *(_OWORD *)(a3 + 144) = a5[4];
    *(_OWORD *)(a3 + 160) = v20;
    *(_OWORD *)(a3 + 112) = v18;
    *(_OWORD *)(a3 + 128) = v19;
    long long v21 = a5[6];
    long long v22 = a5[7];
    long long v23 = a5[9];
    *(_OWORD *)(a3 + 208) = a5[8];
    *(_OWORD *)(a3 + 224) = v23;
    *(_OWORD *)(a3 + 176) = v21;
    *(_OWORD *)(a3 + 192) = v22;
    long long v24 = a5[10];
    long long v25 = a5[11];
    long long v26 = a5[13];
    *(_OWORD *)(a3 + 272) = a5[12];
    *(_OWORD *)(a3 + 288) = v26;
    *(_OWORD *)(a3 + 240) = v24;
    *(_OWORD *)(a3 + 256) = v25;
    if (a6)
    {
      if (!*(unsigned char *)(a3 + 652)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 640));
      }
      *(void *)(a3 + 640) = a6;
      *(_DWORD *)(a3 + 648) = a7;
      *(unsigned char *)(a3 + 652) = 1;
    }
    else if (!*(void *)(a3 + 640))
    {
      v29 = (void *)(a3 + 640);
      *(unsigned char *)(a3 + 652) = 0;
      unsigned int v30 = *(_DWORD *)(a2 + 8);
      *(_DWORD *)(a3 + 648) = v30;
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a3 + 640), v30);
      if (result) {
        return result;
      }
      if (!*v29) {
        return 11;
      }
    }
    if (a8)
    {
      if (!*(unsigned char *)(a3 + 668)) {
        UARPLayer2ReturnBuffer(a1, *(void **)(a3 + 656));
      }
      *(void *)(a3 + 656) = a8;
      *(_DWORD *)(a3 + 664) = a9;
      char v27 = 1;
    }
    else
    {
      char v27 = 0;
    }
    *(unsigned char *)(a3 + 668) = v27;
    if (uarpVersionCompare((_DWORD *)(a3 + 52), (_DWORD *)(a3 + 12))
      || *(_DWORD *)(a3 + 68) != *(_DWORD *)(a3 + 8))
    {
      return uarpPlatformAssetSuperBinaryPullHeader(a1, a3);
    }
    else if (*(_DWORD *)(a3 + 688) == *(_DWORD *)(a3 + 32))
    {
      int v28 = *(_DWORD *)(a3 + 452);
      if (v28 == -1)
      {
        UARPLayer2AssetMetaDataComplete(a1, a3);
        return 0;
      }
      else if (v28 == *(_DWORD *)(a3 + 456))
      {
        if (*(_DWORD *)(a3 + 512) == *(_DWORD *)(a3 + 492))
        {
          if (*(_DWORD *)(a3 + 508) || (uint64_t result = uarpPlatformAssetPayloadPullData(a1, a3), !result))
          {
            return uarpPlatformAssetRequestData(a1, a3, a3 + 312);
          }
        }
        else
        {
          return uarpPlatformAssetPayloadPullMetaData(a1, a3);
        }
      }
      else
      {
        return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(a1, a3);
      }
    }
    else
    {
      return uarpPlatformAssetSuperBinaryPullMetaData(a1, a3);
    }
  }
  return result;
}

__n128 uarpPlatformEndpointAssetSetCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      long long v3 = *(_OWORD *)(a3 + 16);
      *(_OWORD *)(a2 + 80) = *(_OWORD *)a3;
      *(_OWORD *)(a2 + 96) = v3;
      long long v4 = *(_OWORD *)(a3 + 32);
      long long v5 = *(_OWORD *)(a3 + 48);
      long long v6 = *(_OWORD *)(a3 + 80);
      *(_OWORD *)(a2 + 144) = *(_OWORD *)(a3 + 64);
      *(_OWORD *)(a2 + 160) = v6;
      *(_OWORD *)(a2 + 112) = v4;
      *(_OWORD *)(a2 + 128) = v5;
      long long v7 = *(_OWORD *)(a3 + 96);
      long long v8 = *(_OWORD *)(a3 + 112);
      long long v9 = *(_OWORD *)(a3 + 144);
      *(_OWORD *)(a2 + 208) = *(_OWORD *)(a3 + 128);
      *(_OWORD *)(a2 + 224) = v9;
      *(_OWORD *)(a2 + 176) = v7;
      *(_OWORD *)(a2 + 192) = v8;
      __n128 result = *(__n128 *)(a3 + 160);
      long long v11 = *(_OWORD *)(a3 + 176);
      long long v12 = *(_OWORD *)(a3 + 208);
      *(_OWORD *)(a2 + 272) = *(_OWORD *)(a3 + 192);
      *(_OWORD *)(a2 + 288) = v12;
      *(__n128 *)(a2 + 240) = result;
      *(_OWORD *)(a2 + 256) = v11;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetDeny(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, _OWORD *a6)
{
  uint64_t v6 = 30;
  if (a1 && a2 && a3)
  {
    if (a5) {
      *(void *)(a3 + 704) = a5;
    }
    if (a6)
    {
      long long v8 = a6[1];
      *(_OWORD *)(a3 + 80) = *a6;
      *(_OWORD *)(a3 + 96) = v8;
      long long v9 = a6[2];
      long long v10 = a6[3];
      long long v11 = a6[5];
      *(_OWORD *)(a3 + 144) = a6[4];
      *(_OWORD *)(a3 + 160) = v11;
      *(_OWORD *)(a3 + 112) = v9;
      *(_OWORD *)(a3 + 128) = v10;
      long long v12 = a6[6];
      long long v13 = a6[7];
      long long v14 = a6[9];
      *(_OWORD *)(a3 + 208) = a6[8];
      *(_OWORD *)(a3 + 224) = v14;
      *(_OWORD *)(a3 + 176) = v12;
      *(_OWORD *)(a3 + 192) = v13;
      long long v15 = a6[10];
      long long v16 = a6[11];
      long long v17 = a6[13];
      *(_OWORD *)(a3 + 272) = a6[12];
      *(_OWORD *)(a3 + 288) = v17;
      *(_OWORD *)(a3 + 240) = v15;
      *(_OWORD *)(a3 + 256) = v16;
      uint64_t v6 = uarpAssetProcessingComplete(a1, a2, a3, a4 | 2u);
      if (!v6) {
        *(unsigned char *)(a3 + 72) = 1;
      }
    }
    else
    {
      return 30;
    }
  }
  return v6;
}

uint64_t uarpPlatformEndpointAssetAbandon(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, a2, a3, 3u, a4, 1);
}

uint64_t uarpPlatformEndpointAssetCorrupt(uint64_t a1, uint64_t a2)
{
  return uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, *(void *)(a3 + 704));
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0, v4, 1u, 0, 1);
}

uint64_t uarpPlatformEndpointAssetRelease2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4 = uarpPlatformAssetFindByAssetContext(a1, a3);
  return uarpPlatformAssetProcessingCompleteInternal(a1, 0, v4, 1u, 0, 1);
}

uint64_t uarpPlatformAssetFindByAssetContext(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    if (v4)
    {
      uint64_t result = v4;
      while (*(_DWORD *)(result + 304) != 1 || *(void *)(result + 704) != a2)
      {
        uint64_t result = *(void *)(result + 712);
        if (!result)
        {
          while (v4)
          {
            if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 704) == a2) {
              return v4;
            }
            uint64_t v4 = *(void *)(v4 + 712);
          }
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryNumberOfPayloads(uint64_t a1, uint64_t a2, _WORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 448);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryFormatVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *a2;
    }
  }
  return result;
}

__n128 uarpPlatformEndpointAssetQueryAssetVersion(uint64_t a1, uint64_t a2, __n128 *a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      __n128 result = *(__n128 *)(a2 + 12);
      *a3 = result;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 68);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetQueryTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 48);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 448) > a3)
    {
      *(_DWORD *)(a2 + 456) = a3;
      *(void *)(a2 + 508) = 0;
      return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(a1, a2);
    }
    return 44;
  }
  return v3;
}

uint64_t uarpPlatformEndpointAssetSetPayloadIndex2(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3 = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 448) > a3)
    {
      *(_DWORD *)(a2 + 456) = a3;
      *(void *)(a2 + 508) = 0;
      return uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(a1, a2);
    }
    return 44;
  }
  return v3;
}

uint64_t uarpPlatformEndpointAssetPayloadVersion(uint64_t a1, uint64_t a2, _OWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32;
    }
    else
    {
      uint64_t result = 0;
      *a3 = *(_OWORD *)(a2 + 472);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetPayloadTag(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2 && a3)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 32;
    }
    else
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 468);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetSetPayloadOffset(uint64_t a1, uint64_t a2, unsigned int a3)
{
  if (!a2) {
    return 30;
  }
  if (*(_DWORD *)(a2 + 452) == -1) {
    return 44;
  }
  if (*(_DWORD *)(a2 + 500) <= a3) {
    return 43;
  }
  if (*(unsigned char *)(a2 + 392) == 1) {
    return 16;
  }
  uint64_t result = 0;
  *(_DWORD *)(a2 + 508) = a3;
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestData(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30;
  if (!a1 || !a2) {
    return v2;
  }
  unsigned int v3 = *(_DWORD *)(a2 + 500);
  if (v3) {
    v3 -= *(_DWORD *)(a2 + 508);
  }
  if (v3 >= *(_DWORD *)(a2 + 648)) {
    unsigned int v3 = *(_DWORD *)(a2 + 648);
  }
  if (!v3)
  {
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
    return 0;
  }
  return uarpPlatformAssetPayloadPullData(a1, a2);
}

uint64_t uarpPlatformEndpointPayloadRequestDataPause(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *(unsigned char *)(a2 + 73) = 1;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPayloadRequestDataResume(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = 30;
  if (!a1) {
    return v2;
  }
  if (!a2) {
    return v2;
  }
  uint64_t v2 = *(unsigned __int8 *)(a2 + 73);
  if (!*(unsigned char *)(a2 + 73)) {
    return v2;
  }
  *(unsigned char *)(a2 + 73) = 0;
  uint64_t v2 = *(void *)(a2 + 696);
  if (!v2) {
    return v2;
  }
  if (*(unsigned char *)(a2 + 392) == 1) {
    return 0;
  }
  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t uarpPlatformEndpointAssetFullyStaged(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetProcessingComplete(a1, *(void *)(a2 + 696), a2, 1u);
  }
  else {
    return 30;
  }
}

double uarpPlatformEndpointSuperBinaryMerge(uint64_t a1, long long *a2, uint64_t a3)
{
  if (a1 && a2)
  {
    if (a3)
    {
      long long v3 = *a2;
      long long v4 = a2[1];
      *(_OWORD *)(a3 + 28) = *(long long *)((char *)a2 + 28);
      *(_OWORD *)a3 = v3;
      *(_OWORD *)(a3 + 16) = v4;
      *((unsigned char *)a2 + 72) = 1;
      *(unsigned char *)(a3 + 72) = 0;
      *(unsigned char *)(a3 + 73) = *((unsigned char *)a2 + 73);
      *((unsigned char *)a2 + 392) = 0;
      long long v6 = *(long long *)((char *)a2 + 360);
      long long v5 = *(long long *)((char *)a2 + 376);
      long long v7 = *(long long *)((char *)a2 + 344);
      *(_OWORD *)(a3 + 328) = *(long long *)((char *)a2 + 328);
      *(_OWORD *)(a3 + 344) = v7;
      *(_OWORD *)(a3 + 360) = v6;
      *(_OWORD *)(a3 + 376) = v5;
      *(_OWORD *)(a3 + 312) = *(long long *)((char *)a2 + 312);
      long long v8 = *(long long *)((char *)a2 + 392);
      long long v9 = *(long long *)((char *)a2 + 408);
      long long v10 = *(long long *)((char *)a2 + 424);
      *(void *)(a3 + 440) = *((void *)a2 + 55);
      *(_OWORD *)(a3 + 408) = v9;
      *(_OWORD *)(a3 + 424) = v10;
      *(_OWORD *)(a3 + 392) = v8;
      *(_DWORD *)(a3 + 452) = *((_DWORD *)a2 + 113);
      *(_DWORD *)(a3 + 456) = *((_DWORD *)a2 + 114);
      long long v11 = a2[29];
      long long v12 = a2[31];
      *(_OWORD *)(a3 + 480) = a2[30];
      *(_OWORD *)(a3 + 496) = v12;
      *(_OWORD *)(a3 + 464) = v11;
      long long v13 = a2[32];
      long long v14 = a2[33];
      long long v15 = a2[35];
      *(_OWORD *)(a3 + 544) = a2[34];
      *(_OWORD *)(a3 + 560) = v15;
      *(_OWORD *)(a3 + 512) = v13;
      *(_OWORD *)(a3 + 528) = v14;
      long long v16 = a2[36];
      long long v17 = a2[37];
      long long v18 = a2[38];
      *(void *)(a3 + 624) = *((void *)a2 + 78);
      *(_OWORD *)(a3 + 592) = v17;
      *(_OWORD *)(a3 + 608) = v18;
      *(_OWORD *)(a3 + 576) = v16;
      *((void *)a2 + 78) = 0;
      double result = 0.0;
      a2[37] = 0u;
      a2[38] = 0u;
      a2[35] = 0u;
      a2[36] = 0u;
      a2[33] = 0u;
      a2[34] = 0u;
      a2[31] = 0u;
      a2[32] = 0u;
      a2[29] = 0u;
      a2[30] = 0u;
      *(void *)(a3 + 640) = *((void *)a2 + 80);
      *((void *)a2 + 80) = 0;
      *(unsigned char *)(a3 + 652) = *((unsigned char *)a2 + 652);
      *(_DWORD *)(a3 + 648) = *((_DWORD *)a2 + 162);
      *((_DWORD *)a2 + 162) = 0;
      *(_DWORD *)(a3 + 688) = *((_DWORD *)a2 + 172);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointSendMessageComplete(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = uarpPlatformEndpointSendMessageCompleteInternal(a1, a2, a3);
  if (!*(unsigned char *)(a1 + 580))
  {
    return uarpTransmitQueueService(a1, a2);
  }
  return result;
}

void uarpPlatformEndpointCleanupAssets(uint64_t a1)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, 0, 0);
  }
}

void uarpPlatformEndpointCleanupAssets2(uint64_t a1, uint64_t a2)
{
  if (a1) {
    uarpPlatformCleanupAssetsForRemoteEndpoint(a1, a2, 0);
  }
}

void uarpPlatformEndpointPrepareDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSolicitedDynamicAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5)
{
}

void uarpPlatformEndpointPrepareSuperBinary(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
}

uint64_t uarpPlatformEndpointOfferAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v6 = *(void *)(a1 + 568);
        if (v6)
        {
          while (*(_DWORD *)(v6 + 304) != 1 || *(void *)(v6 + 704) != a3)
          {
            uint64_t v6 = *(void *)(v6 + 712);
            if (!v6) {
              return 30;
            }
          }
          memset(__dst, 0, 44);
          unsigned __int16 v7 = 0;
          uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v6, __dst, 44, 0, &v7);
          if (!result)
          {
            uarpSuperBinaryHeaderEndianSwap((unsigned int *)__dst, (_DWORD *)v6);
            *(_OWORD *)(v6 + 52) = *(_OWORD *)(v6 + 12);
            *(_DWORD *)(v6 + 68) = *(_DWORD *)(v6 + 8);
            *(_DWORD *)(v6 + 448) = *(unsigned __int16 *)(v6 + 40) / 0x28u;
            uint64_t result = uarpPlatformAssetApproveOfferVersion(a2, v6);
            if (!result) {
              return uarpOfferAssetToRemoteEP(a1, a2, v6);
            }
          }
        }
      }
    }
  }
  return result;
}

uint64_t uarpPlatformAssetFindByAssetContextAndList(uint64_t result, uint64_t a2, int a3)
{
  if (result)
  {
    for (uint64_t result = *(void *)(result + 568); result; uint64_t result = *(void *)(result + 712))
    {
      if (*(_DWORD *)(result + 304) == a3 && *(void *)(result + 704) == a2) {
        break;
      }
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointAssetGetBytesAtOffset(uint64_t a1, uint64_t a2, uint64_t a3, void *__dst, uint64_t a5, uint64_t a6, unsigned __int16 *a7)
{
  uint64_t result = 30;
  if (a1 && a3 && __dst && a5)
  {
    __int16 v15 = *(_WORD *)(a3 + 46);
    if ((v15 & 0x80) != 0)
    {
      uint64_t result = UARPSuperBinaryGetInternalSuperBinaryMetaData(a1, a3, __dst, a5, a6, a7);
      if (result != 40) {
        return result;
      }
      __int16 v15 = *(_WORD *)(a3 + 46);
    }
    if ((v15 & 8) == 0
      || (uint64_t result = UARPSuperBinaryGetInternalPayloadMetaData(a1, a3, __dst, a5, a6, a7), result == 40))
    {
      return UARPLayer2AssetGetBytesAtOffset2(a1, a2, (void *)a3, (uint64_t)__dst, a5, a6, (uint64_t)a7);
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointRemoveAssetPayloadWindow(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4)
{
  uint64_t result = 30;
  if (a3)
  {
    if (a4)
    {
      uint64_t result = 0;
      *a3 = *(void *)(a2 + 640);
      *(void *)(a2 + 640) = 0;
      *a4 = *(_DWORD *)(a2 + 648);
      *(_DWORD *)(a2 + 648) = 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointProvideAssetPayloadWindow(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  uint64_t result = 30;
  if (a3 && a4)
  {
    long long v9 = *(void **)(a2 + 640);
    if (v9)
    {
      if (!*(unsigned char *)(a2 + 652)) {
        UARPLayer2ReturnBuffer(a1, v9);
      }
    }
    uint64_t result = 0;
    *(void *)(a2 + 640) = a3;
    *(_DWORD *)(a2 + 648) = a4;
    *(unsigned char *)(a2 + 652) = 1;
  }
  return result;
}

uint64_t uarpPlatformEndpointDynamicAssetSolicitationDeny(uint64_t a1, uint64_t a2, _DWORD *a3, int a4)
{
  if (a1 && a2 && a3) {
    return uarpSendDynamicAssetPreProcessingStatus(a1, a2, a3, 2u, a4);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointAssetSetBytesAtOffset(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a1 && a3 && a4 && a5) {
    return UARPLayer2AssetSetBytesAtOffset2(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointWatchDogExpired(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t result = 0;
    *(unsigned char *)(a2 + 50) = 0;
    if (!*(unsigned char *)(a1 + 580))
    {
      uarpTransmitQueueService(a1, a2);
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointRescindAsset(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a1) {
    return 30;
  }
  if (!a2) {
    return 30;
  }
  if (!a3) {
    return 30;
  }
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 30;
  }
  while (*(_DWORD *)(v3 + 304) != 1 || *(void *)(v3 + 704) != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 30;
    }
  }
  return uarpAssetRescind(a1, a2, *(unsigned __int16 *)(v3 + 44));
}

uint64_t uarpPlatformEndpointRescindAllAssets(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpAssetRescind(a1, a2, 0xFFFFu);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    long long v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xAu, 6u, 1);
    if (v5)
    {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpPlatformEndpointPauseAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationPause(a1, a2);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointResumeAssetTransfers(uint64_t a1, uint64_t a2)
{
  if (a1 && a2) {
    return uarpSendDataTransferNotificationResume(a1, a2);
  }
  else {
    return 30;
  }
}

uint64_t uarpPlatformEndpointSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3, uint64_t a4)
{
  if (!a1) {
    return 30;
  }
  if (!a2) {
    return 30;
  }
  if (!a4) {
    return 30;
  }
  uint64_t v4 = *(void *)(a1 + 568);
  if (!v4) {
    return 30;
  }
  while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 704) != a4)
  {
    uint64_t v4 = *(void *)(v4 + 712);
    if (!v4) {
      return 30;
    }
  }
  return uarpSolicitDynamicAsset(a1, a2, a3);
}

uint64_t uarpPlatformEndpointSendVendorSpecific(uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (a1 && a2 && a3 && a5) {
    return uarpSendVendorSpecific(a1, a2, a3, a4, a5, a6);
  }
  else {
    return 30;
  }
}

uint64_t uarpRemoteEndpointID(uint64_t a1)
{
  if (a1) {
    return *(unsigned int *)(a1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpRemoteEndpointIDForAsset(uint64_t a1)
{
  if (a1 && (uint64_t v1 = *(void *)(a1 + 696)) != 0) {
    return *(unsigned int *)(v1 + 52);
  }
  else {
    return 0xFFFFFFFFLL;
  }
}

uint64_t uarpPlatformRemoteDelegateForAssetDelegate(uint64_t result)
{
  if (result)
  {
    uint64_t v1 = *(void *)(result + 696);
    if (v1) {
      return *(void *)(v1 + 40);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetSelectedPayloadInfo(uint64_t a1, char *a2)
{
  uint64_t result = 23;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a1 + 452) == -1)
    {
      return 44;
    }
    else
    {
      uarpZero(a2, 0x20uLL);
      uint64_t result = 0;
      *(_DWORD *)a2 = *(_DWORD *)(a1 + 468);
      *(_OWORD *)(a2 + 4) = *(_OWORD *)(a1 + 472);
      int v5 = *(_DWORD *)(a1 + 500);
      *((_DWORD *)a2 + 5) = *(_DWORD *)(a1 + 492);
      *((_DWORD *)a2 + 6) = v5;
    }
  }
  return result;
}

uint64_t uarpAssetQuerySuperBinaryMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 460)) {
      return *(void *)(a2 + 720);
    }
    else {
      return 0;
    }
  }
  return result;
}

uint64_t uarpAssetQueryPayloadMetaData(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 460) && (uint64_t v5 = *(void *)(a2 + 632)) != 0)
    {
      while (*(_DWORD *)(v5 + 124) != a3)
      {
        uint64_t v5 = *(void *)(v5 + 176);
        if (!v5) {
          return 0;
        }
      }
      return *(void *)(v5 + 168);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpAssetQueryPayloadInfo(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a4)
    {
      if (*(unsigned char *)(a2 + 460))
      {
        return 54;
      }
      else if (*(_DWORD *)(a2 + 452) == a3)
      {
        uint64_t result = 0;
        *(_DWORD *)a4 = *(_DWORD *)(a2 + 468);
        *(_OWORD *)(a4 + 4) = *(_OWORD *)(a2 + 472);
        int v6 = *(_DWORD *)(a2 + 500);
        *(_DWORD *)(a4 + 20) = *(_DWORD *)(a2 + 492);
        *(_DWORD *)(a4 + 24) = v6;
        *(_DWORD *)(a4 + 28) = *(_DWORD *)(a2 + 592);
      }
      else
      {
        return 44;
      }
    }
    else
    {
      return 26;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetQueryAssetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_WORD *)(a1 + 44);
    }
  }
  return result;
}

__n128 uarpPlatformAssetQueryAssetVersion(uint64_t a1, __n128 *a2)
{
  if (a1)
  {
    if (a2)
    {
      __n128 result = *(__n128 *)(a1 + 52);
      *a2 = result;
    }
  }
  return result;
}

uint64_t uarpPlatformSetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, int a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = a3;
    }
  }
  return result;
}

uint64_t uarpPlatformGetMaxTxPayloadLength(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *a2;
    }
  }
  return result;
}

uint64_t uarpPlatformSetMaxRxPayloadLength(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *(_DWORD *)(a2 + 4) = a3;
    }
  }
  return result;
}

uint64_t uarpPlatformGetMaxRxPayloadLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (a3)
    {
      uint64_t result = 0;
      *a3 = *(_DWORD *)(a2 + 4);
    }
  }
  return result;
}

char *uarpAssetTagAnalytics4cc()
{
  uint64_t result = aTics;
  aTics[4] = 0;
  return result;
}

uint64_t uarpAssetTagAnalytics()
{
  aTics[4] = 0;
  return uarpPayloadTagPack((unsigned int *)aTics);
}

int *uarpAssetTagStructAnalytics()
{
  aTics[4] = 0;
  uint64_t result = &dword_100042898;
  dword_100042898 = *(_DWORD *)aTics;
  return result;
}

__int16 *uarpOuiAnalytics()
{
  uint64_t result = &word_10004289C;
  word_10004289C = 27480;
  byte_10004289E = 20;
  return result;
}

uint64_t uarpAnalyticsAssetInitialize(uint64_t a1, uint64_t a2)
{
  long long v3 = 0uLL;
  return UARPSuperBinarySetupHeader(a1, a2, 2u, &v3, 1);
}

char *uarpAssetTagLogs4cc()
{
  uint64_t result = aLogs_0;
  aLogs_0[4] = 0;
  return result;
}

uint64_t uarpAssetTagLogs()
{
  aLogs_0[4] = 0;
  return uarpPayloadTagPack((unsigned int *)aLogs_0);
}

int *uarpAssetTagStructLogs()
{
  aLogs_0[4] = 0;
  uint64_t result = &dword_1000428A0;
  dword_1000428A0 = *(_DWORD *)aLogs_0;
  return result;
}

__int16 *uarpOuiLogs()
{
  uint64_t result = &word_1000428A4;
  word_1000428A4 = 16400;
  byte_1000428A6 = -13;
  return result;
}

uint64_t uarpPlatformAssetProcessingCompleteInternal(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6)
{
  uint64_t result = 30;
  if (a1 && a3)
  {
    if (uarpPlatformAssetIsKnown(a1, a2, a3))
    {
      *(unsigned char *)(a3 + 392) = 0;
      *(unsigned char *)(a3 + 72) = 1;
      *(void *)(a3 + 696) = 0;
      if (!a2 || (uint64_t result = uarpAssetProcessingComplete(a1, a2, a3, a5 | a4), !result))
      {
        uint64_t result = 0;
        if (a4 == 4 && !a6)
        {
          UARPLayer2AssetCorrupt(a1, a3);
          return 0;
        }
      }
    }
    else
    {
      return 23;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetRequestData(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (!a2) {
    return 30;
  }
  uint64_t v3 = *(void *)(a2 + 696);
  if (!v3) {
    return 30;
  }
  if (*(unsigned char *)(a3 + 80) == 1) {
    return 16;
  }
  if (*(unsigned char *)(a2 + 73) == 1 || !*(unsigned char *)(v3 + 56)) {
    return 31;
  }
  int v6 = *(_DWORD *)(a3 + 8);
  int v7 = *(_DWORD *)(a3 + 84);
  unsigned int v8 = v7 + v6 + *(_DWORD *)a3;
  unsigned int v9 = *(_DWORD *)(a3 + 4) - (v7 + v6);
  if (v9 >= *(_DWORD *)(a3 + 24) - v7) {
    unsigned int v9 = *(_DWORD *)(a3 + 24) - v7;
  }
  *(_DWORD *)(a3 + 92) = v8;
  *(_DWORD *)(a3 + 96) = v9;
  if (v9 >= *(_DWORD *)(*(void *)(a2 + 696) + 4)) {
    unsigned int v10 = *(_DWORD *)(*(void *)(a2 + 696) + 4);
  }
  else {
    unsigned int v10 = v9;
  }
  *(_DWORD *)(a3 + 96) = v10;
  uint64_t result = uarpSendAssetRequestData(a1, *(void *)(a2 + 696), *(unsigned __int16 *)(a2 + 44), v8, v10);
  if (!result) {
    *(unsigned char *)(a3 + 80) = 1;
  }
  return result;
}

uint64_t uarpPlatformAssetResponseData(uint64_t a1, uint64_t a2, uint64_t a3, void *__src, int a5, int a6, size_t __n)
{
  if (!*(unsigned char *)(a2 + 392)) {
    return 29;
  }
  uint64_t v7 = a3;
  if (a3)
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return v7;
  }
  if (*(_DWORD *)(a2 + 404) != a5) {
    return 29;
  }
  if (*(_DWORD *)(a2 + 408) != a6) {
    return 29;
  }
  uint64_t v10 = *(unsigned int *)(a2 + 396);
  if ((v10 + __n) > *(_DWORD *)(a2 + 336)) {
    return 29;
  }
  *(unsigned char *)(a2 + 392) = 0;
  *(_DWORD *)(a2 + 412) = __n;
  memcpy((void *)(*(void *)(a2 + 328) + v10), __src, __n);
  int v12 = *(_DWORD *)(a2 + 396) + *(_DWORD *)(a2 + 412);
  *(_DWORD *)(a2 + 396) = v12;
  int v13 = *(_DWORD *)(a2 + 320) + v12;
  int v14 = *(_DWORD *)(a2 + 316);
  if (v12 == *(_DWORD *)(a2 + 336) || v13 == v14)
  {
    uint64_t v7 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 376))(a1, a2, a2 + 312);
    if (v7) {
      return v7;
    }
    int v15 = *(_DWORD *)(a2 + 396);
    uint64_t v16 = *(unsigned int *)(a2 + 400);
    int v17 = v15 - v16;
    if (v15 != v16)
    {
      memcpy(*(void **)(a2 + 328), (const void *)(*(void *)(a2 + 328) + v16), (v15 - v16));
      int v15 = *(_DWORD *)(a2 + 400);
    }
    *(_DWORD *)(a2 + 396) = v17;
    *(_DWORD *)(a2 + 320) += v15;
    *(_DWORD *)(a2 + 400) = 0;
  }
  if (v13 == v14)
  {
    long long v18 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(a2 + 384);
    return v18(a1, a2, a2 + 312);
  }
  else
  {
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
  }
}

uint64_t uarpPlatformAssetUpdateMetaData(uint64_t a1, uint64_t a2, uint64_t a3, void (*a4)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))
{
  unsigned int v4 = *(_DWORD *)(a3 + 84);
  if (v4 < 8) {
    return 0;
  }
  unsigned int v9 = *(unsigned int **)(a3 + 16);
  while (1)
  {
    uint64_t v10 = uarpNtohl(*v9);
    uint64_t v11 = uarpNtohl(v9[1]);
    if (v11 > *(_DWORD *)(a3 + 24) - 8) {
      break;
    }
    unsigned int v12 = v11;
    unsigned int v13 = v4 - 8;
    unsigned int v4 = v4 - 8 - v11;
    if (v13 >= v11)
    {
      int v14 = v9 + 2;
      int v15 = *(_DWORD *)(a3 + 88) + 8;
      *(_DWORD *)(a3 + 88) = v15;
      if (a4)
      {
        a4(a1, a2, v10, v11, v14);
        int v15 = *(_DWORD *)(a3 + 88);
      }
      unsigned int v9 = (unsigned int *)((char *)v14 + v12);
      *(_DWORD *)(a3 + 88) = v15 + v12;
      if (v4 > 7) {
        continue;
      }
    }
    return 0;
  }
  return 53;
}

uint64_t uarpPlatformAssetSuperBinaryPullHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(void *)(a2 + 312) = 0x2C00000000;
      *(void *)(a2 + 328) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = sub_100019298;
      *(void *)(a2 + 384) = sub_1000193A4;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }
  return result;
}

uint64_t sub_100019298(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  int v6 = *(unsigned int **)(a3 + 16);
  *(_DWORD *)a2 = uarpNtohl(*v6);
  *(_DWORD *)(a2 + 4) = uarpNtohl(v6[1]);
  *(_DWORD *)(a2 + 8) = uarpNtohl(v6[2]);
  uarpVersionEndianSwap(v6 + 3, (_DWORD *)(a2 + 12));
  *(_DWORD *)(a2 + 28) = uarpNtohl(v6[7]);
  *(_DWORD *)(a2 + 32) = uarpNtohl(v6[8]);
  *(_DWORD *)(a2 + 36) = uarpNtohl(v6[9]);
  int v7 = uarpNtohl(v6[10]);
  *(_DWORD *)(a2 + 40) = v7;
  *(_DWORD *)(a3 + 88) = *(_DWORD *)(a3 + 84);
  unsigned int v8 = *(_DWORD *)(a2 + 68);
  if (*(_DWORD *)(a2 + 36) + v7 > v8
    || *(_DWORD *)(a2 + 32) + *(_DWORD *)(a2 + 28) > v8
    || *(_DWORD *)(a2 + 4) != 44
    || (uint64_t result = 0, *(_DWORD *)a2 >= 4u))
  {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
    return 47;
  }
  return result;
}

uint64_t sub_1000193A4(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetSuperBinaryPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 32))
    {
      *(_DWORD *)(a2 + 688) = 0;
      if (*(unsigned char *)(a2 + 392) == 1)
      {
        return 16;
      }
      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 28);
        *(void *)(a2 + 328) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = sub_100019490;
        *(void *)(a2 + 384) = sub_100019520;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }
    else
    {
      return 40;
    }
  }
  return result;
}

uint64_t sub_100019490(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  uint64_t updated = uarpPlatformAssetUpdateMetaData(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))UARPLayer2AssetMetaDataTLV);
  if (updated) {
    UARPLayer2AssetMetaDataProcessingError(a1, a2);
  }
  else {
    *(_DWORD *)(a2 + 688) += *(_DWORD *)(a3 + 88);
  }
  return updated;
}

uint64_t sub_100019520(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetSuperBinaryPullProposedPayloadHeader(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2 && *(_DWORD *)(a2 + 456) <= *(_DWORD *)(a2 + 448))
  {
    if (*(unsigned char *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uarpZero((void *)(a2 + 312), 0x88uLL);
      *(_DWORD *)(a2 + 312) = 40 * *(_DWORD *)(a2 + 456) + 44;
      *(_DWORD *)(a2 + 316) = 40;
      *(void *)(a2 + 328) = *(void *)(a2 + 640);
      *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
      *(void *)(a2 + 376) = sub_100019618;
      *(void *)(a2 + 384) = sub_10001969C;
      return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
    }
  }
  return result;
}

uint64_t sub_100019618(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  uint64_t v6 = uarpPlatformAssetPayloadHeaderProcess(*(unsigned int **)(a3 + 16), a2 + 464, *(_DWORD *)(a2 + 68));
  if (v6) {
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }
  else {
    *(_DWORD *)(a3 + 88) = *(_DWORD *)(a3 + 84);
  }
  return v6;
}

uint64_t sub_10001969C(uint64_t a1, uint64_t a2)
{
  *(_DWORD *)(a2 + 452) = *(_DWORD *)(a2 + 456);
  UARPLayer2PayloadReady(a1, a2);
  return 0;
}

uint64_t uarpPlatformAssetPayloadHeaderProcess(unsigned int *a1, uint64_t a2, unsigned int a3)
{
  *(_DWORD *)a2 = uarpNtohl(*a1);
  *(_DWORD *)(a2 + 4) = a1[1];
  uarpVersionEndianSwap(a1 + 2, (_DWORD *)(a2 + 8));
  *(_DWORD *)(a2 + 24) = uarpNtohl(a1[6]);
  *(_DWORD *)(a2 + 28) = uarpNtohl(a1[7]);
  *(_DWORD *)(a2 + 32) = uarpNtohl(a1[8]);
  int v6 = uarpNtohl(a1[9]);
  *(_DWORD *)(a2 + 36) = v6;
  *(unsigned char *)(a2 + 52) = 0;
  *(_DWORD *)(a2 + 56) = 0;
  *(_DWORD *)(a2 + 76) = 0;
  *(_DWORD *)(a2 + 128) = v6;
  uint64_t v7 = 48;
  if (*(_DWORD *)(a2 + 28) + *(_DWORD *)(a2 + 24) <= a3)
  {
    if (*(_DWORD *)(a2 + 32) + v6 <= a3) {
      return 0;
    }
    else {
      return 48;
    }
  }
  return v7;
}

uint64_t uarpPlatformAssetPayloadPullMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1)
    {
      return 44;
    }
    else if (*(_DWORD *)(a2 + 492))
    {
      *(_DWORD *)(a2 + 512) = 0;
      if (*(unsigned char *)(a2 + 392) == 1)
      {
        return 16;
      }
      else
      {
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 488);
        *(void *)(a2 + 328) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = sub_10001985C;
        *(void *)(a2 + 384) = sub_1000198EC;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
    }
    else
    {
      return 40;
    }
  }
  return result;
}

uint64_t sub_10001985C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2AssetStore(a1, a2);
  uint64_t updated = uarpPlatformAssetUpdateMetaData(a1, a2, a3, (void (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))UARPLayer2PayloadMetaDataTLV);
  if (updated) {
    UARPLayer2PayloadMetaDataProcessingError(a1, a2);
  }
  else {
    *(_DWORD *)(a2 + 512) += *(_DWORD *)(a3 + 88);
  }
  return updated;
}

uint64_t sub_1000198EC(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t uarpPlatformAssetPayloadPullData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(_DWORD *)(a2 + 452) == -1) {
      return 44;
    }
    unsigned int v5 = *(_DWORD *)(a2 + 508);
    if (v5 > *(_DWORD *)(a2 + 500) || *(_DWORD *)(a2 + 496) + v5 > *(_DWORD *)(a2 + 8)) {
      return 43;
    }
    if (*(unsigned char *)(a2 + 392) == 1) {
      return 16;
    }
    uarpZero((void *)(a2 + 312), 0x88uLL);
    int v6 = *(_DWORD *)(a2 + 508);
    *(_DWORD *)(a2 + 312) = v6 + *(_DWORD *)(a2 + 496);
    *(_DWORD *)(a2 + 316) = *(_DWORD *)(a2 + 500) - v6;
    *(void *)(a2 + 328) = *(void *)(a2 + 640);
    int v7 = *(_DWORD *)(a2 + 648);
    *(_DWORD *)(a2 + 336) = v7;
    *(_DWORD *)(a2 + 368) = v7;
    *(void *)(a2 + 376) = sub_100019ADC;
    *(void *)(a2 + 384) = sub_100019B68;
    if (*(unsigned char *)(a2 + 516) == 1)
    {
      *(unsigned char *)(a2 + 356) = 1;
      *(_DWORD *)(a2 + 336) = 10;
      *(void *)(a2 + 344) = *(void *)(a2 + 656);
      *(_DWORD *)(a2 + 352) = *(_DWORD *)(a2 + 664);
      *(void *)(a2 + 376) = sub_100019C30;
    }
    uint64_t v8 = *(unsigned int *)(a2 + 520);
    *(_DWORD *)(a2 + 416) = v8;
    UARPLayer2HashInfo(a1, v8, (_DWORD *)(a2 + 420), (_DWORD *)(a2 + 432));
    unsigned int v9 = *(_DWORD *)(a2 + 420);
    if (v9)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 424), v9);
      if (result) {
        return result;
      }
      if (!*(void *)(a2 + 424)) {
        return 11;
      }
    }
    unsigned int v10 = *(_DWORD *)(a2 + 432);
    if (v10)
    {
      uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 440), v10);
      if (result) {
        return result;
      }
      if (!*(void *)(a2 + 440)) {
        return 11;
      }
    }
    UARPLayer2HashInit(a1, *(unsigned int *)(a2 + 416), *(void *)(a2 + 424));
    return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
  }
  return result;
}

uint64_t sub_100019ADC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  UARPLayer2HashUpdate(a1, *(unsigned int *)(a3 + 104), *(void *)(a3 + 112), *(void *)(a3 + 16), *(unsigned int *)(a3 + 84));
  UARPLayer2PayloadData(a1, a2);
  int v6 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 88) = v6;
  *(_DWORD *)(a2 + 508) += v6;
  return 0;
}

uint64_t sub_100019B68(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5 = *(unsigned int *)(a2 + 520);
  if (!v5) {
    goto LABEL_7;
  }
  UARPLayer2HashFinal(a1, v5, *(void *)(a3 + 112), *(void *)(a3 + 128), *(unsigned int *)(a3 + 120));
  BOOL v7 = uarpPlatformCompareHash(a1, *(void **)(a3 + 128), *(unsigned int *)(a3 + 120), *(void **)(a2 + 528), *(_DWORD *)(a2 + 536));
  uint64_t v8 = *(void **)(a3 + 112);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a3 + 112) = 0;
    *(_DWORD *)(a3 + 108) = 0;
  }
  unsigned int v9 = *(void **)(a3 + 128);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a3 + 128) = 0;
    *(_DWORD *)(a3 + 120) = 0;
  }
  *(_DWORD *)(a3 + 104) = 0;
  if (!v7) {
    UARPLayer2AssetCorrupt(a1, a2);
  }
  else {
LABEL_7:
  }
    UARPLayer2PayloadDataComplete2(a1, (void *)a2);
  return 0;
}

uint64_t sub_100019C30(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uarpCompressionHeaderEndianSwap(*(unsigned __int16 **)(a3 + 16), a3 + 45);
  int v5 = *(_DWORD *)(a3 + 84);
  *(_DWORD *)(a3 + 88) = v5;
  *(_DWORD *)(a2 + 508) += v5;
  *(unsigned char *)(a3 + 44) = 0;
  unsigned int v6 = *(unsigned __int16 *)(a3 + 51);
  *(_DWORD *)(a3 + 24) = v6;
  if (*(_DWORD *)(a3 + 56) < v6 || *(_DWORD *)(a3 + 40) < *(unsigned __int16 *)(a3 + 53)) {
    return 51;
  }
  uint64_t result = 0;
  *(void *)(a3 + 64) = sub_10001A1B8;
  return result;
}

uint64_t uarpPlatformAssetPullAllPayloadHeaders(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    if (*(unsigned char *)(a2 + 392) == 1)
    {
      return 16;
    }
    else
    {
      uint64_t v7 = 0;
      if (*(int *)(a2 + 448) < 1)
      {
LABEL_9:
        uarpZero((void *)(a2 + 312), 0x88uLL);
        *(void *)(a2 + 312) = *(void *)(a2 + 36);
        *(void *)(a2 + 328) = *(void *)(a2 + 640);
        *(_DWORD *)(a2 + 336) = *(_DWORD *)(a2 + 648);
        *(void *)(a2 + 376) = sub_100019DAC;
        *(void *)(a2 + 384) = j__uarpPlatformAssetPullAllMetaData;
        return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
      }
      else
      {
        int v5 = 0;
        while (1)
        {
          uint64_t result = UARPLayer2RequestBuffer(a1, &v7, 0xB8u);
          if (result) {
            break;
          }
          uint64_t v6 = v7;
          *(void *)(v7 + 176) = *(void *)(a2 + 632);
          *(void *)(a2 + 632) = v6;
          if (++v5 >= *(_DWORD *)(a2 + 448)) {
            goto LABEL_9;
          }
        }
      }
    }
  }
  return result;
}

uint64_t sub_100019DAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  if (*(int *)(a2 + 448) < 1) {
    return 0;
  }
  uint64_t v6 = 0;
  uint64_t v7 = *(unsigned int **)(a3 + 16);
  uint64_t v8 = *(void *)(a2 + 632);
  while (1)
  {
    if (!v8) {
      return 11;
    }
    uint64_t v9 = uarpPlatformAssetPayloadHeaderProcess(v7, v8, *(_DWORD *)(a2 + 68));
    if (v9) {
      break;
    }
    *(_DWORD *)(v8 + 124) = v6;
    uint64_t v8 = *(void *)(v8 + 176);
    *(_DWORD *)(a3 + 88) += 40;
    ++v6;
    v7 += 10;
    if (v6 >= *(int *)(a2 + 448)) {
      return 0;
    }
  }
  uint64_t v10 = v9;
  uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  return v10;
}

_DWORD *uarpProcessTLV(uint64_t a1, unsigned int *a2)
{
  int v4 = uarpNtohl(*a2);
  unsigned int v5 = uarpNtohl(a2[1]);
  uint64_t v9 = 0;
  int v6 = UARPLayer2RequestBuffer(a1, &v9, v5 + 24);
  uint64_t v7 = 0;
  if (!v6)
  {
    uint64_t v7 = v9;
    *uint64_t v9 = v4;
    v7[1] = v5;
    memcpy(v7 + 6, a2 + 2, v5);
    *((void *)v7 + 1) = v7 + 6;
  }
  return v7;
}

uint64_t uarpPlatformAssetPullAllMetaData(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (!a1 || !a2) {
    return result;
  }
  if (*(unsigned char *)(a2 + 392) == 1) {
    return 16;
  }
  uarpZero((void *)(a2 + 312), 0x88uLL);
  int v6 = *(_DWORD *)(a2 + 28);
  unsigned int v5 = *(_DWORD *)(a2 + 32);
  *(_DWORD *)(a2 + 312) = v6;
  *(_DWORD *)(a2 + 316) = v5;
  for (uint64_t i = *(void *)(a2 + 632); i; uint64_t i = *(void *)(i + 176))
  {
    int v8 = *(_DWORD *)(i + 24);
    if (v8)
    {
      if (v8 != v5 + v6) {
        return 43;
      }
      v5 += *(_DWORD *)(i + 28);
      *(_DWORD *)(a2 + 316) = v5;
    }
  }
  *(_DWORD *)(a2 + 680) = v5;
  *(void *)(a2 + 672) = 0;
  if (!v5)
  {
    *(void *)(a2 + 328) = 0;
    *(_DWORD *)(a2 + 336) = 0;
    *(void *)(a2 + 376) = sub_10001A064;
    *(void *)(a2 + 384) = sub_10001A194;
LABEL_17:
    UARPLayer2AssetAllHeadersAndMetaDataComplete(a1, *(void *)(a2 + 696), a2);
    return 0;
  }
  uint64_t result = UARPLayer2RequestBuffer(a1, (void *)(a2 + 672), v5);
  if (result) {
    return result;
  }
  int v9 = *(_DWORD *)(a2 + 680);
  int v10 = *(_DWORD *)(a2 + 316);
  *(void *)(a2 + 328) = *(void *)(a2 + 672);
  *(_DWORD *)(a2 + 336) = v9;
  *(void *)(a2 + 376) = sub_10001A064;
  *(void *)(a2 + 384) = sub_10001A194;
  if (!v10) {
    goto LABEL_17;
  }
  return uarpPlatformAssetRequestData(a1, a2, a2 + 312);
}

uint64_t sub_10001A064(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(_DWORD *)(a2 + 32);
  int v4 = *(_DWORD *)(a3 + 88);
  if (*(_DWORD *)(a3 + 84) - v4 < v3) {
    return 18;
  }
  if (v3)
  {
    int v9 = *(unsigned int **)(a3 + 16);
    while (1)
    {
      int v10 = uarpProcessTLV(a1, v9);
      if (!v10) {
        return 10;
      }
      uint64_t v11 = (v10[1] + 8);
      int v9 = (unsigned int *)((char *)v9 + v11);
      *((void *)v10 + 2) = *(void *)(a2 + 720);
      *(void *)(a2 + 720) = v10;
      v3 -= v11;
      if (!v3)
      {
        int v12 = *(_DWORD *)(a2 + 32);
        int v4 = *(_DWORD *)(a3 + 88);
        goto LABEL_9;
      }
    }
  }
  else
  {
    int v12 = 0;
LABEL_9:
    unsigned int v13 = v4 + v12;
    *(_DWORD *)(a3 + 88) = v13;
    uint64_t v14 = *(void *)(a2 + 632);
    if (v14)
    {
      while (1)
      {
        unsigned int v15 = *(_DWORD *)(v14 + 28);
        if (*(_DWORD *)(a3 + 84) - v13 < v15) {
          return 18;
        }
        if (v15)
        {
          uint64_t v16 = (unsigned int *)(*(void *)(a3 + 16) + v13);
          while (1)
          {
            int v17 = uarpProcessTLV(a1, v16);
            if (!v17) {
              return 10;
            }
            uint64_t v18 = (v17[1] + 8);
            uint64_t v16 = (unsigned int *)((char *)v16 + v18);
            *((void *)v17 + 2) = *(void *)(v14 + 168);
            *(void *)(v14 + 168) = v17;
            v15 -= v18;
            if (!v15)
            {
              int v19 = *(_DWORD *)(v14 + 28);
              unsigned int v13 = *(_DWORD *)(a3 + 88);
              goto LABEL_17;
            }
          }
        }
        int v19 = 0;
LABEL_17:
        uint64_t result = 0;
        v13 += v19;
        *(_DWORD *)(a3 + 88) = v13;
        uint64_t v14 = *(void *)(v14 + 176);
        if (!v14) {
          return result;
        }
      }
    }
    return 0;
  }
}

uint64_t sub_10001A194(uint64_t a1, uint64_t a2)
{
  return 0;
}

uint64_t sub_10001A1B8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6 = UARPLayer2DecompressBuffer(a1, *(unsigned __int16 *)(a3 + 45), *(void *)(a3 + 16), *(unsigned __int16 *)(a3 + 51), *(void *)(a3 + 32), *(unsigned __int16 *)(a3 + 53));
  if (v6)
  {
    uint64_t v7 = *(void (**)(void, uint64_t, const char *))(a1 + 400);
    if (v7) {
      v7(*(void *)(a1 + 544), 2, "Error decompressing buffer for payload");
    }
    else {
      uarpLogError(2u, "Error decompressing buffer for payload");
    }
    uarpPlatformAssetProcessingCompleteInternal(a1, *(void *)(a2 + 696), a2, 4u, 0, 0);
  }
  else
  {
    UARPLayer2HashUpdate(a1, *(unsigned int *)(a3 + 104), *(void *)(a3 + 112), *(void *)(a3 + 32), *(unsigned __int16 *)(a3 + 53));
    UARPLayer2PayloadData(a1, a2);
    int v8 = *(_DWORD *)(a3 + 24);
    *(_DWORD *)(a3 + 88) = v8;
    *(_DWORD *)(a2 + 508) += v8;
    *(unsigned char *)(a3 + 44) = 1;
    *(_DWORD *)(a3 + 24) = 10;
    *(void *)(a3 + 64) = sub_100019C30;
  }
  return v6;
}

uint64_t UARPLayer2RequestBuffer(uint64_t a1, void *a2, unsigned int a3)
{
  int v4 = *(uint64_t (**)(uint64_t))(a1 + 48);
  if (v4)
  {
    uint64_t v5 = *(void *)(a1 + 544);
    return v4(v5);
  }
  else
  {
    uint64_t v7 = uarpZalloc(a3);
    *a2 = v7;
    if (v7) {
      return 0;
    }
    else {
      return 11;
    }
  }
}

void UARPLayer2ReturnBuffer(uint64_t a1, void *a2)
{
  uint64_t v2 = *(void (**)(void, void *))(a1 + 56);
  if (v2) {
    v2(*(void *)(a1 + 544), a2);
  }
  else {
    uarpFree(a2);
  }
}

uint64_t UARPLayer2RequestTransmitMsgBuffer(uint64_t a1, uint64_t a2, void *a3, unsigned int *a4)
{
  size_t v5 = *a4;
  uint64_t v6 = *(uint64_t (**)(uint64_t, void *, size_t))(a1 + 48);
  if (v6)
  {
    uint64_t v7 = *(void *)(a1 + 544);
    return v6(v7, a3, v5);
  }
  else
  {
    int v9 = uarpZalloc(v5);
    *a3 = v9;
    if (v9) {
      return 0;
    }
    else {
      return 11;
    }
  }
}

void UARPLayer2ReturnTransmitMsgBuffer(uint64_t a1, int a2, void *a3)
{
  unsigned int v3 = *(void (**)(void, void *))(a1 + 56);
  if (v3) {
    v3(*(void *)(a1 + 544), a3);
  }
  else {
    uarpFree(a3);
  }
}

uint64_t UARPLayer2SendMessage(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  int v4 = *(uint64_t (**)(uint64_t, uint64_t, const void *, uint64_t, uint64_t))(a1 + 80);
  if (!v4) {
    return 14;
  }
  if (*(_WORD *)(a2 + 136))
  {
    uarpPlatformDownstreamEndpointSendMessageInternal(a1, *(void *)(a2 + 176), a2, a3, a4);
    uarpPlatformEndpointSendMessageComplete(a1, a2, (uint64_t)a3);
    return 0;
  }
  else
  {
    uint64_t v9 = *(void *)(a1 + 544);
    uint64_t v10 = *(void *)(a2 + 40);
    return v4(v9, v10, a3, a4, a4);
  }
}

uint64_t UARPLayer2DataTransferPause(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 88);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2DataTransferPauseAck(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 96);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2DataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 104);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2DataTransferResumeAck(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 112);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2SuperBinaryOffered(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 120);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DynamicAssetOffered(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 128);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ApplyStagedAssets(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 136);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2ApplyStagedAssetsResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 144);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2ManufacturerName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 152);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2ManufacturerNameResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 160);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ModelName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 168);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2ModelNameResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 176);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2SerialNumber(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 184);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2SerialNumberResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 192);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2HardwareVersion(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 200);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2HardwareVersionResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2ActiveFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(uint64_t))a1[27];
  if (v5)
  {
    uint64_t v6 = a1[68];
    return v5(v6);
  }
  else
  {
    int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[64];
    if (v8)
    {
      if (a2)
      {
        a2 = (unsigned int *)uarpTagStructPack32(a2);
        int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[64];
      }
      uint64_t v9 = a1[68];
      return v8(v9, a2, a3);
    }
    else
    {
      *a3 = -1;
      a3[1] = -1;
      return 0;
    }
  }
}

uint64_t UARPLayer2ActiveFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 224);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StagedFirmwareVersion2(void *a1, unsigned int *a2, void *a3)
{
  size_t v5 = (uint64_t (*)(uint64_t))a1[29];
  if (v5)
  {
    uint64_t v6 = a1[68];
    return v5(v6);
  }
  else
  {
    int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[65];
    if (v8)
    {
      if (a2)
      {
        a2 = (unsigned int *)uarpTagStructPack32(a2);
        int v8 = (uint64_t (*)(uint64_t, unsigned int *, void *))a1[65];
      }
      uint64_t v9 = a1[68];
      return v8(v9, a2, a3);
    }
    else
    {
      *a3 = -1;
      a3[1] = -1;
      return 0;
    }
  }
}

uint64_t UARPLayer2StagedFirmwareVersionResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 240);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2LastError(uint64_t a1, void *a2)
{
  uint64_t v2 = *(uint64_t (**)(void))(a1 + 248);
  if (v2) {
    return v2(*(void *)(a1 + 544));
  }
  *a2 = -1;
  return 0;
}

uint64_t UARPLayer2LastErrorResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 256);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2StatisticsResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetSolicitation(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 272);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2RescindAllAssets(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, uint64_t))(result + 280);
  if (v3)
  {
    if (a2) {
      a2 = *(void *)(a2 + 40);
    }
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), a2, a3);
  }
  return result;
}

uint64_t UARPLayer2RescindAllAssetsAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, uint64_t))(result + 288);
  if (v3)
  {
    if (a3) {
      a3 = *(void *)(a3 + 704);
    }
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), a3);
  }
  return result;
}

uint64_t UARPLayer2WatchdogSet(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 296);
  if (!v2) {
    return 14;
  }
  *(unsigned char *)(a2 + 50) = 1;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2WatchdogCancel(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 304);
  if (!v2) {
    return 14;
  }
  *(unsigned char *)(a2 + 50) = 0;
  return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
}

uint64_t UARPLayer2ProtocolVersion(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 312);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2FriendlyName(uint64_t a1, _DWORD *a2, _DWORD *a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t))(a1 + 320);
  if (v3)
  {
    uint64_t v4 = *(void *)(a1 + 544);
    return v3(v4);
  }
  else
  {
    *a3 = uarpCopyDefaultInfoString(a2, *a3);
    return 0;
  }
}

uint64_t UARPLayer2FriendlyNameResponse(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 328);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2DecompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 336);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2CompressBuffer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(a1 + 344);
  if (v6) {
    return v6(a2, a3, a4, a5, a6);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2HashInfo(uint64_t result, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  uint64_t v4 = *(uint64_t (**)(uint64_t, _DWORD *, _DWORD *))(result + 352);
  if (v4) {
    return v4(a2, a3, a4);
  }
  *a3 = 0;
  *a4 = 0;
  return result;
}

uint64_t UARPLayer2HashInit(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 360);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2HashUpdate(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 368);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashFinal(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  size_t v5 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(result + 376);
  if (v5) {
    return v5(a2, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2HashLog(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(uint64_t, uint64_t))(result + 384);
  if (v3) {
    return v3(a2, a3);
  }
  return result;
}

uint64_t UARPLayer2LogPacket(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 392);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 432);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReachable(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 440);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3DownstreamEndpointUnreachable(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 448);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3DownstreamEndpointReleased(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 456);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t fUarpLayer3DownstreamEndpointRecvMessage(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a1 + 464);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 40));
  }
  else {
    return 14;
  }
}

uint64_t fUarpLayer3NoFirmwareUpdateAvailable(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 472);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2VendorSpecificRecvMessage(void *a1, uint64_t a2)
{
  uint64_t v2 = (uint64_t (*)(void, void))a1[60];
  if (v2) {
    return v2(a1[68], *(void *)(a2 + 40));
  }
  uint64_t v4 = (uint64_t (*)(void))a1[74];
  if (v4) {
    return v4();
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2VendorSpecificCheckExpectedResponse(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 488);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1;
  }
}

uint64_t UARPLayer2VendorSpecificCheckValidToSend(uint64_t a1, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a1 + 496);
  if (v2) {
    return v2(*(void *)(a1 + 544), *(void *)(a2 + 40));
  }
  else {
    return 1;
  }
}

uint64_t UARPLayer2VendorSpecificExceededRetries(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(result + 504);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 40));
  }
  return result;
}

uint64_t UARPLayer2AssetReady(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 80);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataTLV(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 88);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataComplete(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 96);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 104);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadReady(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 112);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

void *UARPLayer2PayloadMetaDataTLV(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5)
{
  uint64_t result = uarpProcessPayloadTLVInternal(a1, a2, a2 + 464, a3, a4, a5);
  uint64_t v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))(a2 + 120);
  if (v11)
  {
    uint64_t v12 = a1[68];
    uint64_t v13 = *(void *)(a2 + 704);
    return (void *)v11(v12, v13, a3, a4, a5);
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataComplete(uint64_t a1, uint64_t a2)
{
  uint64_t result = *(unsigned int *)(a2 + 540);
  if (!result) {
    goto LABEL_5;
  }
  size_t v5 = *(void (**)(void))(a1 + 376);
  if (v5) {
    v5();
  }
  uint64_t result = uarpPlatformCompareHash(a1, *(void **)(a2 + 560), *(unsigned int *)(a2 + 568), *(void **)(a2 + 576), *(_DWORD *)(a2 + 584));
  if (!result)
  {
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 200);
    if (!v6) {
      return result;
    }
  }
  else
  {
LABEL_5:
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(a2 + 128);
    if (!v6) {
      return result;
    }
  }
  uint64_t v7 = *(void *)(a1 + 544);
  uint64_t v8 = *(void *)(a2 + 704);
  return v6(v7, v8);
}

uint64_t UARPLayer2AssetCorrupt(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 200);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadMetaDataProcessingError(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 136);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadData(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 144);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 152);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2PayloadDataComplete2(uint64_t result, void *a2)
{
  uint64_t v2 = (uint64_t (*)(void, void))a2[20];
  if (v2) {
    return v2(*(void *)(result + 544), a2[88]);
  }
  unsigned int v3 = (uint64_t (*)(void, void))a2[19];
  if (v3) {
    return v3(*(void *)(result + 544), a2[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetGetBytesAtOffset2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v7 = (uint64_t (*)(void, uint64_t, void))a3[21];
  if (v7) {
    return v7(*(void *)(a1 + 544), a2, a3[88]);
  }
  uint64_t v9 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t, uint64_t))a3[34];
  if (v9) {
    return v9(*(void *)(a1 + 544), a3[88], a4, a5, a6, a7);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetSetBytesAtOffset2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  uint64_t v6 = (uint64_t (*)(void, uint64_t, void))a3[22];
  if (v6) {
    return v6(*(void *)(a1 + 544), a2, a3[88]);
  }
  uint64_t v8 = (uint64_t (*)(void, void, uint64_t, uint64_t, uint64_t))a3[35];
  if (v8) {
    return v8(*(void *)(a1 + 544), a3[88], a4, a5, a6);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetRescinded(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 184);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetRescindedAck(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = *(uint64_t (**)(void, uint64_t, void))(a3 + 192);
  if (v3) {
    return v3(*(void *)(result + 544), a2, *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetOrphaned(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 208);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetReleased2(uint64_t result, uint64_t a2, void *a3)
{
  if (a2) {
    a2 = *(void *)(a2 + 40);
  }
  unsigned int v3 = (uint64_t (*)(void, uint64_t, void))a3[27];
  if (v3) {
    return v3(*(void *)(result + 544), a2, a3[88]);
  }
  uint64_t v4 = (uint64_t (*)(void, void))a3[36];
  if (v4) {
    return v4(*(void *)(result + 544), a3[88]);
  }
  return result;
}

uint64_t UARPLayer2AssetProcessingNotification2(uint64_t a1, uint64_t a2, void *a3, uint64_t a4)
{
  uint64_t v4 = (uint64_t (*)(void, void, void))a3[28];
  if (v4) {
    return v4(*(void *)(a1 + 544), *(void *)(a2 + 40), a3[88]);
  }
  uint64_t v6 = (uint64_t (*)(void, void, uint64_t))a3[37];
  if (v6) {
    return v6(*(void *)(a1 + 544), a3[88], a4);
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 232);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 240);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetPreProcessingNotificationAck(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 248);
  if (v3) {
    return v3(*(void *)(a1 + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  else {
    return 14;
  }
}

uint64_t UARPLayer2AssetAllHeadersAndMetaDataComplete(uint64_t result, uint64_t a2, uint64_t a3)
{
  unsigned int v3 = *(uint64_t (**)(void, void, void))(a3 + 256);
  if (v3) {
    return v3(*(void *)(result + 544), *(void *)(a2 + 40), *(void *)(a3 + 704));
  }
  return result;
}

uint64_t UARPLayer2AssetStore(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(uint64_t (**)(void, void))(a2 + 264);
  if (v2) {
    return v2(*(void *)(result + 544), *(void *)(a2 + 704));
  }
  return result;
}

uint64_t uarpPlatformEndpointQueryActiveFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2ActiveFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformEndpointQueryStagedFirmwareVersion(void *a1, uint64_t a2, void *a3)
{
  unsigned int v4 = 0;
  if (a2) {
    unsigned int v4 = *(_DWORD *)(a2 + 48);
  }
  return UARPLayer2StagedFirmwareVersion2(a1, &v4, a3);
}

uint64_t uarpPlatformAssetFindByAssetID(uint64_t a1, uint64_t a2, int a3, int a4)
{
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
    if (*(_DWORD *)(result + 304) == a3 && *(void *)(result + 696) == a2 && *(unsigned __int16 *)(result + 44) == a4) {
      break;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetFindByTag(uint64_t a1, uint64_t a2, int a3, unsigned __int8 *a4)
{
  for (uint64_t i = *(void *)(a1 + 568); i; uint64_t i = *(void *)(i + 712))
  {
    if (*(_DWORD *)(i + 304) == a3
      && *(void *)(i + 696) == a2
      && uarpAssetTagCompare((unsigned __int8 *)(i + 48), a4))
    {
      break;
    }
  }
  return i;
}

void uarpPlatformCleanupAssetsForRemoteEndpoint(uint64_t a1, uint64_t a2, int a3)
{
  if (*(unsigned char *)(a1 + 580) != 1)
  {
    uint64_t v4 = *(void *)(a1 + 568);
    for (*(void *)(a1 + 568) = 0; v4; *(void *)(a1 + 568) = v7)
    {
      while (1)
      {
        uint64_t v7 = v4;
        uint64_t v4 = *(void *)(v4 + 712);
        *(void *)(v7 + 712) = 0;
        uint64_t v8 = *(void *)(v7 + 696);
        BOOL v9 = v8 == a2 || a2 == 0;
        if (!v9 && v8 != 0) {
          break;
        }
        if (a3 == 1)
        {
          if (*(_WORD *)(v7 + 46))
          {
            *(void *)(v7 + 696) = 0;
            UARPLayer2AssetOrphaned(a1, v7);
          }
          else
          {
            *(unsigned char *)(v7 + 72) = 1;
          }
        }
        if (*(unsigned char *)(v7 + 72) != 1) {
          break;
        }
        UARPLayer2AssetReleased2(a1, a2, (void *)v7);
        *(void *)(v7 + 704) = 0;
        uarpPlatformAssetCleanup(a1, v7);
        if (!v4) {
          return;
        }
      }
      *(void *)(v7 + 712) = *(void *)(a1 + 568);
    }
  }
}

uint64_t uarpPlatformAssetOrphan(uint64_t result, uint64_t a2)
{
  *(void *)(a2 + 696) = 0;
  return UARPLayer2AssetOrphaned(result, a2);
}

uint64_t uarpPlatformAssetRelease(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t result = UARPLayer2AssetReleased2(a1, a2, a3);
  a3[88] = 0;
  return result;
}

void uarpPlatformAssetCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 640);
  if (v4 && !*(unsigned char *)(a2 + 652)) {
    UARPLayer2ReturnBuffer(a1, v4);
  }
  *(void *)(a2 + 640) = 0;
  *(_DWORD *)(a2 + 648) = 0;
  size_t v5 = *(void **)(a2 + 656);
  if (v5 && !*(unsigned char *)(a2 + 668)) {
    UARPLayer2ReturnBuffer(a1, v5);
  }
  *(void *)(a2 + 656) = 0;
  *(_DWORD *)(a2 + 664) = 0;
  uint64_t v6 = *(void **)(a2 + 672);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 672) = 0;
  }
  *(_DWORD *)(a2 + 680) = 0;
  uint64_t v7 = *(void **)(a2 + 720);
  if (v7)
  {
    do
    {
      uint64_t v8 = (void *)v7[2];
      v7[2] = 0;
      UARPLayer2ReturnBuffer(a1, v7);
      uint64_t v7 = v8;
    }
    while (v8);
  }
  *(void *)(a2 + 720) = 0;
  BOOL v9 = *(void **)(a2 + 632);
  if (v9)
  {
    do
    {
      uint64_t v10 = (void *)v9[21];
      uint64_t v11 = (void *)v9[22];
      if (v10)
      {
        do
        {
          uint64_t v12 = (void *)v10[2];
          v10[2] = 0;
          UARPLayer2ReturnBuffer(a1, v10);
          uint64_t v10 = v12;
        }
        while (v12);
      }
      v9[21] = 0;
      uarpPlatformPayloadCleanup(a1, (uint64_t)v9);
      UARPLayer2ReturnBuffer(a1, v9);
      BOOL v9 = v11;
    }
    while (v11);
  }
  uarpPlatformPayloadCleanup(a1, a2 + 464);
  UARPLayer2ReturnBuffer(a1, (void *)a2);
}

uint64_t uarpPlatformAssetIsKnown(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = *(void *)(a1 + 568);
  if (!v3) {
    return 0;
  }
  while (v3 != a3)
  {
    uint64_t v3 = *(void *)(v3 + 712);
    if (!v3) {
      return 0;
    }
  }
  return 1;
}

void uarpPlatformPrepareAsset(uint64_t a1, uint64_t a2, uint64_t a3, _DWORD *a4, uint64_t a5, int a6)
{
  if (a1)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v16 = 0;
        if (!UARPLayer2RequestBuffer(a1, &v16, 0x2D8u))
        {
          uint64_t v12 = v16;
          if (v16)
          {
            *(void *)(v16 + 704) = a3;
            *(void *)(v12 + 696) = a2;
            uarpPlatformEndpointAssetSetCallbacks(a1, v12, a5);
            if (!v13)
            {
              uint64_t v14 = v16;
              if (a6 == 1)
              {
                *(_DWORD *)(v16 + 304) = 1;
                int v15 = *(_DWORD *)(a1 + 576);
                if (v15 == 65534) {
                  int v15 = 1;
                }
                *(_DWORD *)(a1 + 576) = v15 + 1;
              }
              else
              {
                LOWORD(v15) = 0;
                *(_DWORD *)(v16 + 304) = 0;
              }
              *(_WORD *)(v14 + 44) = v15;
              *(void *)(v14 + 712) = *(void *)(a1 + 568);
              *(void *)(a1 + 568) = v14;
              if (a4)
              {
                *(_WORD *)(v14 + 46) = 2;
                *(_DWORD *)(v14 + 48) = *a4;
              }
              else
              {
                *(_WORD *)(v14 + 46) = 1;
              }
            }
          }
        }
      }
    }
  }
}

void uarpPlatformPayloadCleanup(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void **)(a2 + 80);
  if (v4)
  {
    UARPLayer2ReturnBuffer(a1, v4);
    *(void *)(a2 + 80) = 0;
    *(_DWORD *)(a2 + 88) = 0;
  }
  size_t v5 = *(void **)(a2 + 96);
  if (v5)
  {
    UARPLayer2ReturnBuffer(a1, v5);
    *(void *)(a2 + 96) = 0;
    *(_DWORD *)(a2 + 104) = 0;
  }
  uint64_t v6 = *(void **)(a2 + 112);
  if (v6)
  {
    UARPLayer2ReturnBuffer(a1, v6);
    *(void *)(a2 + 112) = 0;
    *(_DWORD *)(a2 + 120) = 0;
  }
  uint64_t v7 = *(void **)(a2 + 64);
  if (v7)
  {
    UARPLayer2ReturnBuffer(a1, v7);
    *(void *)(a2 + 64) = 0;
    *(_DWORD *)(a2 + 72) = 0;
  }
  uint64_t v8 = *(void **)(a2 + 152);
  if (v8)
  {
    UARPLayer2ReturnBuffer(a1, v8);
    *(void *)(a2 + 152) = 0;
    *(_DWORD *)(a2 + 160) = 0;
  }
  BOOL v9 = *(void **)(a2 + 136);
  if (v9)
  {
    UARPLayer2ReturnBuffer(a1, v9);
    *(void *)(a2 + 136) = 0;
    *(_DWORD *)(a2 + 144) = 0;
  }
}

uint64_t uarpPlatformEndpointAssetStore(uint64_t result, uint64_t a2, unsigned int a3)
{
  if (a3 <= 4) {
    return UARPLayer2AssetStore(result, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescind(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    uint64_t v5 = result;
    if (a3)
    {
      uarpTransmitQueueAssetRescinded(result, a2, a3);
      *(unsigned char *)(a3 + 392) = 0;
      *(unsigned char *)(a3 + 72) = 1;
      return UARPLayer2AssetRescinded(v5, a2, a3);
    }
    else
    {
      return UARPLayer2RescindAllAssets(result, a2, 0);
    }
  }
  return result;
}

uint64_t uarpPlatformReOfferFirmware(uint64_t result, uint64_t a2)
{
  uint64_t v2 = *(void *)(result + 568);
  if (v2)
  {
    uint64_t v4 = result;
    do
    {
      if (*(_DWORD *)(v2 + 304) == 1 && *(void *)(v2 + 696) == a2 && (*(_WORD *)(v2 + 46) & 2) == 0) {
        uint64_t result = uarpPlatformEndpointOfferAsset(v4, a2, *(void *)(v2 + 704));
      }
      uint64_t v2 = *(void *)(v2 + 712);
    }
    while (v2);
  }
  return result;
}

uint64_t uarpCallbackUpdateInformationTLV(void *a1, uint64_t a2, _DWORD *a3)
{
  int v5 = *a3;
  unsigned int v6 = a3[1];
  unsigned int v9 = v6;
  if (v5 != 7)
  {
    uint64_t result = uarpPlatformQueryAccessoryInfo(a1, v5, a3 + 2, v6, &v9);
    if (result) {
      return result;
    }
    unsigned int v7 = v9;
    goto LABEL_6;
  }
  if (v6 >= 0x10)
  {
    a3[2] = uarpHtonl(*(_DWORD *)(a2 + 62));
    a3[3] = uarpHtonl(*(_DWORD *)(a2 + 66));
    a3[4] = uarpHtonl(*(_DWORD *)(a2 + 70));
    a3[5] = uarpHtonl(*(_DWORD *)(a2 + 74));
    unsigned int v7 = 16;
LABEL_6:
    uint64_t result = 0;
    a3[1] = v7;
    return result;
  }
  return 39;
}

uint64_t uarpPlatformQueryAccessoryInfo(void *a1, int a2, unsigned int *a3, unsigned int a4, unsigned int *a5)
{
  *a5 = a4;
  switch(a2)
  {
    case 1:
      return UARPLayer2ManufacturerName((uint64_t)a1, a3, a5);
    case 2:
      return UARPLayer2ModelName((uint64_t)a1, a3, a5);
    case 3:
      return UARPLayer2SerialNumber((uint64_t)a1, a3, a5);
    case 4:
      return UARPLayer2HardwareVersion((uint64_t)a1, a3, a5);
    case 9:
      return UARPLayer2FriendlyName((uint64_t)a1, a3, a5);
    default:
      if ((a2 - 5) > 1)
      {
        if (a2 != 8)
        {
          *a5 = 0;
          return 28;
        }
        *a5 = 8;
        if (a4 >= 8)
        {
          uint64_t Error = UARPLayer2LastError((uint64_t)a1, a3);
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          return Error;
        }
      }
      else
      {
        *a5 = 16;
        if (a4 >= 0x10)
        {
          if (a2 == 5)
          {
            unsigned int v9 = 0;
            uint64_t active = UARPLayer2ActiveFirmwareVersion2(a1, &v9, a3);
          }
          else
          {
            unsigned int v10 = 0;
            uint64_t active = UARPLayer2StagedFirmwareVersion2(a1, &v10, a3);
          }
          uint64_t Error = active;
          *a3 = uarpHtonl(*a3);
          a3[1] = uarpHtonl(a3[1]);
          a3[2] = uarpHtonl(a3[2]);
          a3[3] = uarpHtonl(a3[3]);
          return Error;
        }
      }
      return 39;
  }
}

uint64_t uarpPlatformResponseAccessoryInfo(uint64_t result, uint64_t a2, uint64_t a3, int a4, unsigned int a5, unsigned int *a6)
{
  uint64_t v8 = result;
  switch(a4)
  {
    case 1:
      uint64_t result = UARPLayer2ManufacturerNameResponse(result, a2);
      break;
    case 2:
      uint64_t result = UARPLayer2ModelNameResponse(result, a2);
      break;
    case 3:
      uint64_t result = UARPLayer2SerialNumberResponse(result, a2);
      break;
    case 4:
      uint64_t result = UARPLayer2HardwareVersionResponse(result, a2);
      break;
    case 5:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2ActiveFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 138) = *(_OWORD *)a6;
      }
      break;
    case 6:
      if (a5 >= 0x10)
      {
        uarpVersionEndianSwap(a6, a6);
        uint64_t result = UARPLayer2StagedFirmwareVersionResponse(v8, a2);
        *(_OWORD *)(a2 + 154) = *(_OWORD *)a6;
      }
      break;
    case 7:
      if (a5 >= 0x10)
      {
        *a6 = uarpNtohl(*a6);
        a6[1] = uarpNtohl(a6[1]);
        a6[2] = uarpNtohl(a6[2]);
        a6[3] = uarpNtohl(a6[3]);
        uint64_t result = UARPLayer2StatisticsResponse(v8, a2);
      }
      break;
    case 8:
      if (a5 >= 8)
      {
        *a6 = uarpNtohl(*a6);
        a6[1] = uarpNtohl(a6[1]);
        uint64_t result = UARPLayer2LastErrorResponse(v8, a2);
      }
      break;
    case 9:
      uint64_t result = UARPLayer2FriendlyNameResponse(result, a2);
      break;
    default:
      return result;
  }
  return result;
}

uint64_t uarpPlatformAssetDataRequest(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, void *__dst, unsigned __int16 *a7)
{
  uint64_t v8 = *(void *)(a1 + 568);
  if (!v8) {
    return 17;
  }
  while (*(_DWORD *)(v8 + 304) != 1 || *(void *)(v8 + 696) != a2 || *(unsigned __int16 *)(v8 + 44) != a3)
  {
    uint64_t v8 = *(void *)(v8 + 712);
    if (!v8) {
      return 17;
    }
  }
  unsigned int v10 = *(_DWORD *)(v8 + 68);
  if (v10 < a4 + (int)a5) {
    unsigned __int16 v11 = v10 - a5;
  }
  else {
    unsigned __int16 v11 = a4;
  }
  if (v10 >= a5) {
    unsigned __int16 v12 = v11;
  }
  else {
    unsigned __int16 v12 = 0;
  }
  return uarpPlatformEndpointAssetGetBytesAtOffset(a1, a2, v8, __dst, v12, a5, a7);
}

uint64_t uarpPlatformDataTransferResume(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = *(void *)(a1 + 568);
  if (v4)
  {
    while (1)
    {
      if (!*(_DWORD *)(v4 + 304) && *(void *)(v4 + 696) == a2)
      {
        uint64_t result = uarpPlatformAssetRequestData(a1, v4, v4 + 312);
        if (result) {
          break;
        }
      }
      uint64_t v4 = *(void *)(v4 + 712);
      if (!v4) {
        goto LABEL_6;
      }
    }
  }
  else
  {
LABEL_6:
    return UARPLayer2DataTransferResume(a1, a2);
  }
  return result;
}

uint64_t uarpPlatformAssetRescinded(uint64_t result, uint64_t a2, int a3)
{
  uint64_t v4 = *(void *)(result + 568);
  if (a3 == 0xFFFF)
  {
    if (!v4) {
      return uarpPlatformAssetRescind(result, a2, v4);
    }
    uint64_t v5 = *(void *)(result + 568);
    do
    {
      if (!*(_DWORD *)(v5 + 304) && *(void *)(v5 + 696) == a2) {
        *(unsigned char *)(v5 + 72) = 1;
      }
      uint64_t v5 = *(void *)(v5 + 712);
    }
    while (v5);
  }
  if (v4)
  {
    while (*(_DWORD *)(v4 + 304) || *(void *)(v4 + 696) != a2 || *(unsigned __int16 *)(v4 + 44) != a3)
    {
      uint64_t v4 = *(void *)(v4 + 712);
      if (!v4) {
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    if (a3 != 0xFFFF) {
      return result;
    }
    uint64_t v4 = 0;
  }
  return uarpPlatformAssetRescind(result, a2, v4);
}

uint64_t uarpAssetProcessingComplete(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  if (a2)
  {
    uint64_t v8 = uarpAllocPrepareTransmitBuffer2(a1, a2, 9u, 0xAu, 1);
    if (v8)
    {
      uint64_t v9 = (uint64_t)v8;
      uint64_t v10 = v8[2];
      *(_WORD *)(v10 + 6) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
      *(_WORD *)(v10 + 8) = uarpHtons(a4);
      return uarpTransmitBuffer2(a1, a2, v9);
    }
    else
    {
      return 11;
    }
  }
  else if (a4 == 3)
  {
    return 0;
  }
  else
  {
    return 13;
  }
}

uint64_t uarpOfferAssetToRemoteEP(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 5u, 0x24u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpTagStructPack32((unsigned int *)(a3 + 48));
  *(_WORD *)(v8 + 10) = uarpHtons(*(unsigned __int16 *)(a3 + 46));
  *(_WORD *)(v8 + 12) = uarpHtons(*(unsigned __int16 *)(a3 + 44));
  uarpVersionEndianSwap((unsigned int *)(a3 + 52), (_DWORD *)(v8 + 14));
  *(_DWORD *)(v8 + 30) = uarpHtonl(*(_DWORD *)(a3 + 68));
  *(_WORD *)(v8 + 34) = uarpHtons(*(unsigned __int16 *)(a3 + 448));
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpAssetRescind(uint64_t a1, uint64_t a2, unsigned int a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xCu, 8u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSolicitDynamicAsset(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  unsigned int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x11u, 0xAu, 1);
  if (!v6) {
    return 11;
  }
  *(_DWORD *)(v6[2] + 6) = *a3;
  return uarpTransmitBuffer2(a1, a2, (uint64_t)v6);
}

uint64_t uarpPlatformFindPreparedAsset(uint64_t a1, uint64_t a2, uint64_t a3, char a4, unsigned __int8 *a5)
{
  if ((a4 & 2) == 0) {
    return 0;
  }
  for (uint64_t result = *(void *)(a1 + 568); result; uint64_t result = *(void *)(result + 712))
  {
    if (!*(_DWORD *)(result + 304)
      && *(void *)(result + 696) == a2
      && !*(_WORD *)(result + 44)
      && *(unsigned __int8 *)(result + 48) == *a5
      && *(unsigned __int8 *)(result + 49) == a5[1]
      && *(unsigned __int8 *)(result + 50) == a5[2]
      && *(unsigned __int8 *)(result + 51) == a5[3])
    {
      break;
    }
  }
  return result;
}

uint64_t uarpPlatformCreateRxAsset(uint64_t a1, uint64_t a2)
{
  uint64_t v6 = 0;
  int v4 = UARPLayer2RequestBuffer(a1, &v6, 0x2D8u);
  uint64_t result = 0;
  if (!v4)
  {
    uint64_t result = v6;
    if (v6)
    {
      *(void *)(v6 + 696) = a2;
      *(_DWORD *)(result + 304) = 0;
      *(void *)(result + 712) = *(void *)(a1 + 568);
      *(void *)(a1 + 568) = result;
    }
  }
  return result;
}

BOOL uarpPlatformCompareHash(uint64_t a1, void *__s1, size_t __n, void *__s2, int a5)
{
  if (!*(void *)(a1 + 376)) {
    return 1;
  }
  if (__n == a5) {
    return memcmp(__s1, __s2, __n) == 0;
  }
  return 0;
}

uint64_t uarpAssetQueueSolicitation(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  if (!*(void *)(a2 + 80)) {
    return 1;
  }
  if (!*(_WORD *)(a2 + 28)) {
    return 2;
  }
  uint64_t v5 = 0;
  unint64_t v6 = 0;
  while (uarpAssetTagIsValid((unsigned char *)(*(void *)(a2 + 80) + v5)))
  {
    ++v6;
    v5 += 4;
    if (v6 >= *(unsigned __int16 *)(a2 + 28)) {
      return 2;
    }
  }
  *(_DWORD *)(*(void *)(a2 + 80) + 4 * v6) = *a3;
  return v6 == 0;
}

uint64_t uarpPlatformEndpointSendMessageCompleteInternal(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result)
  {
    if (a2)
    {
      if (a3)
      {
        uint64_t v3 = *(unsigned __int16 *)(a2 + 112);
        if (*(_WORD *)(a2 + 112))
        {
          for (uint64_t i = *(uint64_t **)(a2 + 120); ; ++i)
          {
            uint64_t v5 = *i;
            if (*i)
            {
              if (*(void *)v5 == a3) {
                break;
              }
            }
            if (!--v3) {
              return result;
            }
          }
          *(unsigned char *)(v5 + 32) = 0;
          if (!*(_WORD *)(a2 + 18) || !*(unsigned char *)(v5 + 31)) {
            return uarpTransmitQueuePendingEntryComplete(result, a2, v5);
          }
        }
      }
    }
  }
  return result;
}

uint64_t UARPPlatformDownstreamEndpointByID(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t result = 0;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if (v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*i)
        {
          if (*(void *)(result + 176) == a2 && *(unsigned __int16 *)(result + 136) == a3) {
            break;
          }
        }
        if (!--v5) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t UARPPlatformDownstreamEndpointByDelegate(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result = 0;
  if (a1 && a2 && a3)
  {
    uint64_t v5 = *(unsigned int *)(a1 + 556);
    if (v5)
    {
      for (uint64_t i = *(uint64_t **)(a1 + 560); ; ++i)
      {
        uint64_t result = *i;
        if (*(void *)(*i + 176) == a2 && *(void *)(result + 40) == a3) {
          break;
        }
        if (!--v5) {
          return 0;
        }
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpPlatformDownstreamEndpointSendMessageInternal(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4, unsigned int a5)
{
  return uarpTransmitBufferUpstream(a1, a2, *(unsigned __int16 *)(a3 + 136), a4, a5);
}

uint64_t uarpPlatformRemoteEndpointAddEntry(uint64_t a1, uint64_t a2)
{
  int v4 = *(_DWORD *)(a1 + 556);
  if (v4)
  {
    uint64_t v5 = *(void **)(a1 + 560);
    uint64_t v6 = *(unsigned int *)(a1 + 556);
    while (*v5)
    {
      ++v5;
      if (!--v6) {
        goto LABEL_5;
      }
    }
    uint64_t result = 0;
    *uint64_t v5 = a2;
  }
  else
  {
LABEL_5:
    int v7 = v4 + 1;
    uint64_t v11 = 0;
    uint64_t result = UARPLayer2RequestBuffer(a1, &v11, 8 * (v4 + 1));
    if (!result)
    {
      uint64_t v9 = *(unsigned int *)(a1 + 556);
      if (v9)
      {
        uint64_t v10 = 0;
        do
        {
          *(void *)(v11 + v10) = *(void *)(*(void *)(a1 + 560) + v10);
          v10 += 8;
        }
        while (8 * v9 != v10);
      }
      else
      {
        uint64_t v9 = 0;
      }
      *(void *)(v11 + 8 * v9) = a2;
      UARPLayer2ReturnBuffer(a1, *(void **)(a1 + 560));
      uint64_t result = 0;
      *(_DWORD *)(a1 + 556) = v7;
      *(void *)(a1 + 560) = v11;
    }
  }
  return result;
}

uint64_t uarpPlatformRemoteEndpointAlloc(uint64_t a1)
{
  uint64_t v4 = 0;
  int v2 = UARPLayer2RequestBuffer(a1, &v4, 0xB8u);
  uint64_t result = 0;
  if (!v2)
  {
    if (uarpPlatformRemoteEndpointAddEntry(a1, v4)) {
      return 0;
    }
    else {
      return v4;
    }
  }
  return result;
}

uint64_t uarpPlatformAssetApproveOfferVersion(uint64_t a1, uint64_t a2)
{
  if (*(_WORD *)(a2 + 46) != 1 || !*(unsigned char *)(a1 + 32)) {
    return 0;
  }
  uint64_t v3 = (_DWORD *)(a2 + 52);
  int v4 = uarpVersionCompare((_DWORD *)(a1 + 138), (_DWORD *)(a2 + 52));
  if (v4 == 2) {
    return 59;
  }
  if (!v4) {
    return 60;
  }
  int v6 = uarpVersionCompare((_DWORD *)(a1 + 154), v3);
  if (v6) {
    unsigned int v7 = 0;
  }
  else {
    unsigned int v7 = 62;
  }
  if (v6 == 2) {
    return 61;
  }
  else {
    return v7;
  }
}

uint64_t uarpPlatformEndpointSendSyncMsg(uint64_t a1, uint64_t a2)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t v5 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0, 6u, *(_DWORD *)(a1 + 552) != 0);
    if (v5)
    {
      return uarpTransmitBuffer2(a1, a2, (uint64_t)v5);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendVersionDiscoveryRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    unsigned int v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 1u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      if (a3 >= 4) {
        unsigned int v10 = 4;
      }
      else {
        unsigned int v10 = a3;
      }
      *(_WORD *)(a2 + 48) = v10;
      *(_WORD *)(v9 + 6) = uarpHtons(v10);
      return uarpTransmitBuffer2(a1, a2, v8);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendVersionDiscoveryResponse(uint64_t a1, uint64_t a2, __int16 a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    *(_WORD *)(a2 + 48) = a3;
    int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 2u, 0xAu, 0);
    if (v6)
    {
      uint64_t v7 = (uint64_t)v6;
      uint64_t v8 = v6[2];
      *(_WORD *)(v8 + 6) = uarpHtons(0);
      *(_WORD *)(v8 + 8) = uarpHtons(*(unsigned __int16 *)(a2 + 48));
      return uarpTransmitBuffer2(a1, a2, v7);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendInformationRequest(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 3u, 0xAu, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_DWORD *)(v8 + 6) = uarpHtonl(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDataTransferNotificationPause(uint64_t a1, uint64_t a2)
{
  return sub_10001C6F0(a1, a2, 1u);
}

uint64_t sub_10001C6F0(uint64_t a1, uint64_t a2, unsigned int a3)
{
  uint64_t result = 30;
  if (a1 && a2)
  {
    uint64_t v7 = uarpAllocPrepareTransmitBuffer2(a1, a2, 8u, 8u, 1);
    if (v7)
    {
      uint64_t v8 = (uint64_t)v7;
      uint64_t v9 = v7[2];
      *(_WORD *)(v9 + 6) = uarpHtons(a3);
      return uarpTransmitBuffer2(a1, a2, v8);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t uarpSendDataTransferNotificationResume(uint64_t a1, uint64_t a2)
{
  return sub_10001C6F0(a1, a2, 2u);
}

uint64_t uarpSendDynamicAssetPreProcessingStatus(uint64_t a1, uint64_t a2, _DWORD *a3, unsigned int a4, int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x13u, 0xCu, 1);
  if (!v10) {
    return 11;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_DWORD *)(v12 + 6) = *a3;
  *(_WORD *)(v12 + 10) = uarpHtons(a5 | a4);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendAssetRequestData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 6u, 0xEu, 1);
  if (!v10) {
    return 11;
  }
  uint64_t v11 = (uint64_t)v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  *(_DWORD *)(v12 + 8) = uarpHtonl(a4);
  if (a5 >= 0xFFFF) {
    unsigned int v13 = 0xFFFF;
  }
  else {
    unsigned int v13 = a5;
  }
  *(_WORD *)(v12 + 12) = uarpHtons(v13);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpSendVendorSpecific(uint64_t a1, uint64_t a2, __int16 *a3, unsigned int a4, const void *a5, unsigned int a6)
{
  if (!a2) {
    return 13;
  }
  uint64_t v12 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)(a6 + 11), a4 == 32);
  if (!v12) {
    return 11;
  }
  uint64_t v13 = (uint64_t)v12;
  uint64_t v14 = v12[2];
  __int16 v15 = *a3;
  *(unsigned char *)(v14 + 8) = *((unsigned char *)a3 + 2);
  *(_WORD *)(v14 + 6) = v15;
  *(_WORD *)(v14 + 9) = uarpHtons(a4);
  if (a5 && a6) {
    memcpy((void *)(v14 + 11), a5, a6);
  }
  return uarpTransmitBuffer2(a1, a2, v13);
}

uint64_t uarpSendDownstreamEndpointDiscovery(uint64_t a1, uint64_t a2)
{
  int v4 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x15u, 6u, 1);
  if (!v4) {
    return 11;
  }
  return uarpTransmitBuffer2(a1, a2, (uint64_t)v4);
}

uint64_t uarpSendDownstreamEndpointReachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x17u, 8u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpSendDownstreamEndpointUnreachable(uint64_t a1, uint64_t a2, unsigned int a3)
{
  int v6 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x19u, 8u, 1);
  if (!v6) {
    return 11;
  }
  uint64_t v7 = (uint64_t)v6;
  uint64_t v8 = v6[2];
  *(_WORD *)(v8 + 6) = uarpHtons(a3);
  return uarpTransmitBuffer2(a1, a2, v7);
}

uint64_t uarpTransmitBufferUpstream(uint64_t a1, uint64_t a2, unsigned int a3, const void *a4, unsigned int a5)
{
  unsigned int v10 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Bu, (unsigned __int16)(a5 + 8), 1);
  if (!v10) {
    return 11;
  }
  uint64_t v11 = v10;
  uint64_t v12 = v10[2];
  *(_WORD *)(v12 + 6) = uarpHtons(a3);
  memcpy((void *)(v12 + 8), a4, a5);
  return uarpTransmitBuffer2(a1, a2, v11);
}

uint64_t uarpPlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int16 *a3, unsigned int a4)
{
  uint64_t v4 = 30;
  if (!a1 || !a2 || !a3) {
    return v4;
  }
  UARPLayer2LogPacket(a1, a2);
  if (a4 < 6) {
    return 9;
  }
  *a3 = uarpNtohs(*a3);
  a3[1] = uarpNtohs(a3[1]);
  unsigned __int16 v9 = uarpNtohs(a3[2]);
  a3[2] = v9;
  *(_WORD *)(a2 + 60) = v9;
  if (a3[1] + 6 != a4) {
    return 9;
  }
  uint64_t v4 = 1;
  *(unsigned char *)(a1 + 580) = 1;
  switch(*a3)
  {
    case 0u:
      if (!*(_DWORD *)(a1 + 552))
      {
        uarpPlatformEndpointSendSyncMsg(a1, a2);
        goto LABEL_183;
      }
      unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_165;
      }
      uint64_t v13 = 0;
      while (1)
      {
        uint64_t v14 = *(void *)(*(void *)(a2 + 120) + 8 * v13);
        if (v14)
        {
          if (!uarpNtohs(**(unsigned __int16 **)(v14 + 16)))
          {
            UARPLayer2WatchdogCancel(a1, a2);
            uarpTransmitQueuePendingEntryComplete(a1, a2, v14);
LABEL_165:
            *(void *)(a2 + 146) = 0;
            *(void *)(a2 + 138) = 0;
            *(void *)(a2 + 162) = 0;
            *(void *)(a2 + 154) = 0;
            int v123 = *(_DWORD *)(a1 + 552);
            if (v123 == 1
              || v123 == 2
              && !uarpPlatformEndpointIsMessageTypePending(a1, a2, 1)
              && *(void *)(a1 + 296))
            {
              uarpSendVersionDiscoveryRequest(a1, a2, *(unsigned __int16 *)(a2 + 12));
            }
            if (*(unsigned char *)(a2 + 14) == 1) {
              uarpPlatformReOfferFirmware(a1, a2);
            }
            goto LABEL_183;
          }
          unsigned int v12 = *(unsigned __int16 *)(a2 + 112);
        }
        if (++v13 >= (unint64_t)v12) {
          goto LABEL_165;
        }
      }
    case 1u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      unsigned int v15 = uarpNtohs(a3[3]);
      unsigned int v16 = *(unsigned __int16 *)(a1 + 12);
      if (v15 < v16) {
        unsigned int v16 = v15;
      }
      if (v16 <= 1) {
        __int16 v17 = 1;
      }
      else {
        __int16 v17 = v16;
      }
      *(_WORD *)(a2 + 48) = v17;
      UARPLayer2ProtocolVersion(a1, a2);
      uarpSendVersionDiscoveryResponse(a1, a2, *(_WORD *)(a2 + 48));
      goto LABEL_183;
    case 2u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v18 = uarpNtohs(a3[3]);
      a3[3] = v18;
      if (v18)
      {
        uint64_t v4 = 2;
        goto LABEL_184;
      }
      unsigned int v118 = uarpNtohs(a3[4]);
      if (v118 <= 1) {
        unsigned int v119 = 1;
      }
      else {
        unsigned int v119 = v118;
      }
      if (v119 >= 4) {
        LOWORD(v119) = 4;
      }
      *(_WORD *)(a2 + 48) = v119;
      unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
      if (!*(_WORD *)(a2 + 112)) {
        goto LABEL_182;
      }
      uint64_t v121 = 0;
      break;
    case 3u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      int v19 = uarpAllocPrepareTransmitBuffer2(a1, a2, 4u, 0x10u, 0);
      if (!v19) {
        goto LABEL_147;
      }
      long long v20 = v19;
      uint64_t v21 = v19[2];
      *(_DWORD *)(v21 + 8) = uarpNtohl(*(_DWORD *)(a3 + 3));
      *(_DWORD *)(v21 + 12) = *((_DWORD *)v20 + 6) - 16;
      int updated = uarpCallbackUpdateInformationTLV((void *)a1, a2, (_DWORD *)(v21 + 8));
      unsigned __int16 v23 = updated;
      if (updated)
      {
        __int16 v24 = 16;
      }
      else
      {
        __int16 v124 = *(_WORD *)(v21 + 12);
        *(_WORD *)(v21 + 2) = uarpHtons((unsigned __int16)(v124 + 10));
        *(_DWORD *)(v21 + 8) = uarpHtonl(*(_DWORD *)(v21 + 8));
        *(_DWORD *)(v21 + 12) = uarpHtonl(*(_DWORD *)(v21 + 12));
        __int16 v24 = v124 + 16;
      }
      *(_WORD *)(v21 + 6) = uarpHtons(v23);
      *((_WORD *)v20 + 14) = v24;
      goto LABEL_175;
    case 4u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      uint64_t v25 = uarpNtohs(a3[3]);
      int v26 = uarpNtohl(*((_DWORD *)a3 + 2));
      unsigned int v27 = uarpNtohl(*((_DWORD *)a3 + 3));
      uarpPlatformResponseAccessoryInfo(a1, a2, v25, v26, v27, (unsigned int *)a3 + 4);
      goto LABEL_183;
    case 5u:
      if (a4 < 0x24) {
        goto LABEL_94;
      }
      unsigned int v130 = 0;
      uarpTagStructUnpack32(*(unsigned int *)(a3 + 3), &v130);
      unsigned int v28 = uarpNtohs(a3[5]);
      uint64_t v29 = uarpNtohs(a3[6]);
      *(_OWORD *)v129 = 0uLL;
      uarpVersionEndianSwap((unsigned int *)(a3 + 7), v129);
      unsigned int v30 = uarpNtohl(*(_DWORD *)(a3 + 15));
      unsigned int v31 = uarpNtohs(a3[17]);
      v32 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xDu, 0x24u, 0);
      if (!v32) {
        goto LABEL_147;
      }
      uint64_t v33 = (uint64_t)v32;
      uint64_t v34 = v32[2];
      *(_DWORD *)(v34 + 6) = uarpTagStructPack32(&v130);
      *(_WORD *)(v34 + 10) = uarpHtons(v28);
      *(_WORD *)(v34 + 12) = uarpHtons(v29);
      uarpVersionEndianSwap(v129, (_DWORD *)(v34 + 14));
      *(_DWORD *)(v34 + 30) = uarpHtonl(v30);
      *(_WORD *)(v34 + 34) = uarpHtons(v31);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v33);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v35 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v29);
      if (v35 && !*(_DWORD *)(v35 + 8)) {
        goto LABEL_183;
      }
      uint64_t PreparedAsset = uarpPlatformFindPreparedAsset(a1, a2, v29, v28, (unsigned __int8 *)&v130);
      if (!PreparedAsset)
      {
        uint64_t PreparedAsset = uarpPlatformCreateRxAsset(a1, a2);
        if (!PreparedAsset) {
          goto LABEL_147;
        }
      }
      *(void *)(PreparedAsset + 452) = -1;
      *(_DWORD *)(PreparedAsset + 448) = uarpNtohs(a3[17]);
      *(_WORD *)(PreparedAsset + 44) = v29;
      *(_WORD *)(PreparedAsset + 46) = v28;
      *(_DWORD *)(PreparedAsset + 48) = v130;
      *(_OWORD *)(PreparedAsset + 52) = *(_OWORD *)v129;
      *(_DWORD *)(PreparedAsset + 68) = uarpNtohl(*(_DWORD *)(a3 + 15));
      __int16 v37 = *(_WORD *)(PreparedAsset + 46);
      if (v37)
      {
        UARPLayer2SuperBinaryOffered(a1, a2);
      }
      else
      {
        if ((v37 & 2) == 0)
        {
          uint64_t v4 = 22;
          goto LABEL_184;
        }
        UARPLayer2DynamicAssetOffered(a1, a2);
      }
      goto LABEL_183;
    case 6u:
      if (a4 < 0xE) {
        goto LABEL_94;
      }
      unsigned int v38 = uarpNtohs(a3[6]);
      if (*(_DWORD *)a2 >= v38) {
        unsigned __int16 v39 = v38;
      }
      else {
        unsigned __int16 v39 = *(_DWORD *)a2;
      }
      LOWORD(v129[0]) = v39;
      uint64_t v40 = uarpNtohl(*((_DWORD *)a3 + 2));
      int v41 = uarpNtohs(a3[3]);
      v42 = uarpAllocPrepareTransmitBuffer2(a1, a2, 7u, (unsigned __int16)(v39 + 18), 0);
      if (!v42) {
        goto LABEL_147;
      }
      long long v20 = v42;
      uint64_t v43 = v42[2];
      unsigned __int16 v44 = uarpPlatformAssetDataRequest(a1, a2, v41, v39, v40, (void *)(v43 + 18), (unsigned __int16 *)v129);
      *(_WORD *)(v43 + 6) = uarpHtons(v44);
      *(_WORD *)(v43 + 8) = a3[3];
      *(_DWORD *)(v43 + 10) = *((_DWORD *)a3 + 2);
      *(_WORD *)(v43 + 14) = a3[6];
      *(_WORD *)(v43 + 16) = uarpHtons(LOWORD(v129[0]));
      __int16 v45 = LOWORD(v129[0]) + 18;
      *(_WORD *)(v43 + 2) = uarpHtons((unsigned __int16)(LOWORD(v129[0]) + 12));
      *((_WORD *)v20 + 14) = v45;
LABEL_175:
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v20;
LABEL_176:
      uint64_t v11 = uarpTransmitBuffer2(v70, v71, v72);
      goto LABEL_177;
    case 7u:
      if (a4 < 0x12) {
        goto LABEL_94;
      }
      int v46 = uarpNtohs(a3[4]);
      uint64_t v47 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v46);
      if (!v47) {
        goto LABEL_149;
      }
      uint64_t v48 = v47;
      uint64_t v49 = uarpNtohs(a3[3]);
      int v50 = uarpNtohl(*(_DWORD *)(a3 + 5));
      int v51 = uarpNtohs(a3[7]);
      size_t v52 = uarpNtohs(a3[8]);
      unsigned int v53 = uarpPlatformAssetResponseData(a1, v48, v49, a3 + 9, v50, v51, v52);
      if (v53 == 29) {
        uint64_t v4 = 0;
      }
      else {
        uint64_t v4 = v53;
      }
      goto LABEL_184;
    case 8u:
      if (a4 < 8) {
        goto LABEL_94;
      }
      char v54 = uarpNtohs(a3[3]);
      v55 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xEu, 8u, 0);
      if (!v55) {
        goto LABEL_147;
      }
      *(_WORD *)(v55[2] + 6) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v55);
      if (v4) {
        goto LABEL_184;
      }
      if ((v54 & 1) != 0 && *(unsigned char *)(a2 + 56) == 1)
      {
        *(unsigned char *)(a2 + 56) = 0;
        uint64_t v11 = UARPLayer2DataTransferPause(a1, a2);
        goto LABEL_177;
      }
      if ((v54 & 2) == 0 || *(unsigned char *)(a2 + 56))
      {
        uint64_t v4 = 33;
        goto LABEL_184;
      }
      *(unsigned char *)(a2 + 56) = 1;
      uint64_t v11 = uarpPlatformDataTransferResume(a1, a2);
      goto LABEL_177;
    case 9u:
      if (a4 < 0xA) {
        goto LABEL_94;
      }
      unsigned int v56 = uarpNtohs(a3[3]);
      uint64_t v57 = uarpNtohs(a3[4]);
      uint64_t v58 = uarpPlatformAssetFindByAssetID(a1, a2, 1, v56);
      if (!v58) {
        goto LABEL_183;
      }
      v59 = (void *)v58;
      v129[0] = *(_DWORD *)(v58 + 48);
      __int16 v60 = *(_WORD *)(v58 + 46);
      v61 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFu, 0xAu, 0);
      if (!v61) {
        goto LABEL_147;
      }
      uint64_t v62 = (uint64_t)v61;
      uint64_t v63 = v61[2];
      *(_WORD *)(v63 + 6) = uarpHtons(v56);
      *(_WORD *)(v63 + 8) = uarpHtons(v57);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v62);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v4 = UARPLayer2AssetProcessingNotification2(a1, a2, v59, v57);
      if (v4) {
        goto LABEL_184;
      }
      if ((v60 & 2) != 0)
      {
        v64 = *(unsigned __int8 **)(a2 + 80);
        if (v64)
        {
          if (uarp4ccCompare((unsigned __int8 *)v129, v64))
          {
            if (*(_WORD *)(a2 + 28) == 1)
            {
              unint64_t v65 = 0;
            }
            else
            {
              unint64_t v127 = 0;
              do
              {
                *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127) = *(_DWORD *)(*(void *)(a2 + 80) + 4 * v127 + 4);
                unint64_t v65 = *(unsigned __int16 *)(a2 + 28) - 1;
                ++v127;
              }
              while (v127 < v65);
            }
            v128 = *(unsigned char **)(a2 + 80);
            *(_DWORD *)&v128[4 * v65] = 0;
            if (uarpAssetTagIsValid(v128)) {
              goto LABEL_189;
            }
          }
        }
      }
      goto LABEL_183;
    case 0xAu:
      LOWORD(v129[0]) = 0;
      unsigned __int16 v66 = UARPLayer2ApplyStagedAssets(a1, a2);
      uint64_t v4 = 11;
      v67 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xBu, 0xAu, 0);
      if (!v67) {
        goto LABEL_184;
      }
      v68 = v67;
      uint64_t v69 = v67[2];
      *(_WORD *)(v69 + 6) = uarpHtons(v66);
      *(_WORD *)(v69 + 8) = uarpHtons(LOWORD(v129[0]));
      uint64_t v70 = a1;
      uint64_t v71 = a2;
      uint64_t v72 = (uint64_t)v68;
      goto LABEL_176;
    case 0xBu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      uarpNtohs(a3[3]);
      uarpNtohs(a3[4]);
      uint64_t v11 = UARPLayer2ApplyStagedAssetsResponse(a1, a2);
      goto LABEL_177;
    case 0xCu:
      if (a4 < 8) {
        goto LABEL_94;
      }
      int v73 = uarpNtohs(a3[3]);
      v74 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x10u, 8u, 0);
      if (!v74) {
        goto LABEL_147;
      }
      *(_WORD *)(v74[2] + 6) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, (uint64_t)v74);
      if (!v4) {
        uarpPlatformAssetRescinded(a1, a2, v73);
      }
      goto LABEL_184;
    case 0xDu:
      BOOL v10 = a4 >= 0x24;
      goto LABEL_109;
    case 0xEu:
      if (a4 < 8) {
        goto LABEL_131;
      }
      char v75 = uarpNtohs(a3[3]);
      if (v75)
      {
        uint64_t v11 = UARPLayer2DataTransferPauseAck(a1, a2);
      }
      else
      {
        if ((v75 & 2) == 0)
        {
          uint64_t v4 = 26;
          goto LABEL_184;
        }
        uint64_t v11 = UARPLayer2DataTransferResumeAck(a1, a2);
      }
      goto LABEL_177;
    case 0xFu:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v76 = uarpNtohs(a3[3]);
      uarpNtohs(a3[4]);
      uint64_t v77 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v76);
      if (!v77) {
        goto LABEL_183;
      }
      uint64_t v78 = v77;
      uint64_t v4 = UARPLayer2AssetProcessingNotificationAck(a1, a2, v77);
      *(unsigned char *)(v78 + 72) = 1;
      goto LABEL_184;
    case 0x10u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      int v79 = uarpNtohs(a3[3]);
      if (v79 == 0xFFFF)
      {
        UARPLayer2RescindAllAssetsAck(a1, a2, 0);
        goto LABEL_183;
      }
      uint64_t v80 = uarpPlatformAssetFindByAssetID(a1, a2, 0, v79);
      if (v80)
      {
        UARPLayer2AssetRescindedAck(a1, a2, v80);
        goto LABEL_183;
      }
LABEL_149:
      uint64_t v4 = 17;
      goto LABEL_184;
    case 0x11u:
      if (a4 < 0xA)
      {
LABEL_94:
        uint64_t v4 = 9;
        goto LABEL_184;
      }
      v108 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x12u, 0xEu, 0);
      if (!v108)
      {
LABEL_147:
        uint64_t v4 = 11;
        goto LABEL_184;
      }
      uint64_t v109 = (uint64_t)v108;
      uint64_t v110 = v108[2];
      *(_DWORD *)(v110 + 6) = uarpHtonl(0);
      *(_DWORD *)(v110 + 10) = *(_DWORD *)(a3 + 3);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v109);
      if (v4) {
        goto LABEL_184;
      }
      v129[0] = *(_DWORD *)(a3 + 3);
      int v111 = uarpAssetQueueSolicitation(a1, a2, v129);
      if (v111 == 1)
      {
LABEL_189:
        UARPLayer2AssetSolicitation(a1, a2);
      }
      else if (v111 == 2)
      {
        uarpSendDynamicAssetPreProcessingStatus(a1, a2, v129, 2u, 3328);
      }
      goto LABEL_183;
    case 0x12u:
      BOOL v10 = a4 >= 0xE;
      goto LABEL_109;
    case 0x13u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      unsigned int v81 = uarpNtohs(a3[5]);
      unsigned int v82 = *(_DWORD *)(a3 + 3);
      v129[0] = v82;
      v83 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x14u, 0xCu, 0);
      if (!v83) {
        goto LABEL_147;
      }
      uint64_t v84 = (uint64_t)v83;
      uint64_t v85 = v83[2];
      *(_DWORD *)(v85 + 6) = v82;
      *(_WORD *)(v85 + 10) = uarpHtons(v81);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v84);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v86 = uarpPlatformAssetFindByTag(a1, a2, 0, (unsigned __int8 *)v129);
      if (v86)
      {
        *(unsigned char *)(v86 + 72) = 1;
        uint64_t v11 = UARPLayer2AssetPreProcessingNotification(a1, a2, v86);
        goto LABEL_177;
      }
      uint64_t v4 = 3;
      goto LABEL_184;
    case 0x14u:
      if (a4 < 0xC) {
        goto LABEL_131;
      }
      uarpNtohs(a3[5]);
      v129[0] = *(_DWORD *)(a3 + 3);
      uint64_t v87 = uarpPlatformAssetFindByTag(a1, a2, 1, (unsigned __int8 *)v129);
      if (v87)
      {
        *(unsigned char *)(v87 + 72) = 1;
        uint64_t v4 = UARPLayer2AssetPreProcessingNotificationAck(a1, a2, v87);
        if (v4 != 3) {
          goto LABEL_184;
        }
      }
      goto LABEL_183;
    case 0x15u:
      v88 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x16u, 8u, 0);
      if (!v88) {
        goto LABEL_147;
      }
      uint64_t v89 = (uint64_t)v88;
      uint64_t v90 = v88[2];
      *(_WORD *)(v90 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v89);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointDiscovery(a1, a2);
      goto LABEL_177;
    case 0x16u:
      BOOL v10 = a4 >= 8;
      goto LABEL_109;
    case 0x17u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v92 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x18u, 0xAu, 0);
      if (!v92) {
        goto LABEL_147;
      }
      uint64_t v93 = (uint64_t)v92;
      uint64_t v94 = v92[2];
      *(_WORD *)(v94 + 6) = uarpHtons(0);
      *(_WORD *)(v94 + 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v93);
      if (v4) {
        goto LABEL_184;
      }
      uint64_t v95 = uarpPlatformRemoteEndpointAlloc(a1);
      if (!v95) {
        goto LABEL_147;
      }
      v96 = (void *)v95;
      *(_WORD *)(v95 + 136) = uarpNtohs(a3[3]);
      v96[22] = a2;
      uint64_t v4 = fUarpLayer3DownstreamEndpointReachable(a1, a2);
      if (v4) {
        UARPLayer2ReturnBuffer(a1, v96);
      }
      goto LABEL_184;
    case 0x18u:
    case 0x1Cu:
      BOOL v10 = a4 >= 0xA;
LABEL_109:
      int v91 = !v10;
      uint64_t v4 = (8 * v91);
      goto LABEL_184;
    case 0x19u:
      if (a4 < 8) {
        goto LABEL_131;
      }
      v97 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Au, 0xAu, 0);
      if (!v97) {
        goto LABEL_147;
      }
      uint64_t v98 = (uint64_t)v97;
      int v99 = uarpNtohs(a3[3]);
      uint64_t v100 = UARPPlatformDownstreamEndpointByID(a1, a2, v99);
      uint64_t v101 = *(void *)(v98 + 16);
      if (v100) {
        unsigned int v102 = 0;
      }
      else {
        unsigned int v102 = 58;
      }
      *(_WORD *)(v101 + 6) = uarpHtons(v102);
      *(_WORD *)(v101 + 8) = a3[3];
      uint64_t v103 = uarpTransmitBuffer2(a1, a2, v98);
      uint64_t v4 = v103;
      if (!v100 || v103) {
        goto LABEL_184;
      }
      uint64_t v11 = fUarpLayer3DownstreamEndpointUnreachable(a1, a2);
      goto LABEL_177;
    case 0x1Au:
      if (a4 < 0xA) {
        goto LABEL_131;
      }
      int v104 = uarpHtons(a3[4]);
      if (!UARPPlatformDownstreamEndpointByID(a1, a2, v104)) {
        goto LABEL_194;
      }
      fUarpLayer3DownstreamEndpointReleased(a1, a2);
      goto LABEL_183;
    case 0x1Bu:
      if (a4 < 0xE) {
        goto LABEL_131;
      }
      v112 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Cu, 0xAu, 0);
      if (!v112) {
        goto LABEL_147;
      }
      uint64_t v113 = (uint64_t)v112;
      int v114 = uarpNtohs(a3[3]);
      uint64_t v115 = UARPPlatformDownstreamEndpointByID(a1, a2, v114);
      uint64_t v116 = *(void *)(v113 + 16);
      if (v115) {
        unsigned int v117 = 0;
      }
      else {
        unsigned int v117 = 58;
      }
      *(_WORD *)(v116 + 6) = uarpHtons(v117);
      *(_WORD *)(v116 + 8) = a3[3];
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v113);
      if (v4) {
        goto LABEL_184;
      }
      if (v115)
      {
        uint64_t v11 = fUarpLayer3DownstreamEndpointRecvMessage(a1, a2, v115);
        goto LABEL_177;
      }
      v126 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 400);
      if (v126) {
        v126(*(void *)(a1 + 544), 8, "UARP.LAYER2 <%s> Cannot find downstream endpoint", "uarpMsgRecvDownstreamEndpointMessage");
      }
      else {
        uarpLogError(8u, "UARP.LAYER2 <%s> Cannot find downstream endpoint", "uarpMsgRecvDownstreamEndpointMessage");
      }
LABEL_194:
      uint64_t v4 = 58;
      goto LABEL_184;
    case 0x1Du:
      v105 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0x1Eu, 8u, 0);
      if (!v105) {
        goto LABEL_147;
      }
      uint64_t v106 = (uint64_t)v105;
      uint64_t v107 = v105[2];
      *(_WORD *)(v107 + 6) = uarpHtons(0);
      uint64_t v4 = uarpTransmitBuffer2(a1, a2, v106);
      if (!v4) {
        fUarpLayer3NoFirmwareUpdateAvailable(a1, a2);
      }
      goto LABEL_184;
    case 0x1Eu:
      goto LABEL_183;
    default:
      if (*a3 != 0xFFFF) {
        goto LABEL_184;
      }
      if (a4 < 0xB)
      {
LABEL_131:
        uint64_t v4 = 8;
      }
      else
      {
        uarpNtohs(*(unsigned __int16 *)((char *)a3 + 9));
        uint64_t v11 = UARPLayer2VendorSpecificRecvMessage((void *)a1, a2);
LABEL_177:
        uint64_t v4 = v11;
      }
      goto LABEL_184;
  }
  while (1)
  {
    uint64_t v122 = *(void *)(*(void *)(a2 + 120) + 8 * v121);
    if (v122) {
      break;
    }
LABEL_161:
    if (++v121 >= (unint64_t)v120) {
      goto LABEL_182;
    }
  }
  if (uarpNtohs(**(unsigned __int16 **)(v122 + 16)) != 1)
  {
    unsigned int v120 = *(unsigned __int16 *)(a2 + 112);
    goto LABEL_161;
  }
  UARPLayer2WatchdogCancel(a1, a2);
  uarpTransmitQueuePendingEntryComplete(a1, a2, v122);
LABEL_182:
  UARPLayer2ProtocolVersion(a1, a2);
LABEL_183:
  uint64_t v4 = 0;
LABEL_184:
  *a3 = uarpHtons(*a3);
  a3[1] = uarpHtons(a3[1]);
  a3[2] = uarpHtons(a3[2]);
  uarpTransmitQueueProcessRecv(a1, a2, a3, a4);
  *(unsigned char *)(a1 + 580) = 0;
  uarpTransmitQueueService(a1, a2);
  uarpPlatformGarbageCollection(a1, a2);
  return v4;
}

__int16 *uarpOuiAppleGenericFeatures()
{
  uint64_t result = &word_1000428A7;
  word_1000428A7 = 2492;
  byte_1000428A9 = 99;
  return result;
}

uint64_t uarpApplePlatformEndpointRecvMessage(uint64_t a1, uint64_t a2, unsigned __int8 *a3, int a4, unsigned int *a5, unsigned int a6)
{
  uint64_t result = 30;
  if (!a1 || !a2 || !a3 || !a5) {
    return result;
  }
  word_1000428A7 = 2492;
  byte_1000428A9 = 99;
  if (!uarpOuiCompare(a3, (unsigned __int8 *)&word_1000428A7)) {
    return 9;
  }
  if (a4 != 33)
  {
    if (a4 == 32 && a6 >= 4)
    {
      int v12 = *(_DWORD *)a2;
      uint64_t v13 = uarpAllocPrepareTransmitBuffer2(a1, a2, 0xFFFFu, (unsigned __int16)*(_DWORD *)a2, 0);
      if (!v13) {
        return 11;
      }
      uint64_t v14 = (uint64_t)v13;
      uint64_t v15 = v13[2];
      word_1000428A7 = 2492;
      byte_1000428A9 = 99;
      *(_WORD *)(v15 + 6) = 2492;
      *(unsigned char *)(v15 + 8) = 99;
      *(_WORD *)(v15 + 9) = uarpHtons(0x21u);
      unsigned int v16 = *(void **)(a1 + 40);
      unsigned int v46 = 0;
      unsigned int v17 = uarpNtohl(*a5);
      int v18 = (unint64_t *)(v15 + 23);
      uint64_t v19 = (v12 - 23);
      switch(v17)
      {
        case 1u:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[1];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 1;
          goto LABEL_90;
        case 2u:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[3];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 2;
          goto LABEL_90;
        case 3u:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[5];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 3;
          goto LABEL_90;
        case 4u:
          uint64_t v29 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, unsigned int *))v16[7];
          if (!v29) {
            goto LABEL_91;
          }
          unsigned int v30 = v29(*(void *)(a1 + 544), 4, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) < 4u) {
            break;
          }
          unsigned int v31 = v46;
          if (v46 != 8) {
            goto LABEL_74;
          }
LABEL_41:
          *int v18 = uarpHtonll(*v18);
          break;
        case 5u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[9];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 5;
          goto LABEL_72;
        case 6u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[11];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 6;
          goto LABEL_72;
        case 7u:
          uint64_t v35 = (uint64_t (*)(void, uint64_t, uint64_t, uint64_t, unsigned int *))v16[13];
          if (!v35) {
            goto LABEL_91;
          }
          unsigned int v30 = v35(*(void *)(a1 + 544), 7, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) >= 4u && v46 == 8) {
            goto LABEL_41;
          }
          break;
        case 8u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[17];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 8;
          goto LABEL_72;
        case 9u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[19];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 9;
          goto LABEL_72;
        case 0xAu:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[21];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 10;
          goto LABEL_72;
        case 0xBu:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[23];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 11;
          goto LABEL_72;
        case 0xCu:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[25];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 12;
          goto LABEL_90;
        case 0xDu:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[27];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 13;
          goto LABEL_90;
        case 0xEu:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[29];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 14;
          goto LABEL_90;
        case 0xFu:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[31];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 15;
          goto LABEL_90;
        case 0x10u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[33];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 16;
          goto LABEL_72;
        case 0x11u:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[35];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 17;
          goto LABEL_90;
        case 0x12u:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[37];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 18;
          goto LABEL_90;
        case 0x13u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[39];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 19;
          goto LABEL_72;
        case 0x14u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[41];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 20;
          goto LABEL_72;
        case 0x15u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[43];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 21;
          goto LABEL_72;
        case 0x16u:
          v32 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[45];
          if (!v32) {
            goto LABEL_91;
          }
          uint64_t v33 = *(void *)(a1 + 544);
          uint64_t v34 = 22;
LABEL_72:
          unsigned int v30 = v32(v33, v34, v15 + 23, v19, &v46);
          if (*(unsigned __int16 *)(a2 + 48) < 4u) {
            break;
          }
          unsigned int v31 = v46;
LABEL_74:
          if (v31 == 4) {
            *(_DWORD *)int v18 = uarpHtonl(*(_DWORD *)v18);
          }
          break;
        case 0x17u:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[47];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 23;
          goto LABEL_90;
        case 0x18u:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[49];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 24;
          goto LABEL_90;
        case 0x19u:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[51];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 25;
          goto LABEL_90;
        case 0x1Au:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[53];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 26;
          goto LABEL_90;
        case 0x1Bu:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[55];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 27;
          goto LABEL_90;
        case 0x1Cu:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[57];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 28;
          goto LABEL_90;
        case 0x1Du:
          long long v20 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, unsigned int *))v16[15];
          if (!v20) {
            goto LABEL_91;
          }
          uint64_t v21 = *(void *)(a1 + 544);
          uint64_t v22 = 29;
LABEL_90:
          unsigned int v30 = v20(v21, v22, v15 + 23, v19, &v46);
          break;
        default:
LABEL_91:
          unsigned int v30 = 26;
          break;
      }
      *(_DWORD *)(v15 + 11) = uarpHtonl(v30);
      *(_DWORD *)(v15 + 15) = uarpHtonl(v17);
      *(_DWORD *)(v15 + 19) = uarpHtonl(v46);
      __int16 v36 = v46 + 23;
      *(_WORD *)(v15 + 2) = uarpHtons((unsigned __int16)(v46 + 17));
      *(_WORD *)(v14 + 28) = v36;
      return uarpTransmitBuffer2(a1, a2, v14);
    }
    return 9;
  }
  if (a6 < 4) {
    return 9;
  }
  if (a6 < 0xC) {
    return 8;
  }
  int v23 = uarpNtohl(a5[1]);
  uint64_t v24 = uarpNtohl(a5[2]);
  if ((int)v24 + 12 > a6) {
    return 8;
  }
  uint64_t v25 = v24;
  if (v24) {
    int v26 = (unint64_t *)(a5 + 3);
  }
  else {
    int v26 = 0;
  }
  unsigned int v27 = *(void **)(a1 + 40);
  switch(v23)
  {
    case 1:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[2];
      if (v28) {
        goto LABEL_118;
      }
      return 1;
    case 2:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[4];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 3:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[6];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 4:
      uint64_t v38 = v27[8];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 8);
      if (!v38) {
        return 1;
      }
      if (v24 == 8) {
        goto LABEL_107;
      }
      if (v24 != 4) {
        goto LABEL_117;
      }
      break;
    case 5:
      unsigned __int16 v39 = (void (*)(void, void, unint64_t *, uint64_t))v27[10];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 10);
      unsigned int v28 = v39;
      if (!v39) {
        return 1;
      }
      goto LABEL_115;
    case 6:
      uint64_t v40 = (void (*)(void, void, unint64_t *, uint64_t))v27[12];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 12);
      unsigned int v28 = v40;
      if (!v40) {
        return 1;
      }
      goto LABEL_115;
    case 7:
      int v41 = (void (*)(void, void, unint64_t *, uint64_t))v27[14];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 14);
      unsigned int v28 = v41;
      if (!v41) {
        return 1;
      }
      if (v24 != 8) {
        goto LABEL_118;
      }
LABEL_107:
      *int v26 = uarpNtohll(*v26);
      goto LABEL_117;
    case 8:
      v42 = (void (*)(void, void, unint64_t *, uint64_t))v27[18];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 18);
      unsigned int v28 = v42;
      if (!v42) {
        return 1;
      }
      goto LABEL_115;
    case 9:
      uint64_t v43 = (void (*)(void, void, unint64_t *, uint64_t))v27[20];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 20);
      unsigned int v28 = v43;
      if (!v43) {
        return 1;
      }
      goto LABEL_115;
    case 10:
      unsigned __int16 v44 = (void (*)(void, void, unint64_t *, uint64_t))v27[22];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 22);
      unsigned int v28 = v44;
      if (!v44) {
        return 1;
      }
      goto LABEL_115;
    case 11:
      __int16 v45 = (void (*)(void, void, unint64_t *, uint64_t))v27[24];
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 24);
      unsigned int v28 = v45;
      if (!v45) {
        return 1;
      }
LABEL_115:
      if (v24 == 4) {
        break;
      }
      goto LABEL_118;
    case 12:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[26];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 13:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[28];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 14:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[30];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 15:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[32];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 16:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[34];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 34);
      break;
    case 17:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[36];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 18:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[38];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 19:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[40];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 40);
      break;
    case 20:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[42];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 42);
      break;
    case 21:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[44];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 44);
      break;
    case 22:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[46];
      if (!v28) {
        return 1;
      }
      if (v24 != 4) {
        goto LABEL_118;
      }
      __int16 v37 = (void (**)(void, void, unint64_t *, uint64_t))(v27 + 46);
      break;
    case 23:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[48];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 24:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[50];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 25:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[52];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 26:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[54];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 27:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[56];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 28:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[58];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    case 29:
      unsigned int v28 = (void (*)(void, void, unint64_t *, uint64_t))v27[16];
      if (!v28) {
        return 1;
      }
      goto LABEL_118;
    default:
      return 1;
  }
  *(_DWORD *)int v26 = uarpNtohl(*(_DWORD *)v26);
LABEL_117:
  unsigned int v28 = *v37;
LABEL_118:
  v28(*(void *)(a1 + 544), *(void *)(a2 + 40), v26, v25);
  return 0;
}

BOOL uarpApplePlatformMessageCheckExpectedResponse(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  if (a6 < 0xB) {
    return 0;
  }
  if (*(unsigned __int16 *)(a5 + 6) != *(unsigned __int16 *)(a3 + 6)
    || *(unsigned __int8 *)(a5 + 8) != *(unsigned __int8 *)(a3 + 8))
  {
    return 0;
  }
  word_1000428A7 = 2492;
  byte_1000428A9 = 99;
  BOOL v10 = *(_WORD *)(a5 + 6) == 2492 && *(unsigned char *)(a5 + 8) == 99;
  if (!v10 || uarpNtohs(*(unsigned __int16 *)(a5 + 9)) != 33) {
    return 0;
  }
  int v12 = uarpNtohs(*(unsigned __int16 *)(a3 + 9));
  BOOL result = 0;
  if (a6 >= 0x17 && v12 == 32) {
    return *(_DWORD *)(a5 + 15) == *(_DWORD *)(a3 + 11);
  }
  return result;
}

uint64_t uarpApplePlatformMessageCheckValidToSend(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = *(void *)(a1 + 40);
  if (!v4) {
    return 1;
  }
  word_1000428A7 = 2492;
  byte_1000428A9 = 99;
  if (*(_WORD *)(a3 + 6) != 2492 || *(unsigned char *)(a3 + 8) != 99) {
    return 1;
  }
  int v11 = uarpNtohs(*(unsigned __int16 *)(a3 + 9));
  uint64_t result = 1;
  if (a4 >= 0xF && v11 == 32)
  {
    if (uarpNtohl(*(_DWORD *)(a3 + 11)) == 2
      && (*(unsigned __int16 *)(a2 + 48) < 2u || *(_DWORD *)(a2 + 24)))
    {
      int v12 = *(void (**)(void, void, void, void))(v4 + 32);
      if (v12) {
LABEL_14:
      }
        v12(*(void *)(a1 + 544), *(void *)(a2 + 40), 0, 0);
    }
    else
    {
      if (uarpNtohl(*(_DWORD *)(a3 + 11)) != 1
        || *(unsigned __int16 *)(a2 + 48) >= 2u && !*(_DWORD *)(a2 + 24))
      {
        return 1;
      }
      int v12 = *(void (**)(void, void, void, void))(v4 + 16);
      if (v12) {
        goto LABEL_14;
      }
    }
    return 0;
  }
  return result;
}

uint64_t uarpApplePlatformMessageExceededRetries(uint64_t result, uint64_t a2, uint64_t a3, unsigned int a4)
{
  uint64_t v4 = *(void **)(result + 40);
  if (v4)
  {
    word_1000428A7 = 2492;
    byte_1000428A9 = 99;
    if (*(_WORD *)(a3 + 6) == 2492 && *(unsigned char *)(a3 + 8) == 99)
    {
      uint64_t v9 = result;
      uint64_t result = uarpHtons(*(unsigned __int16 *)(a3 + 9));
      if (a4 >= 0xF && result == 32)
      {
        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
        if (result == 1)
        {
          BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[2];
          if (!v10) {
            return result;
          }
        }
        else
        {
          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
          if (result == 2)
          {
            BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[4];
            if (!v10) {
              return result;
            }
          }
          else
          {
            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
            if (result == 3)
            {
              BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[6];
              if (!v10) {
                return result;
              }
            }
            else
            {
              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
              if (result == 4)
              {
                BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[8];
                if (!v10) {
                  return result;
                }
              }
              else
              {
                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                if (result == 5)
                {
                  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[10];
                  if (!v10) {
                    return result;
                  }
                }
                else
                {
                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                  if (result == 6)
                  {
                    BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[12];
                    if (!v10) {
                      return result;
                    }
                  }
                  else
                  {
                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                    if (result == 7)
                    {
                      BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[14];
                      if (!v10) {
                        return result;
                      }
                    }
                    else
                    {
                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                      if (result == 29)
                      {
                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[16];
                        if (!v10) {
                          return result;
                        }
                      }
                      else
                      {
                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                        if (result == 8)
                        {
                          BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[18];
                          if (!v10) {
                            return result;
                          }
                        }
                        else
                        {
                          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                          if (result == 9)
                          {
                            BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[20];
                            if (!v10) {
                              return result;
                            }
                          }
                          else
                          {
                            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                            if (result == 10)
                            {
                              BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[22];
                              if (!v10) {
                                return result;
                              }
                            }
                            else
                            {
                              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                              if (result == 11)
                              {
                                BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[24];
                                if (!v10) {
                                  return result;
                                }
                              }
                              else
                              {
                                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                if (result == 12)
                                {
                                  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[26];
                                  if (!v10) {
                                    return result;
                                  }
                                }
                                else
                                {
                                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                  if (result == 13)
                                  {
                                    BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[28];
                                    if (!v10) {
                                      return result;
                                    }
                                  }
                                  else
                                  {
                                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                    if (result == 14)
                                    {
                                      BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[30];
                                      if (!v10) {
                                        return result;
                                      }
                                    }
                                    else
                                    {
                                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                      if (result == 15)
                                      {
                                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[32];
                                        if (!v10) {
                                          return result;
                                        }
                                      }
                                      else
                                      {
                                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                        if (result == 16)
                                        {
                                          BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[34];
                                          if (!v10) {
                                            return result;
                                          }
                                        }
                                        else
                                        {
                                          uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                          if (result == 17)
                                          {
                                            BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[36];
                                            if (!v10) {
                                              return result;
                                            }
                                          }
                                          else
                                          {
                                            uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                            if (result == 18)
                                            {
                                              BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[38];
                                              if (!v10) {
                                                return result;
                                              }
                                            }
                                            else
                                            {
                                              uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                              if (result == 19)
                                              {
                                                BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[40];
                                                if (!v10) {
                                                  return result;
                                                }
                                              }
                                              else
                                              {
                                                uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                if (result == 20)
                                                {
                                                  BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[42];
                                                  if (!v10) {
                                                    return result;
                                                  }
                                                }
                                                else
                                                {
                                                  uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                  if (result == 21)
                                                  {
                                                    BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[44];
                                                    if (!v10) {
                                                      return result;
                                                    }
                                                  }
                                                  else
                                                  {
                                                    uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                    if (result == 22)
                                                    {
                                                      BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[46];
                                                      if (!v10) {
                                                        return result;
                                                      }
                                                    }
                                                    else
                                                    {
                                                      uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                      if (result == 23)
                                                      {
                                                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[48];
                                                        if (!v10) {
                                                          return result;
                                                        }
                                                      }
                                                      else
                                                      {
                                                        uint64_t result = uarpHtonl(*(_DWORD *)(a3 + 11));
                                                        if (result != 24) {
                                                          return result;
                                                        }
                                                        BOOL v10 = (uint64_t (*)(uint64_t, uint64_t, void, void))v4[50];
                                                        if (!v10) {
                                                          return result;
                                                        }
                                                      }
                                                    }
                                                  }
                                                }
                                              }
                                            }
                                          }
                                        }
                                      }
                                    }
                                  }
                                }
                              }
                            }
                          }
                        }
                      }
                    }
                  }
                }
              }
            }
          }
        }
        uint64_t v11 = *(void *)(v9 + 544);
        uint64_t v12 = *(void *)(a2 + 40);
        return v10(v11, v12, 0, 0);
      }
    }
  }
  return result;
}

uint64_t uarpCompressionHeaderEndianSwap(unsigned __int16 *a1, uint64_t a2)
{
  *(_WORD *)a2 = uarpHtons(*a1);
  *(_DWORD *)(a2 + 2) = uarpHtonl(*(_DWORD *)(a1 + 1));
  *(_WORD *)(a2 + 6) = uarpHtons(a1[3]);
  uint64_t result = uarpHtons(a1[4]);
  *(_WORD *)(a2 + 8) = result;
  return result;
}

char *uarpAssetTagChdr4cc()
{
  uint64_t result = aChdr;
  aChdr[4] = 0;
  return result;
}

uint64_t uarpAssetTagChdr()
{
  aChdr[4] = 0;
  return uarpPayloadTagPack((unsigned int *)aChdr);
}

int *uarpAssetTagStructChdr()
{
  aChdr[4] = 0;
  uint64_t result = &dword_1000428AC;
  dword_1000428AC = *(_DWORD *)aChdr;
  return result;
}

uint64_t uarpPayloadTagPack(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpPayloadTagUnpack(uint64_t result, char *a2)
{
  unsigned int v2 = result >> 8;
  unsigned int v3 = WORD1(result);
  if (result) {
    char v4 = result;
  }
  else {
    char v4 = 48;
  }
  if (!result)
  {
    LOBYTE(v2) = 48;
    LOBYTE(v3) = 48;
  }
  *a2 = v4;
  a2[1] = v2;
  if (result) {
    char v5 = BYTE3(result);
  }
  else {
    char v5 = 48;
  }
  a2[2] = v3;
  a2[3] = v5;
  return result;
}

unsigned char *uarpPayloadTagStructPack(unsigned char *result, unsigned char *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

unsigned char *uarpPayloadTagStructUnpack(unsigned char *result, unsigned char *a2)
{
  *a2 = *result;
  a2[1] = result[1];
  a2[2] = result[2];
  a2[3] = result[3];
  return result;
}

uint64_t uarpTagStructPack32(unsigned int *a1)
{
  return *a1;
}

uint64_t uarpTagStructUnpack32(uint64_t result, _DWORD *a2)
{
  *a2 = result;
  return result;
}

BOOL uarp4ccCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

BOOL uarpOuiCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

uint64_t uarpVersionCompare(_DWORD *a1, _DWORD *a2)
{
  if (*a1 > *a2) {
    return 2;
  }
  if (*a1 < *a2) {
    return 1;
  }
  unsigned int v2 = a1[1];
  unsigned int v3 = a2[1];
  if (v2 > v3) {
    return 2;
  }
  if (v2 < v3) {
    return 1;
  }
  unsigned int v4 = a1[2];
  unsigned int v5 = a2[2];
  if (v4 > v5) {
    return 2;
  }
  if (v4 < v5) {
    return 1;
  }
  unsigned int v7 = a1[3];
  unsigned int v8 = a2[3];
  BOOL v9 = v7 >= v8;
  BOOL v10 = v7 == v8;
  BOOL v11 = v7 < v8;
  if (!v10 && v9) {
    return 2;
  }
  else {
    return v11;
  }
}

uint64_t uarpAssetCompare(uint64_t a1, uint64_t a2)
{
  if (*(unsigned __int16 *)(a1 + 46) == *(unsigned __int16 *)(a2 + 46)
    && *(unsigned __int8 *)(a1 + 48) == *(unsigned __int8 *)(a2 + 48)
    && *(unsigned __int8 *)(a1 + 49) == *(unsigned __int8 *)(a2 + 49)
    && *(unsigned __int8 *)(a1 + 50) == *(unsigned __int8 *)(a2 + 50)
    && *(unsigned __int8 *)(a1 + 51) == *(unsigned __int8 *)(a2 + 51)
    && *(_DWORD *)(a1 + 68) == *(_DWORD *)(a2 + 68)
    && *(_DWORD *)(a1 + 448) == *(_DWORD *)(a2 + 448))
  {
    return uarpVersionCompare((_DWORD *)(a1 + 52), (_DWORD *)(a2 + 52));
  }
  else
  {
    return 3;
  }
}

BOOL uarpAssetTagCompare(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t uarpVersionEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpNtohl(*a1);
  a2[1] = uarpNtohl(a1[1]);
  a2[2] = uarpNtohl(a1[2]);
  uint64_t result = uarpNtohl(a1[3]);
  a2[3] = result;
  return result;
}

const char *uarpStatusCodeToString(unsigned int a1)
{
  if (a1 > 0x3E) {
    return "<unknown>";
  }
  else {
    return (&off_100038818)[a1];
  }
}

BOOL uarpAssetTagIsValid(unsigned char *a1)
{
  return *a1 || a1[1] || a1[2] || a1[3];
}

int *uarpAssetTagStructSuperBinary()
{
  uint64_t result = &dword_1000428B0;
  dword_1000428B0 = 0;
  return result;
}

const char *uarpApplyFlagsToString(int a1)
{
  if ((a1 - 1) > 5) {
    return "<unknown>";
  }
  else {
    return (&off_100038A10)[a1 - 1];
  }
}

const char *uarpProcessingFlagsReasonToString(int a1)
{
  HIDWORD(v2) = a1;
  LODWORD(v2) = a1 - 256;
  unsigned int v1 = v2 >> 8;
  if (v1 > 0xE) {
    return "<unknown>";
  }
  else {
    return (&off_100038A40)[v1];
  }
}

const char *uarpProcessingStatusToString(int a1)
{
  if ((a1 - 1) > 4) {
    return "<unknown>";
  }
  else {
    return (&off_100038AB8)[(__int16)(a1 - 1)];
  }
}

long long *uarpStageStatusToString(unsigned __int16 a1)
{
  unsigned int v1 = "Upload Denied";
  switch((char)a1)
  {
    case 1:
      strcpy((char *)xmmword_1000428B4, "Upload Complete");
      return xmmword_1000428B4;
    case 2:
      goto LABEL_7;
    case 3:
      unsigned int v1 = "Upload Abandoned";
      goto LABEL_7;
    case 4:
      unsigned int v1 = "Asset Corrupt";
      goto LABEL_7;
    case 5:
      unsigned int v1 = "Asset Not Found";
      goto LABEL_7;
    default:
      unsigned int v1 = "<unknown>";
LABEL_7:
      unint64_t v2 = uarpProcessingFlagsReasonToString(a1 & 0xFF00);
      snprintf((char *)xmmword_1000428B4, 0x100uLL, "%s (%s)", v1, v2);
      return xmmword_1000428B4;
  }
}

const char *uarpEndpointRoleToString(unsigned int a1)
{
  if (a1 > 2) {
    return "<unknown>";
  }
  else {
    return (&off_100038B28)[a1];
  }
}

const char *uarpLoggingCategoryToString(unsigned int a1)
{
  if (a1 > 8) {
    return "<unknown>";
  }
  else {
    return (&off_100038AE0)[a1];
  }
}

void *uarpProcessPayloadTLVInternal(void *result, uint64_t a2, uint64_t a3, signed int a4, uint64_t a5, unsigned int *a6)
{
  uint64_t v10 = (uint64_t)result;
  if (a4 != -858619624)
  {
    if (a4 == -858619625)
    {
      if (a5 == 2)
      {
        uint64_t v12 = uarpNtohs(*(unsigned __int16 *)a6);
        *(_DWORD *)(a3 + 76) = v12;
        UARPLayer2HashInfo(v10, v12, (_DWORD *)(a3 + 88), (_DWORD *)(a3 + 104));
        unsigned int v13 = *(_DWORD *)(a3 + 88);
        if (!v13 || !UARPLayer2RequestBuffer(v10, (void *)(a3 + 80), v13) && *(void *)(a3 + 80))
        {
          unsigned int v14 = *(_DWORD *)(a3 + 104);
          if (!v14 || !UARPLayer2RequestBuffer(v10, (void *)(a3 + 96), v14) && *(void *)(a3 + 96))
          {
            uint64_t v19 = *(unsigned int *)(a3 + 76);
            uint64_t v20 = *(void *)(a3 + 80);
            return (void *)UARPLayer2HashInit(v10, v19, v20);
          }
        }
        *(_DWORD *)(a3 + 76) = 0;
      }
LABEL_11:
      return (void *)UARPLayer2AssetCorrupt(v10, a2);
    }
    if (*(_DWORD *)(a3 + 76))
    {
      int v22 = uarpHtonl(a4);
      UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v22, 4);
      int v21 = uarpHtonl(a5);
      UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)&v21, 4);
      uint64_t result = (void *)UARPLayer2HashUpdate(v10, *(unsigned int *)(a3 + 76), *(void *)(a3 + 80), (uint64_t)a6, a5);
    }
    if (a4 > -858619631)
    {
      if (a4 == -858619630)
      {
        if (a5 == 2)
        {
          uint64_t result = (void *)uarpNtohs(*(unsigned __int16 *)a6);
          *(_DWORD *)(a3 + 56) = result;
          return result;
        }
      }
      else
      {
        if (a4 != -858619623) {
          return result;
        }
        if (a5 == 4)
        {
          uint64_t result = (void *)uarpNtohl(*a6);
          *(_DWORD *)(a3 + 128) = result;
          return result;
        }
      }
    }
    else if (a4 == -858619641)
    {
      *(_DWORD *)(a3 + 72) = a5;
      int v18 = (void **)(a3 + 64);
      if (!UARPLayer2RequestBuffer(v10, (void *)(a3 + 64), a5) && *v18) {
        return memcpy(*v18, a6, *(unsigned int *)(a3 + 72));
      }
    }
    else
    {
      if (a4 != -858619636) {
        return result;
      }
      if (a5 == 4)
      {
        uint64_t result = (void *)uarpNtohl(*a6);
        if (result)
        {
          *(unsigned char *)(a3 + 52) = 1;
          if (!*(void *)(a2 + 656))
          {
            uint64_t result = (void *)UARPLayer2RequestBuffer(v10, (void *)(a2 + 656), *(_DWORD *)(a2 + 648));
            if (*(void *)(a2 + 656))
            {
              *(_DWORD *)(a2 + 664) = *(_DWORD *)(a2 + 648);
              *(unsigned char *)(a2 + 668) = 0;
            }
          }
          return result;
        }
      }
    }
    return (void *)UARPLayer2AssetCorrupt(v10, a2);
  }
  *(_DWORD *)(a3 + 120) = a5;
  uint64_t v15 = (void **)(a3 + 112);
  if (UARPLayer2RequestBuffer((uint64_t)result, (void *)(a3 + 112), a5)) {
    goto LABEL_11;
  }
  unsigned int v16 = *v15;
  if (!*v15) {
    goto LABEL_11;
  }
  size_t v17 = *(unsigned int *)(a3 + 120);
  return memcpy(v16, a6, v17);
}

uint64_t uarpAssetSuperBinaryVersionForProtocolVersion(unsigned int a1)
{
  if (a1 < 3) {
    return 2;
  }
  else {
    return 3;
  }
}

uint64_t uarpDownstreamEndpointGetID(uint64_t a1, _WORD *a2)
{
  uint64_t result = 30;
  if (a1)
  {
    if (a2)
    {
      uint64_t result = 0;
      *a2 = *(_WORD *)(a1 + 136);
    }
  }
  return result;
}

void uarpPrintDataResponseDetails(uint64_t a1, uint64_t a2, uint64_t a3, unsigned int a4, int a5, int a6, int a7)
{
  uint64_t v12 = *(void (**)(uint64_t, uint64_t, const char *, ...))(a1 + 408);
  if (v12)
  {
    uint64_t v13 = *(void *)(a1 + 544);
    uint64_t v14 = *(int *)(a1 + 552);
    if (v14 > 2) {
      uint64_t v15 = "<unknown>";
    }
    else {
      uint64_t v15 = (&off_100038B28)[v14];
    }
    int v18 = uarpStatusCodeToString(a4);
    v12(v13, 1, "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u", v15, v18, a5, a6, a7);
  }
  else
  {
    uint64_t v16 = *(int *)(a1 + 552);
    if (v16 > 2) {
      size_t v17 = "<unknown>";
    }
    else {
      size_t v17 = (&off_100038B28)[v16];
    }
    uint64_t v19 = uarpStatusCodeToString(a4);
    uarpLogInfo(1u, "<ROLE=%s> UARP.LAYER2.DATA.RESP status=<%s>, offset=0x%08x, requestedlength=%u, respondedlength=%u", v17, v19, a5, a6, a7);
  }
  uint64_t v20 = *(void (**)(void, uint64_t, const char *, ...))(a1 + 408);
  if (v20)
  {
    uint64_t v21 = *(int *)(a1 + 552);
    if (v21 > 2) {
      int v22 = "<unknown>";
    }
    else {
      int v22 = (&off_100038B28)[v21];
    }
    if (*(unsigned char *)(a3 + 80) == 1) {
      uint64_t v25 = "YES";
    }
    else {
      uint64_t v25 = "NO";
    }
    v20(*(void *)(a1 + 544), 1, "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u", v22, v25, *(_DWORD *)(a3 + 92), *(_DWORD *)(a3 + 96));
  }
  else
  {
    uint64_t v23 = *(int *)(a1 + 552);
    if (v23 > 2) {
      uint64_t v24 = "<unknown>";
    }
    else {
      uint64_t v24 = (&off_100038B28)[v23];
    }
    if (*(unsigned char *)(a3 + 80) == 1) {
      int v26 = "YES";
    }
    else {
      int v26 = "NO";
    }
    uarpLogInfo(1u, "<ROLE=%s> UARP.LAYER2.DATA.RESP Outstanding Data Request <%s>, offset=0x%08x, requestedlength=%u", v24, v26, *(_DWORD *)(a3 + 92), *(_DWORD *)(a3 + 96));
  }
}

uint64_t uarpCopyDefaultInfoString(_DWORD *a1, uint64_t a2)
{
  if (a2 < 7) {
    return 0;
  }
  *(_DWORD *)((char *)a1 + 3) = 1314344782;
  *a1 = 1313558101;
  return a2;
}

uint64_t UARPSuperBinarySetupHeader(uint64_t a1, uint64_t a2, unsigned int a3, _OWORD *a4, int a5)
{
  BOOL v9 = (void *)uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  uint64_t result = 30;
  if (a3 >= 2)
  {
    if (v9)
    {
      memset(v14, 0, 44);
      uarpZero(v14, 0x2CuLL);
      *(void *)&v14[0] = 0x2C00000002;
      *(_OWORD *)((char *)v14 + 12) = *a4;
      DWORD1(v14[2]) = 44;
      DWORD2(v14[2]) = 40 * a5;
      HIDWORD(v14[1]) = 40 * a5 + 44;
      DWORD2(v14[0]) = HIDWORD(v14[1]);
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v9, (uint64_t)v14, 44, 0);
      if (!result)
      {
        if (a5)
        {
          uint64_t v11 = 44;
          while (1)
          {
            uint64_t v13 = 0;
            memset(v12, 0, sizeof(v12));
            uarpZero(v12, 0x28uLL);
            LODWORD(v12[0]) = 40;
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v9, (uint64_t)v12, 40, v11);
            if (result) {
              break;
            }
            uint64_t v11 = (v11 + 40);
            if (!--a5) {
              return 0;
            }
          }
        }
        else
        {
          return 0;
        }
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddMetaData(uint64_t a1, uint64_t a2, unsigned int a3, unsigned int a4, uint64_t a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30;
  }
  uint64_t v10 = (void *)v9;
  unsigned int __dst = 0;
  LOWORD(v18[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v18);
  int v12 = result;
  if (LOWORD(v18[0]) == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || LOWORD(v18[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  memset(v18, 0, 44);
  unsigned __int16 v17 = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v18, 44, 0, &v17);
  if (!result)
  {
    if (v17 == 44)
    {
      uint64_t v14 = (LODWORD(v18[2]) + HIDWORD(v18[1]));
      v16[0] = uarpHtonl(a3);
      v16[1] = uarpHtonl(a4);
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v16, 8, v14);
      if (!result)
      {
        LODWORD(v18[2]) += 8;
        DWORD2(v18[0]) += 8;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, a5, (unsigned __int16)a4, (HIDWORD(v18[1]) + LODWORD(v18[2])));
        if (!result)
        {
          LODWORD(v18[2]) += (unsigned __int16)a4;
          DWORD2(v18[0]) += (unsigned __int16)a4;
          return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v18, 44, 0);
        }
      }
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryPreparePayload(uint64_t a1, uint64_t a2, int a3, unsigned int *a4, _OWORD *a5)
{
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30;
  }
  uint64_t v10 = (void *)v9;
  unsigned int __dst = 0;
  LOWORD(v16[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v16);
  int v12 = result;
  if (LOWORD(v16[0]) == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || LOWORD(v16[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v19 = 0;
  uint64_t v18 = 0;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v16, 44, 0, &v19);
  if (!result)
  {
    if (v19 != 44) {
      return 11;
    }
    uint64_t v14 = (DWORD1(v16[2]) + 40 * a3);
    uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v17, 40, v14, &v19);
    if (!result)
    {
      if (v19 == 40)
      {
        DWORD1(v17[0]) = uarpTagStructPack32(a4);
        *(_OWORD *)((char *)v17 + 8) = *a5;
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v17, 40, v14);
      }
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddPayloadMetaData(uint64_t a1, uint64_t a2, int a3, unsigned int a4, unsigned int a5, uint64_t a6)
{
  uint64_t v11 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v11) {
    return 30;
  }
  int v12 = (void *)v11;
  unsigned int __dst = 0;
  LOWORD(v21[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v11, &__dst, 4, 0, (unsigned __int16 *)v21);
  int v14 = result;
  if (LOWORD(v21[0]) == 4) {
    unsigned int v15 = 0;
  }
  else {
    unsigned int v15 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v15;
  }
  if (v14 || LOWORD(v21[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v25 = 0;
  uint64_t v24 = 0;
  long long v22 = 0u;
  long long v23 = 0u;
  memset(v21, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v12, v21, 44, 0, &v25);
  if (result) {
    return result;
  }
  if (v25 != 44) {
    return 11;
  }
  uint64_t v16 = (DWORD1(v21[2]) + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v12, &v22, 40, v16, &v25);
  if (result) {
    return result;
  }
  if (v25 != 40) {
    return 11;
  }
  int v17 = DWORD2(v23);
  if (!DWORD2(v23))
  {
    int v17 = DWORD2(v21[0]);
    DWORD2(v23) = DWORD2(v21[0]);
  }
  uint64_t v18 = (HIDWORD(v23) + v17);
  v20[0] = uarpHtonl(a4);
  v20[1] = uarpHtonl(a5);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)v20, 8, v18);
  if (!result)
  {
    HIDWORD(v23) += 8;
    DWORD2(v21[0]) += 8;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, a6, (unsigned __int16)a5, (DWORD2(v23) + HIDWORD(v23)));
    if (!result)
    {
      HIDWORD(v23) += (unsigned __int16)a5;
      DWORD2(v21[0]) += (unsigned __int16)a5;
      uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)&v22, 40, v16);
      if (!result) {
        return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v12, (uint64_t)v21, 44, 0);
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryAddPayloadDataLarge(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  unsigned int v10 = 0;
  while (a5)
  {
    if (a5 >= 0xFFFF) {
      unsigned int v11 = 0xFFFF;
    }
    else {
      unsigned int v11 = a5;
    }
    uint64_t result = UARPSuperBinaryAddPayloadData(a1, a2, a3, a4 + v10, v11);
    v10 += v11;
    a5 -= v11;
    if (result) {
      return result;
    }
  }
  return 0;
}

uint64_t UARPSuperBinaryAddPayloadData(uint64_t a1, uint64_t a2, int a3, uint64_t a4, unsigned int a5)
{
  if (HIWORD(a5)) {
    return 39;
  }
  uint64_t v9 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v9) {
    return 30;
  }
  unsigned int v10 = (void *)v9;
  unsigned int __dst = 0;
  LOWORD(v17[0]) = 0;
  LODWORD(result) = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v9, &__dst, 4, 0, (unsigned __int16 *)v17);
  int v12 = result;
  if (LOWORD(v17[0]) == 4) {
    unsigned int v13 = 0;
  }
  else {
    unsigned int v13 = 11;
  }
  if (result) {
    uint64_t result = result;
  }
  else {
    uint64_t result = v13;
  }
  if (v12 || LOWORD(v17[0]) != 4) {
    return result;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v20 = 0;
  uint64_t v19 = 0;
  memset(v18, 0, sizeof(v18));
  memset(v17, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v17, 44, 0, &v20);
  if (result) {
    return result;
  }
  if (v20 != 44) {
    return 11;
  }
  uint64_t v14 = (DWORD1(v17[2]) + 40 * a3);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, (uint64_t)v10, v18, 40, v14, &v20);
  if (result) {
    return result;
  }
  if (v20 != 40) {
    return 11;
  }
  int v15 = v19;
  if (!v19)
  {
    int v15 = DWORD2(v17[0]);
    LODWORD(v19) = DWORD2(v17[0]);
  }
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, a4, (unsigned __int16)a5, (HIDWORD(v19) + v15));
  if (!result)
  {
    HIDWORD(v19) += a5;
    DWORD2(v17[0]) += a5;
    uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v18, 40, v14);
    if (!result) {
      return uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, v10, (uint64_t)v17, 44, 0);
    }
  }
  return result;
}

uint64_t UARPSuperBinaryFinalizeHeader(uint64_t a1, uint64_t a2)
{
  uint64_t v3 = uarpPlatformAssetFindByAssetContextAndList(a1, a2, 1);
  if (!v3) {
    return 30;
  }
  uint64_t v4 = v3;
  unsigned __int16 v12 = 0;
  unsigned int __dst = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v3, &__dst, 4, 0, &v12);
  if (result) {
    return result;
  }
  if (v12 != 4) {
    return 11;
  }
  if (__dst < 2) {
    return 30;
  }
  unsigned __int16 v16 = 0;
  uint64_t v15 = 0;
  memset(v14, 0, sizeof(v14));
  memset(v13, 0, 44);
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v4, v13, 44, 0, &v16);
  if (result) {
    return result;
  }
  if (v16 != 44) {
    return 11;
  }
  long long v6 = v13[0];
  long long v7 = v13[1];
  *(_OWORD *)(v4 + 28) = *(_OWORD *)((char *)&v13[1] + 12);
  *(_OWORD *)uint64_t v4 = v6;
  *(_OWORD *)(v4 + 16) = v7;
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)v13, v13);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)v4, (uint64_t)v13, 44, 0);
  if (!result)
  {
    unsigned int v8 = *(_DWORD *)(v4 + 40);
    if (v8 >= 0x28)
    {
      unsigned int v9 = v8 / 0x28;
      uint64_t v10 = *(unsigned int *)(v4 + 36);
      do
      {
        uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, v4, v14, 40, v10, &v16);
        if (result) {
          break;
        }
        if (v16 != 40) {
          return 11;
        }
        uarpPayloadHeaderEndianSwap((unsigned int *)v14, v14);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)v4, (uint64_t)v14, 40, v10);
        if (result) {
          break;
        }
        uint64_t v10 = (v10 + 40);
        --v9;
      }
      while (v9);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t uarpSuperBinaryHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[1] = uarpHtonl(a1[1]);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  a2[9] = uarpHtonl(a1[9]);
  uint64_t result = uarpHtonl(a1[10]);
  a2[10] = result;
  return result;
}

uint64_t uarpPayloadHeaderEndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  a2[2] = uarpHtonl(a1[2]);
  a2[3] = uarpHtonl(a1[3]);
  a2[4] = uarpHtonl(a1[4]);
  a2[5] = uarpHtonl(a1[5]);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t uarpPayloadHeader2EndianSwap(unsigned int *a1, _DWORD *a2)
{
  *a2 = uarpHtonl(*a1);
  uarpVersionEndianSwap(a1 + 2, a2 + 2);
  a2[6] = uarpHtonl(a1[6]);
  a2[7] = uarpHtonl(a1[7]);
  a2[8] = uarpHtonl(a1[8]);
  uint64_t result = uarpHtonl(a1[9]);
  a2[9] = result;
  return result;
}

uint64_t UARPSuperBinaryQueryAssetLength(uint64_t a1, uint64_t a2, _DWORD *a3)
{
  memset(__dst, 0, 44);
  unsigned __int16 v5 = 0;
  uint64_t result = uarpPlatformEndpointAssetGetBytesAtOffset(a1, 0, a2, __dst, 44, 0, &v5);
  if (!result)
  {
    if (v5 == 44)
    {
      uarpSuperBinaryHeaderEndianSwap((unsigned int *)__dst, __dst);
      uint64_t result = 0;
      *a3 = DWORD2(__dst[0]);
    }
    else
    {
      return 11;
    }
  }
  return result;
}

uint64_t UARPSuperBinaryPrepareDynamicAsset(int a1, char *a2, uint64_t a3, uint64_t a4, int a5)
{
  *(void *)(a2 + 12) = a3;
  *(void *)(a2 + 20) = a4;
  *((_DWORD *)a2 + 2) = 44;
  *(void *)a2 = 0x2C00000002;
  *(_OWORD *)(a2 + 28) = xmmword_10002B330;
  *((_DWORD *)a2 + 12) = a5;
  *((_DWORD *)a2 + 112) = 0;
  *((void *)a2 + 79) = 0;
  *((void *)a2 + 90) = 0;
  *((_OWORD *)a2 + 42) = 0u;
  return 0;
}

uint64_t UARPSuperBinaryAddSuperBinaryMetaData(uint64_t a1, uint64_t a2, int a3, unsigned int a4, const void *a5)
{
  uint64_t v13 = 0;
  size_t v9 = a4;
  UARPLayer2RequestBuffer(a1, &v13, a4 + 24);
  uint64_t v10 = v13;
  unsigned int v11 = (void *)(v13 + 24);
  *(void *)(v13 + 8) = v13 + 24;
  *(_DWORD *)uint64_t v10 = a3;
  *(_DWORD *)(v10 + 4) = a4;
  memcpy(v11, a5, v9);
  *(void *)(v10 + 16) = *(void *)(a2 + 720);
  *(void *)(a2 + 720) = v10;
  *(_DWORD *)(a2 + 8) += a4 + 8;
  *(_DWORD *)(a2 + 32) += a4 + 8;
  *(_WORD *)(a2 + 46) |= 0x80u;
  return 0;
}

uint64_t UARPSuperBinaryAddPayload(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8)
{
  return 0;
}

uint64_t UARPSuperBinaryAddPayload2(uint64_t a1, uint64_t a2, int a3, int a4, uint64_t a5, uint64_t a6, const void *a7, unsigned int a8, char a9)
{
  uint64_t v21 = 0;
  UARPLayer2RequestBuffer(a1, &v21, 0xB8u);
  unsigned __int16 v16 = v21;
  *((void *)v21 + 22) = *(void *)(a2 + 632);
  *(void *)(a2 + 632) = v16;
  uarpZero(v16, 0x28uLL);
  *unsigned __int16 v16 = 40;
  v16[1] = a4;
  *((void *)v16 + 1) = a5;
  *((void *)v16 + 2) = a6;
  v16[9] = a8;
  v16[7] = 0;
  v16[31] = a3;
  if (!a9)
  {
    unsigned __int16 v20 = 0;
    UARPLayer2RequestBuffer(a1, &v20, a8);
    int v17 = v20;
    *((void *)v16 + 17) = v20;
    memcpy(v17, a7, a8);
  }
  *((unsigned char *)v16 + 148) = a9;
  v16[36] = a8;
  *((void *)v16 + 21) = 0;
  *(_DWORD *)(a2 + 8) += a8 + 40;
  *(_DWORD *)(a2 + 40) += 40;
  *(_DWORD *)(a2 + 28) += 40;
  ++*(_DWORD *)(a2 + 448);
  return 0;
}

uint64_t UARPSuperBinaryAppendPayloadMetaData(uint64_t a1, uint64_t a2, int a3, int a4, unsigned int a5, const void *a6)
{
  unsigned int v6 = *(_DWORD *)(a2 + 448);
  uint64_t v7 = *(void *)(a2 + 632);
  if (v6) {
    BOOL v8 = v7 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (v8) {
    return 11;
  }
  unsigned int v14 = 1;
  while (*(_DWORD *)(v7 + 124) != a3)
  {
    uint64_t v9 = 11;
    if (v14 < v6)
    {
      uint64_t v7 = *(void *)(v7 + 176);
      ++v14;
      if (v7) {
        continue;
      }
    }
    return v9;
  }
  uint64_t v18 = 0;
  UARPLayer2RequestBuffer(a1, &v18, a5 + 24);
  uint64_t v15 = v18;
  unsigned __int16 v16 = (void *)(v18 + 24);
  *(void *)(v18 + 8) = v18 + 24;
  *(_DWORD *)uint64_t v15 = a4;
  *(_DWORD *)(v15 + 4) = a5;
  memcpy(v16, a6, a5);
  uint64_t v9 = 0;
  *(void *)(v15 + 16) = *(void *)(v7 + 168);
  *(void *)(v7 + 168) = v15;
  *(_DWORD *)(v7 + 28) += a5 + 8;
  *(_DWORD *)(a2 + 8) += a5 + 8;
  *(_DWORD *)(a2 + 684) += a5 + 8;
  *(_WORD *)(a2 + 46) |= 8u;
  return v9;
}

uint64_t UARPSuperBinaryAppendPayloadMetaDataBlob(uint64_t a1, uint64_t a2, int a3, const void *a4, unsigned int a5)
{
  unsigned int v5 = *(_DWORD *)(a2 + 448);
  uint64_t v6 = *(void *)(a2 + 632);
  if (v5) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7) {
    return 11;
  }
  unsigned int v12 = 1;
  uint64_t result = 11;
  while (*(_DWORD *)(v6 + 124) != a3)
  {
    if (v12 < v5)
    {
      uint64_t v6 = *(void *)(v6 + 176);
      ++v12;
      if (v6) {
        continue;
      }
    }
    return result;
  }
  if (*(void *)(v6 + 152)) {
    return 27;
  }
  UARPLayer2ReturnBuffer(a1, 0);
  *(void *)(v6 + 152) = 0;
  *(_DWORD *)(v6 + 160) = 0;
  UARPLayer2RequestBuffer(a1, 0, a5);
  memcpy(*(void **)(v6 + 152), a4, a5);
  uint64_t result = 0;
  *(_DWORD *)(v6 + 160) = a5;
  *(_DWORD *)(v6 + 28) += a5;
  *(_DWORD *)(a2 + 8) += a5;
  *(_DWORD *)(a2 + 684) += a5;
  *(_WORD *)(a2 + 46) |= 8u;
  return result;
}

uint64_t UARPSuperBinaryBuildMetaData(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t **a4, unsigned int a5, unsigned int *a6)
{
  unsigned int v8 = *a6;
  uint64_t v9 = *a4;
  if (a3)
  {
    uint64_t v11 = a3;
    while (1)
    {
      unsigned int v12 = uarpNtohl(*(_DWORD *)v11);
      uint64_t v13 = uarpNtohl(*(_DWORD *)(v11 + 4));
      v8 += *(_DWORD *)(v11 + 4) + 8;
      if (v8 > a5) {
        return 11;
      }
      *uint64_t v9 = v12 | (unint64_t)(v13 << 32);
      unsigned int v14 = (char *)(v9 + 1);
      memcpy(v14, *(const void **)(v11 + 8), *(unsigned int *)(v11 + 4));
      uint64_t v9 = (unint64_t *)&v14[*(unsigned int *)(v11 + 4)];
      uint64_t v11 = *(void *)(v11 + 16);
      if (!v11) {
        goto LABEL_5;
      }
    }
  }
  else
  {
LABEL_5:
    uint64_t result = 0;
    *a6 = v8;
    *a4 = v9;
  }
  return result;
}

uint64_t UARPSuperBinaryFinalizeDynamicAsset(uint64_t a1, uint64_t a2)
{
  uarpSuperBinaryHeaderEndianSwap((unsigned int *)a2, (_DWORD *)a2);
  uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, a2, 44, 0);
  if (!result)
  {
    uarpSuperBinaryHeaderEndianSwap((unsigned int *)a2, (_DWORD *)a2);
    uint64_t v5 = *(unsigned int *)(a2 + 4);
    unsigned int v6 = *(_DWORD *)(a2 + 32);
    BOOL v7 = (uint64_t *)(a2 + 632);
    unsigned int v8 = *(_DWORD *)(a2 + 448);
    if (v8)
    {
      unsigned int v9 = 0;
      unsigned int v10 = *(_DWORD *)(a2 + 40) + v5 + v6;
      unsigned int v11 = v10 + *(_DWORD *)(a2 + 684);
      unsigned int v12 = (unsigned int **)(a2 + 632);
      while (1)
      {
        uint64_t v13 = *v12;
        v13[6] = v10;
        v13[8] = v11;
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, (uint64_t)v13, 40, v5);
        if (result) {
          break;
        }
        uarpPayloadHeader2EndianSwap(v13, v13);
        uint64_t v5 = *v13 + v5;
        v10 += v13[7];
        v11 += v13[9];
        unsigned int v12 = (unsigned int **)(v13 + 44);
        ++v9;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
        if (v9 >= v8)
        {
          unsigned int v6 = *(_DWORD *)(a2 + 32);
          goto LABEL_8;
        }
      }
    }
    else
    {
LABEL_8:
      if (v6)
      {
        unsigned int __dst = 0;
        unsigned int v28 = 0;
        uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v6);
        if (result) {
          return result;
        }
        unsigned int v27 = (unint64_t *)__dst;
        uint64_t result = UARPSuperBinaryBuildMetaData(result, v14, *(void *)(a2 + 720), &v27, *(_DWORD *)(a2 + 32), &v28);
        if (result) {
          return result;
        }
        uint64_t v15 = __dst;
        *(void *)(a2 + 672) = __dst;
        unsigned int v16 = v28;
        *(_DWORD *)(a2 + 680) = v28;
        uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, (uint64_t)v15, (unsigned __int16)v16, v5);
        if (result) {
          return result;
        }
        uint64_t v5 = v16 + v5;
        unsigned int v8 = *(_DWORD *)(a2 + 448);
      }
      if (!v8) {
        return 0;
      }
      unsigned int v17 = 0;
      uint64_t v18 = a2 + 632;
      do
      {
        uint64_t v19 = *(void *)v18;
        unsigned int v20 = *(_DWORD *)(*(void *)v18 + 28);
        if (v20)
        {
          unsigned int __dst = 0;
          unsigned int v28 = 0;
          uint64_t result = UARPLayer2RequestBuffer(a1, &__dst, v20);
          if (result) {
            return result;
          }
          uint64_t v21 = __dst;
          unsigned int v27 = (unint64_t *)__dst;
          long long v22 = *(const void **)(v19 + 152);
          if (v22)
          {
            uint64_t v21 = memcpy(__dst, v22, *(unsigned int *)(v19 + 160));
            unsigned int v28 = *(_DWORD *)(v19 + 160);
          }
          uint64_t result = UARPSuperBinaryBuildMetaData((uint64_t)v21, (uint64_t)v22, *(void *)(v19 + 168), &v27, *(_DWORD *)(v19 + 28), &v28);
          if (result) {
            return result;
          }
          long long v23 = __dst;
          *(void *)(v19 + 152) = __dst;
          unsigned int v24 = v28;
          *(_DWORD *)(v19 + 160) = v28;
          uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, (uint64_t)v23, (unsigned __int16)v24, v5);
          if (result) {
            return result;
          }
          uint64_t v5 = v24 + v5;
          unsigned int v8 = *(_DWORD *)(a2 + 448);
        }
        uint64_t v18 = v19 + 176;
        ++v17;
      }
      while (v17 < v8);
      if (v8)
      {
        for (unsigned int i = 0; i < v8; ++i)
        {
          uint64_t v26 = *v7;
          if (!*(unsigned char *)(v26 + 148))
          {
            uint64_t result = uarpPlatformEndpointAssetSetBytesAtOffset(a1, 0, (void *)a2, *(void *)(v26 + 136), *(unsigned __int16 *)(v26 + 144), v5);
            if (result) {
              return result;
            }
            unsigned int v8 = *(_DWORD *)(a2 + 448);
          }
          uint64_t result = 0;
          uint64_t v5 = (*(_DWORD *)(v26 + 144) + v5);
          BOOL v7 = (uint64_t *)(v26 + 176);
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

uint64_t UARPSuperBinaryGetInternalSuperBinaryMetaData(int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  int v7 = *(_DWORD *)(a2 + 32);
  if (v7
    && ((v8 = *(_DWORD *)(a2 + 28), unsigned int v9 = v7 + v8, v10 = a5 >= v8, v11 = a5 - v8, v10) ? (v12 = v9 > a5) : (v12 = 0), v12))
  {
    unsigned __int16 v15 = v7 - v11;
    if (a4 >= v15) {
      unsigned __int16 v13 = v15;
    }
    else {
      unsigned __int16 v13 = a4;
    }
    memcpy(__dst, (const void *)(*(void *)(a2 + 672) + v11), v13);
    uint64_t result = 0;
  }
  else
  {
    unsigned __int16 v13 = 0;
    uint64_t result = 40;
  }
  *a6 = v13;
  return result;
}

uint64_t UARPSuperBinaryGetInternalPayloadMetaData(int a1, uint64_t a2, void *__dst, unsigned int a4, unsigned int a5, unsigned __int16 *a6)
{
  uint64_t v7 = *(void *)(a2 + 632);
  if (!v7)
  {
LABEL_9:
    unsigned __int16 v14 = 0;
    uint64_t result = 40;
    goto LABEL_14;
  }
  while (1)
  {
    int v8 = *(_DWORD *)(v7 + 28);
    if (v8) {
      break;
    }
LABEL_8:
    if (!v7) {
      goto LABEL_9;
    }
  }
  unsigned int v9 = *(_DWORD *)(v7 + 24);
  unsigned int v10 = v8 + v9;
  BOOL v11 = a5 >= v9;
  uint64_t v12 = a5 - v9;
  if (!v11 || v10 <= a5)
  {
    uint64_t v7 = *(void *)(v7 + 176);
    goto LABEL_8;
  }
  unsigned __int16 v16 = v8 - v12;
  if (a4 >= v16) {
    unsigned __int16 v14 = v16;
  }
  else {
    unsigned __int16 v14 = a4;
  }
  memcpy(__dst, (const void *)(*(void *)(v7 + 152) + v12), v14);
  uint64_t result = 0;
LABEL_14:
  *a6 = v14;
  return result;
}

void sub_100020AA4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020B1C()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Init - Init Complete", v2, v3, v4, v5, v6);
}

void sub_100020B50()
{
  sub_100004244(__stack_chk_guard);
  sub_1000041E4();
  sub_100004228((void *)&_mh_execute_header, v0, v1, "%s: Expected Transfer, but in state %d (error %d)", v2, v3, v4, v5, 2u);
}

void sub_100020BC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020C3C()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Init - Check Transfer State", v2, v3, v4, v5, v6);
}

void sub_100020C70()
{
  sub_100004244(__stack_chk_guard);
  sub_1000041E4();
  sub_100004228((void *)&_mh_execute_header, v0, v1, "%s: Expected erase, but in state %d (error %d)", v2, v3, v4, v5, 2u);
}

void sub_100020CE4()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Init - Flash Erase", v2, v3, v4, v5, v6);
}

void sub_100020D18(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020D90()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Init - Set State -> Start", v2, v3, v4, v5, v6);
}

void sub_100020DC4()
{
  sub_100004244(__stack_chk_guard);
  sub_1000041E4();
  sub_100004228((void *)&_mh_execute_header, v0, v1, "%s: Expected Idle, but in state %d (error %d)", v2, v3, v4, v5, 2u);
}

void sub_100020E38(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100020EB0()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Init - Check Idle State", v2, v3, v4, v5, v6);
}

void sub_100020EE4()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Write Block", v2, v3, v4, v5, v6);
}

void sub_100020F18()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Staged Asset Verified", v2, v3, v4, v5, v6);
}

void sub_100020F4C()
{
  sub_100004244(__stack_chk_guard);
  sub_1000041E4();
  sub_100004228((void *)&_mh_execute_header, v0, v1, "%s: Expected Staged, but in state %d (error %d)", v2, v3, v4, v5, 2u);
}

void sub_100020FC0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021038()
{
  sub_100004244(__stack_chk_guard);
  sub_1000041E4();
  sub_100004228((void *)&_mh_execute_header, v0, v1, "%s: Expected manifest in progress, but in state %d (error %d)", v2, v3, v4, v5, 2u);
}

void sub_1000210AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021124()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Update Cleanup", v2, v3, v4, v5, v6);
}

void sub_100021158()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Apply Staged Asset", v2, v3, v4, v5, v6);
}

void sub_10002118C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021204()
{
  sub_100004244(__stack_chk_guard);
  sub_1000041E4();
  sub_100004228((void *)&_mh_execute_header, v0, v1, "%s: Expected Staged, but in state %d (error %d)", v2, v3, v4, v5, 2u);
}

void sub_100021278(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000212F0()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Rescind Staged Asset", v2, v3, v4, v5, v6);
}

void sub_100021324(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002139C()
{
  sub_10000421C();
  sub_100004250((void *)&_mh_execute_header, v0, v1, "Failed to clear logs", v2, v3, v4, v5, v6);
}

void sub_1000213D0(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 138412546;
  *(void *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a2;
  sub_10000426C((void *)&_mh_execute_header, a2, a3, "Error writing to %@ from %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100021448()
{
  sub_10000421C();
  sub_100004250((void *)&_mh_execute_header, v0, v1, "Error building logs", v2, v3, v4, v5, v6);
}

void sub_10002147C()
{
  v1[0] = 136315394;
  sub_10000428C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: logs data is too big; %u",
    (uint8_t *)v1,
    0x12u);
}

void sub_1000214FC(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3 = 136315650;
  uint64_t v4 = "-[UARPAppleHPM(AccMode7) accMode7SolicitLogs:modelName:serialNumber:error:]";
  __int16 v5 = 2112;
  uint64_t v6 = a1;
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: Error writing logs data %@ to %@", (uint8_t *)&v3, 0x20u);
}

void sub_100021594(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002160C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021684(uint64_t a1, NSObject *a2)
{
  int v2 = 136315394;
  int v3 = "-[UARPAppleHPM(AccMode7) accMode7SetLogLevel:error:]";
  __int16 v4 = 2048;
  uint64_t v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: writeCFUa failed to set log level to %lu", (uint8_t *)&v2, 0x16u);
}

void sub_100021710(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021788(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021800(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)int v3 = 138412546;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  sub_10000426C((void *)&_mh_execute_header, a2, a3, "Error writing to %@ from %@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16]);
}

void sub_100021878()
{
  sub_10000421C();
  sub_100004250((void *)&_mh_execute_header, v0, v1, "Error making analytics file", v2, v3, v4, v5, v6);
}

void sub_1000218AC()
{
  v1[0] = 136315394;
  sub_10000428C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: analytics string is too big; %ul",
    (uint8_t *)v1,
    0x12u);
}

void sub_10002192C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000219A4(int *a1, NSObject *a2)
{
  int v2 = *a1;
  int v3 = 136315650;
  uint64_t v4 = "-[UARPAppleHPM(AccMode7) accMode7FirmwareUpdateGetState:error:]";
  __int16 v5 = 2048;
  uint64_t v6 = 12;
  __int16 v7 = 1024;
  int v8 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: read size mismatch; expected %lu, got %d",
    (uint8_t *)&v3,
    0x1Cu);
}

void sub_100021A44()
{
  sub_100004244(__stack_chk_guard);
  int v1 = *(_DWORD *)(v0 + 8);
  int v5 = 136315906;
  uint64_t v6 = "-[UARPAppleHPM(AccMode7) accMode7FirmwareUpdateGetState:error:]";
  __int16 v7 = 1024;
  int v8 = v2;
  __int16 v9 = 1024;
  int v10 = v3;
  __int16 v11 = 1024;
  int v12 = v1;
  _os_log_debug_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "%s: read state <0x%08x>, error <0x%08x>, stagedFirmwareVersion <0x%08x>", (uint8_t *)&v5, 0x1Eu);
}

void sub_100021AE4()
{
  sub_100004244(__stack_chk_guard);
  v1[0] = 136315650;
  sub_1000041E4();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: read state <0x%08x>, error <0x%08x>", (uint8_t *)v1, 0x18u);
}

void sub_100021B64(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021BDC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021C54(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021CCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021D44(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021DBC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021E34(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021EAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100021F24()
{
  v1[0] = 136315650;
  sub_10000CF28();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Expected %@, but ioreg says %@", (uint8_t *)v1, 0x20u);
}

void sub_100021FA8()
{
  sub_10000CEAC();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: Adapter %@", v2, v3, v4, v5, 2u);
}

void sub_10002201C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022094(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002210C()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Disabled updates for accessory %@", v2, v3, v4, v5, 2u);
}

void sub_100022180()
{
  sub_10000CEAC();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: change asset location to %@", v2, v3, v4, v5, 2u);
}

void sub_1000221F4()
{
  sub_10000CEAC();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: Tell controller about accessory %@", v2, v3, v4, v5, 2u);
}

void sub_100022268()
{
  sub_10000CF14();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: Existing Accessories %@", v2, v3, v4, v5, 2u);
}

void sub_1000222E0()
{
  sub_10000CF44();
  sub_10000426C((void *)&_mh_execute_header, v0, v1, "Unable to expand LOGS to %@ (%@)");
}

void sub_100022348()
{
  sub_10000CF44();
  sub_10000426C((void *)&_mh_execute_header, v0, v1, "Unable to create directory at %@ (%@)");
}

void sub_1000223B0()
{
  sub_10000CEAC();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: properties %@", v2, v3, v4, v5, 2u);
}

void sub_100022424()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessoryID %@", v2, v3, v4, v5, 2u);
}

void sub_100022498()
{
  v1[0] = 136315650;
  sub_10000CF28();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: solicit %@ for %@", (uint8_t *)v1, 0x20u);
}

void sub_10002251C()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022590()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022604(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100022670()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_1000226E4()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022758()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_1000227CC()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022840()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_1000228B4()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022928()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_10002299C()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022A10()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022A84()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022AF8()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022B6C(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5 = a2;
  uint64_t v6 = [a3 uarpAccessoryID];
  __int16 v7 = [v6 modelNumber];
  int v8 = 138412546;
  uint64_t v9 = a1;
  __int16 v10 = 2112;
  __int16 v11 = v7;
  _os_log_error_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_ERROR, "AppleModelNumber %@ from accessory does not match expected model number %@", (uint8_t *)&v8, 0x16u);
}

void sub_100022C3C()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022CB0()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022D24()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022D98()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Unknown UARPAccessory %@, dropping it", v2, v3, v4, v5, 2u);
}

void sub_100022E0C()
{
  sub_10000CF14();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: Asset Staging complete = %@", v2, v3, v4, v5, 2u);
}

void sub_100022E84()
{
  sub_10000CEAC();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: accessoryID = %@", v2, v3, v4, v5, 2u);
}

void sub_100022EF8()
{
  sub_10000CF14();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: %@", v2, v3, v4, v5, 2u);
}

void sub_100022F70()
{
  sub_10000CEAC();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: Matched %@", v2, v3, v4, v5, 2u);
}

void sub_100022FE4()
{
  sub_10000CEAC();
  sub_10000CEDC((void *)&_mh_execute_header, v0, v1, "%s: Matched %@", v2, v3, v4, v5, 2u);
}

void sub_100023058(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000230D0()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Failed to create power assertion for %@", v2, v3, v4, v5, 2u);
}

void sub_100023144(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Already holding power assertion for USBPD", v1, 2u);
}

void sub_100023188(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023200(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023278(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000232F0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023368(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000233E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100023458(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000234D0()
{
  v1[0] = 136315394;
  sub_10000D7EC();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: firmware not ready for more data; bytes written is %lu.",
    (uint8_t *)v1,
    0x16u);
}

void sub_100023550(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000235C8(void *a1)
{
  id v2 = a1;
  [(id)sub_10000D800() rxVdmRetryMax];
  sub_10000D7EC();
  sub_10000D7CC((void *)&_mh_execute_header, v3, v4, "%s: RX VDM Max Retries = %lu", v5, v6, v7, v8, 2u);
}

void sub_100023658(void *a1)
{
  id v2 = a1;
  [(id)sub_10000D800() rxVdmRetryMin];
  sub_10000D7EC();
  sub_10000D7CC((void *)&_mh_execute_header, v3, v4, "%s: RX VDM Min Retries = %lu", v5, v6, v7, v8, 2u);
}

void sub_1000236E8(void *a1)
{
  id v2 = a1;
  [(id)sub_10000D800() rxVdmRetryAverage];
  sub_10000D7CC((void *)&_mh_execute_header, v3, v4, "%s: RX VDM Average Retries = %f", v5, v6, v7, v8, 2u);
}

void sub_100023784(void *a1)
{
  id v2 = a1;
  [(id)sub_10000D800() rxVdmRetryPacketCount];
  sub_10000D7EC();
  sub_10000D7CC((void *)&_mh_execute_header, v3, v4, "%s: RX VDM Retried = %lu", v5, v6, v7, v8, 2u);
}

void sub_100023814(void *a1)
{
  id v2 = a1;
  [(id)sub_10000D800() rxVdmNoRetryPacketCount];
  sub_10000D7EC();
  sub_10000D7CC((void *)&_mh_execute_header, v3, v4, "%s: RX VDM No Retries = %lu", v5, v6, v7, v8, 2u);
}

void sub_1000238A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002391C()
{
  sub_10000421C();
  sub_100004200((void *)&_mh_execute_header, v0, v1, "USB-PD Verify Staged Asset", v2, v3, v4, v5, v6);
}

void sub_100023950(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000239C8(void *a1, unsigned int a2)
{
  id v3 = a1;
  uarpStatusCodeToString(a2);
  sub_10000F494();
  sub_10000F474((void *)&_mh_execute_header, v4, v5, "%s: set payload index failed (%s)", v6, v7, v8, v9, 2u);
}

void sub_100023A5C(void *a1, unsigned int a2)
{
  id v3 = a1;
  uarpStatusCodeToString(a2);
  sub_10000F494();
  sub_10000F474((void *)&_mh_execute_header, v4, v5, "%s: abandon failed (%s)", v6, v7, v8, v9, 2u);
}

void sub_100023AF0()
{
  v1[0] = 136315394;
  sub_10000428C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to seek offset to %u", (uint8_t *)v1, 0x12u);
}

void sub_100023B70(uint64_t *a1, NSObject *a2)
{
  uint64_t v2 = *a1;
  int v3 = 136315394;
  uint64_t v4 = "-[VUARPAsset setBytesAtOffset:accessory:buffer:length:]";
  __int16 v5 = 2112;
  uint64_t v6 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Failed to write to %@", (uint8_t *)&v3, 0x16u);
}

void sub_100023C00()
{
  v1[0] = 136315394;
  sub_10000428C();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "%s: Failed to seek offset to %u", (uint8_t *)v1, 0x12u);
}

void sub_100023C80()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: Supported Accessories %@", v2, v3, v4, v5, 2u);
}

void sub_100023CF4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[UARPUpdaterServiceUSBPD getMatchingServicesList]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:", (uint8_t *)&v1, 0xCu);
}

void sub_100023D78()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: No accessory identifier provided for %@", v2, v3, v4, v5, 2u);
}

void sub_100023DEC()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: No accessory registryEntryID provided for %@", v2, v3, v4, v5, 2u);
}

void sub_100023E60(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[UARPUpdaterServiceUSBPD ioKitRuleMatched:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: No matching dict", (uint8_t *)&v1, 0xCu);
}

void sub_100023EE4(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[UARPUpdaterServiceUSBPD ioKitRuleMatched:]";
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%s: No matching ioservice", (uint8_t *)&v1, 0xCu);
}

void sub_100023F68(uint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3 = *a2;
  int v4 = 138412546;
  uint64_t v5 = a1;
  __int16 v6 = 2112;
  uint64_t v7 = v3;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Matching Service Properties <%@> %@", (uint8_t *)&v4, 0x16u);
}

void sub_100023FF4()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: BSD Notifications %@", v2, v3, v4, v5, 2u);
}

void sub_100024068(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = "-[UARPUpdaterServiceUSBPD getBSDNotificationsList]";
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s:", (uint8_t *)&v1, 0xCu);
}

void sub_1000240EC()
{
  v1[0] = 136315394;
  sub_10000CEAC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "%s: %@", (uint8_t *)v1, 0x16u);
}

void sub_10002416C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000241E4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002425C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000242D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002434C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000243C4(os_log_t log)
{
  *(_WORD *)int v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to query serialNumber", v1, 2u);
}

void sub_100024408(int a1, NSObject *a2)
{
  int v2 = 136315394;
  uint64_t v3 = "-[UARPMagSafeCable querySerialNumber:]";
  __int16 v4 = 1024;
  int v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%s: Serial Number is too long %d", (uint8_t *)&v2, 0x12u);
}

void sub_100024494(uint64_t a1)
{
  int v1 = 138412290;
  uint64_t v2 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEBUG, "matchingDict: %@", (uint8_t *)&v1, 0xCu);
}

void sub_100024514(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002458C(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = &unk_100041A50;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s\n", (uint8_t *)&v1, 0xCu);
}

void sub_100024610(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024688(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024700(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = &unk_100042450;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "%s\n", (uint8_t *)&v1, 0xCu);
}

void sub_100024784(os_log_t log)
{
  int v1 = 136315138;
  uint64_t v2 = &unk_100042650;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "%s\n", (uint8_t *)&v1, 0xCu);
}

void sub_100024808()
{
  sub_100014E0C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Add Controller %@ to Accessory %@", v1, 0x16u);
}

void sub_100024880()
{
  sub_100014E0C();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Remove Controller %@ from Accessory %@", v1, 0x16u);
}

void sub_1000248F8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024970(uint64_t a1, NSObject *a2)
{
  uint64_t v2 = *(void *)(*(void *)(*(void *)a1 + 8) + 40);
  int v3 = 138412290;
  uint64_t v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Error send uarp message %@", (uint8_t *)&v3, 0xCu);
}

void sub_1000249F4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024A6C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024AE4()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "Asset %@ is not acceptable", v2, v3, v4, v5, v6);
}

void sub_100024B4C()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "Asset %@ offer failed", v2, v3, v4, v5, v6);
}

void sub_100024BB4()
{
  sub_100014E24();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "Asset %@ is acceptable", v1, 0xCu);
}

void sub_100024C28()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "Asset %@ is blocked by accessory state", v2, v3, v4, v5, v6);
}

void sub_100024C90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024D08(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024D80(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024DF8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024E70(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024EE8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024F60(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100024FD8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025050(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000250C8(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025140(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000251B8(uint64_t a1, int a2, os_log_t log)
{
  uint64_t v3 = *(void *)(a1 + 40);
  v4[0] = 67109378;
  v4[1] = a2;
  __int16 v5 = 2112;
  uint64_t v6 = v3;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Error %d recv uarp message %@", (uint8_t *)v4, 0x12u);
}

void sub_100025244(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000252B0(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002531C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025388(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to send VDM", v1, 2u);
}

void sub_1000253CC()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: No longer connected %@", v2, v3, v4, v5, 2u);
}

void sub_100025440()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "ReceiveVDM error on %@", v2, v3, v4, v5, v6);
}

void sub_1000254A8()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "RX VDM unexpected SOP on %@", v2, v3, v4, v5, v6);
}

void sub_100025510()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: No longer connected %@", v2, v3, v4, v5, 2u);
}

void sub_100025584(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000255FC()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "Failed to check connection %@", v2, v3, v4, v5, v6);
}

void sub_100025664(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000256DC()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "Not connected, don't probe HPM %@", v2, v3, v4, v5, v6);
}

void sub_100025744()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "VDO Results HPM %@", v2, v3, v4, v5, v6);
}

void sub_1000257AC(os_log_t log)
{
  *(_WORD *)uint64_t v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to process VDOs", v1, 2u);
}

void sub_1000257F0()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "Failed to check if connected, don't probe HPM %@", v2, v3, v4, v5, v6);
}

void sub_100025858()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "Probe VDOs %@", v2, v3, v4, v5, v6);
}

void sub_1000258C0()
{
  sub_100014E24();
  sub_1000041C8((void *)&_mh_execute_header, v0, v1, "Cannot probe VDOs, not set as SOP %@", v2, v3, v4, v5, v6);
}

void sub_100025928()
{
  sub_10000CEAC();
  sub_10000CEC0((void *)&_mh_execute_header, v0, v1, "%s: No longer connected %@", v2, v3, v4, v5, 2u);
}

void sub_10002599C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025A14(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025A8C()
{
  sub_100017268();
  sub_10001727C((void *)&_mh_execute_header, v0, v1, "%s: CFUs write failed with response: 0x%08x", v2, v3, v4, v5, 2u);
}

void sub_100025B04(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025B7C()
{
  sub_100017268();
  sub_10001727C((void *)&_mh_execute_header, v0, v1, "%s: CFUa read failed with response: 0x%08x", v2, v3, v4, v5, 2u);
}

void sub_100025BF4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025C6C()
{
  sub_100017268();
  sub_10001727C((void *)&_mh_execute_header, v0, v1, "%s: CFUa write failed with response: 0x%08x", v2, v3, v4, v5, 2u);
}

void sub_100025CE4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025D5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025DD4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025E4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025EC4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025F3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100025FB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002602C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_1000260A4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002611C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026194(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_10002620C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void sub_100026284()
{
  __error();
  sub_1000173D8((void *)&_mh_execute_header, v0, v1, "failed to initialize temporary directory: %d", v2, v3, v4, v5, 0);
}

void sub_100026304()
{
  __error();
  sub_1000173D8((void *)&_mh_execute_header, v0, v1, "failed to set temporary directory suffix: %d", v2, v3, v4, v5, 0);
}

void sub_100026384(uint64_t *a1, int a2, os_log_t log)
{
  uint64_t v3 = *a1;
  int v4 = 138412546;
  uint64_t v5 = v3;
  __int16 v6 = 1024;
  int v7 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "notify_register_dispatch failed for %@ (%u)", (uint8_t *)&v4, 0x12u);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return _CC_SHA256_Final(md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return _CC_SHA256_Init(c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA256_Update(c, data, len);
}

int CC_SHA384_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return _CC_SHA384_Final(md, c);
}

int CC_SHA384_Init(CC_SHA512_CTX *c)
{
  return _CC_SHA384_Init(c);
}

int CC_SHA384_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA384_Update(c, data, len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return _CC_SHA512_Final(md, c);
}

int CC_SHA512_Init(CC_SHA512_CTX *c)
{
  return _CC_SHA512_Init(c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return _CC_SHA512_Update(c, data, len);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return _CFBooleanGetTypeID();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return _CFBooleanGetValue(BOOLean);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return _CFGetTypeID(cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return _CFNumberGetTypeID();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return _CFNumberGetValue(number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
}

CFUUIDRef CFUUIDGetConstantUUIDWithBytes(CFAllocatorRef alloc, UInt8 byte0, UInt8 byte1, UInt8 byte2, UInt8 byte3, UInt8 byte4, UInt8 byte5, UInt8 byte6, UInt8 byte7, UInt8 byte8, UInt8 byte9, UInt8 byte10, UInt8 byte11, UInt8 byte12, UInt8 byte13, UInt8 byte14, UInt8 byte15)
{
  return _CFUUIDGetConstantUUIDWithBytes(alloc, byte0, byte1, byte2, byte3, byte4, byte5, byte6, byte7, byte8, byte9, byte10, byte11, byte12, byte13, byte14, byte15);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  CFUUIDBytes v3 = _CFUUIDGetUUIDBytes(uuid);
  uint64_t v2 = *(void *)&v3.byte8;
  uint64_t v1 = *(void *)&v3.byte0;
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

kern_return_t IOCreatePlugInInterfaceForService(io_service_t service, CFUUIDRef pluginType, CFUUIDRef interfaceType, IOCFPlugInInterface ***theInterface, SInt32 *theScore)
{
  return _IOCreatePlugInInterfaceForService(service, pluginType, interfaceType, theInterface, theScore);
}

kern_return_t IODestroyPlugInInterface(IOCFPlugInInterface **interface)
{
  return _IODestroyPlugInInterface(interface);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return _IOIteratorNext(iterator);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return _IONotificationPortCreate(mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return _IOObjectConformsTo(object, className);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return _IOObjectRelease(object);
}

CFDictionaryRef IOPSCopyExternalPowerAdapterDetails(void)
{
  return _IOPSCopyExternalPowerAdapterDetails();
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperties(entry, properties, allocator, options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return _IORegistryEntryCreateCFProperty(entry, key, allocator, options);
}

kern_return_t IORegistryEntryGetChildIterator(io_registry_entry_t entry, const io_name_t plane, io_iterator_t *iterator)
{
  return _IORegistryEntryGetChildIterator(entry, plane, iterator);
}

kern_return_t IORegistryEntryGetParentEntry(io_registry_entry_t entry, const io_name_t plane, io_registry_entry_t *parent)
{
  return _IORegistryEntryGetParentEntry(entry, plane, parent);
}

CFMutableDictionaryRef IORegistryEntryIDMatching(uint64_t entryID)
{
  return _IORegistryEntryIDMatching(entryID);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return _IOServiceAddMatchingNotification(notifyPort, notificationType, matching, callback, refCon, notification);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return _IOServiceGetMatchingService(mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return _IOServiceGetMatchingServices(mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return _IOServiceMatching(name);
}

uint64_t MGCopyAnswer()
{
  return _MGCopyAnswer();
}

uint64_t UARPAccessoryHardwareFusingToString()
{
  return _UARPAccessoryHardwareFusingToString();
}

uint64_t UARPAccessoryPropertyToString()
{
  return _UARPAccessoryPropertyToString();
}

uint64_t UARPAccessoryUSBPDLocationTypeToString()
{
  return _UARPAccessoryUSBPDLocationTypeToString();
}

uint64_t UARPFirmwareStagingCompletionStatusToString()
{
  return _UARPFirmwareStagingCompletionStatusToString();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return ___error();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _set_user_dir_suffix()
{
  return __set_user_dir_suffix();
}

void bzero(void *a1, size_t a2)
{
}

size_t compression_decode_buffer(uint8_t *dst_buffer, size_t dst_size, const uint8_t *src_buffer, size_t src_size, void *scratch_buffer, compression_algorithm algorithm)
{
  return _compression_decode_buffer(dst_buffer, dst_size, src_buffer, src_size, scratch_buffer, algorithm);
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return _confstr(a1, a2, a3);
}

uint64_t createPowerAssertion()
{
  return _createPowerAssertion();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return _dispatch_queue_create(label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return _dispatch_time(when, delta);
}

void free(void *a1)
{
}

uint64_t isDynamicAssetAnalytics()
{
  return _isDynamicAssetAnalytics();
}

uint64_t isDynamicAssetLogs()
{
  return _isDynamicAssetLogs();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return _malloc_type_calloc(count, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return _memcmp(__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return _memcpy(__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return _memmove(__dst, __src, __len);
}

uint32_t notify_cancel(int token)
{
  return _notify_cancel(token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return _notify_register_dispatch(name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return _[a1 alloc];
}

uint64_t objc_alloc_init()
{
  return _objc_alloc_init();
}

{
}

{
}

id objc_autoreleaseReturnValue(id a1)
{
  return _objc_autoreleaseReturnValue(a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return _objc_claimAutoreleasedReturnValue();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_enumerationMutation(id obj)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return _objc_getProperty(self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return _objc_initWeak(location, val);
}

id objc_loadWeakRetained(id *location)
{
  return _objc_loadWeakRetained(location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return _objc_msgSendSuper2(a1, a2);
}

uint64_t objc_opt_class()
{
  return _objc_opt_class();
}

uint64_t objc_opt_isKindOfClass()
{
  return _objc_opt_isKindOfClass();
}

uint64_t objc_opt_new()
{
  return _objc_opt_new();
}

uint64_t objc_opt_respondsToSelector()
{
  return _objc_opt_respondsToSelector();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return _objc_retain(a1);
}

id objc_retainAutorelease(id a1)
{
  return _a1;
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return _a1;
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return _objc_storeWeak(location, obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return _os_log_create(subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return _os_log_type_enabled(oslog, type);
}

uint64_t releasePowerAssertion()
{
  return _releasePowerAssertion();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return _snprintf(__str, __size, __format);
}

unint64_t strtoul(const char *__str, char **__endptr, int __base)
{
  return _strtoul(__str, __endptr, __base);
}

uint64_t uarpDynamicAssetComponentURL()
{
  return _uarpDynamicAssetComponentURL();
}

uint64_t uarpDynamicAssetURL()
{
  return _uarpDynamicAssetURL();
}

int usleep(useconds_t a1)
{
  return _usleep(a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return _vsnprintf(__str, __size, __format, a4);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return [a1 UTF8String];
}

id objc_msgSend_UUID(void *a1, const char *a2, ...)
{
  return [a1 UUID];
}

id objc_msgSend_activeFwVersion(void *a1, const char *a2, ...)
{
  return [a1 activeFwVersion];
}

id objc_msgSend_addController(void *a1, const char *a2, ...)
{
  return [a1 addController];
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return [a1 allObjects];
}

id objc_msgSend_appleModelNumber(void *a1, const char *a2, ...)
{
  return [a1 appleModelNumber];
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return [a1 array];
}

id objc_msgSend_assetTag(void *a1, const char *a2, ...)
{
  return [a1 assetTag];
}

id objc_msgSend_assetVersion(void *a1, const char *a2, ...)
{
  return [a1 assetVersion];
}

id objc_msgSend_autoAppliesStagedFirmware(void *a1, const char *a2, ...)
{
  return [a1 autoAppliesStagedFirmware];
}

id objc_msgSend_availableFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 availableFirmwareVersion];
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return [a1 BOOLValue];
}

id objc_msgSend_bsdNotification(void *a1, const char *a2, ...)
{
  return [a1 bsdNotification];
}

id objc_msgSend_buildVersion(void *a1, const char *a2, ...)
{
  return [a1 buildVersion];
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return [a1 bytes];
}

id objc_msgSend_capabilities(void *a1, const char *a2, ...)
{
  return [a1 capabilities];
}

id objc_msgSend_capability(void *a1, const char *a2, ...)
{
  return [a1 capability];
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return [a1 connected];
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return [a1 copy];
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return [a1 count];
}

id objc_msgSend_decomposeUARP(void *a1, const char *a2, ...)
{
  return [a1 decomposeUARP];
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return [a1 defaultManager];
}

id objc_msgSend_deviceInterface(void *a1, const char *a2, ...)
{
  return [a1 deviceInterface];
}

id objc_msgSend_disconnectFromUARP(void *a1, const char *a2, ...)
{
  return [a1 disconnectFromUARP];
}

id objc_msgSend_disconnectFromVUARP(void *a1, const char *a2, ...)
{
  return [a1 disconnectFromVUARP];
}

id objc_msgSend_discoverHPMs(void *a1, const char *a2, ...)
{
  return [a1 discoverHPMs];
}

id objc_msgSend_downloadStatus(void *a1, const char *a2, ...)
{
  return [a1 downloadStatus];
}

id objc_msgSend_firmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 firmwareVersion];
}

id objc_msgSend_firmwareVersionVDO(void *a1, const char *a2, ...)
{
  return [a1 firmwareVersionVDO];
}

id objc_msgSend_fwActiveVersion(void *a1, const char *a2, ...)
{
  return [a1 fwActiveVersion];
}

id objc_msgSend_fwStagedVersion(void *a1, const char *a2, ...)
{
  return [a1 fwStagedVersion];
}

id objc_msgSend_getBSDNotificationsList(void *a1, const char *a2, ...)
{
  return [a1 getBSDNotificationsList];
}

id objc_msgSend_getMatchingServicesList(void *a1, const char *a2, ...)
{
  return [a1 getMatchingServicesList];
}

id objc_msgSend_goldrestoreQueryInProgress(void *a1, const char *a2, ...)
{
  return [a1 goldrestoreQueryInProgress];
}

id objc_msgSend_handleBsdNotificationPowerAdapter(void *a1, const char *a2, ...)
{
  return [a1 handleBsdNotificationPowerAdapter];
}

id objc_msgSend_handleNotConnected(void *a1, const char *a2, ...)
{
  return [a1 handleNotConnected];
}

id objc_msgSend_hardwareID(void *a1, const char *a2, ...)
{
  return [a1 hardwareID];
}

id objc_msgSend_hardwareVersion(void *a1, const char *a2, ...)
{
  return [a1 hardwareVersion];
}

id objc_msgSend_hasChargePassthru(void *a1, const char *a2, ...)
{
  return [a1 hasChargePassthru];
}

id objc_msgSend_hasMagSafe(void *a1, const char *a2, ...)
{
  return [a1 hasMagSafe];
}

id objc_msgSend_holdPowerAssertionForAccessory(void *a1, const char *a2, ...)
{
  return [a1 holdPowerAssertionForAccessory];
}

id objc_msgSend_hpmDelegate(void *a1, const char *a2, ...)
{
  return [a1 hpmDelegate];
}

id objc_msgSend_hwFusingType(void *a1, const char *a2, ...)
{
  return [a1 hwFusingType];
}

id objc_msgSend_identifier(void *a1, const char *a2, ...)
{
  return [a1 identifier];
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return [a1 intValue];
}

id objc_msgSend_isActive(void *a1, const char *a2, ...)
{
  return [a1 isActive];
}

id objc_msgSend_isAuthenticated(void *a1, const char *a2, ...)
{
  return [a1 isAuthenticated];
}

id objc_msgSend_isConnected(void *a1, const char *a2, ...)
{
  return [a1 isConnected];
}

id objc_msgSend_isConnnected(void *a1, const char *a2, ...)
{
  return [a1 isConnnected];
}

id objc_msgSend_isMagSafeCable(void *a1, const char *a2, ...)
{
  return [a1 isMagSafeCable];
}

id objc_msgSend_isPowerAdapter(void *a1, const char *a2, ...)
{
  return [a1 isPowerAdapter];
}

id objc_msgSend_isUSBCLightning(void *a1, const char *a2, ...)
{
  return [a1 isUSBCLightning];
}

id objc_msgSend_isValid(void *a1, const char *a2, ...)
{
  return [a1 isValid];
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return [a1 length];
}

id objc_msgSend_localURL(void *a1, const char *a2, ...)
{
  return [a1 localURL];
}

id objc_msgSend_majorVersion(void *a1, const char *a2, ...)
{
  return [a1 majorVersion];
}

id objc_msgSend_manufacturerName(void *a1, const char *a2, ...)
{
  return [a1 manufacturerName];
}

id objc_msgSend_manufacturerVDO(void *a1, const char *a2, ...)
{
  return [a1 manufacturerVDO];
}

id objc_msgSend_matchingDictionary(void *a1, const char *a2, ...)
{
  return [a1 matchingDictionary];
}

id objc_msgSend_maxTxPayloadLength(void *a1, const char *a2, ...)
{
  return [a1 maxTxPayloadLength];
}

id objc_msgSend_minorVersion(void *a1, const char *a2, ...)
{
  return [a1 minorVersion];
}

id objc_msgSend_modelName(void *a1, const char *a2, ...)
{
  return [a1 modelName];
}

id objc_msgSend_modelNumber(void *a1, const char *a2, ...)
{
  return [a1 modelNumber];
}

id objc_msgSend_modelStringVDO(void *a1, const char *a2, ...)
{
  return [a1 modelStringVDO];
}

id objc_msgSend_mutableBytes(void *a1, const char *a2, ...)
{
  return [a1 mutableBytes];
}

id objc_msgSend_needsTransferAnalytics(void *a1, const char *a2, ...)
{
  return [a1 needsTransferAnalytics];
}

id objc_msgSend_needsTransferLogs(void *a1, const char *a2, ...)
{
  return [a1 needsTransferLogs];
}

id objc_msgSend_pauseDataTransfer(void *a1, const char *a2, ...)
{
  return [a1 pauseDataTransfer];
}

id objc_msgSend_payloadAssetTag(void *a1, const char *a2, ...)
{
  return [a1 payloadAssetTag];
}

id objc_msgSend_pluginInterface(void *a1, const char *a2, ...)
{
  return [a1 pluginInterface];
}

id objc_msgSend_productID(void *a1, const char *a2, ...)
{
  return [a1 productID];
}

id objc_msgSend_qEnumerateHPMsWithMagSafe(void *a1, const char *a2, ...)
{
  return [a1 qEnumerateHPMsWithMagSafe];
}

id objc_msgSend_qShowUpdaterSets(void *a1, const char *a2, ...)
{
  return [a1 qShowUpdaterSets];
}

id objc_msgSend_registryEntryID(void *a1, const char *a2, ...)
{
  return [a1 registryEntryID];
}

id objc_msgSend_releasePowerAssertionForAccessory(void *a1, const char *a2, ...)
{
  return [a1 releasePowerAssertionForAccessory];
}

id objc_msgSend_releaseVersion(void *a1, const char *a2, ...)
{
  return [a1 releaseVersion];
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return [a1 removeAllObjects];
}

id objc_msgSend_requestedPowerAdapterDiscovery(void *a1, const char *a2, ...)
{
  return [a1 requestedPowerAdapterDiscovery];
}

id objc_msgSend_requiresAuthentication(void *a1, const char *a2, ...)
{
  return [a1 requiresAuthentication];
}

id objc_msgSend_requiresPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 requiresPowerAssertion];
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return [a1 resume];
}

id objc_msgSend_resumeDataTransfer(void *a1, const char *a2, ...)
{
  return [a1 resumeDataTransfer];
}

id objc_msgSend_rid(void *a1, const char *a2, ...)
{
  return [a1 rid];
}

id objc_msgSend_routerID(void *a1, const char *a2, ...)
{
  return [a1 routerID];
}

id objc_msgSend_rxVdmNoRetryPacketCount(void *a1, const char *a2, ...)
{
  return [a1 rxVdmNoRetryPacketCount];
}

id objc_msgSend_rxVdmRetryAverage(void *a1, const char *a2, ...)
{
  return [a1 rxVdmRetryAverage];
}

id objc_msgSend_rxVdmRetryMax(void *a1, const char *a2, ...)
{
  return [a1 rxVdmRetryMax];
}

id objc_msgSend_rxVdmRetryMin(void *a1, const char *a2, ...)
{
  return [a1 rxVdmRetryMin];
}

id objc_msgSend_rxVdmRetryPacketCount(void *a1, const char *a2, ...)
{
  return [a1 rxVdmRetryPacketCount];
}

id objc_msgSend_send(void *a1, const char *a2, ...)
{
  return [a1 send];
}

id objc_msgSend_serialNumber(void *a1, const char *a2, ...)
{
  return [a1 serialNumber];
}

id objc_msgSend_serviceBsdNotifications(void *a1, const char *a2, ...)
{
  return [a1 serviceBsdNotifications];
}

id objc_msgSend_serviceListener(void *a1, const char *a2, ...)
{
  return [a1 serviceListener];
}

id objc_msgSend_setCallbacks(void *a1, const char *a2, ...)
{
  return [a1 setCallbacks];
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return [a1 sharedInstance];
}

id objc_msgSend_sopDelegate(void *a1, const char *a2, ...)
{
  return [a1 sopDelegate];
}

id objc_msgSend_sopPrimeDelegate(void *a1, const char *a2, ...)
{
  return [a1 sopPrimeDelegate];
}

id objc_msgSend_stagedFwVersion(void *a1, const char *a2, ...)
{
  return [a1 stagedFwVersion];
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return [a1 stop];
}

id objc_msgSend_stopPacketCapture(void *a1, const char *a2, ...)
{
  return [a1 stopPacketCapture];
}

id objc_msgSend_supportsAccMode7(void *a1, const char *a2, ...)
{
  return [a1 supportsAccMode7];
}

id objc_msgSend_supportsAnalytics(void *a1, const char *a2, ...)
{
  return [a1 supportsAnalytics];
}

id objc_msgSend_supportsLogs(void *a1, const char *a2, ...)
{
  return [a1 supportsLogs];
}

id objc_msgSend_tag(void *a1, const char *a2, ...)
{
  return [a1 tag];
}

id objc_msgSend_uarpAccessory(void *a1, const char *a2, ...)
{
  return [a1 uarpAccessory];
}

id objc_msgSend_uarpAccessoryID(void *a1, const char *a2, ...)
{
  return [a1 uarpAccessoryID];
}

id objc_msgSend_uarpAsset(void *a1, const char *a2, ...)
{
  return [a1 uarpAsset];
}

id objc_msgSend_uarpCallbacks(void *a1, const char *a2, ...)
{
  return [a1 uarpCallbacks];
}

id objc_msgSend_uarpEndpoint(void *a1, const char *a2, ...)
{
  return [a1 uarpEndpoint];
}

id objc_msgSend_uarpMaxPayloadSize(void *a1, const char *a2, ...)
{
  return [a1 uarpMaxPayloadSize];
}

id objc_msgSend_uarpPayloadWindowSize(void *a1, const char *a2, ...)
{
  return [a1 uarpPayloadWindowSize];
}

id objc_msgSend_uarpRemoteEndpoint(void *a1, const char *a2, ...)
{
  return [a1 uarpRemoteEndpoint];
}

id objc_msgSend_unsignedIntegerValue(void *a1, const char *a2, ...)
{
  return [a1 unsignedIntegerValue];
}

id objc_msgSend_updateAvailabilityStatus(void *a1, const char *a2, ...)
{
  return [a1 updateAvailabilityStatus];
}

id objc_msgSend_updateRequiresPowerAssertion(void *a1, const char *a2, ...)
{
  return [a1 updateRequiresPowerAssertion];
}

id objc_msgSend_url(void *a1, const char *a2, ...)
{
  return [a1 url];
}

id objc_msgSend_usbpdHardwareIdForPowerAdapter(void *a1, const char *a2, ...)
{
  return [a1 usbpdHardwareIdForPowerAdapter];
}

id objc_msgSend_vendorID(void *a1, const char *a2, ...)
{
  return [a1 vendorID];
}

id objc_msgSend_versionString(void *a1, const char *a2, ...)
{
  return [a1 versionString];
}

id objc_msgSend_vuarpActiveFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 vuarpActiveFirmwareVersion];
}

id objc_msgSend_vuarpAppleModelNumber(void *a1, const char *a2, ...)
{
  return [a1 vuarpAppleModelNumber];
}

id objc_msgSend_vuarpApplyStagedAssets(void *a1, const char *a2, ...)
{
  return [a1 vuarpApplyStagedAssets];
}

id objc_msgSend_vuarpAssetOffered(void *a1, const char *a2, ...)
{
  return [a1 vuarpAssetOffered];
}

id objc_msgSend_vuarpDelegate(void *a1, const char *a2, ...)
{
  return [a1 vuarpDelegate];
}

id objc_msgSend_vuarpHardwareVersion(void *a1, const char *a2, ...)
{
  return [a1 vuarpHardwareVersion];
}

id objc_msgSend_vuarpHasStagedAssets(void *a1, const char *a2, ...)
{
  return [a1 vuarpHasStagedAssets];
}

id objc_msgSend_vuarpHwFusingType(void *a1, const char *a2, ...)
{
  return [a1 vuarpHwFusingType];
}

id objc_msgSend_vuarpManufacturerName(void *a1, const char *a2, ...)
{
  return [a1 vuarpManufacturerName];
}

id objc_msgSend_vuarpModelName(void *a1, const char *a2, ...)
{
  return [a1 vuarpModelName];
}

id objc_msgSend_vuarpRescindStagedAssets(void *a1, const char *a2, ...)
{
  return [a1 vuarpRescindStagedAssets];
}

id objc_msgSend_vuarpSerialNumber(void *a1, const char *a2, ...)
{
  return [a1 vuarpSerialNumber];
}

id objc_msgSend_vuarpStageAllowed(void *a1, const char *a2, ...)
{
  return [a1 vuarpStageAllowed];
}

id objc_msgSend_vuarpStagedFirmwareVersion(void *a1, const char *a2, ...)
{
  return [a1 vuarpStagedFirmwareVersion];
}

id objc_msgSend_writeToURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "writeToURL:error:");
}
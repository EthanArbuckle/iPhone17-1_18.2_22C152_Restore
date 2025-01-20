@interface TVRCRMSDeviceWrapper
@end

@implementation TVRCRMSDeviceWrapper

void __49___TVRCRMSDeviceWrapper__connectWithPairingGUID___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  v4 = _TVRCRMSLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = NSStringFromRMSResponseCode(a2);
    int v15 = 138412290;
    v16 = v5;
    _os_log_impl(&dword_2266D3000, v4, OS_LOG_TYPE_DEFAULT, "#LegacyDevice connection got RMS response code %@", (uint8_t *)&v15, 0xCu);
  }
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (a2 == -2)
    {
      v10 = _TVRCRMSLog();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_2266D3000, v10, OS_LOG_TYPE_DEFAULT, "#LegacyDevice got AuthenticationError. Removing pairing record and attempting to re-pair...", (uint8_t *)&v15, 2u);
      }

      v11 = +[_TVRCRMSDeviceManager sharedInstance];
      v12 = [WeakRetained device];
      v13 = [v12 networkName];
      [v11 removeStoredInfoForNetworkName:v13];

      [WeakRetained _initiatePairing];
    }
    else
    {
      if (a2 == 1)
      {
        v7 = _TVRCRMSLog();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_2266D3000, v7, OS_LOG_TYPE_DEFAULT, "#LegacyDevice Informing delegate we successfully connected", (uint8_t *)&v15, 2u);
        }

        v8 = [WeakRetained controlSession];
        [v8 beginObservingNowPlaying];

        [WeakRetained setConnected:1];
        [WeakRetained _setupKeyboardController];
        v9 = [WeakRetained delegate];
        [v9 connectedToDevice:WeakRetained];
      }
      else
      {
        v14 = _TVRCRMSLog();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v15) = 0;
          _os_log_impl(&dword_2266D3000, v14, OS_LOG_TYPE_DEFAULT, "#LegacyDevice Informing delegate we failed to connect", (uint8_t *)&v15, 2u);
        }

        v9 = TVRCMakeError(100, 0);
        [WeakRetained _disconnectWithError:v9];
      }
    }
  }
}

void __37___TVRCRMSDeviceWrapper__seekToTime___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v5 = *MEMORY[0x263EF8340];
  if (a2 != 1)
  {
    int v2 = a2;
    v3 = _TVRCRMSLog();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4[0] = 67109120;
      v4[1] = v2;
      _os_log_impl(&dword_2266D3000, v3, OS_LOG_TYPE_DEFAULT, "#LegacyDevice failed to seek to playback time with error code %d", (uint8_t *)v4, 8u);
    }
  }
}

@end
@interface WLWiFiManager
- (BOOL)isTetheringSupported;
- (WLWiFiManager)init;
- (__WiFiManagerClient)ref;
- (id)createDeviceClient;
- (void)_preferredChannel:(__WiFiDeviceClient *)a3 network:(__WiFiNetwork *)a4 channels:(id)a5 completion:(id)a6;
- (void)currentNetwork:(__WiFiDeviceClient *)a3 channels:(id)a4 completion:(id)a5;
- (void)dealloc;
- (void)disable;
- (void)enable;
- (void)scanNetwork:(id)a3;
- (void)setRef:(__WiFiManagerClient *)a3;
@end

@implementation WLWiFiManager

- (WLWiFiManager)init
{
  v5.receiver = self;
  v5.super_class = (Class)WLWiFiManager;
  v2 = [(WLWiFiManager *)&v5 init];
  if (v2)
  {
    [(WLWiFiManager *)v2 setRef:WiFiManagerClientCreate()];
    uint64_t v4 = [(WLWiFiManager *)v2 ref];
    _WLLog();
    [(WLWiFiManager *)v2 ref];
    CFRunLoopGetMain();
    WiFiManagerClientScheduleWithRunLoop();
  }
  return v2;
}

- (void)dealloc
{
  if ([(WLWiFiManager *)self ref]) {
    CFRelease([(WLWiFiManager *)self ref]);
  }
  v3.receiver = self;
  v3.super_class = (Class)WLWiFiManager;
  [(WLWiFiManager *)&v3 dealloc];
}

- (BOOL)isTetheringSupported
{
  return WiFiManagerClientIsTetheringSupported() != 0;
}

- (void)disable
{
  v2 = [(WLWiFiManager *)self ref];
  MEMORY[0x270F4B520](v2);
}

- (void)enable
{
  v2 = [(WLWiFiManager *)self ref];
  MEMORY[0x270F4B538](v2);
}

- (id)createDeviceClient
{
  [(WLWiFiManager *)self ref];
  CFArrayRef v2 = (const __CFArray *)WiFiManagerClientCopyDevices();
  _WLLog();
  if (v2)
  {
    Count = (WLWiFiDeviceClient *)CFArrayGetCount(v2);
    if (Count)
    {
      CFIndex v4 = 0;
      while (1)
      {
        ValueAtIndex = CFArrayGetValueAtIndex(v2, v4);
        uint64_t InterfaceRoleIndex = WiFiDeviceClientGetInterfaceRoleIndex();
        _WLLog();
        if (!InterfaceRoleIndex) {
          break;
        }
        if (Count == (WLWiFiDeviceClient *)++v4)
        {
          Count = 0;
          goto LABEL_9;
        }
      }
      Count = -[WLWiFiDeviceClient initWithWiFiDeviceClientRef:]([WLWiFiDeviceClient alloc], "initWithWiFiDeviceClientRef:", ValueAtIndex, ValueAtIndex, 0);
    }
LABEL_9:
    CFRelease(v2);
  }
  else
  {
    Count = 0;
  }
  _WLLog();
  return Count;
}

- (void)scanNetwork:(id)a3
{
  v16[4] = *MEMORY[0x263EF8340];
  id v4 = a3;
  [(WLWiFiManager *)self ref];
  uint64_t Device = WiFiManagerClientGetDevice();
  if (Device)
  {
    v6 = (void *)Device;
    v15[0] = @"SCAN_BSS_TYPE";
    v15[1] = @"SCAN_DWELL_TIME";
    v16[0] = &unk_26DF8E5E8;
    v16[1] = &unk_26DF8E600;
    v15[2] = @"SCAN_NUM_SCANS";
    v15[3] = @"SCAN_PHY_MODE";
    v16[2] = &unk_26DF8E618;
    v16[3] = &unk_26DF8E618;
    v7 = [NSDictionary dictionaryWithObjects:v16 forKeys:v15 count:4];
    objc_initWeak(&location, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __29__WLWiFiManager_scanNetwork___block_invoke;
    v11[3] = &unk_26490C628;
    objc_copyWeak(v13, &location);
    v13[1] = v6;
    id v8 = v4;
    id v12 = v8;
    v9 = (void *)MEMORY[0x230F5E7D0](v11);
    id v10 = (id)MEMORY[0x230F5E7D0]();
    LODWORD(v6) = WiFiDeviceClientScanAsync();

    if (v6)
    {
      _WLLog();
      if (v8) {
        (*((void (**)(id, uint64_t))v8 + 2))(v8, 1);
      }
    }

    objc_destroyWeak(v13);
    objc_destroyWeak(&location);
  }
  else
  {
    _WLLog();
    if (v4) {
      (*((void (**)(id, uint64_t))v4 + 2))(v4, 1);
    }
  }
}

void __29__WLWiFiManager_scanNetwork___block_invoke(uint64_t a1, void *a2)
{
  objc_super v3 = (id *)(a1 + 40);
  id v4 = a2;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained currentNetwork:*(void *)(a1 + 48) channels:v4 completion:*(void *)(a1 + 32)];
}

- (void)currentNetwork:(__WiFiDeviceClient *)a3 channels:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  objc_initWeak(&location, self);
  v15[0] = MEMORY[0x263EF8330];
  v15[1] = 3221225472;
  v15[2] = __52__WLWiFiManager_currentNetwork_channels_completion___block_invoke;
  v15[3] = &unk_26490C650;
  objc_copyWeak(v18, &location);
  v18[1] = a3;
  id v10 = v8;
  id v16 = v10;
  id v11 = v9;
  id v17 = v11;
  id v12 = (void *)MEMORY[0x230F5E7D0](v15);
  id v13 = MEMORY[0x263EF83A0];
  id v14 = (id)MEMORY[0x230F5E7D0](v12);
  LODWORD(a3) = WiFiDeviceClientCopyCurrentNetworkAsync();

  if (a3)
  {
    _WLLog();
    if (v11) {
      (*((void (**)(id, uint64_t))v11 + 2))(v11, 1);
    }
  }

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
}

void __52__WLWiFiManager_currentNetwork_channels_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [WeakRetained _preferredChannel:*(void *)(a1 + 56) network:a2 channels:*(void *)(a1 + 32) completion:*(void *)(a1 + 40)];
}

- (void)_preferredChannel:(__WiFiDeviceClient *)a3 network:(__WiFiNetwork *)a4 channels:(id)a5 completion:(id)a6
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v8 = a5;
  id v70 = a6;
  id v9 = WiFiNetworkGetChannel();
  v69 = v9;
  if (a4) {
    uint64_t v78 = [v9 integerValue];
  }
  else {
    uint64_t v78 = -1;
  }
  id v73 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v71 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v85 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v84 = objc_alloc_init(MEMORY[0x263EFF9C0]);
  id v75 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v72 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v10 = (void *)WiFiDeviceClientCopyProperty();
  id v11 = (void *)WiFiDeviceClientCopyProperty();
  id v74 = v8;
  if (v11)
  {
    v80 = v10;
    long long v92 = 0u;
    long long v93 = 0u;
    long long v90 = 0u;
    long long v91 = 0u;
    id obj = v11;
    uint64_t v12 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v91;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v91 != v14) {
            objc_enumerationMutation(obj);
          }
          id v16 = *(void **)(*((void *)&v90 + 1) + 8 * i);
          id v17 = [v16 objectForKeyedSubscript:@"CHANNELINFO_CH_NUM"];
          v18 = [v16 objectForKeyedSubscript:@"CHANNELINFO_INDOOR_RESTRICTED"];
          v19 = [v16 objectForKeyedSubscript:@"CHANNELINFO_PASSIVE"];
          _WLLog();
          if (objc_msgSend(v18, "BOOLValue", v17, v18, v19)) {
            [v85 addObject:v17];
          }
          if ([v19 BOOLValue]) {
            [v84 addObject:v17];
          }
        }
        uint64_t v13 = [obj countByEnumeratingWithState:&v90 objects:v96 count:16];
      }
      while (v13);
    }

    CFRelease(obj);
    id v8 = v74;
    id v10 = v80;
  }
  if (!v10)
  {
    uint64_t v44 = -1;
    uint64_t v45 = -1;
    goto LABEL_57;
  }
  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  id v79 = v10;
  id obja = (id)[v79 countByEnumeratingWithState:&v86 objects:v95 count:16];
  if (!obja)
  {
    uint64_t v76 = -1;
    uint64_t v77 = -1;
    goto LABEL_56;
  }
  uint64_t v81 = *(void *)v87;
  v20 = @"SUP_CHANNEL";
  uint64_t v76 = -1;
  uint64_t v77 = -1;
  do
  {
    for (j = 0; j != obja; j = (char *)j + 1)
    {
      if (*(void *)v87 != v81) {
        objc_enumerationMutation(v79);
      }
      v22 = *(void **)(*((void *)&v86 + 1) + 8 * (void)j);
      v23 = objc_msgSend(v22, "objectForKeyedSubscript:", v20, v66, v67, v68);
      v24 = [v22 objectForKeyedSubscript:@"SUP_CHANNEL_FLAGS"];
      unint64_t v25 = [v24 unsignedIntegerValue];
      char v26 = v25;
      uint64_t v27 = (v25 & 0x100 | (v25 >> 7) & 1) ^ 1;
      int v28 = [v85 containsObject:v23];
      uint64_t v29 = v27 | [v84 containsObject:v23] | v28;
      v66 = v23;
      v67 = v24;
      BOOL v68 = v29 != 0;
      _WLLog();
      if (!v29)
      {
        v30 = v20;
        uint64_t v31 = objc_msgSend(v23, "integerValue", v23, v24, v68);
        uint64_t v32 = v31;
        if ((v26 & 8) != 0)
        {
          BOOL v33 = v31 >= 1 && v31 <= 14;
          if (v33 && v31 != v78)
          {
            uint64_t v35 = v77;
            if (v77 <= v31) {
              uint64_t v35 = v31;
            }
            uint64_t v77 = v35;
            v36 = [v8 objectForKey:v23];
            v37 = v36;
            if (v36)
            {
              v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v36, "integerValue"));
              v39 = [NSNumber numberWithInteger:v32];
              [v75 setObject:v38 forKey:v39];
            }
            else
            {
              v38 = [NSNumber numberWithInteger:v32];
              [v73 addObject:v38];
            }
            goto LABEL_49;
          }
        }
        if ((v26 & 0x10) != 0 && v31 >= 32 && v31 <= 177 && v31 != v78)
        {
          uint64_t v41 = v76;
          if (v76 <= v31) {
            uint64_t v41 = v31;
          }
          uint64_t v76 = v41;
          v37 = [v8 objectForKey:v23];
          v42 = [v8 objectForKey:v23];

          if (v42)
          {
            v38 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v37, "integerValue"));
            v43 = [NSNumber numberWithInteger:v32];
            [v72 setObject:v38 forKey:v43];
          }
          else
          {
            v38 = [NSNumber numberWithInteger:v32];
            [v71 addObject:v38];
          }
          id v8 = v74;
LABEL_49:
        }
        v20 = v30;
      }
    }
    id obja = (id)[v79 countByEnumeratingWithState:&v86 objects:v95 count:16];
  }
  while (obja);
LABEL_56:

  CFRelease(v79);
  uint64_t v44 = v76;
  uint64_t v45 = v77;
LABEL_57:
  v46 = objc_msgSend(MEMORY[0x263F08B30], "sortDescriptorWithKey:ascending:", 0, 0, v66, v67);
  v94 = v46;
  v47 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v94 count:1];

  v48 = [v73 sortedArrayUsingDescriptors:v47];
  v49 = [v48 firstObject];
  uint64_t v50 = [v49 integerValue];

  v51 = [v71 sortedArrayUsingDescriptors:v47];
  v52 = [v51 firstObject];
  uint64_t v53 = [v52 integerValue];

  v54 = [v75 keysSortedByValueUsingComparator:&__block_literal_global_7];
  v55 = [v54 firstObject];
  uint64_t v56 = [v55 integerValue];

  v57 = [v75 keysSortedByValueUsingComparator:&__block_literal_global_76];
  v58 = [v57 firstObject];
  uint64_t v59 = [v58 integerValue];

  if (v56 <= 0) {
    uint64_t v60 = v45;
  }
  else {
    uint64_t v60 = v56;
  }
  if (v50 > 0) {
    uint64_t v60 = v50;
  }
  if (v59 <= 0) {
    uint64_t v61 = v44;
  }
  else {
    uint64_t v61 = v59;
  }
  if (v53 > 0) {
    uint64_t v61 = v53;
  }
  if (v78 <= 0)
  {
    if (v60 <= 1) {
      uint64_t v60 = 1;
    }
    if (v61 <= 31) {
      uint64_t v64 = v60;
    }
    else {
      uint64_t v64 = v61;
    }
    v62 = v74;
    v63 = (void (**)(void, void))v70;
  }
  else
  {
    v62 = v74;
    v63 = (void (**)(void, void))v70;
    if ((unint64_t)v78 > 0xE)
    {
      if (v60 <= 0 || (unint64_t)(v78 - 32) >= 0x92) {
        uint64_t v64 = 1;
      }
      else {
        uint64_t v64 = v60;
      }
    }
    else if (v61 <= 1)
    {
      uint64_t v64 = 1;
    }
    else
    {
      uint64_t v64 = v61;
    }
  }
  _WLLog();
  if (v63) {
    v63[2](v63, v64);
  }
}

uint64_t __63__WLWiFiManager__preferredChannel_network_channels_completion___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

uint64_t __63__WLWiFiManager__preferredChannel_network_channels_completion___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compare:");
}

- (__WiFiManagerClient)ref
{
  return self->_ref;
}

- (void)setRef:(__WiFiManagerClient *)a3
{
  self->_ref = a3;
}

@end
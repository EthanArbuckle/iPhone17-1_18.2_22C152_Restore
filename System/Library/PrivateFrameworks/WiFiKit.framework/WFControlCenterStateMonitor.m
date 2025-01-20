@interface WFControlCenterStateMonitor
- (BOOL)_airplaneModeEnabled;
- (BOOL)_isCellularOutrankingWiFi;
- (void)_performAction:(int64_t)a3;
- (void)_promptCarPlayDisable;
- (void)_promptCellularOutankDisable;
- (void)_promptMISDisable;
- (void)performAction;
- (void)performAction:(id)a3;
@end

@implementation WFControlCenterStateMonitor

- (void)performAction
{
}

- (void)performAction:(id)a3
{
  uint64_t v46 = *MEMORY[0x263EF8340];
  v4 = (void (**)(id, int64_t))a3;
  v5 = [(WFWiFiStateMonitor *)self client];
  int v6 = [v5 isPowerModificationDisabled];

  if (v6)
  {
LABEL_2:
    if (v4) {
      v4[2](v4, [(WFWiFiStateMonitor *)self state]);
    }
    goto LABEL_71;
  }
  BOOL v7 = [(WFControlCenterStateMonitor *)self _airplaneModeEnabled];
  unint64_t v8 = [(WFWiFiStateMonitor *)self state];
  unint64_t v9 = v8 - 2;
  v10 = WFLogForCategory(7uLL);
  os_log_type_t v11 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v10)
  {
    v12 = v10;
    if (os_log_type_enabled(v12, v11))
    {
      WFWiFiStateMonitorStringForState(v8);
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v40 = 138543874;
      v41 = v13;
      __int16 v42 = 1024;
      BOOL v43 = v9 < 3;
      __int16 v44 = 1024;
      BOOL v45 = v7;
      _os_log_impl(&dword_226071000, v12, v11, "{ACTION+} current state='%{public}@' poweredOn=%d airplaneMode=%d", (uint8_t *)&v40, 0x18u);
    }
  }

  if (v8 == 1)
  {
    v14 = WFLogForCategory(7uLL);
    os_log_type_t v15 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v14 && os_log_type_enabled(v14, v15))
    {
      LOWORD(v40) = 0;
      _os_log_impl(&dword_226071000, v14, v15, "{ACTION*} set powered to ON", (uint8_t *)&v40, 2u);
    }

    if (v4) {
      v4[2](v4, 3);
    }
    v16 = self;
    uint64_t v17 = 3;
    goto LABEL_70;
  }
  char v18 = !v7;
  if (v9 > 2) {
    char v18 = 1;
  }
  if ((v18 & 1) == 0)
  {
    if (v8 == 2) {
      uint64_t v19 = 1;
    }
    else {
      uint64_t v19 = 2;
    }
    if (v8 == 2) {
      uint64_t v20 = 3;
    }
    else {
      uint64_t v20 = 1;
    }
    v21 = WFLogForCategory(7uLL);
    os_log_type_t v22 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v21 && os_log_type_enabled(v21, v22))
    {
      v23 = @"Power Off";
      if (v8 == 2) {
        v23 = @"Enable Auto Join";
      }
      int v40 = 138543362;
      v41 = v23;
      v24 = v23;
      _os_log_impl(&dword_226071000, v21, v22, "{ACTION*} airplane mode is ON, next action is %{public}@", (uint8_t *)&v40, 0xCu);
    }
    if (v4) {
      v4[2](v4, v20);
    }
    v16 = self;
    uint64_t v17 = v19;
    goto LABEL_70;
  }
  if (v8 != 2)
  {
    if (v8 - 3 > 1)
    {
      if (v8 != 5) {
        goto LABEL_2;
      }
      v36 = WFLogForCategory(7uLL);
      os_log_type_t v37 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v36 && os_log_type_enabled(v36, v37))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_226071000, v36, v37, "{ACTION*} MIS active, prompting user", (uint8_t *)&v40, 2u);
      }

      if (v4) {
        v4[2](v4, 5);
      }
      v16 = self;
      uint64_t v17 = 4;
    }
    else
    {
      v27 = WFLogForCategory(7uLL);
      os_log_type_t v28 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v27 && os_log_type_enabled(v27, v28))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_226071000, v27, v28, "{ACTION*} diassociate and set userAutoJoin=0", (uint8_t *)&v40, 2u);
      }

      if (v4) {
        v4[2](v4, 2);
      }
      v16 = self;
      uint64_t v17 = 0;
    }
LABEL_70:
    [(WFControlCenterStateMonitor *)v16 _performAction:v17];
    goto LABEL_71;
  }
  if ([(WFWiFiStateMonitor *)self associatedToCarPlayOnly])
  {
    v25 = WFLogForCategory(7uLL);
    os_log_type_t v26 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v25 && os_log_type_enabled(v25, v26))
    {
      LOWORD(v40) = 0;
      _os_log_impl(&dword_226071000, v25, v26, "{ACTION*} associated to CarPlay Only network, prompting user", (uint8_t *)&v40, 2u);
    }

    v16 = self;
    uint64_t v17 = 6;
    goto LABEL_70;
  }
  if ([(WFControlCenterStateMonitor *)self _isCellularOutrankingWiFi])
  {
    v29 = [(WFWiFiStateMonitor *)self client];
    v30 = [v29 interface];
    v31 = [v30 currentNetwork];

    v32 = WFLogForCategory(7uLL);
    os_log_type_t v33 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel()) {
      BOOL v34 = v32 == 0;
    }
    else {
      BOOL v34 = 1;
    }
    int v35 = !v34;
    if (v31)
    {
      if (v35 && os_log_type_enabled(v32, v33))
      {
        LOWORD(v40) = 0;
        _os_log_impl(&dword_226071000, v32, v33, "{ACTION*} cellular is outranking WiFi, promping user", (uint8_t *)&v40, 2u);
      }

      v16 = self;
      uint64_t v17 = 8;
      goto LABEL_70;
    }
    if (v35 && os_log_type_enabled(v32, v33))
    {
      LOWORD(v40) = 0;
      _os_log_impl(&dword_226071000, v32, v33, "Cellular outrank is in progress with no current network", (uint8_t *)&v40, 2u);
    }
  }
  v38 = WFLogForCategory(7uLL);
  os_log_type_t v39 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v38 && os_log_type_enabled(v38, v39))
  {
    LOWORD(v40) = 0;
    _os_log_impl(&dword_226071000, v38, v39, "{ACTION*} setting userAutoJoin=1", (uint8_t *)&v40, 2u);
  }

  if (v4) {
    v4[2](v4, 3);
  }
  [(WFControlCenterStateMonitor *)self _performAction:1];
  [(WFWiFiStateMonitor *)self _updateState];
LABEL_71:
}

- (void)_performAction:(int64_t)a3
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  v5 = WFLogForCategory(7uLL);
  os_log_type_t v6 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v5 && os_log_type_enabled(v5, v6))
  {
    if ((unint64_t)a3 > 9) {
      BOOL v7 = @"Unknown";
    }
    else {
      BOOL v7 = off_26478F1F8[a3];
    }
    *(_DWORD *)buf = 138543362;
    v47 = (const char *)v7;
    _os_log_impl(&dword_226071000, v5, v6, "{ACTION-} performing action='%{public}@'", buf, 0xCu);
  }

  switch(a3)
  {
    case 0:
      unint64_t v9 = WFLogForCategory(7uLL);
      os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v9 && os_log_type_enabled(v9, v10))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_226071000, v9, v10, "%s: disabling user autojoin", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      os_log_type_t v11 = [(WFWiFiStateMonitor *)self client];
      v40[0] = MEMORY[0x263EF8330];
      v40[1] = 3221225472;
      v40[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_3;
      v40[3] = &unk_26478E3E8;
      objc_copyWeak(&v41, (id *)buf);
      [v11 setUserAutoJoinState:0 completion:v40];

      objc_destroyWeak(&v41);
      objc_destroyWeak((id *)buf);
      break;
    case 1:
      v12 = WFLogForCategory(7uLL);
      os_log_type_t v13 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v12 && os_log_type_enabled(v12, v13))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_226071000, v12, v13, "%s: enabling user autojoin", buf, 0xCu);
      }

      objc_initWeak((id *)buf, self);
      v14 = [(WFWiFiStateMonitor *)self client];
      v42[0] = MEMORY[0x263EF8330];
      v42[1] = 3221225472;
      v42[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_1;
      v42[3] = &unk_26478E3E8;
      objc_copyWeak(&v43, (id *)buf);
      [v14 setUserAutoJoinState:1 completion:v42];

      objc_destroyWeak(&v43);
      objc_destroyWeak((id *)buf);
      break;
    case 2:
    case 3:
      objc_initWeak((id *)buf, self);
      unint64_t v8 = [(WFWiFiStateMonitor *)self client];
      v44[0] = MEMORY[0x263EF8330];
      v44[1] = 3221225472;
      v44[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke;
      v44[3] = &unk_26478EBE0;
      objc_copyWeak(&v45, (id *)buf);
      [v8 setPoweredToggle:a3 == 3 handler:v44];

      objc_destroyWeak(&v45);
      objc_destroyWeak((id *)buf);
      break;
    case 4:
      os_log_type_t v15 = WFLogForCategory(7uLL);
      os_log_type_t v16 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v15 && os_log_type_enabled(v15, v16))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_226071000, v15, v16, "%s: prompting to disable MIS", buf, 0xCu);
      }

      [(WFControlCenterStateMonitor *)self _promptMISDisable];
      break;
    case 5:
      os_log_type_t v22 = WFLogForCategory(7uLL);
      os_log_type_t v23 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v22 && os_log_type_enabled(v22, v23))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_226071000, v22, v23, "%s: disable MIS", buf, 0xCu);
      }

      v24 = [(WFWiFiStateMonitor *)self client];
      [v24 setMISDiscoveryState:0 immediateDisable:1];

      v25 = [(WFWiFiStateMonitor *)self client];
      [v25 setMISState:0];

      [(WFWiFiStateMonitor *)self _updateState];
      break;
    case 6:
      os_log_type_t v26 = WFLogForCategory(7uLL);
      os_log_type_t v27 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v26 && os_log_type_enabled(v26, v27))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_226071000, v26, v27, "%s: prompting to disable CarPlay", buf, 0xCu);
      }

      [(WFControlCenterStateMonitor *)self _promptCarPlayDisable];
      break;
    case 7:
      os_log_type_t v28 = WFLogForCategory(7uLL);
      os_log_type_t v29 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v28 && os_log_type_enabled(v28, v29))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_226071000, v28, v29, "%s: disable CarPlay", buf, 0xCu);
      }

      v30 = [(WFWiFiStateMonitor *)self client];
      v31 = [v30 interface];

      if (v31)
      {
        v39[0] = MEMORY[0x263EF8330];
        v39[1] = 3221225472;
        v39[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_5;
        v39[3] = &unk_26478E528;
        v39[4] = self;
        [v31 disassociateFromCurrentNetworkWithCompletion:v39];
      }
      else
      {
        v36 = WFLogForCategory(7uLL);
        os_log_type_t v37 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v36 && os_log_type_enabled(v36, v37))
        {
          *(_DWORD *)buf = 136315138;
          v47 = "-[WFControlCenterStateMonitor _performAction:]";
          _os_log_impl(&dword_226071000, v36, v37, "%s: failed to get WFInterface", buf, 0xCu);
        }
      }
      break;
    case 8:
      v32 = WFLogForCategory(7uLL);
      os_log_type_t v33 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v32 && os_log_type_enabled(v32, v33))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_226071000, v32, v33, "%s: prompting to disable cellular outrank", buf, 0xCu);
      }

      [(WFControlCenterStateMonitor *)self _promptCellularOutankDisable];
      break;
    case 9:
      uint64_t v17 = WFLogForCategory(7uLL);
      os_log_type_t v18 = OSLogForWFLogLevel(1uLL);
      if (WFCurrentLogLevel() && v17 && os_log_type_enabled(v17, v18))
      {
        *(_DWORD *)buf = 136315138;
        v47 = "-[WFControlCenterStateMonitor _performAction:]";
        _os_log_impl(&dword_226071000, v17, v18, "%s: disabling cellular outrank", buf, 0xCu);
      }

      uint64_t v19 = [(WFWiFiStateMonitor *)self client];
      uint64_t v20 = [v19 interface];

      if (v20)
      {
        v21 = [v20 currentNetwork];
        v38[0] = MEMORY[0x263EF8330];
        v38[1] = 3221225472;
        v38[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_6;
        v38[3] = &unk_26478F1D8;
        v38[4] = self;
        [v20 asyncAssociateToNetwork:v21 profile:0 reply:v38];
      }
      else
      {
        BOOL v34 = WFLogForCategory(7uLL);
        os_log_type_t v35 = OSLogForWFLogLevel(1uLL);
        if (WFCurrentLogLevel() && v34 && os_log_type_enabled(v34, v35))
        {
          *(_DWORD *)buf = 136315138;
          v47 = "-[WFControlCenterStateMonitor _performAction:]";
          _os_log_impl(&dword_226071000, v34, v35, "%s: failed to get WFInterface", buf, 0xCu);
        }
      }
      break;
    default:
      return;
  }
}

void __46__WFControlCenterStateMonitor__performAction___block_invoke(uint64_t a1, int a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  v4 = WFLogForCategory(7uLL);
  os_log_type_t v5 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v4 && os_log_type_enabled(v4, v5))
  {
    int v7 = 136315394;
    unint64_t v8 = "-[WFControlCenterStateMonitor _performAction:]_block_invoke";
    __int16 v9 = 1024;
    int v10 = a2;
    _os_log_impl(&dword_226071000, v4, v5, "%s: power toggle handler called, powered=%d", (uint8_t *)&v7, 0x12u);
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateState];
}

void __46__WFControlCenterStateMonitor__performAction___block_invoke_1(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_2;
  block[3] = &unk_26478E528;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __46__WFControlCenterStateMonitor__performAction___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState];
}

void __46__WFControlCenterStateMonitor__performAction___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__WFControlCenterStateMonitor__performAction___block_invoke_2_4;
  block[3] = &unk_26478E528;
  block[4] = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __46__WFControlCenterStateMonitor__performAction___block_invoke_2_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState];
}

uint64_t __46__WFControlCenterStateMonitor__performAction___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) _updateState];
}

void __46__WFControlCenterStateMonitor__performAction___block_invoke_6(uint64_t a1, int a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v5 = a3;
  os_log_type_t v6 = WFLogForCategory(7uLL);
  os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
  {
    v8[0] = 67109378;
    v8[1] = a2;
    __int16 v9 = 2112;
    id v10 = v5;
    _os_log_impl(&dword_226071000, v6, v7, "cellular outrank association success=%d error='%@'", (uint8_t *)v8, 0x12u);
  }

  [*(id *)(a1 + 32) _updateState];
}

- (BOOL)_airplaneModeEnabled
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  v2 = SCPreferencesCreate((CFAllocatorRef)*MEMORY[0x263EFFB08], @"com.apple.wifikit", @"com.apple.radios.plist");
  if (v2)
  {
    v3 = v2;
    BOOL v4 = SCPreferencesGetValue(v2, @"AirplaneMode") == (CFPropertyListRef)*MEMORY[0x263EFFB40];
    CFRelease(v3);
  }
  else
  {
    os_log_type_t v6 = WFLogForCategory(7uLL);
    os_log_type_t v7 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v6 && os_log_type_enabled(v6, v7))
    {
      int v8 = 136315138;
      __int16 v9 = "-[WFControlCenterStateMonitor _airplaneModeEnabled]";
      _os_log_impl(&dword_226071000, v6, v7, "%s: failed to create preferences ref", (uint8_t *)&v8, 0xCu);
    }

    return 0;
  }
  return v4;
}

- (BOOL)_isCellularOutrankingWiFi
{
  v2 = [(WFWiFiStateMonitor *)self client];
  char v3 = [v2 isCellularOutrankingWiFi];

  return v3;
}

- (void)_promptMISDisable
{
  char v3 = +[WFMISDisablePromptOperation misDisablePromptOperation];
  BOOL v4 = [MEMORY[0x263F08A48] mainQueue];
  [v4 addOperation:v3];

  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__WFControlCenterStateMonitor__promptMISDisable__block_invoke;
  v5[3] = &unk_26478E990;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  [v3 setCompletionBlock:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __48__WFControlCenterStateMonitor__promptMISDisable__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__WFControlCenterStateMonitor__promptMISDisable__block_invoke_2;
  v5[3] = &unk_26478E7D8;
  id v6 = WeakRetained;
  id v7 = v3;
  id v4 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __48__WFControlCenterStateMonitor__promptMISDisable__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) result];
  id v3 = WFLogForCategory(7uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v2 == 2)
  {
    if (v6)
    {
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v3, v4, "User accepted prompt to disable MIS", buf, 2u);
      }
    }

    [*(id *)(a1 + 40) _performAction:5];
  }
  else
  {
    if (v6 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_226071000, v3, v4, "User did not accept prompt to disable MIS", v7, 2u);
    }
  }
}

- (void)_promptCarPlayDisable
{
  id v3 = +[WFCarPlayDisablePromptOperation carPlayDisablePromptOperation];
  os_log_type_t v4 = [MEMORY[0x263F08A48] mainQueue];
  [v4 addOperation:v3];

  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__WFControlCenterStateMonitor__promptCarPlayDisable__block_invoke;
  v5[3] = &unk_26478E990;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, &from);
  [v3 setCompletionBlock:v5];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);
}

void __52__WFControlCenterStateMonitor__promptCarPlayDisable__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __52__WFControlCenterStateMonitor__promptCarPlayDisable__block_invoke_2;
  v5[3] = &unk_26478E7D8;
  id v6 = WeakRetained;
  id v7 = v3;
  id v4 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __52__WFControlCenterStateMonitor__promptCarPlayDisable__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) result];
  id v3 = WFLogForCategory(7uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v2 == 2)
  {
    if (v6)
    {
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v3, v4, "User accepted prompt to disable CarPlay", buf, 2u);
      }
    }

    [*(id *)(a1 + 40) _performAction:7];
  }
  else
  {
    if (v6 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_226071000, v3, v4, "User did not accept prompt to disable CarPlay", v7, 2u);
    }
  }
}

- (void)_promptCellularOutankDisable
{
  id v3 = [(WFWiFiStateMonitor *)self client];
  os_log_type_t v4 = [v3 interface];
  BOOL v5 = [v4 currentNetwork];
  int v6 = [v5 ssid];

  if (v6)
  {
    id v7 = [(WFWiFiStateMonitor *)self client];
    int v8 = +[WFCellularOutrankPromptOperation cellularOutrankPromptOperationWithNetworkName:privateCellular:](WFCellularOutrankPromptOperation, "cellularOutrankPromptOperationWithNetworkName:privateCellular:", v6, [v7 cellularOutrankState] == 5);

    __int16 v9 = [MEMORY[0x263F08A48] mainQueue];
    [v9 addOperation:v8];

    objc_initWeak(location, v8);
    objc_initWeak(&from, self);
    v11[0] = MEMORY[0x263EF8330];
    v11[1] = 3221225472;
    v11[2] = __59__WFControlCenterStateMonitor__promptCellularOutankDisable__block_invoke;
    v11[3] = &unk_26478E990;
    objc_copyWeak(&v12, location);
    objc_copyWeak(&v13, &from);
    [v8 setCompletionBlock:v11];
    objc_destroyWeak(&v13);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&from);
    objc_destroyWeak(location);
  }
  else
  {
    int v8 = WFLogForCategory(7uLL);
    os_log_type_t v10 = OSLogForWFLogLevel(1uLL);
    if (WFCurrentLogLevel() && v8 && os_log_type_enabled(v8, v10))
    {
      LOWORD(location[0]) = 0;
      _os_log_impl(&dword_226071000, v8, v10, "nil network name, unable to prompt for cellular outrank", (uint8_t *)location, 2u);
    }
  }
}

void __59__WFControlCenterStateMonitor__promptCellularOutankDisable__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__WFControlCenterStateMonitor__promptCellularOutankDisable__block_invoke_2;
  v5[3] = &unk_26478E7D8;
  id v6 = WeakRetained;
  id v7 = v3;
  id v4 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

void __59__WFControlCenterStateMonitor__promptCellularOutankDisable__block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) result];
  id v3 = WFLogForCategory(7uLL);
  os_log_type_t v4 = OSLogForWFLogLevel(1uLL);
  if (WFCurrentLogLevel()) {
    BOOL v5 = v3 == 0;
  }
  else {
    BOOL v5 = 1;
  }
  int v6 = !v5;
  if (v2 == 2)
  {
    if (v6)
    {
      if (os_log_type_enabled(v3, v4))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_226071000, v3, v4, "User accepted prompt to disable cellular outrank", buf, 2u);
      }
    }

    [*(id *)(a1 + 40) _performAction:9];
  }
  else
  {
    if (v6 && os_log_type_enabled(v3, v4))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_226071000, v3, v4, "User did not accept prompt to disable cellular outrank", v7, 2u);
    }
  }
}

@end
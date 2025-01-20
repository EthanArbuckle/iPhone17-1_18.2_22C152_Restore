@interface Gmo
- (BOOL)debugMode;
- (BOOL)gmoConfigDone;
- (BOOL)gmoInitDone;
- (BOOL)isActive;
- (BOOL)prevSessionDataLoaded;
- (BOOL)setSessionState:(id)a3;
- (BOOL)validateFrameBank:(unsigned __int8)a3 fwConfigId:(unsigned int)a4 frameAnchors:(const SpConfig *)a5 internalFwError:(BOOL)a6;
- (Gmo)initWithUnitInfo:(PeridotUnitInfo *)a3 sessionState:(id)a4;
- (GmoController)controller;
- (PDAnchors)setAnchors;
- (PDOnlineConfigRequest)configRequestObj;
- (PeridotUnitInfo)unitInfo;
- (id)copySessionState;
- (int)processFrameWithBank:(const GmoProcessBankInputs *)a3 gmoResult:(GmoResult *)a4;
- (unint64_t)bankCounter;
- (unsigned)expectedConfigID;
- (unsigned)getCfgBits;
- (void)setBankCounter:(unint64_t)a3;
- (void)setCfgBits:(unsigned int)a3;
- (void)setConfigRequestObj:(id)a3;
- (void)setDebugMode:(BOOL)a3;
- (void)setExpectedConfigID:(unsigned int)a3;
- (void)setGmoConfigDone:(BOOL)a3;
- (void)setGmoInitDone:(BOOL)a3;
- (void)setPrevSessionDataLoaded:(BOOL)a3;
- (void)setSetAnchors:(PDAnchors *)a3;
- (void)setUnitInfo:(PeridotUnitInfo *)a3;
@end

@implementation Gmo

- (int)processFrameWithBank:(const GmoProcessBankInputs *)a3 gmoResult:(GmoResult *)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  if (!self->_gmoConfigDone)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v17 = 136315138;
      v18 = "-[Gmo processFrameWithBank:gmoResult:]";
      v8 = &_os_log_internal;
      v9 = "GMO: %s: WARNING: GMO is not configured => GMO is disabled";
      uint32_t v10 = 12;
      goto LABEL_7;
    }
    return -1;
  }
  if (([(GmoController *)self->_controller gmoCfgBits] & 1) == 0)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      v7.all = [(GmoController *)self->_controller gmoCfgBits];
      int v17 = 136315394;
      v18 = "-[Gmo processFrameWithBank:gmoResult:]";
      __int16 v19 = 1024;
      LODWORD(v20) = v7;
      v8 = &_os_log_internal;
      v9 = "GMO: %s: WARNING: GMO is disabled. gmoCfgBits: 0x%08x";
      uint32_t v10 = 18;
LABEL_7:
      _os_log_impl(&dword_258FEE000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v17, v10);
      return -1;
    }
    return -1;
  }
  if (![(Gmo *)self validateFrameBank:LOBYTE(a3->var0) fwConfigId:a3->var6 frameAnchors:&a3->var12.var0.var0[2].var0[3].var0[2].var0[1][1] internalFwError:a3->var9])return -1; {
  if ([(GmoController *)self->_controller processFrameWithBank:a3 gmoResult:a4])
  }
    return 2;
  if (a4->var0)
  {
    char v12 = (char)[(GmoController *)self->_controller gmoCfgBits];
    BOOL v13 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    if ((v12 & 2) != 0)
    {
      if (v13)
      {
        unint64_t var1 = a4->var1;
        int v17 = 136315394;
        v18 = "-[Gmo processFrameWithBank:gmoResult:]";
        __int16 v19 = 2048;
        unint64_t v20 = var1;
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Updating anchors: %zu", (uint8_t *)&v17, 0x16u);
      }
      memcpy(&self->_setAnchors, a4->var2, sizeof(self->_setAnchors));
      v15 = [self->_unitInfo->var2 updateAnchors:&self->_setAnchors];
      configRequestObj = self->_configRequestObj;
      self->_configRequestObj = v15;
    }
    else if (v13)
    {
      int v17 = 136315138;
      v18 = "-[Gmo processFrameWithBank:gmoResult:]";
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: WARNINIG: Anchor update is disabled.", (uint8_t *)&v17, 0xCu);
    }
  }
  return !a4->var0;
}

- (BOOL)validateFrameBank:(unsigned __int8)a3 fwConfigId:(unsigned int)a4 frameAnchors:(const SpConfig *)a5 internalFwError:(BOOL)a6
{
  if (a6)
  {
    BOOL v6 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
    LOBYTE(v7) = 0;
    if (v6)
    {
      *(_WORD *)__int16 v19 = 0;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "PeridotDepthGMO: received invalid frame, internalFwError flag value is: true", v19, 2u);
LABEL_51:
      LOBYTE(v7) = 0;
    }
  }
  else
  {
    unsigned int v10 = a3;
    configRequestObj = self->_configRequestObj;
    if (configRequestObj)
    {
      BOOL v7 = [(PDOnlineConfigRequest *)configRequestObj newConfigIDAvailable];
      if (!v7) {
        return v7;
      }
      self->_unsigned int expectedConfigID = [(PDOnlineConfigRequest *)self->_configRequestObj newConfigID];
      BOOL v13 = self->_configRequestObj;
      self->_configRequestObj = 0;
    }
    unsigned int expectedConfigID = self->_expectedConfigID;
    if (expectedConfigID > a4) {
      goto LABEL_51;
    }
    if (expectedConfigID)
    {
      v15 = (char *)self + 42 * v10;
      int v17 = v15[56];
      v16 = (unsigned __int8 *)(v15 + 56);
      if (a5->var0[0] != v17
        || a5->var1[0] != v16[1]
        || a5->var2[0] != v16[2]
        || a5->var0[1] != v16[3]
        || a5->var1[1] != v16[4]
        || a5->var2[1] != v16[5]
        || a5->var0[2] != v16[6]
        || a5->var1[2] != v16[7]
        || a5->var2[2] != v16[8]
        || a5->var0[3] != v16[9]
        || a5->var1[3] != v16[10]
        || a5->var2[3] != v16[11]
        || a5->var0[4] != v16[12]
        || a5->var1[4] != v16[13]
        || a5->var2[4] != v16[14]
        || a5->var0[5] != v16[15]
        || a5->var1[5] != v16[16]
        || a5->var2[5] != v16[17]
        || a5->var0[6] != v16[18]
        || a5->var1[6] != v16[19]
        || a5->var2[6] != v16[20]
        || a5->var0[7] != v16[21]
        || a5->var1[7] != v16[22]
        || a5->var2[7] != v16[23]
        || a5->var0[8] != v16[24]
        || a5->var1[8] != v16[25]
        || a5->var2[8] != v16[26]
        || a5->var0[9] != v16[27]
        || a5->var1[9] != v16[28]
        || a5->var2[9] != v16[29]
        || a5->var0[10] != v16[30]
        || a5->var1[10] != v16[31]
        || a5->var2[10] != v16[32]
        || a5->var0[11] != v16[33]
        || a5->var1[11] != v16[34]
        || a5->var2[11] != v16[35]
        || a5->var0[12] != v16[36]
        || a5->var1[12] != v16[37]
        || a5->var2[12] != v16[38]
        || a5->var0[13] != v16[39]
        || a5->var1[13] != v16[40])
      {
        goto LABEL_51;
      }
      LOBYTE(v7) = a5->var2[13] == v16[41];
    }
    else
    {
      LOBYTE(v7) = 1;
    }
  }
  return v7;
}

- (BOOL)setSessionState:(id)a3
{
  uint64_t v23 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = v4;
  memset(v15, 0, 268);
  if (!self->_gmoInitDone)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      int v17 = "-[Gmo setSessionState:]";
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: ERROR: Attempt to configure session data before GMO init", buf, 0xCu);
    }
    __assert_rtn("-[Gmo setSessionState:]", "Gmo.mm", 146, "!\"ERROR: Attempt to configure session data before GMO init\"");
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", @"gmoSessionState", *(_OWORD *)v15, *(_OWORD *)&v15[16], *(_OWORD *)&v15[32], *(_OWORD *)&v15[48], *(_OWORD *)&v15[64], *(_OWORD *)&v15[80], *(_OWORD *)&v15[96], *(_OWORD *)&v15[112], *(_OWORD *)&v15[128], *(_OWORD *)&v15[144], *(_OWORD *)&v15[160], *(_OWORD *)&v15[176], *(_OWORD *)&v15[192], *(_OWORD *)&v15[208], *(_OWORD *)&v15[224], *(void *)&v15[240],
    *(_OWORD *)&v15[248],
  BOOL v6 = *(void *)&v15[264]);

  if (!v6)
  {
    BOOL v10 = 0;
    if (!os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT)) {
      goto LABEL_19;
    }
    *(_DWORD *)buf = 136315138;
    int v17 = "-[Gmo setSessionState:]";
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: WARNING: No depthProcessor state data provided => Using empty session data\n", buf, 0xCu);
LABEL_18:
    BOOL v10 = 0;
    goto LABEL_19;
  }
  BOOL v7 = [v5 objectForKeyedSubscript:@"gmoSessionState"];
  v8 = [v7 objectForKeyedSubscript:@"pattern"];

  if (v8)
  {
    v9 = [v7 objectForKeyedSubscript:@"pattern"];
  }
  else
  {
    v9 = 0;
  }
  v11 = [v7 objectForKeyedSubscript:@"version"];

  if (v11)
  {
    char v12 = [v7 objectForKeyedSubscript:@"version"];
  }
  else
  {
    char v12 = 0;
  }
  if (![v9 isEqual:&unk_27071DC48]
    || ![v12 isEqual:&unk_27071DC60])
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136316162;
      int v17 = "-[Gmo setSessionState:]";
      __int16 v18 = 1024;
      *(_DWORD *)__int16 v19 = [&unk_27071DC48 intValue];
      *(_WORD *)&v19[4] = 1024;
      *(_DWORD *)&v19[6] = [v9 intValue];
      *(_WORD *)unint64_t v20 = 2112;
      *(void *)&v20[2] = v12;
      __int16 v21 = 2112;
      v22 = &unk_27071DC60;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: WARNING: GMO session persistent data integrity check failed. Expected pattern: 0x%08X found:  0x%08X, Expected version: %@, found: %@ -> ignoring & overwriting with empty data.", buf, 0x2Cu);
    }

    goto LABEL_18;
  }
  *(_DWORD *)v15 = [v9 intValue];
  *(_DWORD *)&v15[4] = objc_msgSend(v12, "intValue", *(void *)v15);

  BOOL v13 = [v7 objectForKeyedSubscript:@"coreAnalyticsData"];
  if ([v13 length] == 260)
  {
    [v13 getBytes:&v15[8] length:260];
  }
  else
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315650;
      int v17 = "-[Gmo setSessionState:]";
      __int16 v18 = 2048;
      *(void *)__int16 v19 = 260;
      *(_WORD *)&v19[8] = 2048;
      *(void *)unint64_t v20 = [v13 length];
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: WARNING: GMO session CoreAnalytics data size mismatch. Expected %lu, found:%lu -> ignoring & overwriting with empty data.", buf, 0x20u);
    }
    memset(&v15[8], 0, 260);
  }

  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    int v17 = "-[Gmo setSessionState:]";
    __int16 v18 = 2048;
    *(void *)__int16 v19 = v5;
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Got previous session data dict: %p", buf, 0x16u);
  }
  [(GmoController *)self->_controller setSessionPersistentData:v15];
  self->_prevSessionDataLoaded = 1;

  BOOL v10 = 1;
LABEL_19:

  return v10;
}

- (Gmo)initWithUnitInfo:(PeridotUnitInfo *)a3 sessionState:(id)a4
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  v10.receiver = self;
  v10.super_class = (Class)Gmo;
  v5 = [(Gmo *)&v10 init];
  if (v5)
  {
    if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      char v12 = "-[Gmo initWithUnitInfo:sessionState:]";
      __int16 v13 = 2080;
      v14 = "3.2.2";
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: GMO Init ver %s ...", buf, 0x16u);
    }
    *(_WORD *)&v5->_gmoConfigDone = 0;
    v5->_unsigned int expectedConfigID = 0;
    v5->_bankCounter = 0;
    v5->_unitInfo = a3;
    configRequestObj = v5->_configRequestObj;
    v5->_configRequestObj = 0;

    v5->_isActive = 0;
    BOOL v7 = [[GmoController alloc] initWithUnitInfo:v5->_unitInfo];
    controller = v5->_controller;
    v5->_controller = v7;

    v5->_gmoInitDone = 1;
  }
  return v5;
}

- (void)setCfgBits:(unsigned int)a3
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  BOOL v5 = os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT);
  if (a3 == 0xFFFF)
  {
    if (v5)
    {
      int v6 = 136315394;
      BOOL v7 = "-[Gmo setCfgBits:]";
      __int16 v8 = 1024;
      unsigned int v9 = 7;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Setting gmo default config 0x%x", (uint8_t *)&v6, 0x12u);
    }
    [(GmoController *)self->_controller setGmoCfgBits:7];
  }
  else
  {
    if (v5)
    {
      int v6 = 136315394;
      BOOL v7 = "-[Gmo setCfgBits:]";
      __int16 v8 = 1024;
      unsigned int v9 = a3;
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Setting flow enable bits to 0x%x", (uint8_t *)&v6, 0x12u);
    }
    [(GmoController *)self->_controller setGmoCfgBits:a3];
    if ((a3 & 1) == 0)
    {
      if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
      {
        int v6 = 136315138;
        BOOL v7 = "-[Gmo setCfgBits:]";
        _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: WARNING: GMO is DISABLED", (uint8_t *)&v6, 0xCu);
      }
      self->_isActive = 0;
    }
    if ((a3 & 2) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      BOOL v7 = "-[Gmo setCfgBits:]";
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: WARNING: Anchor updates is OFF\n", (uint8_t *)&v6, 0xCu);
    }
    if ((a3 & 4) == 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      BOOL v7 = "-[Gmo setCfgBits:]";
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: WARNING: GlobalEstimation is OFF. Using smoothed spot location instead.\n", (uint8_t *)&v6, 0xCu);
    }
    if ((a3 & 0x40000000) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      BOOL v7 = "-[Gmo setCfgBits:]";
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: GMO ITP Qual Calc is ON\n", (uint8_t *)&v6, 0xCu);
    }
    if ((a3 & 0x80000000) != 0 && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 136315138;
      BOOL v7 = "-[Gmo setCfgBits:]";
      _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: GMO Debug Mode is ON\n", (uint8_t *)&v6, 0xCu);
    }
  }
  self->_gmoConfigDone = 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_configRequestObj, 0);
}

- (void)setDebugMode:(BOOL)a3
{
  self->_debugMode = a3;
}

- (BOOL)debugMode
{
  return self->_debugMode;
}

- (GmoController)controller
{
  return self->_controller;
}

- (void)setUnitInfo:(PeridotUnitInfo *)a3
{
  self->_unitInfo = a3;
}

- (PeridotUnitInfo)unitInfo
{
  return self->_unitInfo;
}

- (void)setSetAnchors:(PDAnchors *)a3
{
}

- (PDAnchors)setAnchors
{
  return (PDAnchors *)memcpy(retstr, &self->_setAnchors, sizeof(PDAnchors));
}

- (void)setBankCounter:(unint64_t)a3
{
  self->_bankCounter = a3;
}

- (unint64_t)bankCounter
{
  return self->_bankCounter;
}

- (void)setConfigRequestObj:(id)a3
{
}

- (PDOnlineConfigRequest)configRequestObj
{
  return self->_configRequestObj;
}

- (void)setExpectedConfigID:(unsigned int)a3
{
  self->_unsigned int expectedConfigID = a3;
}

- (unsigned)expectedConfigID
{
  return self->_expectedConfigID;
}

- (void)setPrevSessionDataLoaded:(BOOL)a3
{
  self->_prevSessionDataLoaded = a3;
}

- (BOOL)prevSessionDataLoaded
{
  return self->_prevSessionDataLoaded;
}

- (void)setGmoConfigDone:(BOOL)a3
{
  self->_gmoConfigDone = a3;
}

- (BOOL)gmoConfigDone
{
  return self->_gmoConfigDone;
}

- (void)setGmoInitDone:(BOOL)a3
{
  self->_gmoInitDone = a3;
}

- (BOOL)gmoInitDone
{
  return self->_gmoInitDone;
}

- (BOOL)isActive
{
  return self->_isActive;
}

- (id)copySessionState
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  if (os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v10) = 136315138;
    *(void *)((char *)&v10 + 4) = "-[Gmo copySessionState]";
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: Got stream shutdown notification. Providing session data for storage...", (uint8_t *)&v10, 0xCu);
  }
  if (!self->_prevSessionDataLoaded && os_log_type_enabled(&_os_log_internal, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v10) = 136315138;
    *(void *)((char *)&v10 + 4) = "-[Gmo copySessionState]";
    _os_log_impl(&dword_258FEE000, &_os_log_internal, OS_LOG_TYPE_DEFAULT, "GMO: %s: WARNING: No previous GMO session data was provided. Starting from current session data.", (uint8_t *)&v10, 0xCu);
  }
  controller = self->_controller;
  if (controller)
  {
    [(GmoController *)controller sessionCalcState];
  }
  else
  {
    long long v24 = 0u;
    memset(v25, 0, 28);
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = 0u;
    long long v11 = 0u;
  }
  objc_msgSend(MEMORY[0x263EFF9A0], "dictionary", v10, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20, v21, v22, v23, v24, *(void *)v25, *(_OWORD *)&v25[8],
  id v4 = *(void *)&v25[24]);
  BOOL v5 = [MEMORY[0x263EFF9A0] dictionary];
  [v4 setObject:v5 forKeyedSubscript:@"gmoSessionState"];
  int v6 = [NSNumber numberWithUnsignedInt:v10];
  [v5 setObject:v6 forKeyedSubscript:@"pattern"];

  BOOL v7 = [NSNumber numberWithUnsignedInt:DWORD1(v10)];
  [v5 setObject:v7 forKeyedSubscript:@"version"];

  __int16 v8 = [MEMORY[0x263EFF8F8] dataWithBytes:(char *)&v10 + 8 length:260];
  [v5 setObject:v8 forKeyedSubscript:@"coreAnalyticsData"];

  return v4;
}

- (unsigned)getCfgBits
{
  return [(GmoController *)self->_controller gmoCfgBits];
}

@end
@interface NWStatsTargetSelector
- (BOOL)_applySelection:(id)a3;
- (BOOL)shouldAddProvider:(int)a3;
- (NSDictionary)suppliedParams;
- (NWStatsTargetSelector)initWithMultipleSelections:(id)a3;
- (NWStatsTargetSelector)initWithSelection:(id)a3;
- (id)description;
- (unint64_t)connFilter;
- (unint64_t)events;
- (unint64_t)filter;
- (void)setConnFilter:(unint64_t)a3;
- (void)setEvents:(unint64_t)a3;
- (void)setFilter:(unint64_t)a3;
- (void)setSuppliedParams:(id)a3;
@end

@implementation NWStatsTargetSelector

- (BOOL)_applySelection:(id)a3
{
  uint64_t v97 = *MEMORY[0x263EF8340];
  id v5 = a3;
  objc_storeStrong((id *)&self->_suppliedParams, a3);
  v6 = [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowEvents"];

  if (v6)
  {
    v7 = [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowEvents"];
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    if (isKindOfClass)
    {
      v9 = [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowEvents"];
      self->_events |= [v9 unsignedLongLongValue];
    }
    else
    {
      v9 = NStatGetLog();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowEvents"];
        int v95 = 138412290;
        v96 = v10;
        _os_log_impl(&dword_21C4BC000, v9, OS_LOG_TYPE_ERROR, "Incorrect class for configuration item %@", (uint8_t *)&v95, 0xCu);
      }
    }
  }
  v11 = [v5 objectForKeyedSubscript:@"kNWStatsSelectConnEvents"];

  if (v11)
  {
    v12 = [v5 objectForKeyedSubscript:@"kNWStatsSelectConnEvents"];
    objc_opt_class();
    char v13 = objc_opt_isKindOfClass();

    if (v13)
    {
      v14 = [v5 objectForKeyedSubscript:@"kNWStatsSelectConnEvents"];
      self->_events |= [v14 unsignedLongLongValue];
    }
    else
    {
      v14 = NStatGetLog();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = [v5 objectForKeyedSubscript:@"kNWStatsSelectConnEvents"];
        int v95 = 138412290;
        v96 = v15;
        _os_log_impl(&dword_21C4BC000, v14, OS_LOG_TYPE_ERROR, "Incorrect class for configuration item %@", (uint8_t *)&v95, 0xCu);
      }
    }
  }
  uint64_t v16 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCellular"];
  if (v16)
  {
    v17 = (void *)v16;
    v18 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCellular"];
    int v19 = [v18 BOOLValue];

    if (v19) {
      self->_filter |= 4uLL;
    }
  }
  uint64_t v20 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceWiFi"];
  if (v20)
  {
    v21 = (void *)v20;
    v22 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceWiFi"];
    int v23 = [v22 BOOLValue];

    if (v23) {
      self->_filter |= 8uLL;
    }
  }
  uint64_t v24 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceWired"];
  if (v24)
  {
    v25 = (void *)v24;
    v26 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceWired"];
    int v27 = [v26 BOOLValue];

    if (v27) {
      self->_filter |= 0x10uLL;
    }
  }
  uint64_t v28 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCompanionLink"];
  if (v28)
  {
    v29 = (void *)v28;
    v30 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCompanionLink"];
    int v31 = [v30 BOOLValue];

    if (v31) {
      self->_filter |= 0x200uLL;
    }
  }
  uint64_t v32 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCompanionLinkBluetooth"];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCompanionLinkBluetooth"];
    int v35 = [v34 BOOLValue];

    if (v35) {
      self->_filter |= 0x400000040000uLL;
    }
  }
  uint64_t v36 = [v5 objectForKeyedSubscript:@"kNWStatsSelectBluetoothCounts"];
  if (v36)
  {
    v37 = (void *)v36;
    v38 = [v5 objectForKeyedSubscript:@"kNWStatsSelectBluetoothCounts"];
    int v39 = [v38 BOOLValue];

    if (v39) {
      self->_filter |= 0x400000000000uLL;
    }
  }
  uint64_t v40 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceLoopback"];
  if (v40)
  {
    v41 = (void *)v40;
    v42 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceLoopback"];
    int v43 = [v42 BOOLValue];

    if (v43) {
      self->_filter |= 2uLL;
    }
  }
  uint64_t v44 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceExpensive"];
  if (v44)
  {
    v45 = (void *)v44;
    v46 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceExpensive"];
    int v47 = [v46 BOOLValue];

    if (v47) {
      self->_filter |= 0x40uLL;
    }
  }
  uint64_t v48 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCellularViaFallback"];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceCellularViaFallback"];
    int v51 = [v50 BOOLValue];

    if (v51) {
      self->_filter |= 0x100uLL;
    }
  }
  uint64_t v52 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceAWDL"];
  if (v52)
  {
    v53 = (void *)v52;
    v54 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceAWDL"];
    int v55 = [v54 BOOLValue];

    if (v55) {
      self->_filter |= 0x20uLL;
    }
  }
  uint64_t v56 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceUnknown"];
  if (v56)
  {
    v57 = (void *)v56;
    v58 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceUnknown"];
    int v59 = [v58 BOOLValue];

    if (v59) {
      self->_filter |= 1uLL;
    }
  }
  uint64_t v60 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceRouteValueError"];
  if (v60)
  {
    v61 = (void *)v60;
    v62 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceRouteValueError"];
    int v63 = [v62 BOOLValue];

    if (v63) {
      self->_filter |= 0x2000uLL;
    }
  }
  uint64_t v64 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceFlowswitchValueError"];
  if (v64)
  {
    v65 = (void *)v64;
    v66 = [v5 objectForKeyedSubscript:@"kNWStatsSelectInterfaceFlowswitchValueError"];
    int v67 = [v66 BOOLValue];

    if (v67) {
      self->_filter |= 0x4000uLL;
    }
  }
  v68 = [v5 objectForKeyedSubscript:@"kNWStatsSelectAllFlowsAndSubFlows"];

  if (v68)
  {
    v69 = [v5 objectForKeyedSubscript:@"kNWStatsSelectAllFlowsAndSubFlows"];
    char v70 = [v69 BOOLValue];
    self->_hasExplicitTCP = 1;
    self->_explicitTCPValue = v70;
    self->_hasExplicitUDP = 1;
    self->_explicitUDPValue = v70;
    self->_hasExplicitQUIC = 1;
    self->_explicitQUICValue = v70;
    self->_hasExplicitUDPSubFlows = 1;
    self->_explicitUDPSubFlowsValue = v70;
  }
  v71 = [v5 objectForKeyedSubscript:@"kNWStatsSelectAllFlows"];

  if (v71)
  {
    v72 = [v5 objectForKeyedSubscript:@"kNWStatsSelectAllFlows"];
    char v73 = [v72 BOOLValue];
    self->_hasExplicitTCP = 1;
    self->_explicitTCPValue = v73;
    self->_hasExplicitUDP = 1;
    self->_explicitUDPValue = v73;
    self->_hasExplicitQUIC = 1;
    self->_explicitQUICValue = v73;
  }
  v74 = [v5 objectForKeyedSubscript:@"kNWStatsSelectTCP"];

  if (v74)
  {
    v75 = [v5 objectForKeyedSubscript:@"kNWStatsSelectTCP"];
    self->_hasExplicitTCP = 1;
    self->_explicitTCPValue = [v75 BOOLValue];
  }
  v76 = [v5 objectForKeyedSubscript:@"kNWStatsSelectUDP"];

  if (v76)
  {
    v77 = [v5 objectForKeyedSubscript:@"kNWStatsSelectUDP"];
    self->_hasExplicitUDP = 1;
    self->_explicitUDPValue = [v77 BOOLValue];
  }
  v78 = [v5 objectForKeyedSubscript:@"kNWStatsSelectUDPSubFlows"];

  if (v78)
  {
    v79 = [v5 objectForKeyedSubscript:@"kNWStatsSelectUDPSubFlows"];
    self->_hasExplicitUDPSubFlows = 1;
    self->_explicitUDPSubFlowsValue = [v79 BOOLValue];
  }
  v80 = [v5 objectForKeyedSubscript:@"kNWStatsSelectQUIC"];

  if (v80)
  {
    v81 = [v5 objectForKeyedSubscript:@"kNWStatsSelectQUIC"];
    self->_hasExplicitQUIC = 1;
    self->_explicitQUICValue = [v81 BOOLValue];
  }
  v82 = [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowUsesChannels"];

  if (v82)
  {
    v83 = [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowUsesChannels"];
    self->_hasExplicitChannels = 1;
    self->_explicitChannelsValue = [v83 BOOLValue];
  }
  v84 = [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowUsesSockets"];

  if (v84)
  {
    v85 = [v5 objectForKeyedSubscript:@"kNWStatsSelectFlowUsesSockets"];
    self->_hasExplicitSockets = 1;
    self->_explicitSocketsValue = [v85 BOOLValue];
  }
  v86 = [v5 objectForKeyedSubscript:@"kNWStatsSelectUserlandConnections"];

  if (v86)
  {
    v87 = [v5 objectForKeyedSubscript:@"kNWStatsSelectUserlandConnections"];
    self->_hasExplicitUserlandConnections = 1;
    self->_explicitUserlandConnectionsValue = [v87 BOOLValue];
  }
  v88 = [v5 objectForKeyedSubscript:@"kNWStatsSelectConnHasNetAccess"];

  if (v88)
  {
    v89 = [v5 objectForKeyedSubscript:@"kNWStatsSelectConnHasNetAccess"];
    if ([v89 BOOLValue]) {
      self->_connFilter |= 0x1000000uLL;
    }
  }
  v90 = [v5 objectForKeyedSubscript:@"kNWStatsSelectStartupConnHasNetAccess"];

  if (v90)
  {
    v91 = [v5 objectForKeyedSubscript:@"kNWStatsSelectStartupConnHasNetAccess"];
    if ([v91 BOOLValue]) {
      self->_connFilter |= 0x1001000000uLL;
    }
  }
  v92 = [v5 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnRefresh"];

  if (v92)
  {
    v93 = [v5 objectForKeyedSubscript:@"kNWStatsSelectTuneSkipNoChangeConnOnRefresh"];
    if ([v93 BOOLValue]) {
      self->_connFilter |= 0x20000000uLL;
    }
  }
  return 1;
}

- (NWStatsTargetSelector)initWithSelection:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NWStatsTargetSelector;
  id v5 = [(NWStatsTargetSelector *)&v8 init];
  v6 = v5;
  if (v5 && ![(NWStatsTargetSelector *)v5 _applySelection:v4])
  {

    v6 = 0;
  }

  return v6;
}

- (NWStatsTargetSelector)initWithMultipleSelections:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)NWStatsTargetSelector;
  id v5 = [(NWStatsTargetSelector *)&v16 init];
  if (v5)
  {
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!-[NWStatsTargetSelector _applySelection:](v5, "_applySelection:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12))
          {

            id v5 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v12 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  return v5;
}

- (BOOL)shouldAddProvider:(int)a3
{
  if (self->_hasExplicitTCP)
  {
    BOOL explicitTCPValue = self->_explicitTCPValue;
    BOOL hasExplicitUDP = self->_hasExplicitUDP;
    if (!hasExplicitUDP)
    {
      char v5 = 0;
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (self->_hasExplicitUDP)
  {
    BOOL explicitTCPValue = 0;
LABEL_6:
    BOOL hasExplicitUDP = self->_explicitUDPValue;
    char v5 = 1;
    goto LABEL_7;
  }
  BOOL explicitTCPValue = !self->_hasExplicitQUIC && !self->_hasExplicitUDPSubFlows && !self->_hasExplicitUserlandConnections;
  if (self->_hasExplicitQUIC || self->_hasExplicitUDPSubFlows)
  {
    char v5 = 0;
    BOOL hasExplicitUDP = 0;
  }
  else
  {
    char v5 = 0;
    BOOL hasExplicitUDP = !self->_hasExplicitUserlandConnections;
  }
LABEL_7:
  BOOL v6 = self->_hasExplicitUDPSubFlows && self->_explicitUDPSubFlowsValue;
  if (self->_hasExplicitQUIC)
  {
    BOOL explicitQUICValue = self->_explicitQUICValue;
    goto LABEL_29;
  }
  if (self->_hasExplicitTCP) {
    char v8 = 1;
  }
  else {
    char v8 = v5;
  }
  if (v8) {
    goto LABEL_16;
  }
  if (!self->_hasExplicitSockets)
  {
    if (self->_hasExplicitUDPSubFlows)
    {
LABEL_16:
      BOOL explicitQUICValue = 0;
      goto LABEL_29;
    }
    goto LABEL_28;
  }
  BOOL explicitQUICValue = 0;
  if (!self->_hasExplicitUDPSubFlows && self->_hasExplicitChannels) {
LABEL_28:
  }
    BOOL explicitQUICValue = !self->_hasExplicitUserlandConnections;
LABEL_29:
  BOOL hasExplicitUserlandConnections = self->_hasExplicitUserlandConnections;
  if (hasExplicitUserlandConnections) {
    BOOL hasExplicitUserlandConnections = self->_explicitUserlandConnectionsValue;
  }
  BOOL explicitSocketsValue = !self->_hasExplicitChannels;
  if (self->_hasExplicitChannels)
  {
    BOOL explicitChannelsValue = self->_explicitChannelsValue;
    if (!self->_hasExplicitSockets) {
      goto LABEL_34;
    }
    goto LABEL_33;
  }
  BOOL explicitChannelsValue = !self->_hasExplicitSockets;
  if (self->_hasExplicitSockets) {
LABEL_33:
  }
    BOOL explicitSocketsValue = self->_explicitSocketsValue;
LABEL_34:
  BOOL result = 0;
  switch(a3)
  {
    case 2:
      BOOL result = explicitTCPValue && explicitSocketsValue;
      break;
    case 3:
      BOOL result = explicitTCPValue && explicitChannelsValue;
      break;
    case 4:
      BOOL result = hasExplicitUDP && explicitSocketsValue;
      break;
    case 5:
      BOOL result = hasExplicitUDP && explicitChannelsValue;
      break;
    case 8:
      BOOL result = explicitQUICValue;
      break;
    case 9:
      BOOL result = hasExplicitUserlandConnections;
      break;
    case 10:
      BOOL result = v6;
      break;
    default:
      return result;
  }
  return result;
}

- (id)description
{
  v2 = objc_msgSend([NSString alloc], "initWithFormat:", @"NWStatsTargetSelector at %p, filter 0x%llx connFilter 0x%llx events 0x%llx cfg UDP %d val %d cfg TCP %d val %d cfg QUIC %d val %d cfg subflows %d val %d cfg conns %d val %d cfg channels %d val %d cfg sockets %d val %d params %@", self, self->_filter, self->_connFilter, self->_events, self->_hasExplicitUDP, self->_explicitUDPValue, self->_hasExplicitTCP, self->_explicitTCPValue, self->_hasExplicitQUIC, self->_explicitQUICValue, self->_hasExplicitUDPSubFlows, self->_explicitUDPSubFlowsValue, self->_hasExplicitUserlandConnections, self->_explicitUserlandConnectionsValue, self->_hasExplicitChannels, self->_explicitChannelsValue,
                 self->_hasExplicitSockets,
                 self->_explicitSocketsValue,
                 self->_suppliedParams);
  return v2;
}

- (NSDictionary)suppliedParams
{
  return (NSDictionary *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSuppliedParams:(id)a3
{
}

- (unint64_t)filter
{
  return self->_filter;
}

- (void)setFilter:(unint64_t)a3
{
  self->_filter = a3;
}

- (unint64_t)connFilter
{
  return self->_connFilter;
}

- (void)setConnFilter:(unint64_t)a3
{
  self->_connFilter = a3;
}

- (unint64_t)events
{
  return self->_events;
}

- (void)setEvents:(unint64_t)a3
{
  self->_events = a3;
}

- (void).cxx_destruct
{
}

@end
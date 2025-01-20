@interface WCM_CellularRc1PolicyManager
- (BOOL)isNBDynamicPolicyUpdateRequired:(id)a3;
- (WCM_CellularController)cellularController;
- (WCM_CellularRc1CoexIssueTable)rcu1CoexIssueTable;
- (WCM_CellularRc1PolicyManager)init;
- (WCM_PlatformManager)platformManager;
- (WCM_R1Controller)rcu1Controller;
- (id)calculateNBDynamicPolicy;
- (void)WatchReportRc1ChannelsForGpioBlankingByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7;
- (void)handleCellularNetworkUpdate;
- (void)handleCellularPowerState:(BOOL)a3;
- (void)sendRc1Message:(id)a3;
- (void)setPlatformManager:(id)a3;
- (void)updateCellularR1CoexBandStatus;
- (void)updateControllerSession:(id)a3 ofId:(int)a4;
- (void)updateRc1ChannelNumber:(unsigned int)a3 NbChannelBitmask:(unsigned int)a4;
- (void)updateRc1OverallConfig;
@end

@implementation WCM_CellularRc1PolicyManager

- (void)handleCellularNetworkUpdate
{
  id v31 = [(WCM_CellularRc1PolicyManager *)self cellularController];
  v3 = [(WCM_CellularRc1PolicyManager *)self platformManager];
  v4 = +[WCM_PolicyManager singleton];
  +[WCM_Logging logLevel:2 message:@"WCM_CellularRc1PolicyManager handleCellularNetworkUpdate"];
  if (!v31 && v4)
  {
    id v31 = [v4 cellularController];
    v5 = [v4 cellularController];
    cellularController = self->_cellularController;
    self->_cellularController = v5;
  }
  v7 = [v3 wcmCellRc1CoexIssueTable];

  if (v7)
  {
    id v8 = [v31 bandInfoType];
    v9 = [v4 activeCoexFeatures];
    unsigned int v10 = [v9 containsObject:@"WatchReportRC1IssueChannel"];

    if (v10)
    {
      [v31 dlCenterFreq];
      double v12 = v11;
      [v31 dlBandwidth];
      double v14 = (v12 - v13 * 0.5) * 1000000.0;
      [v31 dlCenterFreq];
      double v16 = v15;
      [v31 dlBandwidth];
      double v18 = (v16 + v17 * 0.5) * 1000000.0;
      [v31 ulCenterFreq];
      double v20 = v19;
      [v31 ulBandwidth];
      double v22 = (v20 - v21 * 0.5) * 1000000.0;
      [v31 ulCenterFreq];
      double v24 = v23;
      [v31 ulBandwidth];
      [(WCM_CellularRc1PolicyManager *)self WatchReportRc1ChannelsForGpioBlankingByCellBandInfoType:v8 CellDlLowFreq:v14 cellDlHighFreq:v18 cellUlLowFreq:v22 cellUlHighFreq:(v24 + v25 * 0.5) * 1000000.0];
    }
    v26 = [v4 activeCoexFeatures];
    unsigned int v27 = [v26 containsObject:@"UseWCMAriDriver"];

    if (v27)
    {
      v28 = [(WCM_CellularRc1PolicyManager *)self calculateNBDynamicPolicy];
      if (v28
        && [(WCM_CellularRc1PolicyManager *)self isNBDynamicPolicyUpdateRequired:v28])
      {
        v29 = +[WCM_AriCoexCommandDriver singleton];
        v30 = v29;
        if (v29) {
          [v29 handleRc1DynamicPolicy:v28 SubId:0];
        }
      }
    }
    [(WCM_CellularRc1PolicyManager *)self updateCellularR1CoexBandStatus];
  }
}

- (void)updateCellularR1CoexBandStatus
{
  id v37 = [(WCM_CellularRc1PolicyManager *)self cellularController];
  v3 = [(WCM_CellularRc1PolicyManager *)self platformManager];
  v4 = +[WCM_PolicyManager singleton];
  v5 = (char *)[v37 getActiveULCAConfig];
  id v6 = [v37 bandInfoType];
  [v37 dlCenterFreq];
  double v8 = v7;
  [v37 dlBandwidth];
  double v10 = v9;
  [v37 dlCenterFreq];
  double v12 = v11;
  [v37 dlBandwidth];
  double v14 = v13;
  [v37 ulCenterFreq];
  double v16 = v15;
  [v37 ulBandwidth];
  double v18 = v17;
  [v37 ulCenterFreq];
  double v20 = v19;
  [v37 ulBandwidth];
  if (v5)
  {
    uint64_t v22 = 0;
    do
    {
      double v23 = *(double *)&v5[v22 + 16];
      double v24 = *(double *)&v5[v22 + 24] * 0.5;
      double v25 = (v23 - v24) * 1000000.0;
      double v26 = (v23 + v24) * 1000000.0;
      double v27 = *(double *)&v5[v22];
      double v28 = *(double *)&v5[v22 + 8] * 0.5;
      double v29 = (v27 - v28) * 1000000.0;
      double v30 = (v27 + v28) * 1000000.0;
      id v31 = [v3 wcmCellRc1CoexIssueTable];
      unsigned int v32 = [v31 isCellularInRc1CoexBand:v6 CellDlLowFreq:self->Rc1Channel cellDlHighFreq:v25 cellUlLowFreq:v26 cellUlHighFreq:v29 RC1ChannelBitmask:v30];

      if (v32) {
        break;
      }
      BOOL v33 = v22 == 2232;
      v22 += 72;
    }
    while (!v33);
  }
  else
  {
    double v34 = (v20 + v21 * 0.5) * 1000000.0;
    v35 = [v3 wcmCellRc1CoexIssueTable];
    unsigned int v32 = [v35 isCellularInRc1CoexBand:v6 CellDlLowFreq:self->Rc1Channel cellDlHighFreq:(v8 - v10 * 0.5) * 1000000.0 cellUlLowFreq:(v12 + v14 * 0.5) * 1000000.0 cellUlHighFreq:(v16 - v18 * 0.5) * 1000000.0 RC1ChannelBitmask:v34];
  }
  if (self->isCellInRc1CoexBand != v32)
  {
    +[WCM_Logging logLevel:3, @"Cell RC1 policy manager: cellular in RC1 Coex band: %d", v32 message];
    self->isCellInRc1CoexBand = v32;
    xpc_object_t v36 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_BOOL(v36, "kWCMHToRCU1Cellularband", v32);
    [(WCM_CellularRc1PolicyManager *)self sendRc1Message:v36];
  }
}

- (WCM_PlatformManager)platformManager
{
  return self->_platformManager;
}

- (WCM_CellularController)cellularController
{
  return self->_cellularController;
}

- (WCM_CellularRc1PolicyManager)init
{
  v6.receiver = self;
  v6.super_class = (Class)WCM_CellularRc1PolicyManager;
  v2 = [(WCM_CellularRc1PolicyManager *)&v6 init];
  v3 = v2;
  if (v2)
  {
    v2->Rc1Channel = 0;
    *(_WORD *)&v2->isCellInRc1CoexBand = 0;
    *(void *)&v2->WatchRc1IssueNbChannelIndex_begin = -1;
    v2->WatchRc1IssueChannel = 0;
    cachedNBDynamicPolicy = v2->cachedNBDynamicPolicy;
    v2->cachedNBDynamicPolicy = 0;
  }
  return v3;
}

- (void)updateControllerSession:(id)a3 ofId:(int)a4
{
  id v7 = a3;
  if (a4 == 29)
  {
    id v8 = v7;
    objc_storeStrong((id *)&self->_rcu1Controller, a3);
  }
  else
  {
    if (a4 != 3) {
      goto LABEL_6;
    }
    id v8 = v7;
    objc_storeStrong((id *)&self->_cellularController, a3);
    +[WCM_Logging logLevel:2, @"RC1 Policy manager update Cellular Controller = %p", self->_cellularController message];
  }
  id v7 = v8;
LABEL_6:
}

- (BOOL)isNBDynamicPolicyUpdateRequired:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4) {
    unsigned int v6 = [v4 count];
  }
  else {
    unsigned int v6 = 0;
  }
  cachedNBDynamicPolicy = self->cachedNBDynamicPolicy;
  if (cachedNBDynamicPolicy) {
    LODWORD(cachedNBDynamicPolicy) = [(NSMutableArray *)cachedNBDynamicPolicy count];
  }
  if (v6 != cachedNBDynamicPolicy)
  {
LABEL_25:
    uint64_t v22 = v5;
    double v10 = self->cachedNBDynamicPolicy;
    self->cachedNBDynamicPolicy = v22;
    BOOL v21 = 1;
    goto LABEL_26;
  }
  id v8 = [objc_alloc((Class)NSSet) initWithArray:v5];
  double v25 = self;
  id v9 = [objc_alloc((Class)NSSet) initWithArray:self->cachedNBDynamicPolicy];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  double v10 = (NSMutableArray *)v8;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v31;
    double v24 = v5;
    while (1)
    {
      uint64_t v14 = 0;
LABEL_10:
      if (*(void *)v31 != v13) {
        objc_enumerationMutation(v10);
      }
      double v15 = *(void **)(*((void *)&v30 + 1) + 8 * v14);
      long long v26 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      long long v29 = 0u;
      id v16 = v9;
      id v17 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
      if (!v17) {
        break;
      }
      id v18 = v17;
      uint64_t v19 = *(void *)v27;
LABEL_14:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v27 != v19) {
          objc_enumerationMutation(v16);
        }
        if (objc_msgSend(v15, "isEqual:", *(void *)(*((void *)&v26 + 1) + 8 * v20), v24)) {
          break;
        }
        if (v18 == (id)++v20)
        {
          id v18 = [v16 countByEnumeratingWithState:&v26 objects:v34 count:16];
          if (v18) {
            goto LABEL_14;
          }
          goto LABEL_24;
        }
      }

      if ((id)++v14 != v12) {
        goto LABEL_10;
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v30 objects:v35 count:16];
      v5 = v24;
      if (!v12) {
        goto LABEL_23;
      }
    }
LABEL_24:

    v5 = v24;
    self = v25;
    goto LABEL_25;
  }
LABEL_23:

  BOOL v21 = 0;
LABEL_26:

  return v21;
}

- (id)calculateNBDynamicPolicy
{
  v3 = [(WCM_CellularRc1PolicyManager *)self cellularController];
  id v4 = [(WCM_CellularRc1PolicyManager *)self platformManager];
  v5 = +[WCM_PolicyManager singleton];
  id v6 = objc_alloc_init((Class)NSMutableArray);
  [v3 activeSubId];
  id v7 = (unsigned int *)[v3 getActiveULCAConfig];
  if (v7)
  {
    +[WCM_Logging logLevel:2, @"calculateNBDynamicPolicy lte_nr_scell.totalvalidCarriers = %d", v7[576] message];
    unsigned int v8 = v7[576];
    if (v8 <= 0x20)
    {
      double v24 = v5;
      double v25 = v3;
      if (v8)
      {
        unint64_t v9 = 0;
        double v10 = v7 + 16;
        do
        {
          double v11 = *((double *)v10 - 6);
          double v12 = *((double *)v10 - 5) * 0.5;
          double v13 = (v11 - v12) * 1000000.0;
          double v14 = (v11 + v12) * 1000000.0;
          double v15 = *((double *)v10 - 8);
          double v16 = *((double *)v10 - 7);
          double v17 = (v15 - v16 * 0.5) * 1000000.0;
          double v18 = (v15 + v16 * 0.5) * 1000000.0;
          +[WCM_Logging logLevel:2, @"calculateNBDynamicPolicy carrier[%d]: ulCenterFreq_MHz = %f, ulBandwidth=%f", v9, *(void *)&v15, *(void *)&v16 message];
          uint64_t v19 = [v4 wcmCellRc1CoexIssueTable];
          uint64_t v20 = [v19 createDynamicRc1NbCoexPolicyByCellBandInfoType:*v10 CellDlLowFreq:4 cellDlHighFreq:v13 cellUlLowFreq:v14 cellUlHighFreq:v17 RC1Channel:v18];

          BOOL v21 = [v4 wcmCellRc1CoexIssueTable];
          uint64_t v22 = [v21 createDynamicRc1NbCoexPolicyByCellBandInfoType:*v10 CellDlLowFreq:8 cellDlHighFreq:v13 cellUlLowFreq:v14 cellUlHighFreq:v17 RC1Channel:v18];

          if (v20 && [v20 count]) {
            [v6 addObjectsFromArray:v20];
          }
          if (v22 && [v22 count]) {
            [v6 addObjectsFromArray:v22];
          }

          ++v9;
          v10 += 18;
        }
        while (v9 < v7[576]);
      }
      id v7 = (unsigned int *)v6;
      v5 = v24;
      v3 = v25;
    }
    else
    {
      +[WCM_Logging logLevel:2 message:@"calculateNBDynamicPolicy lte_nr_scell has invalid total carriers"];
      id v7 = 0;
    }
  }
  else
  {
    +[WCM_Logging logLevel:2 message:@"calculateNBDynamicPolicy lte_nr_scell is NULL"];
  }

  return v7;
}

- (void)updateRc1ChannelNumber:(unsigned int)a3 NbChannelBitmask:(unsigned int)a4
{
  self->Rc1Channel = 0;
  if (a3 == 5)
  {
    unsigned int v4 = 1;
  }
  else
  {
    unsigned int v4 = 0;
    if (a3 != 9) {
      goto LABEL_6;
    }
    unsigned int v4 = 2;
  }
  self->Rc1Channel = v4;
LABEL_6:
  if ((a4 & 0x1F) != 0)
  {
    unsigned int v5 = v4 & 0xFFFFFFFB | (4 * (a4 & 1));
    if ((a4 & 2) != 0) {
      v5 |= 0x18u;
    }
    if ((a4 & 4) != 0) {
      v5 |= 0x28u;
    }
    if ((a4 & 8) != 0) {
      v5 |= 0x48u;
    }
    if ((a4 & 0x10) != 0) {
      v5 |= 0x88u;
    }
    self->Rc1Channel = v5;
  }
  [(WCM_CellularRc1PolicyManager *)self updateCellularR1CoexBandStatus];
}

- (void)sendRc1Message:(id)a3
{
  rcu1Controller = self->_rcu1Controller;
  if (rcu1Controller) {
    [(WCM_Controller *)rcu1Controller sendMessage:1500 withArgs:a3];
  }
}

- (void)handleCellularPowerState:(BOOL)a3
{
  id v4 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v4, "kWCMHToRCU1CellularStatus", 1);
  self->cellPowerState = 1;
  [(WCM_CellularRc1PolicyManager *)self sendRc1Message:v4];
}

- (void)WatchReportRc1ChannelsForGpioBlankingByCellBandInfoType:(int)a3 CellDlLowFreq:(double)a4 cellDlHighFreq:(double)a5 cellUlLowFreq:(double)a6 cellUlHighFreq:(double)a7
{
  uint64_t v11 = *(void *)&a3;
  double v13 = [(WCM_CellularRc1PolicyManager *)self platformManager];
  unsigned int v22 = -1;
  unsigned int v23 = -1;
  double v14 = [v13 wcmCellRc1CoexIssueTable];
  [v14 findRc1NbCoexIssueChannelByCellBandInfoType:v11 CellDlLowFreq:4 cellDlHighFreq:&v23 cellUlLowFreq:&v22 cellUlHighFreq:a4 RC1Channel:a5 uwbNbIssueChannelBegin:a6 uwbNbIssueChannelEnd:a7];

  if (v23 == -1)
  {
    double v15 = [v13 wcmCellRc1CoexIssueTable];
    [v15 findRc1NbCoexIssueChannelByCellBandInfoType:v11 CellDlLowFreq:8 cellDlHighFreq:&v23 cellUlLowFreq:&v22 cellUlHighFreq:a4 RC1Channel:a5 uwbNbIssueChannelBegin:a6 uwbNbIssueChannelEnd:a7];
  }
  double v16 = [v13 wcmCellRc1CoexIssueTable];
  unsigned int v17 = [v16 isCellularInRc1CoexBand:v11 CellDlLowFreq:2 cellDlHighFreq:a4 cellUlLowFreq:a5 cellUlHighFreq:a6 RC1ChannelBitmask:a7];

  +[WCM_Logging logLevel:3, @"Cell RC1 policy manager: cellDlLow=%fHz, cellDlHigh=%fHz, cellUlLow=%fHz, cellUlHigh=%fHz", *(void *)&a4, *(void *)&a5, *(void *)&a6, *(void *)&a7 message];
  +[WCM_Logging logLevel:3, @"Cell RC1 policy manager: RC1 coex issue CH9=%d, NB channel[%d, %d]", v17, v23, v22 message];
  int v18 = v23;
  if (v22 == -1 || v23 == -1) {
    unsigned int v20 = v17;
  }
  else {
    unsigned int v20 = 2;
  }
  if (v20 != self->WatchRc1IssueChannel
    || v23 != self->WatchRc1IssueNbChannelIndex_begin
    || v22 != self->WatchRc1IssueNbChannelIndex_end)
  {
    self->WatchRc1IssueNbChannelIndex_end = v22;
    self->WatchRc1IssueChannel = v20;
    self->WatchRc1IssueNbChannelIndex_begin = v18;
    xpc_object_t v21 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_uint64(v21, "kWCMHToRCU1ChannelsToTriggerGPIOBlanking", self->WatchRc1IssueChannel);
    xpc_dictionary_set_uint64(v21, "kWCMHToRCU1SideChannelsToTriggerGPIOBlanking_ChBegin", self->WatchRc1IssueNbChannelIndex_begin);
    xpc_dictionary_set_uint64(v21, "kWCMHToRCU1SideChannelsToTriggerGPIOBlanking_ChEnd", self->WatchRc1IssueNbChannelIndex_end);
    [(WCM_CellularRc1PolicyManager *)self sendRc1Message:v21];
  }
}

- (void)updateRc1OverallConfig
{
  xpc_object_t xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(xdict, "kWCMHToRCU1CellularStatus", self->cellPowerState);
  xpc_dictionary_set_BOOL(xdict, "kWCMHToRCU1Cellularband", self->isCellInRc1CoexBand);
  xpc_dictionary_set_uint64(xdict, "kWCMHToRCU1ChannelsToTriggerGPIOBlanking", self->WatchRc1IssueChannel);
  xpc_dictionary_set_uint64(xdict, "kWCMHToRCU1SideChannelsToTriggerGPIOBlanking_ChBegin", self->WatchRc1IssueNbChannelIndex_begin);
  xpc_dictionary_set_uint64(xdict, "kWCMHToRCU1SideChannelsToTriggerGPIOBlanking_ChEnd", self->WatchRc1IssueNbChannelIndex_end);
  [(WCM_CellularRc1PolicyManager *)self sendRc1Message:xdict];
}

- (void)setPlatformManager:(id)a3
{
}

- (WCM_R1Controller)rcu1Controller
{
  return self->_rcu1Controller;
}

- (WCM_CellularRc1CoexIssueTable)rcu1CoexIssueTable
{
  return self->_rcu1CoexIssueTable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rcu1CoexIssueTable, 0);
  objc_storeStrong((id *)&self->_rcu1Controller, 0);
  objc_storeStrong((id *)&self->_cellularController, 0);
  objc_storeStrong((id *)&self->_platformManager, 0);

  objc_storeStrong((id *)&self->cachedNBDynamicPolicy, 0);
}

@end
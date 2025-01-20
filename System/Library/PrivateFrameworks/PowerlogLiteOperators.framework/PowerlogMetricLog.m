@interface PowerlogMetricLog
+ (Class)kCellularCdma1XConnectionHistType;
+ (Class)kCellularCdma1XProtocolStackStateHistType;
+ (Class)kCellularCdma1XRrStateType;
+ (Class)kCellularCdma1XRxDiversityHistType;
+ (Class)kCellularCdma1XServingCellRx0EcIoHistType;
+ (Class)kCellularCdma1XServingCellRx0RssiHistType;
+ (Class)kCellularCdma1XServingCellRx1EcIoHistType;
+ (Class)kCellularCdma1XServingCellRx1RssiHistType;
+ (Class)kCellularCdma1XTxPowerHistType;
+ (Class)kCellularCdmaEvdoProtocolStackStateHistType;
+ (Class)kCellularCdmaEvdoRrStateType;
+ (Class)kCellularCdmaEvdoRxDiversityHistType;
+ (Class)kCellularCdmaEvdoServingCellRx0EcIoHistType;
+ (Class)kCellularCdmaEvdoServingCellRx0RssiHistType;
+ (Class)kCellularCdmaEvdoServingCellRx1EcIoHistType;
+ (Class)kCellularCdmaEvdoServingCellRx1RssiHistType;
+ (Class)kCellularCdmaEvdoTxPowerHistType;
+ (Class)kCellularCellPlmnSearchCountType;
+ (Class)kCellularCellPlmnSearchHistType;
+ (Class)kCellularDownlinkIpPacketDiscardedType;
+ (Class)kCellularDownlinkIpPacketFilterStatusType;
+ (Class)kCellularDvfsStatsType;
+ (Class)kCellularFwCoreStatsType;
+ (Class)kCellularGsmConnectedModeHistType;
+ (Class)kCellularGsmL1StateType;
+ (Class)kCellularGsmServingCellRssiHistType;
+ (Class)kCellularGsmServingCellSnrHistType;
+ (Class)kCellularGsmTxPowerHistType;
+ (Class)kCellularLqmStateChangeType;
+ (Class)kCellularLteAdvancedRxStateHistType;
+ (Class)kCellularLteCdrxConfigType;
+ (Class)kCellularLteComponentCarrierInfoType;
+ (Class)kCellularLteDataInactivityBeforeIdleType;
+ (Class)kCellularLteDlSccStateHistType;
+ (Class)kCellularLteDlSccStateHistV3Type;
+ (Class)kCellularLteFwDuplexModeType;
+ (Class)kCellularLteIdleToConnectedUserDataType;
+ (Class)kCellularLtePagingCycleType;
+ (Class)kCellularLtePdcchStateHistType;
+ (Class)kCellularLtePdcchStateStatsType;
+ (Class)kCellularLteRadioLinkFailureType;
+ (Class)kCellularLteRrcStateType;
+ (Class)kCellularLteRxDiversityHistType;
+ (Class)kCellularLteRxTxStateHistType;
+ (Class)kCellularLteServingCellRsrpHistType;
+ (Class)kCellularLteServingCellSinrHistType;
+ (Class)kCellularLteSleepStateHistType;
+ (Class)kCellularLteTdsGsmHwStatsType;
+ (Class)kCellularLteTotalDlTbsHistType;
+ (Class)kCellularLteTxPowerHistType;
+ (Class)kCellularLteUlSccStateHistType;
+ (Class)kCellularLteWcdmaGsmHwStatsType;
+ (Class)kCellularLteWcdmaTdsHwStatsType;
+ (Class)kCellularPerClientProfileTriggerCountType;
+ (Class)kCellularPeripheralStatsType;
+ (Class)kCellularPmicHwStatsType;
+ (Class)kCellularPmuAverageCurrentType;
+ (Class)kCellularProtocolStackCpuStatsType;
+ (Class)kCellularProtocolStackPowerStateType;
+ (Class)kCellularProtocolStackStateHist2Type;
+ (Class)kCellularProtocolStackStateHistType;
+ (Class)kCellularProtocolStackStateType;
+ (Class)kCellularServiceLostType;
+ (Class)kCellularServingCellRfBandHistType;
+ (Class)kCellularTdsL1StateType;
+ (Class)kCellularTdsRabModeHistType;
+ (Class)kCellularTdsRabTypeHistType;
+ (Class)kCellularTdsRrcStateType;
+ (Class)kCellularTdsRxDiversityHistType;
+ (Class)kCellularTdsServingCellRx0RscpHistType;
+ (Class)kCellularTdsServingCellRx0RssiHistType;
+ (Class)kCellularTdsServingCellRx1RscpHistType;
+ (Class)kCellularTdsServingCellRx1RssiHistType;
+ (Class)kCellularTdsTxPowerHistType;
+ (Class)kCellularWcdmaCarrierStatusHistType;
+ (Class)kCellularWcdmaCpcStatType;
+ (Class)kCellularWcdmaDataInactivityBeforeIdleType;
+ (Class)kCellularWcdmaIdleToConnectedUserDataType;
+ (Class)kCellularWcdmaL1StateType;
+ (Class)kCellularWcdmaRabModeHistType;
+ (Class)kCellularWcdmaRabStatusType;
+ (Class)kCellularWcdmaRabTypeHistType;
+ (Class)kCellularWcdmaReceiverStatusOnC0HistType;
+ (Class)kCellularWcdmaReceiverStatusOnC1HistType;
+ (Class)kCellularWcdmaRrcConfigurationType;
+ (Class)kCellularWcdmaRrcConnectionStateType;
+ (Class)kCellularWcdmaRxDiversityHistType;
+ (Class)kCellularWcdmaServingCellRx0EcNoHistType;
+ (Class)kCellularWcdmaServingCellRx0RssiHistType;
+ (Class)kCellularWcdmaServingCellRx1EcNoHistType;
+ (Class)kCellularWcdmaServingCellRx1RssiHistType;
+ (Class)kCellularWcdmaTxPowerHistType;
+ (Class)kCellularWcdmaVadHistType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)kCellularCdma1XConnectionHists;
- (NSMutableArray)kCellularCdma1XProtocolStackStateHists;
- (NSMutableArray)kCellularCdma1XRrStates;
- (NSMutableArray)kCellularCdma1XRxDiversityHists;
- (NSMutableArray)kCellularCdma1XServingCellRx0EcIoHists;
- (NSMutableArray)kCellularCdma1XServingCellRx0RssiHists;
- (NSMutableArray)kCellularCdma1XServingCellRx1EcIoHists;
- (NSMutableArray)kCellularCdma1XServingCellRx1RssiHists;
- (NSMutableArray)kCellularCdma1XTxPowerHists;
- (NSMutableArray)kCellularCdmaEvdoProtocolStackStateHists;
- (NSMutableArray)kCellularCdmaEvdoRrStates;
- (NSMutableArray)kCellularCdmaEvdoRxDiversityHists;
- (NSMutableArray)kCellularCdmaEvdoServingCellRx0EcIoHists;
- (NSMutableArray)kCellularCdmaEvdoServingCellRx0RssiHists;
- (NSMutableArray)kCellularCdmaEvdoServingCellRx1EcIoHists;
- (NSMutableArray)kCellularCdmaEvdoServingCellRx1RssiHists;
- (NSMutableArray)kCellularCdmaEvdoTxPowerHists;
- (NSMutableArray)kCellularCellPlmnSearchCounts;
- (NSMutableArray)kCellularCellPlmnSearchHists;
- (NSMutableArray)kCellularDownlinkIpPacketDiscardeds;
- (NSMutableArray)kCellularDownlinkIpPacketFilterStatus;
- (NSMutableArray)kCellularDvfsStats;
- (NSMutableArray)kCellularFwCoreStats;
- (NSMutableArray)kCellularGsmConnectedModeHists;
- (NSMutableArray)kCellularGsmL1States;
- (NSMutableArray)kCellularGsmServingCellRssiHists;
- (NSMutableArray)kCellularGsmServingCellSnrHists;
- (NSMutableArray)kCellularGsmTxPowerHists;
- (NSMutableArray)kCellularLqmStateChanges;
- (NSMutableArray)kCellularLteAdvancedRxStateHists;
- (NSMutableArray)kCellularLteCdrxConfigs;
- (NSMutableArray)kCellularLteComponentCarrierInfos;
- (NSMutableArray)kCellularLteDataInactivityBeforeIdles;
- (NSMutableArray)kCellularLteDlSccStateHistV3s;
- (NSMutableArray)kCellularLteDlSccStateHists;
- (NSMutableArray)kCellularLteFwDuplexModes;
- (NSMutableArray)kCellularLteIdleToConnectedUserDatas;
- (NSMutableArray)kCellularLtePagingCycles;
- (NSMutableArray)kCellularLtePdcchStateHists;
- (NSMutableArray)kCellularLtePdcchStateStats;
- (NSMutableArray)kCellularLteRadioLinkFailures;
- (NSMutableArray)kCellularLteRrcStates;
- (NSMutableArray)kCellularLteRxDiversityHists;
- (NSMutableArray)kCellularLteRxTxStateHists;
- (NSMutableArray)kCellularLteServingCellRsrpHists;
- (NSMutableArray)kCellularLteServingCellSinrHists;
- (NSMutableArray)kCellularLteSleepStateHists;
- (NSMutableArray)kCellularLteTdsGsmHwStats;
- (NSMutableArray)kCellularLteTotalDlTbsHists;
- (NSMutableArray)kCellularLteTxPowerHists;
- (NSMutableArray)kCellularLteUlSccStateHists;
- (NSMutableArray)kCellularLteWcdmaGsmHwStats;
- (NSMutableArray)kCellularLteWcdmaTdsHwStats;
- (NSMutableArray)kCellularPerClientProfileTriggerCounts;
- (NSMutableArray)kCellularPeripheralStats;
- (NSMutableArray)kCellularPmicHwStats;
- (NSMutableArray)kCellularPmuAverageCurrents;
- (NSMutableArray)kCellularProtocolStackCpuStats;
- (NSMutableArray)kCellularProtocolStackPowerStates;
- (NSMutableArray)kCellularProtocolStackStateHist2s;
- (NSMutableArray)kCellularProtocolStackStateHists;
- (NSMutableArray)kCellularProtocolStackStates;
- (NSMutableArray)kCellularServiceLosts;
- (NSMutableArray)kCellularServingCellRfBandHists;
- (NSMutableArray)kCellularTdsL1States;
- (NSMutableArray)kCellularTdsRabModeHists;
- (NSMutableArray)kCellularTdsRabTypeHists;
- (NSMutableArray)kCellularTdsRrcStates;
- (NSMutableArray)kCellularTdsRxDiversityHists;
- (NSMutableArray)kCellularTdsServingCellRx0RscpHists;
- (NSMutableArray)kCellularTdsServingCellRx0RssiHists;
- (NSMutableArray)kCellularTdsServingCellRx1RscpHists;
- (NSMutableArray)kCellularTdsServingCellRx1RssiHists;
- (NSMutableArray)kCellularTdsTxPowerHists;
- (NSMutableArray)kCellularWcdmaCarrierStatusHists;
- (NSMutableArray)kCellularWcdmaCpcStats;
- (NSMutableArray)kCellularWcdmaDataInactivityBeforeIdles;
- (NSMutableArray)kCellularWcdmaIdleToConnectedUserDatas;
- (NSMutableArray)kCellularWcdmaL1States;
- (NSMutableArray)kCellularWcdmaRabModeHists;
- (NSMutableArray)kCellularWcdmaRabStatus;
- (NSMutableArray)kCellularWcdmaRabTypeHists;
- (NSMutableArray)kCellularWcdmaReceiverStatusOnC0Hists;
- (NSMutableArray)kCellularWcdmaReceiverStatusOnC1Hists;
- (NSMutableArray)kCellularWcdmaRrcConfigurations;
- (NSMutableArray)kCellularWcdmaRrcConnectionStates;
- (NSMutableArray)kCellularWcdmaRxDiversityHists;
- (NSMutableArray)kCellularWcdmaServingCellRx0EcNoHists;
- (NSMutableArray)kCellularWcdmaServingCellRx0RssiHists;
- (NSMutableArray)kCellularWcdmaServingCellRx1EcNoHists;
- (NSMutableArray)kCellularWcdmaServingCellRx1RssiHists;
- (NSMutableArray)kCellularWcdmaTxPowerHists;
- (NSMutableArray)kCellularWcdmaVadHists;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)kCellularCdma1XConnectionHistAtIndex:(unint64_t)a3;
- (id)kCellularCdma1XProtocolStackStateHistAtIndex:(unint64_t)a3;
- (id)kCellularCdma1XRrStateAtIndex:(unint64_t)a3;
- (id)kCellularCdma1XRxDiversityHistAtIndex:(unint64_t)a3;
- (id)kCellularCdma1XServingCellRx0EcIoHistAtIndex:(unint64_t)a3;
- (id)kCellularCdma1XServingCellRx0RssiHistAtIndex:(unint64_t)a3;
- (id)kCellularCdma1XServingCellRx1EcIoHistAtIndex:(unint64_t)a3;
- (id)kCellularCdma1XServingCellRx1RssiHistAtIndex:(unint64_t)a3;
- (id)kCellularCdma1XTxPowerHistAtIndex:(unint64_t)a3;
- (id)kCellularCdmaEvdoProtocolStackStateHistAtIndex:(unint64_t)a3;
- (id)kCellularCdmaEvdoRrStateAtIndex:(unint64_t)a3;
- (id)kCellularCdmaEvdoRxDiversityHistAtIndex:(unint64_t)a3;
- (id)kCellularCdmaEvdoServingCellRx0EcIoHistAtIndex:(unint64_t)a3;
- (id)kCellularCdmaEvdoServingCellRx0RssiHistAtIndex:(unint64_t)a3;
- (id)kCellularCdmaEvdoServingCellRx1EcIoHistAtIndex:(unint64_t)a3;
- (id)kCellularCdmaEvdoServingCellRx1RssiHistAtIndex:(unint64_t)a3;
- (id)kCellularCdmaEvdoTxPowerHistAtIndex:(unint64_t)a3;
- (id)kCellularCellPlmnSearchCountAtIndex:(unint64_t)a3;
- (id)kCellularCellPlmnSearchHistAtIndex:(unint64_t)a3;
- (id)kCellularDownlinkIpPacketDiscardedAtIndex:(unint64_t)a3;
- (id)kCellularDownlinkIpPacketFilterStatusAtIndex:(unint64_t)a3;
- (id)kCellularDvfsStatsAtIndex:(unint64_t)a3;
- (id)kCellularFwCoreStatsAtIndex:(unint64_t)a3;
- (id)kCellularGsmConnectedModeHistAtIndex:(unint64_t)a3;
- (id)kCellularGsmL1StateAtIndex:(unint64_t)a3;
- (id)kCellularGsmServingCellRssiHistAtIndex:(unint64_t)a3;
- (id)kCellularGsmServingCellSnrHistAtIndex:(unint64_t)a3;
- (id)kCellularGsmTxPowerHistAtIndex:(unint64_t)a3;
- (id)kCellularLqmStateChangeAtIndex:(unint64_t)a3;
- (id)kCellularLteAdvancedRxStateHistAtIndex:(unint64_t)a3;
- (id)kCellularLteCdrxConfigAtIndex:(unint64_t)a3;
- (id)kCellularLteComponentCarrierInfoAtIndex:(unint64_t)a3;
- (id)kCellularLteDataInactivityBeforeIdleAtIndex:(unint64_t)a3;
- (id)kCellularLteDlSccStateHistAtIndex:(unint64_t)a3;
- (id)kCellularLteDlSccStateHistV3AtIndex:(unint64_t)a3;
- (id)kCellularLteFwDuplexModeAtIndex:(unint64_t)a3;
- (id)kCellularLteIdleToConnectedUserDataAtIndex:(unint64_t)a3;
- (id)kCellularLtePagingCycleAtIndex:(unint64_t)a3;
- (id)kCellularLtePdcchStateHistAtIndex:(unint64_t)a3;
- (id)kCellularLtePdcchStateStatsAtIndex:(unint64_t)a3;
- (id)kCellularLteRadioLinkFailureAtIndex:(unint64_t)a3;
- (id)kCellularLteRrcStateAtIndex:(unint64_t)a3;
- (id)kCellularLteRxDiversityHistAtIndex:(unint64_t)a3;
- (id)kCellularLteRxTxStateHistAtIndex:(unint64_t)a3;
- (id)kCellularLteServingCellRsrpHistAtIndex:(unint64_t)a3;
- (id)kCellularLteServingCellSinrHistAtIndex:(unint64_t)a3;
- (id)kCellularLteSleepStateHistAtIndex:(unint64_t)a3;
- (id)kCellularLteTdsGsmHwStatsAtIndex:(unint64_t)a3;
- (id)kCellularLteTotalDlTbsHistAtIndex:(unint64_t)a3;
- (id)kCellularLteTxPowerHistAtIndex:(unint64_t)a3;
- (id)kCellularLteUlSccStateHistAtIndex:(unint64_t)a3;
- (id)kCellularLteWcdmaGsmHwStatsAtIndex:(unint64_t)a3;
- (id)kCellularLteWcdmaTdsHwStatsAtIndex:(unint64_t)a3;
- (id)kCellularPerClientProfileTriggerCountAtIndex:(unint64_t)a3;
- (id)kCellularPeripheralStatsAtIndex:(unint64_t)a3;
- (id)kCellularPmicHwStatsAtIndex:(unint64_t)a3;
- (id)kCellularPmuAverageCurrentAtIndex:(unint64_t)a3;
- (id)kCellularProtocolStackCpuStatsAtIndex:(unint64_t)a3;
- (id)kCellularProtocolStackPowerStateAtIndex:(unint64_t)a3;
- (id)kCellularProtocolStackStateAtIndex:(unint64_t)a3;
- (id)kCellularProtocolStackStateHist2AtIndex:(unint64_t)a3;
- (id)kCellularProtocolStackStateHistAtIndex:(unint64_t)a3;
- (id)kCellularServiceLostAtIndex:(unint64_t)a3;
- (id)kCellularServingCellRfBandHistAtIndex:(unint64_t)a3;
- (id)kCellularTdsL1StateAtIndex:(unint64_t)a3;
- (id)kCellularTdsRabModeHistAtIndex:(unint64_t)a3;
- (id)kCellularTdsRabTypeHistAtIndex:(unint64_t)a3;
- (id)kCellularTdsRrcStateAtIndex:(unint64_t)a3;
- (id)kCellularTdsRxDiversityHistAtIndex:(unint64_t)a3;
- (id)kCellularTdsServingCellRx0RscpHistAtIndex:(unint64_t)a3;
- (id)kCellularTdsServingCellRx0RssiHistAtIndex:(unint64_t)a3;
- (id)kCellularTdsServingCellRx1RscpHistAtIndex:(unint64_t)a3;
- (id)kCellularTdsServingCellRx1RssiHistAtIndex:(unint64_t)a3;
- (id)kCellularTdsTxPowerHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaCarrierStatusHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaCpcStatAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaDataInactivityBeforeIdleAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaIdleToConnectedUserDataAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaL1StateAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaRabModeHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaRabStatusAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaRabTypeHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaReceiverStatusOnC0HistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaReceiverStatusOnC1HistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaRrcConfigurationAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaRrcConnectionStateAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaRxDiversityHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaServingCellRx0EcNoHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaServingCellRx0RssiHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaServingCellRx1EcNoHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaServingCellRx1RssiHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaTxPowerHistAtIndex:(unint64_t)a3;
- (id)kCellularWcdmaVadHistAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)kCellularCdma1XConnectionHistsCount;
- (unint64_t)kCellularCdma1XProtocolStackStateHistsCount;
- (unint64_t)kCellularCdma1XRrStatesCount;
- (unint64_t)kCellularCdma1XRxDiversityHistsCount;
- (unint64_t)kCellularCdma1XServingCellRx0EcIoHistsCount;
- (unint64_t)kCellularCdma1XServingCellRx0RssiHistsCount;
- (unint64_t)kCellularCdma1XServingCellRx1EcIoHistsCount;
- (unint64_t)kCellularCdma1XServingCellRx1RssiHistsCount;
- (unint64_t)kCellularCdma1XTxPowerHistsCount;
- (unint64_t)kCellularCdmaEvdoProtocolStackStateHistsCount;
- (unint64_t)kCellularCdmaEvdoRrStatesCount;
- (unint64_t)kCellularCdmaEvdoRxDiversityHistsCount;
- (unint64_t)kCellularCdmaEvdoServingCellRx0EcIoHistsCount;
- (unint64_t)kCellularCdmaEvdoServingCellRx0RssiHistsCount;
- (unint64_t)kCellularCdmaEvdoServingCellRx1EcIoHistsCount;
- (unint64_t)kCellularCdmaEvdoServingCellRx1RssiHistsCount;
- (unint64_t)kCellularCdmaEvdoTxPowerHistsCount;
- (unint64_t)kCellularCellPlmnSearchCountsCount;
- (unint64_t)kCellularCellPlmnSearchHistsCount;
- (unint64_t)kCellularDownlinkIpPacketDiscardedsCount;
- (unint64_t)kCellularDownlinkIpPacketFilterStatusCount;
- (unint64_t)kCellularDvfsStatsCount;
- (unint64_t)kCellularFwCoreStatsCount;
- (unint64_t)kCellularGsmConnectedModeHistsCount;
- (unint64_t)kCellularGsmL1StatesCount;
- (unint64_t)kCellularGsmServingCellRssiHistsCount;
- (unint64_t)kCellularGsmServingCellSnrHistsCount;
- (unint64_t)kCellularGsmTxPowerHistsCount;
- (unint64_t)kCellularLqmStateChangesCount;
- (unint64_t)kCellularLteAdvancedRxStateHistsCount;
- (unint64_t)kCellularLteCdrxConfigsCount;
- (unint64_t)kCellularLteComponentCarrierInfosCount;
- (unint64_t)kCellularLteDataInactivityBeforeIdlesCount;
- (unint64_t)kCellularLteDlSccStateHistV3sCount;
- (unint64_t)kCellularLteDlSccStateHistsCount;
- (unint64_t)kCellularLteFwDuplexModesCount;
- (unint64_t)kCellularLteIdleToConnectedUserDatasCount;
- (unint64_t)kCellularLtePagingCyclesCount;
- (unint64_t)kCellularLtePdcchStateHistsCount;
- (unint64_t)kCellularLtePdcchStateStatsCount;
- (unint64_t)kCellularLteRadioLinkFailuresCount;
- (unint64_t)kCellularLteRrcStatesCount;
- (unint64_t)kCellularLteRxDiversityHistsCount;
- (unint64_t)kCellularLteRxTxStateHistsCount;
- (unint64_t)kCellularLteServingCellRsrpHistsCount;
- (unint64_t)kCellularLteServingCellSinrHistsCount;
- (unint64_t)kCellularLteSleepStateHistsCount;
- (unint64_t)kCellularLteTdsGsmHwStatsCount;
- (unint64_t)kCellularLteTotalDlTbsHistsCount;
- (unint64_t)kCellularLteTxPowerHistsCount;
- (unint64_t)kCellularLteUlSccStateHistsCount;
- (unint64_t)kCellularLteWcdmaGsmHwStatsCount;
- (unint64_t)kCellularLteWcdmaTdsHwStatsCount;
- (unint64_t)kCellularPerClientProfileTriggerCountsCount;
- (unint64_t)kCellularPeripheralStatsCount;
- (unint64_t)kCellularPmicHwStatsCount;
- (unint64_t)kCellularPmuAverageCurrentsCount;
- (unint64_t)kCellularProtocolStackCpuStatsCount;
- (unint64_t)kCellularProtocolStackPowerStatesCount;
- (unint64_t)kCellularProtocolStackStateHist2sCount;
- (unint64_t)kCellularProtocolStackStateHistsCount;
- (unint64_t)kCellularProtocolStackStatesCount;
- (unint64_t)kCellularServiceLostsCount;
- (unint64_t)kCellularServingCellRfBandHistsCount;
- (unint64_t)kCellularTdsL1StatesCount;
- (unint64_t)kCellularTdsRabModeHistsCount;
- (unint64_t)kCellularTdsRabTypeHistsCount;
- (unint64_t)kCellularTdsRrcStatesCount;
- (unint64_t)kCellularTdsRxDiversityHistsCount;
- (unint64_t)kCellularTdsServingCellRx0RscpHistsCount;
- (unint64_t)kCellularTdsServingCellRx0RssiHistsCount;
- (unint64_t)kCellularTdsServingCellRx1RscpHistsCount;
- (unint64_t)kCellularTdsServingCellRx1RssiHistsCount;
- (unint64_t)kCellularTdsTxPowerHistsCount;
- (unint64_t)kCellularWcdmaCarrierStatusHistsCount;
- (unint64_t)kCellularWcdmaCpcStatsCount;
- (unint64_t)kCellularWcdmaDataInactivityBeforeIdlesCount;
- (unint64_t)kCellularWcdmaIdleToConnectedUserDatasCount;
- (unint64_t)kCellularWcdmaL1StatesCount;
- (unint64_t)kCellularWcdmaRabModeHistsCount;
- (unint64_t)kCellularWcdmaRabStatusCount;
- (unint64_t)kCellularWcdmaRabTypeHistsCount;
- (unint64_t)kCellularWcdmaReceiverStatusOnC0HistsCount;
- (unint64_t)kCellularWcdmaReceiverStatusOnC1HistsCount;
- (unint64_t)kCellularWcdmaRrcConfigurationsCount;
- (unint64_t)kCellularWcdmaRrcConnectionStatesCount;
- (unint64_t)kCellularWcdmaRxDiversityHistsCount;
- (unint64_t)kCellularWcdmaServingCellRx0EcNoHistsCount;
- (unint64_t)kCellularWcdmaServingCellRx0RssiHistsCount;
- (unint64_t)kCellularWcdmaServingCellRx1EcNoHistsCount;
- (unint64_t)kCellularWcdmaServingCellRx1RssiHistsCount;
- (unint64_t)kCellularWcdmaTxPowerHistsCount;
- (unint64_t)kCellularWcdmaVadHistsCount;
- (void)addKCellularCdma1XConnectionHist:(id)a3;
- (void)addKCellularCdma1XProtocolStackStateHist:(id)a3;
- (void)addKCellularCdma1XRrState:(id)a3;
- (void)addKCellularCdma1XRxDiversityHist:(id)a3;
- (void)addKCellularCdma1XServingCellRx0EcIoHist:(id)a3;
- (void)addKCellularCdma1XServingCellRx0RssiHist:(id)a3;
- (void)addKCellularCdma1XServingCellRx1EcIoHist:(id)a3;
- (void)addKCellularCdma1XServingCellRx1RssiHist:(id)a3;
- (void)addKCellularCdma1XTxPowerHist:(id)a3;
- (void)addKCellularCdmaEvdoProtocolStackStateHist:(id)a3;
- (void)addKCellularCdmaEvdoRrState:(id)a3;
- (void)addKCellularCdmaEvdoRxDiversityHist:(id)a3;
- (void)addKCellularCdmaEvdoServingCellRx0EcIoHist:(id)a3;
- (void)addKCellularCdmaEvdoServingCellRx0RssiHist:(id)a3;
- (void)addKCellularCdmaEvdoServingCellRx1EcIoHist:(id)a3;
- (void)addKCellularCdmaEvdoServingCellRx1RssiHist:(id)a3;
- (void)addKCellularCdmaEvdoTxPowerHist:(id)a3;
- (void)addKCellularCellPlmnSearchCount:(id)a3;
- (void)addKCellularCellPlmnSearchHist:(id)a3;
- (void)addKCellularDownlinkIpPacketDiscarded:(id)a3;
- (void)addKCellularDownlinkIpPacketFilterStatus:(id)a3;
- (void)addKCellularDvfsStats:(id)a3;
- (void)addKCellularFwCoreStats:(id)a3;
- (void)addKCellularGsmConnectedModeHist:(id)a3;
- (void)addKCellularGsmL1State:(id)a3;
- (void)addKCellularGsmServingCellRssiHist:(id)a3;
- (void)addKCellularGsmServingCellSnrHist:(id)a3;
- (void)addKCellularGsmTxPowerHist:(id)a3;
- (void)addKCellularLqmStateChange:(id)a3;
- (void)addKCellularLteAdvancedRxStateHist:(id)a3;
- (void)addKCellularLteCdrxConfig:(id)a3;
- (void)addKCellularLteComponentCarrierInfo:(id)a3;
- (void)addKCellularLteDataInactivityBeforeIdle:(id)a3;
- (void)addKCellularLteDlSccStateHist:(id)a3;
- (void)addKCellularLteDlSccStateHistV3:(id)a3;
- (void)addKCellularLteFwDuplexMode:(id)a3;
- (void)addKCellularLteIdleToConnectedUserData:(id)a3;
- (void)addKCellularLtePagingCycle:(id)a3;
- (void)addKCellularLtePdcchStateHist:(id)a3;
- (void)addKCellularLtePdcchStateStats:(id)a3;
- (void)addKCellularLteRadioLinkFailure:(id)a3;
- (void)addKCellularLteRrcState:(id)a3;
- (void)addKCellularLteRxDiversityHist:(id)a3;
- (void)addKCellularLteRxTxStateHist:(id)a3;
- (void)addKCellularLteServingCellRsrpHist:(id)a3;
- (void)addKCellularLteServingCellSinrHist:(id)a3;
- (void)addKCellularLteSleepStateHist:(id)a3;
- (void)addKCellularLteTdsGsmHwStats:(id)a3;
- (void)addKCellularLteTotalDlTbsHist:(id)a3;
- (void)addKCellularLteTxPowerHist:(id)a3;
- (void)addKCellularLteUlSccStateHist:(id)a3;
- (void)addKCellularLteWcdmaGsmHwStats:(id)a3;
- (void)addKCellularLteWcdmaTdsHwStats:(id)a3;
- (void)addKCellularPerClientProfileTriggerCount:(id)a3;
- (void)addKCellularPeripheralStats:(id)a3;
- (void)addKCellularPmicHwStats:(id)a3;
- (void)addKCellularPmuAverageCurrent:(id)a3;
- (void)addKCellularProtocolStackCpuStats:(id)a3;
- (void)addKCellularProtocolStackPowerState:(id)a3;
- (void)addKCellularProtocolStackState:(id)a3;
- (void)addKCellularProtocolStackStateHist2:(id)a3;
- (void)addKCellularProtocolStackStateHist:(id)a3;
- (void)addKCellularServiceLost:(id)a3;
- (void)addKCellularServingCellRfBandHist:(id)a3;
- (void)addKCellularTdsL1State:(id)a3;
- (void)addKCellularTdsRabModeHist:(id)a3;
- (void)addKCellularTdsRabTypeHist:(id)a3;
- (void)addKCellularTdsRrcState:(id)a3;
- (void)addKCellularTdsRxDiversityHist:(id)a3;
- (void)addKCellularTdsServingCellRx0RscpHist:(id)a3;
- (void)addKCellularTdsServingCellRx0RssiHist:(id)a3;
- (void)addKCellularTdsServingCellRx1RscpHist:(id)a3;
- (void)addKCellularTdsServingCellRx1RssiHist:(id)a3;
- (void)addKCellularTdsTxPowerHist:(id)a3;
- (void)addKCellularWcdmaCarrierStatusHist:(id)a3;
- (void)addKCellularWcdmaCpcStat:(id)a3;
- (void)addKCellularWcdmaDataInactivityBeforeIdle:(id)a3;
- (void)addKCellularWcdmaIdleToConnectedUserData:(id)a3;
- (void)addKCellularWcdmaL1State:(id)a3;
- (void)addKCellularWcdmaRabModeHist:(id)a3;
- (void)addKCellularWcdmaRabStatus:(id)a3;
- (void)addKCellularWcdmaRabTypeHist:(id)a3;
- (void)addKCellularWcdmaReceiverStatusOnC0Hist:(id)a3;
- (void)addKCellularWcdmaReceiverStatusOnC1Hist:(id)a3;
- (void)addKCellularWcdmaRrcConfiguration:(id)a3;
- (void)addKCellularWcdmaRrcConnectionState:(id)a3;
- (void)addKCellularWcdmaRxDiversityHist:(id)a3;
- (void)addKCellularWcdmaServingCellRx0EcNoHist:(id)a3;
- (void)addKCellularWcdmaServingCellRx0RssiHist:(id)a3;
- (void)addKCellularWcdmaServingCellRx1EcNoHist:(id)a3;
- (void)addKCellularWcdmaServingCellRx1RssiHist:(id)a3;
- (void)addKCellularWcdmaTxPowerHist:(id)a3;
- (void)addKCellularWcdmaVadHist:(id)a3;
- (void)clearKCellularCdma1XConnectionHists;
- (void)clearKCellularCdma1XProtocolStackStateHists;
- (void)clearKCellularCdma1XRrStates;
- (void)clearKCellularCdma1XRxDiversityHists;
- (void)clearKCellularCdma1XServingCellRx0EcIoHists;
- (void)clearKCellularCdma1XServingCellRx0RssiHists;
- (void)clearKCellularCdma1XServingCellRx1EcIoHists;
- (void)clearKCellularCdma1XServingCellRx1RssiHists;
- (void)clearKCellularCdma1XTxPowerHists;
- (void)clearKCellularCdmaEvdoProtocolStackStateHists;
- (void)clearKCellularCdmaEvdoRrStates;
- (void)clearKCellularCdmaEvdoRxDiversityHists;
- (void)clearKCellularCdmaEvdoServingCellRx0EcIoHists;
- (void)clearKCellularCdmaEvdoServingCellRx0RssiHists;
- (void)clearKCellularCdmaEvdoServingCellRx1EcIoHists;
- (void)clearKCellularCdmaEvdoServingCellRx1RssiHists;
- (void)clearKCellularCdmaEvdoTxPowerHists;
- (void)clearKCellularCellPlmnSearchCounts;
- (void)clearKCellularCellPlmnSearchHists;
- (void)clearKCellularDownlinkIpPacketDiscardeds;
- (void)clearKCellularDownlinkIpPacketFilterStatus;
- (void)clearKCellularDvfsStats;
- (void)clearKCellularFwCoreStats;
- (void)clearKCellularGsmConnectedModeHists;
- (void)clearKCellularGsmL1States;
- (void)clearKCellularGsmServingCellRssiHists;
- (void)clearKCellularGsmServingCellSnrHists;
- (void)clearKCellularGsmTxPowerHists;
- (void)clearKCellularLqmStateChanges;
- (void)clearKCellularLteAdvancedRxStateHists;
- (void)clearKCellularLteCdrxConfigs;
- (void)clearKCellularLteComponentCarrierInfos;
- (void)clearKCellularLteDataInactivityBeforeIdles;
- (void)clearKCellularLteDlSccStateHistV3s;
- (void)clearKCellularLteDlSccStateHists;
- (void)clearKCellularLteFwDuplexModes;
- (void)clearKCellularLteIdleToConnectedUserDatas;
- (void)clearKCellularLtePagingCycles;
- (void)clearKCellularLtePdcchStateHists;
- (void)clearKCellularLtePdcchStateStats;
- (void)clearKCellularLteRadioLinkFailures;
- (void)clearKCellularLteRrcStates;
- (void)clearKCellularLteRxDiversityHists;
- (void)clearKCellularLteRxTxStateHists;
- (void)clearKCellularLteServingCellRsrpHists;
- (void)clearKCellularLteServingCellSinrHists;
- (void)clearKCellularLteSleepStateHists;
- (void)clearKCellularLteTdsGsmHwStats;
- (void)clearKCellularLteTotalDlTbsHists;
- (void)clearKCellularLteTxPowerHists;
- (void)clearKCellularLteUlSccStateHists;
- (void)clearKCellularLteWcdmaGsmHwStats;
- (void)clearKCellularLteWcdmaTdsHwStats;
- (void)clearKCellularPerClientProfileTriggerCounts;
- (void)clearKCellularPeripheralStats;
- (void)clearKCellularPmicHwStats;
- (void)clearKCellularPmuAverageCurrents;
- (void)clearKCellularProtocolStackCpuStats;
- (void)clearKCellularProtocolStackPowerStates;
- (void)clearKCellularProtocolStackStateHist2s;
- (void)clearKCellularProtocolStackStateHists;
- (void)clearKCellularProtocolStackStates;
- (void)clearKCellularServiceLosts;
- (void)clearKCellularServingCellRfBandHists;
- (void)clearKCellularTdsL1States;
- (void)clearKCellularTdsRabModeHists;
- (void)clearKCellularTdsRabTypeHists;
- (void)clearKCellularTdsRrcStates;
- (void)clearKCellularTdsRxDiversityHists;
- (void)clearKCellularTdsServingCellRx0RscpHists;
- (void)clearKCellularTdsServingCellRx0RssiHists;
- (void)clearKCellularTdsServingCellRx1RscpHists;
- (void)clearKCellularTdsServingCellRx1RssiHists;
- (void)clearKCellularTdsTxPowerHists;
- (void)clearKCellularWcdmaCarrierStatusHists;
- (void)clearKCellularWcdmaCpcStats;
- (void)clearKCellularWcdmaDataInactivityBeforeIdles;
- (void)clearKCellularWcdmaIdleToConnectedUserDatas;
- (void)clearKCellularWcdmaL1States;
- (void)clearKCellularWcdmaRabModeHists;
- (void)clearKCellularWcdmaRabStatus;
- (void)clearKCellularWcdmaRabTypeHists;
- (void)clearKCellularWcdmaReceiverStatusOnC0Hists;
- (void)clearKCellularWcdmaReceiverStatusOnC1Hists;
- (void)clearKCellularWcdmaRrcConfigurations;
- (void)clearKCellularWcdmaRrcConnectionStates;
- (void)clearKCellularWcdmaRxDiversityHists;
- (void)clearKCellularWcdmaServingCellRx0EcNoHists;
- (void)clearKCellularWcdmaServingCellRx0RssiHists;
- (void)clearKCellularWcdmaServingCellRx1EcNoHists;
- (void)clearKCellularWcdmaServingCellRx1RssiHists;
- (void)clearKCellularWcdmaTxPowerHists;
- (void)clearKCellularWcdmaVadHists;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setKCellularCdma1XConnectionHists:(id)a3;
- (void)setKCellularCdma1XProtocolStackStateHists:(id)a3;
- (void)setKCellularCdma1XRrStates:(id)a3;
- (void)setKCellularCdma1XRxDiversityHists:(id)a3;
- (void)setKCellularCdma1XServingCellRx0EcIoHists:(id)a3;
- (void)setKCellularCdma1XServingCellRx0RssiHists:(id)a3;
- (void)setKCellularCdma1XServingCellRx1EcIoHists:(id)a3;
- (void)setKCellularCdma1XServingCellRx1RssiHists:(id)a3;
- (void)setKCellularCdma1XTxPowerHists:(id)a3;
- (void)setKCellularCdmaEvdoProtocolStackStateHists:(id)a3;
- (void)setKCellularCdmaEvdoRrStates:(id)a3;
- (void)setKCellularCdmaEvdoRxDiversityHists:(id)a3;
- (void)setKCellularCdmaEvdoServingCellRx0EcIoHists:(id)a3;
- (void)setKCellularCdmaEvdoServingCellRx0RssiHists:(id)a3;
- (void)setKCellularCdmaEvdoServingCellRx1EcIoHists:(id)a3;
- (void)setKCellularCdmaEvdoServingCellRx1RssiHists:(id)a3;
- (void)setKCellularCdmaEvdoTxPowerHists:(id)a3;
- (void)setKCellularCellPlmnSearchCounts:(id)a3;
- (void)setKCellularCellPlmnSearchHists:(id)a3;
- (void)setKCellularDownlinkIpPacketDiscardeds:(id)a3;
- (void)setKCellularDownlinkIpPacketFilterStatus:(id)a3;
- (void)setKCellularDvfsStats:(id)a3;
- (void)setKCellularFwCoreStats:(id)a3;
- (void)setKCellularGsmConnectedModeHists:(id)a3;
- (void)setKCellularGsmL1States:(id)a3;
- (void)setKCellularGsmServingCellRssiHists:(id)a3;
- (void)setKCellularGsmServingCellSnrHists:(id)a3;
- (void)setKCellularGsmTxPowerHists:(id)a3;
- (void)setKCellularLqmStateChanges:(id)a3;
- (void)setKCellularLteAdvancedRxStateHists:(id)a3;
- (void)setKCellularLteCdrxConfigs:(id)a3;
- (void)setKCellularLteComponentCarrierInfos:(id)a3;
- (void)setKCellularLteDataInactivityBeforeIdles:(id)a3;
- (void)setKCellularLteDlSccStateHistV3s:(id)a3;
- (void)setKCellularLteDlSccStateHists:(id)a3;
- (void)setKCellularLteFwDuplexModes:(id)a3;
- (void)setKCellularLteIdleToConnectedUserDatas:(id)a3;
- (void)setKCellularLtePagingCycles:(id)a3;
- (void)setKCellularLtePdcchStateHists:(id)a3;
- (void)setKCellularLtePdcchStateStats:(id)a3;
- (void)setKCellularLteRadioLinkFailures:(id)a3;
- (void)setKCellularLteRrcStates:(id)a3;
- (void)setKCellularLteRxDiversityHists:(id)a3;
- (void)setKCellularLteRxTxStateHists:(id)a3;
- (void)setKCellularLteServingCellRsrpHists:(id)a3;
- (void)setKCellularLteServingCellSinrHists:(id)a3;
- (void)setKCellularLteSleepStateHists:(id)a3;
- (void)setKCellularLteTdsGsmHwStats:(id)a3;
- (void)setKCellularLteTotalDlTbsHists:(id)a3;
- (void)setKCellularLteTxPowerHists:(id)a3;
- (void)setKCellularLteUlSccStateHists:(id)a3;
- (void)setKCellularLteWcdmaGsmHwStats:(id)a3;
- (void)setKCellularLteWcdmaTdsHwStats:(id)a3;
- (void)setKCellularPerClientProfileTriggerCounts:(id)a3;
- (void)setKCellularPeripheralStats:(id)a3;
- (void)setKCellularPmicHwStats:(id)a3;
- (void)setKCellularPmuAverageCurrents:(id)a3;
- (void)setKCellularProtocolStackCpuStats:(id)a3;
- (void)setKCellularProtocolStackPowerStates:(id)a3;
- (void)setKCellularProtocolStackStateHist2s:(id)a3;
- (void)setKCellularProtocolStackStateHists:(id)a3;
- (void)setKCellularProtocolStackStates:(id)a3;
- (void)setKCellularServiceLosts:(id)a3;
- (void)setKCellularServingCellRfBandHists:(id)a3;
- (void)setKCellularTdsL1States:(id)a3;
- (void)setKCellularTdsRabModeHists:(id)a3;
- (void)setKCellularTdsRabTypeHists:(id)a3;
- (void)setKCellularTdsRrcStates:(id)a3;
- (void)setKCellularTdsRxDiversityHists:(id)a3;
- (void)setKCellularTdsServingCellRx0RscpHists:(id)a3;
- (void)setKCellularTdsServingCellRx0RssiHists:(id)a3;
- (void)setKCellularTdsServingCellRx1RscpHists:(id)a3;
- (void)setKCellularTdsServingCellRx1RssiHists:(id)a3;
- (void)setKCellularTdsTxPowerHists:(id)a3;
- (void)setKCellularWcdmaCarrierStatusHists:(id)a3;
- (void)setKCellularWcdmaCpcStats:(id)a3;
- (void)setKCellularWcdmaDataInactivityBeforeIdles:(id)a3;
- (void)setKCellularWcdmaIdleToConnectedUserDatas:(id)a3;
- (void)setKCellularWcdmaL1States:(id)a3;
- (void)setKCellularWcdmaRabModeHists:(id)a3;
- (void)setKCellularWcdmaRabStatus:(id)a3;
- (void)setKCellularWcdmaRabTypeHists:(id)a3;
- (void)setKCellularWcdmaReceiverStatusOnC0Hists:(id)a3;
- (void)setKCellularWcdmaReceiverStatusOnC1Hists:(id)a3;
- (void)setKCellularWcdmaRrcConfigurations:(id)a3;
- (void)setKCellularWcdmaRrcConnectionStates:(id)a3;
- (void)setKCellularWcdmaRxDiversityHists:(id)a3;
- (void)setKCellularWcdmaServingCellRx0EcNoHists:(id)a3;
- (void)setKCellularWcdmaServingCellRx0RssiHists:(id)a3;
- (void)setKCellularWcdmaServingCellRx1EcNoHists:(id)a3;
- (void)setKCellularWcdmaServingCellRx1RssiHists:(id)a3;
- (void)setKCellularWcdmaTxPowerHists:(id)a3;
- (void)setKCellularWcdmaVadHists:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PowerlogMetricLog

- (void)clearKCellularPerClientProfileTriggerCounts
{
}

- (void)addKCellularPerClientProfileTriggerCount:(id)a3
{
  id v4 = a3;
  kCellularPerClientProfileTriggerCounts = self->_kCellularPerClientProfileTriggerCounts;
  id v8 = v4;
  if (!kCellularPerClientProfileTriggerCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularPerClientProfileTriggerCounts;
    self->_kCellularPerClientProfileTriggerCounts = v6;

    id v4 = v8;
    kCellularPerClientProfileTriggerCounts = self->_kCellularPerClientProfileTriggerCounts;
  }
  [(NSMutableArray *)kCellularPerClientProfileTriggerCounts addObject:v4];
}

- (unint64_t)kCellularPerClientProfileTriggerCountsCount
{
  return [(NSMutableArray *)self->_kCellularPerClientProfileTriggerCounts count];
}

- (id)kCellularPerClientProfileTriggerCountAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularPerClientProfileTriggerCounts objectAtIndex:a3];
}

+ (Class)kCellularPerClientProfileTriggerCountType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackCpuStats
{
}

- (void)addKCellularProtocolStackCpuStats:(id)a3
{
  id v4 = a3;
  kCellularProtocolStackCpuStats = self->_kCellularProtocolStackCpuStats;
  id v8 = v4;
  if (!kCellularProtocolStackCpuStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularProtocolStackCpuStats;
    self->_kCellularProtocolStackCpuStats = v6;

    id v4 = v8;
    kCellularProtocolStackCpuStats = self->_kCellularProtocolStackCpuStats;
  }
  [(NSMutableArray *)kCellularProtocolStackCpuStats addObject:v4];
}

- (unint64_t)kCellularProtocolStackCpuStatsCount
{
  return [(NSMutableArray *)self->_kCellularProtocolStackCpuStats count];
}

- (id)kCellularProtocolStackCpuStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularProtocolStackCpuStats objectAtIndex:a3];
}

+ (Class)kCellularProtocolStackCpuStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularPeripheralStats
{
}

- (void)addKCellularPeripheralStats:(id)a3
{
  id v4 = a3;
  kCellularPeripheralStats = self->_kCellularPeripheralStats;
  id v8 = v4;
  if (!kCellularPeripheralStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularPeripheralStats;
    self->_kCellularPeripheralStats = v6;

    id v4 = v8;
    kCellularPeripheralStats = self->_kCellularPeripheralStats;
  }
  [(NSMutableArray *)kCellularPeripheralStats addObject:v4];
}

- (unint64_t)kCellularPeripheralStatsCount
{
  return [(NSMutableArray *)self->_kCellularPeripheralStats count];
}

- (id)kCellularPeripheralStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularPeripheralStats objectAtIndex:a3];
}

+ (Class)kCellularPeripheralStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularDvfsStats
{
}

- (void)addKCellularDvfsStats:(id)a3
{
  id v4 = a3;
  kCellularDvfsStats = self->_kCellularDvfsStats;
  id v8 = v4;
  if (!kCellularDvfsStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularDvfsStats;
    self->_kCellularDvfsStats = v6;

    id v4 = v8;
    kCellularDvfsStats = self->_kCellularDvfsStats;
  }
  [(NSMutableArray *)kCellularDvfsStats addObject:v4];
}

- (unint64_t)kCellularDvfsStatsCount
{
  return [(NSMutableArray *)self->_kCellularDvfsStats count];
}

- (id)kCellularDvfsStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularDvfsStats objectAtIndex:a3];
}

+ (Class)kCellularDvfsStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteWcdmaGsmHwStats
{
}

- (void)addKCellularLteWcdmaGsmHwStats:(id)a3
{
  id v4 = a3;
  kCellularLteWcdmaGsmHwStats = self->_kCellularLteWcdmaGsmHwStats;
  id v8 = v4;
  if (!kCellularLteWcdmaGsmHwStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteWcdmaGsmHwStats;
    self->_kCellularLteWcdmaGsmHwStats = v6;

    id v4 = v8;
    kCellularLteWcdmaGsmHwStats = self->_kCellularLteWcdmaGsmHwStats;
  }
  [(NSMutableArray *)kCellularLteWcdmaGsmHwStats addObject:v4];
}

- (unint64_t)kCellularLteWcdmaGsmHwStatsCount
{
  return [(NSMutableArray *)self->_kCellularLteWcdmaGsmHwStats count];
}

- (id)kCellularLteWcdmaGsmHwStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteWcdmaGsmHwStats objectAtIndex:a3];
}

+ (Class)kCellularLteWcdmaGsmHwStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteTdsGsmHwStats
{
}

- (void)addKCellularLteTdsGsmHwStats:(id)a3
{
  id v4 = a3;
  kCellularLteTdsGsmHwStats = self->_kCellularLteTdsGsmHwStats;
  id v8 = v4;
  if (!kCellularLteTdsGsmHwStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteTdsGsmHwStats;
    self->_kCellularLteTdsGsmHwStats = v6;

    id v4 = v8;
    kCellularLteTdsGsmHwStats = self->_kCellularLteTdsGsmHwStats;
  }
  [(NSMutableArray *)kCellularLteTdsGsmHwStats addObject:v4];
}

- (unint64_t)kCellularLteTdsGsmHwStatsCount
{
  return [(NSMutableArray *)self->_kCellularLteTdsGsmHwStats count];
}

- (id)kCellularLteTdsGsmHwStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteTdsGsmHwStats objectAtIndex:a3];
}

+ (Class)kCellularLteTdsGsmHwStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularPmuAverageCurrents
{
}

- (void)addKCellularPmuAverageCurrent:(id)a3
{
  id v4 = a3;
  kCellularPmuAverageCurrents = self->_kCellularPmuAverageCurrents;
  id v8 = v4;
  if (!kCellularPmuAverageCurrents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularPmuAverageCurrents;
    self->_kCellularPmuAverageCurrents = v6;

    id v4 = v8;
    kCellularPmuAverageCurrents = self->_kCellularPmuAverageCurrents;
  }
  [(NSMutableArray *)kCellularPmuAverageCurrents addObject:v4];
}

- (unint64_t)kCellularPmuAverageCurrentsCount
{
  return [(NSMutableArray *)self->_kCellularPmuAverageCurrents count];
}

- (id)kCellularPmuAverageCurrentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularPmuAverageCurrents objectAtIndex:a3];
}

+ (Class)kCellularPmuAverageCurrentType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularFwCoreStats
{
}

- (void)addKCellularFwCoreStats:(id)a3
{
  id v4 = a3;
  kCellularFwCoreStats = self->_kCellularFwCoreStats;
  id v8 = v4;
  if (!kCellularFwCoreStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularFwCoreStats;
    self->_kCellularFwCoreStats = v6;

    id v4 = v8;
    kCellularFwCoreStats = self->_kCellularFwCoreStats;
  }
  [(NSMutableArray *)kCellularFwCoreStats addObject:v4];
}

- (unint64_t)kCellularFwCoreStatsCount
{
  return [(NSMutableArray *)self->_kCellularFwCoreStats count];
}

- (id)kCellularFwCoreStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularFwCoreStats objectAtIndex:a3];
}

+ (Class)kCellularFwCoreStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteWcdmaTdsHwStats
{
}

- (void)addKCellularLteWcdmaTdsHwStats:(id)a3
{
  id v4 = a3;
  kCellularLteWcdmaTdsHwStats = self->_kCellularLteWcdmaTdsHwStats;
  id v8 = v4;
  if (!kCellularLteWcdmaTdsHwStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteWcdmaTdsHwStats;
    self->_kCellularLteWcdmaTdsHwStats = v6;

    id v4 = v8;
    kCellularLteWcdmaTdsHwStats = self->_kCellularLteWcdmaTdsHwStats;
  }
  [(NSMutableArray *)kCellularLteWcdmaTdsHwStats addObject:v4];
}

- (unint64_t)kCellularLteWcdmaTdsHwStatsCount
{
  return [(NSMutableArray *)self->_kCellularLteWcdmaTdsHwStats count];
}

- (id)kCellularLteWcdmaTdsHwStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteWcdmaTdsHwStats objectAtIndex:a3];
}

+ (Class)kCellularLteWcdmaTdsHwStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularPmicHwStats
{
}

- (void)addKCellularPmicHwStats:(id)a3
{
  id v4 = a3;
  kCellularPmicHwStats = self->_kCellularPmicHwStats;
  id v8 = v4;
  if (!kCellularPmicHwStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularPmicHwStats;
    self->_kCellularPmicHwStats = v6;

    id v4 = v8;
    kCellularPmicHwStats = self->_kCellularPmicHwStats;
  }
  [(NSMutableArray *)kCellularPmicHwStats addObject:v4];
}

- (unint64_t)kCellularPmicHwStatsCount
{
  return [(NSMutableArray *)self->_kCellularPmicHwStats count];
}

- (id)kCellularPmicHwStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularPmicHwStats objectAtIndex:a3];
}

+ (Class)kCellularPmicHwStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmServingCellRssiHists
{
}

- (void)addKCellularGsmServingCellRssiHist:(id)a3
{
  id v4 = a3;
  kCellularGsmServingCellRssiHists = self->_kCellularGsmServingCellRssiHists;
  id v8 = v4;
  if (!kCellularGsmServingCellRssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularGsmServingCellRssiHists;
    self->_kCellularGsmServingCellRssiHists = v6;

    id v4 = v8;
    kCellularGsmServingCellRssiHists = self->_kCellularGsmServingCellRssiHists;
  }
  [(NSMutableArray *)kCellularGsmServingCellRssiHists addObject:v4];
}

- (unint64_t)kCellularGsmServingCellRssiHistsCount
{
  return [(NSMutableArray *)self->_kCellularGsmServingCellRssiHists count];
}

- (id)kCellularGsmServingCellRssiHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularGsmServingCellRssiHists objectAtIndex:a3];
}

+ (Class)kCellularGsmServingCellRssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmServingCellSnrHists
{
}

- (void)addKCellularGsmServingCellSnrHist:(id)a3
{
  id v4 = a3;
  kCellularGsmServingCellSnrHists = self->_kCellularGsmServingCellSnrHists;
  id v8 = v4;
  if (!kCellularGsmServingCellSnrHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularGsmServingCellSnrHists;
    self->_kCellularGsmServingCellSnrHists = v6;

    id v4 = v8;
    kCellularGsmServingCellSnrHists = self->_kCellularGsmServingCellSnrHists;
  }
  [(NSMutableArray *)kCellularGsmServingCellSnrHists addObject:v4];
}

- (unint64_t)kCellularGsmServingCellSnrHistsCount
{
  return [(NSMutableArray *)self->_kCellularGsmServingCellSnrHists count];
}

- (id)kCellularGsmServingCellSnrHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularGsmServingCellSnrHists objectAtIndex:a3];
}

+ (Class)kCellularGsmServingCellSnrHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmTxPowerHists
{
}

- (void)addKCellularGsmTxPowerHist:(id)a3
{
  id v4 = a3;
  kCellularGsmTxPowerHists = self->_kCellularGsmTxPowerHists;
  id v8 = v4;
  if (!kCellularGsmTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularGsmTxPowerHists;
    self->_kCellularGsmTxPowerHists = v6;

    id v4 = v8;
    kCellularGsmTxPowerHists = self->_kCellularGsmTxPowerHists;
  }
  [(NSMutableArray *)kCellularGsmTxPowerHists addObject:v4];
}

- (unint64_t)kCellularGsmTxPowerHistsCount
{
  return [(NSMutableArray *)self->_kCellularGsmTxPowerHists count];
}

- (id)kCellularGsmTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularGsmTxPowerHists objectAtIndex:a3];
}

+ (Class)kCellularGsmTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmConnectedModeHists
{
}

- (void)addKCellularGsmConnectedModeHist:(id)a3
{
  id v4 = a3;
  kCellularGsmConnectedModeHists = self->_kCellularGsmConnectedModeHists;
  id v8 = v4;
  if (!kCellularGsmConnectedModeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularGsmConnectedModeHists;
    self->_kCellularGsmConnectedModeHists = v6;

    id v4 = v8;
    kCellularGsmConnectedModeHists = self->_kCellularGsmConnectedModeHists;
  }
  [(NSMutableArray *)kCellularGsmConnectedModeHists addObject:v4];
}

- (unint64_t)kCellularGsmConnectedModeHistsCount
{
  return [(NSMutableArray *)self->_kCellularGsmConnectedModeHists count];
}

- (id)kCellularGsmConnectedModeHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularGsmConnectedModeHists objectAtIndex:a3];
}

+ (Class)kCellularGsmConnectedModeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularGsmL1States
{
}

- (void)addKCellularGsmL1State:(id)a3
{
  id v4 = a3;
  kCellularGsmL1States = self->_kCellularGsmL1States;
  id v8 = v4;
  if (!kCellularGsmL1States)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularGsmL1States;
    self->_kCellularGsmL1States = v6;

    id v4 = v8;
    kCellularGsmL1States = self->_kCellularGsmL1States;
  }
  [(NSMutableArray *)kCellularGsmL1States addObject:v4];
}

- (unint64_t)kCellularGsmL1StatesCount
{
  return [(NSMutableArray *)self->_kCellularGsmL1States count];
}

- (id)kCellularGsmL1StateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularGsmL1States objectAtIndex:a3];
}

+ (Class)kCellularGsmL1StateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaCpcStats
{
}

- (void)addKCellularWcdmaCpcStat:(id)a3
{
  id v4 = a3;
  kCellularWcdmaCpcStats = self->_kCellularWcdmaCpcStats;
  id v8 = v4;
  if (!kCellularWcdmaCpcStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaCpcStats;
    self->_kCellularWcdmaCpcStats = v6;

    id v4 = v8;
    kCellularWcdmaCpcStats = self->_kCellularWcdmaCpcStats;
  }
  [(NSMutableArray *)kCellularWcdmaCpcStats addObject:v4];
}

- (unint64_t)kCellularWcdmaCpcStatsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaCpcStats count];
}

- (id)kCellularWcdmaCpcStatAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaCpcStats objectAtIndex:a3];
}

+ (Class)kCellularWcdmaCpcStatType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRxDiversityHists
{
}

- (void)addKCellularWcdmaRxDiversityHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaRxDiversityHists = self->_kCellularWcdmaRxDiversityHists;
  id v8 = v4;
  if (!kCellularWcdmaRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaRxDiversityHists;
    self->_kCellularWcdmaRxDiversityHists = v6;

    id v4 = v8;
    kCellularWcdmaRxDiversityHists = self->_kCellularWcdmaRxDiversityHists;
  }
  [(NSMutableArray *)kCellularWcdmaRxDiversityHists addObject:v4];
}

- (unint64_t)kCellularWcdmaRxDiversityHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaRxDiversityHists count];
}

- (id)kCellularWcdmaRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaRxDiversityHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaServingCellRx0RssiHists
{
}

- (void)addKCellularWcdmaServingCellRx0RssiHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaServingCellRx0RssiHists = self->_kCellularWcdmaServingCellRx0RssiHists;
  id v8 = v4;
  if (!kCellularWcdmaServingCellRx0RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaServingCellRx0RssiHists;
    self->_kCellularWcdmaServingCellRx0RssiHists = v6;

    id v4 = v8;
    kCellularWcdmaServingCellRx0RssiHists = self->_kCellularWcdmaServingCellRx0RssiHists;
  }
  [(NSMutableArray *)kCellularWcdmaServingCellRx0RssiHists addObject:v4];
}

- (unint64_t)kCellularWcdmaServingCellRx0RssiHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaServingCellRx0RssiHists count];
}

- (id)kCellularWcdmaServingCellRx0RssiHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaServingCellRx0RssiHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaServingCellRx0RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaServingCellRx1RssiHists
{
}

- (void)addKCellularWcdmaServingCellRx1RssiHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaServingCellRx1RssiHists = self->_kCellularWcdmaServingCellRx1RssiHists;
  id v8 = v4;
  if (!kCellularWcdmaServingCellRx1RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaServingCellRx1RssiHists;
    self->_kCellularWcdmaServingCellRx1RssiHists = v6;

    id v4 = v8;
    kCellularWcdmaServingCellRx1RssiHists = self->_kCellularWcdmaServingCellRx1RssiHists;
  }
  [(NSMutableArray *)kCellularWcdmaServingCellRx1RssiHists addObject:v4];
}

- (unint64_t)kCellularWcdmaServingCellRx1RssiHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaServingCellRx1RssiHists count];
}

- (id)kCellularWcdmaServingCellRx1RssiHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaServingCellRx1RssiHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaServingCellRx1RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaServingCellRx0EcNoHists
{
}

- (void)addKCellularWcdmaServingCellRx0EcNoHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaServingCellRx0EcNoHists = self->_kCellularWcdmaServingCellRx0EcNoHists;
  id v8 = v4;
  if (!kCellularWcdmaServingCellRx0EcNoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaServingCellRx0EcNoHists;
    self->_kCellularWcdmaServingCellRx0EcNoHists = v6;

    id v4 = v8;
    kCellularWcdmaServingCellRx0EcNoHists = self->_kCellularWcdmaServingCellRx0EcNoHists;
  }
  [(NSMutableArray *)kCellularWcdmaServingCellRx0EcNoHists addObject:v4];
}

- (unint64_t)kCellularWcdmaServingCellRx0EcNoHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaServingCellRx0EcNoHists count];
}

- (id)kCellularWcdmaServingCellRx0EcNoHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaServingCellRx0EcNoHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaServingCellRx0EcNoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaServingCellRx1EcNoHists
{
}

- (void)addKCellularWcdmaServingCellRx1EcNoHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaServingCellRx1EcNoHists = self->_kCellularWcdmaServingCellRx1EcNoHists;
  id v8 = v4;
  if (!kCellularWcdmaServingCellRx1EcNoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaServingCellRx1EcNoHists;
    self->_kCellularWcdmaServingCellRx1EcNoHists = v6;

    id v4 = v8;
    kCellularWcdmaServingCellRx1EcNoHists = self->_kCellularWcdmaServingCellRx1EcNoHists;
  }
  [(NSMutableArray *)kCellularWcdmaServingCellRx1EcNoHists addObject:v4];
}

- (unint64_t)kCellularWcdmaServingCellRx1EcNoHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaServingCellRx1EcNoHists count];
}

- (id)kCellularWcdmaServingCellRx1EcNoHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaServingCellRx1EcNoHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaServingCellRx1EcNoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaTxPowerHists
{
}

- (void)addKCellularWcdmaTxPowerHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaTxPowerHists = self->_kCellularWcdmaTxPowerHists;
  id v8 = v4;
  if (!kCellularWcdmaTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaTxPowerHists;
    self->_kCellularWcdmaTxPowerHists = v6;

    id v4 = v8;
    kCellularWcdmaTxPowerHists = self->_kCellularWcdmaTxPowerHists;
  }
  [(NSMutableArray *)kCellularWcdmaTxPowerHists addObject:v4];
}

- (unint64_t)kCellularWcdmaTxPowerHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaTxPowerHists count];
}

- (id)kCellularWcdmaTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaTxPowerHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaReceiverStatusOnC0Hists
{
}

- (void)addKCellularWcdmaReceiverStatusOnC0Hist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaReceiverStatusOnC0Hists = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  id v8 = v4;
  if (!kCellularWcdmaReceiverStatusOnC0Hists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaReceiverStatusOnC0Hists;
    self->_kCellularWcdmaReceiverStatusOnC0Hists = v6;

    id v4 = v8;
    kCellularWcdmaReceiverStatusOnC0Hists = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  }
  [(NSMutableArray *)kCellularWcdmaReceiverStatusOnC0Hists addObject:v4];
}

- (unint64_t)kCellularWcdmaReceiverStatusOnC0HistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaReceiverStatusOnC0Hists count];
}

- (id)kCellularWcdmaReceiverStatusOnC0HistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaReceiverStatusOnC0Hists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaReceiverStatusOnC0HistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaReceiverStatusOnC1Hists
{
}

- (void)addKCellularWcdmaReceiverStatusOnC1Hist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaReceiverStatusOnC1Hists = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  id v8 = v4;
  if (!kCellularWcdmaReceiverStatusOnC1Hists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaReceiverStatusOnC1Hists;
    self->_kCellularWcdmaReceiverStatusOnC1Hists = v6;

    id v4 = v8;
    kCellularWcdmaReceiverStatusOnC1Hists = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  }
  [(NSMutableArray *)kCellularWcdmaReceiverStatusOnC1Hists addObject:v4];
}

- (unint64_t)kCellularWcdmaReceiverStatusOnC1HistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaReceiverStatusOnC1Hists count];
}

- (id)kCellularWcdmaReceiverStatusOnC1HistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaReceiverStatusOnC1Hists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaReceiverStatusOnC1HistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaCarrierStatusHists
{
}

- (void)addKCellularWcdmaCarrierStatusHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaCarrierStatusHists = self->_kCellularWcdmaCarrierStatusHists;
  id v8 = v4;
  if (!kCellularWcdmaCarrierStatusHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaCarrierStatusHists;
    self->_kCellularWcdmaCarrierStatusHists = v6;

    id v4 = v8;
    kCellularWcdmaCarrierStatusHists = self->_kCellularWcdmaCarrierStatusHists;
  }
  [(NSMutableArray *)kCellularWcdmaCarrierStatusHists addObject:v4];
}

- (unint64_t)kCellularWcdmaCarrierStatusHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaCarrierStatusHists count];
}

- (id)kCellularWcdmaCarrierStatusHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaCarrierStatusHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaCarrierStatusHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRabModeHists
{
}

- (void)addKCellularWcdmaRabModeHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaRabModeHists = self->_kCellularWcdmaRabModeHists;
  id v8 = v4;
  if (!kCellularWcdmaRabModeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaRabModeHists;
    self->_kCellularWcdmaRabModeHists = v6;

    id v4 = v8;
    kCellularWcdmaRabModeHists = self->_kCellularWcdmaRabModeHists;
  }
  [(NSMutableArray *)kCellularWcdmaRabModeHists addObject:v4];
}

- (unint64_t)kCellularWcdmaRabModeHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaRabModeHists count];
}

- (id)kCellularWcdmaRabModeHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaRabModeHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaRabModeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRabTypeHists
{
}

- (void)addKCellularWcdmaRabTypeHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaRabTypeHists = self->_kCellularWcdmaRabTypeHists;
  id v8 = v4;
  if (!kCellularWcdmaRabTypeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaRabTypeHists;
    self->_kCellularWcdmaRabTypeHists = v6;

    id v4 = v8;
    kCellularWcdmaRabTypeHists = self->_kCellularWcdmaRabTypeHists;
  }
  [(NSMutableArray *)kCellularWcdmaRabTypeHists addObject:v4];
}

- (unint64_t)kCellularWcdmaRabTypeHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaRabTypeHists count];
}

- (id)kCellularWcdmaRabTypeHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaRabTypeHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaRabTypeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRrcConnectionStates
{
}

- (void)addKCellularWcdmaRrcConnectionState:(id)a3
{
  id v4 = a3;
  kCellularWcdmaRrcConnectionStates = self->_kCellularWcdmaRrcConnectionStates;
  id v8 = v4;
  if (!kCellularWcdmaRrcConnectionStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaRrcConnectionStates;
    self->_kCellularWcdmaRrcConnectionStates = v6;

    id v4 = v8;
    kCellularWcdmaRrcConnectionStates = self->_kCellularWcdmaRrcConnectionStates;
  }
  [(NSMutableArray *)kCellularWcdmaRrcConnectionStates addObject:v4];
}

- (unint64_t)kCellularWcdmaRrcConnectionStatesCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaRrcConnectionStates count];
}

- (id)kCellularWcdmaRrcConnectionStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaRrcConnectionStates objectAtIndex:a3];
}

+ (Class)kCellularWcdmaRrcConnectionStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRrcConfigurations
{
}

- (void)addKCellularWcdmaRrcConfiguration:(id)a3
{
  id v4 = a3;
  kCellularWcdmaRrcConfigurations = self->_kCellularWcdmaRrcConfigurations;
  id v8 = v4;
  if (!kCellularWcdmaRrcConfigurations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaRrcConfigurations;
    self->_kCellularWcdmaRrcConfigurations = v6;

    id v4 = v8;
    kCellularWcdmaRrcConfigurations = self->_kCellularWcdmaRrcConfigurations;
  }
  [(NSMutableArray *)kCellularWcdmaRrcConfigurations addObject:v4];
}

- (unint64_t)kCellularWcdmaRrcConfigurationsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaRrcConfigurations count];
}

- (id)kCellularWcdmaRrcConfigurationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaRrcConfigurations objectAtIndex:a3];
}

+ (Class)kCellularWcdmaRrcConfigurationType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaRabStatus
{
}

- (void)addKCellularWcdmaRabStatus:(id)a3
{
  id v4 = a3;
  kCellularWcdmaRabStatus = self->_kCellularWcdmaRabStatus;
  id v8 = v4;
  if (!kCellularWcdmaRabStatus)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaRabStatus;
    self->_kCellularWcdmaRabStatus = v6;

    id v4 = v8;
    kCellularWcdmaRabStatus = self->_kCellularWcdmaRabStatus;
  }
  [(NSMutableArray *)kCellularWcdmaRabStatus addObject:v4];
}

- (unint64_t)kCellularWcdmaRabStatusCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaRabStatus count];
}

- (id)kCellularWcdmaRabStatusAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaRabStatus objectAtIndex:a3];
}

+ (Class)kCellularWcdmaRabStatusType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaL1States
{
}

- (void)addKCellularWcdmaL1State:(id)a3
{
  id v4 = a3;
  kCellularWcdmaL1States = self->_kCellularWcdmaL1States;
  id v8 = v4;
  if (!kCellularWcdmaL1States)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaL1States;
    self->_kCellularWcdmaL1States = v6;

    id v4 = v8;
    kCellularWcdmaL1States = self->_kCellularWcdmaL1States;
  }
  [(NSMutableArray *)kCellularWcdmaL1States addObject:v4];
}

- (unint64_t)kCellularWcdmaL1StatesCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaL1States count];
}

- (id)kCellularWcdmaL1StateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaL1States objectAtIndex:a3];
}

+ (Class)kCellularWcdmaL1StateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaDataInactivityBeforeIdles
{
}

- (void)addKCellularWcdmaDataInactivityBeforeIdle:(id)a3
{
  id v4 = a3;
  kCellularWcdmaDataInactivityBeforeIdles = self->_kCellularWcdmaDataInactivityBeforeIdles;
  id v8 = v4;
  if (!kCellularWcdmaDataInactivityBeforeIdles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaDataInactivityBeforeIdles;
    self->_kCellularWcdmaDataInactivityBeforeIdles = v6;

    id v4 = v8;
    kCellularWcdmaDataInactivityBeforeIdles = self->_kCellularWcdmaDataInactivityBeforeIdles;
  }
  [(NSMutableArray *)kCellularWcdmaDataInactivityBeforeIdles addObject:v4];
}

- (unint64_t)kCellularWcdmaDataInactivityBeforeIdlesCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaDataInactivityBeforeIdles count];
}

- (id)kCellularWcdmaDataInactivityBeforeIdleAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaDataInactivityBeforeIdles objectAtIndex:a3];
}

+ (Class)kCellularWcdmaDataInactivityBeforeIdleType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaIdleToConnectedUserDatas
{
}

- (void)addKCellularWcdmaIdleToConnectedUserData:(id)a3
{
  id v4 = a3;
  kCellularWcdmaIdleToConnectedUserDatas = self->_kCellularWcdmaIdleToConnectedUserDatas;
  id v8 = v4;
  if (!kCellularWcdmaIdleToConnectedUserDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaIdleToConnectedUserDatas;
    self->_kCellularWcdmaIdleToConnectedUserDatas = v6;

    id v4 = v8;
    kCellularWcdmaIdleToConnectedUserDatas = self->_kCellularWcdmaIdleToConnectedUserDatas;
  }
  [(NSMutableArray *)kCellularWcdmaIdleToConnectedUserDatas addObject:v4];
}

- (unint64_t)kCellularWcdmaIdleToConnectedUserDatasCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaIdleToConnectedUserDatas count];
}

- (id)kCellularWcdmaIdleToConnectedUserDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaIdleToConnectedUserDatas objectAtIndex:a3];
}

+ (Class)kCellularWcdmaIdleToConnectedUserDataType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularWcdmaVadHists
{
}

- (void)addKCellularWcdmaVadHist:(id)a3
{
  id v4 = a3;
  kCellularWcdmaVadHists = self->_kCellularWcdmaVadHists;
  id v8 = v4;
  if (!kCellularWcdmaVadHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularWcdmaVadHists;
    self->_kCellularWcdmaVadHists = v6;

    id v4 = v8;
    kCellularWcdmaVadHists = self->_kCellularWcdmaVadHists;
  }
  [(NSMutableArray *)kCellularWcdmaVadHists addObject:v4];
}

- (unint64_t)kCellularWcdmaVadHistsCount
{
  return [(NSMutableArray *)self->_kCellularWcdmaVadHists count];
}

- (id)kCellularWcdmaVadHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularWcdmaVadHists objectAtIndex:a3];
}

+ (Class)kCellularWcdmaVadHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsRxDiversityHists
{
}

- (void)addKCellularTdsRxDiversityHist:(id)a3
{
  id v4 = a3;
  kCellularTdsRxDiversityHists = self->_kCellularTdsRxDiversityHists;
  id v8 = v4;
  if (!kCellularTdsRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsRxDiversityHists;
    self->_kCellularTdsRxDiversityHists = v6;

    id v4 = v8;
    kCellularTdsRxDiversityHists = self->_kCellularTdsRxDiversityHists;
  }
  [(NSMutableArray *)kCellularTdsRxDiversityHists addObject:v4];
}

- (unint64_t)kCellularTdsRxDiversityHistsCount
{
  return [(NSMutableArray *)self->_kCellularTdsRxDiversityHists count];
}

- (id)kCellularTdsRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsRxDiversityHists objectAtIndex:a3];
}

+ (Class)kCellularTdsRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsServingCellRx0RssiHists
{
}

- (void)addKCellularTdsServingCellRx0RssiHist:(id)a3
{
  id v4 = a3;
  kCellularTdsServingCellRx0RssiHists = self->_kCellularTdsServingCellRx0RssiHists;
  id v8 = v4;
  if (!kCellularTdsServingCellRx0RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsServingCellRx0RssiHists;
    self->_kCellularTdsServingCellRx0RssiHists = v6;

    id v4 = v8;
    kCellularTdsServingCellRx0RssiHists = self->_kCellularTdsServingCellRx0RssiHists;
  }
  [(NSMutableArray *)kCellularTdsServingCellRx0RssiHists addObject:v4];
}

- (unint64_t)kCellularTdsServingCellRx0RssiHistsCount
{
  return [(NSMutableArray *)self->_kCellularTdsServingCellRx0RssiHists count];
}

- (id)kCellularTdsServingCellRx0RssiHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsServingCellRx0RssiHists objectAtIndex:a3];
}

+ (Class)kCellularTdsServingCellRx0RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsServingCellRx1RssiHists
{
}

- (void)addKCellularTdsServingCellRx1RssiHist:(id)a3
{
  id v4 = a3;
  kCellularTdsServingCellRx1RssiHists = self->_kCellularTdsServingCellRx1RssiHists;
  id v8 = v4;
  if (!kCellularTdsServingCellRx1RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsServingCellRx1RssiHists;
    self->_kCellularTdsServingCellRx1RssiHists = v6;

    id v4 = v8;
    kCellularTdsServingCellRx1RssiHists = self->_kCellularTdsServingCellRx1RssiHists;
  }
  [(NSMutableArray *)kCellularTdsServingCellRx1RssiHists addObject:v4];
}

- (unint64_t)kCellularTdsServingCellRx1RssiHistsCount
{
  return [(NSMutableArray *)self->_kCellularTdsServingCellRx1RssiHists count];
}

- (id)kCellularTdsServingCellRx1RssiHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsServingCellRx1RssiHists objectAtIndex:a3];
}

+ (Class)kCellularTdsServingCellRx1RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsServingCellRx0RscpHists
{
}

- (void)addKCellularTdsServingCellRx0RscpHist:(id)a3
{
  id v4 = a3;
  kCellularTdsServingCellRx0RscpHists = self->_kCellularTdsServingCellRx0RscpHists;
  id v8 = v4;
  if (!kCellularTdsServingCellRx0RscpHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsServingCellRx0RscpHists;
    self->_kCellularTdsServingCellRx0RscpHists = v6;

    id v4 = v8;
    kCellularTdsServingCellRx0RscpHists = self->_kCellularTdsServingCellRx0RscpHists;
  }
  [(NSMutableArray *)kCellularTdsServingCellRx0RscpHists addObject:v4];
}

- (unint64_t)kCellularTdsServingCellRx0RscpHistsCount
{
  return [(NSMutableArray *)self->_kCellularTdsServingCellRx0RscpHists count];
}

- (id)kCellularTdsServingCellRx0RscpHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsServingCellRx0RscpHists objectAtIndex:a3];
}

+ (Class)kCellularTdsServingCellRx0RscpHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsServingCellRx1RscpHists
{
}

- (void)addKCellularTdsServingCellRx1RscpHist:(id)a3
{
  id v4 = a3;
  kCellularTdsServingCellRx1RscpHists = self->_kCellularTdsServingCellRx1RscpHists;
  id v8 = v4;
  if (!kCellularTdsServingCellRx1RscpHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsServingCellRx1RscpHists;
    self->_kCellularTdsServingCellRx1RscpHists = v6;

    id v4 = v8;
    kCellularTdsServingCellRx1RscpHists = self->_kCellularTdsServingCellRx1RscpHists;
  }
  [(NSMutableArray *)kCellularTdsServingCellRx1RscpHists addObject:v4];
}

- (unint64_t)kCellularTdsServingCellRx1RscpHistsCount
{
  return [(NSMutableArray *)self->_kCellularTdsServingCellRx1RscpHists count];
}

- (id)kCellularTdsServingCellRx1RscpHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsServingCellRx1RscpHists objectAtIndex:a3];
}

+ (Class)kCellularTdsServingCellRx1RscpHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsTxPowerHists
{
}

- (void)addKCellularTdsTxPowerHist:(id)a3
{
  id v4 = a3;
  kCellularTdsTxPowerHists = self->_kCellularTdsTxPowerHists;
  id v8 = v4;
  if (!kCellularTdsTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsTxPowerHists;
    self->_kCellularTdsTxPowerHists = v6;

    id v4 = v8;
    kCellularTdsTxPowerHists = self->_kCellularTdsTxPowerHists;
  }
  [(NSMutableArray *)kCellularTdsTxPowerHists addObject:v4];
}

- (unint64_t)kCellularTdsTxPowerHistsCount
{
  return [(NSMutableArray *)self->_kCellularTdsTxPowerHists count];
}

- (id)kCellularTdsTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsTxPowerHists objectAtIndex:a3];
}

+ (Class)kCellularTdsTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsRabModeHists
{
}

- (void)addKCellularTdsRabModeHist:(id)a3
{
  id v4 = a3;
  kCellularTdsRabModeHists = self->_kCellularTdsRabModeHists;
  id v8 = v4;
  if (!kCellularTdsRabModeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsRabModeHists;
    self->_kCellularTdsRabModeHists = v6;

    id v4 = v8;
    kCellularTdsRabModeHists = self->_kCellularTdsRabModeHists;
  }
  [(NSMutableArray *)kCellularTdsRabModeHists addObject:v4];
}

- (unint64_t)kCellularTdsRabModeHistsCount
{
  return [(NSMutableArray *)self->_kCellularTdsRabModeHists count];
}

- (id)kCellularTdsRabModeHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsRabModeHists objectAtIndex:a3];
}

+ (Class)kCellularTdsRabModeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsRabTypeHists
{
}

- (void)addKCellularTdsRabTypeHist:(id)a3
{
  id v4 = a3;
  kCellularTdsRabTypeHists = self->_kCellularTdsRabTypeHists;
  id v8 = v4;
  if (!kCellularTdsRabTypeHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsRabTypeHists;
    self->_kCellularTdsRabTypeHists = v6;

    id v4 = v8;
    kCellularTdsRabTypeHists = self->_kCellularTdsRabTypeHists;
  }
  [(NSMutableArray *)kCellularTdsRabTypeHists addObject:v4];
}

- (unint64_t)kCellularTdsRabTypeHistsCount
{
  return [(NSMutableArray *)self->_kCellularTdsRabTypeHists count];
}

- (id)kCellularTdsRabTypeHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsRabTypeHists objectAtIndex:a3];
}

+ (Class)kCellularTdsRabTypeHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsRrcStates
{
}

- (void)addKCellularTdsRrcState:(id)a3
{
  id v4 = a3;
  kCellularTdsRrcStates = self->_kCellularTdsRrcStates;
  id v8 = v4;
  if (!kCellularTdsRrcStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsRrcStates;
    self->_kCellularTdsRrcStates = v6;

    id v4 = v8;
    kCellularTdsRrcStates = self->_kCellularTdsRrcStates;
  }
  [(NSMutableArray *)kCellularTdsRrcStates addObject:v4];
}

- (unint64_t)kCellularTdsRrcStatesCount
{
  return [(NSMutableArray *)self->_kCellularTdsRrcStates count];
}

- (id)kCellularTdsRrcStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsRrcStates objectAtIndex:a3];
}

+ (Class)kCellularTdsRrcStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularTdsL1States
{
}

- (void)addKCellularTdsL1State:(id)a3
{
  id v4 = a3;
  kCellularTdsL1States = self->_kCellularTdsL1States;
  id v8 = v4;
  if (!kCellularTdsL1States)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularTdsL1States;
    self->_kCellularTdsL1States = v6;

    id v4 = v8;
    kCellularTdsL1States = self->_kCellularTdsL1States;
  }
  [(NSMutableArray *)kCellularTdsL1States addObject:v4];
}

- (unint64_t)kCellularTdsL1StatesCount
{
  return [(NSMutableArray *)self->_kCellularTdsL1States count];
}

- (id)kCellularTdsL1StateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularTdsL1States objectAtIndex:a3];
}

+ (Class)kCellularTdsL1StateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteFwDuplexModes
{
}

- (void)addKCellularLteFwDuplexMode:(id)a3
{
  id v4 = a3;
  kCellularLteFwDuplexModes = self->_kCellularLteFwDuplexModes;
  id v8 = v4;
  if (!kCellularLteFwDuplexModes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteFwDuplexModes;
    self->_kCellularLteFwDuplexModes = v6;

    id v4 = v8;
    kCellularLteFwDuplexModes = self->_kCellularLteFwDuplexModes;
  }
  [(NSMutableArray *)kCellularLteFwDuplexModes addObject:v4];
}

- (unint64_t)kCellularLteFwDuplexModesCount
{
  return [(NSMutableArray *)self->_kCellularLteFwDuplexModes count];
}

- (id)kCellularLteFwDuplexModeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteFwDuplexModes objectAtIndex:a3];
}

+ (Class)kCellularLteFwDuplexModeType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteServingCellRsrpHists
{
}

- (void)addKCellularLteServingCellRsrpHist:(id)a3
{
  id v4 = a3;
  kCellularLteServingCellRsrpHists = self->_kCellularLteServingCellRsrpHists;
  id v8 = v4;
  if (!kCellularLteServingCellRsrpHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteServingCellRsrpHists;
    self->_kCellularLteServingCellRsrpHists = v6;

    id v4 = v8;
    kCellularLteServingCellRsrpHists = self->_kCellularLteServingCellRsrpHists;
  }
  [(NSMutableArray *)kCellularLteServingCellRsrpHists addObject:v4];
}

- (unint64_t)kCellularLteServingCellRsrpHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteServingCellRsrpHists count];
}

- (id)kCellularLteServingCellRsrpHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteServingCellRsrpHists objectAtIndex:a3];
}

+ (Class)kCellularLteServingCellRsrpHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteServingCellSinrHists
{
}

- (void)addKCellularLteServingCellSinrHist:(id)a3
{
  id v4 = a3;
  kCellularLteServingCellSinrHists = self->_kCellularLteServingCellSinrHists;
  id v8 = v4;
  if (!kCellularLteServingCellSinrHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteServingCellSinrHists;
    self->_kCellularLteServingCellSinrHists = v6;

    id v4 = v8;
    kCellularLteServingCellSinrHists = self->_kCellularLteServingCellSinrHists;
  }
  [(NSMutableArray *)kCellularLteServingCellSinrHists addObject:v4];
}

- (unint64_t)kCellularLteServingCellSinrHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteServingCellSinrHists count];
}

- (id)kCellularLteServingCellSinrHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteServingCellSinrHists objectAtIndex:a3];
}

+ (Class)kCellularLteServingCellSinrHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteSleepStateHists
{
}

- (void)addKCellularLteSleepStateHist:(id)a3
{
  id v4 = a3;
  kCellularLteSleepStateHists = self->_kCellularLteSleepStateHists;
  id v8 = v4;
  if (!kCellularLteSleepStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteSleepStateHists;
    self->_kCellularLteSleepStateHists = v6;

    id v4 = v8;
    kCellularLteSleepStateHists = self->_kCellularLteSleepStateHists;
  }
  [(NSMutableArray *)kCellularLteSleepStateHists addObject:v4];
}

- (unint64_t)kCellularLteSleepStateHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteSleepStateHists count];
}

- (id)kCellularLteSleepStateHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteSleepStateHists objectAtIndex:a3];
}

+ (Class)kCellularLteSleepStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteTxPowerHists
{
}

- (void)addKCellularLteTxPowerHist:(id)a3
{
  id v4 = a3;
  kCellularLteTxPowerHists = self->_kCellularLteTxPowerHists;
  id v8 = v4;
  if (!kCellularLteTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteTxPowerHists;
    self->_kCellularLteTxPowerHists = v6;

    id v4 = v8;
    kCellularLteTxPowerHists = self->_kCellularLteTxPowerHists;
  }
  [(NSMutableArray *)kCellularLteTxPowerHists addObject:v4];
}

- (unint64_t)kCellularLteTxPowerHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteTxPowerHists count];
}

- (id)kCellularLteTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteTxPowerHists objectAtIndex:a3];
}

+ (Class)kCellularLteTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteDlSccStateHists
{
}

- (void)addKCellularLteDlSccStateHist:(id)a3
{
  id v4 = a3;
  kCellularLteDlSccStateHists = self->_kCellularLteDlSccStateHists;
  id v8 = v4;
  if (!kCellularLteDlSccStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteDlSccStateHists;
    self->_kCellularLteDlSccStateHists = v6;

    id v4 = v8;
    kCellularLteDlSccStateHists = self->_kCellularLteDlSccStateHists;
  }
  [(NSMutableArray *)kCellularLteDlSccStateHists addObject:v4];
}

- (unint64_t)kCellularLteDlSccStateHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteDlSccStateHists count];
}

- (id)kCellularLteDlSccStateHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteDlSccStateHists objectAtIndex:a3];
}

+ (Class)kCellularLteDlSccStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteUlSccStateHists
{
}

- (void)addKCellularLteUlSccStateHist:(id)a3
{
  id v4 = a3;
  kCellularLteUlSccStateHists = self->_kCellularLteUlSccStateHists;
  id v8 = v4;
  if (!kCellularLteUlSccStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteUlSccStateHists;
    self->_kCellularLteUlSccStateHists = v6;

    id v4 = v8;
    kCellularLteUlSccStateHists = self->_kCellularLteUlSccStateHists;
  }
  [(NSMutableArray *)kCellularLteUlSccStateHists addObject:v4];
}

- (unint64_t)kCellularLteUlSccStateHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteUlSccStateHists count];
}

- (id)kCellularLteUlSccStateHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteUlSccStateHists objectAtIndex:a3];
}

+ (Class)kCellularLteUlSccStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteAdvancedRxStateHists
{
}

- (void)addKCellularLteAdvancedRxStateHist:(id)a3
{
  id v4 = a3;
  kCellularLteAdvancedRxStateHists = self->_kCellularLteAdvancedRxStateHists;
  id v8 = v4;
  if (!kCellularLteAdvancedRxStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteAdvancedRxStateHists;
    self->_kCellularLteAdvancedRxStateHists = v6;

    id v4 = v8;
    kCellularLteAdvancedRxStateHists = self->_kCellularLteAdvancedRxStateHists;
  }
  [(NSMutableArray *)kCellularLteAdvancedRxStateHists addObject:v4];
}

- (unint64_t)kCellularLteAdvancedRxStateHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteAdvancedRxStateHists count];
}

- (id)kCellularLteAdvancedRxStateHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteAdvancedRxStateHists objectAtIndex:a3];
}

+ (Class)kCellularLteAdvancedRxStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteComponentCarrierInfos
{
}

- (void)addKCellularLteComponentCarrierInfo:(id)a3
{
  id v4 = a3;
  kCellularLteComponentCarrierInfos = self->_kCellularLteComponentCarrierInfos;
  id v8 = v4;
  if (!kCellularLteComponentCarrierInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteComponentCarrierInfos;
    self->_kCellularLteComponentCarrierInfos = v6;

    id v4 = v8;
    kCellularLteComponentCarrierInfos = self->_kCellularLteComponentCarrierInfos;
  }
  [(NSMutableArray *)kCellularLteComponentCarrierInfos addObject:v4];
}

- (unint64_t)kCellularLteComponentCarrierInfosCount
{
  return [(NSMutableArray *)self->_kCellularLteComponentCarrierInfos count];
}

- (id)kCellularLteComponentCarrierInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteComponentCarrierInfos objectAtIndex:a3];
}

+ (Class)kCellularLteComponentCarrierInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteRxTxStateHists
{
}

- (void)addKCellularLteRxTxStateHist:(id)a3
{
  id v4 = a3;
  kCellularLteRxTxStateHists = self->_kCellularLteRxTxStateHists;
  id v8 = v4;
  if (!kCellularLteRxTxStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteRxTxStateHists;
    self->_kCellularLteRxTxStateHists = v6;

    id v4 = v8;
    kCellularLteRxTxStateHists = self->_kCellularLteRxTxStateHists;
  }
  [(NSMutableArray *)kCellularLteRxTxStateHists addObject:v4];
}

- (unint64_t)kCellularLteRxTxStateHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteRxTxStateHists count];
}

- (id)kCellularLteRxTxStateHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteRxTxStateHists objectAtIndex:a3];
}

+ (Class)kCellularLteRxTxStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteTotalDlTbsHists
{
}

- (void)addKCellularLteTotalDlTbsHist:(id)a3
{
  id v4 = a3;
  kCellularLteTotalDlTbsHists = self->_kCellularLteTotalDlTbsHists;
  id v8 = v4;
  if (!kCellularLteTotalDlTbsHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteTotalDlTbsHists;
    self->_kCellularLteTotalDlTbsHists = v6;

    id v4 = v8;
    kCellularLteTotalDlTbsHists = self->_kCellularLteTotalDlTbsHists;
  }
  [(NSMutableArray *)kCellularLteTotalDlTbsHists addObject:v4];
}

- (unint64_t)kCellularLteTotalDlTbsHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteTotalDlTbsHists count];
}

- (id)kCellularLteTotalDlTbsHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteTotalDlTbsHists objectAtIndex:a3];
}

+ (Class)kCellularLteTotalDlTbsHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteDataInactivityBeforeIdles
{
}

- (void)addKCellularLteDataInactivityBeforeIdle:(id)a3
{
  id v4 = a3;
  kCellularLteDataInactivityBeforeIdles = self->_kCellularLteDataInactivityBeforeIdles;
  id v8 = v4;
  if (!kCellularLteDataInactivityBeforeIdles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteDataInactivityBeforeIdles;
    self->_kCellularLteDataInactivityBeforeIdles = v6;

    id v4 = v8;
    kCellularLteDataInactivityBeforeIdles = self->_kCellularLteDataInactivityBeforeIdles;
  }
  [(NSMutableArray *)kCellularLteDataInactivityBeforeIdles addObject:v4];
}

- (unint64_t)kCellularLteDataInactivityBeforeIdlesCount
{
  return [(NSMutableArray *)self->_kCellularLteDataInactivityBeforeIdles count];
}

- (id)kCellularLteDataInactivityBeforeIdleAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteDataInactivityBeforeIdles objectAtIndex:a3];
}

+ (Class)kCellularLteDataInactivityBeforeIdleType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteIdleToConnectedUserDatas
{
}

- (void)addKCellularLteIdleToConnectedUserData:(id)a3
{
  id v4 = a3;
  kCellularLteIdleToConnectedUserDatas = self->_kCellularLteIdleToConnectedUserDatas;
  id v8 = v4;
  if (!kCellularLteIdleToConnectedUserDatas)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteIdleToConnectedUserDatas;
    self->_kCellularLteIdleToConnectedUserDatas = v6;

    id v4 = v8;
    kCellularLteIdleToConnectedUserDatas = self->_kCellularLteIdleToConnectedUserDatas;
  }
  [(NSMutableArray *)kCellularLteIdleToConnectedUserDatas addObject:v4];
}

- (unint64_t)kCellularLteIdleToConnectedUserDatasCount
{
  return [(NSMutableArray *)self->_kCellularLteIdleToConnectedUserDatas count];
}

- (id)kCellularLteIdleToConnectedUserDataAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteIdleToConnectedUserDatas objectAtIndex:a3];
}

+ (Class)kCellularLteIdleToConnectedUserDataType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteDlSccStateHistV3s
{
}

- (void)addKCellularLteDlSccStateHistV3:(id)a3
{
  id v4 = a3;
  kCellularLteDlSccStateHistV3s = self->_kCellularLteDlSccStateHistV3s;
  id v8 = v4;
  if (!kCellularLteDlSccStateHistV3s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteDlSccStateHistV3s;
    self->_kCellularLteDlSccStateHistV3s = v6;

    id v4 = v8;
    kCellularLteDlSccStateHistV3s = self->_kCellularLteDlSccStateHistV3s;
  }
  [(NSMutableArray *)kCellularLteDlSccStateHistV3s addObject:v4];
}

- (unint64_t)kCellularLteDlSccStateHistV3sCount
{
  return [(NSMutableArray *)self->_kCellularLteDlSccStateHistV3s count];
}

- (id)kCellularLteDlSccStateHistV3AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteDlSccStateHistV3s objectAtIndex:a3];
}

+ (Class)kCellularLteDlSccStateHistV3Type
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteRxDiversityHists
{
}

- (void)addKCellularLteRxDiversityHist:(id)a3
{
  id v4 = a3;
  kCellularLteRxDiversityHists = self->_kCellularLteRxDiversityHists;
  id v8 = v4;
  if (!kCellularLteRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteRxDiversityHists;
    self->_kCellularLteRxDiversityHists = v6;

    id v4 = v8;
    kCellularLteRxDiversityHists = self->_kCellularLteRxDiversityHists;
  }
  [(NSMutableArray *)kCellularLteRxDiversityHists addObject:v4];
}

- (unint64_t)kCellularLteRxDiversityHistsCount
{
  return [(NSMutableArray *)self->_kCellularLteRxDiversityHists count];
}

- (id)kCellularLteRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteRxDiversityHists objectAtIndex:a3];
}

+ (Class)kCellularLteRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLtePdcchStateHists
{
}

- (void)addKCellularLtePdcchStateHist:(id)a3
{
  id v4 = a3;
  kCellularLtePdcchStateHists = self->_kCellularLtePdcchStateHists;
  id v8 = v4;
  if (!kCellularLtePdcchStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLtePdcchStateHists;
    self->_kCellularLtePdcchStateHists = v6;

    id v4 = v8;
    kCellularLtePdcchStateHists = self->_kCellularLtePdcchStateHists;
  }
  [(NSMutableArray *)kCellularLtePdcchStateHists addObject:v4];
}

- (unint64_t)kCellularLtePdcchStateHistsCount
{
  return [(NSMutableArray *)self->_kCellularLtePdcchStateHists count];
}

- (id)kCellularLtePdcchStateHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLtePdcchStateHists objectAtIndex:a3];
}

+ (Class)kCellularLtePdcchStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteRrcStates
{
}

- (void)addKCellularLteRrcState:(id)a3
{
  id v4 = a3;
  kCellularLteRrcStates = self->_kCellularLteRrcStates;
  id v8 = v4;
  if (!kCellularLteRrcStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteRrcStates;
    self->_kCellularLteRrcStates = v6;

    id v4 = v8;
    kCellularLteRrcStates = self->_kCellularLteRrcStates;
  }
  [(NSMutableArray *)kCellularLteRrcStates addObject:v4];
}

- (unint64_t)kCellularLteRrcStatesCount
{
  return [(NSMutableArray *)self->_kCellularLteRrcStates count];
}

- (id)kCellularLteRrcStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteRrcStates objectAtIndex:a3];
}

+ (Class)kCellularLteRrcStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLtePagingCycles
{
}

- (void)addKCellularLtePagingCycle:(id)a3
{
  id v4 = a3;
  kCellularLtePagingCycles = self->_kCellularLtePagingCycles;
  id v8 = v4;
  if (!kCellularLtePagingCycles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLtePagingCycles;
    self->_kCellularLtePagingCycles = v6;

    id v4 = v8;
    kCellularLtePagingCycles = self->_kCellularLtePagingCycles;
  }
  [(NSMutableArray *)kCellularLtePagingCycles addObject:v4];
}

- (unint64_t)kCellularLtePagingCyclesCount
{
  return [(NSMutableArray *)self->_kCellularLtePagingCycles count];
}

- (id)kCellularLtePagingCycleAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLtePagingCycles objectAtIndex:a3];
}

+ (Class)kCellularLtePagingCycleType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteCdrxConfigs
{
}

- (void)addKCellularLteCdrxConfig:(id)a3
{
  id v4 = a3;
  kCellularLteCdrxConfigs = self->_kCellularLteCdrxConfigs;
  id v8 = v4;
  if (!kCellularLteCdrxConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteCdrxConfigs;
    self->_kCellularLteCdrxConfigs = v6;

    id v4 = v8;
    kCellularLteCdrxConfigs = self->_kCellularLteCdrxConfigs;
  }
  [(NSMutableArray *)kCellularLteCdrxConfigs addObject:v4];
}

- (unint64_t)kCellularLteCdrxConfigsCount
{
  return [(NSMutableArray *)self->_kCellularLteCdrxConfigs count];
}

- (id)kCellularLteCdrxConfigAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteCdrxConfigs objectAtIndex:a3];
}

+ (Class)kCellularLteCdrxConfigType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLteRadioLinkFailures
{
}

- (void)addKCellularLteRadioLinkFailure:(id)a3
{
  id v4 = a3;
  kCellularLteRadioLinkFailures = self->_kCellularLteRadioLinkFailures;
  id v8 = v4;
  if (!kCellularLteRadioLinkFailures)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLteRadioLinkFailures;
    self->_kCellularLteRadioLinkFailures = v6;

    id v4 = v8;
    kCellularLteRadioLinkFailures = self->_kCellularLteRadioLinkFailures;
  }
  [(NSMutableArray *)kCellularLteRadioLinkFailures addObject:v4];
}

- (unint64_t)kCellularLteRadioLinkFailuresCount
{
  return [(NSMutableArray *)self->_kCellularLteRadioLinkFailures count];
}

- (id)kCellularLteRadioLinkFailureAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLteRadioLinkFailures objectAtIndex:a3];
}

+ (Class)kCellularLteRadioLinkFailureType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLtePdcchStateStats
{
}

- (void)addKCellularLtePdcchStateStats:(id)a3
{
  id v4 = a3;
  kCellularLtePdcchStateStats = self->_kCellularLtePdcchStateStats;
  id v8 = v4;
  if (!kCellularLtePdcchStateStats)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLtePdcchStateStats;
    self->_kCellularLtePdcchStateStats = v6;

    id v4 = v8;
    kCellularLtePdcchStateStats = self->_kCellularLtePdcchStateStats;
  }
  [(NSMutableArray *)kCellularLtePdcchStateStats addObject:v4];
}

- (unint64_t)kCellularLtePdcchStateStatsCount
{
  return [(NSMutableArray *)self->_kCellularLtePdcchStateStats count];
}

- (id)kCellularLtePdcchStateStatsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLtePdcchStateStats objectAtIndex:a3];
}

+ (Class)kCellularLtePdcchStateStatsType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularLqmStateChanges
{
}

- (void)addKCellularLqmStateChange:(id)a3
{
  id v4 = a3;
  kCellularLqmStateChanges = self->_kCellularLqmStateChanges;
  id v8 = v4;
  if (!kCellularLqmStateChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularLqmStateChanges;
    self->_kCellularLqmStateChanges = v6;

    id v4 = v8;
    kCellularLqmStateChanges = self->_kCellularLqmStateChanges;
  }
  [(NSMutableArray *)kCellularLqmStateChanges addObject:v4];
}

- (unint64_t)kCellularLqmStateChangesCount
{
  return [(NSMutableArray *)self->_kCellularLqmStateChanges count];
}

- (id)kCellularLqmStateChangeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularLqmStateChanges objectAtIndex:a3];
}

+ (Class)kCellularLqmStateChangeType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularServiceLosts
{
}

- (void)addKCellularServiceLost:(id)a3
{
  id v4 = a3;
  kCellularServiceLosts = self->_kCellularServiceLosts;
  id v8 = v4;
  if (!kCellularServiceLosts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularServiceLosts;
    self->_kCellularServiceLosts = v6;

    id v4 = v8;
    kCellularServiceLosts = self->_kCellularServiceLosts;
  }
  [(NSMutableArray *)kCellularServiceLosts addObject:v4];
}

- (unint64_t)kCellularServiceLostsCount
{
  return [(NSMutableArray *)self->_kCellularServiceLosts count];
}

- (id)kCellularServiceLostAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularServiceLosts objectAtIndex:a3];
}

+ (Class)kCellularServiceLostType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackStateHists
{
}

- (void)addKCellularProtocolStackStateHist:(id)a3
{
  id v4 = a3;
  kCellularProtocolStackStateHists = self->_kCellularProtocolStackStateHists;
  id v8 = v4;
  if (!kCellularProtocolStackStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularProtocolStackStateHists;
    self->_kCellularProtocolStackStateHists = v6;

    id v4 = v8;
    kCellularProtocolStackStateHists = self->_kCellularProtocolStackStateHists;
  }
  [(NSMutableArray *)kCellularProtocolStackStateHists addObject:v4];
}

- (unint64_t)kCellularProtocolStackStateHistsCount
{
  return [(NSMutableArray *)self->_kCellularProtocolStackStateHists count];
}

- (id)kCellularProtocolStackStateHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularProtocolStackStateHists objectAtIndex:a3];
}

+ (Class)kCellularProtocolStackStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCellPlmnSearchCounts
{
}

- (void)addKCellularCellPlmnSearchCount:(id)a3
{
  id v4 = a3;
  kCellularCellPlmnSearchCounts = self->_kCellularCellPlmnSearchCounts;
  id v8 = v4;
  if (!kCellularCellPlmnSearchCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCellPlmnSearchCounts;
    self->_kCellularCellPlmnSearchCounts = v6;

    id v4 = v8;
    kCellularCellPlmnSearchCounts = self->_kCellularCellPlmnSearchCounts;
  }
  [(NSMutableArray *)kCellularCellPlmnSearchCounts addObject:v4];
}

- (unint64_t)kCellularCellPlmnSearchCountsCount
{
  return [(NSMutableArray *)self->_kCellularCellPlmnSearchCounts count];
}

- (id)kCellularCellPlmnSearchCountAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCellPlmnSearchCounts objectAtIndex:a3];
}

+ (Class)kCellularCellPlmnSearchCountType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCellPlmnSearchHists
{
}

- (void)addKCellularCellPlmnSearchHist:(id)a3
{
  id v4 = a3;
  kCellularCellPlmnSearchHists = self->_kCellularCellPlmnSearchHists;
  id v8 = v4;
  if (!kCellularCellPlmnSearchHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCellPlmnSearchHists;
    self->_kCellularCellPlmnSearchHists = v6;

    id v4 = v8;
    kCellularCellPlmnSearchHists = self->_kCellularCellPlmnSearchHists;
  }
  [(NSMutableArray *)kCellularCellPlmnSearchHists addObject:v4];
}

- (unint64_t)kCellularCellPlmnSearchHistsCount
{
  return [(NSMutableArray *)self->_kCellularCellPlmnSearchHists count];
}

- (id)kCellularCellPlmnSearchHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCellPlmnSearchHists objectAtIndex:a3];
}

+ (Class)kCellularCellPlmnSearchHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackPowerStates
{
}

- (void)addKCellularProtocolStackPowerState:(id)a3
{
  id v4 = a3;
  kCellularProtocolStackPowerStates = self->_kCellularProtocolStackPowerStates;
  id v8 = v4;
  if (!kCellularProtocolStackPowerStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularProtocolStackPowerStates;
    self->_kCellularProtocolStackPowerStates = v6;

    id v4 = v8;
    kCellularProtocolStackPowerStates = self->_kCellularProtocolStackPowerStates;
  }
  [(NSMutableArray *)kCellularProtocolStackPowerStates addObject:v4];
}

- (unint64_t)kCellularProtocolStackPowerStatesCount
{
  return [(NSMutableArray *)self->_kCellularProtocolStackPowerStates count];
}

- (id)kCellularProtocolStackPowerStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularProtocolStackPowerStates objectAtIndex:a3];
}

+ (Class)kCellularProtocolStackPowerStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularDownlinkIpPacketFilterStatus
{
}

- (void)addKCellularDownlinkIpPacketFilterStatus:(id)a3
{
  id v4 = a3;
  kCellularDownlinkIpPacketFilterStatus = self->_kCellularDownlinkIpPacketFilterStatus;
  id v8 = v4;
  if (!kCellularDownlinkIpPacketFilterStatus)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularDownlinkIpPacketFilterStatus;
    self->_kCellularDownlinkIpPacketFilterStatus = v6;

    id v4 = v8;
    kCellularDownlinkIpPacketFilterStatus = self->_kCellularDownlinkIpPacketFilterStatus;
  }
  [(NSMutableArray *)kCellularDownlinkIpPacketFilterStatus addObject:v4];
}

- (unint64_t)kCellularDownlinkIpPacketFilterStatusCount
{
  return [(NSMutableArray *)self->_kCellularDownlinkIpPacketFilterStatus count];
}

- (id)kCellularDownlinkIpPacketFilterStatusAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularDownlinkIpPacketFilterStatus objectAtIndex:a3];
}

+ (Class)kCellularDownlinkIpPacketFilterStatusType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularDownlinkIpPacketDiscardeds
{
}

- (void)addKCellularDownlinkIpPacketDiscarded:(id)a3
{
  id v4 = a3;
  kCellularDownlinkIpPacketDiscardeds = self->_kCellularDownlinkIpPacketDiscardeds;
  id v8 = v4;
  if (!kCellularDownlinkIpPacketDiscardeds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularDownlinkIpPacketDiscardeds;
    self->_kCellularDownlinkIpPacketDiscardeds = v6;

    id v4 = v8;
    kCellularDownlinkIpPacketDiscardeds = self->_kCellularDownlinkIpPacketDiscardeds;
  }
  [(NSMutableArray *)kCellularDownlinkIpPacketDiscardeds addObject:v4];
}

- (unint64_t)kCellularDownlinkIpPacketDiscardedsCount
{
  return [(NSMutableArray *)self->_kCellularDownlinkIpPacketDiscardeds count];
}

- (id)kCellularDownlinkIpPacketDiscardedAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularDownlinkIpPacketDiscardeds objectAtIndex:a3];
}

+ (Class)kCellularDownlinkIpPacketDiscardedType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularServingCellRfBandHists
{
}

- (void)addKCellularServingCellRfBandHist:(id)a3
{
  id v4 = a3;
  kCellularServingCellRfBandHists = self->_kCellularServingCellRfBandHists;
  id v8 = v4;
  if (!kCellularServingCellRfBandHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularServingCellRfBandHists;
    self->_kCellularServingCellRfBandHists = v6;

    id v4 = v8;
    kCellularServingCellRfBandHists = self->_kCellularServingCellRfBandHists;
  }
  [(NSMutableArray *)kCellularServingCellRfBandHists addObject:v4];
}

- (unint64_t)kCellularServingCellRfBandHistsCount
{
  return [(NSMutableArray *)self->_kCellularServingCellRfBandHists count];
}

- (id)kCellularServingCellRfBandHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularServingCellRfBandHists objectAtIndex:a3];
}

+ (Class)kCellularServingCellRfBandHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackStateHist2s
{
}

- (void)addKCellularProtocolStackStateHist2:(id)a3
{
  id v4 = a3;
  kCellularProtocolStackStateHist2s = self->_kCellularProtocolStackStateHist2s;
  id v8 = v4;
  if (!kCellularProtocolStackStateHist2s)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularProtocolStackStateHist2s;
    self->_kCellularProtocolStackStateHist2s = v6;

    id v4 = v8;
    kCellularProtocolStackStateHist2s = self->_kCellularProtocolStackStateHist2s;
  }
  [(NSMutableArray *)kCellularProtocolStackStateHist2s addObject:v4];
}

- (unint64_t)kCellularProtocolStackStateHist2sCount
{
  return [(NSMutableArray *)self->_kCellularProtocolStackStateHist2s count];
}

- (id)kCellularProtocolStackStateHist2AtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularProtocolStackStateHist2s objectAtIndex:a3];
}

+ (Class)kCellularProtocolStackStateHist2Type
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularProtocolStackStates
{
}

- (void)addKCellularProtocolStackState:(id)a3
{
  id v4 = a3;
  kCellularProtocolStackStates = self->_kCellularProtocolStackStates;
  id v8 = v4;
  if (!kCellularProtocolStackStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularProtocolStackStates;
    self->_kCellularProtocolStackStates = v6;

    id v4 = v8;
    kCellularProtocolStackStates = self->_kCellularProtocolStackStates;
  }
  [(NSMutableArray *)kCellularProtocolStackStates addObject:v4];
}

- (unint64_t)kCellularProtocolStackStatesCount
{
  return [(NSMutableArray *)self->_kCellularProtocolStackStates count];
}

- (id)kCellularProtocolStackStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularProtocolStackStates objectAtIndex:a3];
}

+ (Class)kCellularProtocolStackStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XRxDiversityHists
{
}

- (void)addKCellularCdma1XRxDiversityHist:(id)a3
{
  id v4 = a3;
  kCellularCdma1XRxDiversityHists = self->_kCellularCdma1XRxDiversityHists;
  id v8 = v4;
  if (!kCellularCdma1XRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdma1XRxDiversityHists;
    self->_kCellularCdma1XRxDiversityHists = v6;

    id v4 = v8;
    kCellularCdma1XRxDiversityHists = self->_kCellularCdma1XRxDiversityHists;
  }
  [(NSMutableArray *)kCellularCdma1XRxDiversityHists addObject:v4];
}

- (unint64_t)kCellularCdma1XRxDiversityHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdma1XRxDiversityHists count];
}

- (id)kCellularCdma1XRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdma1XRxDiversityHists objectAtIndex:a3];
}

+ (Class)kCellularCdma1XRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XServingCellRx0RssiHists
{
}

- (void)addKCellularCdma1XServingCellRx0RssiHist:(id)a3
{
  id v4 = a3;
  kCellularCdma1XServingCellRx0RssiHists = self->_kCellularCdma1XServingCellRx0RssiHists;
  id v8 = v4;
  if (!kCellularCdma1XServingCellRx0RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdma1XServingCellRx0RssiHists;
    self->_kCellularCdma1XServingCellRx0RssiHists = v6;

    id v4 = v8;
    kCellularCdma1XServingCellRx0RssiHists = self->_kCellularCdma1XServingCellRx0RssiHists;
  }
  [(NSMutableArray *)kCellularCdma1XServingCellRx0RssiHists addObject:v4];
}

- (unint64_t)kCellularCdma1XServingCellRx0RssiHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdma1XServingCellRx0RssiHists count];
}

- (id)kCellularCdma1XServingCellRx0RssiHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdma1XServingCellRx0RssiHists objectAtIndex:a3];
}

+ (Class)kCellularCdma1XServingCellRx0RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XServingCellRx1RssiHists
{
}

- (void)addKCellularCdma1XServingCellRx1RssiHist:(id)a3
{
  id v4 = a3;
  kCellularCdma1XServingCellRx1RssiHists = self->_kCellularCdma1XServingCellRx1RssiHists;
  id v8 = v4;
  if (!kCellularCdma1XServingCellRx1RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdma1XServingCellRx1RssiHists;
    self->_kCellularCdma1XServingCellRx1RssiHists = v6;

    id v4 = v8;
    kCellularCdma1XServingCellRx1RssiHists = self->_kCellularCdma1XServingCellRx1RssiHists;
  }
  [(NSMutableArray *)kCellularCdma1XServingCellRx1RssiHists addObject:v4];
}

- (unint64_t)kCellularCdma1XServingCellRx1RssiHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdma1XServingCellRx1RssiHists count];
}

- (id)kCellularCdma1XServingCellRx1RssiHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdma1XServingCellRx1RssiHists objectAtIndex:a3];
}

+ (Class)kCellularCdma1XServingCellRx1RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XServingCellRx0EcIoHists
{
}

- (void)addKCellularCdma1XServingCellRx0EcIoHist:(id)a3
{
  id v4 = a3;
  kCellularCdma1XServingCellRx0EcIoHists = self->_kCellularCdma1XServingCellRx0EcIoHists;
  id v8 = v4;
  if (!kCellularCdma1XServingCellRx0EcIoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdma1XServingCellRx0EcIoHists;
    self->_kCellularCdma1XServingCellRx0EcIoHists = v6;

    id v4 = v8;
    kCellularCdma1XServingCellRx0EcIoHists = self->_kCellularCdma1XServingCellRx0EcIoHists;
  }
  [(NSMutableArray *)kCellularCdma1XServingCellRx0EcIoHists addObject:v4];
}

- (unint64_t)kCellularCdma1XServingCellRx0EcIoHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdma1XServingCellRx0EcIoHists count];
}

- (id)kCellularCdma1XServingCellRx0EcIoHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdma1XServingCellRx0EcIoHists objectAtIndex:a3];
}

+ (Class)kCellularCdma1XServingCellRx0EcIoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XServingCellRx1EcIoHists
{
}

- (void)addKCellularCdma1XServingCellRx1EcIoHist:(id)a3
{
  id v4 = a3;
  kCellularCdma1XServingCellRx1EcIoHists = self->_kCellularCdma1XServingCellRx1EcIoHists;
  id v8 = v4;
  if (!kCellularCdma1XServingCellRx1EcIoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdma1XServingCellRx1EcIoHists;
    self->_kCellularCdma1XServingCellRx1EcIoHists = v6;

    id v4 = v8;
    kCellularCdma1XServingCellRx1EcIoHists = self->_kCellularCdma1XServingCellRx1EcIoHists;
  }
  [(NSMutableArray *)kCellularCdma1XServingCellRx1EcIoHists addObject:v4];
}

- (unint64_t)kCellularCdma1XServingCellRx1EcIoHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdma1XServingCellRx1EcIoHists count];
}

- (id)kCellularCdma1XServingCellRx1EcIoHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdma1XServingCellRx1EcIoHists objectAtIndex:a3];
}

+ (Class)kCellularCdma1XServingCellRx1EcIoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XTxPowerHists
{
}

- (void)addKCellularCdma1XTxPowerHist:(id)a3
{
  id v4 = a3;
  kCellularCdma1XTxPowerHists = self->_kCellularCdma1XTxPowerHists;
  id v8 = v4;
  if (!kCellularCdma1XTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdma1XTxPowerHists;
    self->_kCellularCdma1XTxPowerHists = v6;

    id v4 = v8;
    kCellularCdma1XTxPowerHists = self->_kCellularCdma1XTxPowerHists;
  }
  [(NSMutableArray *)kCellularCdma1XTxPowerHists addObject:v4];
}

- (unint64_t)kCellularCdma1XTxPowerHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdma1XTxPowerHists count];
}

- (id)kCellularCdma1XTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdma1XTxPowerHists objectAtIndex:a3];
}

+ (Class)kCellularCdma1XTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XProtocolStackStateHists
{
}

- (void)addKCellularCdma1XProtocolStackStateHist:(id)a3
{
  id v4 = a3;
  kCellularCdma1XProtocolStackStateHists = self->_kCellularCdma1XProtocolStackStateHists;
  id v8 = v4;
  if (!kCellularCdma1XProtocolStackStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdma1XProtocolStackStateHists;
    self->_kCellularCdma1XProtocolStackStateHists = v6;

    id v4 = v8;
    kCellularCdma1XProtocolStackStateHists = self->_kCellularCdma1XProtocolStackStateHists;
  }
  [(NSMutableArray *)kCellularCdma1XProtocolStackStateHists addObject:v4];
}

- (unint64_t)kCellularCdma1XProtocolStackStateHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdma1XProtocolStackStateHists count];
}

- (id)kCellularCdma1XProtocolStackStateHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdma1XProtocolStackStateHists objectAtIndex:a3];
}

+ (Class)kCellularCdma1XProtocolStackStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XConnectionHists
{
}

- (void)addKCellularCdma1XConnectionHist:(id)a3
{
  id v4 = a3;
  kCellularCdma1XConnectionHists = self->_kCellularCdma1XConnectionHists;
  id v8 = v4;
  if (!kCellularCdma1XConnectionHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdma1XConnectionHists;
    self->_kCellularCdma1XConnectionHists = v6;

    id v4 = v8;
    kCellularCdma1XConnectionHists = self->_kCellularCdma1XConnectionHists;
  }
  [(NSMutableArray *)kCellularCdma1XConnectionHists addObject:v4];
}

- (unint64_t)kCellularCdma1XConnectionHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdma1XConnectionHists count];
}

- (id)kCellularCdma1XConnectionHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdma1XConnectionHists objectAtIndex:a3];
}

+ (Class)kCellularCdma1XConnectionHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdma1XRrStates
{
}

- (void)addKCellularCdma1XRrState:(id)a3
{
  id v4 = a3;
  kCellularCdma1XRrStates = self->_kCellularCdma1XRrStates;
  id v8 = v4;
  if (!kCellularCdma1XRrStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdma1XRrStates;
    self->_kCellularCdma1XRrStates = v6;

    id v4 = v8;
    kCellularCdma1XRrStates = self->_kCellularCdma1XRrStates;
  }
  [(NSMutableArray *)kCellularCdma1XRrStates addObject:v4];
}

- (unint64_t)kCellularCdma1XRrStatesCount
{
  return [(NSMutableArray *)self->_kCellularCdma1XRrStates count];
}

- (id)kCellularCdma1XRrStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdma1XRrStates objectAtIndex:a3];
}

+ (Class)kCellularCdma1XRrStateType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoRxDiversityHists
{
}

- (void)addKCellularCdmaEvdoRxDiversityHist:(id)a3
{
  id v4 = a3;
  kCellularCdmaEvdoRxDiversityHists = self->_kCellularCdmaEvdoRxDiversityHists;
  id v8 = v4;
  if (!kCellularCdmaEvdoRxDiversityHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdmaEvdoRxDiversityHists;
    self->_kCellularCdmaEvdoRxDiversityHists = v6;

    id v4 = v8;
    kCellularCdmaEvdoRxDiversityHists = self->_kCellularCdmaEvdoRxDiversityHists;
  }
  [(NSMutableArray *)kCellularCdmaEvdoRxDiversityHists addObject:v4];
}

- (unint64_t)kCellularCdmaEvdoRxDiversityHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdmaEvdoRxDiversityHists count];
}

- (id)kCellularCdmaEvdoRxDiversityHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdmaEvdoRxDiversityHists objectAtIndex:a3];
}

+ (Class)kCellularCdmaEvdoRxDiversityHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoServingCellRx0RssiHists
{
}

- (void)addKCellularCdmaEvdoServingCellRx0RssiHist:(id)a3
{
  id v4 = a3;
  kCellularCdmaEvdoServingCellRx0RssiHists = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
  id v8 = v4;
  if (!kCellularCdmaEvdoServingCellRx0RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
    self->_kCellularCdmaEvdoServingCellRx0RssiHists = v6;

    id v4 = v8;
    kCellularCdmaEvdoServingCellRx0RssiHists = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
  }
  [(NSMutableArray *)kCellularCdmaEvdoServingCellRx0RssiHists addObject:v4];
}

- (unint64_t)kCellularCdmaEvdoServingCellRx0RssiHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx0RssiHists count];
}

- (id)kCellularCdmaEvdoServingCellRx0RssiHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx0RssiHists objectAtIndex:a3];
}

+ (Class)kCellularCdmaEvdoServingCellRx0RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoServingCellRx1RssiHists
{
}

- (void)addKCellularCdmaEvdoServingCellRx1RssiHist:(id)a3
{
  id v4 = a3;
  kCellularCdmaEvdoServingCellRx1RssiHists = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
  id v8 = v4;
  if (!kCellularCdmaEvdoServingCellRx1RssiHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
    self->_kCellularCdmaEvdoServingCellRx1RssiHists = v6;

    id v4 = v8;
    kCellularCdmaEvdoServingCellRx1RssiHists = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
  }
  [(NSMutableArray *)kCellularCdmaEvdoServingCellRx1RssiHists addObject:v4];
}

- (unint64_t)kCellularCdmaEvdoServingCellRx1RssiHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx1RssiHists count];
}

- (id)kCellularCdmaEvdoServingCellRx1RssiHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx1RssiHists objectAtIndex:a3];
}

+ (Class)kCellularCdmaEvdoServingCellRx1RssiHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoServingCellRx0EcIoHists
{
}

- (void)addKCellularCdmaEvdoServingCellRx0EcIoHist:(id)a3
{
  id v4 = a3;
  kCellularCdmaEvdoServingCellRx0EcIoHists = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
  id v8 = v4;
  if (!kCellularCdmaEvdoServingCellRx0EcIoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
    self->_kCellularCdmaEvdoServingCellRx0EcIoHists = v6;

    id v4 = v8;
    kCellularCdmaEvdoServingCellRx0EcIoHists = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
  }
  [(NSMutableArray *)kCellularCdmaEvdoServingCellRx0EcIoHists addObject:v4];
}

- (unint64_t)kCellularCdmaEvdoServingCellRx0EcIoHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx0EcIoHists count];
}

- (id)kCellularCdmaEvdoServingCellRx0EcIoHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx0EcIoHists objectAtIndex:a3];
}

+ (Class)kCellularCdmaEvdoServingCellRx0EcIoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoServingCellRx1EcIoHists
{
}

- (void)addKCellularCdmaEvdoServingCellRx1EcIoHist:(id)a3
{
  id v4 = a3;
  kCellularCdmaEvdoServingCellRx1EcIoHists = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
  id v8 = v4;
  if (!kCellularCdmaEvdoServingCellRx1EcIoHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
    self->_kCellularCdmaEvdoServingCellRx1EcIoHists = v6;

    id v4 = v8;
    kCellularCdmaEvdoServingCellRx1EcIoHists = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
  }
  [(NSMutableArray *)kCellularCdmaEvdoServingCellRx1EcIoHists addObject:v4];
}

- (unint64_t)kCellularCdmaEvdoServingCellRx1EcIoHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx1EcIoHists count];
}

- (id)kCellularCdmaEvdoServingCellRx1EcIoHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx1EcIoHists objectAtIndex:a3];
}

+ (Class)kCellularCdmaEvdoServingCellRx1EcIoHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoTxPowerHists
{
}

- (void)addKCellularCdmaEvdoTxPowerHist:(id)a3
{
  id v4 = a3;
  kCellularCdmaEvdoTxPowerHists = self->_kCellularCdmaEvdoTxPowerHists;
  id v8 = v4;
  if (!kCellularCdmaEvdoTxPowerHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdmaEvdoTxPowerHists;
    self->_kCellularCdmaEvdoTxPowerHists = v6;

    id v4 = v8;
    kCellularCdmaEvdoTxPowerHists = self->_kCellularCdmaEvdoTxPowerHists;
  }
  [(NSMutableArray *)kCellularCdmaEvdoTxPowerHists addObject:v4];
}

- (unint64_t)kCellularCdmaEvdoTxPowerHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdmaEvdoTxPowerHists count];
}

- (id)kCellularCdmaEvdoTxPowerHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdmaEvdoTxPowerHists objectAtIndex:a3];
}

+ (Class)kCellularCdmaEvdoTxPowerHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoProtocolStackStateHists
{
}

- (void)addKCellularCdmaEvdoProtocolStackStateHist:(id)a3
{
  id v4 = a3;
  kCellularCdmaEvdoProtocolStackStateHists = self->_kCellularCdmaEvdoProtocolStackStateHists;
  id v8 = v4;
  if (!kCellularCdmaEvdoProtocolStackStateHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdmaEvdoProtocolStackStateHists;
    self->_kCellularCdmaEvdoProtocolStackStateHists = v6;

    id v4 = v8;
    kCellularCdmaEvdoProtocolStackStateHists = self->_kCellularCdmaEvdoProtocolStackStateHists;
  }
  [(NSMutableArray *)kCellularCdmaEvdoProtocolStackStateHists addObject:v4];
}

- (unint64_t)kCellularCdmaEvdoProtocolStackStateHistsCount
{
  return [(NSMutableArray *)self->_kCellularCdmaEvdoProtocolStackStateHists count];
}

- (id)kCellularCdmaEvdoProtocolStackStateHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdmaEvdoProtocolStackStateHists objectAtIndex:a3];
}

+ (Class)kCellularCdmaEvdoProtocolStackStateHistType
{
  return (Class)objc_opt_class();
}

- (void)clearKCellularCdmaEvdoRrStates
{
}

- (void)addKCellularCdmaEvdoRrState:(id)a3
{
  id v4 = a3;
  kCellularCdmaEvdoRrStates = self->_kCellularCdmaEvdoRrStates;
  id v8 = v4;
  if (!kCellularCdmaEvdoRrStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_kCellularCdmaEvdoRrStates;
    self->_kCellularCdmaEvdoRrStates = v6;

    id v4 = v8;
    kCellularCdmaEvdoRrStates = self->_kCellularCdmaEvdoRrStates;
  }
  [(NSMutableArray *)kCellularCdmaEvdoRrStates addObject:v4];
}

- (unint64_t)kCellularCdmaEvdoRrStatesCount
{
  return [(NSMutableArray *)self->_kCellularCdmaEvdoRrStates count];
}

- (id)kCellularCdmaEvdoRrStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_kCellularCdmaEvdoRrStates objectAtIndex:a3];
}

+ (Class)kCellularCdmaEvdoRrStateType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PowerlogMetricLog;
  id v4 = [(PowerlogMetricLog *)&v8 description];
  v5 = [(PowerlogMetricLog *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v1122 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSMutableArray *)self->_kCellularPerClientProfileTriggerCounts count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularPerClientProfileTriggerCounts, "count"));
    long long v1025 = 0u;
    long long v1026 = 0u;
    long long v1027 = 0u;
    long long v1028 = 0u;
    v5 = self->_kCellularPerClientProfileTriggerCounts;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v1025 objects:v1121 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v1026;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v1026 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v1025 + 1) + 8 * v9) dictionaryRepresentation];
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v1025 objects:v1121 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"kCellularPerClientProfileTriggerCount"];
  }
  if ([(NSMutableArray *)self->_kCellularProtocolStackCpuStats count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackCpuStats, "count"));
    long long v1021 = 0u;
    long long v1022 = 0u;
    long long v1023 = 0u;
    long long v1024 = 0u;
    v12 = self->_kCellularProtocolStackCpuStats;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v1021 objects:v1120 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v1022;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v1022 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v1021 + 1) + 8 * v16) dictionaryRepresentation];
          [v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v1021 objects:v1120 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"kCellularProtocolStackCpuStats"];
  }
  if ([(NSMutableArray *)self->_kCellularPeripheralStats count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularPeripheralStats, "count"));
    long long v1017 = 0u;
    long long v1018 = 0u;
    long long v1019 = 0u;
    long long v1020 = 0u;
    v19 = self->_kCellularPeripheralStats;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v1017 objects:v1119 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v1018;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v1018 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v1017 + 1) + 8 * v23) dictionaryRepresentation];
          [v18 addObject:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v1017 objects:v1119 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"kCellularPeripheralStats"];
  }
  if ([(NSMutableArray *)self->_kCellularDvfsStats count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularDvfsStats, "count"));
    long long v1013 = 0u;
    long long v1014 = 0u;
    long long v1015 = 0u;
    long long v1016 = 0u;
    v26 = self->_kCellularDvfsStats;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v1013 objects:v1118 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v1014;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v1014 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v1013 + 1) + 8 * v30) dictionaryRepresentation];
          [v25 addObject:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v1013 objects:v1118 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKey:@"kCellularDvfsStats"];
  }
  if ([(NSMutableArray *)self->_kCellularLteWcdmaGsmHwStats count])
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteWcdmaGsmHwStats, "count"));
    long long v1009 = 0u;
    long long v1010 = 0u;
    long long v1011 = 0u;
    long long v1012 = 0u;
    v33 = self->_kCellularLteWcdmaGsmHwStats;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v1009 objects:v1117 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v1010;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v1010 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [*(id *)(*((void *)&v1009 + 1) + 8 * v37) dictionaryRepresentation];
          [v32 addObject:v38];

          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v1009 objects:v1117 count:16];
      }
      while (v35);
    }

    [v3 setObject:v32 forKey:@"kCellularLteWcdmaGsmHwStats"];
  }
  if ([(NSMutableArray *)self->_kCellularLteTdsGsmHwStats count])
  {
    v39 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteTdsGsmHwStats, "count"));
    long long v1005 = 0u;
    long long v1006 = 0u;
    long long v1007 = 0u;
    long long v1008 = 0u;
    v40 = self->_kCellularLteTdsGsmHwStats;
    uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v1005 objects:v1116 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v1006;
      do
      {
        uint64_t v44 = 0;
        do
        {
          if (*(void *)v1006 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v1005 + 1) + 8 * v44) dictionaryRepresentation];
          [v39 addObject:v45];

          ++v44;
        }
        while (v42 != v44);
        uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v1005 objects:v1116 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKey:@"kCellularLteTdsGsmHwStats"];
  }
  if ([(NSMutableArray *)self->_kCellularPmuAverageCurrents count])
  {
    v46 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularPmuAverageCurrents, "count"));
    long long v1001 = 0u;
    long long v1002 = 0u;
    long long v1003 = 0u;
    long long v1004 = 0u;
    v47 = self->_kCellularPmuAverageCurrents;
    uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v1001 objects:v1115 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v1002;
      do
      {
        uint64_t v51 = 0;
        do
        {
          if (*(void *)v1002 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [*(id *)(*((void *)&v1001 + 1) + 8 * v51) dictionaryRepresentation];
          [v46 addObject:v52];

          ++v51;
        }
        while (v49 != v51);
        uint64_t v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v1001 objects:v1115 count:16];
      }
      while (v49);
    }

    [v3 setObject:v46 forKey:@"kCellularPmuAverageCurrent"];
  }
  if ([(NSMutableArray *)self->_kCellularFwCoreStats count])
  {
    v53 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularFwCoreStats, "count"));
    long long v997 = 0u;
    long long v998 = 0u;
    long long v999 = 0u;
    long long v1000 = 0u;
    v54 = self->_kCellularFwCoreStats;
    uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v997 objects:v1114 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v998;
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v998 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = [*(id *)(*((void *)&v997 + 1) + 8 * v58) dictionaryRepresentation];
          [v53 addObject:v59];

          ++v58;
        }
        while (v56 != v58);
        uint64_t v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v997 objects:v1114 count:16];
      }
      while (v56);
    }

    [v3 setObject:v53 forKey:@"kCellularFwCoreStats"];
  }
  if ([(NSMutableArray *)self->_kCellularLteWcdmaTdsHwStats count])
  {
    v60 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteWcdmaTdsHwStats, "count"));
    long long v993 = 0u;
    long long v994 = 0u;
    long long v995 = 0u;
    long long v996 = 0u;
    v61 = self->_kCellularLteWcdmaTdsHwStats;
    uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v993 objects:v1113 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v994;
      do
      {
        uint64_t v65 = 0;
        do
        {
          if (*(void *)v994 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = [*(id *)(*((void *)&v993 + 1) + 8 * v65) dictionaryRepresentation];
          [v60 addObject:v66];

          ++v65;
        }
        while (v63 != v65);
        uint64_t v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v993 objects:v1113 count:16];
      }
      while (v63);
    }

    [v3 setObject:v60 forKey:@"kCellularLteWcdmaTdsHwStats"];
  }
  if ([(NSMutableArray *)self->_kCellularPmicHwStats count])
  {
    v67 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularPmicHwStats, "count"));
    long long v989 = 0u;
    long long v990 = 0u;
    long long v991 = 0u;
    long long v992 = 0u;
    v68 = self->_kCellularPmicHwStats;
    uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v989 objects:v1112 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v990;
      do
      {
        uint64_t v72 = 0;
        do
        {
          if (*(void *)v990 != v71) {
            objc_enumerationMutation(v68);
          }
          v73 = [*(id *)(*((void *)&v989 + 1) + 8 * v72) dictionaryRepresentation];
          [v67 addObject:v73];

          ++v72;
        }
        while (v70 != v72);
        uint64_t v70 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v989 objects:v1112 count:16];
      }
      while (v70);
    }

    [v3 setObject:v67 forKey:@"kCellularPmicHwStats"];
  }
  if ([(NSMutableArray *)self->_kCellularGsmServingCellRssiHists count])
  {
    v74 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmServingCellRssiHists, "count"));
    long long v985 = 0u;
    long long v986 = 0u;
    long long v987 = 0u;
    long long v988 = 0u;
    v75 = self->_kCellularGsmServingCellRssiHists;
    uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v985 objects:v1111 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v986;
      do
      {
        uint64_t v79 = 0;
        do
        {
          if (*(void *)v986 != v78) {
            objc_enumerationMutation(v75);
          }
          v80 = [*(id *)(*((void *)&v985 + 1) + 8 * v79) dictionaryRepresentation];
          [v74 addObject:v80];

          ++v79;
        }
        while (v77 != v79);
        uint64_t v77 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v985 objects:v1111 count:16];
      }
      while (v77);
    }

    [v3 setObject:v74 forKey:@"kCellularGsmServingCellRssiHist"];
  }
  if ([(NSMutableArray *)self->_kCellularGsmServingCellSnrHists count])
  {
    v81 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmServingCellSnrHists, "count"));
    long long v981 = 0u;
    long long v982 = 0u;
    long long v983 = 0u;
    long long v984 = 0u;
    v82 = self->_kCellularGsmServingCellSnrHists;
    uint64_t v83 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v981 objects:v1110 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v982;
      do
      {
        uint64_t v86 = 0;
        do
        {
          if (*(void *)v982 != v85) {
            objc_enumerationMutation(v82);
          }
          v87 = [*(id *)(*((void *)&v981 + 1) + 8 * v86) dictionaryRepresentation];
          [v81 addObject:v87];

          ++v86;
        }
        while (v84 != v86);
        uint64_t v84 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v981 objects:v1110 count:16];
      }
      while (v84);
    }

    [v3 setObject:v81 forKey:@"kCellularGsmServingCellSnrHist"];
  }
  if ([(NSMutableArray *)self->_kCellularGsmTxPowerHists count])
  {
    v88 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmTxPowerHists, "count"));
    long long v977 = 0u;
    long long v978 = 0u;
    long long v979 = 0u;
    long long v980 = 0u;
    v89 = self->_kCellularGsmTxPowerHists;
    uint64_t v90 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v977 objects:v1109 count:16];
    if (v90)
    {
      uint64_t v91 = v90;
      uint64_t v92 = *(void *)v978;
      do
      {
        uint64_t v93 = 0;
        do
        {
          if (*(void *)v978 != v92) {
            objc_enumerationMutation(v89);
          }
          v94 = [*(id *)(*((void *)&v977 + 1) + 8 * v93) dictionaryRepresentation];
          [v88 addObject:v94];

          ++v93;
        }
        while (v91 != v93);
        uint64_t v91 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v977 objects:v1109 count:16];
      }
      while (v91);
    }

    [v3 setObject:v88 forKey:@"kCellularGsmTxPowerHist"];
  }
  if ([(NSMutableArray *)self->_kCellularGsmConnectedModeHists count])
  {
    v95 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmConnectedModeHists, "count"));
    long long v973 = 0u;
    long long v974 = 0u;
    long long v975 = 0u;
    long long v976 = 0u;
    v96 = self->_kCellularGsmConnectedModeHists;
    uint64_t v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v973 objects:v1108 count:16];
    if (v97)
    {
      uint64_t v98 = v97;
      uint64_t v99 = *(void *)v974;
      do
      {
        uint64_t v100 = 0;
        do
        {
          if (*(void *)v974 != v99) {
            objc_enumerationMutation(v96);
          }
          v101 = [*(id *)(*((void *)&v973 + 1) + 8 * v100) dictionaryRepresentation];
          [v95 addObject:v101];

          ++v100;
        }
        while (v98 != v100);
        uint64_t v98 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v973 objects:v1108 count:16];
      }
      while (v98);
    }

    [v3 setObject:v95 forKey:@"kCellularGsmConnectedModeHist"];
  }
  if ([(NSMutableArray *)self->_kCellularGsmL1States count])
  {
    v102 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularGsmL1States, "count"));
    long long v969 = 0u;
    long long v970 = 0u;
    long long v971 = 0u;
    long long v972 = 0u;
    v103 = self->_kCellularGsmL1States;
    uint64_t v104 = [(NSMutableArray *)v103 countByEnumeratingWithState:&v969 objects:v1107 count:16];
    if (v104)
    {
      uint64_t v105 = v104;
      uint64_t v106 = *(void *)v970;
      do
      {
        uint64_t v107 = 0;
        do
        {
          if (*(void *)v970 != v106) {
            objc_enumerationMutation(v103);
          }
          v108 = [*(id *)(*((void *)&v969 + 1) + 8 * v107) dictionaryRepresentation];
          [v102 addObject:v108];

          ++v107;
        }
        while (v105 != v107);
        uint64_t v105 = [(NSMutableArray *)v103 countByEnumeratingWithState:&v969 objects:v1107 count:16];
      }
      while (v105);
    }

    [v3 setObject:v102 forKey:@"kCellularGsmL1State"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaCpcStats count])
  {
    v109 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaCpcStats, "count"));
    long long v965 = 0u;
    long long v966 = 0u;
    long long v967 = 0u;
    long long v968 = 0u;
    v110 = self->_kCellularWcdmaCpcStats;
    uint64_t v111 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v965 objects:v1106 count:16];
    if (v111)
    {
      uint64_t v112 = v111;
      uint64_t v113 = *(void *)v966;
      do
      {
        uint64_t v114 = 0;
        do
        {
          if (*(void *)v966 != v113) {
            objc_enumerationMutation(v110);
          }
          v115 = [*(id *)(*((void *)&v965 + 1) + 8 * v114) dictionaryRepresentation];
          [v109 addObject:v115];

          ++v114;
        }
        while (v112 != v114);
        uint64_t v112 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v965 objects:v1106 count:16];
      }
      while (v112);
    }

    [v3 setObject:v109 forKey:@"kCellularWcdmaCpcStat"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaRxDiversityHists count])
  {
    v116 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRxDiversityHists, "count"));
    long long v961 = 0u;
    long long v962 = 0u;
    long long v963 = 0u;
    long long v964 = 0u;
    v117 = self->_kCellularWcdmaRxDiversityHists;
    uint64_t v118 = [(NSMutableArray *)v117 countByEnumeratingWithState:&v961 objects:v1105 count:16];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = *(void *)v962;
      do
      {
        uint64_t v121 = 0;
        do
        {
          if (*(void *)v962 != v120) {
            objc_enumerationMutation(v117);
          }
          v122 = [*(id *)(*((void *)&v961 + 1) + 8 * v121) dictionaryRepresentation];
          [v116 addObject:v122];

          ++v121;
        }
        while (v119 != v121);
        uint64_t v119 = [(NSMutableArray *)v117 countByEnumeratingWithState:&v961 objects:v1105 count:16];
      }
      while (v119);
    }

    [v3 setObject:v116 forKey:@"kCellularWcdmaRxDiversityHist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaServingCellRx0RssiHists count])
  {
    v123 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaServingCellRx0RssiHists, "count"));
    long long v957 = 0u;
    long long v958 = 0u;
    long long v959 = 0u;
    long long v960 = 0u;
    v124 = self->_kCellularWcdmaServingCellRx0RssiHists;
    uint64_t v125 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v957 objects:v1104 count:16];
    if (v125)
    {
      uint64_t v126 = v125;
      uint64_t v127 = *(void *)v958;
      do
      {
        uint64_t v128 = 0;
        do
        {
          if (*(void *)v958 != v127) {
            objc_enumerationMutation(v124);
          }
          v129 = [*(id *)(*((void *)&v957 + 1) + 8 * v128) dictionaryRepresentation];
          [v123 addObject:v129];

          ++v128;
        }
        while (v126 != v128);
        uint64_t v126 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v957 objects:v1104 count:16];
      }
      while (v126);
    }

    [v3 setObject:v123 forKey:@"kCellularWcdmaServingCellRx0RssiHist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaServingCellRx1RssiHists count])
  {
    v130 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaServingCellRx1RssiHists, "count"));
    long long v953 = 0u;
    long long v954 = 0u;
    long long v955 = 0u;
    long long v956 = 0u;
    v131 = self->_kCellularWcdmaServingCellRx1RssiHists;
    uint64_t v132 = [(NSMutableArray *)v131 countByEnumeratingWithState:&v953 objects:v1103 count:16];
    if (v132)
    {
      uint64_t v133 = v132;
      uint64_t v134 = *(void *)v954;
      do
      {
        uint64_t v135 = 0;
        do
        {
          if (*(void *)v954 != v134) {
            objc_enumerationMutation(v131);
          }
          v136 = [*(id *)(*((void *)&v953 + 1) + 8 * v135) dictionaryRepresentation];
          [v130 addObject:v136];

          ++v135;
        }
        while (v133 != v135);
        uint64_t v133 = [(NSMutableArray *)v131 countByEnumeratingWithState:&v953 objects:v1103 count:16];
      }
      while (v133);
    }

    [v3 setObject:v130 forKey:@"kCellularWcdmaServingCellRx1RssiHist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaServingCellRx0EcNoHists count])
  {
    v137 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaServingCellRx0EcNoHists, "count"));
    long long v949 = 0u;
    long long v950 = 0u;
    long long v951 = 0u;
    long long v952 = 0u;
    v138 = self->_kCellularWcdmaServingCellRx0EcNoHists;
    uint64_t v139 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v949 objects:v1102 count:16];
    if (v139)
    {
      uint64_t v140 = v139;
      uint64_t v141 = *(void *)v950;
      do
      {
        uint64_t v142 = 0;
        do
        {
          if (*(void *)v950 != v141) {
            objc_enumerationMutation(v138);
          }
          v143 = [*(id *)(*((void *)&v949 + 1) + 8 * v142) dictionaryRepresentation];
          [v137 addObject:v143];

          ++v142;
        }
        while (v140 != v142);
        uint64_t v140 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v949 objects:v1102 count:16];
      }
      while (v140);
    }

    [v3 setObject:v137 forKey:@"kCellularWcdmaServingCellRx0EcNoHist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaServingCellRx1EcNoHists count])
  {
    v144 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaServingCellRx1EcNoHists, "count"));
    long long v945 = 0u;
    long long v946 = 0u;
    long long v947 = 0u;
    long long v948 = 0u;
    v145 = self->_kCellularWcdmaServingCellRx1EcNoHists;
    uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v945 objects:v1101 count:16];
    if (v146)
    {
      uint64_t v147 = v146;
      uint64_t v148 = *(void *)v946;
      do
      {
        uint64_t v149 = 0;
        do
        {
          if (*(void *)v946 != v148) {
            objc_enumerationMutation(v145);
          }
          v150 = [*(id *)(*((void *)&v945 + 1) + 8 * v149) dictionaryRepresentation];
          [v144 addObject:v150];

          ++v149;
        }
        while (v147 != v149);
        uint64_t v147 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v945 objects:v1101 count:16];
      }
      while (v147);
    }

    [v3 setObject:v144 forKey:@"kCellularWcdmaServingCellRx1EcNoHist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaTxPowerHists count])
  {
    v151 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaTxPowerHists, "count"));
    long long v941 = 0u;
    long long v942 = 0u;
    long long v943 = 0u;
    long long v944 = 0u;
    v152 = self->_kCellularWcdmaTxPowerHists;
    uint64_t v153 = [(NSMutableArray *)v152 countByEnumeratingWithState:&v941 objects:v1100 count:16];
    if (v153)
    {
      uint64_t v154 = v153;
      uint64_t v155 = *(void *)v942;
      do
      {
        uint64_t v156 = 0;
        do
        {
          if (*(void *)v942 != v155) {
            objc_enumerationMutation(v152);
          }
          v157 = [*(id *)(*((void *)&v941 + 1) + 8 * v156) dictionaryRepresentation];
          [v151 addObject:v157];

          ++v156;
        }
        while (v154 != v156);
        uint64_t v154 = [(NSMutableArray *)v152 countByEnumeratingWithState:&v941 objects:v1100 count:16];
      }
      while (v154);
    }

    [v3 setObject:v151 forKey:@"kCellularWcdmaTxPowerHist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaReceiverStatusOnC0Hists count])
  {
    v158 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaReceiverStatusOnC0Hists, "count"));
    long long v937 = 0u;
    long long v938 = 0u;
    long long v939 = 0u;
    long long v940 = 0u;
    v159 = self->_kCellularWcdmaReceiverStatusOnC0Hists;
    uint64_t v160 = [(NSMutableArray *)v159 countByEnumeratingWithState:&v937 objects:v1099 count:16];
    if (v160)
    {
      uint64_t v161 = v160;
      uint64_t v162 = *(void *)v938;
      do
      {
        uint64_t v163 = 0;
        do
        {
          if (*(void *)v938 != v162) {
            objc_enumerationMutation(v159);
          }
          v164 = [*(id *)(*((void *)&v937 + 1) + 8 * v163) dictionaryRepresentation];
          [v158 addObject:v164];

          ++v163;
        }
        while (v161 != v163);
        uint64_t v161 = [(NSMutableArray *)v159 countByEnumeratingWithState:&v937 objects:v1099 count:16];
      }
      while (v161);
    }

    [v3 setObject:v158 forKey:@"kCellularWcdmaReceiverStatusOnC0Hist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaReceiverStatusOnC1Hists count])
  {
    v165 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaReceiverStatusOnC1Hists, "count"));
    long long v933 = 0u;
    long long v934 = 0u;
    long long v935 = 0u;
    long long v936 = 0u;
    v166 = self->_kCellularWcdmaReceiverStatusOnC1Hists;
    uint64_t v167 = [(NSMutableArray *)v166 countByEnumeratingWithState:&v933 objects:v1098 count:16];
    if (v167)
    {
      uint64_t v168 = v167;
      uint64_t v169 = *(void *)v934;
      do
      {
        uint64_t v170 = 0;
        do
        {
          if (*(void *)v934 != v169) {
            objc_enumerationMutation(v166);
          }
          v171 = [*(id *)(*((void *)&v933 + 1) + 8 * v170) dictionaryRepresentation];
          [v165 addObject:v171];

          ++v170;
        }
        while (v168 != v170);
        uint64_t v168 = [(NSMutableArray *)v166 countByEnumeratingWithState:&v933 objects:v1098 count:16];
      }
      while (v168);
    }

    [v3 setObject:v165 forKey:@"kCellularWcdmaReceiverStatusOnC1Hist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaCarrierStatusHists count])
  {
    v172 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaCarrierStatusHists, "count"));
    long long v929 = 0u;
    long long v930 = 0u;
    long long v931 = 0u;
    long long v932 = 0u;
    v173 = self->_kCellularWcdmaCarrierStatusHists;
    uint64_t v174 = [(NSMutableArray *)v173 countByEnumeratingWithState:&v929 objects:v1097 count:16];
    if (v174)
    {
      uint64_t v175 = v174;
      uint64_t v176 = *(void *)v930;
      do
      {
        uint64_t v177 = 0;
        do
        {
          if (*(void *)v930 != v176) {
            objc_enumerationMutation(v173);
          }
          v178 = [*(id *)(*((void *)&v929 + 1) + 8 * v177) dictionaryRepresentation];
          [v172 addObject:v178];

          ++v177;
        }
        while (v175 != v177);
        uint64_t v175 = [(NSMutableArray *)v173 countByEnumeratingWithState:&v929 objects:v1097 count:16];
      }
      while (v175);
    }

    [v3 setObject:v172 forKey:@"kCellularWcdmaCarrierStatusHist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaRabModeHists count])
  {
    v179 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRabModeHists, "count"));
    long long v925 = 0u;
    long long v926 = 0u;
    long long v927 = 0u;
    long long v928 = 0u;
    v180 = self->_kCellularWcdmaRabModeHists;
    uint64_t v181 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v925 objects:v1096 count:16];
    if (v181)
    {
      uint64_t v182 = v181;
      uint64_t v183 = *(void *)v926;
      do
      {
        uint64_t v184 = 0;
        do
        {
          if (*(void *)v926 != v183) {
            objc_enumerationMutation(v180);
          }
          v185 = [*(id *)(*((void *)&v925 + 1) + 8 * v184) dictionaryRepresentation];
          [v179 addObject:v185];

          ++v184;
        }
        while (v182 != v184);
        uint64_t v182 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v925 objects:v1096 count:16];
      }
      while (v182);
    }

    [v3 setObject:v179 forKey:@"kCellularWcdmaRabModeHist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaRabTypeHists count])
  {
    v186 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRabTypeHists, "count"));
    long long v921 = 0u;
    long long v922 = 0u;
    long long v923 = 0u;
    long long v924 = 0u;
    v187 = self->_kCellularWcdmaRabTypeHists;
    uint64_t v188 = [(NSMutableArray *)v187 countByEnumeratingWithState:&v921 objects:v1095 count:16];
    if (v188)
    {
      uint64_t v189 = v188;
      uint64_t v190 = *(void *)v922;
      do
      {
        uint64_t v191 = 0;
        do
        {
          if (*(void *)v922 != v190) {
            objc_enumerationMutation(v187);
          }
          v192 = [*(id *)(*((void *)&v921 + 1) + 8 * v191) dictionaryRepresentation];
          [v186 addObject:v192];

          ++v191;
        }
        while (v189 != v191);
        uint64_t v189 = [(NSMutableArray *)v187 countByEnumeratingWithState:&v921 objects:v1095 count:16];
      }
      while (v189);
    }

    [v3 setObject:v186 forKey:@"kCellularWcdmaRabTypeHist"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaRrcConnectionStates count])
  {
    v193 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRrcConnectionStates, "count"));
    long long v917 = 0u;
    long long v918 = 0u;
    long long v919 = 0u;
    long long v920 = 0u;
    v194 = self->_kCellularWcdmaRrcConnectionStates;
    uint64_t v195 = [(NSMutableArray *)v194 countByEnumeratingWithState:&v917 objects:v1094 count:16];
    if (v195)
    {
      uint64_t v196 = v195;
      uint64_t v197 = *(void *)v918;
      do
      {
        uint64_t v198 = 0;
        do
        {
          if (*(void *)v918 != v197) {
            objc_enumerationMutation(v194);
          }
          v199 = [*(id *)(*((void *)&v917 + 1) + 8 * v198) dictionaryRepresentation];
          [v193 addObject:v199];

          ++v198;
        }
        while (v196 != v198);
        uint64_t v196 = [(NSMutableArray *)v194 countByEnumeratingWithState:&v917 objects:v1094 count:16];
      }
      while (v196);
    }

    [v3 setObject:v193 forKey:@"kCellularWcdmaRrcConnectionState"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaRrcConfigurations count])
  {
    v200 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRrcConfigurations, "count"));
    long long v913 = 0u;
    long long v914 = 0u;
    long long v915 = 0u;
    long long v916 = 0u;
    v201 = self->_kCellularWcdmaRrcConfigurations;
    uint64_t v202 = [(NSMutableArray *)v201 countByEnumeratingWithState:&v913 objects:v1093 count:16];
    if (v202)
    {
      uint64_t v203 = v202;
      uint64_t v204 = *(void *)v914;
      do
      {
        uint64_t v205 = 0;
        do
        {
          if (*(void *)v914 != v204) {
            objc_enumerationMutation(v201);
          }
          v206 = [*(id *)(*((void *)&v913 + 1) + 8 * v205) dictionaryRepresentation];
          [v200 addObject:v206];

          ++v205;
        }
        while (v203 != v205);
        uint64_t v203 = [(NSMutableArray *)v201 countByEnumeratingWithState:&v913 objects:v1093 count:16];
      }
      while (v203);
    }

    [v3 setObject:v200 forKey:@"kCellularWcdmaRrcConfiguration"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaRabStatus count])
  {
    v207 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaRabStatus, "count"));
    long long v909 = 0u;
    long long v910 = 0u;
    long long v911 = 0u;
    long long v912 = 0u;
    v208 = self->_kCellularWcdmaRabStatus;
    uint64_t v209 = [(NSMutableArray *)v208 countByEnumeratingWithState:&v909 objects:v1092 count:16];
    if (v209)
    {
      uint64_t v210 = v209;
      uint64_t v211 = *(void *)v910;
      do
      {
        uint64_t v212 = 0;
        do
        {
          if (*(void *)v910 != v211) {
            objc_enumerationMutation(v208);
          }
          v213 = [*(id *)(*((void *)&v909 + 1) + 8 * v212) dictionaryRepresentation];
          [v207 addObject:v213];

          ++v212;
        }
        while (v210 != v212);
        uint64_t v210 = [(NSMutableArray *)v208 countByEnumeratingWithState:&v909 objects:v1092 count:16];
      }
      while (v210);
    }

    [v3 setObject:v207 forKey:@"kCellularWcdmaRabStatus"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaL1States count])
  {
    v214 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaL1States, "count"));
    long long v905 = 0u;
    long long v906 = 0u;
    long long v907 = 0u;
    long long v908 = 0u;
    v215 = self->_kCellularWcdmaL1States;
    uint64_t v216 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v905 objects:v1091 count:16];
    if (v216)
    {
      uint64_t v217 = v216;
      uint64_t v218 = *(void *)v906;
      do
      {
        uint64_t v219 = 0;
        do
        {
          if (*(void *)v906 != v218) {
            objc_enumerationMutation(v215);
          }
          v220 = [*(id *)(*((void *)&v905 + 1) + 8 * v219) dictionaryRepresentation];
          [v214 addObject:v220];

          ++v219;
        }
        while (v217 != v219);
        uint64_t v217 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v905 objects:v1091 count:16];
      }
      while (v217);
    }

    [v3 setObject:v214 forKey:@"kCellularWcdmaL1State"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaDataInactivityBeforeIdles count])
  {
    v221 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaDataInactivityBeforeIdles, "count"));
    long long v901 = 0u;
    long long v902 = 0u;
    long long v903 = 0u;
    long long v904 = 0u;
    v222 = self->_kCellularWcdmaDataInactivityBeforeIdles;
    uint64_t v223 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v901 objects:v1090 count:16];
    if (v223)
    {
      uint64_t v224 = v223;
      uint64_t v225 = *(void *)v902;
      do
      {
        uint64_t v226 = 0;
        do
        {
          if (*(void *)v902 != v225) {
            objc_enumerationMutation(v222);
          }
          v227 = [*(id *)(*((void *)&v901 + 1) + 8 * v226) dictionaryRepresentation];
          [v221 addObject:v227];

          ++v226;
        }
        while (v224 != v226);
        uint64_t v224 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v901 objects:v1090 count:16];
      }
      while (v224);
    }

    [v3 setObject:v221 forKey:@"kCellularWcdmaDataInactivityBeforeIdle"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaIdleToConnectedUserDatas count])
  {
    v228 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaIdleToConnectedUserDatas, "count"));
    long long v897 = 0u;
    long long v898 = 0u;
    long long v899 = 0u;
    long long v900 = 0u;
    v229 = self->_kCellularWcdmaIdleToConnectedUserDatas;
    uint64_t v230 = [(NSMutableArray *)v229 countByEnumeratingWithState:&v897 objects:v1089 count:16];
    if (v230)
    {
      uint64_t v231 = v230;
      uint64_t v232 = *(void *)v898;
      do
      {
        uint64_t v233 = 0;
        do
        {
          if (*(void *)v898 != v232) {
            objc_enumerationMutation(v229);
          }
          v234 = [*(id *)(*((void *)&v897 + 1) + 8 * v233) dictionaryRepresentation];
          [v228 addObject:v234];

          ++v233;
        }
        while (v231 != v233);
        uint64_t v231 = [(NSMutableArray *)v229 countByEnumeratingWithState:&v897 objects:v1089 count:16];
      }
      while (v231);
    }

    [v3 setObject:v228 forKey:@"kCellularWcdmaIdleToConnectedUserData"];
  }
  if ([(NSMutableArray *)self->_kCellularWcdmaVadHists count])
  {
    v235 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularWcdmaVadHists, "count"));
    long long v893 = 0u;
    long long v894 = 0u;
    long long v895 = 0u;
    long long v896 = 0u;
    v236 = self->_kCellularWcdmaVadHists;
    uint64_t v237 = [(NSMutableArray *)v236 countByEnumeratingWithState:&v893 objects:v1088 count:16];
    if (v237)
    {
      uint64_t v238 = v237;
      uint64_t v239 = *(void *)v894;
      do
      {
        uint64_t v240 = 0;
        do
        {
          if (*(void *)v894 != v239) {
            objc_enumerationMutation(v236);
          }
          v241 = [*(id *)(*((void *)&v893 + 1) + 8 * v240) dictionaryRepresentation];
          [v235 addObject:v241];

          ++v240;
        }
        while (v238 != v240);
        uint64_t v238 = [(NSMutableArray *)v236 countByEnumeratingWithState:&v893 objects:v1088 count:16];
      }
      while (v238);
    }

    [v3 setObject:v235 forKey:@"kCellularWcdmaVadHist"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsRxDiversityHists count])
  {
    v242 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsRxDiversityHists, "count"));
    long long v889 = 0u;
    long long v890 = 0u;
    long long v891 = 0u;
    long long v892 = 0u;
    v243 = self->_kCellularTdsRxDiversityHists;
    uint64_t v244 = [(NSMutableArray *)v243 countByEnumeratingWithState:&v889 objects:v1087 count:16];
    if (v244)
    {
      uint64_t v245 = v244;
      uint64_t v246 = *(void *)v890;
      do
      {
        uint64_t v247 = 0;
        do
        {
          if (*(void *)v890 != v246) {
            objc_enumerationMutation(v243);
          }
          v248 = [*(id *)(*((void *)&v889 + 1) + 8 * v247) dictionaryRepresentation];
          [v242 addObject:v248];

          ++v247;
        }
        while (v245 != v247);
        uint64_t v245 = [(NSMutableArray *)v243 countByEnumeratingWithState:&v889 objects:v1087 count:16];
      }
      while (v245);
    }

    [v3 setObject:v242 forKey:@"kCellularTdsRxDiversityHist"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsServingCellRx0RssiHists count])
  {
    v249 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsServingCellRx0RssiHists, "count"));
    long long v885 = 0u;
    long long v886 = 0u;
    long long v887 = 0u;
    long long v888 = 0u;
    v250 = self->_kCellularTdsServingCellRx0RssiHists;
    uint64_t v251 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v885 objects:v1086 count:16];
    if (v251)
    {
      uint64_t v252 = v251;
      uint64_t v253 = *(void *)v886;
      do
      {
        uint64_t v254 = 0;
        do
        {
          if (*(void *)v886 != v253) {
            objc_enumerationMutation(v250);
          }
          v255 = [*(id *)(*((void *)&v885 + 1) + 8 * v254) dictionaryRepresentation];
          [v249 addObject:v255];

          ++v254;
        }
        while (v252 != v254);
        uint64_t v252 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v885 objects:v1086 count:16];
      }
      while (v252);
    }

    [v3 setObject:v249 forKey:@"kCellularTdsServingCellRx0RssiHist"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsServingCellRx1RssiHists count])
  {
    v256 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsServingCellRx1RssiHists, "count"));
    long long v881 = 0u;
    long long v882 = 0u;
    long long v883 = 0u;
    long long v884 = 0u;
    v257 = self->_kCellularTdsServingCellRx1RssiHists;
    uint64_t v258 = [(NSMutableArray *)v257 countByEnumeratingWithState:&v881 objects:v1085 count:16];
    if (v258)
    {
      uint64_t v259 = v258;
      uint64_t v260 = *(void *)v882;
      do
      {
        uint64_t v261 = 0;
        do
        {
          if (*(void *)v882 != v260) {
            objc_enumerationMutation(v257);
          }
          v262 = [*(id *)(*((void *)&v881 + 1) + 8 * v261) dictionaryRepresentation];
          [v256 addObject:v262];

          ++v261;
        }
        while (v259 != v261);
        uint64_t v259 = [(NSMutableArray *)v257 countByEnumeratingWithState:&v881 objects:v1085 count:16];
      }
      while (v259);
    }

    [v3 setObject:v256 forKey:@"kCellularTdsServingCellRx1RssiHist"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsServingCellRx0RscpHists count])
  {
    v263 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsServingCellRx0RscpHists, "count"));
    long long v877 = 0u;
    long long v878 = 0u;
    long long v879 = 0u;
    long long v880 = 0u;
    v264 = self->_kCellularTdsServingCellRx0RscpHists;
    uint64_t v265 = [(NSMutableArray *)v264 countByEnumeratingWithState:&v877 objects:v1084 count:16];
    if (v265)
    {
      uint64_t v266 = v265;
      uint64_t v267 = *(void *)v878;
      do
      {
        uint64_t v268 = 0;
        do
        {
          if (*(void *)v878 != v267) {
            objc_enumerationMutation(v264);
          }
          v269 = [*(id *)(*((void *)&v877 + 1) + 8 * v268) dictionaryRepresentation];
          [v263 addObject:v269];

          ++v268;
        }
        while (v266 != v268);
        uint64_t v266 = [(NSMutableArray *)v264 countByEnumeratingWithState:&v877 objects:v1084 count:16];
      }
      while (v266);
    }

    [v3 setObject:v263 forKey:@"kCellularTdsServingCellRx0RscpHist"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsServingCellRx1RscpHists count])
  {
    v270 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsServingCellRx1RscpHists, "count"));
    long long v873 = 0u;
    long long v874 = 0u;
    long long v875 = 0u;
    long long v876 = 0u;
    v271 = self->_kCellularTdsServingCellRx1RscpHists;
    uint64_t v272 = [(NSMutableArray *)v271 countByEnumeratingWithState:&v873 objects:v1083 count:16];
    if (v272)
    {
      uint64_t v273 = v272;
      uint64_t v274 = *(void *)v874;
      do
      {
        uint64_t v275 = 0;
        do
        {
          if (*(void *)v874 != v274) {
            objc_enumerationMutation(v271);
          }
          v276 = [*(id *)(*((void *)&v873 + 1) + 8 * v275) dictionaryRepresentation];
          [v270 addObject:v276];

          ++v275;
        }
        while (v273 != v275);
        uint64_t v273 = [(NSMutableArray *)v271 countByEnumeratingWithState:&v873 objects:v1083 count:16];
      }
      while (v273);
    }

    [v3 setObject:v270 forKey:@"kCellularTdsServingCellRx1RscpHist"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsTxPowerHists count])
  {
    v277 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsTxPowerHists, "count"));
    long long v869 = 0u;
    long long v870 = 0u;
    long long v871 = 0u;
    long long v872 = 0u;
    v278 = self->_kCellularTdsTxPowerHists;
    uint64_t v279 = [(NSMutableArray *)v278 countByEnumeratingWithState:&v869 objects:v1082 count:16];
    if (v279)
    {
      uint64_t v280 = v279;
      uint64_t v281 = *(void *)v870;
      do
      {
        uint64_t v282 = 0;
        do
        {
          if (*(void *)v870 != v281) {
            objc_enumerationMutation(v278);
          }
          v283 = [*(id *)(*((void *)&v869 + 1) + 8 * v282) dictionaryRepresentation];
          [v277 addObject:v283];

          ++v282;
        }
        while (v280 != v282);
        uint64_t v280 = [(NSMutableArray *)v278 countByEnumeratingWithState:&v869 objects:v1082 count:16];
      }
      while (v280);
    }

    [v3 setObject:v277 forKey:@"kCellularTdsTxPowerHist"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsRabModeHists count])
  {
    v284 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsRabModeHists, "count"));
    long long v865 = 0u;
    long long v866 = 0u;
    long long v867 = 0u;
    long long v868 = 0u;
    v285 = self->_kCellularTdsRabModeHists;
    uint64_t v286 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v865 objects:v1081 count:16];
    if (v286)
    {
      uint64_t v287 = v286;
      uint64_t v288 = *(void *)v866;
      do
      {
        uint64_t v289 = 0;
        do
        {
          if (*(void *)v866 != v288) {
            objc_enumerationMutation(v285);
          }
          v290 = [*(id *)(*((void *)&v865 + 1) + 8 * v289) dictionaryRepresentation];
          [v284 addObject:v290];

          ++v289;
        }
        while (v287 != v289);
        uint64_t v287 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v865 objects:v1081 count:16];
      }
      while (v287);
    }

    [v3 setObject:v284 forKey:@"kCellularTdsRabModeHist"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsRabTypeHists count])
  {
    v291 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsRabTypeHists, "count"));
    long long v861 = 0u;
    long long v862 = 0u;
    long long v863 = 0u;
    long long v864 = 0u;
    v292 = self->_kCellularTdsRabTypeHists;
    uint64_t v293 = [(NSMutableArray *)v292 countByEnumeratingWithState:&v861 objects:v1080 count:16];
    if (v293)
    {
      uint64_t v294 = v293;
      uint64_t v295 = *(void *)v862;
      do
      {
        uint64_t v296 = 0;
        do
        {
          if (*(void *)v862 != v295) {
            objc_enumerationMutation(v292);
          }
          v297 = [*(id *)(*((void *)&v861 + 1) + 8 * v296) dictionaryRepresentation];
          [v291 addObject:v297];

          ++v296;
        }
        while (v294 != v296);
        uint64_t v294 = [(NSMutableArray *)v292 countByEnumeratingWithState:&v861 objects:v1080 count:16];
      }
      while (v294);
    }

    [v3 setObject:v291 forKey:@"kCellularTdsRabTypeHist"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsRrcStates count])
  {
    v298 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsRrcStates, "count"));
    long long v857 = 0u;
    long long v858 = 0u;
    long long v859 = 0u;
    long long v860 = 0u;
    v299 = self->_kCellularTdsRrcStates;
    uint64_t v300 = [(NSMutableArray *)v299 countByEnumeratingWithState:&v857 objects:v1079 count:16];
    if (v300)
    {
      uint64_t v301 = v300;
      uint64_t v302 = *(void *)v858;
      do
      {
        uint64_t v303 = 0;
        do
        {
          if (*(void *)v858 != v302) {
            objc_enumerationMutation(v299);
          }
          v304 = [*(id *)(*((void *)&v857 + 1) + 8 * v303) dictionaryRepresentation];
          [v298 addObject:v304];

          ++v303;
        }
        while (v301 != v303);
        uint64_t v301 = [(NSMutableArray *)v299 countByEnumeratingWithState:&v857 objects:v1079 count:16];
      }
      while (v301);
    }

    [v3 setObject:v298 forKey:@"kCellularTdsRrcState"];
  }
  if ([(NSMutableArray *)self->_kCellularTdsL1States count])
  {
    v305 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularTdsL1States, "count"));
    long long v853 = 0u;
    long long v854 = 0u;
    long long v855 = 0u;
    long long v856 = 0u;
    v306 = self->_kCellularTdsL1States;
    uint64_t v307 = [(NSMutableArray *)v306 countByEnumeratingWithState:&v853 objects:v1078 count:16];
    if (v307)
    {
      uint64_t v308 = v307;
      uint64_t v309 = *(void *)v854;
      do
      {
        uint64_t v310 = 0;
        do
        {
          if (*(void *)v854 != v309) {
            objc_enumerationMutation(v306);
          }
          v311 = [*(id *)(*((void *)&v853 + 1) + 8 * v310) dictionaryRepresentation];
          [v305 addObject:v311];

          ++v310;
        }
        while (v308 != v310);
        uint64_t v308 = [(NSMutableArray *)v306 countByEnumeratingWithState:&v853 objects:v1078 count:16];
      }
      while (v308);
    }

    [v3 setObject:v305 forKey:@"kCellularTdsL1State"];
  }
  if ([(NSMutableArray *)self->_kCellularLteFwDuplexModes count])
  {
    v312 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteFwDuplexModes, "count"));
    long long v849 = 0u;
    long long v850 = 0u;
    long long v851 = 0u;
    long long v852 = 0u;
    v313 = self->_kCellularLteFwDuplexModes;
    uint64_t v314 = [(NSMutableArray *)v313 countByEnumeratingWithState:&v849 objects:v1077 count:16];
    if (v314)
    {
      uint64_t v315 = v314;
      uint64_t v316 = *(void *)v850;
      do
      {
        uint64_t v317 = 0;
        do
        {
          if (*(void *)v850 != v316) {
            objc_enumerationMutation(v313);
          }
          v318 = [*(id *)(*((void *)&v849 + 1) + 8 * v317) dictionaryRepresentation];
          [v312 addObject:v318];

          ++v317;
        }
        while (v315 != v317);
        uint64_t v315 = [(NSMutableArray *)v313 countByEnumeratingWithState:&v849 objects:v1077 count:16];
      }
      while (v315);
    }

    [v3 setObject:v312 forKey:@"kCellularLteFwDuplexMode"];
  }
  if ([(NSMutableArray *)self->_kCellularLteServingCellRsrpHists count])
  {
    v319 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteServingCellRsrpHists, "count"));
    long long v845 = 0u;
    long long v846 = 0u;
    long long v847 = 0u;
    long long v848 = 0u;
    v320 = self->_kCellularLteServingCellRsrpHists;
    uint64_t v321 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v845 objects:v1076 count:16];
    if (v321)
    {
      uint64_t v322 = v321;
      uint64_t v323 = *(void *)v846;
      do
      {
        uint64_t v324 = 0;
        do
        {
          if (*(void *)v846 != v323) {
            objc_enumerationMutation(v320);
          }
          v325 = [*(id *)(*((void *)&v845 + 1) + 8 * v324) dictionaryRepresentation];
          [v319 addObject:v325];

          ++v324;
        }
        while (v322 != v324);
        uint64_t v322 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v845 objects:v1076 count:16];
      }
      while (v322);
    }

    [v3 setObject:v319 forKey:@"kCellularLteServingCellRsrpHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteServingCellSinrHists count])
  {
    v326 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteServingCellSinrHists, "count"));
    long long v841 = 0u;
    long long v842 = 0u;
    long long v843 = 0u;
    long long v844 = 0u;
    v327 = self->_kCellularLteServingCellSinrHists;
    uint64_t v328 = [(NSMutableArray *)v327 countByEnumeratingWithState:&v841 objects:v1075 count:16];
    if (v328)
    {
      uint64_t v329 = v328;
      uint64_t v330 = *(void *)v842;
      do
      {
        uint64_t v331 = 0;
        do
        {
          if (*(void *)v842 != v330) {
            objc_enumerationMutation(v327);
          }
          v332 = [*(id *)(*((void *)&v841 + 1) + 8 * v331) dictionaryRepresentation];
          [v326 addObject:v332];

          ++v331;
        }
        while (v329 != v331);
        uint64_t v329 = [(NSMutableArray *)v327 countByEnumeratingWithState:&v841 objects:v1075 count:16];
      }
      while (v329);
    }

    [v3 setObject:v326 forKey:@"kCellularLteServingCellSinrHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteSleepStateHists count])
  {
    v333 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteSleepStateHists, "count"));
    long long v837 = 0u;
    long long v838 = 0u;
    long long v839 = 0u;
    long long v840 = 0u;
    v334 = self->_kCellularLteSleepStateHists;
    uint64_t v335 = [(NSMutableArray *)v334 countByEnumeratingWithState:&v837 objects:v1074 count:16];
    if (v335)
    {
      uint64_t v336 = v335;
      uint64_t v337 = *(void *)v838;
      do
      {
        uint64_t v338 = 0;
        do
        {
          if (*(void *)v838 != v337) {
            objc_enumerationMutation(v334);
          }
          v339 = [*(id *)(*((void *)&v837 + 1) + 8 * v338) dictionaryRepresentation];
          [v333 addObject:v339];

          ++v338;
        }
        while (v336 != v338);
        uint64_t v336 = [(NSMutableArray *)v334 countByEnumeratingWithState:&v837 objects:v1074 count:16];
      }
      while (v336);
    }

    [v3 setObject:v333 forKey:@"kCellularLteSleepStateHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteTxPowerHists count])
  {
    v340 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteTxPowerHists, "count"));
    long long v833 = 0u;
    long long v834 = 0u;
    long long v835 = 0u;
    long long v836 = 0u;
    v341 = self->_kCellularLteTxPowerHists;
    uint64_t v342 = [(NSMutableArray *)v341 countByEnumeratingWithState:&v833 objects:v1073 count:16];
    if (v342)
    {
      uint64_t v343 = v342;
      uint64_t v344 = *(void *)v834;
      do
      {
        uint64_t v345 = 0;
        do
        {
          if (*(void *)v834 != v344) {
            objc_enumerationMutation(v341);
          }
          v346 = [*(id *)(*((void *)&v833 + 1) + 8 * v345) dictionaryRepresentation];
          [v340 addObject:v346];

          ++v345;
        }
        while (v343 != v345);
        uint64_t v343 = [(NSMutableArray *)v341 countByEnumeratingWithState:&v833 objects:v1073 count:16];
      }
      while (v343);
    }

    [v3 setObject:v340 forKey:@"kCellularLteTxPowerHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteDlSccStateHists count])
  {
    v347 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteDlSccStateHists, "count"));
    long long v829 = 0u;
    long long v830 = 0u;
    long long v831 = 0u;
    long long v832 = 0u;
    v348 = self->_kCellularLteDlSccStateHists;
    uint64_t v349 = [(NSMutableArray *)v348 countByEnumeratingWithState:&v829 objects:v1072 count:16];
    if (v349)
    {
      uint64_t v350 = v349;
      uint64_t v351 = *(void *)v830;
      do
      {
        uint64_t v352 = 0;
        do
        {
          if (*(void *)v830 != v351) {
            objc_enumerationMutation(v348);
          }
          v353 = [*(id *)(*((void *)&v829 + 1) + 8 * v352) dictionaryRepresentation];
          [v347 addObject:v353];

          ++v352;
        }
        while (v350 != v352);
        uint64_t v350 = [(NSMutableArray *)v348 countByEnumeratingWithState:&v829 objects:v1072 count:16];
      }
      while (v350);
    }

    [v3 setObject:v347 forKey:@"kCellularLteDlSccStateHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteUlSccStateHists count])
  {
    v354 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteUlSccStateHists, "count"));
    long long v825 = 0u;
    long long v826 = 0u;
    long long v827 = 0u;
    long long v828 = 0u;
    v355 = self->_kCellularLteUlSccStateHists;
    uint64_t v356 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v825 objects:v1071 count:16];
    if (v356)
    {
      uint64_t v357 = v356;
      uint64_t v358 = *(void *)v826;
      do
      {
        uint64_t v359 = 0;
        do
        {
          if (*(void *)v826 != v358) {
            objc_enumerationMutation(v355);
          }
          v360 = [*(id *)(*((void *)&v825 + 1) + 8 * v359) dictionaryRepresentation];
          [v354 addObject:v360];

          ++v359;
        }
        while (v357 != v359);
        uint64_t v357 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v825 objects:v1071 count:16];
      }
      while (v357);
    }

    [v3 setObject:v354 forKey:@"kCellularLteUlSccStateHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteAdvancedRxStateHists count])
  {
    v361 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteAdvancedRxStateHists, "count"));
    long long v821 = 0u;
    long long v822 = 0u;
    long long v823 = 0u;
    long long v824 = 0u;
    v362 = self->_kCellularLteAdvancedRxStateHists;
    uint64_t v363 = [(NSMutableArray *)v362 countByEnumeratingWithState:&v821 objects:v1070 count:16];
    if (v363)
    {
      uint64_t v364 = v363;
      uint64_t v365 = *(void *)v822;
      do
      {
        uint64_t v366 = 0;
        do
        {
          if (*(void *)v822 != v365) {
            objc_enumerationMutation(v362);
          }
          v367 = [*(id *)(*((void *)&v821 + 1) + 8 * v366) dictionaryRepresentation];
          [v361 addObject:v367];

          ++v366;
        }
        while (v364 != v366);
        uint64_t v364 = [(NSMutableArray *)v362 countByEnumeratingWithState:&v821 objects:v1070 count:16];
      }
      while (v364);
    }

    [v3 setObject:v361 forKey:@"kCellularLteAdvancedRxStateHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteComponentCarrierInfos count])
  {
    v368 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteComponentCarrierInfos, "count"));
    long long v817 = 0u;
    long long v818 = 0u;
    long long v819 = 0u;
    long long v820 = 0u;
    v369 = self->_kCellularLteComponentCarrierInfos;
    uint64_t v370 = [(NSMutableArray *)v369 countByEnumeratingWithState:&v817 objects:v1069 count:16];
    if (v370)
    {
      uint64_t v371 = v370;
      uint64_t v372 = *(void *)v818;
      do
      {
        uint64_t v373 = 0;
        do
        {
          if (*(void *)v818 != v372) {
            objc_enumerationMutation(v369);
          }
          v374 = [*(id *)(*((void *)&v817 + 1) + 8 * v373) dictionaryRepresentation];
          [v368 addObject:v374];

          ++v373;
        }
        while (v371 != v373);
        uint64_t v371 = [(NSMutableArray *)v369 countByEnumeratingWithState:&v817 objects:v1069 count:16];
      }
      while (v371);
    }

    [v3 setObject:v368 forKey:@"kCellularLteComponentCarrierInfo"];
  }
  if ([(NSMutableArray *)self->_kCellularLteRxTxStateHists count])
  {
    v375 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteRxTxStateHists, "count"));
    long long v813 = 0u;
    long long v814 = 0u;
    long long v815 = 0u;
    long long v816 = 0u;
    v376 = self->_kCellularLteRxTxStateHists;
    uint64_t v377 = [(NSMutableArray *)v376 countByEnumeratingWithState:&v813 objects:v1068 count:16];
    if (v377)
    {
      uint64_t v378 = v377;
      uint64_t v379 = *(void *)v814;
      do
      {
        uint64_t v380 = 0;
        do
        {
          if (*(void *)v814 != v379) {
            objc_enumerationMutation(v376);
          }
          v381 = [*(id *)(*((void *)&v813 + 1) + 8 * v380) dictionaryRepresentation];
          [v375 addObject:v381];

          ++v380;
        }
        while (v378 != v380);
        uint64_t v378 = [(NSMutableArray *)v376 countByEnumeratingWithState:&v813 objects:v1068 count:16];
      }
      while (v378);
    }

    [v3 setObject:v375 forKey:@"kCellularLteRxTxStateHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteTotalDlTbsHists count])
  {
    v382 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteTotalDlTbsHists, "count"));
    long long v809 = 0u;
    long long v810 = 0u;
    long long v811 = 0u;
    long long v812 = 0u;
    v383 = self->_kCellularLteTotalDlTbsHists;
    uint64_t v384 = [(NSMutableArray *)v383 countByEnumeratingWithState:&v809 objects:v1067 count:16];
    if (v384)
    {
      uint64_t v385 = v384;
      uint64_t v386 = *(void *)v810;
      do
      {
        uint64_t v387 = 0;
        do
        {
          if (*(void *)v810 != v386) {
            objc_enumerationMutation(v383);
          }
          v388 = [*(id *)(*((void *)&v809 + 1) + 8 * v387) dictionaryRepresentation];
          [v382 addObject:v388];

          ++v387;
        }
        while (v385 != v387);
        uint64_t v385 = [(NSMutableArray *)v383 countByEnumeratingWithState:&v809 objects:v1067 count:16];
      }
      while (v385);
    }

    [v3 setObject:v382 forKey:@"kCellularLteTotalDlTbsHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteDataInactivityBeforeIdles count])
  {
    v389 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteDataInactivityBeforeIdles, "count"));
    long long v805 = 0u;
    long long v806 = 0u;
    long long v807 = 0u;
    long long v808 = 0u;
    v390 = self->_kCellularLteDataInactivityBeforeIdles;
    uint64_t v391 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v805 objects:v1066 count:16];
    if (v391)
    {
      uint64_t v392 = v391;
      uint64_t v393 = *(void *)v806;
      do
      {
        uint64_t v394 = 0;
        do
        {
          if (*(void *)v806 != v393) {
            objc_enumerationMutation(v390);
          }
          v395 = [*(id *)(*((void *)&v805 + 1) + 8 * v394) dictionaryRepresentation];
          [v389 addObject:v395];

          ++v394;
        }
        while (v392 != v394);
        uint64_t v392 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v805 objects:v1066 count:16];
      }
      while (v392);
    }

    [v3 setObject:v389 forKey:@"kCellularLteDataInactivityBeforeIdle"];
  }
  if ([(NSMutableArray *)self->_kCellularLteIdleToConnectedUserDatas count])
  {
    v396 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteIdleToConnectedUserDatas, "count"));
    long long v801 = 0u;
    long long v802 = 0u;
    long long v803 = 0u;
    long long v804 = 0u;
    v397 = self->_kCellularLteIdleToConnectedUserDatas;
    uint64_t v398 = [(NSMutableArray *)v397 countByEnumeratingWithState:&v801 objects:v1065 count:16];
    if (v398)
    {
      uint64_t v399 = v398;
      uint64_t v400 = *(void *)v802;
      do
      {
        uint64_t v401 = 0;
        do
        {
          if (*(void *)v802 != v400) {
            objc_enumerationMutation(v397);
          }
          v402 = [*(id *)(*((void *)&v801 + 1) + 8 * v401) dictionaryRepresentation];
          [v396 addObject:v402];

          ++v401;
        }
        while (v399 != v401);
        uint64_t v399 = [(NSMutableArray *)v397 countByEnumeratingWithState:&v801 objects:v1065 count:16];
      }
      while (v399);
    }

    [v3 setObject:v396 forKey:@"kCellularLteIdleToConnectedUserData"];
  }
  if ([(NSMutableArray *)self->_kCellularLteDlSccStateHistV3s count])
  {
    v403 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteDlSccStateHistV3s, "count"));
    long long v797 = 0u;
    long long v798 = 0u;
    long long v799 = 0u;
    long long v800 = 0u;
    v404 = self->_kCellularLteDlSccStateHistV3s;
    uint64_t v405 = [(NSMutableArray *)v404 countByEnumeratingWithState:&v797 objects:v1064 count:16];
    if (v405)
    {
      uint64_t v406 = v405;
      uint64_t v407 = *(void *)v798;
      do
      {
        uint64_t v408 = 0;
        do
        {
          if (*(void *)v798 != v407) {
            objc_enumerationMutation(v404);
          }
          v409 = [*(id *)(*((void *)&v797 + 1) + 8 * v408) dictionaryRepresentation];
          [v403 addObject:v409];

          ++v408;
        }
        while (v406 != v408);
        uint64_t v406 = [(NSMutableArray *)v404 countByEnumeratingWithState:&v797 objects:v1064 count:16];
      }
      while (v406);
    }

    [v3 setObject:v403 forKey:@"kCellularLteDlSccStateHistV3"];
  }
  if ([(NSMutableArray *)self->_kCellularLteRxDiversityHists count])
  {
    v410 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteRxDiversityHists, "count"));
    long long v793 = 0u;
    long long v794 = 0u;
    long long v795 = 0u;
    long long v796 = 0u;
    v411 = self->_kCellularLteRxDiversityHists;
    uint64_t v412 = [(NSMutableArray *)v411 countByEnumeratingWithState:&v793 objects:v1063 count:16];
    if (v412)
    {
      uint64_t v413 = v412;
      uint64_t v414 = *(void *)v794;
      do
      {
        uint64_t v415 = 0;
        do
        {
          if (*(void *)v794 != v414) {
            objc_enumerationMutation(v411);
          }
          v416 = [*(id *)(*((void *)&v793 + 1) + 8 * v415) dictionaryRepresentation];
          [v410 addObject:v416];

          ++v415;
        }
        while (v413 != v415);
        uint64_t v413 = [(NSMutableArray *)v411 countByEnumeratingWithState:&v793 objects:v1063 count:16];
      }
      while (v413);
    }

    [v3 setObject:v410 forKey:@"kCellularLteRxDiversityHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLtePdcchStateHists count])
  {
    v417 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLtePdcchStateHists, "count"));
    long long v789 = 0u;
    long long v790 = 0u;
    long long v791 = 0u;
    long long v792 = 0u;
    v418 = self->_kCellularLtePdcchStateHists;
    uint64_t v419 = [(NSMutableArray *)v418 countByEnumeratingWithState:&v789 objects:v1062 count:16];
    if (v419)
    {
      uint64_t v420 = v419;
      uint64_t v421 = *(void *)v790;
      do
      {
        uint64_t v422 = 0;
        do
        {
          if (*(void *)v790 != v421) {
            objc_enumerationMutation(v418);
          }
          v423 = [*(id *)(*((void *)&v789 + 1) + 8 * v422) dictionaryRepresentation];
          [v417 addObject:v423];

          ++v422;
        }
        while (v420 != v422);
        uint64_t v420 = [(NSMutableArray *)v418 countByEnumeratingWithState:&v789 objects:v1062 count:16];
      }
      while (v420);
    }

    [v3 setObject:v417 forKey:@"kCellularLtePdcchStateHist"];
  }
  if ([(NSMutableArray *)self->_kCellularLteRrcStates count])
  {
    v424 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteRrcStates, "count"));
    long long v785 = 0u;
    long long v786 = 0u;
    long long v787 = 0u;
    long long v788 = 0u;
    v425 = self->_kCellularLteRrcStates;
    uint64_t v426 = [(NSMutableArray *)v425 countByEnumeratingWithState:&v785 objects:v1061 count:16];
    if (v426)
    {
      uint64_t v427 = v426;
      uint64_t v428 = *(void *)v786;
      do
      {
        uint64_t v429 = 0;
        do
        {
          if (*(void *)v786 != v428) {
            objc_enumerationMutation(v425);
          }
          v430 = [*(id *)(*((void *)&v785 + 1) + 8 * v429) dictionaryRepresentation];
          [v424 addObject:v430];

          ++v429;
        }
        while (v427 != v429);
        uint64_t v427 = [(NSMutableArray *)v425 countByEnumeratingWithState:&v785 objects:v1061 count:16];
      }
      while (v427);
    }

    [v3 setObject:v424 forKey:@"kCellularLteRrcState"];
  }
  if ([(NSMutableArray *)self->_kCellularLtePagingCycles count])
  {
    v431 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLtePagingCycles, "count"));
    long long v781 = 0u;
    long long v782 = 0u;
    long long v783 = 0u;
    long long v784 = 0u;
    v432 = self->_kCellularLtePagingCycles;
    uint64_t v433 = [(NSMutableArray *)v432 countByEnumeratingWithState:&v781 objects:v1060 count:16];
    if (v433)
    {
      uint64_t v434 = v433;
      uint64_t v435 = *(void *)v782;
      do
      {
        uint64_t v436 = 0;
        do
        {
          if (*(void *)v782 != v435) {
            objc_enumerationMutation(v432);
          }
          v437 = [*(id *)(*((void *)&v781 + 1) + 8 * v436) dictionaryRepresentation];
          [v431 addObject:v437];

          ++v436;
        }
        while (v434 != v436);
        uint64_t v434 = [(NSMutableArray *)v432 countByEnumeratingWithState:&v781 objects:v1060 count:16];
      }
      while (v434);
    }

    [v3 setObject:v431 forKey:@"kCellularLtePagingCycle"];
  }
  if ([(NSMutableArray *)self->_kCellularLteCdrxConfigs count])
  {
    v438 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteCdrxConfigs, "count"));
    long long v777 = 0u;
    long long v778 = 0u;
    long long v779 = 0u;
    long long v780 = 0u;
    v439 = self->_kCellularLteCdrxConfigs;
    uint64_t v440 = [(NSMutableArray *)v439 countByEnumeratingWithState:&v777 objects:v1059 count:16];
    if (v440)
    {
      uint64_t v441 = v440;
      uint64_t v442 = *(void *)v778;
      do
      {
        uint64_t v443 = 0;
        do
        {
          if (*(void *)v778 != v442) {
            objc_enumerationMutation(v439);
          }
          v444 = [*(id *)(*((void *)&v777 + 1) + 8 * v443) dictionaryRepresentation];
          [v438 addObject:v444];

          ++v443;
        }
        while (v441 != v443);
        uint64_t v441 = [(NSMutableArray *)v439 countByEnumeratingWithState:&v777 objects:v1059 count:16];
      }
      while (v441);
    }

    [v3 setObject:v438 forKey:@"kCellularLteCdrxConfig"];
  }
  if ([(NSMutableArray *)self->_kCellularLteRadioLinkFailures count])
  {
    v445 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLteRadioLinkFailures, "count"));
    long long v773 = 0u;
    long long v774 = 0u;
    long long v775 = 0u;
    long long v776 = 0u;
    v446 = self->_kCellularLteRadioLinkFailures;
    uint64_t v447 = [(NSMutableArray *)v446 countByEnumeratingWithState:&v773 objects:v1058 count:16];
    if (v447)
    {
      uint64_t v448 = v447;
      uint64_t v449 = *(void *)v774;
      do
      {
        uint64_t v450 = 0;
        do
        {
          if (*(void *)v774 != v449) {
            objc_enumerationMutation(v446);
          }
          v451 = [*(id *)(*((void *)&v773 + 1) + 8 * v450) dictionaryRepresentation];
          [v445 addObject:v451];

          ++v450;
        }
        while (v448 != v450);
        uint64_t v448 = [(NSMutableArray *)v446 countByEnumeratingWithState:&v773 objects:v1058 count:16];
      }
      while (v448);
    }

    [v3 setObject:v445 forKey:@"kCellularLteRadioLinkFailure"];
  }
  if ([(NSMutableArray *)self->_kCellularLtePdcchStateStats count])
  {
    v452 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLtePdcchStateStats, "count"));
    long long v769 = 0u;
    long long v770 = 0u;
    long long v771 = 0u;
    long long v772 = 0u;
    v453 = self->_kCellularLtePdcchStateStats;
    uint64_t v454 = [(NSMutableArray *)v453 countByEnumeratingWithState:&v769 objects:v1057 count:16];
    if (v454)
    {
      uint64_t v455 = v454;
      uint64_t v456 = *(void *)v770;
      do
      {
        uint64_t v457 = 0;
        do
        {
          if (*(void *)v770 != v456) {
            objc_enumerationMutation(v453);
          }
          v458 = [*(id *)(*((void *)&v769 + 1) + 8 * v457) dictionaryRepresentation];
          [v452 addObject:v458];

          ++v457;
        }
        while (v455 != v457);
        uint64_t v455 = [(NSMutableArray *)v453 countByEnumeratingWithState:&v769 objects:v1057 count:16];
      }
      while (v455);
    }

    [v3 setObject:v452 forKey:@"kCellularLtePdcchStateStats"];
  }
  if ([(NSMutableArray *)self->_kCellularLqmStateChanges count])
  {
    v459 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularLqmStateChanges, "count"));
    long long v765 = 0u;
    long long v766 = 0u;
    long long v767 = 0u;
    long long v768 = 0u;
    v460 = self->_kCellularLqmStateChanges;
    uint64_t v461 = [(NSMutableArray *)v460 countByEnumeratingWithState:&v765 objects:v1056 count:16];
    if (v461)
    {
      uint64_t v462 = v461;
      uint64_t v463 = *(void *)v766;
      do
      {
        uint64_t v464 = 0;
        do
        {
          if (*(void *)v766 != v463) {
            objc_enumerationMutation(v460);
          }
          v465 = [*(id *)(*((void *)&v765 + 1) + 8 * v464) dictionaryRepresentation];
          [v459 addObject:v465];

          ++v464;
        }
        while (v462 != v464);
        uint64_t v462 = [(NSMutableArray *)v460 countByEnumeratingWithState:&v765 objects:v1056 count:16];
      }
      while (v462);
    }

    [v3 setObject:v459 forKey:@"kCellularLqmStateChange"];
  }
  if ([(NSMutableArray *)self->_kCellularServiceLosts count])
  {
    v466 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularServiceLosts, "count"));
    long long v761 = 0u;
    long long v762 = 0u;
    long long v763 = 0u;
    long long v764 = 0u;
    v467 = self->_kCellularServiceLosts;
    uint64_t v468 = [(NSMutableArray *)v467 countByEnumeratingWithState:&v761 objects:v1055 count:16];
    if (v468)
    {
      uint64_t v469 = v468;
      uint64_t v470 = *(void *)v762;
      do
      {
        uint64_t v471 = 0;
        do
        {
          if (*(void *)v762 != v470) {
            objc_enumerationMutation(v467);
          }
          v472 = [*(id *)(*((void *)&v761 + 1) + 8 * v471) dictionaryRepresentation];
          [v466 addObject:v472];

          ++v471;
        }
        while (v469 != v471);
        uint64_t v469 = [(NSMutableArray *)v467 countByEnumeratingWithState:&v761 objects:v1055 count:16];
      }
      while (v469);
    }

    [v3 setObject:v466 forKey:@"kCellularServiceLost"];
  }
  if ([(NSMutableArray *)self->_kCellularProtocolStackStateHists count])
  {
    v473 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackStateHists, "count"));
    long long v757 = 0u;
    long long v758 = 0u;
    long long v759 = 0u;
    long long v760 = 0u;
    v474 = self->_kCellularProtocolStackStateHists;
    uint64_t v475 = [(NSMutableArray *)v474 countByEnumeratingWithState:&v757 objects:v1054 count:16];
    if (v475)
    {
      uint64_t v476 = v475;
      uint64_t v477 = *(void *)v758;
      do
      {
        uint64_t v478 = 0;
        do
        {
          if (*(void *)v758 != v477) {
            objc_enumerationMutation(v474);
          }
          v479 = [*(id *)(*((void *)&v757 + 1) + 8 * v478) dictionaryRepresentation];
          [v473 addObject:v479];

          ++v478;
        }
        while (v476 != v478);
        uint64_t v476 = [(NSMutableArray *)v474 countByEnumeratingWithState:&v757 objects:v1054 count:16];
      }
      while (v476);
    }

    [v3 setObject:v473 forKey:@"kCellularProtocolStackStateHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCellPlmnSearchCounts count])
  {
    v480 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCellPlmnSearchCounts, "count"));
    long long v753 = 0u;
    long long v754 = 0u;
    long long v755 = 0u;
    long long v756 = 0u;
    v481 = self->_kCellularCellPlmnSearchCounts;
    uint64_t v482 = [(NSMutableArray *)v481 countByEnumeratingWithState:&v753 objects:v1053 count:16];
    if (v482)
    {
      uint64_t v483 = v482;
      uint64_t v484 = *(void *)v754;
      do
      {
        uint64_t v485 = 0;
        do
        {
          if (*(void *)v754 != v484) {
            objc_enumerationMutation(v481);
          }
          v486 = [*(id *)(*((void *)&v753 + 1) + 8 * v485) dictionaryRepresentation];
          [v480 addObject:v486];

          ++v485;
        }
        while (v483 != v485);
        uint64_t v483 = [(NSMutableArray *)v481 countByEnumeratingWithState:&v753 objects:v1053 count:16];
      }
      while (v483);
    }

    [v3 setObject:v480 forKey:@"kCellularCellPlmnSearchCount"];
  }
  if ([(NSMutableArray *)self->_kCellularCellPlmnSearchHists count])
  {
    v487 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCellPlmnSearchHists, "count"));
    long long v749 = 0u;
    long long v750 = 0u;
    long long v751 = 0u;
    long long v752 = 0u;
    v488 = self->_kCellularCellPlmnSearchHists;
    uint64_t v489 = [(NSMutableArray *)v488 countByEnumeratingWithState:&v749 objects:v1052 count:16];
    if (v489)
    {
      uint64_t v490 = v489;
      uint64_t v491 = *(void *)v750;
      do
      {
        uint64_t v492 = 0;
        do
        {
          if (*(void *)v750 != v491) {
            objc_enumerationMutation(v488);
          }
          v493 = [*(id *)(*((void *)&v749 + 1) + 8 * v492) dictionaryRepresentation];
          [v487 addObject:v493];

          ++v492;
        }
        while (v490 != v492);
        uint64_t v490 = [(NSMutableArray *)v488 countByEnumeratingWithState:&v749 objects:v1052 count:16];
      }
      while (v490);
    }

    [v3 setObject:v487 forKey:@"kCellularCellPlmnSearchHist"];
  }
  if ([(NSMutableArray *)self->_kCellularProtocolStackPowerStates count])
  {
    v494 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackPowerStates, "count"));
    long long v745 = 0u;
    long long v746 = 0u;
    long long v747 = 0u;
    long long v748 = 0u;
    v495 = self->_kCellularProtocolStackPowerStates;
    uint64_t v496 = [(NSMutableArray *)v495 countByEnumeratingWithState:&v745 objects:v1051 count:16];
    if (v496)
    {
      uint64_t v497 = v496;
      uint64_t v498 = *(void *)v746;
      do
      {
        uint64_t v499 = 0;
        do
        {
          if (*(void *)v746 != v498) {
            objc_enumerationMutation(v495);
          }
          v500 = [*(id *)(*((void *)&v745 + 1) + 8 * v499) dictionaryRepresentation];
          [v494 addObject:v500];

          ++v499;
        }
        while (v497 != v499);
        uint64_t v497 = [(NSMutableArray *)v495 countByEnumeratingWithState:&v745 objects:v1051 count:16];
      }
      while (v497);
    }

    [v3 setObject:v494 forKey:@"kCellularProtocolStackPowerState"];
  }
  if ([(NSMutableArray *)self->_kCellularDownlinkIpPacketFilterStatus count])
  {
    v501 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularDownlinkIpPacketFilterStatus, "count"));
    long long v741 = 0u;
    long long v742 = 0u;
    long long v743 = 0u;
    long long v744 = 0u;
    v502 = self->_kCellularDownlinkIpPacketFilterStatus;
    uint64_t v503 = [(NSMutableArray *)v502 countByEnumeratingWithState:&v741 objects:v1050 count:16];
    if (v503)
    {
      uint64_t v504 = v503;
      uint64_t v505 = *(void *)v742;
      do
      {
        uint64_t v506 = 0;
        do
        {
          if (*(void *)v742 != v505) {
            objc_enumerationMutation(v502);
          }
          v507 = [*(id *)(*((void *)&v741 + 1) + 8 * v506) dictionaryRepresentation];
          [v501 addObject:v507];

          ++v506;
        }
        while (v504 != v506);
        uint64_t v504 = [(NSMutableArray *)v502 countByEnumeratingWithState:&v741 objects:v1050 count:16];
      }
      while (v504);
    }

    [v3 setObject:v501 forKey:@"kCellularDownlinkIpPacketFilterStatus"];
  }
  if ([(NSMutableArray *)self->_kCellularDownlinkIpPacketDiscardeds count])
  {
    v508 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularDownlinkIpPacketDiscardeds, "count"));
    long long v737 = 0u;
    long long v738 = 0u;
    long long v739 = 0u;
    long long v740 = 0u;
    v509 = self->_kCellularDownlinkIpPacketDiscardeds;
    uint64_t v510 = [(NSMutableArray *)v509 countByEnumeratingWithState:&v737 objects:v1049 count:16];
    if (v510)
    {
      uint64_t v511 = v510;
      uint64_t v512 = *(void *)v738;
      do
      {
        uint64_t v513 = 0;
        do
        {
          if (*(void *)v738 != v512) {
            objc_enumerationMutation(v509);
          }
          v514 = [*(id *)(*((void *)&v737 + 1) + 8 * v513) dictionaryRepresentation];
          [v508 addObject:v514];

          ++v513;
        }
        while (v511 != v513);
        uint64_t v511 = [(NSMutableArray *)v509 countByEnumeratingWithState:&v737 objects:v1049 count:16];
      }
      while (v511);
    }

    [v3 setObject:v508 forKey:@"kCellularDownlinkIpPacketDiscarded"];
  }
  if ([(NSMutableArray *)self->_kCellularServingCellRfBandHists count])
  {
    v515 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularServingCellRfBandHists, "count"));
    long long v733 = 0u;
    long long v734 = 0u;
    long long v735 = 0u;
    long long v736 = 0u;
    v516 = self->_kCellularServingCellRfBandHists;
    uint64_t v517 = [(NSMutableArray *)v516 countByEnumeratingWithState:&v733 objects:v1048 count:16];
    if (v517)
    {
      uint64_t v518 = v517;
      uint64_t v519 = *(void *)v734;
      do
      {
        uint64_t v520 = 0;
        do
        {
          if (*(void *)v734 != v519) {
            objc_enumerationMutation(v516);
          }
          v521 = [*(id *)(*((void *)&v733 + 1) + 8 * v520) dictionaryRepresentation];
          [v515 addObject:v521];

          ++v520;
        }
        while (v518 != v520);
        uint64_t v518 = [(NSMutableArray *)v516 countByEnumeratingWithState:&v733 objects:v1048 count:16];
      }
      while (v518);
    }

    [v3 setObject:v515 forKey:@"kCellularServingCellRfBandHist"];
  }
  if ([(NSMutableArray *)self->_kCellularProtocolStackStateHist2s count])
  {
    v522 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackStateHist2s, "count"));
    long long v729 = 0u;
    long long v730 = 0u;
    long long v731 = 0u;
    long long v732 = 0u;
    v523 = self->_kCellularProtocolStackStateHist2s;
    uint64_t v524 = [(NSMutableArray *)v523 countByEnumeratingWithState:&v729 objects:v1047 count:16];
    if (v524)
    {
      uint64_t v525 = v524;
      uint64_t v526 = *(void *)v730;
      do
      {
        uint64_t v527 = 0;
        do
        {
          if (*(void *)v730 != v526) {
            objc_enumerationMutation(v523);
          }
          v528 = [*(id *)(*((void *)&v729 + 1) + 8 * v527) dictionaryRepresentation];
          [v522 addObject:v528];

          ++v527;
        }
        while (v525 != v527);
        uint64_t v525 = [(NSMutableArray *)v523 countByEnumeratingWithState:&v729 objects:v1047 count:16];
      }
      while (v525);
    }

    [v3 setObject:v522 forKey:@"kCellularProtocolStackStateHist2"];
  }
  if ([(NSMutableArray *)self->_kCellularProtocolStackStates count])
  {
    v529 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularProtocolStackStates, "count"));
    long long v725 = 0u;
    long long v726 = 0u;
    long long v727 = 0u;
    long long v728 = 0u;
    v530 = self->_kCellularProtocolStackStates;
    uint64_t v531 = [(NSMutableArray *)v530 countByEnumeratingWithState:&v725 objects:v1046 count:16];
    if (v531)
    {
      uint64_t v532 = v531;
      uint64_t v533 = *(void *)v726;
      do
      {
        uint64_t v534 = 0;
        do
        {
          if (*(void *)v726 != v533) {
            objc_enumerationMutation(v530);
          }
          v535 = [*(id *)(*((void *)&v725 + 1) + 8 * v534) dictionaryRepresentation];
          [v529 addObject:v535];

          ++v534;
        }
        while (v532 != v534);
        uint64_t v532 = [(NSMutableArray *)v530 countByEnumeratingWithState:&v725 objects:v1046 count:16];
      }
      while (v532);
    }

    [v3 setObject:v529 forKey:@"kCellularProtocolStackState"];
  }
  if ([(NSMutableArray *)self->_kCellularCdma1XRxDiversityHists count])
  {
    v536 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XRxDiversityHists, "count"));
    long long v721 = 0u;
    long long v722 = 0u;
    long long v723 = 0u;
    long long v724 = 0u;
    v537 = self->_kCellularCdma1XRxDiversityHists;
    uint64_t v538 = [(NSMutableArray *)v537 countByEnumeratingWithState:&v721 objects:v1045 count:16];
    if (v538)
    {
      uint64_t v539 = v538;
      uint64_t v540 = *(void *)v722;
      do
      {
        uint64_t v541 = 0;
        do
        {
          if (*(void *)v722 != v540) {
            objc_enumerationMutation(v537);
          }
          v542 = [*(id *)(*((void *)&v721 + 1) + 8 * v541) dictionaryRepresentation];
          [v536 addObject:v542];

          ++v541;
        }
        while (v539 != v541);
        uint64_t v539 = [(NSMutableArray *)v537 countByEnumeratingWithState:&v721 objects:v1045 count:16];
      }
      while (v539);
    }

    [v3 setObject:v536 forKey:@"kCellularCdma1XRxDiversityHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdma1XServingCellRx0RssiHists count])
  {
    v543 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XServingCellRx0RssiHists, "count"));
    long long v717 = 0u;
    long long v718 = 0u;
    long long v719 = 0u;
    long long v720 = 0u;
    v544 = self->_kCellularCdma1XServingCellRx0RssiHists;
    uint64_t v545 = [(NSMutableArray *)v544 countByEnumeratingWithState:&v717 objects:v1044 count:16];
    if (v545)
    {
      uint64_t v546 = v545;
      uint64_t v547 = *(void *)v718;
      do
      {
        uint64_t v548 = 0;
        do
        {
          if (*(void *)v718 != v547) {
            objc_enumerationMutation(v544);
          }
          v549 = [*(id *)(*((void *)&v717 + 1) + 8 * v548) dictionaryRepresentation];
          [v543 addObject:v549];

          ++v548;
        }
        while (v546 != v548);
        uint64_t v546 = [(NSMutableArray *)v544 countByEnumeratingWithState:&v717 objects:v1044 count:16];
      }
      while (v546);
    }

    [v3 setObject:v543 forKey:@"kCellularCdma1XServingCellRx0RssiHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdma1XServingCellRx1RssiHists count])
  {
    v550 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XServingCellRx1RssiHists, "count"));
    long long v713 = 0u;
    long long v714 = 0u;
    long long v715 = 0u;
    long long v716 = 0u;
    v551 = self->_kCellularCdma1XServingCellRx1RssiHists;
    uint64_t v552 = [(NSMutableArray *)v551 countByEnumeratingWithState:&v713 objects:v1043 count:16];
    if (v552)
    {
      uint64_t v553 = v552;
      uint64_t v554 = *(void *)v714;
      do
      {
        uint64_t v555 = 0;
        do
        {
          if (*(void *)v714 != v554) {
            objc_enumerationMutation(v551);
          }
          v556 = [*(id *)(*((void *)&v713 + 1) + 8 * v555) dictionaryRepresentation];
          [v550 addObject:v556];

          ++v555;
        }
        while (v553 != v555);
        uint64_t v553 = [(NSMutableArray *)v551 countByEnumeratingWithState:&v713 objects:v1043 count:16];
      }
      while (v553);
    }

    [v3 setObject:v550 forKey:@"kCellularCdma1XServingCellRx1RssiHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdma1XServingCellRx0EcIoHists count])
  {
    v557 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XServingCellRx0EcIoHists, "count"));
    long long v709 = 0u;
    long long v710 = 0u;
    long long v711 = 0u;
    long long v712 = 0u;
    v558 = self->_kCellularCdma1XServingCellRx0EcIoHists;
    uint64_t v559 = [(NSMutableArray *)v558 countByEnumeratingWithState:&v709 objects:v1042 count:16];
    if (v559)
    {
      uint64_t v560 = v559;
      uint64_t v561 = *(void *)v710;
      do
      {
        uint64_t v562 = 0;
        do
        {
          if (*(void *)v710 != v561) {
            objc_enumerationMutation(v558);
          }
          v563 = [*(id *)(*((void *)&v709 + 1) + 8 * v562) dictionaryRepresentation];
          [v557 addObject:v563];

          ++v562;
        }
        while (v560 != v562);
        uint64_t v560 = [(NSMutableArray *)v558 countByEnumeratingWithState:&v709 objects:v1042 count:16];
      }
      while (v560);
    }

    [v3 setObject:v557 forKey:@"kCellularCdma1XServingCellRx0EcIoHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdma1XServingCellRx1EcIoHists count])
  {
    v564 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XServingCellRx1EcIoHists, "count"));
    long long v705 = 0u;
    long long v706 = 0u;
    long long v707 = 0u;
    long long v708 = 0u;
    v565 = self->_kCellularCdma1XServingCellRx1EcIoHists;
    uint64_t v566 = [(NSMutableArray *)v565 countByEnumeratingWithState:&v705 objects:v1041 count:16];
    if (v566)
    {
      uint64_t v567 = v566;
      uint64_t v568 = *(void *)v706;
      do
      {
        uint64_t v569 = 0;
        do
        {
          if (*(void *)v706 != v568) {
            objc_enumerationMutation(v565);
          }
          v570 = [*(id *)(*((void *)&v705 + 1) + 8 * v569) dictionaryRepresentation];
          [v564 addObject:v570];

          ++v569;
        }
        while (v567 != v569);
        uint64_t v567 = [(NSMutableArray *)v565 countByEnumeratingWithState:&v705 objects:v1041 count:16];
      }
      while (v567);
    }

    [v3 setObject:v564 forKey:@"kCellularCdma1XServingCellRx1EcIoHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdma1XTxPowerHists count])
  {
    v571 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XTxPowerHists, "count"));
    long long v701 = 0u;
    long long v702 = 0u;
    long long v703 = 0u;
    long long v704 = 0u;
    v572 = self->_kCellularCdma1XTxPowerHists;
    uint64_t v573 = [(NSMutableArray *)v572 countByEnumeratingWithState:&v701 objects:v1040 count:16];
    if (v573)
    {
      uint64_t v574 = v573;
      uint64_t v575 = *(void *)v702;
      do
      {
        uint64_t v576 = 0;
        do
        {
          if (*(void *)v702 != v575) {
            objc_enumerationMutation(v572);
          }
          v577 = [*(id *)(*((void *)&v701 + 1) + 8 * v576) dictionaryRepresentation];
          [v571 addObject:v577];

          ++v576;
        }
        while (v574 != v576);
        uint64_t v574 = [(NSMutableArray *)v572 countByEnumeratingWithState:&v701 objects:v1040 count:16];
      }
      while (v574);
    }

    [v3 setObject:v571 forKey:@"kCellularCdma1XTxPowerHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdma1XProtocolStackStateHists count])
  {
    v578 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XProtocolStackStateHists, "count"));
    long long v697 = 0u;
    long long v698 = 0u;
    long long v699 = 0u;
    long long v700 = 0u;
    v579 = self->_kCellularCdma1XProtocolStackStateHists;
    uint64_t v580 = [(NSMutableArray *)v579 countByEnumeratingWithState:&v697 objects:v1039 count:16];
    if (v580)
    {
      uint64_t v581 = v580;
      uint64_t v582 = *(void *)v698;
      do
      {
        uint64_t v583 = 0;
        do
        {
          if (*(void *)v698 != v582) {
            objc_enumerationMutation(v579);
          }
          v584 = [*(id *)(*((void *)&v697 + 1) + 8 * v583) dictionaryRepresentation];
          [v578 addObject:v584];

          ++v583;
        }
        while (v581 != v583);
        uint64_t v581 = [(NSMutableArray *)v579 countByEnumeratingWithState:&v697 objects:v1039 count:16];
      }
      while (v581);
    }

    [v3 setObject:v578 forKey:@"kCellularCdma1XProtocolStackStateHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdma1XConnectionHists count])
  {
    v585 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XConnectionHists, "count"));
    long long v693 = 0u;
    long long v694 = 0u;
    long long v695 = 0u;
    long long v696 = 0u;
    v586 = self->_kCellularCdma1XConnectionHists;
    uint64_t v587 = [(NSMutableArray *)v586 countByEnumeratingWithState:&v693 objects:v1038 count:16];
    if (v587)
    {
      uint64_t v588 = v587;
      uint64_t v589 = *(void *)v694;
      do
      {
        uint64_t v590 = 0;
        do
        {
          if (*(void *)v694 != v589) {
            objc_enumerationMutation(v586);
          }
          v591 = [*(id *)(*((void *)&v693 + 1) + 8 * v590) dictionaryRepresentation];
          [v585 addObject:v591];

          ++v590;
        }
        while (v588 != v590);
        uint64_t v588 = [(NSMutableArray *)v586 countByEnumeratingWithState:&v693 objects:v1038 count:16];
      }
      while (v588);
    }

    [v3 setObject:v585 forKey:@"kCellularCdma1XConnectionHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdma1XRrStates count])
  {
    v592 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdma1XRrStates, "count"));
    long long v689 = 0u;
    long long v690 = 0u;
    long long v691 = 0u;
    long long v692 = 0u;
    v593 = self->_kCellularCdma1XRrStates;
    uint64_t v594 = [(NSMutableArray *)v593 countByEnumeratingWithState:&v689 objects:v1037 count:16];
    if (v594)
    {
      uint64_t v595 = v594;
      uint64_t v596 = *(void *)v690;
      do
      {
        uint64_t v597 = 0;
        do
        {
          if (*(void *)v690 != v596) {
            objc_enumerationMutation(v593);
          }
          v598 = [*(id *)(*((void *)&v689 + 1) + 8 * v597) dictionaryRepresentation];
          [v592 addObject:v598];

          ++v597;
        }
        while (v595 != v597);
        uint64_t v595 = [(NSMutableArray *)v593 countByEnumeratingWithState:&v689 objects:v1037 count:16];
      }
      while (v595);
    }

    [v3 setObject:v592 forKey:@"kCellularCdma1XRrState"];
  }
  if ([(NSMutableArray *)self->_kCellularCdmaEvdoRxDiversityHists count])
  {
    v599 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoRxDiversityHists, "count"));
    long long v685 = 0u;
    long long v686 = 0u;
    long long v687 = 0u;
    long long v688 = 0u;
    v600 = self->_kCellularCdmaEvdoRxDiversityHists;
    uint64_t v601 = [(NSMutableArray *)v600 countByEnumeratingWithState:&v685 objects:v1036 count:16];
    if (v601)
    {
      uint64_t v602 = v601;
      uint64_t v603 = *(void *)v686;
      do
      {
        uint64_t v604 = 0;
        do
        {
          if (*(void *)v686 != v603) {
            objc_enumerationMutation(v600);
          }
          v605 = [*(id *)(*((void *)&v685 + 1) + 8 * v604) dictionaryRepresentation];
          [v599 addObject:v605];

          ++v604;
        }
        while (v602 != v604);
        uint64_t v602 = [(NSMutableArray *)v600 countByEnumeratingWithState:&v685 objects:v1036 count:16];
      }
      while (v602);
    }

    [v3 setObject:v599 forKey:@"kCellularCdmaEvdoRxDiversityHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx0RssiHists count])
  {
    v606 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx0RssiHists, "count"));
    long long v681 = 0u;
    long long v682 = 0u;
    long long v683 = 0u;
    long long v684 = 0u;
    v607 = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
    uint64_t v608 = [(NSMutableArray *)v607 countByEnumeratingWithState:&v681 objects:v1035 count:16];
    if (v608)
    {
      uint64_t v609 = v608;
      uint64_t v610 = *(void *)v682;
      do
      {
        uint64_t v611 = 0;
        do
        {
          if (*(void *)v682 != v610) {
            objc_enumerationMutation(v607);
          }
          v612 = [*(id *)(*((void *)&v681 + 1) + 8 * v611) dictionaryRepresentation];
          [v606 addObject:v612];

          ++v611;
        }
        while (v609 != v611);
        uint64_t v609 = [(NSMutableArray *)v607 countByEnumeratingWithState:&v681 objects:v1035 count:16];
      }
      while (v609);
    }

    [v3 setObject:v606 forKey:@"kCellularCdmaEvdoServingCellRx0RssiHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx1RssiHists count])
  {
    v613 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx1RssiHists, "count"));
    long long v677 = 0u;
    long long v678 = 0u;
    long long v679 = 0u;
    long long v680 = 0u;
    v614 = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
    uint64_t v615 = [(NSMutableArray *)v614 countByEnumeratingWithState:&v677 objects:v1034 count:16];
    if (v615)
    {
      uint64_t v616 = v615;
      uint64_t v617 = *(void *)v678;
      do
      {
        uint64_t v618 = 0;
        do
        {
          if (*(void *)v678 != v617) {
            objc_enumerationMutation(v614);
          }
          v619 = [*(id *)(*((void *)&v677 + 1) + 8 * v618) dictionaryRepresentation];
          [v613 addObject:v619];

          ++v618;
        }
        while (v616 != v618);
        uint64_t v616 = [(NSMutableArray *)v614 countByEnumeratingWithState:&v677 objects:v1034 count:16];
      }
      while (v616);
    }

    [v3 setObject:v613 forKey:@"kCellularCdmaEvdoServingCellRx1RssiHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx0EcIoHists count])
  {
    v620 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx0EcIoHists, "count"));
    long long v673 = 0u;
    long long v674 = 0u;
    long long v675 = 0u;
    long long v676 = 0u;
    v621 = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
    uint64_t v622 = [(NSMutableArray *)v621 countByEnumeratingWithState:&v673 objects:v1033 count:16];
    if (v622)
    {
      uint64_t v623 = v622;
      uint64_t v624 = *(void *)v674;
      do
      {
        uint64_t v625 = 0;
        do
        {
          if (*(void *)v674 != v624) {
            objc_enumerationMutation(v621);
          }
          v626 = [*(id *)(*((void *)&v673 + 1) + 8 * v625) dictionaryRepresentation];
          [v620 addObject:v626];

          ++v625;
        }
        while (v623 != v625);
        uint64_t v623 = [(NSMutableArray *)v621 countByEnumeratingWithState:&v673 objects:v1033 count:16];
      }
      while (v623);
    }

    [v3 setObject:v620 forKey:@"kCellularCdmaEvdoServingCellRx0EcIoHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx1EcIoHists count])
  {
    v627 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoServingCellRx1EcIoHists, "count"));
    long long v669 = 0u;
    long long v670 = 0u;
    long long v671 = 0u;
    long long v672 = 0u;
    v628 = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
    uint64_t v629 = [(NSMutableArray *)v628 countByEnumeratingWithState:&v669 objects:v1032 count:16];
    if (v629)
    {
      uint64_t v630 = v629;
      uint64_t v631 = *(void *)v670;
      do
      {
        uint64_t v632 = 0;
        do
        {
          if (*(void *)v670 != v631) {
            objc_enumerationMutation(v628);
          }
          v633 = [*(id *)(*((void *)&v669 + 1) + 8 * v632) dictionaryRepresentation];
          [v627 addObject:v633];

          ++v632;
        }
        while (v630 != v632);
        uint64_t v630 = [(NSMutableArray *)v628 countByEnumeratingWithState:&v669 objects:v1032 count:16];
      }
      while (v630);
    }

    [v3 setObject:v627 forKey:@"kCellularCdmaEvdoServingCellRx1EcIoHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdmaEvdoTxPowerHists count])
  {
    v634 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoTxPowerHists, "count"));
    long long v665 = 0u;
    long long v666 = 0u;
    long long v667 = 0u;
    long long v668 = 0u;
    v635 = self->_kCellularCdmaEvdoTxPowerHists;
    uint64_t v636 = [(NSMutableArray *)v635 countByEnumeratingWithState:&v665 objects:v1031 count:16];
    if (v636)
    {
      uint64_t v637 = v636;
      uint64_t v638 = *(void *)v666;
      do
      {
        uint64_t v639 = 0;
        do
        {
          if (*(void *)v666 != v638) {
            objc_enumerationMutation(v635);
          }
          v640 = [*(id *)(*((void *)&v665 + 1) + 8 * v639) dictionaryRepresentation];
          [v634 addObject:v640];

          ++v639;
        }
        while (v637 != v639);
        uint64_t v637 = [(NSMutableArray *)v635 countByEnumeratingWithState:&v665 objects:v1031 count:16];
      }
      while (v637);
    }

    [v3 setObject:v634 forKey:@"kCellularCdmaEvdoTxPowerHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdmaEvdoProtocolStackStateHists count])
  {
    v641 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoProtocolStackStateHists, "count"));
    long long v661 = 0u;
    long long v662 = 0u;
    long long v663 = 0u;
    long long v664 = 0u;
    v642 = self->_kCellularCdmaEvdoProtocolStackStateHists;
    uint64_t v643 = [(NSMutableArray *)v642 countByEnumeratingWithState:&v661 objects:v1030 count:16];
    if (v643)
    {
      uint64_t v644 = v643;
      uint64_t v645 = *(void *)v662;
      do
      {
        uint64_t v646 = 0;
        do
        {
          if (*(void *)v662 != v645) {
            objc_enumerationMutation(v642);
          }
          v647 = [*(id *)(*((void *)&v661 + 1) + 8 * v646) dictionaryRepresentation];
          [v641 addObject:v647];

          ++v646;
        }
        while (v644 != v646);
        uint64_t v644 = [(NSMutableArray *)v642 countByEnumeratingWithState:&v661 objects:v1030 count:16];
      }
      while (v644);
    }

    [v3 setObject:v641 forKey:@"kCellularCdmaEvdoProtocolStackStateHist"];
  }
  if ([(NSMutableArray *)self->_kCellularCdmaEvdoRrStates count])
  {
    v648 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_kCellularCdmaEvdoRrStates, "count"));
    long long v657 = 0u;
    long long v658 = 0u;
    long long v659 = 0u;
    long long v660 = 0u;
    v649 = self->_kCellularCdmaEvdoRrStates;
    uint64_t v650 = [(NSMutableArray *)v649 countByEnumeratingWithState:&v657 objects:v1029 count:16];
    if (v650)
    {
      uint64_t v651 = v650;
      uint64_t v652 = *(void *)v658;
      do
      {
        uint64_t v653 = 0;
        do
        {
          if (*(void *)v658 != v652) {
            objc_enumerationMutation(v649);
          }
          v654 = objc_msgSend(*(id *)(*((void *)&v657 + 1) + 8 * v653), "dictionaryRepresentation", (void)v657);
          [v648 addObject:v654];

          ++v653;
        }
        while (v651 != v653);
        uint64_t v651 = [(NSMutableArray *)v649 countByEnumeratingWithState:&v657 objects:v1029 count:16];
      }
      while (v651);
    }

    [v3 setObject:v648 forKey:@"kCellularCdmaEvdoRrState"];
  }
  id v655 = v3;

  return v655;
}

- (BOOL)readFrom:(id)a3
{
  return PowerlogMetricLogReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v935 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v838 = 0u;
  long long v839 = 0u;
  long long v840 = 0u;
  long long v841 = 0u;
  v5 = self->_kCellularPerClientProfileTriggerCounts;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v838 objects:v934 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v839;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v839 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v838 objects:v934 count:16];
    }
    while (v7);
  }

  long long v837 = 0u;
  long long v836 = 0u;
  long long v835 = 0u;
  long long v834 = 0u;
  v10 = self->_kCellularProtocolStackCpuStats;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v834 objects:v933 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v835;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v835 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v834 objects:v933 count:16];
    }
    while (v12);
  }

  long long v833 = 0u;
  long long v832 = 0u;
  long long v831 = 0u;
  long long v830 = 0u;
  uint64_t v15 = self->_kCellularPeripheralStats;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v830 objects:v932 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v831;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v831 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v830 objects:v932 count:16];
    }
    while (v17);
  }

  long long v829 = 0u;
  long long v828 = 0u;
  long long v827 = 0u;
  long long v826 = 0u;
  uint64_t v20 = self->_kCellularDvfsStats;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v826 objects:v931 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v827;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v827 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v826 objects:v931 count:16];
    }
    while (v22);
  }

  long long v825 = 0u;
  long long v824 = 0u;
  long long v823 = 0u;
  long long v822 = 0u;
  v25 = self->_kCellularLteWcdmaGsmHwStats;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v822 objects:v930 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v823;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v823 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v822 objects:v930 count:16];
    }
    while (v27);
  }

  long long v821 = 0u;
  long long v820 = 0u;
  long long v819 = 0u;
  long long v818 = 0u;
  uint64_t v30 = self->_kCellularLteTdsGsmHwStats;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v818 objects:v929 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v819;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v819 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v818 objects:v929 count:16];
    }
    while (v32);
  }

  long long v817 = 0u;
  long long v816 = 0u;
  long long v815 = 0u;
  long long v814 = 0u;
  uint64_t v35 = self->_kCellularPmuAverageCurrents;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v814 objects:v928 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v815;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v815 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v814 objects:v928 count:16];
    }
    while (v37);
  }

  long long v813 = 0u;
  long long v812 = 0u;
  long long v811 = 0u;
  long long v810 = 0u;
  v40 = self->_kCellularFwCoreStats;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v810 objects:v927 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v811;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v811 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v810 objects:v927 count:16];
    }
    while (v42);
  }

  long long v809 = 0u;
  long long v808 = 0u;
  long long v807 = 0u;
  long long v806 = 0u;
  v45 = self->_kCellularLteWcdmaTdsHwStats;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v806 objects:v926 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v807;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v807 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v806 objects:v926 count:16];
    }
    while (v47);
  }

  long long v805 = 0u;
  long long v804 = 0u;
  long long v803 = 0u;
  long long v802 = 0u;
  uint64_t v50 = self->_kCellularPmicHwStats;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v802 objects:v925 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v803;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v803 != v53) {
          objc_enumerationMutation(v50);
        }
        PBDataWriterWriteSubmessage();
        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v802 objects:v925 count:16];
    }
    while (v52);
  }

  long long v801 = 0u;
  long long v800 = 0u;
  long long v799 = 0u;
  long long v798 = 0u;
  uint64_t v55 = self->_kCellularTdsRrcStates;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v798 objects:v924 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v799;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v799 != v58) {
          objc_enumerationMutation(v55);
        }
        PBDataWriterWriteSubmessage();
        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v798 objects:v924 count:16];
    }
    while (v57);
  }

  long long v797 = 0u;
  long long v796 = 0u;
  long long v795 = 0u;
  long long v794 = 0u;
  v60 = self->_kCellularLteRrcStates;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v794 objects:v923 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v795;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v795 != v63) {
          objc_enumerationMutation(v60);
        }
        PBDataWriterWriteSubmessage();
        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v794 objects:v923 count:16];
    }
    while (v62);
  }

  long long v793 = 0u;
  long long v792 = 0u;
  long long v791 = 0u;
  long long v790 = 0u;
  uint64_t v65 = self->_kCellularLtePagingCycles;
  uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v790 objects:v922 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v791;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v791 != v68) {
          objc_enumerationMutation(v65);
        }
        PBDataWriterWriteSubmessage();
        ++v69;
      }
      while (v67 != v69);
      uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v790 objects:v922 count:16];
    }
    while (v67);
  }

  long long v789 = 0u;
  long long v788 = 0u;
  long long v787 = 0u;
  long long v786 = 0u;
  uint64_t v70 = self->_kCellularLteCdrxConfigs;
  uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v786 objects:v921 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v787;
    do
    {
      uint64_t v74 = 0;
      do
      {
        if (*(void *)v787 != v73) {
          objc_enumerationMutation(v70);
        }
        PBDataWriterWriteSubmessage();
        ++v74;
      }
      while (v72 != v74);
      uint64_t v72 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v786 objects:v921 count:16];
    }
    while (v72);
  }

  long long v785 = 0u;
  long long v784 = 0u;
  long long v783 = 0u;
  long long v782 = 0u;
  v75 = self->_kCellularLteRadioLinkFailures;
  uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v782 objects:v920 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v783;
    do
    {
      uint64_t v79 = 0;
      do
      {
        if (*(void *)v783 != v78) {
          objc_enumerationMutation(v75);
        }
        PBDataWriterWriteSubmessage();
        ++v79;
      }
      while (v77 != v79);
      uint64_t v77 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v782 objects:v920 count:16];
    }
    while (v77);
  }

  long long v781 = 0u;
  long long v780 = 0u;
  long long v779 = 0u;
  long long v778 = 0u;
  v80 = self->_kCellularLtePdcchStateStats;
  uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v778 objects:v919 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v779;
    do
    {
      uint64_t v84 = 0;
      do
      {
        if (*(void *)v779 != v83) {
          objc_enumerationMutation(v80);
        }
        PBDataWriterWriteSubmessage();
        ++v84;
      }
      while (v82 != v84);
      uint64_t v82 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v778 objects:v919 count:16];
    }
    while (v82);
  }

  long long v777 = 0u;
  long long v776 = 0u;
  long long v775 = 0u;
  long long v774 = 0u;
  uint64_t v85 = self->_kCellularLqmStateChanges;
  uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v774 objects:v918 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v775;
    do
    {
      uint64_t v89 = 0;
      do
      {
        if (*(void *)v775 != v88) {
          objc_enumerationMutation(v85);
        }
        PBDataWriterWriteSubmessage();
        ++v89;
      }
      while (v87 != v89);
      uint64_t v87 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v774 objects:v918 count:16];
    }
    while (v87);
  }

  long long v773 = 0u;
  long long v772 = 0u;
  long long v771 = 0u;
  long long v770 = 0u;
  uint64_t v90 = self->_kCellularServiceLosts;
  uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v770 objects:v917 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v771;
    do
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v771 != v93) {
          objc_enumerationMutation(v90);
        }
        PBDataWriterWriteSubmessage();
        ++v94;
      }
      while (v92 != v94);
      uint64_t v92 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v770 objects:v917 count:16];
    }
    while (v92);
  }

  long long v769 = 0u;
  long long v768 = 0u;
  long long v767 = 0u;
  long long v766 = 0u;
  v95 = self->_kCellularGsmServingCellRssiHists;
  uint64_t v96 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v766 objects:v916 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v767;
    do
    {
      uint64_t v99 = 0;
      do
      {
        if (*(void *)v767 != v98) {
          objc_enumerationMutation(v95);
        }
        PBDataWriterWriteSubmessage();
        ++v99;
      }
      while (v97 != v99);
      uint64_t v97 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v766 objects:v916 count:16];
    }
    while (v97);
  }

  long long v765 = 0u;
  long long v764 = 0u;
  long long v763 = 0u;
  long long v762 = 0u;
  uint64_t v100 = self->_kCellularGsmServingCellSnrHists;
  uint64_t v101 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v762 objects:v915 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v763;
    do
    {
      uint64_t v104 = 0;
      do
      {
        if (*(void *)v763 != v103) {
          objc_enumerationMutation(v100);
        }
        PBDataWriterWriteSubmessage();
        ++v104;
      }
      while (v102 != v104);
      uint64_t v102 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v762 objects:v915 count:16];
    }
    while (v102);
  }

  long long v761 = 0u;
  long long v760 = 0u;
  long long v759 = 0u;
  long long v758 = 0u;
  uint64_t v105 = self->_kCellularGsmTxPowerHists;
  uint64_t v106 = [(NSMutableArray *)v105 countByEnumeratingWithState:&v758 objects:v914 count:16];
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v759;
    do
    {
      uint64_t v109 = 0;
      do
      {
        if (*(void *)v759 != v108) {
          objc_enumerationMutation(v105);
        }
        PBDataWriterWriteSubmessage();
        ++v109;
      }
      while (v107 != v109);
      uint64_t v107 = [(NSMutableArray *)v105 countByEnumeratingWithState:&v758 objects:v914 count:16];
    }
    while (v107);
  }

  long long v757 = 0u;
  long long v756 = 0u;
  long long v755 = 0u;
  long long v754 = 0u;
  v110 = self->_kCellularGsmConnectedModeHists;
  uint64_t v111 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v754 objects:v913 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v755;
    do
    {
      uint64_t v114 = 0;
      do
      {
        if (*(void *)v755 != v113) {
          objc_enumerationMutation(v110);
        }
        PBDataWriterWriteSubmessage();
        ++v114;
      }
      while (v112 != v114);
      uint64_t v112 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v754 objects:v913 count:16];
    }
    while (v112);
  }

  long long v753 = 0u;
  long long v752 = 0u;
  long long v751 = 0u;
  long long v750 = 0u;
  v115 = self->_kCellularGsmL1States;
  uint64_t v116 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v750 objects:v912 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v751;
    do
    {
      uint64_t v119 = 0;
      do
      {
        if (*(void *)v751 != v118) {
          objc_enumerationMutation(v115);
        }
        PBDataWriterWriteSubmessage();
        ++v119;
      }
      while (v117 != v119);
      uint64_t v117 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v750 objects:v912 count:16];
    }
    while (v117);
  }

  long long v749 = 0u;
  long long v748 = 0u;
  long long v747 = 0u;
  long long v746 = 0u;
  uint64_t v120 = self->_kCellularWcdmaCpcStats;
  uint64_t v121 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v746 objects:v911 count:16];
  if (v121)
  {
    uint64_t v122 = v121;
    uint64_t v123 = *(void *)v747;
    do
    {
      uint64_t v124 = 0;
      do
      {
        if (*(void *)v747 != v123) {
          objc_enumerationMutation(v120);
        }
        PBDataWriterWriteSubmessage();
        ++v124;
      }
      while (v122 != v124);
      uint64_t v122 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v746 objects:v911 count:16];
    }
    while (v122);
  }

  long long v745 = 0u;
  long long v744 = 0u;
  long long v743 = 0u;
  long long v742 = 0u;
  uint64_t v125 = self->_kCellularWcdmaRxDiversityHists;
  uint64_t v126 = [(NSMutableArray *)v125 countByEnumeratingWithState:&v742 objects:v910 count:16];
  if (v126)
  {
    uint64_t v127 = v126;
    uint64_t v128 = *(void *)v743;
    do
    {
      uint64_t v129 = 0;
      do
      {
        if (*(void *)v743 != v128) {
          objc_enumerationMutation(v125);
        }
        PBDataWriterWriteSubmessage();
        ++v129;
      }
      while (v127 != v129);
      uint64_t v127 = [(NSMutableArray *)v125 countByEnumeratingWithState:&v742 objects:v910 count:16];
    }
    while (v127);
  }

  long long v741 = 0u;
  long long v740 = 0u;
  long long v739 = 0u;
  long long v738 = 0u;
  v130 = self->_kCellularWcdmaServingCellRx0RssiHists;
  uint64_t v131 = [(NSMutableArray *)v130 countByEnumeratingWithState:&v738 objects:v909 count:16];
  if (v131)
  {
    uint64_t v132 = v131;
    uint64_t v133 = *(void *)v739;
    do
    {
      uint64_t v134 = 0;
      do
      {
        if (*(void *)v739 != v133) {
          objc_enumerationMutation(v130);
        }
        PBDataWriterWriteSubmessage();
        ++v134;
      }
      while (v132 != v134);
      uint64_t v132 = [(NSMutableArray *)v130 countByEnumeratingWithState:&v738 objects:v909 count:16];
    }
    while (v132);
  }

  long long v737 = 0u;
  long long v736 = 0u;
  long long v735 = 0u;
  long long v734 = 0u;
  uint64_t v135 = self->_kCellularWcdmaServingCellRx1RssiHists;
  uint64_t v136 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v734 objects:v908 count:16];
  if (v136)
  {
    uint64_t v137 = v136;
    uint64_t v138 = *(void *)v735;
    do
    {
      uint64_t v139 = 0;
      do
      {
        if (*(void *)v735 != v138) {
          objc_enumerationMutation(v135);
        }
        PBDataWriterWriteSubmessage();
        ++v139;
      }
      while (v137 != v139);
      uint64_t v137 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v734 objects:v908 count:16];
    }
    while (v137);
  }

  long long v733 = 0u;
  long long v732 = 0u;
  long long v731 = 0u;
  long long v730 = 0u;
  uint64_t v140 = self->_kCellularWcdmaServingCellRx0EcNoHists;
  uint64_t v141 = [(NSMutableArray *)v140 countByEnumeratingWithState:&v730 objects:v907 count:16];
  if (v141)
  {
    uint64_t v142 = v141;
    uint64_t v143 = *(void *)v731;
    do
    {
      uint64_t v144 = 0;
      do
      {
        if (*(void *)v731 != v143) {
          objc_enumerationMutation(v140);
        }
        PBDataWriterWriteSubmessage();
        ++v144;
      }
      while (v142 != v144);
      uint64_t v142 = [(NSMutableArray *)v140 countByEnumeratingWithState:&v730 objects:v907 count:16];
    }
    while (v142);
  }

  long long v729 = 0u;
  long long v728 = 0u;
  long long v727 = 0u;
  long long v726 = 0u;
  v145 = self->_kCellularWcdmaServingCellRx1EcNoHists;
  uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v726 objects:v906 count:16];
  if (v146)
  {
    uint64_t v147 = v146;
    uint64_t v148 = *(void *)v727;
    do
    {
      uint64_t v149 = 0;
      do
      {
        if (*(void *)v727 != v148) {
          objc_enumerationMutation(v145);
        }
        PBDataWriterWriteSubmessage();
        ++v149;
      }
      while (v147 != v149);
      uint64_t v147 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v726 objects:v906 count:16];
    }
    while (v147);
  }

  long long v725 = 0u;
  long long v724 = 0u;
  long long v723 = 0u;
  long long v722 = 0u;
  v150 = self->_kCellularWcdmaTxPowerHists;
  uint64_t v151 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v722 objects:v905 count:16];
  if (v151)
  {
    uint64_t v152 = v151;
    uint64_t v153 = *(void *)v723;
    do
    {
      uint64_t v154 = 0;
      do
      {
        if (*(void *)v723 != v153) {
          objc_enumerationMutation(v150);
        }
        PBDataWriterWriteSubmessage();
        ++v154;
      }
      while (v152 != v154);
      uint64_t v152 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v722 objects:v905 count:16];
    }
    while (v152);
  }

  long long v721 = 0u;
  long long v720 = 0u;
  long long v719 = 0u;
  long long v718 = 0u;
  uint64_t v155 = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  uint64_t v156 = [(NSMutableArray *)v155 countByEnumeratingWithState:&v718 objects:v904 count:16];
  if (v156)
  {
    uint64_t v157 = v156;
    uint64_t v158 = *(void *)v719;
    do
    {
      uint64_t v159 = 0;
      do
      {
        if (*(void *)v719 != v158) {
          objc_enumerationMutation(v155);
        }
        PBDataWriterWriteSubmessage();
        ++v159;
      }
      while (v157 != v159);
      uint64_t v157 = [(NSMutableArray *)v155 countByEnumeratingWithState:&v718 objects:v904 count:16];
    }
    while (v157);
  }

  long long v717 = 0u;
  long long v716 = 0u;
  long long v715 = 0u;
  long long v714 = 0u;
  uint64_t v160 = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  uint64_t v161 = [(NSMutableArray *)v160 countByEnumeratingWithState:&v714 objects:v903 count:16];
  if (v161)
  {
    uint64_t v162 = v161;
    uint64_t v163 = *(void *)v715;
    do
    {
      uint64_t v164 = 0;
      do
      {
        if (*(void *)v715 != v163) {
          objc_enumerationMutation(v160);
        }
        PBDataWriterWriteSubmessage();
        ++v164;
      }
      while (v162 != v164);
      uint64_t v162 = [(NSMutableArray *)v160 countByEnumeratingWithState:&v714 objects:v903 count:16];
    }
    while (v162);
  }

  long long v713 = 0u;
  long long v712 = 0u;
  long long v711 = 0u;
  long long v710 = 0u;
  v165 = self->_kCellularWcdmaCarrierStatusHists;
  uint64_t v166 = [(NSMutableArray *)v165 countByEnumeratingWithState:&v710 objects:v902 count:16];
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v168 = *(void *)v711;
    do
    {
      uint64_t v169 = 0;
      do
      {
        if (*(void *)v711 != v168) {
          objc_enumerationMutation(v165);
        }
        PBDataWriterWriteSubmessage();
        ++v169;
      }
      while (v167 != v169);
      uint64_t v167 = [(NSMutableArray *)v165 countByEnumeratingWithState:&v710 objects:v902 count:16];
    }
    while (v167);
  }

  long long v709 = 0u;
  long long v708 = 0u;
  long long v707 = 0u;
  long long v706 = 0u;
  uint64_t v170 = self->_kCellularWcdmaRabModeHists;
  uint64_t v171 = [(NSMutableArray *)v170 countByEnumeratingWithState:&v706 objects:v901 count:16];
  if (v171)
  {
    uint64_t v172 = v171;
    uint64_t v173 = *(void *)v707;
    do
    {
      uint64_t v174 = 0;
      do
      {
        if (*(void *)v707 != v173) {
          objc_enumerationMutation(v170);
        }
        PBDataWriterWriteSubmessage();
        ++v174;
      }
      while (v172 != v174);
      uint64_t v172 = [(NSMutableArray *)v170 countByEnumeratingWithState:&v706 objects:v901 count:16];
    }
    while (v172);
  }

  long long v705 = 0u;
  long long v704 = 0u;
  long long v703 = 0u;
  long long v702 = 0u;
  uint64_t v175 = self->_kCellularWcdmaRabTypeHists;
  uint64_t v176 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v702 objects:v900 count:16];
  if (v176)
  {
    uint64_t v177 = v176;
    uint64_t v178 = *(void *)v703;
    do
    {
      uint64_t v179 = 0;
      do
      {
        if (*(void *)v703 != v178) {
          objc_enumerationMutation(v175);
        }
        PBDataWriterWriteSubmessage();
        ++v179;
      }
      while (v177 != v179);
      uint64_t v177 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v702 objects:v900 count:16];
    }
    while (v177);
  }

  long long v701 = 0u;
  long long v700 = 0u;
  long long v699 = 0u;
  long long v698 = 0u;
  v180 = self->_kCellularWcdmaRrcConnectionStates;
  uint64_t v181 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v698 objects:v899 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v699;
    do
    {
      uint64_t v184 = 0;
      do
      {
        if (*(void *)v699 != v183) {
          objc_enumerationMutation(v180);
        }
        PBDataWriterWriteSubmessage();
        ++v184;
      }
      while (v182 != v184);
      uint64_t v182 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v698 objects:v899 count:16];
    }
    while (v182);
  }

  long long v697 = 0u;
  long long v696 = 0u;
  long long v695 = 0u;
  long long v694 = 0u;
  v185 = self->_kCellularWcdmaRrcConfigurations;
  uint64_t v186 = [(NSMutableArray *)v185 countByEnumeratingWithState:&v694 objects:v898 count:16];
  if (v186)
  {
    uint64_t v187 = v186;
    uint64_t v188 = *(void *)v695;
    do
    {
      uint64_t v189 = 0;
      do
      {
        if (*(void *)v695 != v188) {
          objc_enumerationMutation(v185);
        }
        PBDataWriterWriteSubmessage();
        ++v189;
      }
      while (v187 != v189);
      uint64_t v187 = [(NSMutableArray *)v185 countByEnumeratingWithState:&v694 objects:v898 count:16];
    }
    while (v187);
  }

  long long v693 = 0u;
  long long v692 = 0u;
  long long v691 = 0u;
  long long v690 = 0u;
  uint64_t v190 = self->_kCellularWcdmaRabStatus;
  uint64_t v191 = [(NSMutableArray *)v190 countByEnumeratingWithState:&v690 objects:v897 count:16];
  if (v191)
  {
    uint64_t v192 = v191;
    uint64_t v193 = *(void *)v691;
    do
    {
      uint64_t v194 = 0;
      do
      {
        if (*(void *)v691 != v193) {
          objc_enumerationMutation(v190);
        }
        PBDataWriterWriteSubmessage();
        ++v194;
      }
      while (v192 != v194);
      uint64_t v192 = [(NSMutableArray *)v190 countByEnumeratingWithState:&v690 objects:v897 count:16];
    }
    while (v192);
  }

  long long v689 = 0u;
  long long v688 = 0u;
  long long v687 = 0u;
  long long v686 = 0u;
  uint64_t v195 = self->_kCellularWcdmaL1States;
  uint64_t v196 = [(NSMutableArray *)v195 countByEnumeratingWithState:&v686 objects:v896 count:16];
  if (v196)
  {
    uint64_t v197 = v196;
    uint64_t v198 = *(void *)v687;
    do
    {
      uint64_t v199 = 0;
      do
      {
        if (*(void *)v687 != v198) {
          objc_enumerationMutation(v195);
        }
        PBDataWriterWriteSubmessage();
        ++v199;
      }
      while (v197 != v199);
      uint64_t v197 = [(NSMutableArray *)v195 countByEnumeratingWithState:&v686 objects:v896 count:16];
    }
    while (v197);
  }

  long long v685 = 0u;
  long long v684 = 0u;
  long long v683 = 0u;
  long long v682 = 0u;
  v200 = self->_kCellularWcdmaDataInactivityBeforeIdles;
  uint64_t v201 = [(NSMutableArray *)v200 countByEnumeratingWithState:&v682 objects:v895 count:16];
  if (v201)
  {
    uint64_t v202 = v201;
    uint64_t v203 = *(void *)v683;
    do
    {
      uint64_t v204 = 0;
      do
      {
        if (*(void *)v683 != v203) {
          objc_enumerationMutation(v200);
        }
        PBDataWriterWriteSubmessage();
        ++v204;
      }
      while (v202 != v204);
      uint64_t v202 = [(NSMutableArray *)v200 countByEnumeratingWithState:&v682 objects:v895 count:16];
    }
    while (v202);
  }

  long long v681 = 0u;
  long long v680 = 0u;
  long long v679 = 0u;
  long long v678 = 0u;
  uint64_t v205 = self->_kCellularWcdmaIdleToConnectedUserDatas;
  uint64_t v206 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v678 objects:v894 count:16];
  if (v206)
  {
    uint64_t v207 = v206;
    uint64_t v208 = *(void *)v679;
    do
    {
      uint64_t v209 = 0;
      do
      {
        if (*(void *)v679 != v208) {
          objc_enumerationMutation(v205);
        }
        PBDataWriterWriteSubmessage();
        ++v209;
      }
      while (v207 != v209);
      uint64_t v207 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v678 objects:v894 count:16];
    }
    while (v207);
  }

  long long v677 = 0u;
  long long v676 = 0u;
  long long v675 = 0u;
  long long v674 = 0u;
  uint64_t v210 = self->_kCellularWcdmaVadHists;
  uint64_t v211 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v674 objects:v893 count:16];
  if (v211)
  {
    uint64_t v212 = v211;
    uint64_t v213 = *(void *)v675;
    do
    {
      uint64_t v214 = 0;
      do
      {
        if (*(void *)v675 != v213) {
          objc_enumerationMutation(v210);
        }
        PBDataWriterWriteSubmessage();
        ++v214;
      }
      while (v212 != v214);
      uint64_t v212 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v674 objects:v893 count:16];
    }
    while (v212);
  }

  long long v673 = 0u;
  long long v672 = 0u;
  long long v671 = 0u;
  long long v670 = 0u;
  v215 = self->_kCellularTdsRxDiversityHists;
  uint64_t v216 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v670 objects:v892 count:16];
  if (v216)
  {
    uint64_t v217 = v216;
    uint64_t v218 = *(void *)v671;
    do
    {
      uint64_t v219 = 0;
      do
      {
        if (*(void *)v671 != v218) {
          objc_enumerationMutation(v215);
        }
        PBDataWriterWriteSubmessage();
        ++v219;
      }
      while (v217 != v219);
      uint64_t v217 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v670 objects:v892 count:16];
    }
    while (v217);
  }

  long long v669 = 0u;
  long long v668 = 0u;
  long long v667 = 0u;
  long long v666 = 0u;
  v220 = self->_kCellularTdsServingCellRx0RssiHists;
  uint64_t v221 = [(NSMutableArray *)v220 countByEnumeratingWithState:&v666 objects:v891 count:16];
  if (v221)
  {
    uint64_t v222 = v221;
    uint64_t v223 = *(void *)v667;
    do
    {
      uint64_t v224 = 0;
      do
      {
        if (*(void *)v667 != v223) {
          objc_enumerationMutation(v220);
        }
        PBDataWriterWriteSubmessage();
        ++v224;
      }
      while (v222 != v224);
      uint64_t v222 = [(NSMutableArray *)v220 countByEnumeratingWithState:&v666 objects:v891 count:16];
    }
    while (v222);
  }

  long long v665 = 0u;
  long long v664 = 0u;
  long long v663 = 0u;
  long long v662 = 0u;
  uint64_t v225 = self->_kCellularTdsServingCellRx1RssiHists;
  uint64_t v226 = [(NSMutableArray *)v225 countByEnumeratingWithState:&v662 objects:v890 count:16];
  if (v226)
  {
    uint64_t v227 = v226;
    uint64_t v228 = *(void *)v663;
    do
    {
      uint64_t v229 = 0;
      do
      {
        if (*(void *)v663 != v228) {
          objc_enumerationMutation(v225);
        }
        PBDataWriterWriteSubmessage();
        ++v229;
      }
      while (v227 != v229);
      uint64_t v227 = [(NSMutableArray *)v225 countByEnumeratingWithState:&v662 objects:v890 count:16];
    }
    while (v227);
  }

  long long v661 = 0u;
  long long v660 = 0u;
  long long v659 = 0u;
  long long v658 = 0u;
  uint64_t v230 = self->_kCellularTdsServingCellRx0RscpHists;
  uint64_t v231 = [(NSMutableArray *)v230 countByEnumeratingWithState:&v658 objects:v889 count:16];
  if (v231)
  {
    uint64_t v232 = v231;
    uint64_t v233 = *(void *)v659;
    do
    {
      uint64_t v234 = 0;
      do
      {
        if (*(void *)v659 != v233) {
          objc_enumerationMutation(v230);
        }
        PBDataWriterWriteSubmessage();
        ++v234;
      }
      while (v232 != v234);
      uint64_t v232 = [(NSMutableArray *)v230 countByEnumeratingWithState:&v658 objects:v889 count:16];
    }
    while (v232);
  }

  long long v657 = 0u;
  long long v656 = 0u;
  long long v655 = 0u;
  long long v654 = 0u;
  v235 = self->_kCellularTdsServingCellRx1RscpHists;
  uint64_t v236 = [(NSMutableArray *)v235 countByEnumeratingWithState:&v654 objects:v888 count:16];
  if (v236)
  {
    uint64_t v237 = v236;
    uint64_t v238 = *(void *)v655;
    do
    {
      uint64_t v239 = 0;
      do
      {
        if (*(void *)v655 != v238) {
          objc_enumerationMutation(v235);
        }
        PBDataWriterWriteSubmessage();
        ++v239;
      }
      while (v237 != v239);
      uint64_t v237 = [(NSMutableArray *)v235 countByEnumeratingWithState:&v654 objects:v888 count:16];
    }
    while (v237);
  }

  long long v653 = 0u;
  long long v652 = 0u;
  long long v651 = 0u;
  long long v650 = 0u;
  uint64_t v240 = self->_kCellularTdsTxPowerHists;
  uint64_t v241 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v650 objects:v887 count:16];
  if (v241)
  {
    uint64_t v242 = v241;
    uint64_t v243 = *(void *)v651;
    do
    {
      uint64_t v244 = 0;
      do
      {
        if (*(void *)v651 != v243) {
          objc_enumerationMutation(v240);
        }
        PBDataWriterWriteSubmessage();
        ++v244;
      }
      while (v242 != v244);
      uint64_t v242 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v650 objects:v887 count:16];
    }
    while (v242);
  }

  long long v649 = 0u;
  long long v648 = 0u;
  long long v647 = 0u;
  long long v646 = 0u;
  uint64_t v245 = self->_kCellularTdsRabModeHists;
  uint64_t v246 = [(NSMutableArray *)v245 countByEnumeratingWithState:&v646 objects:v886 count:16];
  if (v246)
  {
    uint64_t v247 = v246;
    uint64_t v248 = *(void *)v647;
    do
    {
      uint64_t v249 = 0;
      do
      {
        if (*(void *)v647 != v248) {
          objc_enumerationMutation(v245);
        }
        PBDataWriterWriteSubmessage();
        ++v249;
      }
      while (v247 != v249);
      uint64_t v247 = [(NSMutableArray *)v245 countByEnumeratingWithState:&v646 objects:v886 count:16];
    }
    while (v247);
  }

  long long v645 = 0u;
  long long v644 = 0u;
  long long v643 = 0u;
  long long v642 = 0u;
  v250 = self->_kCellularTdsRabTypeHists;
  uint64_t v251 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v642 objects:v885 count:16];
  if (v251)
  {
    uint64_t v252 = v251;
    uint64_t v253 = *(void *)v643;
    do
    {
      uint64_t v254 = 0;
      do
      {
        if (*(void *)v643 != v253) {
          objc_enumerationMutation(v250);
        }
        PBDataWriterWriteSubmessage();
        ++v254;
      }
      while (v252 != v254);
      uint64_t v252 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v642 objects:v885 count:16];
    }
    while (v252);
  }

  long long v641 = 0u;
  long long v640 = 0u;
  long long v639 = 0u;
  long long v638 = 0u;
  v255 = self->_kCellularTdsL1States;
  uint64_t v256 = [(NSMutableArray *)v255 countByEnumeratingWithState:&v638 objects:v884 count:16];
  if (v256)
  {
    uint64_t v257 = v256;
    uint64_t v258 = *(void *)v639;
    do
    {
      uint64_t v259 = 0;
      do
      {
        if (*(void *)v639 != v258) {
          objc_enumerationMutation(v255);
        }
        PBDataWriterWriteSubmessage();
        ++v259;
      }
      while (v257 != v259);
      uint64_t v257 = [(NSMutableArray *)v255 countByEnumeratingWithState:&v638 objects:v884 count:16];
    }
    while (v257);
  }

  long long v637 = 0u;
  long long v636 = 0u;
  long long v635 = 0u;
  long long v634 = 0u;
  uint64_t v260 = self->_kCellularLteFwDuplexModes;
  uint64_t v261 = [(NSMutableArray *)v260 countByEnumeratingWithState:&v634 objects:v883 count:16];
  if (v261)
  {
    uint64_t v262 = v261;
    uint64_t v263 = *(void *)v635;
    do
    {
      uint64_t v264 = 0;
      do
      {
        if (*(void *)v635 != v263) {
          objc_enumerationMutation(v260);
        }
        PBDataWriterWriteSubmessage();
        ++v264;
      }
      while (v262 != v264);
      uint64_t v262 = [(NSMutableArray *)v260 countByEnumeratingWithState:&v634 objects:v883 count:16];
    }
    while (v262);
  }

  long long v633 = 0u;
  long long v632 = 0u;
  long long v631 = 0u;
  long long v630 = 0u;
  uint64_t v265 = self->_kCellularLteServingCellRsrpHists;
  uint64_t v266 = [(NSMutableArray *)v265 countByEnumeratingWithState:&v630 objects:v882 count:16];
  if (v266)
  {
    uint64_t v267 = v266;
    uint64_t v268 = *(void *)v631;
    do
    {
      uint64_t v269 = 0;
      do
      {
        if (*(void *)v631 != v268) {
          objc_enumerationMutation(v265);
        }
        PBDataWriterWriteSubmessage();
        ++v269;
      }
      while (v267 != v269);
      uint64_t v267 = [(NSMutableArray *)v265 countByEnumeratingWithState:&v630 objects:v882 count:16];
    }
    while (v267);
  }

  long long v629 = 0u;
  long long v628 = 0u;
  long long v627 = 0u;
  long long v626 = 0u;
  v270 = self->_kCellularLteServingCellSinrHists;
  uint64_t v271 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v626 objects:v881 count:16];
  if (v271)
  {
    uint64_t v272 = v271;
    uint64_t v273 = *(void *)v627;
    do
    {
      uint64_t v274 = 0;
      do
      {
        if (*(void *)v627 != v273) {
          objc_enumerationMutation(v270);
        }
        PBDataWriterWriteSubmessage();
        ++v274;
      }
      while (v272 != v274);
      uint64_t v272 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v626 objects:v881 count:16];
    }
    while (v272);
  }

  long long v625 = 0u;
  long long v624 = 0u;
  long long v623 = 0u;
  long long v622 = 0u;
  uint64_t v275 = self->_kCellularLteSleepStateHists;
  uint64_t v276 = [(NSMutableArray *)v275 countByEnumeratingWithState:&v622 objects:v880 count:16];
  if (v276)
  {
    uint64_t v277 = v276;
    uint64_t v278 = *(void *)v623;
    do
    {
      uint64_t v279 = 0;
      do
      {
        if (*(void *)v623 != v278) {
          objc_enumerationMutation(v275);
        }
        PBDataWriterWriteSubmessage();
        ++v279;
      }
      while (v277 != v279);
      uint64_t v277 = [(NSMutableArray *)v275 countByEnumeratingWithState:&v622 objects:v880 count:16];
    }
    while (v277);
  }

  long long v621 = 0u;
  long long v620 = 0u;
  long long v619 = 0u;
  long long v618 = 0u;
  uint64_t v280 = self->_kCellularLteTxPowerHists;
  uint64_t v281 = [(NSMutableArray *)v280 countByEnumeratingWithState:&v618 objects:v879 count:16];
  if (v281)
  {
    uint64_t v282 = v281;
    uint64_t v283 = *(void *)v619;
    do
    {
      uint64_t v284 = 0;
      do
      {
        if (*(void *)v619 != v283) {
          objc_enumerationMutation(v280);
        }
        PBDataWriterWriteSubmessage();
        ++v284;
      }
      while (v282 != v284);
      uint64_t v282 = [(NSMutableArray *)v280 countByEnumeratingWithState:&v618 objects:v879 count:16];
    }
    while (v282);
  }

  long long v617 = 0u;
  long long v616 = 0u;
  long long v615 = 0u;
  long long v614 = 0u;
  v285 = self->_kCellularLteDlSccStateHists;
  uint64_t v286 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v614 objects:v878 count:16];
  if (v286)
  {
    uint64_t v287 = v286;
    uint64_t v288 = *(void *)v615;
    do
    {
      uint64_t v289 = 0;
      do
      {
        if (*(void *)v615 != v288) {
          objc_enumerationMutation(v285);
        }
        PBDataWriterWriteSubmessage();
        ++v289;
      }
      while (v287 != v289);
      uint64_t v287 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v614 objects:v878 count:16];
    }
    while (v287);
  }

  long long v613 = 0u;
  long long v612 = 0u;
  long long v611 = 0u;
  long long v610 = 0u;
  v290 = self->_kCellularLteUlSccStateHists;
  uint64_t v291 = [(NSMutableArray *)v290 countByEnumeratingWithState:&v610 objects:v877 count:16];
  if (v291)
  {
    uint64_t v292 = v291;
    uint64_t v293 = *(void *)v611;
    do
    {
      uint64_t v294 = 0;
      do
      {
        if (*(void *)v611 != v293) {
          objc_enumerationMutation(v290);
        }
        PBDataWriterWriteSubmessage();
        ++v294;
      }
      while (v292 != v294);
      uint64_t v292 = [(NSMutableArray *)v290 countByEnumeratingWithState:&v610 objects:v877 count:16];
    }
    while (v292);
  }

  long long v609 = 0u;
  long long v608 = 0u;
  long long v607 = 0u;
  long long v606 = 0u;
  uint64_t v295 = self->_kCellularLteAdvancedRxStateHists;
  uint64_t v296 = [(NSMutableArray *)v295 countByEnumeratingWithState:&v606 objects:v876 count:16];
  if (v296)
  {
    uint64_t v297 = v296;
    uint64_t v298 = *(void *)v607;
    do
    {
      uint64_t v299 = 0;
      do
      {
        if (*(void *)v607 != v298) {
          objc_enumerationMutation(v295);
        }
        PBDataWriterWriteSubmessage();
        ++v299;
      }
      while (v297 != v299);
      uint64_t v297 = [(NSMutableArray *)v295 countByEnumeratingWithState:&v606 objects:v876 count:16];
    }
    while (v297);
  }

  long long v605 = 0u;
  long long v604 = 0u;
  long long v603 = 0u;
  long long v602 = 0u;
  uint64_t v300 = self->_kCellularLteComponentCarrierInfos;
  uint64_t v301 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v602 objects:v875 count:16];
  if (v301)
  {
    uint64_t v302 = v301;
    uint64_t v303 = *(void *)v603;
    do
    {
      uint64_t v304 = 0;
      do
      {
        if (*(void *)v603 != v303) {
          objc_enumerationMutation(v300);
        }
        PBDataWriterWriteSubmessage();
        ++v304;
      }
      while (v302 != v304);
      uint64_t v302 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v602 objects:v875 count:16];
    }
    while (v302);
  }

  long long v601 = 0u;
  long long v600 = 0u;
  long long v599 = 0u;
  long long v598 = 0u;
  v305 = self->_kCellularLteRxTxStateHists;
  uint64_t v306 = [(NSMutableArray *)v305 countByEnumeratingWithState:&v598 objects:v874 count:16];
  if (v306)
  {
    uint64_t v307 = v306;
    uint64_t v308 = *(void *)v599;
    do
    {
      uint64_t v309 = 0;
      do
      {
        if (*(void *)v599 != v308) {
          objc_enumerationMutation(v305);
        }
        PBDataWriterWriteSubmessage();
        ++v309;
      }
      while (v307 != v309);
      uint64_t v307 = [(NSMutableArray *)v305 countByEnumeratingWithState:&v598 objects:v874 count:16];
    }
    while (v307);
  }

  long long v597 = 0u;
  long long v596 = 0u;
  long long v595 = 0u;
  long long v594 = 0u;
  uint64_t v310 = self->_kCellularLteTotalDlTbsHists;
  uint64_t v311 = [(NSMutableArray *)v310 countByEnumeratingWithState:&v594 objects:v873 count:16];
  if (v311)
  {
    uint64_t v312 = v311;
    uint64_t v313 = *(void *)v595;
    do
    {
      uint64_t v314 = 0;
      do
      {
        if (*(void *)v595 != v313) {
          objc_enumerationMutation(v310);
        }
        PBDataWriterWriteSubmessage();
        ++v314;
      }
      while (v312 != v314);
      uint64_t v312 = [(NSMutableArray *)v310 countByEnumeratingWithState:&v594 objects:v873 count:16];
    }
    while (v312);
  }

  long long v593 = 0u;
  long long v592 = 0u;
  long long v591 = 0u;
  long long v590 = 0u;
  uint64_t v315 = self->_kCellularLteDataInactivityBeforeIdles;
  uint64_t v316 = [(NSMutableArray *)v315 countByEnumeratingWithState:&v590 objects:v872 count:16];
  if (v316)
  {
    uint64_t v317 = v316;
    uint64_t v318 = *(void *)v591;
    do
    {
      uint64_t v319 = 0;
      do
      {
        if (*(void *)v591 != v318) {
          objc_enumerationMutation(v315);
        }
        PBDataWriterWriteSubmessage();
        ++v319;
      }
      while (v317 != v319);
      uint64_t v317 = [(NSMutableArray *)v315 countByEnumeratingWithState:&v590 objects:v872 count:16];
    }
    while (v317);
  }

  long long v589 = 0u;
  long long v588 = 0u;
  long long v587 = 0u;
  long long v586 = 0u;
  v320 = self->_kCellularLteIdleToConnectedUserDatas;
  uint64_t v321 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v586 objects:v871 count:16];
  if (v321)
  {
    uint64_t v322 = v321;
    uint64_t v323 = *(void *)v587;
    do
    {
      uint64_t v324 = 0;
      do
      {
        if (*(void *)v587 != v323) {
          objc_enumerationMutation(v320);
        }
        PBDataWriterWriteSubmessage();
        ++v324;
      }
      while (v322 != v324);
      uint64_t v322 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v586 objects:v871 count:16];
    }
    while (v322);
  }

  long long v585 = 0u;
  long long v584 = 0u;
  long long v583 = 0u;
  long long v582 = 0u;
  v325 = self->_kCellularLteDlSccStateHistV3s;
  uint64_t v326 = [(NSMutableArray *)v325 countByEnumeratingWithState:&v582 objects:v870 count:16];
  if (v326)
  {
    uint64_t v327 = v326;
    uint64_t v328 = *(void *)v583;
    do
    {
      uint64_t v329 = 0;
      do
      {
        if (*(void *)v583 != v328) {
          objc_enumerationMutation(v325);
        }
        PBDataWriterWriteSubmessage();
        ++v329;
      }
      while (v327 != v329);
      uint64_t v327 = [(NSMutableArray *)v325 countByEnumeratingWithState:&v582 objects:v870 count:16];
    }
    while (v327);
  }

  long long v581 = 0u;
  long long v580 = 0u;
  long long v579 = 0u;
  long long v578 = 0u;
  uint64_t v330 = self->_kCellularLteRxDiversityHists;
  uint64_t v331 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v578 objects:v869 count:16];
  if (v331)
  {
    uint64_t v332 = v331;
    uint64_t v333 = *(void *)v579;
    do
    {
      uint64_t v334 = 0;
      do
      {
        if (*(void *)v579 != v333) {
          objc_enumerationMutation(v330);
        }
        PBDataWriterWriteSubmessage();
        ++v334;
      }
      while (v332 != v334);
      uint64_t v332 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v578 objects:v869 count:16];
    }
    while (v332);
  }

  long long v577 = 0u;
  long long v576 = 0u;
  long long v575 = 0u;
  long long v574 = 0u;
  uint64_t v335 = self->_kCellularLtePdcchStateHists;
  uint64_t v336 = [(NSMutableArray *)v335 countByEnumeratingWithState:&v574 objects:v868 count:16];
  if (v336)
  {
    uint64_t v337 = v336;
    uint64_t v338 = *(void *)v575;
    do
    {
      uint64_t v339 = 0;
      do
      {
        if (*(void *)v575 != v338) {
          objc_enumerationMutation(v335);
        }
        PBDataWriterWriteSubmessage();
        ++v339;
      }
      while (v337 != v339);
      uint64_t v337 = [(NSMutableArray *)v335 countByEnumeratingWithState:&v574 objects:v868 count:16];
    }
    while (v337);
  }

  long long v573 = 0u;
  long long v572 = 0u;
  long long v571 = 0u;
  long long v570 = 0u;
  v340 = self->_kCellularProtocolStackStateHists;
  uint64_t v341 = [(NSMutableArray *)v340 countByEnumeratingWithState:&v570 objects:v867 count:16];
  if (v341)
  {
    uint64_t v342 = v341;
    uint64_t v343 = *(void *)v571;
    do
    {
      uint64_t v344 = 0;
      do
      {
        if (*(void *)v571 != v343) {
          objc_enumerationMutation(v340);
        }
        PBDataWriterWriteSubmessage();
        ++v344;
      }
      while (v342 != v344);
      uint64_t v342 = [(NSMutableArray *)v340 countByEnumeratingWithState:&v570 objects:v867 count:16];
    }
    while (v342);
  }

  long long v569 = 0u;
  long long v568 = 0u;
  long long v567 = 0u;
  long long v566 = 0u;
  uint64_t v345 = self->_kCellularCellPlmnSearchCounts;
  uint64_t v346 = [(NSMutableArray *)v345 countByEnumeratingWithState:&v566 objects:v866 count:16];
  if (v346)
  {
    uint64_t v347 = v346;
    uint64_t v348 = *(void *)v567;
    do
    {
      uint64_t v349 = 0;
      do
      {
        if (*(void *)v567 != v348) {
          objc_enumerationMutation(v345);
        }
        PBDataWriterWriteSubmessage();
        ++v349;
      }
      while (v347 != v349);
      uint64_t v347 = [(NSMutableArray *)v345 countByEnumeratingWithState:&v566 objects:v866 count:16];
    }
    while (v347);
  }

  long long v565 = 0u;
  long long v564 = 0u;
  long long v563 = 0u;
  long long v562 = 0u;
  uint64_t v350 = self->_kCellularCellPlmnSearchHists;
  uint64_t v351 = [(NSMutableArray *)v350 countByEnumeratingWithState:&v562 objects:v865 count:16];
  if (v351)
  {
    uint64_t v352 = v351;
    uint64_t v353 = *(void *)v563;
    do
    {
      uint64_t v354 = 0;
      do
      {
        if (*(void *)v563 != v353) {
          objc_enumerationMutation(v350);
        }
        PBDataWriterWriteSubmessage();
        ++v354;
      }
      while (v352 != v354);
      uint64_t v352 = [(NSMutableArray *)v350 countByEnumeratingWithState:&v562 objects:v865 count:16];
    }
    while (v352);
  }

  long long v561 = 0u;
  long long v560 = 0u;
  long long v559 = 0u;
  long long v558 = 0u;
  v355 = self->_kCellularProtocolStackPowerStates;
  uint64_t v356 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v558 objects:v864 count:16];
  if (v356)
  {
    uint64_t v357 = v356;
    uint64_t v358 = *(void *)v559;
    do
    {
      uint64_t v359 = 0;
      do
      {
        if (*(void *)v559 != v358) {
          objc_enumerationMutation(v355);
        }
        PBDataWriterWriteSubmessage();
        ++v359;
      }
      while (v357 != v359);
      uint64_t v357 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v558 objects:v864 count:16];
    }
    while (v357);
  }

  long long v557 = 0u;
  long long v556 = 0u;
  long long v555 = 0u;
  long long v554 = 0u;
  v360 = self->_kCellularDownlinkIpPacketFilterStatus;
  uint64_t v361 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v554 objects:v863 count:16];
  if (v361)
  {
    uint64_t v362 = v361;
    uint64_t v363 = *(void *)v555;
    do
    {
      uint64_t v364 = 0;
      do
      {
        if (*(void *)v555 != v363) {
          objc_enumerationMutation(v360);
        }
        PBDataWriterWriteSubmessage();
        ++v364;
      }
      while (v362 != v364);
      uint64_t v362 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v554 objects:v863 count:16];
    }
    while (v362);
  }

  long long v553 = 0u;
  long long v552 = 0u;
  long long v551 = 0u;
  long long v550 = 0u;
  uint64_t v365 = self->_kCellularDownlinkIpPacketDiscardeds;
  uint64_t v366 = [(NSMutableArray *)v365 countByEnumeratingWithState:&v550 objects:v862 count:16];
  if (v366)
  {
    uint64_t v367 = v366;
    uint64_t v368 = *(void *)v551;
    do
    {
      uint64_t v369 = 0;
      do
      {
        if (*(void *)v551 != v368) {
          objc_enumerationMutation(v365);
        }
        PBDataWriterWriteSubmessage();
        ++v369;
      }
      while (v367 != v369);
      uint64_t v367 = [(NSMutableArray *)v365 countByEnumeratingWithState:&v550 objects:v862 count:16];
    }
    while (v367);
  }

  long long v549 = 0u;
  long long v548 = 0u;
  long long v547 = 0u;
  long long v546 = 0u;
  uint64_t v370 = self->_kCellularServingCellRfBandHists;
  uint64_t v371 = [(NSMutableArray *)v370 countByEnumeratingWithState:&v546 objects:v861 count:16];
  if (v371)
  {
    uint64_t v372 = v371;
    uint64_t v373 = *(void *)v547;
    do
    {
      uint64_t v374 = 0;
      do
      {
        if (*(void *)v547 != v373) {
          objc_enumerationMutation(v370);
        }
        PBDataWriterWriteSubmessage();
        ++v374;
      }
      while (v372 != v374);
      uint64_t v372 = [(NSMutableArray *)v370 countByEnumeratingWithState:&v546 objects:v861 count:16];
    }
    while (v372);
  }

  long long v545 = 0u;
  long long v544 = 0u;
  long long v543 = 0u;
  long long v542 = 0u;
  v375 = self->_kCellularProtocolStackStateHist2s;
  uint64_t v376 = [(NSMutableArray *)v375 countByEnumeratingWithState:&v542 objects:v860 count:16];
  if (v376)
  {
    uint64_t v377 = v376;
    uint64_t v378 = *(void *)v543;
    do
    {
      uint64_t v379 = 0;
      do
      {
        if (*(void *)v543 != v378) {
          objc_enumerationMutation(v375);
        }
        PBDataWriterWriteSubmessage();
        ++v379;
      }
      while (v377 != v379);
      uint64_t v377 = [(NSMutableArray *)v375 countByEnumeratingWithState:&v542 objects:v860 count:16];
    }
    while (v377);
  }

  long long v541 = 0u;
  long long v540 = 0u;
  long long v539 = 0u;
  long long v538 = 0u;
  uint64_t v380 = self->_kCellularProtocolStackStates;
  uint64_t v381 = [(NSMutableArray *)v380 countByEnumeratingWithState:&v538 objects:v859 count:16];
  if (v381)
  {
    uint64_t v382 = v381;
    uint64_t v383 = *(void *)v539;
    do
    {
      uint64_t v384 = 0;
      do
      {
        if (*(void *)v539 != v383) {
          objc_enumerationMutation(v380);
        }
        PBDataWriterWriteSubmessage();
        ++v384;
      }
      while (v382 != v384);
      uint64_t v382 = [(NSMutableArray *)v380 countByEnumeratingWithState:&v538 objects:v859 count:16];
    }
    while (v382);
  }

  long long v537 = 0u;
  long long v536 = 0u;
  long long v535 = 0u;
  long long v534 = 0u;
  uint64_t v385 = self->_kCellularCdma1XRxDiversityHists;
  uint64_t v386 = [(NSMutableArray *)v385 countByEnumeratingWithState:&v534 objects:v858 count:16];
  if (v386)
  {
    uint64_t v387 = v386;
    uint64_t v388 = *(void *)v535;
    do
    {
      uint64_t v389 = 0;
      do
      {
        if (*(void *)v535 != v388) {
          objc_enumerationMutation(v385);
        }
        PBDataWriterWriteSubmessage();
        ++v389;
      }
      while (v387 != v389);
      uint64_t v387 = [(NSMutableArray *)v385 countByEnumeratingWithState:&v534 objects:v858 count:16];
    }
    while (v387);
  }

  long long v532 = 0u;
  long long v533 = 0u;
  long long v530 = 0u;
  long long v531 = 0u;
  v390 = self->_kCellularCdma1XServingCellRx0RssiHists;
  uint64_t v391 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v530 objects:v857 count:16];
  if (v391)
  {
    uint64_t v392 = v391;
    uint64_t v393 = *(void *)v531;
    do
    {
      uint64_t v394 = 0;
      do
      {
        if (*(void *)v531 != v393) {
          objc_enumerationMutation(v390);
        }
        PBDataWriterWriteSubmessage();
        ++v394;
      }
      while (v392 != v394);
      uint64_t v392 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v530 objects:v857 count:16];
    }
    while (v392);
  }

  long long v528 = 0u;
  long long v529 = 0u;
  long long v526 = 0u;
  long long v527 = 0u;
  v395 = self->_kCellularCdma1XServingCellRx1RssiHists;
  uint64_t v396 = [(NSMutableArray *)v395 countByEnumeratingWithState:&v526 objects:v856 count:16];
  if (v396)
  {
    uint64_t v397 = v396;
    uint64_t v398 = *(void *)v527;
    do
    {
      uint64_t v399 = 0;
      do
      {
        if (*(void *)v527 != v398) {
          objc_enumerationMutation(v395);
        }
        PBDataWriterWriteSubmessage();
        ++v399;
      }
      while (v397 != v399);
      uint64_t v397 = [(NSMutableArray *)v395 countByEnumeratingWithState:&v526 objects:v856 count:16];
    }
    while (v397);
  }

  long long v524 = 0u;
  long long v525 = 0u;
  long long v522 = 0u;
  long long v523 = 0u;
  uint64_t v400 = self->_kCellularCdma1XServingCellRx0EcIoHists;
  uint64_t v401 = [(NSMutableArray *)v400 countByEnumeratingWithState:&v522 objects:v855 count:16];
  if (v401)
  {
    uint64_t v402 = v401;
    uint64_t v403 = *(void *)v523;
    do
    {
      uint64_t v404 = 0;
      do
      {
        if (*(void *)v523 != v403) {
          objc_enumerationMutation(v400);
        }
        PBDataWriterWriteSubmessage();
        ++v404;
      }
      while (v402 != v404);
      uint64_t v402 = [(NSMutableArray *)v400 countByEnumeratingWithState:&v522 objects:v855 count:16];
    }
    while (v402);
  }

  long long v520 = 0u;
  long long v521 = 0u;
  long long v518 = 0u;
  long long v519 = 0u;
  uint64_t v405 = self->_kCellularCdma1XServingCellRx1EcIoHists;
  uint64_t v406 = [(NSMutableArray *)v405 countByEnumeratingWithState:&v518 objects:v854 count:16];
  if (v406)
  {
    uint64_t v407 = v406;
    uint64_t v408 = *(void *)v519;
    do
    {
      uint64_t v409 = 0;
      do
      {
        if (*(void *)v519 != v408) {
          objc_enumerationMutation(v405);
        }
        PBDataWriterWriteSubmessage();
        ++v409;
      }
      while (v407 != v409);
      uint64_t v407 = [(NSMutableArray *)v405 countByEnumeratingWithState:&v518 objects:v854 count:16];
    }
    while (v407);
  }

  long long v516 = 0u;
  long long v517 = 0u;
  long long v514 = 0u;
  long long v515 = 0u;
  v410 = self->_kCellularCdma1XTxPowerHists;
  uint64_t v411 = [(NSMutableArray *)v410 countByEnumeratingWithState:&v514 objects:v853 count:16];
  if (v411)
  {
    uint64_t v412 = v411;
    uint64_t v413 = *(void *)v515;
    do
    {
      uint64_t v414 = 0;
      do
      {
        if (*(void *)v515 != v413) {
          objc_enumerationMutation(v410);
        }
        PBDataWriterWriteSubmessage();
        ++v414;
      }
      while (v412 != v414);
      uint64_t v412 = [(NSMutableArray *)v410 countByEnumeratingWithState:&v514 objects:v853 count:16];
    }
    while (v412);
  }

  long long v512 = 0u;
  long long v513 = 0u;
  long long v510 = 0u;
  long long v511 = 0u;
  uint64_t v415 = self->_kCellularCdma1XProtocolStackStateHists;
  uint64_t v416 = [(NSMutableArray *)v415 countByEnumeratingWithState:&v510 objects:v852 count:16];
  if (v416)
  {
    uint64_t v417 = v416;
    uint64_t v418 = *(void *)v511;
    do
    {
      uint64_t v419 = 0;
      do
      {
        if (*(void *)v511 != v418) {
          objc_enumerationMutation(v415);
        }
        PBDataWriterWriteSubmessage();
        ++v419;
      }
      while (v417 != v419);
      uint64_t v417 = [(NSMutableArray *)v415 countByEnumeratingWithState:&v510 objects:v852 count:16];
    }
    while (v417);
  }

  long long v508 = 0u;
  long long v509 = 0u;
  long long v506 = 0u;
  long long v507 = 0u;
  uint64_t v420 = self->_kCellularCdma1XConnectionHists;
  uint64_t v421 = [(NSMutableArray *)v420 countByEnumeratingWithState:&v506 objects:v851 count:16];
  if (v421)
  {
    uint64_t v422 = v421;
    uint64_t v423 = *(void *)v507;
    do
    {
      uint64_t v424 = 0;
      do
      {
        if (*(void *)v507 != v423) {
          objc_enumerationMutation(v420);
        }
        PBDataWriterWriteSubmessage();
        ++v424;
      }
      while (v422 != v424);
      uint64_t v422 = [(NSMutableArray *)v420 countByEnumeratingWithState:&v506 objects:v851 count:16];
    }
    while (v422);
  }

  long long v504 = 0u;
  long long v505 = 0u;
  long long v502 = 0u;
  long long v503 = 0u;
  v425 = self->_kCellularCdma1XRrStates;
  uint64_t v426 = [(NSMutableArray *)v425 countByEnumeratingWithState:&v502 objects:v850 count:16];
  if (v426)
  {
    uint64_t v427 = v426;
    uint64_t v428 = *(void *)v503;
    do
    {
      uint64_t v429 = 0;
      do
      {
        if (*(void *)v503 != v428) {
          objc_enumerationMutation(v425);
        }
        PBDataWriterWriteSubmessage();
        ++v429;
      }
      while (v427 != v429);
      uint64_t v427 = [(NSMutableArray *)v425 countByEnumeratingWithState:&v502 objects:v850 count:16];
    }
    while (v427);
  }

  long long v500 = 0u;
  long long v501 = 0u;
  long long v498 = 0u;
  long long v499 = 0u;
  v430 = self->_kCellularCdmaEvdoRxDiversityHists;
  uint64_t v431 = [(NSMutableArray *)v430 countByEnumeratingWithState:&v498 objects:v849 count:16];
  if (v431)
  {
    uint64_t v432 = v431;
    uint64_t v433 = *(void *)v499;
    do
    {
      uint64_t v434 = 0;
      do
      {
        if (*(void *)v499 != v433) {
          objc_enumerationMutation(v430);
        }
        PBDataWriterWriteSubmessage();
        ++v434;
      }
      while (v432 != v434);
      uint64_t v432 = [(NSMutableArray *)v430 countByEnumeratingWithState:&v498 objects:v849 count:16];
    }
    while (v432);
  }

  long long v496 = 0u;
  long long v497 = 0u;
  long long v494 = 0u;
  long long v495 = 0u;
  uint64_t v435 = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
  uint64_t v436 = [(NSMutableArray *)v435 countByEnumeratingWithState:&v494 objects:v848 count:16];
  if (v436)
  {
    uint64_t v437 = v436;
    uint64_t v438 = *(void *)v495;
    do
    {
      uint64_t v439 = 0;
      do
      {
        if (*(void *)v495 != v438) {
          objc_enumerationMutation(v435);
        }
        PBDataWriterWriteSubmessage();
        ++v439;
      }
      while (v437 != v439);
      uint64_t v437 = [(NSMutableArray *)v435 countByEnumeratingWithState:&v494 objects:v848 count:16];
    }
    while (v437);
  }

  long long v492 = 0u;
  long long v493 = 0u;
  long long v490 = 0u;
  long long v491 = 0u;
  uint64_t v440 = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
  uint64_t v441 = [(NSMutableArray *)v440 countByEnumeratingWithState:&v490 objects:v847 count:16];
  if (v441)
  {
    uint64_t v442 = v441;
    uint64_t v443 = *(void *)v491;
    do
    {
      uint64_t v444 = 0;
      do
      {
        if (*(void *)v491 != v443) {
          objc_enumerationMutation(v440);
        }
        PBDataWriterWriteSubmessage();
        ++v444;
      }
      while (v442 != v444);
      uint64_t v442 = [(NSMutableArray *)v440 countByEnumeratingWithState:&v490 objects:v847 count:16];
    }
    while (v442);
  }

  long long v488 = 0u;
  long long v489 = 0u;
  long long v486 = 0u;
  long long v487 = 0u;
  v445 = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
  uint64_t v446 = [(NSMutableArray *)v445 countByEnumeratingWithState:&v486 objects:v846 count:16];
  if (v446)
  {
    uint64_t v447 = v446;
    uint64_t v448 = *(void *)v487;
    do
    {
      uint64_t v449 = 0;
      do
      {
        if (*(void *)v487 != v448) {
          objc_enumerationMutation(v445);
        }
        PBDataWriterWriteSubmessage();
        ++v449;
      }
      while (v447 != v449);
      uint64_t v447 = [(NSMutableArray *)v445 countByEnumeratingWithState:&v486 objects:v846 count:16];
    }
    while (v447);
  }

  long long v484 = 0u;
  long long v485 = 0u;
  long long v482 = 0u;
  long long v483 = 0u;
  uint64_t v450 = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
  uint64_t v451 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v482 objects:v845 count:16];
  if (v451)
  {
    uint64_t v452 = v451;
    uint64_t v453 = *(void *)v483;
    do
    {
      uint64_t v454 = 0;
      do
      {
        if (*(void *)v483 != v453) {
          objc_enumerationMutation(v450);
        }
        PBDataWriterWriteSubmessage();
        ++v454;
      }
      while (v452 != v454);
      uint64_t v452 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v482 objects:v845 count:16];
    }
    while (v452);
  }

  long long v480 = 0u;
  long long v481 = 0u;
  long long v478 = 0u;
  long long v479 = 0u;
  uint64_t v455 = self->_kCellularCdmaEvdoTxPowerHists;
  uint64_t v456 = [(NSMutableArray *)v455 countByEnumeratingWithState:&v478 objects:v844 count:16];
  if (v456)
  {
    uint64_t v457 = v456;
    uint64_t v458 = *(void *)v479;
    do
    {
      uint64_t v459 = 0;
      do
      {
        if (*(void *)v479 != v458) {
          objc_enumerationMutation(v455);
        }
        PBDataWriterWriteSubmessage();
        ++v459;
      }
      while (v457 != v459);
      uint64_t v457 = [(NSMutableArray *)v455 countByEnumeratingWithState:&v478 objects:v844 count:16];
    }
    while (v457);
  }

  long long v476 = 0u;
  long long v477 = 0u;
  long long v474 = 0u;
  long long v475 = 0u;
  v460 = self->_kCellularCdmaEvdoProtocolStackStateHists;
  uint64_t v461 = [(NSMutableArray *)v460 countByEnumeratingWithState:&v474 objects:v843 count:16];
  if (v461)
  {
    uint64_t v462 = v461;
    uint64_t v463 = *(void *)v475;
    do
    {
      uint64_t v464 = 0;
      do
      {
        if (*(void *)v475 != v463) {
          objc_enumerationMutation(v460);
        }
        PBDataWriterWriteSubmessage();
        ++v464;
      }
      while (v462 != v464);
      uint64_t v462 = [(NSMutableArray *)v460 countByEnumeratingWithState:&v474 objects:v843 count:16];
    }
    while (v462);
  }

  long long v472 = 0u;
  long long v473 = 0u;
  long long v470 = 0u;
  long long v471 = 0u;
  v465 = self->_kCellularCdmaEvdoRrStates;
  uint64_t v466 = [(NSMutableArray *)v465 countByEnumeratingWithState:&v470 objects:v842 count:16];
  if (v466)
  {
    uint64_t v467 = v466;
    uint64_t v468 = *(void *)v471;
    do
    {
      uint64_t v469 = 0;
      do
      {
        if (*(void *)v471 != v468) {
          objc_enumerationMutation(v465);
        }
        PBDataWriterWriteSubmessage();
        ++v469;
      }
      while (v467 != v469);
      uint64_t v467 = [(NSMutableArray *)v465 countByEnumeratingWithState:&v470 objects:v842 count:16];
    }
    while (v467);
  }
}

- (void)copyTo:(id)a3
{
  id v376 = a3;
  if ([(PowerlogMetricLog *)self kCellularPerClientProfileTriggerCountsCount])
  {
    [v376 clearKCellularPerClientProfileTriggerCounts];
    unint64_t v4 = [(PowerlogMetricLog *)self kCellularPerClientProfileTriggerCountsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PowerlogMetricLog *)self kCellularPerClientProfileTriggerCountAtIndex:i];
        [v376 addKCellularPerClientProfileTriggerCount:v7];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularProtocolStackCpuStatsCount])
  {
    [v376 clearKCellularProtocolStackCpuStats];
    unint64_t v8 = [(PowerlogMetricLog *)self kCellularProtocolStackCpuStatsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(PowerlogMetricLog *)self kCellularProtocolStackCpuStatsAtIndex:j];
        [v376 addKCellularProtocolStackCpuStats:v11];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularPeripheralStatsCount])
  {
    [v376 clearKCellularPeripheralStats];
    unint64_t v12 = [(PowerlogMetricLog *)self kCellularPeripheralStatsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(PowerlogMetricLog *)self kCellularPeripheralStatsAtIndex:k];
        [v376 addKCellularPeripheralStats:v15];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularDvfsStatsCount])
  {
    [v376 clearKCellularDvfsStats];
    unint64_t v16 = [(PowerlogMetricLog *)self kCellularDvfsStatsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(PowerlogMetricLog *)self kCellularDvfsStatsAtIndex:m];
        [v376 addKCellularDvfsStats:v19];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteWcdmaGsmHwStatsCount])
  {
    [v376 clearKCellularLteWcdmaGsmHwStats];
    unint64_t v20 = [(PowerlogMetricLog *)self kCellularLteWcdmaGsmHwStatsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(PowerlogMetricLog *)self kCellularLteWcdmaGsmHwStatsAtIndex:n];
        [v376 addKCellularLteWcdmaGsmHwStats:v23];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteTdsGsmHwStatsCount])
  {
    [v376 clearKCellularLteTdsGsmHwStats];
    unint64_t v24 = [(PowerlogMetricLog *)self kCellularLteTdsGsmHwStatsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(PowerlogMetricLog *)self kCellularLteTdsGsmHwStatsAtIndex:ii];
        [v376 addKCellularLteTdsGsmHwStats:v27];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularPmuAverageCurrentsCount])
  {
    [v376 clearKCellularPmuAverageCurrents];
    unint64_t v28 = [(PowerlogMetricLog *)self kCellularPmuAverageCurrentsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (juint64_t j = 0; jj != v29; ++jj)
      {
        uint64_t v31 = [(PowerlogMetricLog *)self kCellularPmuAverageCurrentAtIndex:jj];
        [v376 addKCellularPmuAverageCurrent:v31];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularFwCoreStatsCount])
  {
    [v376 clearKCellularFwCoreStats];
    unint64_t v32 = [(PowerlogMetricLog *)self kCellularFwCoreStatsCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (kuint64_t k = 0; kk != v33; ++kk)
      {
        uint64_t v35 = [(PowerlogMetricLog *)self kCellularFwCoreStatsAtIndex:kk];
        [v376 addKCellularFwCoreStats:v35];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteWcdmaTdsHwStatsCount])
  {
    [v376 clearKCellularLteWcdmaTdsHwStats];
    unint64_t v36 = [(PowerlogMetricLog *)self kCellularLteWcdmaTdsHwStatsCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (muint64_t m = 0; mm != v37; ++mm)
      {
        uint64_t v39 = [(PowerlogMetricLog *)self kCellularLteWcdmaTdsHwStatsAtIndex:mm];
        [v376 addKCellularLteWcdmaTdsHwStats:v39];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularPmicHwStatsCount])
  {
    [v376 clearKCellularPmicHwStats];
    unint64_t v40 = [(PowerlogMetricLog *)self kCellularPmicHwStatsCount];
    if (v40)
    {
      unint64_t v41 = v40;
      for (nuint64_t n = 0; nn != v41; ++nn)
      {
        uint64_t v43 = [(PowerlogMetricLog *)self kCellularPmicHwStatsAtIndex:nn];
        [v376 addKCellularPmicHwStats:v43];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsRrcStatesCount])
  {
    [v376 clearKCellularTdsRrcStates];
    unint64_t v44 = [(PowerlogMetricLog *)self kCellularTdsRrcStatesCount];
    if (v44)
    {
      unint64_t v45 = v44;
      for (uint64_t i1 = 0; i1 != v45; ++i1)
      {
        uint64_t v47 = [(PowerlogMetricLog *)self kCellularTdsRrcStateAtIndex:i1];
        [v376 addKCellularTdsRrcState:v47];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteRrcStatesCount])
  {
    [v376 clearKCellularLteRrcStates];
    unint64_t v48 = [(PowerlogMetricLog *)self kCellularLteRrcStatesCount];
    if (v48)
    {
      unint64_t v49 = v48;
      for (uint64_t i2 = 0; i2 != v49; ++i2)
      {
        uint64_t v51 = [(PowerlogMetricLog *)self kCellularLteRrcStateAtIndex:i2];
        [v376 addKCellularLteRrcState:v51];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLtePagingCyclesCount])
  {
    [v376 clearKCellularLtePagingCycles];
    unint64_t v52 = [(PowerlogMetricLog *)self kCellularLtePagingCyclesCount];
    if (v52)
    {
      unint64_t v53 = v52;
      for (uint64_t i3 = 0; i3 != v53; ++i3)
      {
        uint64_t v55 = [(PowerlogMetricLog *)self kCellularLtePagingCycleAtIndex:i3];
        [v376 addKCellularLtePagingCycle:v55];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteCdrxConfigsCount])
  {
    [v376 clearKCellularLteCdrxConfigs];
    unint64_t v56 = [(PowerlogMetricLog *)self kCellularLteCdrxConfigsCount];
    if (v56)
    {
      unint64_t v57 = v56;
      for (uint64_t i4 = 0; i4 != v57; ++i4)
      {
        uint64_t v59 = [(PowerlogMetricLog *)self kCellularLteCdrxConfigAtIndex:i4];
        [v376 addKCellularLteCdrxConfig:v59];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteRadioLinkFailuresCount])
  {
    [v376 clearKCellularLteRadioLinkFailures];
    unint64_t v60 = [(PowerlogMetricLog *)self kCellularLteRadioLinkFailuresCount];
    if (v60)
    {
      unint64_t v61 = v60;
      for (uint64_t i5 = 0; i5 != v61; ++i5)
      {
        uint64_t v63 = [(PowerlogMetricLog *)self kCellularLteRadioLinkFailureAtIndex:i5];
        [v376 addKCellularLteRadioLinkFailure:v63];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLtePdcchStateStatsCount])
  {
    [v376 clearKCellularLtePdcchStateStats];
    unint64_t v64 = [(PowerlogMetricLog *)self kCellularLtePdcchStateStatsCount];
    if (v64)
    {
      unint64_t v65 = v64;
      for (uint64_t i6 = 0; i6 != v65; ++i6)
      {
        uint64_t v67 = [(PowerlogMetricLog *)self kCellularLtePdcchStateStatsAtIndex:i6];
        [v376 addKCellularLtePdcchStateStats:v67];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLqmStateChangesCount])
  {
    [v376 clearKCellularLqmStateChanges];
    unint64_t v68 = [(PowerlogMetricLog *)self kCellularLqmStateChangesCount];
    if (v68)
    {
      unint64_t v69 = v68;
      for (uint64_t i7 = 0; i7 != v69; ++i7)
      {
        uint64_t v71 = [(PowerlogMetricLog *)self kCellularLqmStateChangeAtIndex:i7];
        [v376 addKCellularLqmStateChange:v71];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularServiceLostsCount])
  {
    [v376 clearKCellularServiceLosts];
    unint64_t v72 = [(PowerlogMetricLog *)self kCellularServiceLostsCount];
    if (v72)
    {
      unint64_t v73 = v72;
      for (uint64_t i8 = 0; i8 != v73; ++i8)
      {
        v75 = [(PowerlogMetricLog *)self kCellularServiceLostAtIndex:i8];
        [v376 addKCellularServiceLost:v75];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularGsmServingCellRssiHistsCount])
  {
    [v376 clearKCellularGsmServingCellRssiHists];
    unint64_t v76 = [(PowerlogMetricLog *)self kCellularGsmServingCellRssiHistsCount];
    if (v76)
    {
      unint64_t v77 = v76;
      for (uint64_t i9 = 0; i9 != v77; ++i9)
      {
        uint64_t v79 = [(PowerlogMetricLog *)self kCellularGsmServingCellRssiHistAtIndex:i9];
        [v376 addKCellularGsmServingCellRssiHist:v79];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularGsmServingCellSnrHistsCount])
  {
    [v376 clearKCellularGsmServingCellSnrHists];
    unint64_t v80 = [(PowerlogMetricLog *)self kCellularGsmServingCellSnrHistsCount];
    if (v80)
    {
      unint64_t v81 = v80;
      for (uint64_t i10 = 0; i10 != v81; ++i10)
      {
        uint64_t v83 = [(PowerlogMetricLog *)self kCellularGsmServingCellSnrHistAtIndex:i10];
        [v376 addKCellularGsmServingCellSnrHist:v83];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularGsmTxPowerHistsCount])
  {
    [v376 clearKCellularGsmTxPowerHists];
    unint64_t v84 = [(PowerlogMetricLog *)self kCellularGsmTxPowerHistsCount];
    if (v84)
    {
      unint64_t v85 = v84;
      for (uint64_t i11 = 0; i11 != v85; ++i11)
      {
        uint64_t v87 = [(PowerlogMetricLog *)self kCellularGsmTxPowerHistAtIndex:i11];
        [v376 addKCellularGsmTxPowerHist:v87];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularGsmConnectedModeHistsCount])
  {
    [v376 clearKCellularGsmConnectedModeHists];
    unint64_t v88 = [(PowerlogMetricLog *)self kCellularGsmConnectedModeHistsCount];
    if (v88)
    {
      unint64_t v89 = v88;
      for (uint64_t i12 = 0; i12 != v89; ++i12)
      {
        uint64_t v91 = [(PowerlogMetricLog *)self kCellularGsmConnectedModeHistAtIndex:i12];
        [v376 addKCellularGsmConnectedModeHist:v91];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularGsmL1StatesCount])
  {
    [v376 clearKCellularGsmL1States];
    unint64_t v92 = [(PowerlogMetricLog *)self kCellularGsmL1StatesCount];
    if (v92)
    {
      unint64_t v93 = v92;
      for (uint64_t i13 = 0; i13 != v93; ++i13)
      {
        v95 = [(PowerlogMetricLog *)self kCellularGsmL1StateAtIndex:i13];
        [v376 addKCellularGsmL1State:v95];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaCpcStatsCount])
  {
    [v376 clearKCellularWcdmaCpcStats];
    unint64_t v96 = [(PowerlogMetricLog *)self kCellularWcdmaCpcStatsCount];
    if (v96)
    {
      unint64_t v97 = v96;
      for (uint64_t i14 = 0; i14 != v97; ++i14)
      {
        uint64_t v99 = [(PowerlogMetricLog *)self kCellularWcdmaCpcStatAtIndex:i14];
        [v376 addKCellularWcdmaCpcStat:v99];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaRxDiversityHistsCount])
  {
    [v376 clearKCellularWcdmaRxDiversityHists];
    unint64_t v100 = [(PowerlogMetricLog *)self kCellularWcdmaRxDiversityHistsCount];
    if (v100)
    {
      unint64_t v101 = v100;
      for (uint64_t i15 = 0; i15 != v101; ++i15)
      {
        uint64_t v103 = [(PowerlogMetricLog *)self kCellularWcdmaRxDiversityHistAtIndex:i15];
        [v376 addKCellularWcdmaRxDiversityHist:v103];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaServingCellRx0RssiHistsCount])
  {
    [v376 clearKCellularWcdmaServingCellRx0RssiHists];
    unint64_t v104 = [(PowerlogMetricLog *)self kCellularWcdmaServingCellRx0RssiHistsCount];
    if (v104)
    {
      unint64_t v105 = v104;
      for (uint64_t i16 = 0; i16 != v105; ++i16)
      {
        uint64_t v107 = [(PowerlogMetricLog *)self kCellularWcdmaServingCellRx0RssiHistAtIndex:i16];
        [v376 addKCellularWcdmaServingCellRx0RssiHist:v107];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaServingCellRx1RssiHistsCount])
  {
    [v376 clearKCellularWcdmaServingCellRx1RssiHists];
    unint64_t v108 = [(PowerlogMetricLog *)self kCellularWcdmaServingCellRx1RssiHistsCount];
    if (v108)
    {
      unint64_t v109 = v108;
      for (uint64_t i17 = 0; i17 != v109; ++i17)
      {
        uint64_t v111 = [(PowerlogMetricLog *)self kCellularWcdmaServingCellRx1RssiHistAtIndex:i17];
        [v376 addKCellularWcdmaServingCellRx1RssiHist:v111];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaServingCellRx0EcNoHistsCount])
  {
    [v376 clearKCellularWcdmaServingCellRx0EcNoHists];
    unint64_t v112 = [(PowerlogMetricLog *)self kCellularWcdmaServingCellRx0EcNoHistsCount];
    if (v112)
    {
      unint64_t v113 = v112;
      for (uint64_t i18 = 0; i18 != v113; ++i18)
      {
        v115 = [(PowerlogMetricLog *)self kCellularWcdmaServingCellRx0EcNoHistAtIndex:i18];
        [v376 addKCellularWcdmaServingCellRx0EcNoHist:v115];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaServingCellRx1EcNoHistsCount])
  {
    [v376 clearKCellularWcdmaServingCellRx1EcNoHists];
    unint64_t v116 = [(PowerlogMetricLog *)self kCellularWcdmaServingCellRx1EcNoHistsCount];
    if (v116)
    {
      unint64_t v117 = v116;
      for (uint64_t i19 = 0; i19 != v117; ++i19)
      {
        uint64_t v119 = [(PowerlogMetricLog *)self kCellularWcdmaServingCellRx1EcNoHistAtIndex:i19];
        [v376 addKCellularWcdmaServingCellRx1EcNoHist:v119];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaTxPowerHistsCount])
  {
    [v376 clearKCellularWcdmaTxPowerHists];
    unint64_t v120 = [(PowerlogMetricLog *)self kCellularWcdmaTxPowerHistsCount];
    if (v120)
    {
      unint64_t v121 = v120;
      for (uint64_t i20 = 0; i20 != v121; ++i20)
      {
        uint64_t v123 = [(PowerlogMetricLog *)self kCellularWcdmaTxPowerHistAtIndex:i20];
        [v376 addKCellularWcdmaTxPowerHist:v123];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaReceiverStatusOnC0HistsCount])
  {
    [v376 clearKCellularWcdmaReceiverStatusOnC0Hists];
    unint64_t v124 = [(PowerlogMetricLog *)self kCellularWcdmaReceiverStatusOnC0HistsCount];
    if (v124)
    {
      unint64_t v125 = v124;
      for (uint64_t i21 = 0; i21 != v125; ++i21)
      {
        uint64_t v127 = [(PowerlogMetricLog *)self kCellularWcdmaReceiverStatusOnC0HistAtIndex:i21];
        [v376 addKCellularWcdmaReceiverStatusOnC0Hist:v127];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaReceiverStatusOnC1HistsCount])
  {
    [v376 clearKCellularWcdmaReceiverStatusOnC1Hists];
    unint64_t v128 = [(PowerlogMetricLog *)self kCellularWcdmaReceiverStatusOnC1HistsCount];
    if (v128)
    {
      unint64_t v129 = v128;
      for (uint64_t i22 = 0; i22 != v129; ++i22)
      {
        uint64_t v131 = [(PowerlogMetricLog *)self kCellularWcdmaReceiverStatusOnC1HistAtIndex:i22];
        [v376 addKCellularWcdmaReceiverStatusOnC1Hist:v131];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaCarrierStatusHistsCount])
  {
    [v376 clearKCellularWcdmaCarrierStatusHists];
    unint64_t v132 = [(PowerlogMetricLog *)self kCellularWcdmaCarrierStatusHistsCount];
    if (v132)
    {
      unint64_t v133 = v132;
      for (uint64_t i23 = 0; i23 != v133; ++i23)
      {
        uint64_t v135 = [(PowerlogMetricLog *)self kCellularWcdmaCarrierStatusHistAtIndex:i23];
        [v376 addKCellularWcdmaCarrierStatusHist:v135];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaRabModeHistsCount])
  {
    [v376 clearKCellularWcdmaRabModeHists];
    unint64_t v136 = [(PowerlogMetricLog *)self kCellularWcdmaRabModeHistsCount];
    if (v136)
    {
      unint64_t v137 = v136;
      for (uint64_t i24 = 0; i24 != v137; ++i24)
      {
        uint64_t v139 = [(PowerlogMetricLog *)self kCellularWcdmaRabModeHistAtIndex:i24];
        [v376 addKCellularWcdmaRabModeHist:v139];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaRabTypeHistsCount])
  {
    [v376 clearKCellularWcdmaRabTypeHists];
    unint64_t v140 = [(PowerlogMetricLog *)self kCellularWcdmaRabTypeHistsCount];
    if (v140)
    {
      unint64_t v141 = v140;
      for (uint64_t i25 = 0; i25 != v141; ++i25)
      {
        uint64_t v143 = [(PowerlogMetricLog *)self kCellularWcdmaRabTypeHistAtIndex:i25];
        [v376 addKCellularWcdmaRabTypeHist:v143];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaRrcConnectionStatesCount])
  {
    [v376 clearKCellularWcdmaRrcConnectionStates];
    unint64_t v144 = [(PowerlogMetricLog *)self kCellularWcdmaRrcConnectionStatesCount];
    if (v144)
    {
      unint64_t v145 = v144;
      for (uint64_t i26 = 0; i26 != v145; ++i26)
      {
        uint64_t v147 = [(PowerlogMetricLog *)self kCellularWcdmaRrcConnectionStateAtIndex:i26];
        [v376 addKCellularWcdmaRrcConnectionState:v147];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaRrcConfigurationsCount])
  {
    [v376 clearKCellularWcdmaRrcConfigurations];
    unint64_t v148 = [(PowerlogMetricLog *)self kCellularWcdmaRrcConfigurationsCount];
    if (v148)
    {
      unint64_t v149 = v148;
      for (uint64_t i27 = 0; i27 != v149; ++i27)
      {
        uint64_t v151 = [(PowerlogMetricLog *)self kCellularWcdmaRrcConfigurationAtIndex:i27];
        [v376 addKCellularWcdmaRrcConfiguration:v151];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaRabStatusCount])
  {
    [v376 clearKCellularWcdmaRabStatus];
    unint64_t v152 = [(PowerlogMetricLog *)self kCellularWcdmaRabStatusCount];
    if (v152)
    {
      unint64_t v153 = v152;
      for (uint64_t i28 = 0; i28 != v153; ++i28)
      {
        uint64_t v155 = [(PowerlogMetricLog *)self kCellularWcdmaRabStatusAtIndex:i28];
        [v376 addKCellularWcdmaRabStatus:v155];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaL1StatesCount])
  {
    [v376 clearKCellularWcdmaL1States];
    unint64_t v156 = [(PowerlogMetricLog *)self kCellularWcdmaL1StatesCount];
    if (v156)
    {
      unint64_t v157 = v156;
      for (uint64_t i29 = 0; i29 != v157; ++i29)
      {
        uint64_t v159 = [(PowerlogMetricLog *)self kCellularWcdmaL1StateAtIndex:i29];
        [v376 addKCellularWcdmaL1State:v159];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaDataInactivityBeforeIdlesCount])
  {
    [v376 clearKCellularWcdmaDataInactivityBeforeIdles];
    unint64_t v160 = [(PowerlogMetricLog *)self kCellularWcdmaDataInactivityBeforeIdlesCount];
    if (v160)
    {
      unint64_t v161 = v160;
      for (uint64_t i30 = 0; i30 != v161; ++i30)
      {
        uint64_t v163 = [(PowerlogMetricLog *)self kCellularWcdmaDataInactivityBeforeIdleAtIndex:i30];
        [v376 addKCellularWcdmaDataInactivityBeforeIdle:v163];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaIdleToConnectedUserDatasCount])
  {
    [v376 clearKCellularWcdmaIdleToConnectedUserDatas];
    unint64_t v164 = [(PowerlogMetricLog *)self kCellularWcdmaIdleToConnectedUserDatasCount];
    if (v164)
    {
      unint64_t v165 = v164;
      for (uint64_t i31 = 0; i31 != v165; ++i31)
      {
        uint64_t v167 = [(PowerlogMetricLog *)self kCellularWcdmaIdleToConnectedUserDataAtIndex:i31];
        [v376 addKCellularWcdmaIdleToConnectedUserData:v167];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularWcdmaVadHistsCount])
  {
    [v376 clearKCellularWcdmaVadHists];
    unint64_t v168 = [(PowerlogMetricLog *)self kCellularWcdmaVadHistsCount];
    if (v168)
    {
      unint64_t v169 = v168;
      for (uint64_t i32 = 0; i32 != v169; ++i32)
      {
        uint64_t v171 = [(PowerlogMetricLog *)self kCellularWcdmaVadHistAtIndex:i32];
        [v376 addKCellularWcdmaVadHist:v171];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsRxDiversityHistsCount])
  {
    [v376 clearKCellularTdsRxDiversityHists];
    unint64_t v172 = [(PowerlogMetricLog *)self kCellularTdsRxDiversityHistsCount];
    if (v172)
    {
      unint64_t v173 = v172;
      for (uint64_t i33 = 0; i33 != v173; ++i33)
      {
        uint64_t v175 = [(PowerlogMetricLog *)self kCellularTdsRxDiversityHistAtIndex:i33];
        [v376 addKCellularTdsRxDiversityHist:v175];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsServingCellRx0RssiHistsCount])
  {
    [v376 clearKCellularTdsServingCellRx0RssiHists];
    unint64_t v176 = [(PowerlogMetricLog *)self kCellularTdsServingCellRx0RssiHistsCount];
    if (v176)
    {
      unint64_t v177 = v176;
      for (uint64_t i34 = 0; i34 != v177; ++i34)
      {
        uint64_t v179 = [(PowerlogMetricLog *)self kCellularTdsServingCellRx0RssiHistAtIndex:i34];
        [v376 addKCellularTdsServingCellRx0RssiHist:v179];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsServingCellRx1RssiHistsCount])
  {
    [v376 clearKCellularTdsServingCellRx1RssiHists];
    unint64_t v180 = [(PowerlogMetricLog *)self kCellularTdsServingCellRx1RssiHistsCount];
    if (v180)
    {
      unint64_t v181 = v180;
      for (uint64_t i35 = 0; i35 != v181; ++i35)
      {
        uint64_t v183 = [(PowerlogMetricLog *)self kCellularTdsServingCellRx1RssiHistAtIndex:i35];
        [v376 addKCellularTdsServingCellRx1RssiHist:v183];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsServingCellRx0RscpHistsCount])
  {
    [v376 clearKCellularTdsServingCellRx0RscpHists];
    unint64_t v184 = [(PowerlogMetricLog *)self kCellularTdsServingCellRx0RscpHistsCount];
    if (v184)
    {
      unint64_t v185 = v184;
      for (uint64_t i36 = 0; i36 != v185; ++i36)
      {
        uint64_t v187 = [(PowerlogMetricLog *)self kCellularTdsServingCellRx0RscpHistAtIndex:i36];
        [v376 addKCellularTdsServingCellRx0RscpHist:v187];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsServingCellRx1RscpHistsCount])
  {
    [v376 clearKCellularTdsServingCellRx1RscpHists];
    unint64_t v188 = [(PowerlogMetricLog *)self kCellularTdsServingCellRx1RscpHistsCount];
    if (v188)
    {
      unint64_t v189 = v188;
      for (uint64_t i37 = 0; i37 != v189; ++i37)
      {
        uint64_t v191 = [(PowerlogMetricLog *)self kCellularTdsServingCellRx1RscpHistAtIndex:i37];
        [v376 addKCellularTdsServingCellRx1RscpHist:v191];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsTxPowerHistsCount])
  {
    [v376 clearKCellularTdsTxPowerHists];
    unint64_t v192 = [(PowerlogMetricLog *)self kCellularTdsTxPowerHistsCount];
    if (v192)
    {
      unint64_t v193 = v192;
      for (uint64_t i38 = 0; i38 != v193; ++i38)
      {
        uint64_t v195 = [(PowerlogMetricLog *)self kCellularTdsTxPowerHistAtIndex:i38];
        [v376 addKCellularTdsTxPowerHist:v195];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsRabModeHistsCount])
  {
    [v376 clearKCellularTdsRabModeHists];
    unint64_t v196 = [(PowerlogMetricLog *)self kCellularTdsRabModeHistsCount];
    if (v196)
    {
      unint64_t v197 = v196;
      for (uint64_t i39 = 0; i39 != v197; ++i39)
      {
        uint64_t v199 = [(PowerlogMetricLog *)self kCellularTdsRabModeHistAtIndex:i39];
        [v376 addKCellularTdsRabModeHist:v199];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsRabTypeHistsCount])
  {
    [v376 clearKCellularTdsRabTypeHists];
    unint64_t v200 = [(PowerlogMetricLog *)self kCellularTdsRabTypeHistsCount];
    if (v200)
    {
      unint64_t v201 = v200;
      for (uint64_t i40 = 0; i40 != v201; ++i40)
      {
        uint64_t v203 = [(PowerlogMetricLog *)self kCellularTdsRabTypeHistAtIndex:i40];
        [v376 addKCellularTdsRabTypeHist:v203];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularTdsL1StatesCount])
  {
    [v376 clearKCellularTdsL1States];
    unint64_t v204 = [(PowerlogMetricLog *)self kCellularTdsL1StatesCount];
    if (v204)
    {
      unint64_t v205 = v204;
      for (uint64_t i41 = 0; i41 != v205; ++i41)
      {
        uint64_t v207 = [(PowerlogMetricLog *)self kCellularTdsL1StateAtIndex:i41];
        [v376 addKCellularTdsL1State:v207];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteFwDuplexModesCount])
  {
    [v376 clearKCellularLteFwDuplexModes];
    unint64_t v208 = [(PowerlogMetricLog *)self kCellularLteFwDuplexModesCount];
    if (v208)
    {
      unint64_t v209 = v208;
      for (uint64_t i42 = 0; i42 != v209; ++i42)
      {
        uint64_t v211 = [(PowerlogMetricLog *)self kCellularLteFwDuplexModeAtIndex:i42];
        [v376 addKCellularLteFwDuplexMode:v211];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteServingCellRsrpHistsCount])
  {
    [v376 clearKCellularLteServingCellRsrpHists];
    unint64_t v212 = [(PowerlogMetricLog *)self kCellularLteServingCellRsrpHistsCount];
    if (v212)
    {
      unint64_t v213 = v212;
      for (uint64_t i43 = 0; i43 != v213; ++i43)
      {
        v215 = [(PowerlogMetricLog *)self kCellularLteServingCellRsrpHistAtIndex:i43];
        [v376 addKCellularLteServingCellRsrpHist:v215];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteServingCellSinrHistsCount])
  {
    [v376 clearKCellularLteServingCellSinrHists];
    unint64_t v216 = [(PowerlogMetricLog *)self kCellularLteServingCellSinrHistsCount];
    if (v216)
    {
      unint64_t v217 = v216;
      for (uint64_t i44 = 0; i44 != v217; ++i44)
      {
        uint64_t v219 = [(PowerlogMetricLog *)self kCellularLteServingCellSinrHistAtIndex:i44];
        [v376 addKCellularLteServingCellSinrHist:v219];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteSleepStateHistsCount])
  {
    [v376 clearKCellularLteSleepStateHists];
    unint64_t v220 = [(PowerlogMetricLog *)self kCellularLteSleepStateHistsCount];
    if (v220)
    {
      unint64_t v221 = v220;
      for (uint64_t i45 = 0; i45 != v221; ++i45)
      {
        uint64_t v223 = [(PowerlogMetricLog *)self kCellularLteSleepStateHistAtIndex:i45];
        [v376 addKCellularLteSleepStateHist:v223];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteTxPowerHistsCount])
  {
    [v376 clearKCellularLteTxPowerHists];
    unint64_t v224 = [(PowerlogMetricLog *)self kCellularLteTxPowerHistsCount];
    if (v224)
    {
      unint64_t v225 = v224;
      for (uint64_t i46 = 0; i46 != v225; ++i46)
      {
        uint64_t v227 = [(PowerlogMetricLog *)self kCellularLteTxPowerHistAtIndex:i46];
        [v376 addKCellularLteTxPowerHist:v227];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteDlSccStateHistsCount])
  {
    [v376 clearKCellularLteDlSccStateHists];
    unint64_t v228 = [(PowerlogMetricLog *)self kCellularLteDlSccStateHistsCount];
    if (v228)
    {
      unint64_t v229 = v228;
      for (uint64_t i47 = 0; i47 != v229; ++i47)
      {
        uint64_t v231 = [(PowerlogMetricLog *)self kCellularLteDlSccStateHistAtIndex:i47];
        [v376 addKCellularLteDlSccStateHist:v231];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteUlSccStateHistsCount])
  {
    [v376 clearKCellularLteUlSccStateHists];
    unint64_t v232 = [(PowerlogMetricLog *)self kCellularLteUlSccStateHistsCount];
    if (v232)
    {
      unint64_t v233 = v232;
      for (uint64_t i48 = 0; i48 != v233; ++i48)
      {
        v235 = [(PowerlogMetricLog *)self kCellularLteUlSccStateHistAtIndex:i48];
        [v376 addKCellularLteUlSccStateHist:v235];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteAdvancedRxStateHistsCount])
  {
    [v376 clearKCellularLteAdvancedRxStateHists];
    unint64_t v236 = [(PowerlogMetricLog *)self kCellularLteAdvancedRxStateHistsCount];
    if (v236)
    {
      unint64_t v237 = v236;
      for (uint64_t i49 = 0; i49 != v237; ++i49)
      {
        uint64_t v239 = [(PowerlogMetricLog *)self kCellularLteAdvancedRxStateHistAtIndex:i49];
        [v376 addKCellularLteAdvancedRxStateHist:v239];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteComponentCarrierInfosCount])
  {
    [v376 clearKCellularLteComponentCarrierInfos];
    unint64_t v240 = [(PowerlogMetricLog *)self kCellularLteComponentCarrierInfosCount];
    if (v240)
    {
      unint64_t v241 = v240;
      for (uint64_t i50 = 0; i50 != v241; ++i50)
      {
        uint64_t v243 = [(PowerlogMetricLog *)self kCellularLteComponentCarrierInfoAtIndex:i50];
        [v376 addKCellularLteComponentCarrierInfo:v243];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteRxTxStateHistsCount])
  {
    [v376 clearKCellularLteRxTxStateHists];
    unint64_t v244 = [(PowerlogMetricLog *)self kCellularLteRxTxStateHistsCount];
    if (v244)
    {
      unint64_t v245 = v244;
      for (uint64_t i51 = 0; i51 != v245; ++i51)
      {
        uint64_t v247 = [(PowerlogMetricLog *)self kCellularLteRxTxStateHistAtIndex:i51];
        [v376 addKCellularLteRxTxStateHist:v247];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteTotalDlTbsHistsCount])
  {
    [v376 clearKCellularLteTotalDlTbsHists];
    unint64_t v248 = [(PowerlogMetricLog *)self kCellularLteTotalDlTbsHistsCount];
    if (v248)
    {
      unint64_t v249 = v248;
      for (uint64_t i52 = 0; i52 != v249; ++i52)
      {
        uint64_t v251 = [(PowerlogMetricLog *)self kCellularLteTotalDlTbsHistAtIndex:i52];
        [v376 addKCellularLteTotalDlTbsHist:v251];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteDataInactivityBeforeIdlesCount])
  {
    [v376 clearKCellularLteDataInactivityBeforeIdles];
    unint64_t v252 = [(PowerlogMetricLog *)self kCellularLteDataInactivityBeforeIdlesCount];
    if (v252)
    {
      unint64_t v253 = v252;
      for (uint64_t i53 = 0; i53 != v253; ++i53)
      {
        v255 = [(PowerlogMetricLog *)self kCellularLteDataInactivityBeforeIdleAtIndex:i53];
        [v376 addKCellularLteDataInactivityBeforeIdle:v255];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteIdleToConnectedUserDatasCount])
  {
    [v376 clearKCellularLteIdleToConnectedUserDatas];
    unint64_t v256 = [(PowerlogMetricLog *)self kCellularLteIdleToConnectedUserDatasCount];
    if (v256)
    {
      unint64_t v257 = v256;
      for (uint64_t i54 = 0; i54 != v257; ++i54)
      {
        uint64_t v259 = [(PowerlogMetricLog *)self kCellularLteIdleToConnectedUserDataAtIndex:i54];
        [v376 addKCellularLteIdleToConnectedUserData:v259];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteDlSccStateHistV3sCount])
  {
    [v376 clearKCellularLteDlSccStateHistV3s];
    unint64_t v260 = [(PowerlogMetricLog *)self kCellularLteDlSccStateHistV3sCount];
    if (v260)
    {
      unint64_t v261 = v260;
      for (uint64_t i55 = 0; i55 != v261; ++i55)
      {
        uint64_t v263 = [(PowerlogMetricLog *)self kCellularLteDlSccStateHistV3AtIndex:i55];
        [v376 addKCellularLteDlSccStateHistV3:v263];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLteRxDiversityHistsCount])
  {
    [v376 clearKCellularLteRxDiversityHists];
    unint64_t v264 = [(PowerlogMetricLog *)self kCellularLteRxDiversityHistsCount];
    if (v264)
    {
      unint64_t v265 = v264;
      for (uint64_t i56 = 0; i56 != v265; ++i56)
      {
        uint64_t v267 = [(PowerlogMetricLog *)self kCellularLteRxDiversityHistAtIndex:i56];
        [v376 addKCellularLteRxDiversityHist:v267];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularLtePdcchStateHistsCount])
  {
    [v376 clearKCellularLtePdcchStateHists];
    unint64_t v268 = [(PowerlogMetricLog *)self kCellularLtePdcchStateHistsCount];
    if (v268)
    {
      unint64_t v269 = v268;
      for (uint64_t i57 = 0; i57 != v269; ++i57)
      {
        uint64_t v271 = [(PowerlogMetricLog *)self kCellularLtePdcchStateHistAtIndex:i57];
        [v376 addKCellularLtePdcchStateHist:v271];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularProtocolStackStateHistsCount])
  {
    [v376 clearKCellularProtocolStackStateHists];
    unint64_t v272 = [(PowerlogMetricLog *)self kCellularProtocolStackStateHistsCount];
    if (v272)
    {
      unint64_t v273 = v272;
      for (uint64_t i58 = 0; i58 != v273; ++i58)
      {
        uint64_t v275 = [(PowerlogMetricLog *)self kCellularProtocolStackStateHistAtIndex:i58];
        [v376 addKCellularProtocolStackStateHist:v275];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCellPlmnSearchCountsCount])
  {
    [v376 clearKCellularCellPlmnSearchCounts];
    unint64_t v276 = [(PowerlogMetricLog *)self kCellularCellPlmnSearchCountsCount];
    if (v276)
    {
      unint64_t v277 = v276;
      for (uint64_t i59 = 0; i59 != v277; ++i59)
      {
        uint64_t v279 = [(PowerlogMetricLog *)self kCellularCellPlmnSearchCountAtIndex:i59];
        [v376 addKCellularCellPlmnSearchCount:v279];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCellPlmnSearchHistsCount])
  {
    [v376 clearKCellularCellPlmnSearchHists];
    unint64_t v280 = [(PowerlogMetricLog *)self kCellularCellPlmnSearchHistsCount];
    if (v280)
    {
      unint64_t v281 = v280;
      for (uint64_t i60 = 0; i60 != v281; ++i60)
      {
        uint64_t v283 = [(PowerlogMetricLog *)self kCellularCellPlmnSearchHistAtIndex:i60];
        [v376 addKCellularCellPlmnSearchHist:v283];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularProtocolStackPowerStatesCount])
  {
    [v376 clearKCellularProtocolStackPowerStates];
    unint64_t v284 = [(PowerlogMetricLog *)self kCellularProtocolStackPowerStatesCount];
    if (v284)
    {
      unint64_t v285 = v284;
      for (uint64_t i61 = 0; i61 != v285; ++i61)
      {
        uint64_t v287 = [(PowerlogMetricLog *)self kCellularProtocolStackPowerStateAtIndex:i61];
        [v376 addKCellularProtocolStackPowerState:v287];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularDownlinkIpPacketFilterStatusCount])
  {
    [v376 clearKCellularDownlinkIpPacketFilterStatus];
    unint64_t v288 = [(PowerlogMetricLog *)self kCellularDownlinkIpPacketFilterStatusCount];
    if (v288)
    {
      unint64_t v289 = v288;
      for (uint64_t i62 = 0; i62 != v289; ++i62)
      {
        uint64_t v291 = [(PowerlogMetricLog *)self kCellularDownlinkIpPacketFilterStatusAtIndex:i62];
        [v376 addKCellularDownlinkIpPacketFilterStatus:v291];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularDownlinkIpPacketDiscardedsCount])
  {
    [v376 clearKCellularDownlinkIpPacketDiscardeds];
    unint64_t v292 = [(PowerlogMetricLog *)self kCellularDownlinkIpPacketDiscardedsCount];
    if (v292)
    {
      unint64_t v293 = v292;
      for (uint64_t i63 = 0; i63 != v293; ++i63)
      {
        uint64_t v295 = [(PowerlogMetricLog *)self kCellularDownlinkIpPacketDiscardedAtIndex:i63];
        [v376 addKCellularDownlinkIpPacketDiscarded:v295];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularServingCellRfBandHistsCount])
  {
    [v376 clearKCellularServingCellRfBandHists];
    unint64_t v296 = [(PowerlogMetricLog *)self kCellularServingCellRfBandHistsCount];
    if (v296)
    {
      unint64_t v297 = v296;
      for (uint64_t i64 = 0; i64 != v297; ++i64)
      {
        uint64_t v299 = [(PowerlogMetricLog *)self kCellularServingCellRfBandHistAtIndex:i64];
        [v376 addKCellularServingCellRfBandHist:v299];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularProtocolStackStateHist2sCount])
  {
    [v376 clearKCellularProtocolStackStateHist2s];
    unint64_t v300 = [(PowerlogMetricLog *)self kCellularProtocolStackStateHist2sCount];
    if (v300)
    {
      unint64_t v301 = v300;
      for (uint64_t i65 = 0; i65 != v301; ++i65)
      {
        uint64_t v303 = [(PowerlogMetricLog *)self kCellularProtocolStackStateHist2AtIndex:i65];
        [v376 addKCellularProtocolStackStateHist2:v303];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularProtocolStackStatesCount])
  {
    [v376 clearKCellularProtocolStackStates];
    unint64_t v304 = [(PowerlogMetricLog *)self kCellularProtocolStackStatesCount];
    if (v304)
    {
      unint64_t v305 = v304;
      for (uint64_t i66 = 0; i66 != v305; ++i66)
      {
        uint64_t v307 = [(PowerlogMetricLog *)self kCellularProtocolStackStateAtIndex:i66];
        [v376 addKCellularProtocolStackState:v307];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdma1XRxDiversityHistsCount])
  {
    [v376 clearKCellularCdma1XRxDiversityHists];
    unint64_t v308 = [(PowerlogMetricLog *)self kCellularCdma1XRxDiversityHistsCount];
    if (v308)
    {
      unint64_t v309 = v308;
      for (uint64_t i67 = 0; i67 != v309; ++i67)
      {
        uint64_t v311 = [(PowerlogMetricLog *)self kCellularCdma1XRxDiversityHistAtIndex:i67];
        [v376 addKCellularCdma1XRxDiversityHist:v311];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdma1XServingCellRx0RssiHistsCount])
  {
    [v376 clearKCellularCdma1XServingCellRx0RssiHists];
    unint64_t v312 = [(PowerlogMetricLog *)self kCellularCdma1XServingCellRx0RssiHistsCount];
    if (v312)
    {
      unint64_t v313 = v312;
      for (uint64_t i68 = 0; i68 != v313; ++i68)
      {
        uint64_t v315 = [(PowerlogMetricLog *)self kCellularCdma1XServingCellRx0RssiHistAtIndex:i68];
        [v376 addKCellularCdma1XServingCellRx0RssiHist:v315];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdma1XServingCellRx1RssiHistsCount])
  {
    [v376 clearKCellularCdma1XServingCellRx1RssiHists];
    unint64_t v316 = [(PowerlogMetricLog *)self kCellularCdma1XServingCellRx1RssiHistsCount];
    if (v316)
    {
      unint64_t v317 = v316;
      for (uint64_t i69 = 0; i69 != v317; ++i69)
      {
        uint64_t v319 = [(PowerlogMetricLog *)self kCellularCdma1XServingCellRx1RssiHistAtIndex:i69];
        [v376 addKCellularCdma1XServingCellRx1RssiHist:v319];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdma1XServingCellRx0EcIoHistsCount])
  {
    [v376 clearKCellularCdma1XServingCellRx0EcIoHists];
    unint64_t v320 = [(PowerlogMetricLog *)self kCellularCdma1XServingCellRx0EcIoHistsCount];
    if (v320)
    {
      unint64_t v321 = v320;
      for (uint64_t i70 = 0; i70 != v321; ++i70)
      {
        uint64_t v323 = [(PowerlogMetricLog *)self kCellularCdma1XServingCellRx0EcIoHistAtIndex:i70];
        [v376 addKCellularCdma1XServingCellRx0EcIoHist:v323];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdma1XServingCellRx1EcIoHistsCount])
  {
    [v376 clearKCellularCdma1XServingCellRx1EcIoHists];
    unint64_t v324 = [(PowerlogMetricLog *)self kCellularCdma1XServingCellRx1EcIoHistsCount];
    if (v324)
    {
      unint64_t v325 = v324;
      for (uint64_t i71 = 0; i71 != v325; ++i71)
      {
        uint64_t v327 = [(PowerlogMetricLog *)self kCellularCdma1XServingCellRx1EcIoHistAtIndex:i71];
        [v376 addKCellularCdma1XServingCellRx1EcIoHist:v327];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdma1XTxPowerHistsCount])
  {
    [v376 clearKCellularCdma1XTxPowerHists];
    unint64_t v328 = [(PowerlogMetricLog *)self kCellularCdma1XTxPowerHistsCount];
    if (v328)
    {
      unint64_t v329 = v328;
      for (uint64_t i72 = 0; i72 != v329; ++i72)
      {
        uint64_t v331 = [(PowerlogMetricLog *)self kCellularCdma1XTxPowerHistAtIndex:i72];
        [v376 addKCellularCdma1XTxPowerHist:v331];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdma1XProtocolStackStateHistsCount])
  {
    [v376 clearKCellularCdma1XProtocolStackStateHists];
    unint64_t v332 = [(PowerlogMetricLog *)self kCellularCdma1XProtocolStackStateHistsCount];
    if (v332)
    {
      unint64_t v333 = v332;
      for (uint64_t i73 = 0; i73 != v333; ++i73)
      {
        uint64_t v335 = [(PowerlogMetricLog *)self kCellularCdma1XProtocolStackStateHistAtIndex:i73];
        [v376 addKCellularCdma1XProtocolStackStateHist:v335];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdma1XConnectionHistsCount])
  {
    [v376 clearKCellularCdma1XConnectionHists];
    unint64_t v336 = [(PowerlogMetricLog *)self kCellularCdma1XConnectionHistsCount];
    if (v336)
    {
      unint64_t v337 = v336;
      for (uint64_t i74 = 0; i74 != v337; ++i74)
      {
        uint64_t v339 = [(PowerlogMetricLog *)self kCellularCdma1XConnectionHistAtIndex:i74];
        [v376 addKCellularCdma1XConnectionHist:v339];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdma1XRrStatesCount])
  {
    [v376 clearKCellularCdma1XRrStates];
    unint64_t v340 = [(PowerlogMetricLog *)self kCellularCdma1XRrStatesCount];
    if (v340)
    {
      unint64_t v341 = v340;
      for (uint64_t i75 = 0; i75 != v341; ++i75)
      {
        uint64_t v343 = [(PowerlogMetricLog *)self kCellularCdma1XRrStateAtIndex:i75];
        [v376 addKCellularCdma1XRrState:v343];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdmaEvdoRxDiversityHistsCount])
  {
    [v376 clearKCellularCdmaEvdoRxDiversityHists];
    unint64_t v344 = [(PowerlogMetricLog *)self kCellularCdmaEvdoRxDiversityHistsCount];
    if (v344)
    {
      unint64_t v345 = v344;
      for (uint64_t i76 = 0; i76 != v345; ++i76)
      {
        uint64_t v347 = [(PowerlogMetricLog *)self kCellularCdmaEvdoRxDiversityHistAtIndex:i76];
        [v376 addKCellularCdmaEvdoRxDiversityHist:v347];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx0RssiHistsCount])
  {
    [v376 clearKCellularCdmaEvdoServingCellRx0RssiHists];
    unint64_t v348 = [(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx0RssiHistsCount];
    if (v348)
    {
      unint64_t v349 = v348;
      for (uint64_t i77 = 0; i77 != v349; ++i77)
      {
        uint64_t v351 = [(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx0RssiHistAtIndex:i77];
        [v376 addKCellularCdmaEvdoServingCellRx0RssiHist:v351];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx1RssiHistsCount])
  {
    [v376 clearKCellularCdmaEvdoServingCellRx1RssiHists];
    unint64_t v352 = [(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx1RssiHistsCount];
    if (v352)
    {
      unint64_t v353 = v352;
      for (uint64_t i78 = 0; i78 != v353; ++i78)
      {
        v355 = [(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx1RssiHistAtIndex:i78];
        [v376 addKCellularCdmaEvdoServingCellRx1RssiHist:v355];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx0EcIoHistsCount])
  {
    [v376 clearKCellularCdmaEvdoServingCellRx0EcIoHists];
    unint64_t v356 = [(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx0EcIoHistsCount];
    if (v356)
    {
      unint64_t v357 = v356;
      for (uint64_t i79 = 0; i79 != v357; ++i79)
      {
        uint64_t v359 = [(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx0EcIoHistAtIndex:i79];
        [v376 addKCellularCdmaEvdoServingCellRx0EcIoHist:v359];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx1EcIoHistsCount])
  {
    [v376 clearKCellularCdmaEvdoServingCellRx1EcIoHists];
    unint64_t v360 = [(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx1EcIoHistsCount];
    if (v360)
    {
      unint64_t v361 = v360;
      for (uint64_t i80 = 0; i80 != v361; ++i80)
      {
        uint64_t v363 = [(PowerlogMetricLog *)self kCellularCdmaEvdoServingCellRx1EcIoHistAtIndex:i80];
        [v376 addKCellularCdmaEvdoServingCellRx1EcIoHist:v363];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdmaEvdoTxPowerHistsCount])
  {
    [v376 clearKCellularCdmaEvdoTxPowerHists];
    unint64_t v364 = [(PowerlogMetricLog *)self kCellularCdmaEvdoTxPowerHistsCount];
    if (v364)
    {
      unint64_t v365 = v364;
      for (uint64_t i81 = 0; i81 != v365; ++i81)
      {
        uint64_t v367 = [(PowerlogMetricLog *)self kCellularCdmaEvdoTxPowerHistAtIndex:i81];
        [v376 addKCellularCdmaEvdoTxPowerHist:v367];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdmaEvdoProtocolStackStateHistsCount])
  {
    [v376 clearKCellularCdmaEvdoProtocolStackStateHists];
    unint64_t v368 = [(PowerlogMetricLog *)self kCellularCdmaEvdoProtocolStackStateHistsCount];
    if (v368)
    {
      unint64_t v369 = v368;
      for (uint64_t i82 = 0; i82 != v369; ++i82)
      {
        uint64_t v371 = [(PowerlogMetricLog *)self kCellularCdmaEvdoProtocolStackStateHistAtIndex:i82];
        [v376 addKCellularCdmaEvdoProtocolStackStateHist:v371];
      }
    }
  }
  if ([(PowerlogMetricLog *)self kCellularCdmaEvdoRrStatesCount])
  {
    [v376 clearKCellularCdmaEvdoRrStates];
    unint64_t v372 = [(PowerlogMetricLog *)self kCellularCdmaEvdoRrStatesCount];
    if (v372)
    {
      unint64_t v373 = v372;
      for (uint64_t i83 = 0; i83 != v373; ++i83)
      {
        v375 = [(PowerlogMetricLog *)self kCellularCdmaEvdoRrStateAtIndex:i83];
        [v376 addKCellularCdmaEvdoRrState:v375];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v1031 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v934 = 0u;
  long long v935 = 0u;
  long long v936 = 0u;
  long long v937 = 0u;
  uint64_t v6 = self->_kCellularPerClientProfileTriggerCounts;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v934 objects:v1030 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v935;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v935 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v934 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addKCellularPerClientProfileTriggerCount:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v934 objects:v1030 count:16];
    }
    while (v8);
  }

  long long v933 = 0u;
  long long v932 = 0u;
  long long v931 = 0u;
  long long v930 = 0u;
  unint64_t v12 = self->_kCellularProtocolStackCpuStats;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v930 objects:v1029 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v931;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v931 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v930 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addKCellularProtocolStackCpuStats:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v930 objects:v1029 count:16];
    }
    while (v14);
  }

  long long v929 = 0u;
  long long v928 = 0u;
  long long v927 = 0u;
  long long v926 = 0u;
  uint64_t v18 = self->_kCellularPeripheralStats;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v926 objects:v1028 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v927;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v927 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v926 + 1) + 8 * v22) copyWithZone:a3];
        [v5 addKCellularPeripheralStats:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v926 objects:v1028 count:16];
    }
    while (v20);
  }

  long long v925 = 0u;
  long long v924 = 0u;
  long long v923 = 0u;
  long long v922 = 0u;
  unint64_t v24 = self->_kCellularDvfsStats;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v922 objects:v1027 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v923;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v923 != v27) {
          objc_enumerationMutation(v24);
        }
        unint64_t v29 = (void *)[*(id *)(*((void *)&v922 + 1) + 8 * v28) copyWithZone:a3];
        [v5 addKCellularDvfsStats:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v922 objects:v1027 count:16];
    }
    while (v26);
  }

  long long v921 = 0u;
  long long v920 = 0u;
  long long v919 = 0u;
  long long v918 = 0u;
  uint64_t v30 = self->_kCellularLteWcdmaGsmHwStats;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v918 objects:v1026 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v919;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v919 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = (void *)[*(id *)(*((void *)&v918 + 1) + 8 * v34) copyWithZone:a3];
        [v5 addKCellularLteWcdmaGsmHwStats:v35];

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v918 objects:v1026 count:16];
    }
    while (v32);
  }

  long long v917 = 0u;
  long long v916 = 0u;
  long long v915 = 0u;
  long long v914 = 0u;
  unint64_t v36 = self->_kCellularLteTdsGsmHwStats;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v914 objects:v1025 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v915;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v915 != v39) {
          objc_enumerationMutation(v36);
        }
        unint64_t v41 = (void *)[*(id *)(*((void *)&v914 + 1) + 8 * v40) copyWithZone:a3];
        [v5 addKCellularLteTdsGsmHwStats:v41];

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v914 objects:v1025 count:16];
    }
    while (v38);
  }

  long long v913 = 0u;
  long long v912 = 0u;
  long long v911 = 0u;
  long long v910 = 0u;
  uint64_t v42 = self->_kCellularPmuAverageCurrents;
  uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v910 objects:v1024 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v911;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v911 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = (void *)[*(id *)(*((void *)&v910 + 1) + 8 * v46) copyWithZone:a3];
        [v5 addKCellularPmuAverageCurrent:v47];

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v910 objects:v1024 count:16];
    }
    while (v44);
  }

  long long v909 = 0u;
  long long v908 = 0u;
  long long v907 = 0u;
  long long v906 = 0u;
  unint64_t v48 = self->_kCellularFwCoreStats;
  uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v906 objects:v1023 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v907;
    do
    {
      uint64_t v52 = 0;
      do
      {
        if (*(void *)v907 != v51) {
          objc_enumerationMutation(v48);
        }
        unint64_t v53 = (void *)[*(id *)(*((void *)&v906 + 1) + 8 * v52) copyWithZone:a3];
        [v5 addKCellularFwCoreStats:v53];

        ++v52;
      }
      while (v50 != v52);
      uint64_t v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v906 objects:v1023 count:16];
    }
    while (v50);
  }

  long long v905 = 0u;
  long long v904 = 0u;
  long long v903 = 0u;
  long long v902 = 0u;
  uint64_t v54 = self->_kCellularLteWcdmaTdsHwStats;
  uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v902 objects:v1022 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v903;
    do
    {
      uint64_t v58 = 0;
      do
      {
        if (*(void *)v903 != v57) {
          objc_enumerationMutation(v54);
        }
        uint64_t v59 = (void *)[*(id *)(*((void *)&v902 + 1) + 8 * v58) copyWithZone:a3];
        [v5 addKCellularLteWcdmaTdsHwStats:v59];

        ++v58;
      }
      while (v56 != v58);
      uint64_t v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v902 objects:v1022 count:16];
    }
    while (v56);
  }

  long long v901 = 0u;
  long long v900 = 0u;
  long long v899 = 0u;
  long long v898 = 0u;
  unint64_t v60 = self->_kCellularPmicHwStats;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v898 objects:v1021 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v899;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v899 != v63) {
          objc_enumerationMutation(v60);
        }
        unint64_t v65 = (void *)[*(id *)(*((void *)&v898 + 1) + 8 * v64) copyWithZone:a3];
        [v5 addKCellularPmicHwStats:v65];

        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v898 objects:v1021 count:16];
    }
    while (v62);
  }

  long long v897 = 0u;
  long long v896 = 0u;
  long long v895 = 0u;
  long long v894 = 0u;
  uint64_t v66 = self->_kCellularTdsRrcStates;
  uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v894 objects:v1020 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v895;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v895 != v69) {
          objc_enumerationMutation(v66);
        }
        uint64_t v71 = (void *)[*(id *)(*((void *)&v894 + 1) + 8 * v70) copyWithZone:a3];
        [v5 addKCellularTdsRrcState:v71];

        ++v70;
      }
      while (v68 != v70);
      uint64_t v68 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v894 objects:v1020 count:16];
    }
    while (v68);
  }

  long long v893 = 0u;
  long long v892 = 0u;
  long long v891 = 0u;
  long long v890 = 0u;
  unint64_t v72 = self->_kCellularLteRrcStates;
  uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v890 objects:v1019 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v891;
    do
    {
      uint64_t v76 = 0;
      do
      {
        if (*(void *)v891 != v75) {
          objc_enumerationMutation(v72);
        }
        unint64_t v77 = (void *)[*(id *)(*((void *)&v890 + 1) + 8 * v76) copyWithZone:a3];
        [v5 addKCellularLteRrcState:v77];

        ++v76;
      }
      while (v74 != v76);
      uint64_t v74 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v890 objects:v1019 count:16];
    }
    while (v74);
  }

  long long v889 = 0u;
  long long v888 = 0u;
  long long v887 = 0u;
  long long v886 = 0u;
  uint64_t v78 = self->_kCellularLtePagingCycles;
  uint64_t v79 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v886 objects:v1018 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v887;
    do
    {
      uint64_t v82 = 0;
      do
      {
        if (*(void *)v887 != v81) {
          objc_enumerationMutation(v78);
        }
        uint64_t v83 = (void *)[*(id *)(*((void *)&v886 + 1) + 8 * v82) copyWithZone:a3];
        [v5 addKCellularLtePagingCycle:v83];

        ++v82;
      }
      while (v80 != v82);
      uint64_t v80 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v886 objects:v1018 count:16];
    }
    while (v80);
  }

  long long v885 = 0u;
  long long v884 = 0u;
  long long v883 = 0u;
  long long v882 = 0u;
  unint64_t v84 = self->_kCellularLteCdrxConfigs;
  uint64_t v85 = [(NSMutableArray *)v84 countByEnumeratingWithState:&v882 objects:v1017 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v883;
    do
    {
      uint64_t v88 = 0;
      do
      {
        if (*(void *)v883 != v87) {
          objc_enumerationMutation(v84);
        }
        unint64_t v89 = (void *)[*(id *)(*((void *)&v882 + 1) + 8 * v88) copyWithZone:a3];
        [v5 addKCellularLteCdrxConfig:v89];

        ++v88;
      }
      while (v86 != v88);
      uint64_t v86 = [(NSMutableArray *)v84 countByEnumeratingWithState:&v882 objects:v1017 count:16];
    }
    while (v86);
  }

  long long v881 = 0u;
  long long v880 = 0u;
  long long v879 = 0u;
  long long v878 = 0u;
  uint64_t v90 = self->_kCellularLteRadioLinkFailures;
  uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v878 objects:v1016 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v879;
    do
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v879 != v93) {
          objc_enumerationMutation(v90);
        }
        v95 = (void *)[*(id *)(*((void *)&v878 + 1) + 8 * v94) copyWithZone:a3];
        [v5 addKCellularLteRadioLinkFailure:v95];

        ++v94;
      }
      while (v92 != v94);
      uint64_t v92 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v878 objects:v1016 count:16];
    }
    while (v92);
  }

  long long v877 = 0u;
  long long v876 = 0u;
  long long v875 = 0u;
  long long v874 = 0u;
  unint64_t v96 = self->_kCellularLtePdcchStateStats;
  uint64_t v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v874 objects:v1015 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v875;
    do
    {
      uint64_t v100 = 0;
      do
      {
        if (*(void *)v875 != v99) {
          objc_enumerationMutation(v96);
        }
        unint64_t v101 = (void *)[*(id *)(*((void *)&v874 + 1) + 8 * v100) copyWithZone:a3];
        [v5 addKCellularLtePdcchStateStats:v101];

        ++v100;
      }
      while (v98 != v100);
      uint64_t v98 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v874 objects:v1015 count:16];
    }
    while (v98);
  }

  long long v873 = 0u;
  long long v872 = 0u;
  long long v871 = 0u;
  long long v870 = 0u;
  uint64_t v102 = self->_kCellularLqmStateChanges;
  uint64_t v103 = [(NSMutableArray *)v102 countByEnumeratingWithState:&v870 objects:v1014 count:16];
  if (v103)
  {
    uint64_t v104 = v103;
    uint64_t v105 = *(void *)v871;
    do
    {
      uint64_t v106 = 0;
      do
      {
        if (*(void *)v871 != v105) {
          objc_enumerationMutation(v102);
        }
        uint64_t v107 = (void *)[*(id *)(*((void *)&v870 + 1) + 8 * v106) copyWithZone:a3];
        [v5 addKCellularLqmStateChange:v107];

        ++v106;
      }
      while (v104 != v106);
      uint64_t v104 = [(NSMutableArray *)v102 countByEnumeratingWithState:&v870 objects:v1014 count:16];
    }
    while (v104);
  }

  long long v869 = 0u;
  long long v868 = 0u;
  long long v867 = 0u;
  long long v866 = 0u;
  unint64_t v108 = self->_kCellularServiceLosts;
  uint64_t v109 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v866 objects:v1013 count:16];
  if (v109)
  {
    uint64_t v110 = v109;
    uint64_t v111 = *(void *)v867;
    do
    {
      uint64_t v112 = 0;
      do
      {
        if (*(void *)v867 != v111) {
          objc_enumerationMutation(v108);
        }
        unint64_t v113 = (void *)[*(id *)(*((void *)&v866 + 1) + 8 * v112) copyWithZone:a3];
        [v5 addKCellularServiceLost:v113];

        ++v112;
      }
      while (v110 != v112);
      uint64_t v110 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v866 objects:v1013 count:16];
    }
    while (v110);
  }

  long long v865 = 0u;
  long long v864 = 0u;
  long long v863 = 0u;
  long long v862 = 0u;
  uint64_t v114 = self->_kCellularGsmServingCellRssiHists;
  uint64_t v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v862 objects:v1012 count:16];
  if (v115)
  {
    uint64_t v116 = v115;
    uint64_t v117 = *(void *)v863;
    do
    {
      uint64_t v118 = 0;
      do
      {
        if (*(void *)v863 != v117) {
          objc_enumerationMutation(v114);
        }
        uint64_t v119 = (void *)[*(id *)(*((void *)&v862 + 1) + 8 * v118) copyWithZone:a3];
        [v5 addKCellularGsmServingCellRssiHist:v119];

        ++v118;
      }
      while (v116 != v118);
      uint64_t v116 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v862 objects:v1012 count:16];
    }
    while (v116);
  }

  long long v861 = 0u;
  long long v860 = 0u;
  long long v859 = 0u;
  long long v858 = 0u;
  unint64_t v120 = self->_kCellularGsmServingCellSnrHists;
  uint64_t v121 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v858 objects:v1011 count:16];
  if (v121)
  {
    uint64_t v122 = v121;
    uint64_t v123 = *(void *)v859;
    do
    {
      uint64_t v124 = 0;
      do
      {
        if (*(void *)v859 != v123) {
          objc_enumerationMutation(v120);
        }
        unint64_t v125 = (void *)[*(id *)(*((void *)&v858 + 1) + 8 * v124) copyWithZone:a3];
        [v5 addKCellularGsmServingCellSnrHist:v125];

        ++v124;
      }
      while (v122 != v124);
      uint64_t v122 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v858 objects:v1011 count:16];
    }
    while (v122);
  }

  long long v857 = 0u;
  long long v856 = 0u;
  long long v855 = 0u;
  long long v854 = 0u;
  uint64_t v126 = self->_kCellularGsmTxPowerHists;
  uint64_t v127 = [(NSMutableArray *)v126 countByEnumeratingWithState:&v854 objects:v1010 count:16];
  if (v127)
  {
    uint64_t v128 = v127;
    uint64_t v129 = *(void *)v855;
    do
    {
      uint64_t v130 = 0;
      do
      {
        if (*(void *)v855 != v129) {
          objc_enumerationMutation(v126);
        }
        uint64_t v131 = (void *)[*(id *)(*((void *)&v854 + 1) + 8 * v130) copyWithZone:a3];
        [v5 addKCellularGsmTxPowerHist:v131];

        ++v130;
      }
      while (v128 != v130);
      uint64_t v128 = [(NSMutableArray *)v126 countByEnumeratingWithState:&v854 objects:v1010 count:16];
    }
    while (v128);
  }

  long long v853 = 0u;
  long long v852 = 0u;
  long long v851 = 0u;
  long long v850 = 0u;
  unint64_t v132 = self->_kCellularGsmConnectedModeHists;
  uint64_t v133 = [(NSMutableArray *)v132 countByEnumeratingWithState:&v850 objects:v1009 count:16];
  if (v133)
  {
    uint64_t v134 = v133;
    uint64_t v135 = *(void *)v851;
    do
    {
      uint64_t v136 = 0;
      do
      {
        if (*(void *)v851 != v135) {
          objc_enumerationMutation(v132);
        }
        unint64_t v137 = (void *)[*(id *)(*((void *)&v850 + 1) + 8 * v136) copyWithZone:a3];
        [v5 addKCellularGsmConnectedModeHist:v137];

        ++v136;
      }
      while (v134 != v136);
      uint64_t v134 = [(NSMutableArray *)v132 countByEnumeratingWithState:&v850 objects:v1009 count:16];
    }
    while (v134);
  }

  long long v849 = 0u;
  long long v848 = 0u;
  long long v847 = 0u;
  long long v846 = 0u;
  uint64_t v138 = self->_kCellularGsmL1States;
  uint64_t v139 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v846 objects:v1008 count:16];
  if (v139)
  {
    uint64_t v140 = v139;
    uint64_t v141 = *(void *)v847;
    do
    {
      uint64_t v142 = 0;
      do
      {
        if (*(void *)v847 != v141) {
          objc_enumerationMutation(v138);
        }
        uint64_t v143 = (void *)[*(id *)(*((void *)&v846 + 1) + 8 * v142) copyWithZone:a3];
        [v5 addKCellularGsmL1State:v143];

        ++v142;
      }
      while (v140 != v142);
      uint64_t v140 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v846 objects:v1008 count:16];
    }
    while (v140);
  }

  long long v845 = 0u;
  long long v844 = 0u;
  long long v843 = 0u;
  long long v842 = 0u;
  unint64_t v144 = self->_kCellularWcdmaCpcStats;
  uint64_t v145 = [(NSMutableArray *)v144 countByEnumeratingWithState:&v842 objects:v1007 count:16];
  if (v145)
  {
    uint64_t v146 = v145;
    uint64_t v147 = *(void *)v843;
    do
    {
      uint64_t v148 = 0;
      do
      {
        if (*(void *)v843 != v147) {
          objc_enumerationMutation(v144);
        }
        unint64_t v149 = (void *)[*(id *)(*((void *)&v842 + 1) + 8 * v148) copyWithZone:a3];
        [v5 addKCellularWcdmaCpcStat:v149];

        ++v148;
      }
      while (v146 != v148);
      uint64_t v146 = [(NSMutableArray *)v144 countByEnumeratingWithState:&v842 objects:v1007 count:16];
    }
    while (v146);
  }

  long long v841 = 0u;
  long long v840 = 0u;
  long long v839 = 0u;
  long long v838 = 0u;
  v150 = self->_kCellularWcdmaRxDiversityHists;
  uint64_t v151 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v838 objects:v1006 count:16];
  if (v151)
  {
    uint64_t v152 = v151;
    uint64_t v153 = *(void *)v839;
    do
    {
      uint64_t v154 = 0;
      do
      {
        if (*(void *)v839 != v153) {
          objc_enumerationMutation(v150);
        }
        uint64_t v155 = (void *)[*(id *)(*((void *)&v838 + 1) + 8 * v154) copyWithZone:a3];
        [v5 addKCellularWcdmaRxDiversityHist:v155];

        ++v154;
      }
      while (v152 != v154);
      uint64_t v152 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v838 objects:v1006 count:16];
    }
    while (v152);
  }

  long long v837 = 0u;
  long long v836 = 0u;
  long long v835 = 0u;
  long long v834 = 0u;
  unint64_t v156 = self->_kCellularWcdmaServingCellRx0RssiHists;
  uint64_t v157 = [(NSMutableArray *)v156 countByEnumeratingWithState:&v834 objects:v1005 count:16];
  if (v157)
  {
    uint64_t v158 = v157;
    uint64_t v159 = *(void *)v835;
    do
    {
      uint64_t v160 = 0;
      do
      {
        if (*(void *)v835 != v159) {
          objc_enumerationMutation(v156);
        }
        unint64_t v161 = (void *)[*(id *)(*((void *)&v834 + 1) + 8 * v160) copyWithZone:a3];
        [v5 addKCellularWcdmaServingCellRx0RssiHist:v161];

        ++v160;
      }
      while (v158 != v160);
      uint64_t v158 = [(NSMutableArray *)v156 countByEnumeratingWithState:&v834 objects:v1005 count:16];
    }
    while (v158);
  }

  long long v833 = 0u;
  long long v832 = 0u;
  long long v831 = 0u;
  long long v830 = 0u;
  uint64_t v162 = self->_kCellularWcdmaServingCellRx1RssiHists;
  uint64_t v163 = [(NSMutableArray *)v162 countByEnumeratingWithState:&v830 objects:v1004 count:16];
  if (v163)
  {
    uint64_t v164 = v163;
    uint64_t v165 = *(void *)v831;
    do
    {
      uint64_t v166 = 0;
      do
      {
        if (*(void *)v831 != v165) {
          objc_enumerationMutation(v162);
        }
        uint64_t v167 = (void *)[*(id *)(*((void *)&v830 + 1) + 8 * v166) copyWithZone:a3];
        [v5 addKCellularWcdmaServingCellRx1RssiHist:v167];

        ++v166;
      }
      while (v164 != v166);
      uint64_t v164 = [(NSMutableArray *)v162 countByEnumeratingWithState:&v830 objects:v1004 count:16];
    }
    while (v164);
  }

  long long v829 = 0u;
  long long v828 = 0u;
  long long v827 = 0u;
  long long v826 = 0u;
  unint64_t v168 = self->_kCellularWcdmaServingCellRx0EcNoHists;
  uint64_t v169 = [(NSMutableArray *)v168 countByEnumeratingWithState:&v826 objects:v1003 count:16];
  if (v169)
  {
    uint64_t v170 = v169;
    uint64_t v171 = *(void *)v827;
    do
    {
      uint64_t v172 = 0;
      do
      {
        if (*(void *)v827 != v171) {
          objc_enumerationMutation(v168);
        }
        unint64_t v173 = (void *)[*(id *)(*((void *)&v826 + 1) + 8 * v172) copyWithZone:a3];
        [v5 addKCellularWcdmaServingCellRx0EcNoHist:v173];

        ++v172;
      }
      while (v170 != v172);
      uint64_t v170 = [(NSMutableArray *)v168 countByEnumeratingWithState:&v826 objects:v1003 count:16];
    }
    while (v170);
  }

  long long v825 = 0u;
  long long v824 = 0u;
  long long v823 = 0u;
  long long v822 = 0u;
  uint64_t v174 = self->_kCellularWcdmaServingCellRx1EcNoHists;
  uint64_t v175 = [(NSMutableArray *)v174 countByEnumeratingWithState:&v822 objects:v1002 count:16];
  if (v175)
  {
    uint64_t v176 = v175;
    uint64_t v177 = *(void *)v823;
    do
    {
      uint64_t v178 = 0;
      do
      {
        if (*(void *)v823 != v177) {
          objc_enumerationMutation(v174);
        }
        uint64_t v179 = (void *)[*(id *)(*((void *)&v822 + 1) + 8 * v178) copyWithZone:a3];
        [v5 addKCellularWcdmaServingCellRx1EcNoHist:v179];

        ++v178;
      }
      while (v176 != v178);
      uint64_t v176 = [(NSMutableArray *)v174 countByEnumeratingWithState:&v822 objects:v1002 count:16];
    }
    while (v176);
  }

  long long v821 = 0u;
  long long v820 = 0u;
  long long v819 = 0u;
  long long v818 = 0u;
  unint64_t v180 = self->_kCellularWcdmaTxPowerHists;
  uint64_t v181 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v818 objects:v1001 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v819;
    do
    {
      uint64_t v184 = 0;
      do
      {
        if (*(void *)v819 != v183) {
          objc_enumerationMutation(v180);
        }
        unint64_t v185 = (void *)[*(id *)(*((void *)&v818 + 1) + 8 * v184) copyWithZone:a3];
        [v5 addKCellularWcdmaTxPowerHist:v185];

        ++v184;
      }
      while (v182 != v184);
      uint64_t v182 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v818 objects:v1001 count:16];
    }
    while (v182);
  }

  long long v817 = 0u;
  long long v816 = 0u;
  long long v815 = 0u;
  long long v814 = 0u;
  uint64_t v186 = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  uint64_t v187 = [(NSMutableArray *)v186 countByEnumeratingWithState:&v814 objects:v1000 count:16];
  if (v187)
  {
    uint64_t v188 = v187;
    uint64_t v189 = *(void *)v815;
    do
    {
      uint64_t v190 = 0;
      do
      {
        if (*(void *)v815 != v189) {
          objc_enumerationMutation(v186);
        }
        uint64_t v191 = (void *)[*(id *)(*((void *)&v814 + 1) + 8 * v190) copyWithZone:a3];
        [v5 addKCellularWcdmaReceiverStatusOnC0Hist:v191];

        ++v190;
      }
      while (v188 != v190);
      uint64_t v188 = [(NSMutableArray *)v186 countByEnumeratingWithState:&v814 objects:v1000 count:16];
    }
    while (v188);
  }

  long long v813 = 0u;
  long long v812 = 0u;
  long long v811 = 0u;
  long long v810 = 0u;
  unint64_t v192 = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  uint64_t v193 = [(NSMutableArray *)v192 countByEnumeratingWithState:&v810 objects:v999 count:16];
  if (v193)
  {
    uint64_t v194 = v193;
    uint64_t v195 = *(void *)v811;
    do
    {
      uint64_t v196 = 0;
      do
      {
        if (*(void *)v811 != v195) {
          objc_enumerationMutation(v192);
        }
        unint64_t v197 = (void *)[*(id *)(*((void *)&v810 + 1) + 8 * v196) copyWithZone:a3];
        [v5 addKCellularWcdmaReceiverStatusOnC1Hist:v197];

        ++v196;
      }
      while (v194 != v196);
      uint64_t v194 = [(NSMutableArray *)v192 countByEnumeratingWithState:&v810 objects:v999 count:16];
    }
    while (v194);
  }

  long long v809 = 0u;
  long long v808 = 0u;
  long long v807 = 0u;
  long long v806 = 0u;
  uint64_t v198 = self->_kCellularWcdmaCarrierStatusHists;
  uint64_t v199 = [(NSMutableArray *)v198 countByEnumeratingWithState:&v806 objects:v998 count:16];
  if (v199)
  {
    uint64_t v200 = v199;
    uint64_t v201 = *(void *)v807;
    do
    {
      uint64_t v202 = 0;
      do
      {
        if (*(void *)v807 != v201) {
          objc_enumerationMutation(v198);
        }
        uint64_t v203 = (void *)[*(id *)(*((void *)&v806 + 1) + 8 * v202) copyWithZone:a3];
        [v5 addKCellularWcdmaCarrierStatusHist:v203];

        ++v202;
      }
      while (v200 != v202);
      uint64_t v200 = [(NSMutableArray *)v198 countByEnumeratingWithState:&v806 objects:v998 count:16];
    }
    while (v200);
  }

  long long v805 = 0u;
  long long v804 = 0u;
  long long v803 = 0u;
  long long v802 = 0u;
  unint64_t v204 = self->_kCellularWcdmaRabModeHists;
  uint64_t v205 = [(NSMutableArray *)v204 countByEnumeratingWithState:&v802 objects:v997 count:16];
  if (v205)
  {
    uint64_t v206 = v205;
    uint64_t v207 = *(void *)v803;
    do
    {
      uint64_t v208 = 0;
      do
      {
        if (*(void *)v803 != v207) {
          objc_enumerationMutation(v204);
        }
        unint64_t v209 = (void *)[*(id *)(*((void *)&v802 + 1) + 8 * v208) copyWithZone:a3];
        [v5 addKCellularWcdmaRabModeHist:v209];

        ++v208;
      }
      while (v206 != v208);
      uint64_t v206 = [(NSMutableArray *)v204 countByEnumeratingWithState:&v802 objects:v997 count:16];
    }
    while (v206);
  }

  long long v801 = 0u;
  long long v800 = 0u;
  long long v799 = 0u;
  long long v798 = 0u;
  uint64_t v210 = self->_kCellularWcdmaRabTypeHists;
  uint64_t v211 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v798 objects:v996 count:16];
  if (v211)
  {
    uint64_t v212 = v211;
    uint64_t v213 = *(void *)v799;
    do
    {
      uint64_t v214 = 0;
      do
      {
        if (*(void *)v799 != v213) {
          objc_enumerationMutation(v210);
        }
        v215 = (void *)[*(id *)(*((void *)&v798 + 1) + 8 * v214) copyWithZone:a3];
        [v5 addKCellularWcdmaRabTypeHist:v215];

        ++v214;
      }
      while (v212 != v214);
      uint64_t v212 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v798 objects:v996 count:16];
    }
    while (v212);
  }

  long long v797 = 0u;
  long long v796 = 0u;
  long long v795 = 0u;
  long long v794 = 0u;
  unint64_t v216 = self->_kCellularWcdmaRrcConnectionStates;
  uint64_t v217 = [(NSMutableArray *)v216 countByEnumeratingWithState:&v794 objects:v995 count:16];
  if (v217)
  {
    uint64_t v218 = v217;
    uint64_t v219 = *(void *)v795;
    do
    {
      uint64_t v220 = 0;
      do
      {
        if (*(void *)v795 != v219) {
          objc_enumerationMutation(v216);
        }
        unint64_t v221 = (void *)[*(id *)(*((void *)&v794 + 1) + 8 * v220) copyWithZone:a3];
        [v5 addKCellularWcdmaRrcConnectionState:v221];

        ++v220;
      }
      while (v218 != v220);
      uint64_t v218 = [(NSMutableArray *)v216 countByEnumeratingWithState:&v794 objects:v995 count:16];
    }
    while (v218);
  }

  long long v793 = 0u;
  long long v792 = 0u;
  long long v791 = 0u;
  long long v790 = 0u;
  uint64_t v222 = self->_kCellularWcdmaRrcConfigurations;
  uint64_t v223 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v790 objects:v994 count:16];
  if (v223)
  {
    uint64_t v224 = v223;
    uint64_t v225 = *(void *)v791;
    do
    {
      uint64_t v226 = 0;
      do
      {
        if (*(void *)v791 != v225) {
          objc_enumerationMutation(v222);
        }
        uint64_t v227 = (void *)[*(id *)(*((void *)&v790 + 1) + 8 * v226) copyWithZone:a3];
        [v5 addKCellularWcdmaRrcConfiguration:v227];

        ++v226;
      }
      while (v224 != v226);
      uint64_t v224 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v790 objects:v994 count:16];
    }
    while (v224);
  }

  long long v789 = 0u;
  long long v788 = 0u;
  long long v787 = 0u;
  long long v786 = 0u;
  unint64_t v228 = self->_kCellularWcdmaRabStatus;
  uint64_t v229 = [(NSMutableArray *)v228 countByEnumeratingWithState:&v786 objects:v993 count:16];
  if (v229)
  {
    uint64_t v230 = v229;
    uint64_t v231 = *(void *)v787;
    do
    {
      uint64_t v232 = 0;
      do
      {
        if (*(void *)v787 != v231) {
          objc_enumerationMutation(v228);
        }
        unint64_t v233 = (void *)[*(id *)(*((void *)&v786 + 1) + 8 * v232) copyWithZone:a3];
        [v5 addKCellularWcdmaRabStatus:v233];

        ++v232;
      }
      while (v230 != v232);
      uint64_t v230 = [(NSMutableArray *)v228 countByEnumeratingWithState:&v786 objects:v993 count:16];
    }
    while (v230);
  }

  long long v785 = 0u;
  long long v784 = 0u;
  long long v783 = 0u;
  long long v782 = 0u;
  uint64_t v234 = self->_kCellularWcdmaL1States;
  uint64_t v235 = [(NSMutableArray *)v234 countByEnumeratingWithState:&v782 objects:v992 count:16];
  if (v235)
  {
    uint64_t v236 = v235;
    uint64_t v237 = *(void *)v783;
    do
    {
      uint64_t v238 = 0;
      do
      {
        if (*(void *)v783 != v237) {
          objc_enumerationMutation(v234);
        }
        uint64_t v239 = (void *)[*(id *)(*((void *)&v782 + 1) + 8 * v238) copyWithZone:a3];
        [v5 addKCellularWcdmaL1State:v239];

        ++v238;
      }
      while (v236 != v238);
      uint64_t v236 = [(NSMutableArray *)v234 countByEnumeratingWithState:&v782 objects:v992 count:16];
    }
    while (v236);
  }

  long long v781 = 0u;
  long long v780 = 0u;
  long long v779 = 0u;
  long long v778 = 0u;
  unint64_t v240 = self->_kCellularWcdmaDataInactivityBeforeIdles;
  uint64_t v241 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v778 objects:v991 count:16];
  if (v241)
  {
    uint64_t v242 = v241;
    uint64_t v243 = *(void *)v779;
    do
    {
      uint64_t v244 = 0;
      do
      {
        if (*(void *)v779 != v243) {
          objc_enumerationMutation(v240);
        }
        unint64_t v245 = (void *)[*(id *)(*((void *)&v778 + 1) + 8 * v244) copyWithZone:a3];
        [v5 addKCellularWcdmaDataInactivityBeforeIdle:v245];

        ++v244;
      }
      while (v242 != v244);
      uint64_t v242 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v778 objects:v991 count:16];
    }
    while (v242);
  }

  long long v777 = 0u;
  long long v776 = 0u;
  long long v775 = 0u;
  long long v774 = 0u;
  uint64_t v246 = self->_kCellularWcdmaIdleToConnectedUserDatas;
  uint64_t v247 = [(NSMutableArray *)v246 countByEnumeratingWithState:&v774 objects:v990 count:16];
  if (v247)
  {
    uint64_t v248 = v247;
    uint64_t v249 = *(void *)v775;
    do
    {
      uint64_t v250 = 0;
      do
      {
        if (*(void *)v775 != v249) {
          objc_enumerationMutation(v246);
        }
        uint64_t v251 = (void *)[*(id *)(*((void *)&v774 + 1) + 8 * v250) copyWithZone:a3];
        [v5 addKCellularWcdmaIdleToConnectedUserData:v251];

        ++v250;
      }
      while (v248 != v250);
      uint64_t v248 = [(NSMutableArray *)v246 countByEnumeratingWithState:&v774 objects:v990 count:16];
    }
    while (v248);
  }

  long long v773 = 0u;
  long long v772 = 0u;
  long long v771 = 0u;
  long long v770 = 0u;
  unint64_t v252 = self->_kCellularWcdmaVadHists;
  uint64_t v253 = [(NSMutableArray *)v252 countByEnumeratingWithState:&v770 objects:v989 count:16];
  if (v253)
  {
    uint64_t v254 = v253;
    uint64_t v255 = *(void *)v771;
    do
    {
      uint64_t v256 = 0;
      do
      {
        if (*(void *)v771 != v255) {
          objc_enumerationMutation(v252);
        }
        unint64_t v257 = (void *)[*(id *)(*((void *)&v770 + 1) + 8 * v256) copyWithZone:a3];
        [v5 addKCellularWcdmaVadHist:v257];

        ++v256;
      }
      while (v254 != v256);
      uint64_t v254 = [(NSMutableArray *)v252 countByEnumeratingWithState:&v770 objects:v989 count:16];
    }
    while (v254);
  }

  long long v769 = 0u;
  long long v768 = 0u;
  long long v767 = 0u;
  long long v766 = 0u;
  uint64_t v258 = self->_kCellularTdsRxDiversityHists;
  uint64_t v259 = [(NSMutableArray *)v258 countByEnumeratingWithState:&v766 objects:v988 count:16];
  if (v259)
  {
    uint64_t v260 = v259;
    uint64_t v261 = *(void *)v767;
    do
    {
      uint64_t v262 = 0;
      do
      {
        if (*(void *)v767 != v261) {
          objc_enumerationMutation(v258);
        }
        uint64_t v263 = (void *)[*(id *)(*((void *)&v766 + 1) + 8 * v262) copyWithZone:a3];
        [v5 addKCellularTdsRxDiversityHist:v263];

        ++v262;
      }
      while (v260 != v262);
      uint64_t v260 = [(NSMutableArray *)v258 countByEnumeratingWithState:&v766 objects:v988 count:16];
    }
    while (v260);
  }

  long long v765 = 0u;
  long long v764 = 0u;
  long long v763 = 0u;
  long long v762 = 0u;
  unint64_t v264 = self->_kCellularTdsServingCellRx0RssiHists;
  uint64_t v265 = [(NSMutableArray *)v264 countByEnumeratingWithState:&v762 objects:v987 count:16];
  if (v265)
  {
    uint64_t v266 = v265;
    uint64_t v267 = *(void *)v763;
    do
    {
      uint64_t v268 = 0;
      do
      {
        if (*(void *)v763 != v267) {
          objc_enumerationMutation(v264);
        }
        unint64_t v269 = (void *)[*(id *)(*((void *)&v762 + 1) + 8 * v268) copyWithZone:a3];
        [v5 addKCellularTdsServingCellRx0RssiHist:v269];

        ++v268;
      }
      while (v266 != v268);
      uint64_t v266 = [(NSMutableArray *)v264 countByEnumeratingWithState:&v762 objects:v987 count:16];
    }
    while (v266);
  }

  long long v761 = 0u;
  long long v760 = 0u;
  long long v759 = 0u;
  long long v758 = 0u;
  v270 = self->_kCellularTdsServingCellRx1RssiHists;
  uint64_t v271 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v758 objects:v986 count:16];
  if (v271)
  {
    uint64_t v272 = v271;
    uint64_t v273 = *(void *)v759;
    do
    {
      uint64_t v274 = 0;
      do
      {
        if (*(void *)v759 != v273) {
          objc_enumerationMutation(v270);
        }
        uint64_t v275 = (void *)[*(id *)(*((void *)&v758 + 1) + 8 * v274) copyWithZone:a3];
        [v5 addKCellularTdsServingCellRx1RssiHist:v275];

        ++v274;
      }
      while (v272 != v274);
      uint64_t v272 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v758 objects:v986 count:16];
    }
    while (v272);
  }

  long long v757 = 0u;
  long long v756 = 0u;
  long long v755 = 0u;
  long long v754 = 0u;
  unint64_t v276 = self->_kCellularTdsServingCellRx0RscpHists;
  uint64_t v277 = [(NSMutableArray *)v276 countByEnumeratingWithState:&v754 objects:v985 count:16];
  if (v277)
  {
    uint64_t v278 = v277;
    uint64_t v279 = *(void *)v755;
    do
    {
      uint64_t v280 = 0;
      do
      {
        if (*(void *)v755 != v279) {
          objc_enumerationMutation(v276);
        }
        unint64_t v281 = (void *)[*(id *)(*((void *)&v754 + 1) + 8 * v280) copyWithZone:a3];
        [v5 addKCellularTdsServingCellRx0RscpHist:v281];

        ++v280;
      }
      while (v278 != v280);
      uint64_t v278 = [(NSMutableArray *)v276 countByEnumeratingWithState:&v754 objects:v985 count:16];
    }
    while (v278);
  }

  long long v753 = 0u;
  long long v752 = 0u;
  long long v751 = 0u;
  long long v750 = 0u;
  uint64_t v282 = self->_kCellularTdsServingCellRx1RscpHists;
  uint64_t v283 = [(NSMutableArray *)v282 countByEnumeratingWithState:&v750 objects:v984 count:16];
  if (v283)
  {
    uint64_t v284 = v283;
    uint64_t v285 = *(void *)v751;
    do
    {
      uint64_t v286 = 0;
      do
      {
        if (*(void *)v751 != v285) {
          objc_enumerationMutation(v282);
        }
        uint64_t v287 = (void *)[*(id *)(*((void *)&v750 + 1) + 8 * v286) copyWithZone:a3];
        [v5 addKCellularTdsServingCellRx1RscpHist:v287];

        ++v286;
      }
      while (v284 != v286);
      uint64_t v284 = [(NSMutableArray *)v282 countByEnumeratingWithState:&v750 objects:v984 count:16];
    }
    while (v284);
  }

  long long v749 = 0u;
  long long v748 = 0u;
  long long v747 = 0u;
  long long v746 = 0u;
  unint64_t v288 = self->_kCellularTdsTxPowerHists;
  uint64_t v289 = [(NSMutableArray *)v288 countByEnumeratingWithState:&v746 objects:v983 count:16];
  if (v289)
  {
    uint64_t v290 = v289;
    uint64_t v291 = *(void *)v747;
    do
    {
      uint64_t v292 = 0;
      do
      {
        if (*(void *)v747 != v291) {
          objc_enumerationMutation(v288);
        }
        unint64_t v293 = (void *)[*(id *)(*((void *)&v746 + 1) + 8 * v292) copyWithZone:a3];
        [v5 addKCellularTdsTxPowerHist:v293];

        ++v292;
      }
      while (v290 != v292);
      uint64_t v290 = [(NSMutableArray *)v288 countByEnumeratingWithState:&v746 objects:v983 count:16];
    }
    while (v290);
  }

  long long v745 = 0u;
  long long v744 = 0u;
  long long v743 = 0u;
  long long v742 = 0u;
  uint64_t v294 = self->_kCellularTdsRabModeHists;
  uint64_t v295 = [(NSMutableArray *)v294 countByEnumeratingWithState:&v742 objects:v982 count:16];
  if (v295)
  {
    uint64_t v296 = v295;
    uint64_t v297 = *(void *)v743;
    do
    {
      uint64_t v298 = 0;
      do
      {
        if (*(void *)v743 != v297) {
          objc_enumerationMutation(v294);
        }
        uint64_t v299 = (void *)[*(id *)(*((void *)&v742 + 1) + 8 * v298) copyWithZone:a3];
        [v5 addKCellularTdsRabModeHist:v299];

        ++v298;
      }
      while (v296 != v298);
      uint64_t v296 = [(NSMutableArray *)v294 countByEnumeratingWithState:&v742 objects:v982 count:16];
    }
    while (v296);
  }

  long long v741 = 0u;
  long long v740 = 0u;
  long long v739 = 0u;
  long long v738 = 0u;
  unint64_t v300 = self->_kCellularTdsRabTypeHists;
  uint64_t v301 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v738 objects:v981 count:16];
  if (v301)
  {
    uint64_t v302 = v301;
    uint64_t v303 = *(void *)v739;
    do
    {
      uint64_t v304 = 0;
      do
      {
        if (*(void *)v739 != v303) {
          objc_enumerationMutation(v300);
        }
        unint64_t v305 = (void *)[*(id *)(*((void *)&v738 + 1) + 8 * v304) copyWithZone:a3];
        [v5 addKCellularTdsRabTypeHist:v305];

        ++v304;
      }
      while (v302 != v304);
      uint64_t v302 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v738 objects:v981 count:16];
    }
    while (v302);
  }

  long long v737 = 0u;
  long long v736 = 0u;
  long long v735 = 0u;
  long long v734 = 0u;
  uint64_t v306 = self->_kCellularTdsL1States;
  uint64_t v307 = [(NSMutableArray *)v306 countByEnumeratingWithState:&v734 objects:v980 count:16];
  if (v307)
  {
    uint64_t v308 = v307;
    uint64_t v309 = *(void *)v735;
    do
    {
      uint64_t v310 = 0;
      do
      {
        if (*(void *)v735 != v309) {
          objc_enumerationMutation(v306);
        }
        uint64_t v311 = (void *)[*(id *)(*((void *)&v734 + 1) + 8 * v310) copyWithZone:a3];
        [v5 addKCellularTdsL1State:v311];

        ++v310;
      }
      while (v308 != v310);
      uint64_t v308 = [(NSMutableArray *)v306 countByEnumeratingWithState:&v734 objects:v980 count:16];
    }
    while (v308);
  }

  long long v733 = 0u;
  long long v732 = 0u;
  long long v731 = 0u;
  long long v730 = 0u;
  unint64_t v312 = self->_kCellularLteFwDuplexModes;
  uint64_t v313 = [(NSMutableArray *)v312 countByEnumeratingWithState:&v730 objects:v979 count:16];
  if (v313)
  {
    uint64_t v314 = v313;
    uint64_t v315 = *(void *)v731;
    do
    {
      uint64_t v316 = 0;
      do
      {
        if (*(void *)v731 != v315) {
          objc_enumerationMutation(v312);
        }
        unint64_t v317 = (void *)[*(id *)(*((void *)&v730 + 1) + 8 * v316) copyWithZone:a3];
        [v5 addKCellularLteFwDuplexMode:v317];

        ++v316;
      }
      while (v314 != v316);
      uint64_t v314 = [(NSMutableArray *)v312 countByEnumeratingWithState:&v730 objects:v979 count:16];
    }
    while (v314);
  }

  long long v729 = 0u;
  long long v728 = 0u;
  long long v727 = 0u;
  long long v726 = 0u;
  uint64_t v318 = self->_kCellularLteServingCellRsrpHists;
  uint64_t v319 = [(NSMutableArray *)v318 countByEnumeratingWithState:&v726 objects:v978 count:16];
  if (v319)
  {
    uint64_t v320 = v319;
    uint64_t v321 = *(void *)v727;
    do
    {
      uint64_t v322 = 0;
      do
      {
        if (*(void *)v727 != v321) {
          objc_enumerationMutation(v318);
        }
        uint64_t v323 = (void *)[*(id *)(*((void *)&v726 + 1) + 8 * v322) copyWithZone:a3];
        [v5 addKCellularLteServingCellRsrpHist:v323];

        ++v322;
      }
      while (v320 != v322);
      uint64_t v320 = [(NSMutableArray *)v318 countByEnumeratingWithState:&v726 objects:v978 count:16];
    }
    while (v320);
  }

  long long v725 = 0u;
  long long v724 = 0u;
  long long v723 = 0u;
  long long v722 = 0u;
  unint64_t v324 = self->_kCellularLteServingCellSinrHists;
  uint64_t v325 = [(NSMutableArray *)v324 countByEnumeratingWithState:&v722 objects:v977 count:16];
  if (v325)
  {
    uint64_t v326 = v325;
    uint64_t v327 = *(void *)v723;
    do
    {
      uint64_t v328 = 0;
      do
      {
        if (*(void *)v723 != v327) {
          objc_enumerationMutation(v324);
        }
        unint64_t v329 = (void *)[*(id *)(*((void *)&v722 + 1) + 8 * v328) copyWithZone:a3];
        [v5 addKCellularLteServingCellSinrHist:v329];

        ++v328;
      }
      while (v326 != v328);
      uint64_t v326 = [(NSMutableArray *)v324 countByEnumeratingWithState:&v722 objects:v977 count:16];
    }
    while (v326);
  }

  long long v721 = 0u;
  long long v720 = 0u;
  long long v719 = 0u;
  long long v718 = 0u;
  uint64_t v330 = self->_kCellularLteSleepStateHists;
  uint64_t v331 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v718 objects:v976 count:16];
  if (v331)
  {
    uint64_t v332 = v331;
    uint64_t v333 = *(void *)v719;
    do
    {
      uint64_t v334 = 0;
      do
      {
        if (*(void *)v719 != v333) {
          objc_enumerationMutation(v330);
        }
        uint64_t v335 = (void *)[*(id *)(*((void *)&v718 + 1) + 8 * v334) copyWithZone:a3];
        [v5 addKCellularLteSleepStateHist:v335];

        ++v334;
      }
      while (v332 != v334);
      uint64_t v332 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v718 objects:v976 count:16];
    }
    while (v332);
  }

  long long v717 = 0u;
  long long v716 = 0u;
  long long v715 = 0u;
  long long v714 = 0u;
  unint64_t v336 = self->_kCellularLteTxPowerHists;
  uint64_t v337 = [(NSMutableArray *)v336 countByEnumeratingWithState:&v714 objects:v975 count:16];
  if (v337)
  {
    uint64_t v338 = v337;
    uint64_t v339 = *(void *)v715;
    do
    {
      uint64_t v340 = 0;
      do
      {
        if (*(void *)v715 != v339) {
          objc_enumerationMutation(v336);
        }
        unint64_t v341 = (void *)[*(id *)(*((void *)&v714 + 1) + 8 * v340) copyWithZone:a3];
        [v5 addKCellularLteTxPowerHist:v341];

        ++v340;
      }
      while (v338 != v340);
      uint64_t v338 = [(NSMutableArray *)v336 countByEnumeratingWithState:&v714 objects:v975 count:16];
    }
    while (v338);
  }

  long long v713 = 0u;
  long long v712 = 0u;
  long long v711 = 0u;
  long long v710 = 0u;
  uint64_t v342 = self->_kCellularLteDlSccStateHists;
  uint64_t v343 = [(NSMutableArray *)v342 countByEnumeratingWithState:&v710 objects:v974 count:16];
  if (v343)
  {
    uint64_t v344 = v343;
    uint64_t v345 = *(void *)v711;
    do
    {
      uint64_t v346 = 0;
      do
      {
        if (*(void *)v711 != v345) {
          objc_enumerationMutation(v342);
        }
        uint64_t v347 = (void *)[*(id *)(*((void *)&v710 + 1) + 8 * v346) copyWithZone:a3];
        [v5 addKCellularLteDlSccStateHist:v347];

        ++v346;
      }
      while (v344 != v346);
      uint64_t v344 = [(NSMutableArray *)v342 countByEnumeratingWithState:&v710 objects:v974 count:16];
    }
    while (v344);
  }

  long long v709 = 0u;
  long long v708 = 0u;
  long long v707 = 0u;
  long long v706 = 0u;
  unint64_t v348 = self->_kCellularLteUlSccStateHists;
  uint64_t v349 = [(NSMutableArray *)v348 countByEnumeratingWithState:&v706 objects:v973 count:16];
  if (v349)
  {
    uint64_t v350 = v349;
    uint64_t v351 = *(void *)v707;
    do
    {
      uint64_t v352 = 0;
      do
      {
        if (*(void *)v707 != v351) {
          objc_enumerationMutation(v348);
        }
        unint64_t v353 = (void *)[*(id *)(*((void *)&v706 + 1) + 8 * v352) copyWithZone:a3];
        [v5 addKCellularLteUlSccStateHist:v353];

        ++v352;
      }
      while (v350 != v352);
      uint64_t v350 = [(NSMutableArray *)v348 countByEnumeratingWithState:&v706 objects:v973 count:16];
    }
    while (v350);
  }

  long long v705 = 0u;
  long long v704 = 0u;
  long long v703 = 0u;
  long long v702 = 0u;
  uint64_t v354 = self->_kCellularLteAdvancedRxStateHists;
  uint64_t v355 = [(NSMutableArray *)v354 countByEnumeratingWithState:&v702 objects:v972 count:16];
  if (v355)
  {
    uint64_t v356 = v355;
    uint64_t v357 = *(void *)v703;
    do
    {
      uint64_t v358 = 0;
      do
      {
        if (*(void *)v703 != v357) {
          objc_enumerationMutation(v354);
        }
        uint64_t v359 = (void *)[*(id *)(*((void *)&v702 + 1) + 8 * v358) copyWithZone:a3];
        [v5 addKCellularLteAdvancedRxStateHist:v359];

        ++v358;
      }
      while (v356 != v358);
      uint64_t v356 = [(NSMutableArray *)v354 countByEnumeratingWithState:&v702 objects:v972 count:16];
    }
    while (v356);
  }

  long long v701 = 0u;
  long long v700 = 0u;
  long long v699 = 0u;
  long long v698 = 0u;
  unint64_t v360 = self->_kCellularLteComponentCarrierInfos;
  uint64_t v361 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v698 objects:v971 count:16];
  if (v361)
  {
    uint64_t v362 = v361;
    uint64_t v363 = *(void *)v699;
    do
    {
      uint64_t v364 = 0;
      do
      {
        if (*(void *)v699 != v363) {
          objc_enumerationMutation(v360);
        }
        unint64_t v365 = (void *)[*(id *)(*((void *)&v698 + 1) + 8 * v364) copyWithZone:a3];
        [v5 addKCellularLteComponentCarrierInfo:v365];

        ++v364;
      }
      while (v362 != v364);
      uint64_t v362 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v698 objects:v971 count:16];
    }
    while (v362);
  }

  long long v697 = 0u;
  long long v696 = 0u;
  long long v695 = 0u;
  long long v694 = 0u;
  uint64_t v366 = self->_kCellularLteRxTxStateHists;
  uint64_t v367 = [(NSMutableArray *)v366 countByEnumeratingWithState:&v694 objects:v970 count:16];
  if (v367)
  {
    uint64_t v368 = v367;
    uint64_t v369 = *(void *)v695;
    do
    {
      uint64_t v370 = 0;
      do
      {
        if (*(void *)v695 != v369) {
          objc_enumerationMutation(v366);
        }
        uint64_t v371 = (void *)[*(id *)(*((void *)&v694 + 1) + 8 * v370) copyWithZone:a3];
        [v5 addKCellularLteRxTxStateHist:v371];

        ++v370;
      }
      while (v368 != v370);
      uint64_t v368 = [(NSMutableArray *)v366 countByEnumeratingWithState:&v694 objects:v970 count:16];
    }
    while (v368);
  }

  long long v693 = 0u;
  long long v692 = 0u;
  long long v691 = 0u;
  long long v690 = 0u;
  unint64_t v372 = self->_kCellularLteTotalDlTbsHists;
  uint64_t v373 = [(NSMutableArray *)v372 countByEnumeratingWithState:&v690 objects:v969 count:16];
  if (v373)
  {
    uint64_t v374 = v373;
    uint64_t v375 = *(void *)v691;
    do
    {
      uint64_t v376 = 0;
      do
      {
        if (*(void *)v691 != v375) {
          objc_enumerationMutation(v372);
        }
        uint64_t v377 = (void *)[*(id *)(*((void *)&v690 + 1) + 8 * v376) copyWithZone:a3];
        [v5 addKCellularLteTotalDlTbsHist:v377];

        ++v376;
      }
      while (v374 != v376);
      uint64_t v374 = [(NSMutableArray *)v372 countByEnumeratingWithState:&v690 objects:v969 count:16];
    }
    while (v374);
  }

  long long v689 = 0u;
  long long v688 = 0u;
  long long v687 = 0u;
  long long v686 = 0u;
  uint64_t v378 = self->_kCellularLteDataInactivityBeforeIdles;
  uint64_t v379 = [(NSMutableArray *)v378 countByEnumeratingWithState:&v686 objects:v968 count:16];
  if (v379)
  {
    uint64_t v380 = v379;
    uint64_t v381 = *(void *)v687;
    do
    {
      uint64_t v382 = 0;
      do
      {
        if (*(void *)v687 != v381) {
          objc_enumerationMutation(v378);
        }
        uint64_t v383 = (void *)[*(id *)(*((void *)&v686 + 1) + 8 * v382) copyWithZone:a3];
        [v5 addKCellularLteDataInactivityBeforeIdle:v383];

        ++v382;
      }
      while (v380 != v382);
      uint64_t v380 = [(NSMutableArray *)v378 countByEnumeratingWithState:&v686 objects:v968 count:16];
    }
    while (v380);
  }

  long long v685 = 0u;
  long long v684 = 0u;
  long long v683 = 0u;
  long long v682 = 0u;
  uint64_t v384 = self->_kCellularLteIdleToConnectedUserDatas;
  uint64_t v385 = [(NSMutableArray *)v384 countByEnumeratingWithState:&v682 objects:v967 count:16];
  if (v385)
  {
    uint64_t v386 = v385;
    uint64_t v387 = *(void *)v683;
    do
    {
      uint64_t v388 = 0;
      do
      {
        if (*(void *)v683 != v387) {
          objc_enumerationMutation(v384);
        }
        uint64_t v389 = (void *)[*(id *)(*((void *)&v682 + 1) + 8 * v388) copyWithZone:a3];
        [v5 addKCellularLteIdleToConnectedUserData:v389];

        ++v388;
      }
      while (v386 != v388);
      uint64_t v386 = [(NSMutableArray *)v384 countByEnumeratingWithState:&v682 objects:v967 count:16];
    }
    while (v386);
  }

  long long v681 = 0u;
  long long v680 = 0u;
  long long v679 = 0u;
  long long v678 = 0u;
  v390 = self->_kCellularLteDlSccStateHistV3s;
  uint64_t v391 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v678 objects:v966 count:16];
  if (v391)
  {
    uint64_t v392 = v391;
    uint64_t v393 = *(void *)v679;
    do
    {
      uint64_t v394 = 0;
      do
      {
        if (*(void *)v679 != v393) {
          objc_enumerationMutation(v390);
        }
        v395 = (void *)[*(id *)(*((void *)&v678 + 1) + 8 * v394) copyWithZone:a3];
        [v5 addKCellularLteDlSccStateHistV3:v395];

        ++v394;
      }
      while (v392 != v394);
      uint64_t v392 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v678 objects:v966 count:16];
    }
    while (v392);
  }

  long long v677 = 0u;
  long long v676 = 0u;
  long long v675 = 0u;
  long long v674 = 0u;
  uint64_t v396 = self->_kCellularLteRxDiversityHists;
  uint64_t v397 = [(NSMutableArray *)v396 countByEnumeratingWithState:&v674 objects:v965 count:16];
  if (v397)
  {
    uint64_t v398 = v397;
    uint64_t v399 = *(void *)v675;
    do
    {
      uint64_t v400 = 0;
      do
      {
        if (*(void *)v675 != v399) {
          objc_enumerationMutation(v396);
        }
        uint64_t v401 = (void *)[*(id *)(*((void *)&v674 + 1) + 8 * v400) copyWithZone:a3];
        [v5 addKCellularLteRxDiversityHist:v401];

        ++v400;
      }
      while (v398 != v400);
      uint64_t v398 = [(NSMutableArray *)v396 countByEnumeratingWithState:&v674 objects:v965 count:16];
    }
    while (v398);
  }

  long long v673 = 0u;
  long long v672 = 0u;
  long long v671 = 0u;
  long long v670 = 0u;
  uint64_t v402 = self->_kCellularLtePdcchStateHists;
  uint64_t v403 = [(NSMutableArray *)v402 countByEnumeratingWithState:&v670 objects:v964 count:16];
  if (v403)
  {
    uint64_t v404 = v403;
    uint64_t v405 = *(void *)v671;
    do
    {
      uint64_t v406 = 0;
      do
      {
        if (*(void *)v671 != v405) {
          objc_enumerationMutation(v402);
        }
        uint64_t v407 = (void *)[*(id *)(*((void *)&v670 + 1) + 8 * v406) copyWithZone:a3];
        [v5 addKCellularLtePdcchStateHist:v407];

        ++v406;
      }
      while (v404 != v406);
      uint64_t v404 = [(NSMutableArray *)v402 countByEnumeratingWithState:&v670 objects:v964 count:16];
    }
    while (v404);
  }

  long long v669 = 0u;
  long long v668 = 0u;
  long long v667 = 0u;
  long long v666 = 0u;
  uint64_t v408 = self->_kCellularProtocolStackStateHists;
  uint64_t v409 = [(NSMutableArray *)v408 countByEnumeratingWithState:&v666 objects:v963 count:16];
  if (v409)
  {
    uint64_t v410 = v409;
    uint64_t v411 = *(void *)v667;
    do
    {
      uint64_t v412 = 0;
      do
      {
        if (*(void *)v667 != v411) {
          objc_enumerationMutation(v408);
        }
        uint64_t v413 = (void *)[*(id *)(*((void *)&v666 + 1) + 8 * v412) copyWithZone:a3];
        [v5 addKCellularProtocolStackStateHist:v413];

        ++v412;
      }
      while (v410 != v412);
      uint64_t v410 = [(NSMutableArray *)v408 countByEnumeratingWithState:&v666 objects:v963 count:16];
    }
    while (v410);
  }

  long long v665 = 0u;
  long long v664 = 0u;
  long long v663 = 0u;
  long long v662 = 0u;
  uint64_t v414 = self->_kCellularCellPlmnSearchCounts;
  uint64_t v415 = [(NSMutableArray *)v414 countByEnumeratingWithState:&v662 objects:v962 count:16];
  if (v415)
  {
    uint64_t v416 = v415;
    uint64_t v417 = *(void *)v663;
    do
    {
      uint64_t v418 = 0;
      do
      {
        if (*(void *)v663 != v417) {
          objc_enumerationMutation(v414);
        }
        uint64_t v419 = (void *)[*(id *)(*((void *)&v662 + 1) + 8 * v418) copyWithZone:a3];
        [v5 addKCellularCellPlmnSearchCount:v419];

        ++v418;
      }
      while (v416 != v418);
      uint64_t v416 = [(NSMutableArray *)v414 countByEnumeratingWithState:&v662 objects:v962 count:16];
    }
    while (v416);
  }

  long long v661 = 0u;
  long long v660 = 0u;
  long long v659 = 0u;
  long long v658 = 0u;
  uint64_t v420 = self->_kCellularCellPlmnSearchHists;
  uint64_t v421 = [(NSMutableArray *)v420 countByEnumeratingWithState:&v658 objects:v961 count:16];
  if (v421)
  {
    uint64_t v422 = v421;
    uint64_t v423 = *(void *)v659;
    do
    {
      uint64_t v424 = 0;
      do
      {
        if (*(void *)v659 != v423) {
          objc_enumerationMutation(v420);
        }
        v425 = (void *)[*(id *)(*((void *)&v658 + 1) + 8 * v424) copyWithZone:a3];
        [v5 addKCellularCellPlmnSearchHist:v425];

        ++v424;
      }
      while (v422 != v424);
      uint64_t v422 = [(NSMutableArray *)v420 countByEnumeratingWithState:&v658 objects:v961 count:16];
    }
    while (v422);
  }

  long long v657 = 0u;
  long long v656 = 0u;
  long long v655 = 0u;
  long long v654 = 0u;
  uint64_t v426 = self->_kCellularProtocolStackPowerStates;
  uint64_t v427 = [(NSMutableArray *)v426 countByEnumeratingWithState:&v654 objects:v960 count:16];
  if (v427)
  {
    uint64_t v428 = v427;
    uint64_t v429 = *(void *)v655;
    do
    {
      uint64_t v430 = 0;
      do
      {
        if (*(void *)v655 != v429) {
          objc_enumerationMutation(v426);
        }
        uint64_t v431 = (void *)[*(id *)(*((void *)&v654 + 1) + 8 * v430) copyWithZone:a3];
        [v5 addKCellularProtocolStackPowerState:v431];

        ++v430;
      }
      while (v428 != v430);
      uint64_t v428 = [(NSMutableArray *)v426 countByEnumeratingWithState:&v654 objects:v960 count:16];
    }
    while (v428);
  }

  long long v653 = 0u;
  long long v652 = 0u;
  long long v651 = 0u;
  long long v650 = 0u;
  uint64_t v432 = self->_kCellularDownlinkIpPacketFilterStatus;
  uint64_t v433 = [(NSMutableArray *)v432 countByEnumeratingWithState:&v650 objects:v959 count:16];
  if (v433)
  {
    uint64_t v434 = v433;
    uint64_t v435 = *(void *)v651;
    do
    {
      uint64_t v436 = 0;
      do
      {
        if (*(void *)v651 != v435) {
          objc_enumerationMutation(v432);
        }
        uint64_t v437 = (void *)[*(id *)(*((void *)&v650 + 1) + 8 * v436) copyWithZone:a3];
        [v5 addKCellularDownlinkIpPacketFilterStatus:v437];

        ++v436;
      }
      while (v434 != v436);
      uint64_t v434 = [(NSMutableArray *)v432 countByEnumeratingWithState:&v650 objects:v959 count:16];
    }
    while (v434);
  }

  long long v649 = 0u;
  long long v648 = 0u;
  long long v647 = 0u;
  long long v646 = 0u;
  uint64_t v438 = self->_kCellularDownlinkIpPacketDiscardeds;
  uint64_t v439 = [(NSMutableArray *)v438 countByEnumeratingWithState:&v646 objects:v958 count:16];
  if (v439)
  {
    uint64_t v440 = v439;
    uint64_t v441 = *(void *)v647;
    do
    {
      uint64_t v442 = 0;
      do
      {
        if (*(void *)v647 != v441) {
          objc_enumerationMutation(v438);
        }
        uint64_t v443 = (void *)[*(id *)(*((void *)&v646 + 1) + 8 * v442) copyWithZone:a3];
        [v5 addKCellularDownlinkIpPacketDiscarded:v443];

        ++v442;
      }
      while (v440 != v442);
      uint64_t v440 = [(NSMutableArray *)v438 countByEnumeratingWithState:&v646 objects:v958 count:16];
    }
    while (v440);
  }

  long long v645 = 0u;
  long long v644 = 0u;
  long long v643 = 0u;
  long long v642 = 0u;
  uint64_t v444 = self->_kCellularServingCellRfBandHists;
  uint64_t v445 = [(NSMutableArray *)v444 countByEnumeratingWithState:&v642 objects:v957 count:16];
  if (v445)
  {
    uint64_t v446 = v445;
    uint64_t v447 = *(void *)v643;
    do
    {
      uint64_t v448 = 0;
      do
      {
        if (*(void *)v643 != v447) {
          objc_enumerationMutation(v444);
        }
        uint64_t v449 = (void *)[*(id *)(*((void *)&v642 + 1) + 8 * v448) copyWithZone:a3];
        [v5 addKCellularServingCellRfBandHist:v449];

        ++v448;
      }
      while (v446 != v448);
      uint64_t v446 = [(NSMutableArray *)v444 countByEnumeratingWithState:&v642 objects:v957 count:16];
    }
    while (v446);
  }

  long long v641 = 0u;
  long long v640 = 0u;
  long long v639 = 0u;
  long long v638 = 0u;
  uint64_t v450 = self->_kCellularProtocolStackStateHist2s;
  uint64_t v451 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v638 objects:v956 count:16];
  if (v451)
  {
    uint64_t v452 = v451;
    uint64_t v453 = *(void *)v639;
    do
    {
      uint64_t v454 = 0;
      do
      {
        if (*(void *)v639 != v453) {
          objc_enumerationMutation(v450);
        }
        uint64_t v455 = (void *)[*(id *)(*((void *)&v638 + 1) + 8 * v454) copyWithZone:a3];
        [v5 addKCellularProtocolStackStateHist2:v455];

        ++v454;
      }
      while (v452 != v454);
      uint64_t v452 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v638 objects:v956 count:16];
    }
    while (v452);
  }

  long long v637 = 0u;
  long long v636 = 0u;
  long long v635 = 0u;
  long long v634 = 0u;
  uint64_t v456 = self->_kCellularProtocolStackStates;
  uint64_t v457 = [(NSMutableArray *)v456 countByEnumeratingWithState:&v634 objects:v955 count:16];
  if (v457)
  {
    uint64_t v458 = v457;
    uint64_t v459 = *(void *)v635;
    do
    {
      uint64_t v460 = 0;
      do
      {
        if (*(void *)v635 != v459) {
          objc_enumerationMutation(v456);
        }
        uint64_t v461 = (void *)[*(id *)(*((void *)&v634 + 1) + 8 * v460) copyWithZone:a3];
        [v5 addKCellularProtocolStackState:v461];

        ++v460;
      }
      while (v458 != v460);
      uint64_t v458 = [(NSMutableArray *)v456 countByEnumeratingWithState:&v634 objects:v955 count:16];
    }
    while (v458);
  }

  long long v633 = 0u;
  long long v632 = 0u;
  long long v631 = 0u;
  long long v630 = 0u;
  uint64_t v462 = self->_kCellularCdma1XRxDiversityHists;
  uint64_t v463 = [(NSMutableArray *)v462 countByEnumeratingWithState:&v630 objects:v954 count:16];
  if (v463)
  {
    uint64_t v464 = v463;
    uint64_t v465 = *(void *)v631;
    do
    {
      uint64_t v466 = 0;
      do
      {
        if (*(void *)v631 != v465) {
          objc_enumerationMutation(v462);
        }
        uint64_t v467 = (void *)[*(id *)(*((void *)&v630 + 1) + 8 * v466) copyWithZone:a3];
        [v5 addKCellularCdma1XRxDiversityHist:v467];

        ++v466;
      }
      while (v464 != v466);
      uint64_t v464 = [(NSMutableArray *)v462 countByEnumeratingWithState:&v630 objects:v954 count:16];
    }
    while (v464);
  }

  long long v628 = 0u;
  long long v629 = 0u;
  long long v626 = 0u;
  long long v627 = 0u;
  uint64_t v468 = self->_kCellularCdma1XServingCellRx0RssiHists;
  uint64_t v469 = [(NSMutableArray *)v468 countByEnumeratingWithState:&v626 objects:v953 count:16];
  if (v469)
  {
    uint64_t v470 = v469;
    uint64_t v471 = *(void *)v627;
    do
    {
      uint64_t v472 = 0;
      do
      {
        if (*(void *)v627 != v471) {
          objc_enumerationMutation(v468);
        }
        long long v473 = (void *)[*(id *)(*((void *)&v626 + 1) + 8 * v472) copyWithZone:a3];
        [v5 addKCellularCdma1XServingCellRx0RssiHist:v473];

        ++v472;
      }
      while (v470 != v472);
      uint64_t v470 = [(NSMutableArray *)v468 countByEnumeratingWithState:&v626 objects:v953 count:16];
    }
    while (v470);
  }

  long long v624 = 0u;
  long long v625 = 0u;
  long long v622 = 0u;
  long long v623 = 0u;
  long long v474 = self->_kCellularCdma1XServingCellRx1RssiHists;
  uint64_t v475 = [(NSMutableArray *)v474 countByEnumeratingWithState:&v622 objects:v952 count:16];
  if (v475)
  {
    uint64_t v476 = v475;
    uint64_t v477 = *(void *)v623;
    do
    {
      uint64_t v478 = 0;
      do
      {
        if (*(void *)v623 != v477) {
          objc_enumerationMutation(v474);
        }
        long long v479 = (void *)[*(id *)(*((void *)&v622 + 1) + 8 * v478) copyWithZone:a3];
        [v5 addKCellularCdma1XServingCellRx1RssiHist:v479];

        ++v478;
      }
      while (v476 != v478);
      uint64_t v476 = [(NSMutableArray *)v474 countByEnumeratingWithState:&v622 objects:v952 count:16];
    }
    while (v476);
  }

  long long v620 = 0u;
  long long v621 = 0u;
  long long v618 = 0u;
  long long v619 = 0u;
  long long v480 = self->_kCellularCdma1XServingCellRx0EcIoHists;
  uint64_t v481 = [(NSMutableArray *)v480 countByEnumeratingWithState:&v618 objects:v951 count:16];
  if (v481)
  {
    uint64_t v482 = v481;
    uint64_t v483 = *(void *)v619;
    do
    {
      uint64_t v484 = 0;
      do
      {
        if (*(void *)v619 != v483) {
          objc_enumerationMutation(v480);
        }
        long long v485 = (void *)[*(id *)(*((void *)&v618 + 1) + 8 * v484) copyWithZone:a3];
        [v5 addKCellularCdma1XServingCellRx0EcIoHist:v485];

        ++v484;
      }
      while (v482 != v484);
      uint64_t v482 = [(NSMutableArray *)v480 countByEnumeratingWithState:&v618 objects:v951 count:16];
    }
    while (v482);
  }

  long long v616 = 0u;
  long long v617 = 0u;
  long long v614 = 0u;
  long long v615 = 0u;
  long long v486 = self->_kCellularCdma1XServingCellRx1EcIoHists;
  uint64_t v487 = [(NSMutableArray *)v486 countByEnumeratingWithState:&v614 objects:v950 count:16];
  if (v487)
  {
    uint64_t v488 = v487;
    uint64_t v489 = *(void *)v615;
    do
    {
      uint64_t v490 = 0;
      do
      {
        if (*(void *)v615 != v489) {
          objc_enumerationMutation(v486);
        }
        long long v491 = (void *)[*(id *)(*((void *)&v614 + 1) + 8 * v490) copyWithZone:a3];
        [v5 addKCellularCdma1XServingCellRx1EcIoHist:v491];

        ++v490;
      }
      while (v488 != v490);
      uint64_t v488 = [(NSMutableArray *)v486 countByEnumeratingWithState:&v614 objects:v950 count:16];
    }
    while (v488);
  }

  long long v612 = 0u;
  long long v613 = 0u;
  long long v610 = 0u;
  long long v611 = 0u;
  long long v492 = self->_kCellularCdma1XTxPowerHists;
  uint64_t v493 = [(NSMutableArray *)v492 countByEnumeratingWithState:&v610 objects:v949 count:16];
  if (v493)
  {
    uint64_t v494 = v493;
    uint64_t v495 = *(void *)v611;
    do
    {
      uint64_t v496 = 0;
      do
      {
        if (*(void *)v611 != v495) {
          objc_enumerationMutation(v492);
        }
        long long v497 = (void *)[*(id *)(*((void *)&v610 + 1) + 8 * v496) copyWithZone:a3];
        [v5 addKCellularCdma1XTxPowerHist:v497];

        ++v496;
      }
      while (v494 != v496);
      uint64_t v494 = [(NSMutableArray *)v492 countByEnumeratingWithState:&v610 objects:v949 count:16];
    }
    while (v494);
  }

  long long v608 = 0u;
  long long v609 = 0u;
  long long v606 = 0u;
  long long v607 = 0u;
  long long v498 = self->_kCellularCdma1XProtocolStackStateHists;
  uint64_t v499 = [(NSMutableArray *)v498 countByEnumeratingWithState:&v606 objects:v948 count:16];
  if (v499)
  {
    uint64_t v500 = v499;
    uint64_t v501 = *(void *)v607;
    do
    {
      uint64_t v502 = 0;
      do
      {
        if (*(void *)v607 != v501) {
          objc_enumerationMutation(v498);
        }
        long long v503 = (void *)[*(id *)(*((void *)&v606 + 1) + 8 * v502) copyWithZone:a3];
        [v5 addKCellularCdma1XProtocolStackStateHist:v503];

        ++v502;
      }
      while (v500 != v502);
      uint64_t v500 = [(NSMutableArray *)v498 countByEnumeratingWithState:&v606 objects:v948 count:16];
    }
    while (v500);
  }

  long long v604 = 0u;
  long long v605 = 0u;
  long long v602 = 0u;
  long long v603 = 0u;
  long long v504 = self->_kCellularCdma1XConnectionHists;
  uint64_t v505 = [(NSMutableArray *)v504 countByEnumeratingWithState:&v602 objects:v947 count:16];
  if (v505)
  {
    uint64_t v506 = v505;
    uint64_t v507 = *(void *)v603;
    do
    {
      uint64_t v508 = 0;
      do
      {
        if (*(void *)v603 != v507) {
          objc_enumerationMutation(v504);
        }
        long long v509 = (void *)[*(id *)(*((void *)&v602 + 1) + 8 * v508) copyWithZone:a3];
        [v5 addKCellularCdma1XConnectionHist:v509];

        ++v508;
      }
      while (v506 != v508);
      uint64_t v506 = [(NSMutableArray *)v504 countByEnumeratingWithState:&v602 objects:v947 count:16];
    }
    while (v506);
  }

  long long v600 = 0u;
  long long v601 = 0u;
  long long v598 = 0u;
  long long v599 = 0u;
  long long v510 = self->_kCellularCdma1XRrStates;
  uint64_t v511 = [(NSMutableArray *)v510 countByEnumeratingWithState:&v598 objects:v946 count:16];
  if (v511)
  {
    uint64_t v512 = v511;
    uint64_t v513 = *(void *)v599;
    do
    {
      uint64_t v514 = 0;
      do
      {
        if (*(void *)v599 != v513) {
          objc_enumerationMutation(v510);
        }
        long long v515 = (void *)[*(id *)(*((void *)&v598 + 1) + 8 * v514) copyWithZone:a3];
        [v5 addKCellularCdma1XRrState:v515];

        ++v514;
      }
      while (v512 != v514);
      uint64_t v512 = [(NSMutableArray *)v510 countByEnumeratingWithState:&v598 objects:v946 count:16];
    }
    while (v512);
  }

  long long v596 = 0u;
  long long v597 = 0u;
  long long v594 = 0u;
  long long v595 = 0u;
  long long v516 = self->_kCellularCdmaEvdoRxDiversityHists;
  uint64_t v517 = [(NSMutableArray *)v516 countByEnumeratingWithState:&v594 objects:v945 count:16];
  if (v517)
  {
    uint64_t v518 = v517;
    uint64_t v519 = *(void *)v595;
    do
    {
      uint64_t v520 = 0;
      do
      {
        if (*(void *)v595 != v519) {
          objc_enumerationMutation(v516);
        }
        long long v521 = (void *)[*(id *)(*((void *)&v594 + 1) + 8 * v520) copyWithZone:a3];
        [v5 addKCellularCdmaEvdoRxDiversityHist:v521];

        ++v520;
      }
      while (v518 != v520);
      uint64_t v518 = [(NSMutableArray *)v516 countByEnumeratingWithState:&v594 objects:v945 count:16];
    }
    while (v518);
  }

  long long v592 = 0u;
  long long v593 = 0u;
  long long v590 = 0u;
  long long v591 = 0u;
  long long v522 = self->_kCellularCdmaEvdoServingCellRx0RssiHists;
  uint64_t v523 = [(NSMutableArray *)v522 countByEnumeratingWithState:&v590 objects:v944 count:16];
  if (v523)
  {
    uint64_t v524 = v523;
    uint64_t v525 = *(void *)v591;
    do
    {
      uint64_t v526 = 0;
      do
      {
        if (*(void *)v591 != v525) {
          objc_enumerationMutation(v522);
        }
        long long v527 = (void *)[*(id *)(*((void *)&v590 + 1) + 8 * v526) copyWithZone:a3];
        [v5 addKCellularCdmaEvdoServingCellRx0RssiHist:v527];

        ++v526;
      }
      while (v524 != v526);
      uint64_t v524 = [(NSMutableArray *)v522 countByEnumeratingWithState:&v590 objects:v944 count:16];
    }
    while (v524);
  }

  long long v588 = 0u;
  long long v589 = 0u;
  long long v586 = 0u;
  long long v587 = 0u;
  long long v528 = self->_kCellularCdmaEvdoServingCellRx1RssiHists;
  uint64_t v529 = [(NSMutableArray *)v528 countByEnumeratingWithState:&v586 objects:v943 count:16];
  if (v529)
  {
    uint64_t v530 = v529;
    uint64_t v531 = *(void *)v587;
    do
    {
      uint64_t v532 = 0;
      do
      {
        if (*(void *)v587 != v531) {
          objc_enumerationMutation(v528);
        }
        long long v533 = (void *)[*(id *)(*((void *)&v586 + 1) + 8 * v532) copyWithZone:a3];
        [v5 addKCellularCdmaEvdoServingCellRx1RssiHist:v533];

        ++v532;
      }
      while (v530 != v532);
      uint64_t v530 = [(NSMutableArray *)v528 countByEnumeratingWithState:&v586 objects:v943 count:16];
    }
    while (v530);
  }

  long long v584 = 0u;
  long long v585 = 0u;
  long long v582 = 0u;
  long long v583 = 0u;
  long long v534 = self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
  uint64_t v535 = [(NSMutableArray *)v534 countByEnumeratingWithState:&v582 objects:v942 count:16];
  if (v535)
  {
    uint64_t v536 = v535;
    uint64_t v537 = *(void *)v583;
    do
    {
      uint64_t v538 = 0;
      do
      {
        if (*(void *)v583 != v537) {
          objc_enumerationMutation(v534);
        }
        long long v539 = (void *)[*(id *)(*((void *)&v582 + 1) + 8 * v538) copyWithZone:a3];
        [v5 addKCellularCdmaEvdoServingCellRx0EcIoHist:v539];

        ++v538;
      }
      while (v536 != v538);
      uint64_t v536 = [(NSMutableArray *)v534 countByEnumeratingWithState:&v582 objects:v942 count:16];
    }
    while (v536);
  }

  long long v580 = 0u;
  long long v581 = 0u;
  long long v578 = 0u;
  long long v579 = 0u;
  long long v540 = self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
  uint64_t v541 = [(NSMutableArray *)v540 countByEnumeratingWithState:&v578 objects:v941 count:16];
  if (v541)
  {
    uint64_t v542 = v541;
    uint64_t v543 = *(void *)v579;
    do
    {
      uint64_t v544 = 0;
      do
      {
        if (*(void *)v579 != v543) {
          objc_enumerationMutation(v540);
        }
        long long v545 = (void *)[*(id *)(*((void *)&v578 + 1) + 8 * v544) copyWithZone:a3];
        [v5 addKCellularCdmaEvdoServingCellRx1EcIoHist:v545];

        ++v544;
      }
      while (v542 != v544);
      uint64_t v542 = [(NSMutableArray *)v540 countByEnumeratingWithState:&v578 objects:v941 count:16];
    }
    while (v542);
  }

  long long v576 = 0u;
  long long v577 = 0u;
  long long v574 = 0u;
  long long v575 = 0u;
  long long v546 = self->_kCellularCdmaEvdoTxPowerHists;
  uint64_t v547 = [(NSMutableArray *)v546 countByEnumeratingWithState:&v574 objects:v940 count:16];
  if (v547)
  {
    uint64_t v548 = v547;
    uint64_t v549 = *(void *)v575;
    do
    {
      uint64_t v550 = 0;
      do
      {
        if (*(void *)v575 != v549) {
          objc_enumerationMutation(v546);
        }
        long long v551 = (void *)[*(id *)(*((void *)&v574 + 1) + 8 * v550) copyWithZone:a3];
        [v5 addKCellularCdmaEvdoTxPowerHist:v551];

        ++v550;
      }
      while (v548 != v550);
      uint64_t v548 = [(NSMutableArray *)v546 countByEnumeratingWithState:&v574 objects:v940 count:16];
    }
    while (v548);
  }

  long long v572 = 0u;
  long long v573 = 0u;
  long long v570 = 0u;
  long long v571 = 0u;
  long long v552 = self->_kCellularCdmaEvdoProtocolStackStateHists;
  uint64_t v553 = [(NSMutableArray *)v552 countByEnumeratingWithState:&v570 objects:v939 count:16];
  if (v553)
  {
    uint64_t v554 = v553;
    uint64_t v555 = *(void *)v571;
    do
    {
      uint64_t v556 = 0;
      do
      {
        if (*(void *)v571 != v555) {
          objc_enumerationMutation(v552);
        }
        long long v557 = (void *)[*(id *)(*((void *)&v570 + 1) + 8 * v556) copyWithZone:a3];
        [v5 addKCellularCdmaEvdoProtocolStackStateHist:v557];

        ++v556;
      }
      while (v554 != v556);
      uint64_t v554 = [(NSMutableArray *)v552 countByEnumeratingWithState:&v570 objects:v939 count:16];
    }
    while (v554);
  }

  long long v568 = 0u;
  long long v569 = 0u;
  long long v566 = 0u;
  long long v567 = 0u;
  long long v558 = self->_kCellularCdmaEvdoRrStates;
  uint64_t v559 = [(NSMutableArray *)v558 countByEnumeratingWithState:&v566 objects:v938 count:16];
  if (v559)
  {
    uint64_t v560 = v559;
    uint64_t v561 = *(void *)v567;
    do
    {
      uint64_t v562 = 0;
      do
      {
        if (*(void *)v567 != v561) {
          objc_enumerationMutation(v558);
        }
        long long v563 = objc_msgSend(*(id *)(*((void *)&v566 + 1) + 8 * v562), "copyWithZone:", a3, (void)v566);
        [v5 addKCellularCdmaEvdoRrState:v563];

        ++v562;
      }
      while (v560 != v562);
      uint64_t v560 = [(NSMutableArray *)v558 countByEnumeratingWithState:&v566 objects:v938 count:16];
    }
    while (v560);
  }

  id v564 = v5;
  return v564;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_188;
  }
  kCellularPerClientProfileTriggerCounts = self->_kCellularPerClientProfileTriggerCounts;
  if ((unint64_t)kCellularPerClientProfileTriggerCounts | v4[54])
  {
    if (!-[NSMutableArray isEqual:](kCellularPerClientProfileTriggerCounts, "isEqual:")) {
      goto LABEL_188;
    }
  }
  kCellularProtocolStackCpuStats = self->_kCellularProtocolStackCpuStats;
  if ((unint64_t)kCellularProtocolStackCpuStats | v4[58]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackCpuStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularPeripheralStats = self->_kCellularPeripheralStats;
  if ((unint64_t)kCellularPeripheralStats | v4[55]
    && !-[NSMutableArray isEqual:](kCellularPeripheralStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularDvfsStats = self->_kCellularDvfsStats;
  if ((unint64_t)kCellularDvfsStats | v4[22]
    && !-[NSMutableArray isEqual:](kCellularDvfsStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteWcdmaGsmHwStats = self->_kCellularLteWcdmaGsmHwStats;
  if ((unint64_t)kCellularLteWcdmaGsmHwStats | v4[52]
    && !-[NSMutableArray isEqual:](kCellularLteWcdmaGsmHwStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteTdsGsmHwStats = self->_kCellularLteTdsGsmHwStats;
  if ((unint64_t)kCellularLteTdsGsmHwStats | v4[48]
    && !-[NSMutableArray isEqual:](kCellularLteTdsGsmHwStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularPmuAverageCurrents = self->_kCellularPmuAverageCurrents;
  if ((unint64_t)kCellularPmuAverageCurrents | v4[57]
    && !-[NSMutableArray isEqual:](kCellularPmuAverageCurrents, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularFwCoreStats = self->_kCellularFwCoreStats;
  if ((unint64_t)kCellularFwCoreStats | v4[23]
    && !-[NSMutableArray isEqual:](kCellularFwCoreStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteWcdmaTdsHwStats = self->_kCellularLteWcdmaTdsHwStats;
  if ((unint64_t)kCellularLteWcdmaTdsHwStats | v4[53]
    && !-[NSMutableArray isEqual:](kCellularLteWcdmaTdsHwStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularPmicHwStats = self->_kCellularPmicHwStats;
  if ((unint64_t)kCellularPmicHwStats | v4[56]
    && !-[NSMutableArray isEqual:](kCellularPmicHwStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsRrcStates = self->_kCellularTdsRrcStates;
  if ((unint64_t)kCellularTdsRrcStates | v4[68]
    && !-[NSMutableArray isEqual:](kCellularTdsRrcStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteRrcStates = self->_kCellularLteRrcStates;
  if ((unint64_t)kCellularLteRrcStates | v4[42]
    && !-[NSMutableArray isEqual:](kCellularLteRrcStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLtePagingCycles = self->_kCellularLtePagingCycles;
  if ((unint64_t)kCellularLtePagingCycles | v4[38]
    && !-[NSMutableArray isEqual:](kCellularLtePagingCycles, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteCdrxConfigs = self->_kCellularLteCdrxConfigs;
  if ((unint64_t)kCellularLteCdrxConfigs | v4[31]
    && !-[NSMutableArray isEqual:](kCellularLteCdrxConfigs, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteRadioLinkFailures = self->_kCellularLteRadioLinkFailures;
  if ((unint64_t)kCellularLteRadioLinkFailures | v4[41]
    && !-[NSMutableArray isEqual:](kCellularLteRadioLinkFailures, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLtePdcchStateStats = self->_kCellularLtePdcchStateStats;
  if ((unint64_t)kCellularLtePdcchStateStats | v4[40]
    && !-[NSMutableArray isEqual:](kCellularLtePdcchStateStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLqmStateChanges = self->_kCellularLqmStateChanges;
  if ((unint64_t)kCellularLqmStateChanges | v4[29]
    && !-[NSMutableArray isEqual:](kCellularLqmStateChanges, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularServiceLosts = self->_kCellularServiceLosts;
  if ((unint64_t)kCellularServiceLosts | v4[63]
    && !-[NSMutableArray isEqual:](kCellularServiceLosts, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmServingCellRssiHists = self->_kCellularGsmServingCellRssiHists;
  if ((unint64_t)kCellularGsmServingCellRssiHists | v4[26]
    && !-[NSMutableArray isEqual:](kCellularGsmServingCellRssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmServingCellSnrHists = self->_kCellularGsmServingCellSnrHists;
  if ((unint64_t)kCellularGsmServingCellSnrHists | v4[27]
    && !-[NSMutableArray isEqual:](kCellularGsmServingCellSnrHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmTxPowerHists = self->_kCellularGsmTxPowerHists;
  if ((unint64_t)kCellularGsmTxPowerHists | v4[28]
    && !-[NSMutableArray isEqual:](kCellularGsmTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmConnectedModeHists = self->_kCellularGsmConnectedModeHists;
  if ((unint64_t)kCellularGsmConnectedModeHists | v4[24]
    && !-[NSMutableArray isEqual:](kCellularGsmConnectedModeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularGsmL1States = self->_kCellularGsmL1States;
  if ((unint64_t)kCellularGsmL1States | v4[25]
    && !-[NSMutableArray isEqual:](kCellularGsmL1States, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaCpcStats = self->_kCellularWcdmaCpcStats;
  if ((unint64_t)kCellularWcdmaCpcStats | v4[76]
    && !-[NSMutableArray isEqual:](kCellularWcdmaCpcStats, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRxDiversityHists = self->_kCellularWcdmaRxDiversityHists;
  if ((unint64_t)kCellularWcdmaRxDiversityHists | v4[87]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRxDiversityHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaServingCellRx0RssiHists = self->_kCellularWcdmaServingCellRx0RssiHists;
  if ((unint64_t)kCellularWcdmaServingCellRx0RssiHists | v4[89]
    && !-[NSMutableArray isEqual:](kCellularWcdmaServingCellRx0RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaServingCellRx1RssiHists = self->_kCellularWcdmaServingCellRx1RssiHists;
  if ((unint64_t)kCellularWcdmaServingCellRx1RssiHists | v4[91]
    && !-[NSMutableArray isEqual:](kCellularWcdmaServingCellRx1RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaServingCellRx0EcNoHists = self->_kCellularWcdmaServingCellRx0EcNoHists;
  if ((unint64_t)kCellularWcdmaServingCellRx0EcNoHists | v4[88]
    && !-[NSMutableArray isEqual:](kCellularWcdmaServingCellRx0EcNoHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaServingCellRx1EcNoHists = self->_kCellularWcdmaServingCellRx1EcNoHists;
  if ((unint64_t)kCellularWcdmaServingCellRx1EcNoHists | v4[90]
    && !-[NSMutableArray isEqual:](kCellularWcdmaServingCellRx1EcNoHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaTxPowerHists = self->_kCellularWcdmaTxPowerHists;
  if ((unint64_t)kCellularWcdmaTxPowerHists | v4[92]
    && !-[NSMutableArray isEqual:](kCellularWcdmaTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaReceiverStatusOnC0Hists = self->_kCellularWcdmaReceiverStatusOnC0Hists;
  if ((unint64_t)kCellularWcdmaReceiverStatusOnC0Hists | v4[83]
    && !-[NSMutableArray isEqual:](kCellularWcdmaReceiverStatusOnC0Hists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaReceiverStatusOnC1Hists = self->_kCellularWcdmaReceiverStatusOnC1Hists;
  if ((unint64_t)kCellularWcdmaReceiverStatusOnC1Hists | v4[84]
    && !-[NSMutableArray isEqual:](kCellularWcdmaReceiverStatusOnC1Hists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaCarrierStatusHists = self->_kCellularWcdmaCarrierStatusHists;
  if ((unint64_t)kCellularWcdmaCarrierStatusHists | v4[75]
    && !-[NSMutableArray isEqual:](kCellularWcdmaCarrierStatusHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRabModeHists = self->_kCellularWcdmaRabModeHists;
  if ((unint64_t)kCellularWcdmaRabModeHists | v4[80]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRabModeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRabTypeHists = self->_kCellularWcdmaRabTypeHists;
  if ((unint64_t)kCellularWcdmaRabTypeHists | v4[82]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRabTypeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRrcConnectionStates = self->_kCellularWcdmaRrcConnectionStates;
  if ((unint64_t)kCellularWcdmaRrcConnectionStates | v4[86]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRrcConnectionStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRrcConfigurations = self->_kCellularWcdmaRrcConfigurations;
  if ((unint64_t)kCellularWcdmaRrcConfigurations | v4[85]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRrcConfigurations, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaRabStatus = self->_kCellularWcdmaRabStatus;
  if ((unint64_t)kCellularWcdmaRabStatus | v4[81]
    && !-[NSMutableArray isEqual:](kCellularWcdmaRabStatus, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaL1States = self->_kCellularWcdmaL1States;
  if ((unint64_t)kCellularWcdmaL1States | v4[79]
    && !-[NSMutableArray isEqual:](kCellularWcdmaL1States, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaDataInactivityBeforeIdles = self->_kCellularWcdmaDataInactivityBeforeIdles;
  if ((unint64_t)kCellularWcdmaDataInactivityBeforeIdles | v4[77]
    && !-[NSMutableArray isEqual:](kCellularWcdmaDataInactivityBeforeIdles, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaIdleToConnectedUserDatas = self->_kCellularWcdmaIdleToConnectedUserDatas;
  if ((unint64_t)kCellularWcdmaIdleToConnectedUserDatas | v4[78]
    && !-[NSMutableArray isEqual:](kCellularWcdmaIdleToConnectedUserDatas, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularWcdmaVadHists = self->_kCellularWcdmaVadHists;
  if ((unint64_t)kCellularWcdmaVadHists | v4[93]
    && !-[NSMutableArray isEqual:](kCellularWcdmaVadHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsRxDiversityHists = self->_kCellularTdsRxDiversityHists;
  if ((unint64_t)kCellularTdsRxDiversityHists | v4[69]
    && !-[NSMutableArray isEqual:](kCellularTdsRxDiversityHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsServingCellRx0RssiHists = self->_kCellularTdsServingCellRx0RssiHists;
  if ((unint64_t)kCellularTdsServingCellRx0RssiHists | v4[71]
    && !-[NSMutableArray isEqual:](kCellularTdsServingCellRx0RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsServingCellRx1RssiHists = self->_kCellularTdsServingCellRx1RssiHists;
  if ((unint64_t)kCellularTdsServingCellRx1RssiHists | v4[73]
    && !-[NSMutableArray isEqual:](kCellularTdsServingCellRx1RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsServingCellRx0RscpHists = self->_kCellularTdsServingCellRx0RscpHists;
  if ((unint64_t)kCellularTdsServingCellRx0RscpHists | v4[70]
    && !-[NSMutableArray isEqual:](kCellularTdsServingCellRx0RscpHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsServingCellRx1RscpHists = self->_kCellularTdsServingCellRx1RscpHists;
  if ((unint64_t)kCellularTdsServingCellRx1RscpHists | v4[72]
    && !-[NSMutableArray isEqual:](kCellularTdsServingCellRx1RscpHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsTxPowerHists = self->_kCellularTdsTxPowerHists;
  if ((unint64_t)kCellularTdsTxPowerHists | v4[74]
    && !-[NSMutableArray isEqual:](kCellularTdsTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsRabModeHists = self->_kCellularTdsRabModeHists;
  if ((unint64_t)kCellularTdsRabModeHists | v4[66]
    && !-[NSMutableArray isEqual:](kCellularTdsRabModeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsRabTypeHists = self->_kCellularTdsRabTypeHists;
  if ((unint64_t)kCellularTdsRabTypeHists | v4[67]
    && !-[NSMutableArray isEqual:](kCellularTdsRabTypeHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularTdsL1States = self->_kCellularTdsL1States;
  if ((unint64_t)kCellularTdsL1States | v4[65]
    && !-[NSMutableArray isEqual:](kCellularTdsL1States, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteFwDuplexModes = self->_kCellularLteFwDuplexModes;
  if ((unint64_t)kCellularLteFwDuplexModes | v4[36]
    && !-[NSMutableArray isEqual:](kCellularLteFwDuplexModes, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteServingCellRsrpHists = self->_kCellularLteServingCellRsrpHists;
  if ((unint64_t)kCellularLteServingCellRsrpHists | v4[45]
    && !-[NSMutableArray isEqual:](kCellularLteServingCellRsrpHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteServingCellSinrHists = self->_kCellularLteServingCellSinrHists;
  if ((unint64_t)kCellularLteServingCellSinrHists | v4[46]
    && !-[NSMutableArray isEqual:](kCellularLteServingCellSinrHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteSleepStateHists = self->_kCellularLteSleepStateHists;
  if ((unint64_t)kCellularLteSleepStateHists | v4[47]
    && !-[NSMutableArray isEqual:](kCellularLteSleepStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteTxPowerHists = self->_kCellularLteTxPowerHists;
  if ((unint64_t)kCellularLteTxPowerHists | v4[50]
    && !-[NSMutableArray isEqual:](kCellularLteTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteDlSccStateHists = self->_kCellularLteDlSccStateHists;
  if ((unint64_t)kCellularLteDlSccStateHists | v4[35]
    && !-[NSMutableArray isEqual:](kCellularLteDlSccStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteUlSccStateHists = self->_kCellularLteUlSccStateHists;
  if ((unint64_t)kCellularLteUlSccStateHists | v4[51]
    && !-[NSMutableArray isEqual:](kCellularLteUlSccStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteAdvancedRxStateHists = self->_kCellularLteAdvancedRxStateHists;
  if ((unint64_t)kCellularLteAdvancedRxStateHists | v4[30]
    && !-[NSMutableArray isEqual:](kCellularLteAdvancedRxStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteComponentCarrierInfos = self->_kCellularLteComponentCarrierInfos;
  if ((unint64_t)kCellularLteComponentCarrierInfos | v4[32]
    && !-[NSMutableArray isEqual:](kCellularLteComponentCarrierInfos, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteRxTxStateHists = self->_kCellularLteRxTxStateHists;
  if ((unint64_t)kCellularLteRxTxStateHists | v4[44]
    && !-[NSMutableArray isEqual:](kCellularLteRxTxStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteTotalDlTbsHists = self->_kCellularLteTotalDlTbsHists;
  if ((unint64_t)kCellularLteTotalDlTbsHists | v4[49]
    && !-[NSMutableArray isEqual:](kCellularLteTotalDlTbsHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteDataInactivityBeforeIdles = self->_kCellularLteDataInactivityBeforeIdles;
  if ((unint64_t)kCellularLteDataInactivityBeforeIdles | v4[33]
    && !-[NSMutableArray isEqual:](kCellularLteDataInactivityBeforeIdles, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteIdleToConnectedUserDatas = self->_kCellularLteIdleToConnectedUserDatas;
  if ((unint64_t)kCellularLteIdleToConnectedUserDatas | v4[37]
    && !-[NSMutableArray isEqual:](kCellularLteIdleToConnectedUserDatas, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteDlSccStateHistV3s = self->_kCellularLteDlSccStateHistV3s;
  if ((unint64_t)kCellularLteDlSccStateHistV3s | v4[34]
    && !-[NSMutableArray isEqual:](kCellularLteDlSccStateHistV3s, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLteRxDiversityHists = self->_kCellularLteRxDiversityHists;
  if ((unint64_t)kCellularLteRxDiversityHists | v4[43]
    && !-[NSMutableArray isEqual:](kCellularLteRxDiversityHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularLtePdcchStateHists = self->_kCellularLtePdcchStateHists;
  if ((unint64_t)kCellularLtePdcchStateHists | v4[39]
    && !-[NSMutableArray isEqual:](kCellularLtePdcchStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularProtocolStackStateHists = self->_kCellularProtocolStackStateHists;
  if ((unint64_t)kCellularProtocolStackStateHists | v4[61]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCellPlmnSearchCounts = self->_kCellularCellPlmnSearchCounts;
  if ((unint64_t)kCellularCellPlmnSearchCounts | v4[18]
    && !-[NSMutableArray isEqual:](kCellularCellPlmnSearchCounts, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCellPlmnSearchHists = self->_kCellularCellPlmnSearchHists;
  if ((unint64_t)kCellularCellPlmnSearchHists | v4[19]
    && !-[NSMutableArray isEqual:](kCellularCellPlmnSearchHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularProtocolStackPowerStates = self->_kCellularProtocolStackPowerStates;
  if ((unint64_t)kCellularProtocolStackPowerStates | v4[59]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackPowerStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularDownlinkIpPacketFilterStatus = self->_kCellularDownlinkIpPacketFilterStatus;
  if ((unint64_t)kCellularDownlinkIpPacketFilterStatus | v4[21]
    && !-[NSMutableArray isEqual:](kCellularDownlinkIpPacketFilterStatus, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularDownlinkIpPacketDiscardeds = self->_kCellularDownlinkIpPacketDiscardeds;
  if ((unint64_t)kCellularDownlinkIpPacketDiscardeds | v4[20]
    && !-[NSMutableArray isEqual:](kCellularDownlinkIpPacketDiscardeds, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularServingCellRfBandHists = self->_kCellularServingCellRfBandHists;
  if ((unint64_t)kCellularServingCellRfBandHists | v4[64]
    && !-[NSMutableArray isEqual:](kCellularServingCellRfBandHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularProtocolStackStateHist2s = self->_kCellularProtocolStackStateHist2s;
  if ((unint64_t)kCellularProtocolStackStateHist2s | v4[60]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackStateHist2s, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularProtocolStackStates = self->_kCellularProtocolStackStates;
  if ((unint64_t)kCellularProtocolStackStates | v4[62]
    && !-[NSMutableArray isEqual:](kCellularProtocolStackStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XRxDiversityHists = self->_kCellularCdma1XRxDiversityHists;
  if ((unint64_t)kCellularCdma1XRxDiversityHists | v4[4]
    && !-[NSMutableArray isEqual:](kCellularCdma1XRxDiversityHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XServingCellRx0RssiHists = self->_kCellularCdma1XServingCellRx0RssiHists;
  if ((unint64_t)kCellularCdma1XServingCellRx0RssiHists | v4[6]
    && !-[NSMutableArray isEqual:](kCellularCdma1XServingCellRx0RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XServingCellRx1RssiHists = self->_kCellularCdma1XServingCellRx1RssiHists;
  if ((unint64_t)kCellularCdma1XServingCellRx1RssiHists | v4[8]
    && !-[NSMutableArray isEqual:](kCellularCdma1XServingCellRx1RssiHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XServingCellRx0EcIoHists = self->_kCellularCdma1XServingCellRx0EcIoHists;
  if ((unint64_t)kCellularCdma1XServingCellRx0EcIoHists | v4[5]
    && !-[NSMutableArray isEqual:](kCellularCdma1XServingCellRx0EcIoHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XServingCellRx1EcIoHists = self->_kCellularCdma1XServingCellRx1EcIoHists;
  if ((unint64_t)kCellularCdma1XServingCellRx1EcIoHists | v4[7]
    && !-[NSMutableArray isEqual:](kCellularCdma1XServingCellRx1EcIoHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XTxPowerHists = self->_kCellularCdma1XTxPowerHists;
  if ((unint64_t)kCellularCdma1XTxPowerHists | v4[9]
    && !-[NSMutableArray isEqual:](kCellularCdma1XTxPowerHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XProtocolStackStateHists = self->_kCellularCdma1XProtocolStackStateHists;
  if ((unint64_t)kCellularCdma1XProtocolStackStateHists | v4[2]
    && !-[NSMutableArray isEqual:](kCellularCdma1XProtocolStackStateHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XConnectionHists = self->_kCellularCdma1XConnectionHists;
  if ((unint64_t)kCellularCdma1XConnectionHists | v4[1]
    && !-[NSMutableArray isEqual:](kCellularCdma1XConnectionHists, "isEqual:"))
  {
    goto LABEL_188;
  }
  kCellularCdma1XRrStates = self->_kCellularCdma1XRrStates;
  if ((unint64_t)kCellularCdma1XRrStates | v4[3]
    && !-[NSMutableArray isEqual:](kCellularCdma1XRrStates, "isEqual:"))
  {
    goto LABEL_188;
  }
  if (((kCellularCdmaEvdoRxDiversityHists = self->_kCellularCdmaEvdoRxDiversityHists,
         !((unint64_t)kCellularCdmaEvdoRxDiversityHists | v4[12]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoRxDiversityHists, "isEqual:"))
    && ((kCellularCdmaEvdoServingCellRx0RssiHists = self->_kCellularCdmaEvdoServingCellRx0RssiHists,
         !((unint64_t)kCellularCdmaEvdoServingCellRx0RssiHists | v4[14]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoServingCellRx0RssiHists, "isEqual:"))
    && ((kCellularCdmaEvdoServingCellRx1RssiHists = self->_kCellularCdmaEvdoServingCellRx1RssiHists,
         !((unint64_t)kCellularCdmaEvdoServingCellRx1RssiHists | v4[16]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoServingCellRx1RssiHists, "isEqual:"))
    && ((kCellularCdmaEvdoServingCellRx0EcIoHists = self->_kCellularCdmaEvdoServingCellRx0EcIoHists,
         !((unint64_t)kCellularCdmaEvdoServingCellRx0EcIoHists | v4[13]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoServingCellRx0EcIoHists, "isEqual:"))
    && ((kCellularCdmaEvdoServingCellRx1EcIoHists = self->_kCellularCdmaEvdoServingCellRx1EcIoHists,
         !((unint64_t)kCellularCdmaEvdoServingCellRx1EcIoHists | v4[15]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoServingCellRx1EcIoHists, "isEqual:"))
    && ((kCellularCdmaEvdoTxPowerHists = self->_kCellularCdmaEvdoTxPowerHists,
         !((unint64_t)kCellularCdmaEvdoTxPowerHists | v4[17]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoTxPowerHists, "isEqual:"))
    && ((kCellularCdmaEvdoProtocolStackStateHists = self->_kCellularCdmaEvdoProtocolStackStateHists,
         !((unint64_t)kCellularCdmaEvdoProtocolStackStateHists | v4[10]))
     || -[NSMutableArray isEqual:](kCellularCdmaEvdoProtocolStackStateHists, "isEqual:")))
  {
    kCellularCdmaEvdoRrStates = self->_kCellularCdmaEvdoRrStates;
    if ((unint64_t)kCellularCdmaEvdoRrStates | v4[11]) {
      char v98 = -[NSMutableArray isEqual:](kCellularCdmaEvdoRrStates, "isEqual:");
    }
    else {
      char v98 = 1;
    }
  }
  else
  {
LABEL_188:
    char v98 = 0;
  }

  return v98;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_kCellularPerClientProfileTriggerCounts hash];
  uint64_t v4 = [(NSMutableArray *)self->_kCellularProtocolStackCpuStats hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_kCellularPeripheralStats hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_kCellularDvfsStats hash];
  uint64_t v7 = [(NSMutableArray *)self->_kCellularLteWcdmaGsmHwStats hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_kCellularLteTdsGsmHwStats hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_kCellularPmuAverageCurrents hash];
  uint64_t v10 = [(NSMutableArray *)self->_kCellularFwCoreStats hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_kCellularLteWcdmaTdsHwStats hash];
  uint64_t v12 = v11 ^ [(NSMutableArray *)self->_kCellularPmicHwStats hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSMutableArray *)self->_kCellularTdsRrcStates hash];
  uint64_t v14 = [(NSMutableArray *)self->_kCellularLteRrcStates hash];
  uint64_t v15 = v14 ^ [(NSMutableArray *)self->_kCellularLtePagingCycles hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_kCellularLteCdrxConfigs hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_kCellularLteRadioLinkFailures hash];
  uint64_t v18 = v13 ^ v17 ^ [(NSMutableArray *)self->_kCellularLtePdcchStateStats hash];
  uint64_t v19 = [(NSMutableArray *)self->_kCellularLqmStateChanges hash];
  uint64_t v20 = v19 ^ [(NSMutableArray *)self->_kCellularServiceLosts hash];
  uint64_t v21 = v20 ^ [(NSMutableArray *)self->_kCellularGsmServingCellRssiHists hash];
  uint64_t v22 = v21 ^ [(NSMutableArray *)self->_kCellularGsmServingCellSnrHists hash];
  uint64_t v23 = v22 ^ [(NSMutableArray *)self->_kCellularGsmTxPowerHists hash];
  uint64_t v24 = v18 ^ v23 ^ [(NSMutableArray *)self->_kCellularGsmConnectedModeHists hash];
  uint64_t v25 = [(NSMutableArray *)self->_kCellularGsmL1States hash];
  uint64_t v26 = v25 ^ [(NSMutableArray *)self->_kCellularWcdmaCpcStats hash];
  uint64_t v27 = v26 ^ [(NSMutableArray *)self->_kCellularWcdmaRxDiversityHists hash];
  uint64_t v28 = v27 ^ [(NSMutableArray *)self->_kCellularWcdmaServingCellRx0RssiHists hash];
  uint64_t v29 = v28 ^ [(NSMutableArray *)self->_kCellularWcdmaServingCellRx1RssiHists hash];
  uint64_t v30 = v29 ^ [(NSMutableArray *)self->_kCellularWcdmaServingCellRx0EcNoHists hash];
  uint64_t v31 = v24 ^ v30 ^ [(NSMutableArray *)self->_kCellularWcdmaServingCellRx1EcNoHists hash];
  uint64_t v32 = [(NSMutableArray *)self->_kCellularWcdmaTxPowerHists hash];
  uint64_t v33 = v32 ^ [(NSMutableArray *)self->_kCellularWcdmaReceiverStatusOnC0Hists hash];
  uint64_t v34 = v33 ^ [(NSMutableArray *)self->_kCellularWcdmaReceiverStatusOnC1Hists hash];
  uint64_t v35 = v34 ^ [(NSMutableArray *)self->_kCellularWcdmaCarrierStatusHists hash];
  uint64_t v36 = v35 ^ [(NSMutableArray *)self->_kCellularWcdmaRabModeHists hash];
  uint64_t v37 = v36 ^ [(NSMutableArray *)self->_kCellularWcdmaRabTypeHists hash];
  uint64_t v38 = v37 ^ [(NSMutableArray *)self->_kCellularWcdmaRrcConnectionStates hash];
  uint64_t v39 = v31 ^ v38 ^ [(NSMutableArray *)self->_kCellularWcdmaRrcConfigurations hash];
  uint64_t v40 = [(NSMutableArray *)self->_kCellularWcdmaRabStatus hash];
  uint64_t v41 = v40 ^ [(NSMutableArray *)self->_kCellularWcdmaL1States hash];
  uint64_t v42 = v41 ^ [(NSMutableArray *)self->_kCellularWcdmaDataInactivityBeforeIdles hash];
  uint64_t v43 = v42 ^ [(NSMutableArray *)self->_kCellularWcdmaIdleToConnectedUserDatas hash];
  uint64_t v44 = v43 ^ [(NSMutableArray *)self->_kCellularWcdmaVadHists hash];
  uint64_t v45 = v44 ^ [(NSMutableArray *)self->_kCellularTdsRxDiversityHists hash];
  uint64_t v46 = v45 ^ [(NSMutableArray *)self->_kCellularTdsServingCellRx0RssiHists hash];
  uint64_t v47 = v46 ^ [(NSMutableArray *)self->_kCellularTdsServingCellRx1RssiHists hash];
  uint64_t v48 = v39 ^ v47 ^ [(NSMutableArray *)self->_kCellularTdsServingCellRx0RscpHists hash];
  uint64_t v49 = [(NSMutableArray *)self->_kCellularTdsServingCellRx1RscpHists hash];
  uint64_t v50 = v49 ^ [(NSMutableArray *)self->_kCellularTdsTxPowerHists hash];
  uint64_t v51 = v50 ^ [(NSMutableArray *)self->_kCellularTdsRabModeHists hash];
  uint64_t v52 = v51 ^ [(NSMutableArray *)self->_kCellularTdsRabTypeHists hash];
  uint64_t v53 = v52 ^ [(NSMutableArray *)self->_kCellularTdsL1States hash];
  uint64_t v54 = v53 ^ [(NSMutableArray *)self->_kCellularLteFwDuplexModes hash];
  uint64_t v55 = v54 ^ [(NSMutableArray *)self->_kCellularLteServingCellRsrpHists hash];
  uint64_t v56 = v55 ^ [(NSMutableArray *)self->_kCellularLteServingCellSinrHists hash];
  uint64_t v57 = v56 ^ [(NSMutableArray *)self->_kCellularLteSleepStateHists hash];
  uint64_t v58 = v48 ^ v57 ^ [(NSMutableArray *)self->_kCellularLteTxPowerHists hash];
  uint64_t v59 = [(NSMutableArray *)self->_kCellularLteDlSccStateHists hash];
  uint64_t v60 = v59 ^ [(NSMutableArray *)self->_kCellularLteUlSccStateHists hash];
  uint64_t v61 = v60 ^ [(NSMutableArray *)self->_kCellularLteAdvancedRxStateHists hash];
  uint64_t v62 = v61 ^ [(NSMutableArray *)self->_kCellularLteComponentCarrierInfos hash];
  uint64_t v63 = v62 ^ [(NSMutableArray *)self->_kCellularLteRxTxStateHists hash];
  uint64_t v64 = v63 ^ [(NSMutableArray *)self->_kCellularLteTotalDlTbsHists hash];
  uint64_t v65 = v64 ^ [(NSMutableArray *)self->_kCellularLteDataInactivityBeforeIdles hash];
  uint64_t v66 = v65 ^ [(NSMutableArray *)self->_kCellularLteIdleToConnectedUserDatas hash];
  uint64_t v67 = v66 ^ [(NSMutableArray *)self->_kCellularLteDlSccStateHistV3s hash];
  uint64_t v68 = v67 ^ [(NSMutableArray *)self->_kCellularLteRxDiversityHists hash];
  uint64_t v69 = v58 ^ v68 ^ [(NSMutableArray *)self->_kCellularLtePdcchStateHists hash];
  uint64_t v70 = [(NSMutableArray *)self->_kCellularProtocolStackStateHists hash];
  uint64_t v71 = v70 ^ [(NSMutableArray *)self->_kCellularCellPlmnSearchCounts hash];
  uint64_t v72 = v71 ^ [(NSMutableArray *)self->_kCellularCellPlmnSearchHists hash];
  uint64_t v73 = v72 ^ [(NSMutableArray *)self->_kCellularProtocolStackPowerStates hash];
  uint64_t v74 = v73 ^ [(NSMutableArray *)self->_kCellularDownlinkIpPacketFilterStatus hash];
  uint64_t v75 = v74 ^ [(NSMutableArray *)self->_kCellularDownlinkIpPacketDiscardeds hash];
  uint64_t v76 = v75 ^ [(NSMutableArray *)self->_kCellularServingCellRfBandHists hash];
  uint64_t v77 = v76 ^ [(NSMutableArray *)self->_kCellularProtocolStackStateHist2s hash];
  uint64_t v78 = v77 ^ [(NSMutableArray *)self->_kCellularProtocolStackStates hash];
  uint64_t v79 = v78 ^ [(NSMutableArray *)self->_kCellularCdma1XRxDiversityHists hash];
  uint64_t v80 = v79 ^ [(NSMutableArray *)self->_kCellularCdma1XServingCellRx0RssiHists hash];
  uint64_t v81 = v69 ^ v80 ^ [(NSMutableArray *)self->_kCellularCdma1XServingCellRx1RssiHists hash];
  uint64_t v82 = [(NSMutableArray *)self->_kCellularCdma1XServingCellRx0EcIoHists hash];
  uint64_t v83 = v82 ^ [(NSMutableArray *)self->_kCellularCdma1XServingCellRx1EcIoHists hash];
  uint64_t v84 = v83 ^ [(NSMutableArray *)self->_kCellularCdma1XTxPowerHists hash];
  uint64_t v85 = v84 ^ [(NSMutableArray *)self->_kCellularCdma1XProtocolStackStateHists hash];
  uint64_t v86 = v85 ^ [(NSMutableArray *)self->_kCellularCdma1XConnectionHists hash];
  uint64_t v87 = v86 ^ [(NSMutableArray *)self->_kCellularCdma1XRrStates hash];
  uint64_t v88 = v87 ^ [(NSMutableArray *)self->_kCellularCdmaEvdoRxDiversityHists hash];
  uint64_t v89 = v88 ^ [(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx0RssiHists hash];
  uint64_t v90 = v89 ^ [(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx1RssiHists hash];
  uint64_t v91 = v90 ^ [(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx0EcIoHists hash];
  uint64_t v92 = v91 ^ [(NSMutableArray *)self->_kCellularCdmaEvdoServingCellRx1EcIoHists hash];
  uint64_t v93 = v92 ^ [(NSMutableArray *)self->_kCellularCdmaEvdoTxPowerHists hash];
  uint64_t v94 = v81 ^ v93 ^ [(NSMutableArray *)self->_kCellularCdmaEvdoProtocolStackStateHists hash];
  return v94 ^ [(NSMutableArray *)self->_kCellularCdmaEvdoRrStates hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v935 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (id *)a3;
  long long v838 = 0u;
  long long v839 = 0u;
  long long v840 = 0u;
  long long v841 = 0u;
  id v5 = v4[54];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v838 objects:v934 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v839;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v839 != v8) {
          objc_enumerationMutation(v5);
        }
        [(PowerlogMetricLog *)self addKCellularPerClientProfileTriggerCount:*(void *)(*((void *)&v838 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v838 objects:v934 count:16];
    }
    while (v7);
  }

  long long v837 = 0u;
  long long v836 = 0u;
  long long v835 = 0u;
  long long v834 = 0u;
  id v10 = v4[58];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v834 objects:v933 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v835;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v835 != v13) {
          objc_enumerationMutation(v10);
        }
        [(PowerlogMetricLog *)self addKCellularProtocolStackCpuStats:*(void *)(*((void *)&v834 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v834 objects:v933 count:16];
    }
    while (v12);
  }

  long long v833 = 0u;
  long long v832 = 0u;
  long long v831 = 0u;
  long long v830 = 0u;
  id v15 = v4[55];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v830 objects:v932 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v831;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v831 != v18) {
          objc_enumerationMutation(v15);
        }
        [(PowerlogMetricLog *)self addKCellularPeripheralStats:*(void *)(*((void *)&v830 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v830 objects:v932 count:16];
    }
    while (v17);
  }

  long long v829 = 0u;
  long long v828 = 0u;
  long long v827 = 0u;
  long long v826 = 0u;
  id v20 = v4[22];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v826 objects:v931 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v827;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v827 != v23) {
          objc_enumerationMutation(v20);
        }
        [(PowerlogMetricLog *)self addKCellularDvfsStats:*(void *)(*((void *)&v826 + 1) + 8 * v24++)];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v826 objects:v931 count:16];
    }
    while (v22);
  }

  long long v825 = 0u;
  long long v824 = 0u;
  long long v823 = 0u;
  long long v822 = 0u;
  id v25 = v4[52];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v822 objects:v930 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v823;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v823 != v28) {
          objc_enumerationMutation(v25);
        }
        [(PowerlogMetricLog *)self addKCellularLteWcdmaGsmHwStats:*(void *)(*((void *)&v822 + 1) + 8 * v29++)];
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v822 objects:v930 count:16];
    }
    while (v27);
  }

  long long v821 = 0u;
  long long v820 = 0u;
  long long v819 = 0u;
  long long v818 = 0u;
  id v30 = v4[48];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v818 objects:v929 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v819;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v819 != v33) {
          objc_enumerationMutation(v30);
        }
        [(PowerlogMetricLog *)self addKCellularLteTdsGsmHwStats:*(void *)(*((void *)&v818 + 1) + 8 * v34++)];
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v818 objects:v929 count:16];
    }
    while (v32);
  }

  long long v817 = 0u;
  long long v816 = 0u;
  long long v815 = 0u;
  long long v814 = 0u;
  id v35 = v4[57];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v814 objects:v928 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v815;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v815 != v38) {
          objc_enumerationMutation(v35);
        }
        [(PowerlogMetricLog *)self addKCellularPmuAverageCurrent:*(void *)(*((void *)&v814 + 1) + 8 * v39++)];
      }
      while (v37 != v39);
      uint64_t v37 = [v35 countByEnumeratingWithState:&v814 objects:v928 count:16];
    }
    while (v37);
  }

  long long v813 = 0u;
  long long v812 = 0u;
  long long v811 = 0u;
  long long v810 = 0u;
  id v40 = v4[23];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v810 objects:v927 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v811;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v811 != v43) {
          objc_enumerationMutation(v40);
        }
        [(PowerlogMetricLog *)self addKCellularFwCoreStats:*(void *)(*((void *)&v810 + 1) + 8 * v44++)];
      }
      while (v42 != v44);
      uint64_t v42 = [v40 countByEnumeratingWithState:&v810 objects:v927 count:16];
    }
    while (v42);
  }

  long long v809 = 0u;
  long long v808 = 0u;
  long long v807 = 0u;
  long long v806 = 0u;
  id v45 = v4[53];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v806 objects:v926 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v807;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v807 != v48) {
          objc_enumerationMutation(v45);
        }
        [(PowerlogMetricLog *)self addKCellularLteWcdmaTdsHwStats:*(void *)(*((void *)&v806 + 1) + 8 * v49++)];
      }
      while (v47 != v49);
      uint64_t v47 = [v45 countByEnumeratingWithState:&v806 objects:v926 count:16];
    }
    while (v47);
  }

  long long v805 = 0u;
  long long v804 = 0u;
  long long v803 = 0u;
  long long v802 = 0u;
  id v50 = v4[56];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v802 objects:v925 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v803;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v803 != v53) {
          objc_enumerationMutation(v50);
        }
        [(PowerlogMetricLog *)self addKCellularPmicHwStats:*(void *)(*((void *)&v802 + 1) + 8 * v54++)];
      }
      while (v52 != v54);
      uint64_t v52 = [v50 countByEnumeratingWithState:&v802 objects:v925 count:16];
    }
    while (v52);
  }

  long long v801 = 0u;
  long long v800 = 0u;
  long long v799 = 0u;
  long long v798 = 0u;
  id v55 = v4[68];
  uint64_t v56 = [v55 countByEnumeratingWithState:&v798 objects:v924 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v799;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v799 != v58) {
          objc_enumerationMutation(v55);
        }
        [(PowerlogMetricLog *)self addKCellularTdsRrcState:*(void *)(*((void *)&v798 + 1) + 8 * v59++)];
      }
      while (v57 != v59);
      uint64_t v57 = [v55 countByEnumeratingWithState:&v798 objects:v924 count:16];
    }
    while (v57);
  }

  long long v797 = 0u;
  long long v796 = 0u;
  long long v795 = 0u;
  long long v794 = 0u;
  id v60 = v4[42];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v794 objects:v923 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v795;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v795 != v63) {
          objc_enumerationMutation(v60);
        }
        [(PowerlogMetricLog *)self addKCellularLteRrcState:*(void *)(*((void *)&v794 + 1) + 8 * v64++)];
      }
      while (v62 != v64);
      uint64_t v62 = [v60 countByEnumeratingWithState:&v794 objects:v923 count:16];
    }
    while (v62);
  }

  long long v793 = 0u;
  long long v792 = 0u;
  long long v791 = 0u;
  long long v790 = 0u;
  id v65 = v4[38];
  uint64_t v66 = [v65 countByEnumeratingWithState:&v790 objects:v922 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v791;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v791 != v68) {
          objc_enumerationMutation(v65);
        }
        [(PowerlogMetricLog *)self addKCellularLtePagingCycle:*(void *)(*((void *)&v790 + 1) + 8 * v69++)];
      }
      while (v67 != v69);
      uint64_t v67 = [v65 countByEnumeratingWithState:&v790 objects:v922 count:16];
    }
    while (v67);
  }

  long long v789 = 0u;
  long long v788 = 0u;
  long long v787 = 0u;
  long long v786 = 0u;
  id v70 = v4[31];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v786 objects:v921 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v787;
    do
    {
      uint64_t v74 = 0;
      do
      {
        if (*(void *)v787 != v73) {
          objc_enumerationMutation(v70);
        }
        [(PowerlogMetricLog *)self addKCellularLteCdrxConfig:*(void *)(*((void *)&v786 + 1) + 8 * v74++)];
      }
      while (v72 != v74);
      uint64_t v72 = [v70 countByEnumeratingWithState:&v786 objects:v921 count:16];
    }
    while (v72);
  }

  long long v785 = 0u;
  long long v784 = 0u;
  long long v783 = 0u;
  long long v782 = 0u;
  id v75 = v4[41];
  uint64_t v76 = [v75 countByEnumeratingWithState:&v782 objects:v920 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v783;
    do
    {
      uint64_t v79 = 0;
      do
      {
        if (*(void *)v783 != v78) {
          objc_enumerationMutation(v75);
        }
        [(PowerlogMetricLog *)self addKCellularLteRadioLinkFailure:*(void *)(*((void *)&v782 + 1) + 8 * v79++)];
      }
      while (v77 != v79);
      uint64_t v77 = [v75 countByEnumeratingWithState:&v782 objects:v920 count:16];
    }
    while (v77);
  }

  long long v781 = 0u;
  long long v780 = 0u;
  long long v779 = 0u;
  long long v778 = 0u;
  id v80 = v4[40];
  uint64_t v81 = [v80 countByEnumeratingWithState:&v778 objects:v919 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v779;
    do
    {
      uint64_t v84 = 0;
      do
      {
        if (*(void *)v779 != v83) {
          objc_enumerationMutation(v80);
        }
        [(PowerlogMetricLog *)self addKCellularLtePdcchStateStats:*(void *)(*((void *)&v778 + 1) + 8 * v84++)];
      }
      while (v82 != v84);
      uint64_t v82 = [v80 countByEnumeratingWithState:&v778 objects:v919 count:16];
    }
    while (v82);
  }

  long long v777 = 0u;
  long long v776 = 0u;
  long long v775 = 0u;
  long long v774 = 0u;
  id v85 = v4[29];
  uint64_t v86 = [v85 countByEnumeratingWithState:&v774 objects:v918 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v775;
    do
    {
      uint64_t v89 = 0;
      do
      {
        if (*(void *)v775 != v88) {
          objc_enumerationMutation(v85);
        }
        [(PowerlogMetricLog *)self addKCellularLqmStateChange:*(void *)(*((void *)&v774 + 1) + 8 * v89++)];
      }
      while (v87 != v89);
      uint64_t v87 = [v85 countByEnumeratingWithState:&v774 objects:v918 count:16];
    }
    while (v87);
  }

  long long v773 = 0u;
  long long v772 = 0u;
  long long v771 = 0u;
  long long v770 = 0u;
  id v90 = v4[63];
  uint64_t v91 = [v90 countByEnumeratingWithState:&v770 objects:v917 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v771;
    do
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v771 != v93) {
          objc_enumerationMutation(v90);
        }
        [(PowerlogMetricLog *)self addKCellularServiceLost:*(void *)(*((void *)&v770 + 1) + 8 * v94++)];
      }
      while (v92 != v94);
      uint64_t v92 = [v90 countByEnumeratingWithState:&v770 objects:v917 count:16];
    }
    while (v92);
  }

  long long v769 = 0u;
  long long v768 = 0u;
  long long v767 = 0u;
  long long v766 = 0u;
  id v95 = v4[26];
  uint64_t v96 = [v95 countByEnumeratingWithState:&v766 objects:v916 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v767;
    do
    {
      uint64_t v99 = 0;
      do
      {
        if (*(void *)v767 != v98) {
          objc_enumerationMutation(v95);
        }
        [(PowerlogMetricLog *)self addKCellularGsmServingCellRssiHist:*(void *)(*((void *)&v766 + 1) + 8 * v99++)];
      }
      while (v97 != v99);
      uint64_t v97 = [v95 countByEnumeratingWithState:&v766 objects:v916 count:16];
    }
    while (v97);
  }

  long long v765 = 0u;
  long long v764 = 0u;
  long long v763 = 0u;
  long long v762 = 0u;
  id v100 = v4[27];
  uint64_t v101 = [v100 countByEnumeratingWithState:&v762 objects:v915 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v763;
    do
    {
      uint64_t v104 = 0;
      do
      {
        if (*(void *)v763 != v103) {
          objc_enumerationMutation(v100);
        }
        [(PowerlogMetricLog *)self addKCellularGsmServingCellSnrHist:*(void *)(*((void *)&v762 + 1) + 8 * v104++)];
      }
      while (v102 != v104);
      uint64_t v102 = [v100 countByEnumeratingWithState:&v762 objects:v915 count:16];
    }
    while (v102);
  }

  long long v761 = 0u;
  long long v760 = 0u;
  long long v759 = 0u;
  long long v758 = 0u;
  id v105 = v4[28];
  uint64_t v106 = [v105 countByEnumeratingWithState:&v758 objects:v914 count:16];
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v759;
    do
    {
      uint64_t v109 = 0;
      do
      {
        if (*(void *)v759 != v108) {
          objc_enumerationMutation(v105);
        }
        [(PowerlogMetricLog *)self addKCellularGsmTxPowerHist:*(void *)(*((void *)&v758 + 1) + 8 * v109++)];
      }
      while (v107 != v109);
      uint64_t v107 = [v105 countByEnumeratingWithState:&v758 objects:v914 count:16];
    }
    while (v107);
  }

  long long v757 = 0u;
  long long v756 = 0u;
  long long v755 = 0u;
  long long v754 = 0u;
  id v110 = v4[24];
  uint64_t v111 = [v110 countByEnumeratingWithState:&v754 objects:v913 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v755;
    do
    {
      uint64_t v114 = 0;
      do
      {
        if (*(void *)v755 != v113) {
          objc_enumerationMutation(v110);
        }
        [(PowerlogMetricLog *)self addKCellularGsmConnectedModeHist:*(void *)(*((void *)&v754 + 1) + 8 * v114++)];
      }
      while (v112 != v114);
      uint64_t v112 = [v110 countByEnumeratingWithState:&v754 objects:v913 count:16];
    }
    while (v112);
  }

  long long v753 = 0u;
  long long v752 = 0u;
  long long v751 = 0u;
  long long v750 = 0u;
  id v115 = v4[25];
  uint64_t v116 = [v115 countByEnumeratingWithState:&v750 objects:v912 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v751;
    do
    {
      uint64_t v119 = 0;
      do
      {
        if (*(void *)v751 != v118) {
          objc_enumerationMutation(v115);
        }
        [(PowerlogMetricLog *)self addKCellularGsmL1State:*(void *)(*((void *)&v750 + 1) + 8 * v119++)];
      }
      while (v117 != v119);
      uint64_t v117 = [v115 countByEnumeratingWithState:&v750 objects:v912 count:16];
    }
    while (v117);
  }

  long long v749 = 0u;
  long long v748 = 0u;
  long long v747 = 0u;
  long long v746 = 0u;
  id v120 = v4[76];
  uint64_t v121 = [v120 countByEnumeratingWithState:&v746 objects:v911 count:16];
  if (v121)
  {
    uint64_t v122 = v121;
    uint64_t v123 = *(void *)v747;
    do
    {
      uint64_t v124 = 0;
      do
      {
        if (*(void *)v747 != v123) {
          objc_enumerationMutation(v120);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaCpcStat:*(void *)(*((void *)&v746 + 1) + 8 * v124++)];
      }
      while (v122 != v124);
      uint64_t v122 = [v120 countByEnumeratingWithState:&v746 objects:v911 count:16];
    }
    while (v122);
  }

  long long v745 = 0u;
  long long v744 = 0u;
  long long v743 = 0u;
  long long v742 = 0u;
  id v125 = v4[87];
  uint64_t v126 = [v125 countByEnumeratingWithState:&v742 objects:v910 count:16];
  if (v126)
  {
    uint64_t v127 = v126;
    uint64_t v128 = *(void *)v743;
    do
    {
      uint64_t v129 = 0;
      do
      {
        if (*(void *)v743 != v128) {
          objc_enumerationMutation(v125);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaRxDiversityHist:*(void *)(*((void *)&v742 + 1) + 8 * v129++)];
      }
      while (v127 != v129);
      uint64_t v127 = [v125 countByEnumeratingWithState:&v742 objects:v910 count:16];
    }
    while (v127);
  }

  long long v741 = 0u;
  long long v740 = 0u;
  long long v739 = 0u;
  long long v738 = 0u;
  id v130 = v4[89];
  uint64_t v131 = [v130 countByEnumeratingWithState:&v738 objects:v909 count:16];
  if (v131)
  {
    uint64_t v132 = v131;
    uint64_t v133 = *(void *)v739;
    do
    {
      uint64_t v134 = 0;
      do
      {
        if (*(void *)v739 != v133) {
          objc_enumerationMutation(v130);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaServingCellRx0RssiHist:*(void *)(*((void *)&v738 + 1) + 8 * v134++)];
      }
      while (v132 != v134);
      uint64_t v132 = [v130 countByEnumeratingWithState:&v738 objects:v909 count:16];
    }
    while (v132);
  }

  long long v737 = 0u;
  long long v736 = 0u;
  long long v735 = 0u;
  long long v734 = 0u;
  id v135 = v4[91];
  uint64_t v136 = [v135 countByEnumeratingWithState:&v734 objects:v908 count:16];
  if (v136)
  {
    uint64_t v137 = v136;
    uint64_t v138 = *(void *)v735;
    do
    {
      uint64_t v139 = 0;
      do
      {
        if (*(void *)v735 != v138) {
          objc_enumerationMutation(v135);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaServingCellRx1RssiHist:*(void *)(*((void *)&v734 + 1) + 8 * v139++)];
      }
      while (v137 != v139);
      uint64_t v137 = [v135 countByEnumeratingWithState:&v734 objects:v908 count:16];
    }
    while (v137);
  }

  long long v733 = 0u;
  long long v732 = 0u;
  long long v731 = 0u;
  long long v730 = 0u;
  id v140 = v4[88];
  uint64_t v141 = [v140 countByEnumeratingWithState:&v730 objects:v907 count:16];
  if (v141)
  {
    uint64_t v142 = v141;
    uint64_t v143 = *(void *)v731;
    do
    {
      uint64_t v144 = 0;
      do
      {
        if (*(void *)v731 != v143) {
          objc_enumerationMutation(v140);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaServingCellRx0EcNoHist:*(void *)(*((void *)&v730 + 1) + 8 * v144++)];
      }
      while (v142 != v144);
      uint64_t v142 = [v140 countByEnumeratingWithState:&v730 objects:v907 count:16];
    }
    while (v142);
  }

  long long v729 = 0u;
  long long v728 = 0u;
  long long v727 = 0u;
  long long v726 = 0u;
  id v145 = v4[90];
  uint64_t v146 = [v145 countByEnumeratingWithState:&v726 objects:v906 count:16];
  if (v146)
  {
    uint64_t v147 = v146;
    uint64_t v148 = *(void *)v727;
    do
    {
      uint64_t v149 = 0;
      do
      {
        if (*(void *)v727 != v148) {
          objc_enumerationMutation(v145);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaServingCellRx1EcNoHist:*(void *)(*((void *)&v726 + 1) + 8 * v149++)];
      }
      while (v147 != v149);
      uint64_t v147 = [v145 countByEnumeratingWithState:&v726 objects:v906 count:16];
    }
    while (v147);
  }

  long long v725 = 0u;
  long long v724 = 0u;
  long long v723 = 0u;
  long long v722 = 0u;
  id v150 = v4[92];
  uint64_t v151 = [v150 countByEnumeratingWithState:&v722 objects:v905 count:16];
  if (v151)
  {
    uint64_t v152 = v151;
    uint64_t v153 = *(void *)v723;
    do
    {
      uint64_t v154 = 0;
      do
      {
        if (*(void *)v723 != v153) {
          objc_enumerationMutation(v150);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaTxPowerHist:*(void *)(*((void *)&v722 + 1) + 8 * v154++)];
      }
      while (v152 != v154);
      uint64_t v152 = [v150 countByEnumeratingWithState:&v722 objects:v905 count:16];
    }
    while (v152);
  }

  long long v721 = 0u;
  long long v720 = 0u;
  long long v719 = 0u;
  long long v718 = 0u;
  id v155 = v4[83];
  uint64_t v156 = [v155 countByEnumeratingWithState:&v718 objects:v904 count:16];
  if (v156)
  {
    uint64_t v157 = v156;
    uint64_t v158 = *(void *)v719;
    do
    {
      uint64_t v159 = 0;
      do
      {
        if (*(void *)v719 != v158) {
          objc_enumerationMutation(v155);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaReceiverStatusOnC0Hist:*(void *)(*((void *)&v718 + 1) + 8 * v159++)];
      }
      while (v157 != v159);
      uint64_t v157 = [v155 countByEnumeratingWithState:&v718 objects:v904 count:16];
    }
    while (v157);
  }

  long long v717 = 0u;
  long long v716 = 0u;
  long long v715 = 0u;
  long long v714 = 0u;
  id v160 = v4[84];
  uint64_t v161 = [v160 countByEnumeratingWithState:&v714 objects:v903 count:16];
  if (v161)
  {
    uint64_t v162 = v161;
    uint64_t v163 = *(void *)v715;
    do
    {
      uint64_t v164 = 0;
      do
      {
        if (*(void *)v715 != v163) {
          objc_enumerationMutation(v160);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaReceiverStatusOnC1Hist:*(void *)(*((void *)&v714 + 1) + 8 * v164++)];
      }
      while (v162 != v164);
      uint64_t v162 = [v160 countByEnumeratingWithState:&v714 objects:v903 count:16];
    }
    while (v162);
  }

  long long v713 = 0u;
  long long v712 = 0u;
  long long v711 = 0u;
  long long v710 = 0u;
  id v165 = v4[75];
  uint64_t v166 = [v165 countByEnumeratingWithState:&v710 objects:v902 count:16];
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v168 = *(void *)v711;
    do
    {
      uint64_t v169 = 0;
      do
      {
        if (*(void *)v711 != v168) {
          objc_enumerationMutation(v165);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaCarrierStatusHist:*(void *)(*((void *)&v710 + 1) + 8 * v169++)];
      }
      while (v167 != v169);
      uint64_t v167 = [v165 countByEnumeratingWithState:&v710 objects:v902 count:16];
    }
    while (v167);
  }

  long long v709 = 0u;
  long long v708 = 0u;
  long long v707 = 0u;
  long long v706 = 0u;
  id v170 = v4[80];
  uint64_t v171 = [v170 countByEnumeratingWithState:&v706 objects:v901 count:16];
  if (v171)
  {
    uint64_t v172 = v171;
    uint64_t v173 = *(void *)v707;
    do
    {
      uint64_t v174 = 0;
      do
      {
        if (*(void *)v707 != v173) {
          objc_enumerationMutation(v170);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaRabModeHist:*(void *)(*((void *)&v706 + 1) + 8 * v174++)];
      }
      while (v172 != v174);
      uint64_t v172 = [v170 countByEnumeratingWithState:&v706 objects:v901 count:16];
    }
    while (v172);
  }

  long long v705 = 0u;
  long long v704 = 0u;
  long long v703 = 0u;
  long long v702 = 0u;
  id v175 = v4[82];
  uint64_t v176 = [v175 countByEnumeratingWithState:&v702 objects:v900 count:16];
  if (v176)
  {
    uint64_t v177 = v176;
    uint64_t v178 = *(void *)v703;
    do
    {
      uint64_t v179 = 0;
      do
      {
        if (*(void *)v703 != v178) {
          objc_enumerationMutation(v175);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaRabTypeHist:*(void *)(*((void *)&v702 + 1) + 8 * v179++)];
      }
      while (v177 != v179);
      uint64_t v177 = [v175 countByEnumeratingWithState:&v702 objects:v900 count:16];
    }
    while (v177);
  }

  long long v701 = 0u;
  long long v700 = 0u;
  long long v699 = 0u;
  long long v698 = 0u;
  id v180 = v4[86];
  uint64_t v181 = [v180 countByEnumeratingWithState:&v698 objects:v899 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v699;
    do
    {
      uint64_t v184 = 0;
      do
      {
        if (*(void *)v699 != v183) {
          objc_enumerationMutation(v180);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaRrcConnectionState:*(void *)(*((void *)&v698 + 1) + 8 * v184++)];
      }
      while (v182 != v184);
      uint64_t v182 = [v180 countByEnumeratingWithState:&v698 objects:v899 count:16];
    }
    while (v182);
  }

  long long v697 = 0u;
  long long v696 = 0u;
  long long v695 = 0u;
  long long v694 = 0u;
  id v185 = v4[85];
  uint64_t v186 = [v185 countByEnumeratingWithState:&v694 objects:v898 count:16];
  if (v186)
  {
    uint64_t v187 = v186;
    uint64_t v188 = *(void *)v695;
    do
    {
      uint64_t v189 = 0;
      do
      {
        if (*(void *)v695 != v188) {
          objc_enumerationMutation(v185);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaRrcConfiguration:*(void *)(*((void *)&v694 + 1) + 8 * v189++)];
      }
      while (v187 != v189);
      uint64_t v187 = [v185 countByEnumeratingWithState:&v694 objects:v898 count:16];
    }
    while (v187);
  }

  long long v693 = 0u;
  long long v692 = 0u;
  long long v691 = 0u;
  long long v690 = 0u;
  id v190 = v4[81];
  uint64_t v191 = [v190 countByEnumeratingWithState:&v690 objects:v897 count:16];
  if (v191)
  {
    uint64_t v192 = v191;
    uint64_t v193 = *(void *)v691;
    do
    {
      uint64_t v194 = 0;
      do
      {
        if (*(void *)v691 != v193) {
          objc_enumerationMutation(v190);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaRabStatus:*(void *)(*((void *)&v690 + 1) + 8 * v194++)];
      }
      while (v192 != v194);
      uint64_t v192 = [v190 countByEnumeratingWithState:&v690 objects:v897 count:16];
    }
    while (v192);
  }

  long long v689 = 0u;
  long long v688 = 0u;
  long long v687 = 0u;
  long long v686 = 0u;
  id v195 = v4[79];
  uint64_t v196 = [v195 countByEnumeratingWithState:&v686 objects:v896 count:16];
  if (v196)
  {
    uint64_t v197 = v196;
    uint64_t v198 = *(void *)v687;
    do
    {
      uint64_t v199 = 0;
      do
      {
        if (*(void *)v687 != v198) {
          objc_enumerationMutation(v195);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaL1State:*(void *)(*((void *)&v686 + 1) + 8 * v199++)];
      }
      while (v197 != v199);
      uint64_t v197 = [v195 countByEnumeratingWithState:&v686 objects:v896 count:16];
    }
    while (v197);
  }

  long long v685 = 0u;
  long long v684 = 0u;
  long long v683 = 0u;
  long long v682 = 0u;
  id v200 = v4[77];
  uint64_t v201 = [v200 countByEnumeratingWithState:&v682 objects:v895 count:16];
  if (v201)
  {
    uint64_t v202 = v201;
    uint64_t v203 = *(void *)v683;
    do
    {
      uint64_t v204 = 0;
      do
      {
        if (*(void *)v683 != v203) {
          objc_enumerationMutation(v200);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaDataInactivityBeforeIdle:*(void *)(*((void *)&v682 + 1) + 8 * v204++)];
      }
      while (v202 != v204);
      uint64_t v202 = [v200 countByEnumeratingWithState:&v682 objects:v895 count:16];
    }
    while (v202);
  }

  long long v681 = 0u;
  long long v680 = 0u;
  long long v679 = 0u;
  long long v678 = 0u;
  id v205 = v4[78];
  uint64_t v206 = [v205 countByEnumeratingWithState:&v678 objects:v894 count:16];
  if (v206)
  {
    uint64_t v207 = v206;
    uint64_t v208 = *(void *)v679;
    do
    {
      uint64_t v209 = 0;
      do
      {
        if (*(void *)v679 != v208) {
          objc_enumerationMutation(v205);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaIdleToConnectedUserData:*(void *)(*((void *)&v678 + 1) + 8 * v209++)];
      }
      while (v207 != v209);
      uint64_t v207 = [v205 countByEnumeratingWithState:&v678 objects:v894 count:16];
    }
    while (v207);
  }

  long long v677 = 0u;
  long long v676 = 0u;
  long long v675 = 0u;
  long long v674 = 0u;
  id v210 = v4[93];
  uint64_t v211 = [v210 countByEnumeratingWithState:&v674 objects:v893 count:16];
  if (v211)
  {
    uint64_t v212 = v211;
    uint64_t v213 = *(void *)v675;
    do
    {
      uint64_t v214 = 0;
      do
      {
        if (*(void *)v675 != v213) {
          objc_enumerationMutation(v210);
        }
        [(PowerlogMetricLog *)self addKCellularWcdmaVadHist:*(void *)(*((void *)&v674 + 1) + 8 * v214++)];
      }
      while (v212 != v214);
      uint64_t v212 = [v210 countByEnumeratingWithState:&v674 objects:v893 count:16];
    }
    while (v212);
  }

  long long v673 = 0u;
  long long v672 = 0u;
  long long v671 = 0u;
  long long v670 = 0u;
  id v215 = v4[69];
  uint64_t v216 = [v215 countByEnumeratingWithState:&v670 objects:v892 count:16];
  if (v216)
  {
    uint64_t v217 = v216;
    uint64_t v218 = *(void *)v671;
    do
    {
      uint64_t v219 = 0;
      do
      {
        if (*(void *)v671 != v218) {
          objc_enumerationMutation(v215);
        }
        [(PowerlogMetricLog *)self addKCellularTdsRxDiversityHist:*(void *)(*((void *)&v670 + 1) + 8 * v219++)];
      }
      while (v217 != v219);
      uint64_t v217 = [v215 countByEnumeratingWithState:&v670 objects:v892 count:16];
    }
    while (v217);
  }

  long long v669 = 0u;
  long long v668 = 0u;
  long long v667 = 0u;
  long long v666 = 0u;
  id v220 = v4[71];
  uint64_t v221 = [v220 countByEnumeratingWithState:&v666 objects:v891 count:16];
  if (v221)
  {
    uint64_t v222 = v221;
    uint64_t v223 = *(void *)v667;
    do
    {
      uint64_t v224 = 0;
      do
      {
        if (*(void *)v667 != v223) {
          objc_enumerationMutation(v220);
        }
        [(PowerlogMetricLog *)self addKCellularTdsServingCellRx0RssiHist:*(void *)(*((void *)&v666 + 1) + 8 * v224++)];
      }
      while (v222 != v224);
      uint64_t v222 = [v220 countByEnumeratingWithState:&v666 objects:v891 count:16];
    }
    while (v222);
  }

  long long v665 = 0u;
  long long v664 = 0u;
  long long v663 = 0u;
  long long v662 = 0u;
  id v225 = v4[73];
  uint64_t v226 = [v225 countByEnumeratingWithState:&v662 objects:v890 count:16];
  if (v226)
  {
    uint64_t v227 = v226;
    uint64_t v228 = *(void *)v663;
    do
    {
      uint64_t v229 = 0;
      do
      {
        if (*(void *)v663 != v228) {
          objc_enumerationMutation(v225);
        }
        [(PowerlogMetricLog *)self addKCellularTdsServingCellRx1RssiHist:*(void *)(*((void *)&v662 + 1) + 8 * v229++)];
      }
      while (v227 != v229);
      uint64_t v227 = [v225 countByEnumeratingWithState:&v662 objects:v890 count:16];
    }
    while (v227);
  }

  long long v661 = 0u;
  long long v660 = 0u;
  long long v659 = 0u;
  long long v658 = 0u;
  id v230 = v4[70];
  uint64_t v231 = [v230 countByEnumeratingWithState:&v658 objects:v889 count:16];
  if (v231)
  {
    uint64_t v232 = v231;
    uint64_t v233 = *(void *)v659;
    do
    {
      uint64_t v234 = 0;
      do
      {
        if (*(void *)v659 != v233) {
          objc_enumerationMutation(v230);
        }
        [(PowerlogMetricLog *)self addKCellularTdsServingCellRx0RscpHist:*(void *)(*((void *)&v658 + 1) + 8 * v234++)];
      }
      while (v232 != v234);
      uint64_t v232 = [v230 countByEnumeratingWithState:&v658 objects:v889 count:16];
    }
    while (v232);
  }

  long long v657 = 0u;
  long long v656 = 0u;
  long long v655 = 0u;
  long long v654 = 0u;
  id v235 = v4[72];
  uint64_t v236 = [v235 countByEnumeratingWithState:&v654 objects:v888 count:16];
  if (v236)
  {
    uint64_t v237 = v236;
    uint64_t v238 = *(void *)v655;
    do
    {
      uint64_t v239 = 0;
      do
      {
        if (*(void *)v655 != v238) {
          objc_enumerationMutation(v235);
        }
        [(PowerlogMetricLog *)self addKCellularTdsServingCellRx1RscpHist:*(void *)(*((void *)&v654 + 1) + 8 * v239++)];
      }
      while (v237 != v239);
      uint64_t v237 = [v235 countByEnumeratingWithState:&v654 objects:v888 count:16];
    }
    while (v237);
  }

  long long v653 = 0u;
  long long v652 = 0u;
  long long v651 = 0u;
  long long v650 = 0u;
  id v240 = v4[74];
  uint64_t v241 = [v240 countByEnumeratingWithState:&v650 objects:v887 count:16];
  if (v241)
  {
    uint64_t v242 = v241;
    uint64_t v243 = *(void *)v651;
    do
    {
      uint64_t v244 = 0;
      do
      {
        if (*(void *)v651 != v243) {
          objc_enumerationMutation(v240);
        }
        [(PowerlogMetricLog *)self addKCellularTdsTxPowerHist:*(void *)(*((void *)&v650 + 1) + 8 * v244++)];
      }
      while (v242 != v244);
      uint64_t v242 = [v240 countByEnumeratingWithState:&v650 objects:v887 count:16];
    }
    while (v242);
  }

  long long v649 = 0u;
  long long v648 = 0u;
  long long v647 = 0u;
  long long v646 = 0u;
  id v245 = v4[66];
  uint64_t v246 = [v245 countByEnumeratingWithState:&v646 objects:v886 count:16];
  if (v246)
  {
    uint64_t v247 = v246;
    uint64_t v248 = *(void *)v647;
    do
    {
      uint64_t v249 = 0;
      do
      {
        if (*(void *)v647 != v248) {
          objc_enumerationMutation(v245);
        }
        [(PowerlogMetricLog *)self addKCellularTdsRabModeHist:*(void *)(*((void *)&v646 + 1) + 8 * v249++)];
      }
      while (v247 != v249);
      uint64_t v247 = [v245 countByEnumeratingWithState:&v646 objects:v886 count:16];
    }
    while (v247);
  }

  long long v645 = 0u;
  long long v644 = 0u;
  long long v643 = 0u;
  long long v642 = 0u;
  id v250 = v4[67];
  uint64_t v251 = [v250 countByEnumeratingWithState:&v642 objects:v885 count:16];
  if (v251)
  {
    uint64_t v252 = v251;
    uint64_t v253 = *(void *)v643;
    do
    {
      uint64_t v254 = 0;
      do
      {
        if (*(void *)v643 != v253) {
          objc_enumerationMutation(v250);
        }
        [(PowerlogMetricLog *)self addKCellularTdsRabTypeHist:*(void *)(*((void *)&v642 + 1) + 8 * v254++)];
      }
      while (v252 != v254);
      uint64_t v252 = [v250 countByEnumeratingWithState:&v642 objects:v885 count:16];
    }
    while (v252);
  }

  long long v641 = 0u;
  long long v640 = 0u;
  long long v639 = 0u;
  long long v638 = 0u;
  id v255 = v4[65];
  uint64_t v256 = [v255 countByEnumeratingWithState:&v638 objects:v884 count:16];
  if (v256)
  {
    uint64_t v257 = v256;
    uint64_t v258 = *(void *)v639;
    do
    {
      uint64_t v259 = 0;
      do
      {
        if (*(void *)v639 != v258) {
          objc_enumerationMutation(v255);
        }
        [(PowerlogMetricLog *)self addKCellularTdsL1State:*(void *)(*((void *)&v638 + 1) + 8 * v259++)];
      }
      while (v257 != v259);
      uint64_t v257 = [v255 countByEnumeratingWithState:&v638 objects:v884 count:16];
    }
    while (v257);
  }

  long long v637 = 0u;
  long long v636 = 0u;
  long long v635 = 0u;
  long long v634 = 0u;
  id v260 = v4[36];
  uint64_t v261 = [v260 countByEnumeratingWithState:&v634 objects:v883 count:16];
  if (v261)
  {
    uint64_t v262 = v261;
    uint64_t v263 = *(void *)v635;
    do
    {
      uint64_t v264 = 0;
      do
      {
        if (*(void *)v635 != v263) {
          objc_enumerationMutation(v260);
        }
        [(PowerlogMetricLog *)self addKCellularLteFwDuplexMode:*(void *)(*((void *)&v634 + 1) + 8 * v264++)];
      }
      while (v262 != v264);
      uint64_t v262 = [v260 countByEnumeratingWithState:&v634 objects:v883 count:16];
    }
    while (v262);
  }

  long long v633 = 0u;
  long long v632 = 0u;
  long long v631 = 0u;
  long long v630 = 0u;
  id v265 = v4[45];
  uint64_t v266 = [v265 countByEnumeratingWithState:&v630 objects:v882 count:16];
  if (v266)
  {
    uint64_t v267 = v266;
    uint64_t v268 = *(void *)v631;
    do
    {
      uint64_t v269 = 0;
      do
      {
        if (*(void *)v631 != v268) {
          objc_enumerationMutation(v265);
        }
        [(PowerlogMetricLog *)self addKCellularLteServingCellRsrpHist:*(void *)(*((void *)&v630 + 1) + 8 * v269++)];
      }
      while (v267 != v269);
      uint64_t v267 = [v265 countByEnumeratingWithState:&v630 objects:v882 count:16];
    }
    while (v267);
  }

  long long v629 = 0u;
  long long v628 = 0u;
  long long v627 = 0u;
  long long v626 = 0u;
  id v270 = v4[46];
  uint64_t v271 = [v270 countByEnumeratingWithState:&v626 objects:v881 count:16];
  if (v271)
  {
    uint64_t v272 = v271;
    uint64_t v273 = *(void *)v627;
    do
    {
      uint64_t v274 = 0;
      do
      {
        if (*(void *)v627 != v273) {
          objc_enumerationMutation(v270);
        }
        [(PowerlogMetricLog *)self addKCellularLteServingCellSinrHist:*(void *)(*((void *)&v626 + 1) + 8 * v274++)];
      }
      while (v272 != v274);
      uint64_t v272 = [v270 countByEnumeratingWithState:&v626 objects:v881 count:16];
    }
    while (v272);
  }

  long long v625 = 0u;
  long long v624 = 0u;
  long long v623 = 0u;
  long long v622 = 0u;
  id v275 = v4[47];
  uint64_t v276 = [v275 countByEnumeratingWithState:&v622 objects:v880 count:16];
  if (v276)
  {
    uint64_t v277 = v276;
    uint64_t v278 = *(void *)v623;
    do
    {
      uint64_t v279 = 0;
      do
      {
        if (*(void *)v623 != v278) {
          objc_enumerationMutation(v275);
        }
        [(PowerlogMetricLog *)self addKCellularLteSleepStateHist:*(void *)(*((void *)&v622 + 1) + 8 * v279++)];
      }
      while (v277 != v279);
      uint64_t v277 = [v275 countByEnumeratingWithState:&v622 objects:v880 count:16];
    }
    while (v277);
  }

  long long v621 = 0u;
  long long v620 = 0u;
  long long v619 = 0u;
  long long v618 = 0u;
  id v280 = v4[50];
  uint64_t v281 = [v280 countByEnumeratingWithState:&v618 objects:v879 count:16];
  if (v281)
  {
    uint64_t v282 = v281;
    uint64_t v283 = *(void *)v619;
    do
    {
      uint64_t v284 = 0;
      do
      {
        if (*(void *)v619 != v283) {
          objc_enumerationMutation(v280);
        }
        [(PowerlogMetricLog *)self addKCellularLteTxPowerHist:*(void *)(*((void *)&v618 + 1) + 8 * v284++)];
      }
      while (v282 != v284);
      uint64_t v282 = [v280 countByEnumeratingWithState:&v618 objects:v879 count:16];
    }
    while (v282);
  }

  long long v617 = 0u;
  long long v616 = 0u;
  long long v615 = 0u;
  long long v614 = 0u;
  id v285 = v4[35];
  uint64_t v286 = [v285 countByEnumeratingWithState:&v614 objects:v878 count:16];
  if (v286)
  {
    uint64_t v287 = v286;
    uint64_t v288 = *(void *)v615;
    do
    {
      uint64_t v289 = 0;
      do
      {
        if (*(void *)v615 != v288) {
          objc_enumerationMutation(v285);
        }
        [(PowerlogMetricLog *)self addKCellularLteDlSccStateHist:*(void *)(*((void *)&v614 + 1) + 8 * v289++)];
      }
      while (v287 != v289);
      uint64_t v287 = [v285 countByEnumeratingWithState:&v614 objects:v878 count:16];
    }
    while (v287);
  }

  long long v613 = 0u;
  long long v612 = 0u;
  long long v611 = 0u;
  long long v610 = 0u;
  id v290 = v4[51];
  uint64_t v291 = [v290 countByEnumeratingWithState:&v610 objects:v877 count:16];
  if (v291)
  {
    uint64_t v292 = v291;
    uint64_t v293 = *(void *)v611;
    do
    {
      uint64_t v294 = 0;
      do
      {
        if (*(void *)v611 != v293) {
          objc_enumerationMutation(v290);
        }
        [(PowerlogMetricLog *)self addKCellularLteUlSccStateHist:*(void *)(*((void *)&v610 + 1) + 8 * v294++)];
      }
      while (v292 != v294);
      uint64_t v292 = [v290 countByEnumeratingWithState:&v610 objects:v877 count:16];
    }
    while (v292);
  }

  long long v609 = 0u;
  long long v608 = 0u;
  long long v607 = 0u;
  long long v606 = 0u;
  id v295 = v4[30];
  uint64_t v296 = [v295 countByEnumeratingWithState:&v606 objects:v876 count:16];
  if (v296)
  {
    uint64_t v297 = v296;
    uint64_t v298 = *(void *)v607;
    do
    {
      uint64_t v299 = 0;
      do
      {
        if (*(void *)v607 != v298) {
          objc_enumerationMutation(v295);
        }
        [(PowerlogMetricLog *)self addKCellularLteAdvancedRxStateHist:*(void *)(*((void *)&v606 + 1) + 8 * v299++)];
      }
      while (v297 != v299);
      uint64_t v297 = [v295 countByEnumeratingWithState:&v606 objects:v876 count:16];
    }
    while (v297);
  }

  long long v605 = 0u;
  long long v604 = 0u;
  long long v603 = 0u;
  long long v602 = 0u;
  id v300 = v4[32];
  uint64_t v301 = [v300 countByEnumeratingWithState:&v602 objects:v875 count:16];
  if (v301)
  {
    uint64_t v302 = v301;
    uint64_t v303 = *(void *)v603;
    do
    {
      uint64_t v304 = 0;
      do
      {
        if (*(void *)v603 != v303) {
          objc_enumerationMutation(v300);
        }
        [(PowerlogMetricLog *)self addKCellularLteComponentCarrierInfo:*(void *)(*((void *)&v602 + 1) + 8 * v304++)];
      }
      while (v302 != v304);
      uint64_t v302 = [v300 countByEnumeratingWithState:&v602 objects:v875 count:16];
    }
    while (v302);
  }

  long long v601 = 0u;
  long long v600 = 0u;
  long long v599 = 0u;
  long long v598 = 0u;
  id v305 = v4[44];
  uint64_t v306 = [v305 countByEnumeratingWithState:&v598 objects:v874 count:16];
  if (v306)
  {
    uint64_t v307 = v306;
    uint64_t v308 = *(void *)v599;
    do
    {
      uint64_t v309 = 0;
      do
      {
        if (*(void *)v599 != v308) {
          objc_enumerationMutation(v305);
        }
        [(PowerlogMetricLog *)self addKCellularLteRxTxStateHist:*(void *)(*((void *)&v598 + 1) + 8 * v309++)];
      }
      while (v307 != v309);
      uint64_t v307 = [v305 countByEnumeratingWithState:&v598 objects:v874 count:16];
    }
    while (v307);
  }

  long long v597 = 0u;
  long long v596 = 0u;
  long long v595 = 0u;
  long long v594 = 0u;
  id v310 = v4[49];
  uint64_t v311 = [v310 countByEnumeratingWithState:&v594 objects:v873 count:16];
  if (v311)
  {
    uint64_t v312 = v311;
    uint64_t v313 = *(void *)v595;
    do
    {
      uint64_t v314 = 0;
      do
      {
        if (*(void *)v595 != v313) {
          objc_enumerationMutation(v310);
        }
        [(PowerlogMetricLog *)self addKCellularLteTotalDlTbsHist:*(void *)(*((void *)&v594 + 1) + 8 * v314++)];
      }
      while (v312 != v314);
      uint64_t v312 = [v310 countByEnumeratingWithState:&v594 objects:v873 count:16];
    }
    while (v312);
  }

  long long v593 = 0u;
  long long v592 = 0u;
  long long v591 = 0u;
  long long v590 = 0u;
  id v315 = v4[33];
  uint64_t v316 = [v315 countByEnumeratingWithState:&v590 objects:v872 count:16];
  if (v316)
  {
    uint64_t v317 = v316;
    uint64_t v318 = *(void *)v591;
    do
    {
      uint64_t v319 = 0;
      do
      {
        if (*(void *)v591 != v318) {
          objc_enumerationMutation(v315);
        }
        [(PowerlogMetricLog *)self addKCellularLteDataInactivityBeforeIdle:*(void *)(*((void *)&v590 + 1) + 8 * v319++)];
      }
      while (v317 != v319);
      uint64_t v317 = [v315 countByEnumeratingWithState:&v590 objects:v872 count:16];
    }
    while (v317);
  }

  long long v589 = 0u;
  long long v588 = 0u;
  long long v587 = 0u;
  long long v586 = 0u;
  id v320 = v4[37];
  uint64_t v321 = [v320 countByEnumeratingWithState:&v586 objects:v871 count:16];
  if (v321)
  {
    uint64_t v322 = v321;
    uint64_t v323 = *(void *)v587;
    do
    {
      uint64_t v324 = 0;
      do
      {
        if (*(void *)v587 != v323) {
          objc_enumerationMutation(v320);
        }
        [(PowerlogMetricLog *)self addKCellularLteIdleToConnectedUserData:*(void *)(*((void *)&v586 + 1) + 8 * v324++)];
      }
      while (v322 != v324);
      uint64_t v322 = [v320 countByEnumeratingWithState:&v586 objects:v871 count:16];
    }
    while (v322);
  }

  long long v585 = 0u;
  long long v584 = 0u;
  long long v583 = 0u;
  long long v582 = 0u;
  id v325 = v4[34];
  uint64_t v326 = [v325 countByEnumeratingWithState:&v582 objects:v870 count:16];
  if (v326)
  {
    uint64_t v327 = v326;
    uint64_t v328 = *(void *)v583;
    do
    {
      uint64_t v329 = 0;
      do
      {
        if (*(void *)v583 != v328) {
          objc_enumerationMutation(v325);
        }
        [(PowerlogMetricLog *)self addKCellularLteDlSccStateHistV3:*(void *)(*((void *)&v582 + 1) + 8 * v329++)];
      }
      while (v327 != v329);
      uint64_t v327 = [v325 countByEnumeratingWithState:&v582 objects:v870 count:16];
    }
    while (v327);
  }

  long long v581 = 0u;
  long long v580 = 0u;
  long long v579 = 0u;
  long long v578 = 0u;
  id v330 = v4[43];
  uint64_t v331 = [v330 countByEnumeratingWithState:&v578 objects:v869 count:16];
  if (v331)
  {
    uint64_t v332 = v331;
    uint64_t v333 = *(void *)v579;
    do
    {
      uint64_t v334 = 0;
      do
      {
        if (*(void *)v579 != v333) {
          objc_enumerationMutation(v330);
        }
        [(PowerlogMetricLog *)self addKCellularLteRxDiversityHist:*(void *)(*((void *)&v578 + 1) + 8 * v334++)];
      }
      while (v332 != v334);
      uint64_t v332 = [v330 countByEnumeratingWithState:&v578 objects:v869 count:16];
    }
    while (v332);
  }

  long long v577 = 0u;
  long long v576 = 0u;
  long long v575 = 0u;
  long long v574 = 0u;
  id v335 = v4[39];
  uint64_t v336 = [v335 countByEnumeratingWithState:&v574 objects:v868 count:16];
  if (v336)
  {
    uint64_t v337 = v336;
    uint64_t v338 = *(void *)v575;
    do
    {
      uint64_t v339 = 0;
      do
      {
        if (*(void *)v575 != v338) {
          objc_enumerationMutation(v335);
        }
        [(PowerlogMetricLog *)self addKCellularLtePdcchStateHist:*(void *)(*((void *)&v574 + 1) + 8 * v339++)];
      }
      while (v337 != v339);
      uint64_t v337 = [v335 countByEnumeratingWithState:&v574 objects:v868 count:16];
    }
    while (v337);
  }

  long long v573 = 0u;
  long long v572 = 0u;
  long long v571 = 0u;
  long long v570 = 0u;
  id v340 = v4[61];
  uint64_t v341 = [v340 countByEnumeratingWithState:&v570 objects:v867 count:16];
  if (v341)
  {
    uint64_t v342 = v341;
    uint64_t v343 = *(void *)v571;
    do
    {
      uint64_t v344 = 0;
      do
      {
        if (*(void *)v571 != v343) {
          objc_enumerationMutation(v340);
        }
        [(PowerlogMetricLog *)self addKCellularProtocolStackStateHist:*(void *)(*((void *)&v570 + 1) + 8 * v344++)];
      }
      while (v342 != v344);
      uint64_t v342 = [v340 countByEnumeratingWithState:&v570 objects:v867 count:16];
    }
    while (v342);
  }

  long long v569 = 0u;
  long long v568 = 0u;
  long long v567 = 0u;
  long long v566 = 0u;
  id v345 = v4[18];
  uint64_t v346 = [v345 countByEnumeratingWithState:&v566 objects:v866 count:16];
  if (v346)
  {
    uint64_t v347 = v346;
    uint64_t v348 = *(void *)v567;
    do
    {
      uint64_t v349 = 0;
      do
      {
        if (*(void *)v567 != v348) {
          objc_enumerationMutation(v345);
        }
        [(PowerlogMetricLog *)self addKCellularCellPlmnSearchCount:*(void *)(*((void *)&v566 + 1) + 8 * v349++)];
      }
      while (v347 != v349);
      uint64_t v347 = [v345 countByEnumeratingWithState:&v566 objects:v866 count:16];
    }
    while (v347);
  }

  long long v565 = 0u;
  long long v564 = 0u;
  long long v563 = 0u;
  long long v562 = 0u;
  id v350 = v4[19];
  uint64_t v351 = [v350 countByEnumeratingWithState:&v562 objects:v865 count:16];
  if (v351)
  {
    uint64_t v352 = v351;
    uint64_t v353 = *(void *)v563;
    do
    {
      uint64_t v354 = 0;
      do
      {
        if (*(void *)v563 != v353) {
          objc_enumerationMutation(v350);
        }
        [(PowerlogMetricLog *)self addKCellularCellPlmnSearchHist:*(void *)(*((void *)&v562 + 1) + 8 * v354++)];
      }
      while (v352 != v354);
      uint64_t v352 = [v350 countByEnumeratingWithState:&v562 objects:v865 count:16];
    }
    while (v352);
  }

  long long v561 = 0u;
  long long v560 = 0u;
  long long v559 = 0u;
  long long v558 = 0u;
  id v355 = v4[59];
  uint64_t v356 = [v355 countByEnumeratingWithState:&v558 objects:v864 count:16];
  if (v356)
  {
    uint64_t v357 = v356;
    uint64_t v358 = *(void *)v559;
    do
    {
      uint64_t v359 = 0;
      do
      {
        if (*(void *)v559 != v358) {
          objc_enumerationMutation(v355);
        }
        [(PowerlogMetricLog *)self addKCellularProtocolStackPowerState:*(void *)(*((void *)&v558 + 1) + 8 * v359++)];
      }
      while (v357 != v359);
      uint64_t v357 = [v355 countByEnumeratingWithState:&v558 objects:v864 count:16];
    }
    while (v357);
  }

  long long v557 = 0u;
  long long v556 = 0u;
  long long v555 = 0u;
  long long v554 = 0u;
  id v360 = v4[21];
  uint64_t v361 = [v360 countByEnumeratingWithState:&v554 objects:v863 count:16];
  if (v361)
  {
    uint64_t v362 = v361;
    uint64_t v363 = *(void *)v555;
    do
    {
      uint64_t v364 = 0;
      do
      {
        if (*(void *)v555 != v363) {
          objc_enumerationMutation(v360);
        }
        [(PowerlogMetricLog *)self addKCellularDownlinkIpPacketFilterStatus:*(void *)(*((void *)&v554 + 1) + 8 * v364++)];
      }
      while (v362 != v364);
      uint64_t v362 = [v360 countByEnumeratingWithState:&v554 objects:v863 count:16];
    }
    while (v362);
  }

  long long v553 = 0u;
  long long v552 = 0u;
  long long v551 = 0u;
  long long v550 = 0u;
  id v365 = v4[20];
  uint64_t v366 = [v365 countByEnumeratingWithState:&v550 objects:v862 count:16];
  if (v366)
  {
    uint64_t v367 = v366;
    uint64_t v368 = *(void *)v551;
    do
    {
      uint64_t v369 = 0;
      do
      {
        if (*(void *)v551 != v368) {
          objc_enumerationMutation(v365);
        }
        [(PowerlogMetricLog *)self addKCellularDownlinkIpPacketDiscarded:*(void *)(*((void *)&v550 + 1) + 8 * v369++)];
      }
      while (v367 != v369);
      uint64_t v367 = [v365 countByEnumeratingWithState:&v550 objects:v862 count:16];
    }
    while (v367);
  }

  long long v549 = 0u;
  long long v548 = 0u;
  long long v547 = 0u;
  long long v546 = 0u;
  id v370 = v4[64];
  uint64_t v371 = [v370 countByEnumeratingWithState:&v546 objects:v861 count:16];
  if (v371)
  {
    uint64_t v372 = v371;
    uint64_t v373 = *(void *)v547;
    do
    {
      uint64_t v374 = 0;
      do
      {
        if (*(void *)v547 != v373) {
          objc_enumerationMutation(v370);
        }
        [(PowerlogMetricLog *)self addKCellularServingCellRfBandHist:*(void *)(*((void *)&v546 + 1) + 8 * v374++)];
      }
      while (v372 != v374);
      uint64_t v372 = [v370 countByEnumeratingWithState:&v546 objects:v861 count:16];
    }
    while (v372);
  }

  long long v545 = 0u;
  long long v544 = 0u;
  long long v543 = 0u;
  long long v542 = 0u;
  id v375 = v4[60];
  uint64_t v376 = [v375 countByEnumeratingWithState:&v542 objects:v860 count:16];
  if (v376)
  {
    uint64_t v377 = v376;
    uint64_t v378 = *(void *)v543;
    do
    {
      uint64_t v379 = 0;
      do
      {
        if (*(void *)v543 != v378) {
          objc_enumerationMutation(v375);
        }
        [(PowerlogMetricLog *)self addKCellularProtocolStackStateHist2:*(void *)(*((void *)&v542 + 1) + 8 * v379++)];
      }
      while (v377 != v379);
      uint64_t v377 = [v375 countByEnumeratingWithState:&v542 objects:v860 count:16];
    }
    while (v377);
  }

  long long v541 = 0u;
  long long v540 = 0u;
  long long v539 = 0u;
  long long v538 = 0u;
  id v380 = v4[62];
  uint64_t v381 = [v380 countByEnumeratingWithState:&v538 objects:v859 count:16];
  if (v381)
  {
    uint64_t v382 = v381;
    uint64_t v383 = *(void *)v539;
    do
    {
      uint64_t v384 = 0;
      do
      {
        if (*(void *)v539 != v383) {
          objc_enumerationMutation(v380);
        }
        [(PowerlogMetricLog *)self addKCellularProtocolStackState:*(void *)(*((void *)&v538 + 1) + 8 * v384++)];
      }
      while (v382 != v384);
      uint64_t v382 = [v380 countByEnumeratingWithState:&v538 objects:v859 count:16];
    }
    while (v382);
  }

  long long v537 = 0u;
  long long v536 = 0u;
  long long v535 = 0u;
  long long v534 = 0u;
  id v385 = v4[4];
  uint64_t v386 = [v385 countByEnumeratingWithState:&v534 objects:v858 count:16];
  if (v386)
  {
    uint64_t v387 = v386;
    uint64_t v388 = *(void *)v535;
    do
    {
      uint64_t v389 = 0;
      do
      {
        if (*(void *)v535 != v388) {
          objc_enumerationMutation(v385);
        }
        [(PowerlogMetricLog *)self addKCellularCdma1XRxDiversityHist:*(void *)(*((void *)&v534 + 1) + 8 * v389++)];
      }
      while (v387 != v389);
      uint64_t v387 = [v385 countByEnumeratingWithState:&v534 objects:v858 count:16];
    }
    while (v387);
  }

  long long v532 = 0u;
  long long v533 = 0u;
  long long v530 = 0u;
  long long v531 = 0u;
  id v390 = v4[6];
  uint64_t v391 = [v390 countByEnumeratingWithState:&v530 objects:v857 count:16];
  if (v391)
  {
    uint64_t v392 = v391;
    uint64_t v393 = *(void *)v531;
    do
    {
      uint64_t v394 = 0;
      do
      {
        if (*(void *)v531 != v393) {
          objc_enumerationMutation(v390);
        }
        [(PowerlogMetricLog *)self addKCellularCdma1XServingCellRx0RssiHist:*(void *)(*((void *)&v530 + 1) + 8 * v394++)];
      }
      while (v392 != v394);
      uint64_t v392 = [v390 countByEnumeratingWithState:&v530 objects:v857 count:16];
    }
    while (v392);
  }

  long long v528 = 0u;
  long long v529 = 0u;
  long long v526 = 0u;
  long long v527 = 0u;
  id v395 = v4[8];
  uint64_t v396 = [v395 countByEnumeratingWithState:&v526 objects:v856 count:16];
  if (v396)
  {
    uint64_t v397 = v396;
    uint64_t v398 = *(void *)v527;
    do
    {
      uint64_t v399 = 0;
      do
      {
        if (*(void *)v527 != v398) {
          objc_enumerationMutation(v395);
        }
        [(PowerlogMetricLog *)self addKCellularCdma1XServingCellRx1RssiHist:*(void *)(*((void *)&v526 + 1) + 8 * v399++)];
      }
      while (v397 != v399);
      uint64_t v397 = [v395 countByEnumeratingWithState:&v526 objects:v856 count:16];
    }
    while (v397);
  }

  long long v524 = 0u;
  long long v525 = 0u;
  long long v522 = 0u;
  long long v523 = 0u;
  id v400 = v4[5];
  uint64_t v401 = [v400 countByEnumeratingWithState:&v522 objects:v855 count:16];
  if (v401)
  {
    uint64_t v402 = v401;
    uint64_t v403 = *(void *)v523;
    do
    {
      uint64_t v404 = 0;
      do
      {
        if (*(void *)v523 != v403) {
          objc_enumerationMutation(v400);
        }
        [(PowerlogMetricLog *)self addKCellularCdma1XServingCellRx0EcIoHist:*(void *)(*((void *)&v522 + 1) + 8 * v404++)];
      }
      while (v402 != v404);
      uint64_t v402 = [v400 countByEnumeratingWithState:&v522 objects:v855 count:16];
    }
    while (v402);
  }

  long long v520 = 0u;
  long long v521 = 0u;
  long long v518 = 0u;
  long long v519 = 0u;
  id v405 = v4[7];
  uint64_t v406 = [v405 countByEnumeratingWithState:&v518 objects:v854 count:16];
  if (v406)
  {
    uint64_t v407 = v406;
    uint64_t v408 = *(void *)v519;
    do
    {
      uint64_t v409 = 0;
      do
      {
        if (*(void *)v519 != v408) {
          objc_enumerationMutation(v405);
        }
        [(PowerlogMetricLog *)self addKCellularCdma1XServingCellRx1EcIoHist:*(void *)(*((void *)&v518 + 1) + 8 * v409++)];
      }
      while (v407 != v409);
      uint64_t v407 = [v405 countByEnumeratingWithState:&v518 objects:v854 count:16];
    }
    while (v407);
  }

  long long v516 = 0u;
  long long v517 = 0u;
  long long v514 = 0u;
  long long v515 = 0u;
  id v410 = v4[9];
  uint64_t v411 = [v410 countByEnumeratingWithState:&v514 objects:v853 count:16];
  if (v411)
  {
    uint64_t v412 = v411;
    uint64_t v413 = *(void *)v515;
    do
    {
      uint64_t v414 = 0;
      do
      {
        if (*(void *)v515 != v413) {
          objc_enumerationMutation(v410);
        }
        [(PowerlogMetricLog *)self addKCellularCdma1XTxPowerHist:*(void *)(*((void *)&v514 + 1) + 8 * v414++)];
      }
      while (v412 != v414);
      uint64_t v412 = [v410 countByEnumeratingWithState:&v514 objects:v853 count:16];
    }
    while (v412);
  }

  long long v512 = 0u;
  long long v513 = 0u;
  long long v510 = 0u;
  long long v511 = 0u;
  id v415 = v4[2];
  uint64_t v416 = [v415 countByEnumeratingWithState:&v510 objects:v852 count:16];
  if (v416)
  {
    uint64_t v417 = v416;
    uint64_t v418 = *(void *)v511;
    do
    {
      uint64_t v419 = 0;
      do
      {
        if (*(void *)v511 != v418) {
          objc_enumerationMutation(v415);
        }
        [(PowerlogMetricLog *)self addKCellularCdma1XProtocolStackStateHist:*(void *)(*((void *)&v510 + 1) + 8 * v419++)];
      }
      while (v417 != v419);
      uint64_t v417 = [v415 countByEnumeratingWithState:&v510 objects:v852 count:16];
    }
    while (v417);
  }

  long long v508 = 0u;
  long long v509 = 0u;
  long long v506 = 0u;
  long long v507 = 0u;
  id v420 = v4[1];
  uint64_t v421 = [v420 countByEnumeratingWithState:&v506 objects:v851 count:16];
  if (v421)
  {
    uint64_t v422 = v421;
    uint64_t v423 = *(void *)v507;
    do
    {
      uint64_t v424 = 0;
      do
      {
        if (*(void *)v507 != v423) {
          objc_enumerationMutation(v420);
        }
        [(PowerlogMetricLog *)self addKCellularCdma1XConnectionHist:*(void *)(*((void *)&v506 + 1) + 8 * v424++)];
      }
      while (v422 != v424);
      uint64_t v422 = [v420 countByEnumeratingWithState:&v506 objects:v851 count:16];
    }
    while (v422);
  }

  long long v504 = 0u;
  long long v505 = 0u;
  long long v502 = 0u;
  long long v503 = 0u;
  id v425 = v4[3];
  uint64_t v426 = [v425 countByEnumeratingWithState:&v502 objects:v850 count:16];
  if (v426)
  {
    uint64_t v427 = v426;
    uint64_t v428 = *(void *)v503;
    do
    {
      uint64_t v429 = 0;
      do
      {
        if (*(void *)v503 != v428) {
          objc_enumerationMutation(v425);
        }
        [(PowerlogMetricLog *)self addKCellularCdma1XRrState:*(void *)(*((void *)&v502 + 1) + 8 * v429++)];
      }
      while (v427 != v429);
      uint64_t v427 = [v425 countByEnumeratingWithState:&v502 objects:v850 count:16];
    }
    while (v427);
  }

  long long v500 = 0u;
  long long v501 = 0u;
  long long v498 = 0u;
  long long v499 = 0u;
  id v430 = v4[12];
  uint64_t v431 = [v430 countByEnumeratingWithState:&v498 objects:v849 count:16];
  if (v431)
  {
    uint64_t v432 = v431;
    uint64_t v433 = *(void *)v499;
    do
    {
      uint64_t v434 = 0;
      do
      {
        if (*(void *)v499 != v433) {
          objc_enumerationMutation(v430);
        }
        [(PowerlogMetricLog *)self addKCellularCdmaEvdoRxDiversityHist:*(void *)(*((void *)&v498 + 1) + 8 * v434++)];
      }
      while (v432 != v434);
      uint64_t v432 = [v430 countByEnumeratingWithState:&v498 objects:v849 count:16];
    }
    while (v432);
  }

  long long v496 = 0u;
  long long v497 = 0u;
  long long v494 = 0u;
  long long v495 = 0u;
  id v435 = v4[14];
  uint64_t v436 = [v435 countByEnumeratingWithState:&v494 objects:v848 count:16];
  if (v436)
  {
    uint64_t v437 = v436;
    uint64_t v438 = *(void *)v495;
    do
    {
      uint64_t v439 = 0;
      do
      {
        if (*(void *)v495 != v438) {
          objc_enumerationMutation(v435);
        }
        [(PowerlogMetricLog *)self addKCellularCdmaEvdoServingCellRx0RssiHist:*(void *)(*((void *)&v494 + 1) + 8 * v439++)];
      }
      while (v437 != v439);
      uint64_t v437 = [v435 countByEnumeratingWithState:&v494 objects:v848 count:16];
    }
    while (v437);
  }

  long long v492 = 0u;
  long long v493 = 0u;
  long long v490 = 0u;
  long long v491 = 0u;
  id v440 = v4[16];
  uint64_t v441 = [v440 countByEnumeratingWithState:&v490 objects:v847 count:16];
  if (v441)
  {
    uint64_t v442 = v441;
    uint64_t v443 = *(void *)v491;
    do
    {
      uint64_t v444 = 0;
      do
      {
        if (*(void *)v491 != v443) {
          objc_enumerationMutation(v440);
        }
        [(PowerlogMetricLog *)self addKCellularCdmaEvdoServingCellRx1RssiHist:*(void *)(*((void *)&v490 + 1) + 8 * v444++)];
      }
      while (v442 != v444);
      uint64_t v442 = [v440 countByEnumeratingWithState:&v490 objects:v847 count:16];
    }
    while (v442);
  }

  long long v488 = 0u;
  long long v489 = 0u;
  long long v486 = 0u;
  long long v487 = 0u;
  id v445 = v4[13];
  uint64_t v446 = [v445 countByEnumeratingWithState:&v486 objects:v846 count:16];
  if (v446)
  {
    uint64_t v447 = v446;
    uint64_t v448 = *(void *)v487;
    do
    {
      uint64_t v449 = 0;
      do
      {
        if (*(void *)v487 != v448) {
          objc_enumerationMutation(v445);
        }
        [(PowerlogMetricLog *)self addKCellularCdmaEvdoServingCellRx0EcIoHist:*(void *)(*((void *)&v486 + 1) + 8 * v449++)];
      }
      while (v447 != v449);
      uint64_t v447 = [v445 countByEnumeratingWithState:&v486 objects:v846 count:16];
    }
    while (v447);
  }

  long long v484 = 0u;
  long long v485 = 0u;
  long long v482 = 0u;
  long long v483 = 0u;
  id v450 = v4[15];
  uint64_t v451 = [v450 countByEnumeratingWithState:&v482 objects:v845 count:16];
  if (v451)
  {
    uint64_t v452 = v451;
    uint64_t v453 = *(void *)v483;
    do
    {
      uint64_t v454 = 0;
      do
      {
        if (*(void *)v483 != v453) {
          objc_enumerationMutation(v450);
        }
        [(PowerlogMetricLog *)self addKCellularCdmaEvdoServingCellRx1EcIoHist:*(void *)(*((void *)&v482 + 1) + 8 * v454++)];
      }
      while (v452 != v454);
      uint64_t v452 = [v450 countByEnumeratingWithState:&v482 objects:v845 count:16];
    }
    while (v452);
  }

  long long v480 = 0u;
  long long v481 = 0u;
  long long v478 = 0u;
  long long v479 = 0u;
  id v455 = v4[17];
  uint64_t v456 = [v455 countByEnumeratingWithState:&v478 objects:v844 count:16];
  if (v456)
  {
    uint64_t v457 = v456;
    uint64_t v458 = *(void *)v479;
    do
    {
      uint64_t v459 = 0;
      do
      {
        if (*(void *)v479 != v458) {
          objc_enumerationMutation(v455);
        }
        [(PowerlogMetricLog *)self addKCellularCdmaEvdoTxPowerHist:*(void *)(*((void *)&v478 + 1) + 8 * v459++)];
      }
      while (v457 != v459);
      uint64_t v457 = [v455 countByEnumeratingWithState:&v478 objects:v844 count:16];
    }
    while (v457);
  }

  long long v476 = 0u;
  long long v477 = 0u;
  long long v474 = 0u;
  long long v475 = 0u;
  id v460 = v4[10];
  uint64_t v461 = [v460 countByEnumeratingWithState:&v474 objects:v843 count:16];
  if (v461)
  {
    uint64_t v462 = v461;
    uint64_t v463 = *(void *)v475;
    do
    {
      uint64_t v464 = 0;
      do
      {
        if (*(void *)v475 != v463) {
          objc_enumerationMutation(v460);
        }
        [(PowerlogMetricLog *)self addKCellularCdmaEvdoProtocolStackStateHist:*(void *)(*((void *)&v474 + 1) + 8 * v464++)];
      }
      while (v462 != v464);
      uint64_t v462 = [v460 countByEnumeratingWithState:&v474 objects:v843 count:16];
    }
    while (v462);
  }

  long long v472 = 0u;
  long long v473 = 0u;
  long long v470 = 0u;
  long long v471 = 0u;
  id v465 = v4[11];
  uint64_t v466 = [v465 countByEnumeratingWithState:&v470 objects:v842 count:16];
  if (v466)
  {
    uint64_t v467 = v466;
    uint64_t v468 = *(void *)v471;
    do
    {
      uint64_t v469 = 0;
      do
      {
        if (*(void *)v471 != v468) {
          objc_enumerationMutation(v465);
        }
        -[PowerlogMetricLog addKCellularCdmaEvdoRrState:](self, "addKCellularCdmaEvdoRrState:", *(void *)(*((void *)&v470 + 1) + 8 * v469++), (void)v470);
      }
      while (v467 != v469);
      uint64_t v467 = [v465 countByEnumeratingWithState:&v470 objects:v842 count:16];
    }
    while (v467);
  }
}

- (NSMutableArray)kCellularPerClientProfileTriggerCounts
{
  return self->_kCellularPerClientProfileTriggerCounts;
}

- (void)setKCellularPerClientProfileTriggerCounts:(id)a3
{
}

- (NSMutableArray)kCellularProtocolStackCpuStats
{
  return self->_kCellularProtocolStackCpuStats;
}

- (void)setKCellularProtocolStackCpuStats:(id)a3
{
}

- (NSMutableArray)kCellularPeripheralStats
{
  return self->_kCellularPeripheralStats;
}

- (void)setKCellularPeripheralStats:(id)a3
{
}

- (NSMutableArray)kCellularDvfsStats
{
  return self->_kCellularDvfsStats;
}

- (void)setKCellularDvfsStats:(id)a3
{
}

- (NSMutableArray)kCellularLteWcdmaGsmHwStats
{
  return self->_kCellularLteWcdmaGsmHwStats;
}

- (void)setKCellularLteWcdmaGsmHwStats:(id)a3
{
}

- (NSMutableArray)kCellularLteTdsGsmHwStats
{
  return self->_kCellularLteTdsGsmHwStats;
}

- (void)setKCellularLteTdsGsmHwStats:(id)a3
{
}

- (NSMutableArray)kCellularPmuAverageCurrents
{
  return self->_kCellularPmuAverageCurrents;
}

- (void)setKCellularPmuAverageCurrents:(id)a3
{
}

- (NSMutableArray)kCellularFwCoreStats
{
  return self->_kCellularFwCoreStats;
}

- (void)setKCellularFwCoreStats:(id)a3
{
}

- (NSMutableArray)kCellularLteWcdmaTdsHwStats
{
  return self->_kCellularLteWcdmaTdsHwStats;
}

- (void)setKCellularLteWcdmaTdsHwStats:(id)a3
{
}

- (NSMutableArray)kCellularPmicHwStats
{
  return self->_kCellularPmicHwStats;
}

- (void)setKCellularPmicHwStats:(id)a3
{
}

- (NSMutableArray)kCellularGsmServingCellRssiHists
{
  return self->_kCellularGsmServingCellRssiHists;
}

- (void)setKCellularGsmServingCellRssiHists:(id)a3
{
}

- (NSMutableArray)kCellularGsmServingCellSnrHists
{
  return self->_kCellularGsmServingCellSnrHists;
}

- (void)setKCellularGsmServingCellSnrHists:(id)a3
{
}

- (NSMutableArray)kCellularGsmTxPowerHists
{
  return self->_kCellularGsmTxPowerHists;
}

- (void)setKCellularGsmTxPowerHists:(id)a3
{
}

- (NSMutableArray)kCellularGsmConnectedModeHists
{
  return self->_kCellularGsmConnectedModeHists;
}

- (void)setKCellularGsmConnectedModeHists:(id)a3
{
}

- (NSMutableArray)kCellularGsmL1States
{
  return self->_kCellularGsmL1States;
}

- (void)setKCellularGsmL1States:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaCpcStats
{
  return self->_kCellularWcdmaCpcStats;
}

- (void)setKCellularWcdmaCpcStats:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaRxDiversityHists
{
  return self->_kCellularWcdmaRxDiversityHists;
}

- (void)setKCellularWcdmaRxDiversityHists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaServingCellRx0RssiHists
{
  return self->_kCellularWcdmaServingCellRx0RssiHists;
}

- (void)setKCellularWcdmaServingCellRx0RssiHists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaServingCellRx1RssiHists
{
  return self->_kCellularWcdmaServingCellRx1RssiHists;
}

- (void)setKCellularWcdmaServingCellRx1RssiHists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaServingCellRx0EcNoHists
{
  return self->_kCellularWcdmaServingCellRx0EcNoHists;
}

- (void)setKCellularWcdmaServingCellRx0EcNoHists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaServingCellRx1EcNoHists
{
  return self->_kCellularWcdmaServingCellRx1EcNoHists;
}

- (void)setKCellularWcdmaServingCellRx1EcNoHists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaTxPowerHists
{
  return self->_kCellularWcdmaTxPowerHists;
}

- (void)setKCellularWcdmaTxPowerHists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaReceiverStatusOnC0Hists
{
  return self->_kCellularWcdmaReceiverStatusOnC0Hists;
}

- (void)setKCellularWcdmaReceiverStatusOnC0Hists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaReceiverStatusOnC1Hists
{
  return self->_kCellularWcdmaReceiverStatusOnC1Hists;
}

- (void)setKCellularWcdmaReceiverStatusOnC1Hists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaCarrierStatusHists
{
  return self->_kCellularWcdmaCarrierStatusHists;
}

- (void)setKCellularWcdmaCarrierStatusHists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaRabModeHists
{
  return self->_kCellularWcdmaRabModeHists;
}

- (void)setKCellularWcdmaRabModeHists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaRabTypeHists
{
  return self->_kCellularWcdmaRabTypeHists;
}

- (void)setKCellularWcdmaRabTypeHists:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaRrcConnectionStates
{
  return self->_kCellularWcdmaRrcConnectionStates;
}

- (void)setKCellularWcdmaRrcConnectionStates:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaRrcConfigurations
{
  return self->_kCellularWcdmaRrcConfigurations;
}

- (void)setKCellularWcdmaRrcConfigurations:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaRabStatus
{
  return self->_kCellularWcdmaRabStatus;
}

- (void)setKCellularWcdmaRabStatus:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaL1States
{
  return self->_kCellularWcdmaL1States;
}

- (void)setKCellularWcdmaL1States:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaDataInactivityBeforeIdles
{
  return self->_kCellularWcdmaDataInactivityBeforeIdles;
}

- (void)setKCellularWcdmaDataInactivityBeforeIdles:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaIdleToConnectedUserDatas
{
  return self->_kCellularWcdmaIdleToConnectedUserDatas;
}

- (void)setKCellularWcdmaIdleToConnectedUserDatas:(id)a3
{
}

- (NSMutableArray)kCellularWcdmaVadHists
{
  return self->_kCellularWcdmaVadHists;
}

- (void)setKCellularWcdmaVadHists:(id)a3
{
}

- (NSMutableArray)kCellularTdsRxDiversityHists
{
  return self->_kCellularTdsRxDiversityHists;
}

- (void)setKCellularTdsRxDiversityHists:(id)a3
{
}

- (NSMutableArray)kCellularTdsServingCellRx0RssiHists
{
  return self->_kCellularTdsServingCellRx0RssiHists;
}

- (void)setKCellularTdsServingCellRx0RssiHists:(id)a3
{
}

- (NSMutableArray)kCellularTdsServingCellRx1RssiHists
{
  return self->_kCellularTdsServingCellRx1RssiHists;
}

- (void)setKCellularTdsServingCellRx1RssiHists:(id)a3
{
}

- (NSMutableArray)kCellularTdsServingCellRx0RscpHists
{
  return self->_kCellularTdsServingCellRx0RscpHists;
}

- (void)setKCellularTdsServingCellRx0RscpHists:(id)a3
{
}

- (NSMutableArray)kCellularTdsServingCellRx1RscpHists
{
  return self->_kCellularTdsServingCellRx1RscpHists;
}

- (void)setKCellularTdsServingCellRx1RscpHists:(id)a3
{
}

- (NSMutableArray)kCellularTdsTxPowerHists
{
  return self->_kCellularTdsTxPowerHists;
}

- (void)setKCellularTdsTxPowerHists:(id)a3
{
}

- (NSMutableArray)kCellularTdsRabModeHists
{
  return self->_kCellularTdsRabModeHists;
}

- (void)setKCellularTdsRabModeHists:(id)a3
{
}

- (NSMutableArray)kCellularTdsRabTypeHists
{
  return self->_kCellularTdsRabTypeHists;
}

- (void)setKCellularTdsRabTypeHists:(id)a3
{
}

- (NSMutableArray)kCellularTdsRrcStates
{
  return self->_kCellularTdsRrcStates;
}

- (void)setKCellularTdsRrcStates:(id)a3
{
}

- (NSMutableArray)kCellularTdsL1States
{
  return self->_kCellularTdsL1States;
}

- (void)setKCellularTdsL1States:(id)a3
{
}

- (NSMutableArray)kCellularLteFwDuplexModes
{
  return self->_kCellularLteFwDuplexModes;
}

- (void)setKCellularLteFwDuplexModes:(id)a3
{
}

- (NSMutableArray)kCellularLteServingCellRsrpHists
{
  return self->_kCellularLteServingCellRsrpHists;
}

- (void)setKCellularLteServingCellRsrpHists:(id)a3
{
}

- (NSMutableArray)kCellularLteServingCellSinrHists
{
  return self->_kCellularLteServingCellSinrHists;
}

- (void)setKCellularLteServingCellSinrHists:(id)a3
{
}

- (NSMutableArray)kCellularLteSleepStateHists
{
  return self->_kCellularLteSleepStateHists;
}

- (void)setKCellularLteSleepStateHists:(id)a3
{
}

- (NSMutableArray)kCellularLteTxPowerHists
{
  return self->_kCellularLteTxPowerHists;
}

- (void)setKCellularLteTxPowerHists:(id)a3
{
}

- (NSMutableArray)kCellularLteDlSccStateHists
{
  return self->_kCellularLteDlSccStateHists;
}

- (void)setKCellularLteDlSccStateHists:(id)a3
{
}

- (NSMutableArray)kCellularLteUlSccStateHists
{
  return self->_kCellularLteUlSccStateHists;
}

- (void)setKCellularLteUlSccStateHists:(id)a3
{
}

- (NSMutableArray)kCellularLteAdvancedRxStateHists
{
  return self->_kCellularLteAdvancedRxStateHists;
}

- (void)setKCellularLteAdvancedRxStateHists:(id)a3
{
}

- (NSMutableArray)kCellularLteComponentCarrierInfos
{
  return self->_kCellularLteComponentCarrierInfos;
}

- (void)setKCellularLteComponentCarrierInfos:(id)a3
{
}

- (NSMutableArray)kCellularLteRxTxStateHists
{
  return self->_kCellularLteRxTxStateHists;
}

- (void)setKCellularLteRxTxStateHists:(id)a3
{
}

- (NSMutableArray)kCellularLteTotalDlTbsHists
{
  return self->_kCellularLteTotalDlTbsHists;
}

- (void)setKCellularLteTotalDlTbsHists:(id)a3
{
}

- (NSMutableArray)kCellularLteDataInactivityBeforeIdles
{
  return self->_kCellularLteDataInactivityBeforeIdles;
}

- (void)setKCellularLteDataInactivityBeforeIdles:(id)a3
{
}

- (NSMutableArray)kCellularLteIdleToConnectedUserDatas
{
  return self->_kCellularLteIdleToConnectedUserDatas;
}

- (void)setKCellularLteIdleToConnectedUserDatas:(id)a3
{
}

- (NSMutableArray)kCellularLteDlSccStateHistV3s
{
  return self->_kCellularLteDlSccStateHistV3s;
}

- (void)setKCellularLteDlSccStateHistV3s:(id)a3
{
}

- (NSMutableArray)kCellularLteRxDiversityHists
{
  return self->_kCellularLteRxDiversityHists;
}

- (void)setKCellularLteRxDiversityHists:(id)a3
{
}

- (NSMutableArray)kCellularLtePdcchStateHists
{
  return self->_kCellularLtePdcchStateHists;
}

- (void)setKCellularLtePdcchStateHists:(id)a3
{
}

- (NSMutableArray)kCellularLteRrcStates
{
  return self->_kCellularLteRrcStates;
}

- (void)setKCellularLteRrcStates:(id)a3
{
}

- (NSMutableArray)kCellularLtePagingCycles
{
  return self->_kCellularLtePagingCycles;
}

- (void)setKCellularLtePagingCycles:(id)a3
{
}

- (NSMutableArray)kCellularLteCdrxConfigs
{
  return self->_kCellularLteCdrxConfigs;
}

- (void)setKCellularLteCdrxConfigs:(id)a3
{
}

- (NSMutableArray)kCellularLteRadioLinkFailures
{
  return self->_kCellularLteRadioLinkFailures;
}

- (void)setKCellularLteRadioLinkFailures:(id)a3
{
}

- (NSMutableArray)kCellularLtePdcchStateStats
{
  return self->_kCellularLtePdcchStateStats;
}

- (void)setKCellularLtePdcchStateStats:(id)a3
{
}

- (NSMutableArray)kCellularLqmStateChanges
{
  return self->_kCellularLqmStateChanges;
}

- (void)setKCellularLqmStateChanges:(id)a3
{
}

- (NSMutableArray)kCellularServiceLosts
{
  return self->_kCellularServiceLosts;
}

- (void)setKCellularServiceLosts:(id)a3
{
}

- (NSMutableArray)kCellularProtocolStackStateHists
{
  return self->_kCellularProtocolStackStateHists;
}

- (void)setKCellularProtocolStackStateHists:(id)a3
{
}

- (NSMutableArray)kCellularCellPlmnSearchCounts
{
  return self->_kCellularCellPlmnSearchCounts;
}

- (void)setKCellularCellPlmnSearchCounts:(id)a3
{
}

- (NSMutableArray)kCellularCellPlmnSearchHists
{
  return self->_kCellularCellPlmnSearchHists;
}

- (void)setKCellularCellPlmnSearchHists:(id)a3
{
}

- (NSMutableArray)kCellularProtocolStackPowerStates
{
  return self->_kCellularProtocolStackPowerStates;
}

- (void)setKCellularProtocolStackPowerStates:(id)a3
{
}

- (NSMutableArray)kCellularDownlinkIpPacketFilterStatus
{
  return self->_kCellularDownlinkIpPacketFilterStatus;
}

- (void)setKCellularDownlinkIpPacketFilterStatus:(id)a3
{
}

- (NSMutableArray)kCellularDownlinkIpPacketDiscardeds
{
  return self->_kCellularDownlinkIpPacketDiscardeds;
}

- (void)setKCellularDownlinkIpPacketDiscardeds:(id)a3
{
}

- (NSMutableArray)kCellularServingCellRfBandHists
{
  return self->_kCellularServingCellRfBandHists;
}

- (void)setKCellularServingCellRfBandHists:(id)a3
{
}

- (NSMutableArray)kCellularProtocolStackStateHist2s
{
  return self->_kCellularProtocolStackStateHist2s;
}

- (void)setKCellularProtocolStackStateHist2s:(id)a3
{
}

- (NSMutableArray)kCellularProtocolStackStates
{
  return self->_kCellularProtocolStackStates;
}

- (void)setKCellularProtocolStackStates:(id)a3
{
}

- (NSMutableArray)kCellularCdma1XRxDiversityHists
{
  return self->_kCellularCdma1XRxDiversityHists;
}

- (void)setKCellularCdma1XRxDiversityHists:(id)a3
{
}

- (NSMutableArray)kCellularCdma1XServingCellRx0RssiHists
{
  return self->_kCellularCdma1XServingCellRx0RssiHists;
}

- (void)setKCellularCdma1XServingCellRx0RssiHists:(id)a3
{
}

- (NSMutableArray)kCellularCdma1XServingCellRx1RssiHists
{
  return self->_kCellularCdma1XServingCellRx1RssiHists;
}

- (void)setKCellularCdma1XServingCellRx1RssiHists:(id)a3
{
}

- (NSMutableArray)kCellularCdma1XServingCellRx0EcIoHists
{
  return self->_kCellularCdma1XServingCellRx0EcIoHists;
}

- (void)setKCellularCdma1XServingCellRx0EcIoHists:(id)a3
{
}

- (NSMutableArray)kCellularCdma1XServingCellRx1EcIoHists
{
  return self->_kCellularCdma1XServingCellRx1EcIoHists;
}

- (void)setKCellularCdma1XServingCellRx1EcIoHists:(id)a3
{
}

- (NSMutableArray)kCellularCdma1XTxPowerHists
{
  return self->_kCellularCdma1XTxPowerHists;
}

- (void)setKCellularCdma1XTxPowerHists:(id)a3
{
}

- (NSMutableArray)kCellularCdma1XProtocolStackStateHists
{
  return self->_kCellularCdma1XProtocolStackStateHists;
}

- (void)setKCellularCdma1XProtocolStackStateHists:(id)a3
{
}

- (NSMutableArray)kCellularCdma1XConnectionHists
{
  return self->_kCellularCdma1XConnectionHists;
}

- (void)setKCellularCdma1XConnectionHists:(id)a3
{
}

- (NSMutableArray)kCellularCdma1XRrStates
{
  return self->_kCellularCdma1XRrStates;
}

- (void)setKCellularCdma1XRrStates:(id)a3
{
}

- (NSMutableArray)kCellularCdmaEvdoRxDiversityHists
{
  return self->_kCellularCdmaEvdoRxDiversityHists;
}

- (void)setKCellularCdmaEvdoRxDiversityHists:(id)a3
{
}

- (NSMutableArray)kCellularCdmaEvdoServingCellRx0RssiHists
{
  return self->_kCellularCdmaEvdoServingCellRx0RssiHists;
}

- (void)setKCellularCdmaEvdoServingCellRx0RssiHists:(id)a3
{
}

- (NSMutableArray)kCellularCdmaEvdoServingCellRx1RssiHists
{
  return self->_kCellularCdmaEvdoServingCellRx1RssiHists;
}

- (void)setKCellularCdmaEvdoServingCellRx1RssiHists:(id)a3
{
}

- (NSMutableArray)kCellularCdmaEvdoServingCellRx0EcIoHists
{
  return self->_kCellularCdmaEvdoServingCellRx0EcIoHists;
}

- (void)setKCellularCdmaEvdoServingCellRx0EcIoHists:(id)a3
{
}

- (NSMutableArray)kCellularCdmaEvdoServingCellRx1EcIoHists
{
  return self->_kCellularCdmaEvdoServingCellRx1EcIoHists;
}

- (void)setKCellularCdmaEvdoServingCellRx1EcIoHists:(id)a3
{
}

- (NSMutableArray)kCellularCdmaEvdoTxPowerHists
{
  return self->_kCellularCdmaEvdoTxPowerHists;
}

- (void)setKCellularCdmaEvdoTxPowerHists:(id)a3
{
}

- (NSMutableArray)kCellularCdmaEvdoProtocolStackStateHists
{
  return self->_kCellularCdmaEvdoProtocolStackStateHists;
}

- (void)setKCellularCdmaEvdoProtocolStackStateHists:(id)a3
{
}

- (NSMutableArray)kCellularCdmaEvdoRrStates
{
  return self->_kCellularCdmaEvdoRrStates;
}

- (void)setKCellularCdmaEvdoRrStates:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_kCellularWcdmaVadHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx1RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx1EcNoHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx0RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaServingCellRx0EcNoHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRrcConnectionStates, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRrcConfigurations, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaReceiverStatusOnC1Hists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaReceiverStatusOnC0Hists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRabTypeHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRabStatus, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaRabModeHists, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaL1States, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaIdleToConnectedUserDatas, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaDataInactivityBeforeIdles, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaCpcStats, 0);
  objc_storeStrong((id *)&self->_kCellularWcdmaCarrierStatusHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx1RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx1RscpHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx0RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsServingCellRx0RscpHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsRrcStates, 0);
  objc_storeStrong((id *)&self->_kCellularTdsRabTypeHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsRabModeHists, 0);
  objc_storeStrong((id *)&self->_kCellularTdsL1States, 0);
  objc_storeStrong((id *)&self->_kCellularServingCellRfBandHists, 0);
  objc_storeStrong((id *)&self->_kCellularServiceLosts, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackStates, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackStateHist2s, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackPowerStates, 0);
  objc_storeStrong((id *)&self->_kCellularProtocolStackCpuStats, 0);
  objc_storeStrong((id *)&self->_kCellularPmuAverageCurrents, 0);
  objc_storeStrong((id *)&self->_kCellularPmicHwStats, 0);
  objc_storeStrong((id *)&self->_kCellularPeripheralStats, 0);
  objc_storeStrong((id *)&self->_kCellularPerClientProfileTriggerCounts, 0);
  objc_storeStrong((id *)&self->_kCellularLteWcdmaTdsHwStats, 0);
  objc_storeStrong((id *)&self->_kCellularLteWcdmaGsmHwStats, 0);
  objc_storeStrong((id *)&self->_kCellularLteUlSccStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteTotalDlTbsHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteTdsGsmHwStats, 0);
  objc_storeStrong((id *)&self->_kCellularLteSleepStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteServingCellSinrHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteServingCellRsrpHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteRxTxStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteRrcStates, 0);
  objc_storeStrong((id *)&self->_kCellularLteRadioLinkFailures, 0);
  objc_storeStrong((id *)&self->_kCellularLtePdcchStateStats, 0);
  objc_storeStrong((id *)&self->_kCellularLtePdcchStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLtePagingCycles, 0);
  objc_storeStrong((id *)&self->_kCellularLteIdleToConnectedUserDatas, 0);
  objc_storeStrong((id *)&self->_kCellularLteFwDuplexModes, 0);
  objc_storeStrong((id *)&self->_kCellularLteDlSccStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLteDlSccStateHistV3s, 0);
  objc_storeStrong((id *)&self->_kCellularLteDataInactivityBeforeIdles, 0);
  objc_storeStrong((id *)&self->_kCellularLteComponentCarrierInfos, 0);
  objc_storeStrong((id *)&self->_kCellularLteCdrxConfigs, 0);
  objc_storeStrong((id *)&self->_kCellularLteAdvancedRxStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularLqmStateChanges, 0);
  objc_storeStrong((id *)&self->_kCellularGsmTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularGsmServingCellSnrHists, 0);
  objc_storeStrong((id *)&self->_kCellularGsmServingCellRssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularGsmL1States, 0);
  objc_storeStrong((id *)&self->_kCellularGsmConnectedModeHists, 0);
  objc_storeStrong((id *)&self->_kCellularFwCoreStats, 0);
  objc_storeStrong((id *)&self->_kCellularDvfsStats, 0);
  objc_storeStrong((id *)&self->_kCellularDownlinkIpPacketFilterStatus, 0);
  objc_storeStrong((id *)&self->_kCellularDownlinkIpPacketDiscardeds, 0);
  objc_storeStrong((id *)&self->_kCellularCellPlmnSearchHists, 0);
  objc_storeStrong((id *)&self->_kCellularCellPlmnSearchCounts, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx1RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx1EcIoHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx0RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoServingCellRx0EcIoHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoRrStates, 0);
  objc_storeStrong((id *)&self->_kCellularCdmaEvdoProtocolStackStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XTxPowerHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx1RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx1EcIoHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx0RssiHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XServingCellRx0EcIoHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XRxDiversityHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XRrStates, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XProtocolStackStateHists, 0);
  objc_storeStrong((id *)&self->_kCellularCdma1XConnectionHists, 0);
}

@end
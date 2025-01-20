@interface AWDMETRICSCellularPowerLog
+ (Class)cellularDynamicRatSelectionType;
+ (Class)cellularNrSDMActivationType;
+ (Class)cellularNrSdmEndcReleaseType;
+ (Class)cellularPerClientProfileTriggerCountType;
+ (Class)cellularPowerLogAOPUARTStatesType;
+ (Class)cellularPowerLogAPPSCXOShutdownType;
+ (Class)cellularPowerLogAPPSPerfLevelsType;
+ (Class)cellularPowerLogAPPSSleepVetoType;
+ (Class)cellularPowerLogCDMA1XRABModeType;
+ (Class)cellularPowerLogCDMA1XRRCStateChangeType;
+ (Class)cellularPowerLogCDMA1XRxDiversityType;
+ (Class)cellularPowerLogCDMA1XRxRSSIType;
+ (Class)cellularPowerLogCDMA1XTxPowerType;
+ (Class)cellularPowerLogEVDORxDiversityType;
+ (Class)cellularPowerLogEVDORxRSSIType;
+ (Class)cellularPowerLogEVDOTxPowerType;
+ (Class)cellularPowerLogGPSStatesType;
+ (Class)cellularPowerLogGSMRABModeType;
+ (Class)cellularPowerLogGSMRRCStateChangeType;
+ (Class)cellularPowerLogGSMRxDiversityType;
+ (Class)cellularPowerLogGSMRxRSSIType;
+ (Class)cellularPowerLogGSMTxPowerType;
+ (Class)cellularPowerLogHybridRABModeType;
+ (Class)cellularPowerLogHybridRRCStateChangeType;
+ (Class)cellularPowerLogL1SleepStatesType;
+ (Class)cellularPowerLogLTEActivatedCASCCStatesType;
+ (Class)cellularPowerLogLTEAggregatedDLTBSType;
+ (Class)cellularPowerLogLTECDRXConfigType;
+ (Class)cellularPowerLogLTECarrierComponentInfoType;
+ (Class)cellularPowerLogLTEConfiguredCASCCStatesType;
+ (Class)cellularPowerLogLTEPagingDRXCycleType;
+ (Class)cellularPowerLogLTERRCStateChangeType;
+ (Class)cellularPowerLogLTERSRPType;
+ (Class)cellularPowerLogLTERxDiversityType;
+ (Class)cellularPowerLogLTERxTxActivityStatesType;
+ (Class)cellularPowerLogLTESINRType;
+ (Class)cellularPowerLogLTETxPowerType;
+ (Class)cellularPowerLogLTEULCAStateType;
+ (Class)cellularPowerLogMCPMSleepVetoType;
+ (Class)cellularPowerLogMPSSPerfLevelsType;
+ (Class)cellularPowerLogNRCDRXConfigType;
+ (Class)cellularPowerLogNRDCEventType;
+ (Class)cellularPowerLogNRFRCoverageType;
+ (Class)cellularPowerLogNRMmWaveRSRPType;
+ (Class)cellularPowerLogNRMmWaveTxPowerType;
+ (Class)cellularPowerLogNRMmWaveULCAStateType;
+ (Class)cellularPowerLogNRNSAENDCEventType;
+ (Class)cellularPowerLogNRPagingDRXCycleType;
+ (Class)cellularPowerLogNRSARRCStateChangeType;
+ (Class)cellularPowerLogNRSCGRelType;
+ (Class)cellularPowerLogNRmmWaveAntennaPanelType;
+ (Class)cellularPowerLogNRmmWaveBWPSCCType;
+ (Class)cellularPowerLogNRmmWaveBWPType;
+ (Class)cellularPowerLogNRmmWaveBeamIDType;
+ (Class)cellularPowerLogNRmmWaveCASCCActivatedType;
+ (Class)cellularPowerLogNRmmWaveCASCCConfiguredType;
+ (Class)cellularPowerLogNRmmWaveCarrierComponentInfoType;
+ (Class)cellularPowerLogNRmmWaveDLTBSType;
+ (Class)cellularPowerLogNRmmWaveRxTxType;
+ (Class)cellularPowerLogNRsub6BWPSAType;
+ (Class)cellularPowerLogNRsub6BWPSCCType;
+ (Class)cellularPowerLogNRsub6BWPType;
+ (Class)cellularPowerLogNRsub6CASCCActivatedType;
+ (Class)cellularPowerLogNRsub6CASCCConfiguredType;
+ (Class)cellularPowerLogNRsub6CarrierComponentInfoType;
+ (Class)cellularPowerLogNRsub6DLTBSType;
+ (Class)cellularPowerLogNRsub6RSRPType;
+ (Class)cellularPowerLogNRsub6RxDiversityType;
+ (Class)cellularPowerLogNRsub6RxTxType;
+ (Class)cellularPowerLogNRsub6TxPowerType;
+ (Class)cellularPowerLogNRsub6ULCAStateType;
+ (Class)cellularPowerLogPCIeStatesType;
+ (Class)cellularPowerLogPLMNScanEventType;
+ (Class)cellularPowerLogPLMNSearchEventType;
+ (Class)cellularPowerLogPLMNSearchType;
+ (Class)cellularPowerLogPowerEstimatorType;
+ (Class)cellularPowerLogProtocolStateType;
+ (Class)cellularPowerLogRATRedirectionEventType;
+ (Class)cellularPowerLogRATReselectionEventType;
+ (Class)cellularPowerLogRFTunerStatsHistType;
+ (Class)cellularPowerLogSFTRxTxType;
+ (Class)cellularPowerLogSFTStateType;
+ (Class)cellularPowerLogSPMIType;
+ (Class)cellularPowerLogServiceStateEventType;
+ (Class)cellularPowerLogSystemEventType;
+ (Class)cellularPowerLogWCDMACDRXConfigType;
+ (Class)cellularPowerLogWCDMARABModeType;
+ (Class)cellularPowerLogWCDMARABTypeType;
+ (Class)cellularPowerLogWCDMARRCStateChangeType;
+ (Class)cellularPowerLogWCDMARxDiversityType;
+ (Class)cellularPowerLogWCDMARxRSSIType;
+ (Class)cellularPowerLogWCDMATxPowerType;
+ (Class)cellularPowerLogWLANUARTStatesType;
+ (Class)cellularPowerLogWUSType;
+ (Class)cellularPowerLogXOShutdownType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cellularDynamicRatSelections;
- (NSMutableArray)cellularNrSDMActivations;
- (NSMutableArray)cellularNrSdmEndcReleases;
- (NSMutableArray)cellularPerClientProfileTriggerCounts;
- (NSMutableArray)cellularPowerLogAOPUARTStates;
- (NSMutableArray)cellularPowerLogAPPSCXOShutdowns;
- (NSMutableArray)cellularPowerLogAPPSPerfLevels;
- (NSMutableArray)cellularPowerLogAPPSSleepVetos;
- (NSMutableArray)cellularPowerLogCDMA1XRABModes;
- (NSMutableArray)cellularPowerLogCDMA1XRRCStateChanges;
- (NSMutableArray)cellularPowerLogCDMA1XRxDiversitys;
- (NSMutableArray)cellularPowerLogCDMA1XRxRSSIs;
- (NSMutableArray)cellularPowerLogCDMA1XTxPowers;
- (NSMutableArray)cellularPowerLogEVDORxDiversitys;
- (NSMutableArray)cellularPowerLogEVDORxRSSIs;
- (NSMutableArray)cellularPowerLogEVDOTxPowers;
- (NSMutableArray)cellularPowerLogGPSStates;
- (NSMutableArray)cellularPowerLogGSMRABModes;
- (NSMutableArray)cellularPowerLogGSMRRCStateChanges;
- (NSMutableArray)cellularPowerLogGSMRxDiversitys;
- (NSMutableArray)cellularPowerLogGSMRxRSSIs;
- (NSMutableArray)cellularPowerLogGSMTxPowers;
- (NSMutableArray)cellularPowerLogHybridRABModes;
- (NSMutableArray)cellularPowerLogHybridRRCStateChanges;
- (NSMutableArray)cellularPowerLogL1SleepStates;
- (NSMutableArray)cellularPowerLogLTEActivatedCASCCStates;
- (NSMutableArray)cellularPowerLogLTEAggregatedDLTBSs;
- (NSMutableArray)cellularPowerLogLTECDRXConfigs;
- (NSMutableArray)cellularPowerLogLTECarrierComponentInfos;
- (NSMutableArray)cellularPowerLogLTEConfiguredCASCCStates;
- (NSMutableArray)cellularPowerLogLTEPagingDRXCycles;
- (NSMutableArray)cellularPowerLogLTERRCStateChanges;
- (NSMutableArray)cellularPowerLogLTERSRPs;
- (NSMutableArray)cellularPowerLogLTERxDiversitys;
- (NSMutableArray)cellularPowerLogLTERxTxActivityStates;
- (NSMutableArray)cellularPowerLogLTESINRs;
- (NSMutableArray)cellularPowerLogLTETxPowers;
- (NSMutableArray)cellularPowerLogLTEULCAStates;
- (NSMutableArray)cellularPowerLogMCPMSleepVetos;
- (NSMutableArray)cellularPowerLogMPSSPerfLevels;
- (NSMutableArray)cellularPowerLogNRCDRXConfigs;
- (NSMutableArray)cellularPowerLogNRDCEvents;
- (NSMutableArray)cellularPowerLogNRFRCoverages;
- (NSMutableArray)cellularPowerLogNRMmWaveRSRPs;
- (NSMutableArray)cellularPowerLogNRMmWaveTxPowers;
- (NSMutableArray)cellularPowerLogNRMmWaveULCAStates;
- (NSMutableArray)cellularPowerLogNRNSAENDCEvents;
- (NSMutableArray)cellularPowerLogNRPagingDRXCycles;
- (NSMutableArray)cellularPowerLogNRSARRCStateChanges;
- (NSMutableArray)cellularPowerLogNRSCGRels;
- (NSMutableArray)cellularPowerLogNRmmWaveAntennaPanels;
- (NSMutableArray)cellularPowerLogNRmmWaveBWPSCCs;
- (NSMutableArray)cellularPowerLogNRmmWaveBWPs;
- (NSMutableArray)cellularPowerLogNRmmWaveBeamIDs;
- (NSMutableArray)cellularPowerLogNRmmWaveCASCCActivateds;
- (NSMutableArray)cellularPowerLogNRmmWaveCASCCConfigureds;
- (NSMutableArray)cellularPowerLogNRmmWaveCarrierComponentInfos;
- (NSMutableArray)cellularPowerLogNRmmWaveDLTBSs;
- (NSMutableArray)cellularPowerLogNRmmWaveRxTxs;
- (NSMutableArray)cellularPowerLogNRsub6BWPSAs;
- (NSMutableArray)cellularPowerLogNRsub6BWPSCCs;
- (NSMutableArray)cellularPowerLogNRsub6BWPs;
- (NSMutableArray)cellularPowerLogNRsub6CASCCActivateds;
- (NSMutableArray)cellularPowerLogNRsub6CASCCConfigureds;
- (NSMutableArray)cellularPowerLogNRsub6CarrierComponentInfos;
- (NSMutableArray)cellularPowerLogNRsub6DLTBSs;
- (NSMutableArray)cellularPowerLogNRsub6RSRPs;
- (NSMutableArray)cellularPowerLogNRsub6RxDiversitys;
- (NSMutableArray)cellularPowerLogNRsub6RxTxs;
- (NSMutableArray)cellularPowerLogNRsub6TxPowers;
- (NSMutableArray)cellularPowerLogNRsub6ULCAStates;
- (NSMutableArray)cellularPowerLogPCIeStates;
- (NSMutableArray)cellularPowerLogPLMNScanEvents;
- (NSMutableArray)cellularPowerLogPLMNSearchEvents;
- (NSMutableArray)cellularPowerLogPLMNSearchs;
- (NSMutableArray)cellularPowerLogPowerEstimators;
- (NSMutableArray)cellularPowerLogProtocolStates;
- (NSMutableArray)cellularPowerLogRATRedirectionEvents;
- (NSMutableArray)cellularPowerLogRATReselectionEvents;
- (NSMutableArray)cellularPowerLogRFTunerStatsHists;
- (NSMutableArray)cellularPowerLogSFTRxTxs;
- (NSMutableArray)cellularPowerLogSFTStates;
- (NSMutableArray)cellularPowerLogSPMIs;
- (NSMutableArray)cellularPowerLogServiceStateEvents;
- (NSMutableArray)cellularPowerLogSystemEvents;
- (NSMutableArray)cellularPowerLogWCDMACDRXConfigs;
- (NSMutableArray)cellularPowerLogWCDMARABModes;
- (NSMutableArray)cellularPowerLogWCDMARABTypes;
- (NSMutableArray)cellularPowerLogWCDMARRCStateChanges;
- (NSMutableArray)cellularPowerLogWCDMARxDiversitys;
- (NSMutableArray)cellularPowerLogWCDMARxRSSIs;
- (NSMutableArray)cellularPowerLogWCDMATxPowers;
- (NSMutableArray)cellularPowerLogWLANUARTStates;
- (NSMutableArray)cellularPowerLogWUSs;
- (NSMutableArray)cellularPowerLogXOShutdowns;
- (id)cellularDynamicRatSelectionAtIndex:(unint64_t)a3;
- (id)cellularNrSDMActivationAtIndex:(unint64_t)a3;
- (id)cellularNrSdmEndcReleaseAtIndex:(unint64_t)a3;
- (id)cellularPerClientProfileTriggerCountAtIndex:(unint64_t)a3;
- (id)cellularPowerLogAOPUARTStatesAtIndex:(unint64_t)a3;
- (id)cellularPowerLogAPPSCXOShutdownAtIndex:(unint64_t)a3;
- (id)cellularPowerLogAPPSPerfLevelsAtIndex:(unint64_t)a3;
- (id)cellularPowerLogAPPSSleepVetoAtIndex:(unint64_t)a3;
- (id)cellularPowerLogCDMA1XRABModeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogCDMA1XRRCStateChangeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogCDMA1XRxDiversityAtIndex:(unint64_t)a3;
- (id)cellularPowerLogCDMA1XRxRSSIAtIndex:(unint64_t)a3;
- (id)cellularPowerLogCDMA1XTxPowerAtIndex:(unint64_t)a3;
- (id)cellularPowerLogEVDORxDiversityAtIndex:(unint64_t)a3;
- (id)cellularPowerLogEVDORxRSSIAtIndex:(unint64_t)a3;
- (id)cellularPowerLogEVDOTxPowerAtIndex:(unint64_t)a3;
- (id)cellularPowerLogGPSStatesAtIndex:(unint64_t)a3;
- (id)cellularPowerLogGSMRABModeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogGSMRRCStateChangeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogGSMRxDiversityAtIndex:(unint64_t)a3;
- (id)cellularPowerLogGSMRxRSSIAtIndex:(unint64_t)a3;
- (id)cellularPowerLogGSMTxPowerAtIndex:(unint64_t)a3;
- (id)cellularPowerLogHybridRABModeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogHybridRRCStateChangeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogL1SleepStatesAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTEActivatedCASCCStatesAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTEAggregatedDLTBSAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTECDRXConfigAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTECarrierComponentInfoAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTEConfiguredCASCCStatesAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTEPagingDRXCycleAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTERRCStateChangeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTERSRPAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTERxDiversityAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTERxTxActivityStatesAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTESINRAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTETxPowerAtIndex:(unint64_t)a3;
- (id)cellularPowerLogLTEULCAStateAtIndex:(unint64_t)a3;
- (id)cellularPowerLogMCPMSleepVetoAtIndex:(unint64_t)a3;
- (id)cellularPowerLogMPSSPerfLevelsAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRCDRXConfigAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRDCEventAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRFRCoverageAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRMmWaveRSRPAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRMmWaveTxPowerAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRMmWaveULCAStateAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRNSAENDCEventAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRPagingDRXCycleAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRSARRCStateChangeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRSCGRelAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRmmWaveAntennaPanelAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRmmWaveBWPAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRmmWaveBWPSCCAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRmmWaveBeamIDAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRmmWaveCASCCActivatedAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRmmWaveCASCCConfiguredAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRmmWaveCarrierComponentInfoAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRmmWaveDLTBSAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRmmWaveRxTxAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6BWPAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6BWPSAAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6BWPSCCAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6CASCCActivatedAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6CASCCConfiguredAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6CarrierComponentInfoAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6DLTBSAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6RSRPAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6RxDiversityAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6RxTxAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6TxPowerAtIndex:(unint64_t)a3;
- (id)cellularPowerLogNRsub6ULCAStateAtIndex:(unint64_t)a3;
- (id)cellularPowerLogPCIeStatesAtIndex:(unint64_t)a3;
- (id)cellularPowerLogPLMNScanEventAtIndex:(unint64_t)a3;
- (id)cellularPowerLogPLMNSearchAtIndex:(unint64_t)a3;
- (id)cellularPowerLogPLMNSearchEventAtIndex:(unint64_t)a3;
- (id)cellularPowerLogPowerEstimatorAtIndex:(unint64_t)a3;
- (id)cellularPowerLogProtocolStateAtIndex:(unint64_t)a3;
- (id)cellularPowerLogRATRedirectionEventAtIndex:(unint64_t)a3;
- (id)cellularPowerLogRATReselectionEventAtIndex:(unint64_t)a3;
- (id)cellularPowerLogRFTunerStatsHistAtIndex:(unint64_t)a3;
- (id)cellularPowerLogSFTRxTxAtIndex:(unint64_t)a3;
- (id)cellularPowerLogSFTStateAtIndex:(unint64_t)a3;
- (id)cellularPowerLogSPMIAtIndex:(unint64_t)a3;
- (id)cellularPowerLogServiceStateEventAtIndex:(unint64_t)a3;
- (id)cellularPowerLogSystemEventAtIndex:(unint64_t)a3;
- (id)cellularPowerLogWCDMACDRXConfigAtIndex:(unint64_t)a3;
- (id)cellularPowerLogWCDMARABModeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogWCDMARABTypeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogWCDMARRCStateChangeAtIndex:(unint64_t)a3;
- (id)cellularPowerLogWCDMARxDiversityAtIndex:(unint64_t)a3;
- (id)cellularPowerLogWCDMARxRSSIAtIndex:(unint64_t)a3;
- (id)cellularPowerLogWCDMATxPowerAtIndex:(unint64_t)a3;
- (id)cellularPowerLogWLANUARTStatesAtIndex:(unint64_t)a3;
- (id)cellularPowerLogWUSAtIndex:(unint64_t)a3;
- (id)cellularPowerLogXOShutdownAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)cellularDynamicRatSelectionsCount;
- (unint64_t)cellularNrSDMActivationsCount;
- (unint64_t)cellularNrSdmEndcReleasesCount;
- (unint64_t)cellularPerClientProfileTriggerCountsCount;
- (unint64_t)cellularPowerLogAOPUARTStatesCount;
- (unint64_t)cellularPowerLogAPPSCXOShutdownsCount;
- (unint64_t)cellularPowerLogAPPSPerfLevelsCount;
- (unint64_t)cellularPowerLogAPPSSleepVetosCount;
- (unint64_t)cellularPowerLogCDMA1XRABModesCount;
- (unint64_t)cellularPowerLogCDMA1XRRCStateChangesCount;
- (unint64_t)cellularPowerLogCDMA1XRxDiversitysCount;
- (unint64_t)cellularPowerLogCDMA1XRxRSSIsCount;
- (unint64_t)cellularPowerLogCDMA1XTxPowersCount;
- (unint64_t)cellularPowerLogEVDORxDiversitysCount;
- (unint64_t)cellularPowerLogEVDORxRSSIsCount;
- (unint64_t)cellularPowerLogEVDOTxPowersCount;
- (unint64_t)cellularPowerLogGPSStatesCount;
- (unint64_t)cellularPowerLogGSMRABModesCount;
- (unint64_t)cellularPowerLogGSMRRCStateChangesCount;
- (unint64_t)cellularPowerLogGSMRxDiversitysCount;
- (unint64_t)cellularPowerLogGSMRxRSSIsCount;
- (unint64_t)cellularPowerLogGSMTxPowersCount;
- (unint64_t)cellularPowerLogHybridRABModesCount;
- (unint64_t)cellularPowerLogHybridRRCStateChangesCount;
- (unint64_t)cellularPowerLogL1SleepStatesCount;
- (unint64_t)cellularPowerLogLTEActivatedCASCCStatesCount;
- (unint64_t)cellularPowerLogLTEAggregatedDLTBSsCount;
- (unint64_t)cellularPowerLogLTECDRXConfigsCount;
- (unint64_t)cellularPowerLogLTECarrierComponentInfosCount;
- (unint64_t)cellularPowerLogLTEConfiguredCASCCStatesCount;
- (unint64_t)cellularPowerLogLTEPagingDRXCyclesCount;
- (unint64_t)cellularPowerLogLTERRCStateChangesCount;
- (unint64_t)cellularPowerLogLTERSRPsCount;
- (unint64_t)cellularPowerLogLTERxDiversitysCount;
- (unint64_t)cellularPowerLogLTERxTxActivityStatesCount;
- (unint64_t)cellularPowerLogLTESINRsCount;
- (unint64_t)cellularPowerLogLTETxPowersCount;
- (unint64_t)cellularPowerLogLTEULCAStatesCount;
- (unint64_t)cellularPowerLogMCPMSleepVetosCount;
- (unint64_t)cellularPowerLogMPSSPerfLevelsCount;
- (unint64_t)cellularPowerLogNRCDRXConfigsCount;
- (unint64_t)cellularPowerLogNRDCEventsCount;
- (unint64_t)cellularPowerLogNRFRCoveragesCount;
- (unint64_t)cellularPowerLogNRMmWaveRSRPsCount;
- (unint64_t)cellularPowerLogNRMmWaveTxPowersCount;
- (unint64_t)cellularPowerLogNRMmWaveULCAStatesCount;
- (unint64_t)cellularPowerLogNRNSAENDCEventsCount;
- (unint64_t)cellularPowerLogNRPagingDRXCyclesCount;
- (unint64_t)cellularPowerLogNRSARRCStateChangesCount;
- (unint64_t)cellularPowerLogNRSCGRelsCount;
- (unint64_t)cellularPowerLogNRmmWaveAntennaPanelsCount;
- (unint64_t)cellularPowerLogNRmmWaveBWPSCCsCount;
- (unint64_t)cellularPowerLogNRmmWaveBWPsCount;
- (unint64_t)cellularPowerLogNRmmWaveBeamIDsCount;
- (unint64_t)cellularPowerLogNRmmWaveCASCCActivatedsCount;
- (unint64_t)cellularPowerLogNRmmWaveCASCCConfiguredsCount;
- (unint64_t)cellularPowerLogNRmmWaveCarrierComponentInfosCount;
- (unint64_t)cellularPowerLogNRmmWaveDLTBSsCount;
- (unint64_t)cellularPowerLogNRmmWaveRxTxsCount;
- (unint64_t)cellularPowerLogNRsub6BWPSAsCount;
- (unint64_t)cellularPowerLogNRsub6BWPSCCsCount;
- (unint64_t)cellularPowerLogNRsub6BWPsCount;
- (unint64_t)cellularPowerLogNRsub6CASCCActivatedsCount;
- (unint64_t)cellularPowerLogNRsub6CASCCConfiguredsCount;
- (unint64_t)cellularPowerLogNRsub6CarrierComponentInfosCount;
- (unint64_t)cellularPowerLogNRsub6DLTBSsCount;
- (unint64_t)cellularPowerLogNRsub6RSRPsCount;
- (unint64_t)cellularPowerLogNRsub6RxDiversitysCount;
- (unint64_t)cellularPowerLogNRsub6RxTxsCount;
- (unint64_t)cellularPowerLogNRsub6TxPowersCount;
- (unint64_t)cellularPowerLogNRsub6ULCAStatesCount;
- (unint64_t)cellularPowerLogPCIeStatesCount;
- (unint64_t)cellularPowerLogPLMNScanEventsCount;
- (unint64_t)cellularPowerLogPLMNSearchEventsCount;
- (unint64_t)cellularPowerLogPLMNSearchsCount;
- (unint64_t)cellularPowerLogPowerEstimatorsCount;
- (unint64_t)cellularPowerLogProtocolStatesCount;
- (unint64_t)cellularPowerLogRATRedirectionEventsCount;
- (unint64_t)cellularPowerLogRATReselectionEventsCount;
- (unint64_t)cellularPowerLogRFTunerStatsHistsCount;
- (unint64_t)cellularPowerLogSFTRxTxsCount;
- (unint64_t)cellularPowerLogSFTStatesCount;
- (unint64_t)cellularPowerLogSPMIsCount;
- (unint64_t)cellularPowerLogServiceStateEventsCount;
- (unint64_t)cellularPowerLogSystemEventsCount;
- (unint64_t)cellularPowerLogWCDMACDRXConfigsCount;
- (unint64_t)cellularPowerLogWCDMARABModesCount;
- (unint64_t)cellularPowerLogWCDMARABTypesCount;
- (unint64_t)cellularPowerLogWCDMARRCStateChangesCount;
- (unint64_t)cellularPowerLogWCDMARxDiversitysCount;
- (unint64_t)cellularPowerLogWCDMARxRSSIsCount;
- (unint64_t)cellularPowerLogWCDMATxPowersCount;
- (unint64_t)cellularPowerLogWLANUARTStatesCount;
- (unint64_t)cellularPowerLogWUSsCount;
- (unint64_t)cellularPowerLogXOShutdownsCount;
- (unint64_t)hash;
- (void)addCellularDynamicRatSelection:(id)a3;
- (void)addCellularNrSDMActivation:(id)a3;
- (void)addCellularNrSdmEndcRelease:(id)a3;
- (void)addCellularPerClientProfileTriggerCount:(id)a3;
- (void)addCellularPowerLogAOPUARTStates:(id)a3;
- (void)addCellularPowerLogAPPSCXOShutdown:(id)a3;
- (void)addCellularPowerLogAPPSPerfLevels:(id)a3;
- (void)addCellularPowerLogAPPSSleepVeto:(id)a3;
- (void)addCellularPowerLogCDMA1XRABMode:(id)a3;
- (void)addCellularPowerLogCDMA1XRRCStateChange:(id)a3;
- (void)addCellularPowerLogCDMA1XRxDiversity:(id)a3;
- (void)addCellularPowerLogCDMA1XRxRSSI:(id)a3;
- (void)addCellularPowerLogCDMA1XTxPower:(id)a3;
- (void)addCellularPowerLogEVDORxDiversity:(id)a3;
- (void)addCellularPowerLogEVDORxRSSI:(id)a3;
- (void)addCellularPowerLogEVDOTxPower:(id)a3;
- (void)addCellularPowerLogGPSStates:(id)a3;
- (void)addCellularPowerLogGSMRABMode:(id)a3;
- (void)addCellularPowerLogGSMRRCStateChange:(id)a3;
- (void)addCellularPowerLogGSMRxDiversity:(id)a3;
- (void)addCellularPowerLogGSMRxRSSI:(id)a3;
- (void)addCellularPowerLogGSMTxPower:(id)a3;
- (void)addCellularPowerLogHybridRABMode:(id)a3;
- (void)addCellularPowerLogHybridRRCStateChange:(id)a3;
- (void)addCellularPowerLogL1SleepStates:(id)a3;
- (void)addCellularPowerLogLTEActivatedCASCCStates:(id)a3;
- (void)addCellularPowerLogLTEAggregatedDLTBS:(id)a3;
- (void)addCellularPowerLogLTECDRXConfig:(id)a3;
- (void)addCellularPowerLogLTECarrierComponentInfo:(id)a3;
- (void)addCellularPowerLogLTEConfiguredCASCCStates:(id)a3;
- (void)addCellularPowerLogLTEPagingDRXCycle:(id)a3;
- (void)addCellularPowerLogLTERRCStateChange:(id)a3;
- (void)addCellularPowerLogLTERSRP:(id)a3;
- (void)addCellularPowerLogLTERxDiversity:(id)a3;
- (void)addCellularPowerLogLTERxTxActivityStates:(id)a3;
- (void)addCellularPowerLogLTESINR:(id)a3;
- (void)addCellularPowerLogLTETxPower:(id)a3;
- (void)addCellularPowerLogLTEULCAState:(id)a3;
- (void)addCellularPowerLogMCPMSleepVeto:(id)a3;
- (void)addCellularPowerLogMPSSPerfLevels:(id)a3;
- (void)addCellularPowerLogNRCDRXConfig:(id)a3;
- (void)addCellularPowerLogNRDCEvent:(id)a3;
- (void)addCellularPowerLogNRFRCoverage:(id)a3;
- (void)addCellularPowerLogNRMmWaveRSRP:(id)a3;
- (void)addCellularPowerLogNRMmWaveTxPower:(id)a3;
- (void)addCellularPowerLogNRMmWaveULCAState:(id)a3;
- (void)addCellularPowerLogNRNSAENDCEvent:(id)a3;
- (void)addCellularPowerLogNRPagingDRXCycle:(id)a3;
- (void)addCellularPowerLogNRSARRCStateChange:(id)a3;
- (void)addCellularPowerLogNRSCGRel:(id)a3;
- (void)addCellularPowerLogNRmmWaveAntennaPanel:(id)a3;
- (void)addCellularPowerLogNRmmWaveBWP:(id)a3;
- (void)addCellularPowerLogNRmmWaveBWPSCC:(id)a3;
- (void)addCellularPowerLogNRmmWaveBeamID:(id)a3;
- (void)addCellularPowerLogNRmmWaveCASCCActivated:(id)a3;
- (void)addCellularPowerLogNRmmWaveCASCCConfigured:(id)a3;
- (void)addCellularPowerLogNRmmWaveCarrierComponentInfo:(id)a3;
- (void)addCellularPowerLogNRmmWaveDLTBS:(id)a3;
- (void)addCellularPowerLogNRmmWaveRxTx:(id)a3;
- (void)addCellularPowerLogNRsub6BWP:(id)a3;
- (void)addCellularPowerLogNRsub6BWPSA:(id)a3;
- (void)addCellularPowerLogNRsub6BWPSCC:(id)a3;
- (void)addCellularPowerLogNRsub6CASCCActivated:(id)a3;
- (void)addCellularPowerLogNRsub6CASCCConfigured:(id)a3;
- (void)addCellularPowerLogNRsub6CarrierComponentInfo:(id)a3;
- (void)addCellularPowerLogNRsub6DLTBS:(id)a3;
- (void)addCellularPowerLogNRsub6RSRP:(id)a3;
- (void)addCellularPowerLogNRsub6RxDiversity:(id)a3;
- (void)addCellularPowerLogNRsub6RxTx:(id)a3;
- (void)addCellularPowerLogNRsub6TxPower:(id)a3;
- (void)addCellularPowerLogNRsub6ULCAState:(id)a3;
- (void)addCellularPowerLogPCIeStates:(id)a3;
- (void)addCellularPowerLogPLMNScanEvent:(id)a3;
- (void)addCellularPowerLogPLMNSearch:(id)a3;
- (void)addCellularPowerLogPLMNSearchEvent:(id)a3;
- (void)addCellularPowerLogPowerEstimator:(id)a3;
- (void)addCellularPowerLogProtocolState:(id)a3;
- (void)addCellularPowerLogRATRedirectionEvent:(id)a3;
- (void)addCellularPowerLogRATReselectionEvent:(id)a3;
- (void)addCellularPowerLogRFTunerStatsHist:(id)a3;
- (void)addCellularPowerLogSFTRxTx:(id)a3;
- (void)addCellularPowerLogSFTState:(id)a3;
- (void)addCellularPowerLogSPMI:(id)a3;
- (void)addCellularPowerLogServiceStateEvent:(id)a3;
- (void)addCellularPowerLogSystemEvent:(id)a3;
- (void)addCellularPowerLogWCDMACDRXConfig:(id)a3;
- (void)addCellularPowerLogWCDMARABMode:(id)a3;
- (void)addCellularPowerLogWCDMARABType:(id)a3;
- (void)addCellularPowerLogWCDMARRCStateChange:(id)a3;
- (void)addCellularPowerLogWCDMARxDiversity:(id)a3;
- (void)addCellularPowerLogWCDMARxRSSI:(id)a3;
- (void)addCellularPowerLogWCDMATxPower:(id)a3;
- (void)addCellularPowerLogWLANUARTStates:(id)a3;
- (void)addCellularPowerLogWUS:(id)a3;
- (void)addCellularPowerLogXOShutdown:(id)a3;
- (void)clearCellularDynamicRatSelections;
- (void)clearCellularNrSDMActivations;
- (void)clearCellularNrSdmEndcReleases;
- (void)clearCellularPerClientProfileTriggerCounts;
- (void)clearCellularPowerLogAOPUARTStates;
- (void)clearCellularPowerLogAPPSCXOShutdowns;
- (void)clearCellularPowerLogAPPSPerfLevels;
- (void)clearCellularPowerLogAPPSSleepVetos;
- (void)clearCellularPowerLogCDMA1XRABModes;
- (void)clearCellularPowerLogCDMA1XRRCStateChanges;
- (void)clearCellularPowerLogCDMA1XRxDiversitys;
- (void)clearCellularPowerLogCDMA1XRxRSSIs;
- (void)clearCellularPowerLogCDMA1XTxPowers;
- (void)clearCellularPowerLogEVDORxDiversitys;
- (void)clearCellularPowerLogEVDORxRSSIs;
- (void)clearCellularPowerLogEVDOTxPowers;
- (void)clearCellularPowerLogGPSStates;
- (void)clearCellularPowerLogGSMRABModes;
- (void)clearCellularPowerLogGSMRRCStateChanges;
- (void)clearCellularPowerLogGSMRxDiversitys;
- (void)clearCellularPowerLogGSMRxRSSIs;
- (void)clearCellularPowerLogGSMTxPowers;
- (void)clearCellularPowerLogHybridRABModes;
- (void)clearCellularPowerLogHybridRRCStateChanges;
- (void)clearCellularPowerLogL1SleepStates;
- (void)clearCellularPowerLogLTEActivatedCASCCStates;
- (void)clearCellularPowerLogLTEAggregatedDLTBSs;
- (void)clearCellularPowerLogLTECDRXConfigs;
- (void)clearCellularPowerLogLTECarrierComponentInfos;
- (void)clearCellularPowerLogLTEConfiguredCASCCStates;
- (void)clearCellularPowerLogLTEPagingDRXCycles;
- (void)clearCellularPowerLogLTERRCStateChanges;
- (void)clearCellularPowerLogLTERSRPs;
- (void)clearCellularPowerLogLTERxDiversitys;
- (void)clearCellularPowerLogLTERxTxActivityStates;
- (void)clearCellularPowerLogLTESINRs;
- (void)clearCellularPowerLogLTETxPowers;
- (void)clearCellularPowerLogLTEULCAStates;
- (void)clearCellularPowerLogMCPMSleepVetos;
- (void)clearCellularPowerLogMPSSPerfLevels;
- (void)clearCellularPowerLogNRCDRXConfigs;
- (void)clearCellularPowerLogNRDCEvents;
- (void)clearCellularPowerLogNRFRCoverages;
- (void)clearCellularPowerLogNRMmWaveRSRPs;
- (void)clearCellularPowerLogNRMmWaveTxPowers;
- (void)clearCellularPowerLogNRMmWaveULCAStates;
- (void)clearCellularPowerLogNRNSAENDCEvents;
- (void)clearCellularPowerLogNRPagingDRXCycles;
- (void)clearCellularPowerLogNRSARRCStateChanges;
- (void)clearCellularPowerLogNRSCGRels;
- (void)clearCellularPowerLogNRmmWaveAntennaPanels;
- (void)clearCellularPowerLogNRmmWaveBWPSCCs;
- (void)clearCellularPowerLogNRmmWaveBWPs;
- (void)clearCellularPowerLogNRmmWaveBeamIDs;
- (void)clearCellularPowerLogNRmmWaveCASCCActivateds;
- (void)clearCellularPowerLogNRmmWaveCASCCConfigureds;
- (void)clearCellularPowerLogNRmmWaveCarrierComponentInfos;
- (void)clearCellularPowerLogNRmmWaveDLTBSs;
- (void)clearCellularPowerLogNRmmWaveRxTxs;
- (void)clearCellularPowerLogNRsub6BWPSAs;
- (void)clearCellularPowerLogNRsub6BWPSCCs;
- (void)clearCellularPowerLogNRsub6BWPs;
- (void)clearCellularPowerLogNRsub6CASCCActivateds;
- (void)clearCellularPowerLogNRsub6CASCCConfigureds;
- (void)clearCellularPowerLogNRsub6CarrierComponentInfos;
- (void)clearCellularPowerLogNRsub6DLTBSs;
- (void)clearCellularPowerLogNRsub6RSRPs;
- (void)clearCellularPowerLogNRsub6RxDiversitys;
- (void)clearCellularPowerLogNRsub6RxTxs;
- (void)clearCellularPowerLogNRsub6TxPowers;
- (void)clearCellularPowerLogNRsub6ULCAStates;
- (void)clearCellularPowerLogPCIeStates;
- (void)clearCellularPowerLogPLMNScanEvents;
- (void)clearCellularPowerLogPLMNSearchEvents;
- (void)clearCellularPowerLogPLMNSearchs;
- (void)clearCellularPowerLogPowerEstimators;
- (void)clearCellularPowerLogProtocolStates;
- (void)clearCellularPowerLogRATRedirectionEvents;
- (void)clearCellularPowerLogRATReselectionEvents;
- (void)clearCellularPowerLogRFTunerStatsHists;
- (void)clearCellularPowerLogSFTRxTxs;
- (void)clearCellularPowerLogSFTStates;
- (void)clearCellularPowerLogSPMIs;
- (void)clearCellularPowerLogServiceStateEvents;
- (void)clearCellularPowerLogSystemEvents;
- (void)clearCellularPowerLogWCDMACDRXConfigs;
- (void)clearCellularPowerLogWCDMARABModes;
- (void)clearCellularPowerLogWCDMARABTypes;
- (void)clearCellularPowerLogWCDMARRCStateChanges;
- (void)clearCellularPowerLogWCDMARxDiversitys;
- (void)clearCellularPowerLogWCDMARxRSSIs;
- (void)clearCellularPowerLogWCDMATxPowers;
- (void)clearCellularPowerLogWLANUARTStates;
- (void)clearCellularPowerLogWUSs;
- (void)clearCellularPowerLogXOShutdowns;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCellularDynamicRatSelections:(id)a3;
- (void)setCellularNrSDMActivations:(id)a3;
- (void)setCellularNrSdmEndcReleases:(id)a3;
- (void)setCellularPerClientProfileTriggerCounts:(id)a3;
- (void)setCellularPowerLogAOPUARTStates:(id)a3;
- (void)setCellularPowerLogAPPSCXOShutdowns:(id)a3;
- (void)setCellularPowerLogAPPSPerfLevels:(id)a3;
- (void)setCellularPowerLogAPPSSleepVetos:(id)a3;
- (void)setCellularPowerLogCDMA1XRABModes:(id)a3;
- (void)setCellularPowerLogCDMA1XRRCStateChanges:(id)a3;
- (void)setCellularPowerLogCDMA1XRxDiversitys:(id)a3;
- (void)setCellularPowerLogCDMA1XRxRSSIs:(id)a3;
- (void)setCellularPowerLogCDMA1XTxPowers:(id)a3;
- (void)setCellularPowerLogEVDORxDiversitys:(id)a3;
- (void)setCellularPowerLogEVDORxRSSIs:(id)a3;
- (void)setCellularPowerLogEVDOTxPowers:(id)a3;
- (void)setCellularPowerLogGPSStates:(id)a3;
- (void)setCellularPowerLogGSMRABModes:(id)a3;
- (void)setCellularPowerLogGSMRRCStateChanges:(id)a3;
- (void)setCellularPowerLogGSMRxDiversitys:(id)a3;
- (void)setCellularPowerLogGSMRxRSSIs:(id)a3;
- (void)setCellularPowerLogGSMTxPowers:(id)a3;
- (void)setCellularPowerLogHybridRABModes:(id)a3;
- (void)setCellularPowerLogHybridRRCStateChanges:(id)a3;
- (void)setCellularPowerLogL1SleepStates:(id)a3;
- (void)setCellularPowerLogLTEActivatedCASCCStates:(id)a3;
- (void)setCellularPowerLogLTEAggregatedDLTBSs:(id)a3;
- (void)setCellularPowerLogLTECDRXConfigs:(id)a3;
- (void)setCellularPowerLogLTECarrierComponentInfos:(id)a3;
- (void)setCellularPowerLogLTEConfiguredCASCCStates:(id)a3;
- (void)setCellularPowerLogLTEPagingDRXCycles:(id)a3;
- (void)setCellularPowerLogLTERRCStateChanges:(id)a3;
- (void)setCellularPowerLogLTERSRPs:(id)a3;
- (void)setCellularPowerLogLTERxDiversitys:(id)a3;
- (void)setCellularPowerLogLTERxTxActivityStates:(id)a3;
- (void)setCellularPowerLogLTESINRs:(id)a3;
- (void)setCellularPowerLogLTETxPowers:(id)a3;
- (void)setCellularPowerLogLTEULCAStates:(id)a3;
- (void)setCellularPowerLogMCPMSleepVetos:(id)a3;
- (void)setCellularPowerLogMPSSPerfLevels:(id)a3;
- (void)setCellularPowerLogNRCDRXConfigs:(id)a3;
- (void)setCellularPowerLogNRDCEvents:(id)a3;
- (void)setCellularPowerLogNRFRCoverages:(id)a3;
- (void)setCellularPowerLogNRMmWaveRSRPs:(id)a3;
- (void)setCellularPowerLogNRMmWaveTxPowers:(id)a3;
- (void)setCellularPowerLogNRMmWaveULCAStates:(id)a3;
- (void)setCellularPowerLogNRNSAENDCEvents:(id)a3;
- (void)setCellularPowerLogNRPagingDRXCycles:(id)a3;
- (void)setCellularPowerLogNRSARRCStateChanges:(id)a3;
- (void)setCellularPowerLogNRSCGRels:(id)a3;
- (void)setCellularPowerLogNRmmWaveAntennaPanels:(id)a3;
- (void)setCellularPowerLogNRmmWaveBWPSCCs:(id)a3;
- (void)setCellularPowerLogNRmmWaveBWPs:(id)a3;
- (void)setCellularPowerLogNRmmWaveBeamIDs:(id)a3;
- (void)setCellularPowerLogNRmmWaveCASCCActivateds:(id)a3;
- (void)setCellularPowerLogNRmmWaveCASCCConfigureds:(id)a3;
- (void)setCellularPowerLogNRmmWaveCarrierComponentInfos:(id)a3;
- (void)setCellularPowerLogNRmmWaveDLTBSs:(id)a3;
- (void)setCellularPowerLogNRmmWaveRxTxs:(id)a3;
- (void)setCellularPowerLogNRsub6BWPSAs:(id)a3;
- (void)setCellularPowerLogNRsub6BWPSCCs:(id)a3;
- (void)setCellularPowerLogNRsub6BWPs:(id)a3;
- (void)setCellularPowerLogNRsub6CASCCActivateds:(id)a3;
- (void)setCellularPowerLogNRsub6CASCCConfigureds:(id)a3;
- (void)setCellularPowerLogNRsub6CarrierComponentInfos:(id)a3;
- (void)setCellularPowerLogNRsub6DLTBSs:(id)a3;
- (void)setCellularPowerLogNRsub6RSRPs:(id)a3;
- (void)setCellularPowerLogNRsub6RxDiversitys:(id)a3;
- (void)setCellularPowerLogNRsub6RxTxs:(id)a3;
- (void)setCellularPowerLogNRsub6TxPowers:(id)a3;
- (void)setCellularPowerLogNRsub6ULCAStates:(id)a3;
- (void)setCellularPowerLogPCIeStates:(id)a3;
- (void)setCellularPowerLogPLMNScanEvents:(id)a3;
- (void)setCellularPowerLogPLMNSearchEvents:(id)a3;
- (void)setCellularPowerLogPLMNSearchs:(id)a3;
- (void)setCellularPowerLogPowerEstimators:(id)a3;
- (void)setCellularPowerLogProtocolStates:(id)a3;
- (void)setCellularPowerLogRATRedirectionEvents:(id)a3;
- (void)setCellularPowerLogRATReselectionEvents:(id)a3;
- (void)setCellularPowerLogRFTunerStatsHists:(id)a3;
- (void)setCellularPowerLogSFTRxTxs:(id)a3;
- (void)setCellularPowerLogSFTStates:(id)a3;
- (void)setCellularPowerLogSPMIs:(id)a3;
- (void)setCellularPowerLogServiceStateEvents:(id)a3;
- (void)setCellularPowerLogSystemEvents:(id)a3;
- (void)setCellularPowerLogWCDMACDRXConfigs:(id)a3;
- (void)setCellularPowerLogWCDMARABModes:(id)a3;
- (void)setCellularPowerLogWCDMARABTypes:(id)a3;
- (void)setCellularPowerLogWCDMARRCStateChanges:(id)a3;
- (void)setCellularPowerLogWCDMARxDiversitys:(id)a3;
- (void)setCellularPowerLogWCDMARxRSSIs:(id)a3;
- (void)setCellularPowerLogWCDMATxPowers:(id)a3;
- (void)setCellularPowerLogWLANUARTStates:(id)a3;
- (void)setCellularPowerLogWUSs:(id)a3;
- (void)setCellularPowerLogXOShutdowns:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDMETRICSCellularPowerLog

- (void)clearCellularPerClientProfileTriggerCounts
{
}

- (void)addCellularPerClientProfileTriggerCount:(id)a3
{
  id v4 = a3;
  cellularPerClientProfileTriggerCounts = self->_cellularPerClientProfileTriggerCounts;
  id v8 = v4;
  if (!cellularPerClientProfileTriggerCounts)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPerClientProfileTriggerCounts;
    self->_cellularPerClientProfileTriggerCounts = v6;

    id v4 = v8;
    cellularPerClientProfileTriggerCounts = self->_cellularPerClientProfileTriggerCounts;
  }
  [(NSMutableArray *)cellularPerClientProfileTriggerCounts addObject:v4];
}

- (unint64_t)cellularPerClientProfileTriggerCountsCount
{
  return [(NSMutableArray *)self->_cellularPerClientProfileTriggerCounts count];
}

- (id)cellularPerClientProfileTriggerCountAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPerClientProfileTriggerCounts objectAtIndex:a3];
}

+ (Class)cellularPerClientProfileTriggerCountType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogXOShutdowns
{
}

- (void)addCellularPowerLogXOShutdown:(id)a3
{
  id v4 = a3;
  cellularPowerLogXOShutdowns = self->_cellularPowerLogXOShutdowns;
  id v8 = v4;
  if (!cellularPowerLogXOShutdowns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogXOShutdowns;
    self->_cellularPowerLogXOShutdowns = v6;

    id v4 = v8;
    cellularPowerLogXOShutdowns = self->_cellularPowerLogXOShutdowns;
  }
  [(NSMutableArray *)cellularPowerLogXOShutdowns addObject:v4];
}

- (unint64_t)cellularPowerLogXOShutdownsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogXOShutdowns count];
}

- (id)cellularPowerLogXOShutdownAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogXOShutdowns objectAtIndex:a3];
}

+ (Class)cellularPowerLogXOShutdownType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogAPPSPerfLevels
{
}

- (void)addCellularPowerLogAPPSPerfLevels:(id)a3
{
  id v4 = a3;
  cellularPowerLogAPPSPerfLevels = self->_cellularPowerLogAPPSPerfLevels;
  id v8 = v4;
  if (!cellularPowerLogAPPSPerfLevels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogAPPSPerfLevels;
    self->_cellularPowerLogAPPSPerfLevels = v6;

    id v4 = v8;
    cellularPowerLogAPPSPerfLevels = self->_cellularPowerLogAPPSPerfLevels;
  }
  [(NSMutableArray *)cellularPowerLogAPPSPerfLevels addObject:v4];
}

- (unint64_t)cellularPowerLogAPPSPerfLevelsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogAPPSPerfLevels count];
}

- (id)cellularPowerLogAPPSPerfLevelsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogAPPSPerfLevels objectAtIndex:a3];
}

+ (Class)cellularPowerLogAPPSPerfLevelsType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogAPPSCXOShutdowns
{
}

- (void)addCellularPowerLogAPPSCXOShutdown:(id)a3
{
  id v4 = a3;
  cellularPowerLogAPPSCXOShutdowns = self->_cellularPowerLogAPPSCXOShutdowns;
  id v8 = v4;
  if (!cellularPowerLogAPPSCXOShutdowns)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogAPPSCXOShutdowns;
    self->_cellularPowerLogAPPSCXOShutdowns = v6;

    id v4 = v8;
    cellularPowerLogAPPSCXOShutdowns = self->_cellularPowerLogAPPSCXOShutdowns;
  }
  [(NSMutableArray *)cellularPowerLogAPPSCXOShutdowns addObject:v4];
}

- (unint64_t)cellularPowerLogAPPSCXOShutdownsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogAPPSCXOShutdowns count];
}

- (id)cellularPowerLogAPPSCXOShutdownAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogAPPSCXOShutdowns objectAtIndex:a3];
}

+ (Class)cellularPowerLogAPPSCXOShutdownType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogAPPSSleepVetos
{
}

- (void)addCellularPowerLogAPPSSleepVeto:(id)a3
{
  id v4 = a3;
  cellularPowerLogAPPSSleepVetos = self->_cellularPowerLogAPPSSleepVetos;
  id v8 = v4;
  if (!cellularPowerLogAPPSSleepVetos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogAPPSSleepVetos;
    self->_cellularPowerLogAPPSSleepVetos = v6;

    id v4 = v8;
    cellularPowerLogAPPSSleepVetos = self->_cellularPowerLogAPPSSleepVetos;
  }
  [(NSMutableArray *)cellularPowerLogAPPSSleepVetos addObject:v4];
}

- (unint64_t)cellularPowerLogAPPSSleepVetosCount
{
  return [(NSMutableArray *)self->_cellularPowerLogAPPSSleepVetos count];
}

- (id)cellularPowerLogAPPSSleepVetoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogAPPSSleepVetos objectAtIndex:a3];
}

+ (Class)cellularPowerLogAPPSSleepVetoType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogMCPMSleepVetos
{
}

- (void)addCellularPowerLogMCPMSleepVeto:(id)a3
{
  id v4 = a3;
  cellularPowerLogMCPMSleepVetos = self->_cellularPowerLogMCPMSleepVetos;
  id v8 = v4;
  if (!cellularPowerLogMCPMSleepVetos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogMCPMSleepVetos;
    self->_cellularPowerLogMCPMSleepVetos = v6;

    id v4 = v8;
    cellularPowerLogMCPMSleepVetos = self->_cellularPowerLogMCPMSleepVetos;
  }
  [(NSMutableArray *)cellularPowerLogMCPMSleepVetos addObject:v4];
}

- (unint64_t)cellularPowerLogMCPMSleepVetosCount
{
  return [(NSMutableArray *)self->_cellularPowerLogMCPMSleepVetos count];
}

- (id)cellularPowerLogMCPMSleepVetoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogMCPMSleepVetos objectAtIndex:a3];
}

+ (Class)cellularPowerLogMCPMSleepVetoType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogMPSSPerfLevels
{
}

- (void)addCellularPowerLogMPSSPerfLevels:(id)a3
{
  id v4 = a3;
  cellularPowerLogMPSSPerfLevels = self->_cellularPowerLogMPSSPerfLevels;
  id v8 = v4;
  if (!cellularPowerLogMPSSPerfLevels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogMPSSPerfLevels;
    self->_cellularPowerLogMPSSPerfLevels = v6;

    id v4 = v8;
    cellularPowerLogMPSSPerfLevels = self->_cellularPowerLogMPSSPerfLevels;
  }
  [(NSMutableArray *)cellularPowerLogMPSSPerfLevels addObject:v4];
}

- (unint64_t)cellularPowerLogMPSSPerfLevelsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogMPSSPerfLevels count];
}

- (id)cellularPowerLogMPSSPerfLevelsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogMPSSPerfLevels objectAtIndex:a3];
}

+ (Class)cellularPowerLogMPSSPerfLevelsType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogGPSStates
{
}

- (void)addCellularPowerLogGPSStates:(id)a3
{
  id v4 = a3;
  cellularPowerLogGPSStates = self->_cellularPowerLogGPSStates;
  id v8 = v4;
  if (!cellularPowerLogGPSStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogGPSStates;
    self->_cellularPowerLogGPSStates = v6;

    id v4 = v8;
    cellularPowerLogGPSStates = self->_cellularPowerLogGPSStates;
  }
  [(NSMutableArray *)cellularPowerLogGPSStates addObject:v4];
}

- (unint64_t)cellularPowerLogGPSStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogGPSStates count];
}

- (id)cellularPowerLogGPSStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogGPSStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogGPSStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogAOPUARTStates
{
}

- (void)addCellularPowerLogAOPUARTStates:(id)a3
{
  id v4 = a3;
  cellularPowerLogAOPUARTStates = self->_cellularPowerLogAOPUARTStates;
  id v8 = v4;
  if (!cellularPowerLogAOPUARTStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogAOPUARTStates;
    self->_cellularPowerLogAOPUARTStates = v6;

    id v4 = v8;
    cellularPowerLogAOPUARTStates = self->_cellularPowerLogAOPUARTStates;
  }
  [(NSMutableArray *)cellularPowerLogAOPUARTStates addObject:v4];
}

- (unint64_t)cellularPowerLogAOPUARTStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogAOPUARTStates count];
}

- (id)cellularPowerLogAOPUARTStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogAOPUARTStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogAOPUARTStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogWLANUARTStates
{
}

- (void)addCellularPowerLogWLANUARTStates:(id)a3
{
  id v4 = a3;
  cellularPowerLogWLANUARTStates = self->_cellularPowerLogWLANUARTStates;
  id v8 = v4;
  if (!cellularPowerLogWLANUARTStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogWLANUARTStates;
    self->_cellularPowerLogWLANUARTStates = v6;

    id v4 = v8;
    cellularPowerLogWLANUARTStates = self->_cellularPowerLogWLANUARTStates;
  }
  [(NSMutableArray *)cellularPowerLogWLANUARTStates addObject:v4];
}

- (unint64_t)cellularPowerLogWLANUARTStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogWLANUARTStates count];
}

- (id)cellularPowerLogWLANUARTStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogWLANUARTStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogWLANUARTStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogPCIeStates
{
}

- (void)addCellularPowerLogPCIeStates:(id)a3
{
  id v4 = a3;
  cellularPowerLogPCIeStates = self->_cellularPowerLogPCIeStates;
  id v8 = v4;
  if (!cellularPowerLogPCIeStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogPCIeStates;
    self->_cellularPowerLogPCIeStates = v6;

    id v4 = v8;
    cellularPowerLogPCIeStates = self->_cellularPowerLogPCIeStates;
  }
  [(NSMutableArray *)cellularPowerLogPCIeStates addObject:v4];
}

- (unint64_t)cellularPowerLogPCIeStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogPCIeStates count];
}

- (id)cellularPowerLogPCIeStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogPCIeStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogPCIeStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogL1SleepStates
{
}

- (void)addCellularPowerLogL1SleepStates:(id)a3
{
  id v4 = a3;
  cellularPowerLogL1SleepStates = self->_cellularPowerLogL1SleepStates;
  id v8 = v4;
  if (!cellularPowerLogL1SleepStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogL1SleepStates;
    self->_cellularPowerLogL1SleepStates = v6;

    id v4 = v8;
    cellularPowerLogL1SleepStates = self->_cellularPowerLogL1SleepStates;
  }
  [(NSMutableArray *)cellularPowerLogL1SleepStates addObject:v4];
}

- (unint64_t)cellularPowerLogL1SleepStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogL1SleepStates count];
}

- (id)cellularPowerLogL1SleepStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogL1SleepStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogL1SleepStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogPowerEstimators
{
}

- (void)addCellularPowerLogPowerEstimator:(id)a3
{
  id v4 = a3;
  cellularPowerLogPowerEstimators = self->_cellularPowerLogPowerEstimators;
  id v8 = v4;
  if (!cellularPowerLogPowerEstimators)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogPowerEstimators;
    self->_cellularPowerLogPowerEstimators = v6;

    id v4 = v8;
    cellularPowerLogPowerEstimators = self->_cellularPowerLogPowerEstimators;
  }
  [(NSMutableArray *)cellularPowerLogPowerEstimators addObject:v4];
}

- (unint64_t)cellularPowerLogPowerEstimatorsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogPowerEstimators count];
}

- (id)cellularPowerLogPowerEstimatorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogPowerEstimators objectAtIndex:a3];
}

+ (Class)cellularPowerLogPowerEstimatorType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogRFTunerStatsHists
{
}

- (void)addCellularPowerLogRFTunerStatsHist:(id)a3
{
  id v4 = a3;
  cellularPowerLogRFTunerStatsHists = self->_cellularPowerLogRFTunerStatsHists;
  id v8 = v4;
  if (!cellularPowerLogRFTunerStatsHists)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogRFTunerStatsHists;
    self->_cellularPowerLogRFTunerStatsHists = v6;

    id v4 = v8;
    cellularPowerLogRFTunerStatsHists = self->_cellularPowerLogRFTunerStatsHists;
  }
  [(NSMutableArray *)cellularPowerLogRFTunerStatsHists addObject:v4];
}

- (unint64_t)cellularPowerLogRFTunerStatsHistsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogRFTunerStatsHists count];
}

- (id)cellularPowerLogRFTunerStatsHistAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogRFTunerStatsHists objectAtIndex:a3];
}

+ (Class)cellularPowerLogRFTunerStatsHistType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogSPMIs
{
}

- (void)addCellularPowerLogSPMI:(id)a3
{
  id v4 = a3;
  cellularPowerLogSPMIs = self->_cellularPowerLogSPMIs;
  id v8 = v4;
  if (!cellularPowerLogSPMIs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogSPMIs;
    self->_cellularPowerLogSPMIs = v6;

    id v4 = v8;
    cellularPowerLogSPMIs = self->_cellularPowerLogSPMIs;
  }
  [(NSMutableArray *)cellularPowerLogSPMIs addObject:v4];
}

- (unint64_t)cellularPowerLogSPMIsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogSPMIs count];
}

- (id)cellularPowerLogSPMIAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogSPMIs objectAtIndex:a3];
}

+ (Class)cellularPowerLogSPMIType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTEConfiguredCASCCStates
{
}

- (void)addCellularPowerLogLTEConfiguredCASCCStates:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTEConfiguredCASCCStates = self->_cellularPowerLogLTEConfiguredCASCCStates;
  id v8 = v4;
  if (!cellularPowerLogLTEConfiguredCASCCStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTEConfiguredCASCCStates;
    self->_cellularPowerLogLTEConfiguredCASCCStates = v6;

    id v4 = v8;
    cellularPowerLogLTEConfiguredCASCCStates = self->_cellularPowerLogLTEConfiguredCASCCStates;
  }
  [(NSMutableArray *)cellularPowerLogLTEConfiguredCASCCStates addObject:v4];
}

- (unint64_t)cellularPowerLogLTEConfiguredCASCCStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTEConfiguredCASCCStates count];
}

- (id)cellularPowerLogLTEConfiguredCASCCStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTEConfiguredCASCCStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTEConfiguredCASCCStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTEActivatedCASCCStates
{
}

- (void)addCellularPowerLogLTEActivatedCASCCStates:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTEActivatedCASCCStates = self->_cellularPowerLogLTEActivatedCASCCStates;
  id v8 = v4;
  if (!cellularPowerLogLTEActivatedCASCCStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTEActivatedCASCCStates;
    self->_cellularPowerLogLTEActivatedCASCCStates = v6;

    id v4 = v8;
    cellularPowerLogLTEActivatedCASCCStates = self->_cellularPowerLogLTEActivatedCASCCStates;
  }
  [(NSMutableArray *)cellularPowerLogLTEActivatedCASCCStates addObject:v4];
}

- (unint64_t)cellularPowerLogLTEActivatedCASCCStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTEActivatedCASCCStates count];
}

- (id)cellularPowerLogLTEActivatedCASCCStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTEActivatedCASCCStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTEActivatedCASCCStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTERxTxActivityStates
{
}

- (void)addCellularPowerLogLTERxTxActivityStates:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTERxTxActivityStates = self->_cellularPowerLogLTERxTxActivityStates;
  id v8 = v4;
  if (!cellularPowerLogLTERxTxActivityStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTERxTxActivityStates;
    self->_cellularPowerLogLTERxTxActivityStates = v6;

    id v4 = v8;
    cellularPowerLogLTERxTxActivityStates = self->_cellularPowerLogLTERxTxActivityStates;
  }
  [(NSMutableArray *)cellularPowerLogLTERxTxActivityStates addObject:v4];
}

- (unint64_t)cellularPowerLogLTERxTxActivityStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTERxTxActivityStates count];
}

- (id)cellularPowerLogLTERxTxActivityStatesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTERxTxActivityStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTERxTxActivityStatesType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTECarrierComponentInfos
{
}

- (void)addCellularPowerLogLTECarrierComponentInfo:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTECarrierComponentInfos = self->_cellularPowerLogLTECarrierComponentInfos;
  id v8 = v4;
  if (!cellularPowerLogLTECarrierComponentInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTECarrierComponentInfos;
    self->_cellularPowerLogLTECarrierComponentInfos = v6;

    id v4 = v8;
    cellularPowerLogLTECarrierComponentInfos = self->_cellularPowerLogLTECarrierComponentInfos;
  }
  [(NSMutableArray *)cellularPowerLogLTECarrierComponentInfos addObject:v4];
}

- (unint64_t)cellularPowerLogLTECarrierComponentInfosCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTECarrierComponentInfos count];
}

- (id)cellularPowerLogLTECarrierComponentInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTECarrierComponentInfos objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTECarrierComponentInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTEAggregatedDLTBSs
{
}

- (void)addCellularPowerLogLTEAggregatedDLTBS:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTEAggregatedDLTBSs = self->_cellularPowerLogLTEAggregatedDLTBSs;
  id v8 = v4;
  if (!cellularPowerLogLTEAggregatedDLTBSs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTEAggregatedDLTBSs;
    self->_cellularPowerLogLTEAggregatedDLTBSs = v6;

    id v4 = v8;
    cellularPowerLogLTEAggregatedDLTBSs = self->_cellularPowerLogLTEAggregatedDLTBSs;
  }
  [(NSMutableArray *)cellularPowerLogLTEAggregatedDLTBSs addObject:v4];
}

- (unint64_t)cellularPowerLogLTEAggregatedDLTBSsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTEAggregatedDLTBSs count];
}

- (id)cellularPowerLogLTEAggregatedDLTBSAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTEAggregatedDLTBSs objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTEAggregatedDLTBSType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTERSRPs
{
}

- (void)addCellularPowerLogLTERSRP:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTERSRPs = self->_cellularPowerLogLTERSRPs;
  id v8 = v4;
  if (!cellularPowerLogLTERSRPs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTERSRPs;
    self->_cellularPowerLogLTERSRPs = v6;

    id v4 = v8;
    cellularPowerLogLTERSRPs = self->_cellularPowerLogLTERSRPs;
  }
  [(NSMutableArray *)cellularPowerLogLTERSRPs addObject:v4];
}

- (unint64_t)cellularPowerLogLTERSRPsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTERSRPs count];
}

- (id)cellularPowerLogLTERSRPAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTERSRPs objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTERSRPType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTESINRs
{
}

- (void)addCellularPowerLogLTESINR:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTESINRs = self->_cellularPowerLogLTESINRs;
  id v8 = v4;
  if (!cellularPowerLogLTESINRs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTESINRs;
    self->_cellularPowerLogLTESINRs = v6;

    id v4 = v8;
    cellularPowerLogLTESINRs = self->_cellularPowerLogLTESINRs;
  }
  [(NSMutableArray *)cellularPowerLogLTESINRs addObject:v4];
}

- (unint64_t)cellularPowerLogLTESINRsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTESINRs count];
}

- (id)cellularPowerLogLTESINRAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTESINRs objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTESINRType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTETxPowers
{
}

- (void)addCellularPowerLogLTETxPower:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTETxPowers = self->_cellularPowerLogLTETxPowers;
  id v8 = v4;
  if (!cellularPowerLogLTETxPowers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTETxPowers;
    self->_cellularPowerLogLTETxPowers = v6;

    id v4 = v8;
    cellularPowerLogLTETxPowers = self->_cellularPowerLogLTETxPowers;
  }
  [(NSMutableArray *)cellularPowerLogLTETxPowers addObject:v4];
}

- (unint64_t)cellularPowerLogLTETxPowersCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTETxPowers count];
}

- (id)cellularPowerLogLTETxPowerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTETxPowers objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTETxPowerType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTERxDiversitys
{
}

- (void)addCellularPowerLogLTERxDiversity:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTERxDiversitys = self->_cellularPowerLogLTERxDiversitys;
  id v8 = v4;
  if (!cellularPowerLogLTERxDiversitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTERxDiversitys;
    self->_cellularPowerLogLTERxDiversitys = v6;

    id v4 = v8;
    cellularPowerLogLTERxDiversitys = self->_cellularPowerLogLTERxDiversitys;
  }
  [(NSMutableArray *)cellularPowerLogLTERxDiversitys addObject:v4];
}

- (unint64_t)cellularPowerLogLTERxDiversitysCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTERxDiversitys count];
}

- (id)cellularPowerLogLTERxDiversityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTERxDiversitys objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTERxDiversityType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTEULCAStates
{
}

- (void)addCellularPowerLogLTEULCAState:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTEULCAStates = self->_cellularPowerLogLTEULCAStates;
  id v8 = v4;
  if (!cellularPowerLogLTEULCAStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTEULCAStates;
    self->_cellularPowerLogLTEULCAStates = v6;

    id v4 = v8;
    cellularPowerLogLTEULCAStates = self->_cellularPowerLogLTEULCAStates;
  }
  [(NSMutableArray *)cellularPowerLogLTEULCAStates addObject:v4];
}

- (unint64_t)cellularPowerLogLTEULCAStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTEULCAStates count];
}

- (id)cellularPowerLogLTEULCAStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTEULCAStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTEULCAStateType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogProtocolStates
{
}

- (void)addCellularPowerLogProtocolState:(id)a3
{
  id v4 = a3;
  cellularPowerLogProtocolStates = self->_cellularPowerLogProtocolStates;
  id v8 = v4;
  if (!cellularPowerLogProtocolStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogProtocolStates;
    self->_cellularPowerLogProtocolStates = v6;

    id v4 = v8;
    cellularPowerLogProtocolStates = self->_cellularPowerLogProtocolStates;
  }
  [(NSMutableArray *)cellularPowerLogProtocolStates addObject:v4];
}

- (unint64_t)cellularPowerLogProtocolStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogProtocolStates count];
}

- (id)cellularPowerLogProtocolStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogProtocolStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogProtocolStateType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogPLMNSearchs
{
}

- (void)addCellularPowerLogPLMNSearch:(id)a3
{
  id v4 = a3;
  cellularPowerLogPLMNSearchs = self->_cellularPowerLogPLMNSearchs;
  id v8 = v4;
  if (!cellularPowerLogPLMNSearchs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogPLMNSearchs;
    self->_cellularPowerLogPLMNSearchs = v6;

    id v4 = v8;
    cellularPowerLogPLMNSearchs = self->_cellularPowerLogPLMNSearchs;
  }
  [(NSMutableArray *)cellularPowerLogPLMNSearchs addObject:v4];
}

- (unint64_t)cellularPowerLogPLMNSearchsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogPLMNSearchs count];
}

- (id)cellularPowerLogPLMNSearchAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogPLMNSearchs objectAtIndex:a3];
}

+ (Class)cellularPowerLogPLMNSearchType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogGSMTxPowers
{
}

- (void)addCellularPowerLogGSMTxPower:(id)a3
{
  id v4 = a3;
  cellularPowerLogGSMTxPowers = self->_cellularPowerLogGSMTxPowers;
  id v8 = v4;
  if (!cellularPowerLogGSMTxPowers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogGSMTxPowers;
    self->_cellularPowerLogGSMTxPowers = v6;

    id v4 = v8;
    cellularPowerLogGSMTxPowers = self->_cellularPowerLogGSMTxPowers;
  }
  [(NSMutableArray *)cellularPowerLogGSMTxPowers addObject:v4];
}

- (unint64_t)cellularPowerLogGSMTxPowersCount
{
  return [(NSMutableArray *)self->_cellularPowerLogGSMTxPowers count];
}

- (id)cellularPowerLogGSMTxPowerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogGSMTxPowers objectAtIndex:a3];
}

+ (Class)cellularPowerLogGSMTxPowerType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogGSMRxRSSIs
{
}

- (void)addCellularPowerLogGSMRxRSSI:(id)a3
{
  id v4 = a3;
  cellularPowerLogGSMRxRSSIs = self->_cellularPowerLogGSMRxRSSIs;
  id v8 = v4;
  if (!cellularPowerLogGSMRxRSSIs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogGSMRxRSSIs;
    self->_cellularPowerLogGSMRxRSSIs = v6;

    id v4 = v8;
    cellularPowerLogGSMRxRSSIs = self->_cellularPowerLogGSMRxRSSIs;
  }
  [(NSMutableArray *)cellularPowerLogGSMRxRSSIs addObject:v4];
}

- (unint64_t)cellularPowerLogGSMRxRSSIsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogGSMRxRSSIs count];
}

- (id)cellularPowerLogGSMRxRSSIAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogGSMRxRSSIs objectAtIndex:a3];
}

+ (Class)cellularPowerLogGSMRxRSSIType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogGSMRABModes
{
}

- (void)addCellularPowerLogGSMRABMode:(id)a3
{
  id v4 = a3;
  cellularPowerLogGSMRABModes = self->_cellularPowerLogGSMRABModes;
  id v8 = v4;
  if (!cellularPowerLogGSMRABModes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogGSMRABModes;
    self->_cellularPowerLogGSMRABModes = v6;

    id v4 = v8;
    cellularPowerLogGSMRABModes = self->_cellularPowerLogGSMRABModes;
  }
  [(NSMutableArray *)cellularPowerLogGSMRABModes addObject:v4];
}

- (unint64_t)cellularPowerLogGSMRABModesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogGSMRABModes count];
}

- (id)cellularPowerLogGSMRABModeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogGSMRABModes objectAtIndex:a3];
}

+ (Class)cellularPowerLogGSMRABModeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogGSMRxDiversitys
{
}

- (void)addCellularPowerLogGSMRxDiversity:(id)a3
{
  id v4 = a3;
  cellularPowerLogGSMRxDiversitys = self->_cellularPowerLogGSMRxDiversitys;
  id v8 = v4;
  if (!cellularPowerLogGSMRxDiversitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogGSMRxDiversitys;
    self->_cellularPowerLogGSMRxDiversitys = v6;

    id v4 = v8;
    cellularPowerLogGSMRxDiversitys = self->_cellularPowerLogGSMRxDiversitys;
  }
  [(NSMutableArray *)cellularPowerLogGSMRxDiversitys addObject:v4];
}

- (unint64_t)cellularPowerLogGSMRxDiversitysCount
{
  return [(NSMutableArray *)self->_cellularPowerLogGSMRxDiversitys count];
}

- (id)cellularPowerLogGSMRxDiversityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogGSMRxDiversitys objectAtIndex:a3];
}

+ (Class)cellularPowerLogGSMRxDiversityType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogWCDMATxPowers
{
}

- (void)addCellularPowerLogWCDMATxPower:(id)a3
{
  id v4 = a3;
  cellularPowerLogWCDMATxPowers = self->_cellularPowerLogWCDMATxPowers;
  id v8 = v4;
  if (!cellularPowerLogWCDMATxPowers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogWCDMATxPowers;
    self->_cellularPowerLogWCDMATxPowers = v6;

    id v4 = v8;
    cellularPowerLogWCDMATxPowers = self->_cellularPowerLogWCDMATxPowers;
  }
  [(NSMutableArray *)cellularPowerLogWCDMATxPowers addObject:v4];
}

- (unint64_t)cellularPowerLogWCDMATxPowersCount
{
  return [(NSMutableArray *)self->_cellularPowerLogWCDMATxPowers count];
}

- (id)cellularPowerLogWCDMATxPowerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogWCDMATxPowers objectAtIndex:a3];
}

+ (Class)cellularPowerLogWCDMATxPowerType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogWCDMARxRSSIs
{
}

- (void)addCellularPowerLogWCDMARxRSSI:(id)a3
{
  id v4 = a3;
  cellularPowerLogWCDMARxRSSIs = self->_cellularPowerLogWCDMARxRSSIs;
  id v8 = v4;
  if (!cellularPowerLogWCDMARxRSSIs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogWCDMARxRSSIs;
    self->_cellularPowerLogWCDMARxRSSIs = v6;

    id v4 = v8;
    cellularPowerLogWCDMARxRSSIs = self->_cellularPowerLogWCDMARxRSSIs;
  }
  [(NSMutableArray *)cellularPowerLogWCDMARxRSSIs addObject:v4];
}

- (unint64_t)cellularPowerLogWCDMARxRSSIsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogWCDMARxRSSIs count];
}

- (id)cellularPowerLogWCDMARxRSSIAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogWCDMARxRSSIs objectAtIndex:a3];
}

+ (Class)cellularPowerLogWCDMARxRSSIType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogWCDMARxDiversitys
{
}

- (void)addCellularPowerLogWCDMARxDiversity:(id)a3
{
  id v4 = a3;
  cellularPowerLogWCDMARxDiversitys = self->_cellularPowerLogWCDMARxDiversitys;
  id v8 = v4;
  if (!cellularPowerLogWCDMARxDiversitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogWCDMARxDiversitys;
    self->_cellularPowerLogWCDMARxDiversitys = v6;

    id v4 = v8;
    cellularPowerLogWCDMARxDiversitys = self->_cellularPowerLogWCDMARxDiversitys;
  }
  [(NSMutableArray *)cellularPowerLogWCDMARxDiversitys addObject:v4];
}

- (unint64_t)cellularPowerLogWCDMARxDiversitysCount
{
  return [(NSMutableArray *)self->_cellularPowerLogWCDMARxDiversitys count];
}

- (id)cellularPowerLogWCDMARxDiversityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogWCDMARxDiversitys objectAtIndex:a3];
}

+ (Class)cellularPowerLogWCDMARxDiversityType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogWCDMARABModes
{
}

- (void)addCellularPowerLogWCDMARABMode:(id)a3
{
  id v4 = a3;
  cellularPowerLogWCDMARABModes = self->_cellularPowerLogWCDMARABModes;
  id v8 = v4;
  if (!cellularPowerLogWCDMARABModes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogWCDMARABModes;
    self->_cellularPowerLogWCDMARABModes = v6;

    id v4 = v8;
    cellularPowerLogWCDMARABModes = self->_cellularPowerLogWCDMARABModes;
  }
  [(NSMutableArray *)cellularPowerLogWCDMARABModes addObject:v4];
}

- (unint64_t)cellularPowerLogWCDMARABModesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogWCDMARABModes count];
}

- (id)cellularPowerLogWCDMARABModeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogWCDMARABModes objectAtIndex:a3];
}

+ (Class)cellularPowerLogWCDMARABModeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogWCDMARABTypes
{
}

- (void)addCellularPowerLogWCDMARABType:(id)a3
{
  id v4 = a3;
  cellularPowerLogWCDMARABTypes = self->_cellularPowerLogWCDMARABTypes;
  id v8 = v4;
  if (!cellularPowerLogWCDMARABTypes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogWCDMARABTypes;
    self->_cellularPowerLogWCDMARABTypes = v6;

    id v4 = v8;
    cellularPowerLogWCDMARABTypes = self->_cellularPowerLogWCDMARABTypes;
  }
  [(NSMutableArray *)cellularPowerLogWCDMARABTypes addObject:v4];
}

- (unint64_t)cellularPowerLogWCDMARABTypesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogWCDMARABTypes count];
}

- (id)cellularPowerLogWCDMARABTypeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogWCDMARABTypes objectAtIndex:a3];
}

+ (Class)cellularPowerLogWCDMARABTypeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogEVDOTxPowers
{
}

- (void)addCellularPowerLogEVDOTxPower:(id)a3
{
  id v4 = a3;
  cellularPowerLogEVDOTxPowers = self->_cellularPowerLogEVDOTxPowers;
  id v8 = v4;
  if (!cellularPowerLogEVDOTxPowers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogEVDOTxPowers;
    self->_cellularPowerLogEVDOTxPowers = v6;

    id v4 = v8;
    cellularPowerLogEVDOTxPowers = self->_cellularPowerLogEVDOTxPowers;
  }
  [(NSMutableArray *)cellularPowerLogEVDOTxPowers addObject:v4];
}

- (unint64_t)cellularPowerLogEVDOTxPowersCount
{
  return [(NSMutableArray *)self->_cellularPowerLogEVDOTxPowers count];
}

- (id)cellularPowerLogEVDOTxPowerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogEVDOTxPowers objectAtIndex:a3];
}

+ (Class)cellularPowerLogEVDOTxPowerType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogEVDORxRSSIs
{
}

- (void)addCellularPowerLogEVDORxRSSI:(id)a3
{
  id v4 = a3;
  cellularPowerLogEVDORxRSSIs = self->_cellularPowerLogEVDORxRSSIs;
  id v8 = v4;
  if (!cellularPowerLogEVDORxRSSIs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogEVDORxRSSIs;
    self->_cellularPowerLogEVDORxRSSIs = v6;

    id v4 = v8;
    cellularPowerLogEVDORxRSSIs = self->_cellularPowerLogEVDORxRSSIs;
  }
  [(NSMutableArray *)cellularPowerLogEVDORxRSSIs addObject:v4];
}

- (unint64_t)cellularPowerLogEVDORxRSSIsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogEVDORxRSSIs count];
}

- (id)cellularPowerLogEVDORxRSSIAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogEVDORxRSSIs objectAtIndex:a3];
}

+ (Class)cellularPowerLogEVDORxRSSIType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogHybridRABModes
{
}

- (void)addCellularPowerLogHybridRABMode:(id)a3
{
  id v4 = a3;
  cellularPowerLogHybridRABModes = self->_cellularPowerLogHybridRABModes;
  id v8 = v4;
  if (!cellularPowerLogHybridRABModes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogHybridRABModes;
    self->_cellularPowerLogHybridRABModes = v6;

    id v4 = v8;
    cellularPowerLogHybridRABModes = self->_cellularPowerLogHybridRABModes;
  }
  [(NSMutableArray *)cellularPowerLogHybridRABModes addObject:v4];
}

- (unint64_t)cellularPowerLogHybridRABModesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogHybridRABModes count];
}

- (id)cellularPowerLogHybridRABModeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogHybridRABModes objectAtIndex:a3];
}

+ (Class)cellularPowerLogHybridRABModeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogEVDORxDiversitys
{
}

- (void)addCellularPowerLogEVDORxDiversity:(id)a3
{
  id v4 = a3;
  cellularPowerLogEVDORxDiversitys = self->_cellularPowerLogEVDORxDiversitys;
  id v8 = v4;
  if (!cellularPowerLogEVDORxDiversitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogEVDORxDiversitys;
    self->_cellularPowerLogEVDORxDiversitys = v6;

    id v4 = v8;
    cellularPowerLogEVDORxDiversitys = self->_cellularPowerLogEVDORxDiversitys;
  }
  [(NSMutableArray *)cellularPowerLogEVDORxDiversitys addObject:v4];
}

- (unint64_t)cellularPowerLogEVDORxDiversitysCount
{
  return [(NSMutableArray *)self->_cellularPowerLogEVDORxDiversitys count];
}

- (id)cellularPowerLogEVDORxDiversityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogEVDORxDiversitys objectAtIndex:a3];
}

+ (Class)cellularPowerLogEVDORxDiversityType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogCDMA1XTxPowers
{
}

- (void)addCellularPowerLogCDMA1XTxPower:(id)a3
{
  id v4 = a3;
  cellularPowerLogCDMA1XTxPowers = self->_cellularPowerLogCDMA1XTxPowers;
  id v8 = v4;
  if (!cellularPowerLogCDMA1XTxPowers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogCDMA1XTxPowers;
    self->_cellularPowerLogCDMA1XTxPowers = v6;

    id v4 = v8;
    cellularPowerLogCDMA1XTxPowers = self->_cellularPowerLogCDMA1XTxPowers;
  }
  [(NSMutableArray *)cellularPowerLogCDMA1XTxPowers addObject:v4];
}

- (unint64_t)cellularPowerLogCDMA1XTxPowersCount
{
  return [(NSMutableArray *)self->_cellularPowerLogCDMA1XTxPowers count];
}

- (id)cellularPowerLogCDMA1XTxPowerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogCDMA1XTxPowers objectAtIndex:a3];
}

+ (Class)cellularPowerLogCDMA1XTxPowerType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogCDMA1XRxRSSIs
{
}

- (void)addCellularPowerLogCDMA1XRxRSSI:(id)a3
{
  id v4 = a3;
  cellularPowerLogCDMA1XRxRSSIs = self->_cellularPowerLogCDMA1XRxRSSIs;
  id v8 = v4;
  if (!cellularPowerLogCDMA1XRxRSSIs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogCDMA1XRxRSSIs;
    self->_cellularPowerLogCDMA1XRxRSSIs = v6;

    id v4 = v8;
    cellularPowerLogCDMA1XRxRSSIs = self->_cellularPowerLogCDMA1XRxRSSIs;
  }
  [(NSMutableArray *)cellularPowerLogCDMA1XRxRSSIs addObject:v4];
}

- (unint64_t)cellularPowerLogCDMA1XRxRSSIsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogCDMA1XRxRSSIs count];
}

- (id)cellularPowerLogCDMA1XRxRSSIAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogCDMA1XRxRSSIs objectAtIndex:a3];
}

+ (Class)cellularPowerLogCDMA1XRxRSSIType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogCDMA1XRABModes
{
}

- (void)addCellularPowerLogCDMA1XRABMode:(id)a3
{
  id v4 = a3;
  cellularPowerLogCDMA1XRABModes = self->_cellularPowerLogCDMA1XRABModes;
  id v8 = v4;
  if (!cellularPowerLogCDMA1XRABModes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogCDMA1XRABModes;
    self->_cellularPowerLogCDMA1XRABModes = v6;

    id v4 = v8;
    cellularPowerLogCDMA1XRABModes = self->_cellularPowerLogCDMA1XRABModes;
  }
  [(NSMutableArray *)cellularPowerLogCDMA1XRABModes addObject:v4];
}

- (unint64_t)cellularPowerLogCDMA1XRABModesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogCDMA1XRABModes count];
}

- (id)cellularPowerLogCDMA1XRABModeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogCDMA1XRABModes objectAtIndex:a3];
}

+ (Class)cellularPowerLogCDMA1XRABModeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogCDMA1XRxDiversitys
{
}

- (void)addCellularPowerLogCDMA1XRxDiversity:(id)a3
{
  id v4 = a3;
  cellularPowerLogCDMA1XRxDiversitys = self->_cellularPowerLogCDMA1XRxDiversitys;
  id v8 = v4;
  if (!cellularPowerLogCDMA1XRxDiversitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogCDMA1XRxDiversitys;
    self->_cellularPowerLogCDMA1XRxDiversitys = v6;

    id v4 = v8;
    cellularPowerLogCDMA1XRxDiversitys = self->_cellularPowerLogCDMA1XRxDiversitys;
  }
  [(NSMutableArray *)cellularPowerLogCDMA1XRxDiversitys addObject:v4];
}

- (unint64_t)cellularPowerLogCDMA1XRxDiversitysCount
{
  return [(NSMutableArray *)self->_cellularPowerLogCDMA1XRxDiversitys count];
}

- (id)cellularPowerLogCDMA1XRxDiversityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogCDMA1XRxDiversitys objectAtIndex:a3];
}

+ (Class)cellularPowerLogCDMA1XRxDiversityType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTEPagingDRXCycles
{
}

- (void)addCellularPowerLogLTEPagingDRXCycle:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTEPagingDRXCycles = self->_cellularPowerLogLTEPagingDRXCycles;
  id v8 = v4;
  if (!cellularPowerLogLTEPagingDRXCycles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTEPagingDRXCycles;
    self->_cellularPowerLogLTEPagingDRXCycles = v6;

    id v4 = v8;
    cellularPowerLogLTEPagingDRXCycles = self->_cellularPowerLogLTEPagingDRXCycles;
  }
  [(NSMutableArray *)cellularPowerLogLTEPagingDRXCycles addObject:v4];
}

- (unint64_t)cellularPowerLogLTEPagingDRXCyclesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTEPagingDRXCycles count];
}

- (id)cellularPowerLogLTEPagingDRXCycleAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTEPagingDRXCycles objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTEPagingDRXCycleType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRPagingDRXCycles
{
}

- (void)addCellularPowerLogNRPagingDRXCycle:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRPagingDRXCycles = self->_cellularPowerLogNRPagingDRXCycles;
  id v8 = v4;
  if (!cellularPowerLogNRPagingDRXCycles)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRPagingDRXCycles;
    self->_cellularPowerLogNRPagingDRXCycles = v6;

    id v4 = v8;
    cellularPowerLogNRPagingDRXCycles = self->_cellularPowerLogNRPagingDRXCycles;
  }
  [(NSMutableArray *)cellularPowerLogNRPagingDRXCycles addObject:v4];
}

- (unint64_t)cellularPowerLogNRPagingDRXCyclesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRPagingDRXCycles count];
}

- (id)cellularPowerLogNRPagingDRXCycleAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRPagingDRXCycles objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRPagingDRXCycleType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRSCGRels
{
}

- (void)addCellularPowerLogNRSCGRel:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRSCGRels = self->_cellularPowerLogNRSCGRels;
  id v8 = v4;
  if (!cellularPowerLogNRSCGRels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRSCGRels;
    self->_cellularPowerLogNRSCGRels = v6;

    id v4 = v8;
    cellularPowerLogNRSCGRels = self->_cellularPowerLogNRSCGRels;
  }
  [(NSMutableArray *)cellularPowerLogNRSCGRels addObject:v4];
}

- (unint64_t)cellularPowerLogNRSCGRelsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRSCGRels count];
}

- (id)cellularPowerLogNRSCGRelAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRSCGRels objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRSCGRelType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogWCDMACDRXConfigs
{
}

- (void)addCellularPowerLogWCDMACDRXConfig:(id)a3
{
  id v4 = a3;
  cellularPowerLogWCDMACDRXConfigs = self->_cellularPowerLogWCDMACDRXConfigs;
  id v8 = v4;
  if (!cellularPowerLogWCDMACDRXConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogWCDMACDRXConfigs;
    self->_cellularPowerLogWCDMACDRXConfigs = v6;

    id v4 = v8;
    cellularPowerLogWCDMACDRXConfigs = self->_cellularPowerLogWCDMACDRXConfigs;
  }
  [(NSMutableArray *)cellularPowerLogWCDMACDRXConfigs addObject:v4];
}

- (unint64_t)cellularPowerLogWCDMACDRXConfigsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogWCDMACDRXConfigs count];
}

- (id)cellularPowerLogWCDMACDRXConfigAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogWCDMACDRXConfigs objectAtIndex:a3];
}

+ (Class)cellularPowerLogWCDMACDRXConfigType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTECDRXConfigs
{
}

- (void)addCellularPowerLogLTECDRXConfig:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTECDRXConfigs = self->_cellularPowerLogLTECDRXConfigs;
  id v8 = v4;
  if (!cellularPowerLogLTECDRXConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTECDRXConfigs;
    self->_cellularPowerLogLTECDRXConfigs = v6;

    id v4 = v8;
    cellularPowerLogLTECDRXConfigs = self->_cellularPowerLogLTECDRXConfigs;
  }
  [(NSMutableArray *)cellularPowerLogLTECDRXConfigs addObject:v4];
}

- (unint64_t)cellularPowerLogLTECDRXConfigsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTECDRXConfigs count];
}

- (id)cellularPowerLogLTECDRXConfigAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTECDRXConfigs objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTECDRXConfigType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogWCDMARRCStateChanges
{
}

- (void)addCellularPowerLogWCDMARRCStateChange:(id)a3
{
  id v4 = a3;
  cellularPowerLogWCDMARRCStateChanges = self->_cellularPowerLogWCDMARRCStateChanges;
  id v8 = v4;
  if (!cellularPowerLogWCDMARRCStateChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogWCDMARRCStateChanges;
    self->_cellularPowerLogWCDMARRCStateChanges = v6;

    id v4 = v8;
    cellularPowerLogWCDMARRCStateChanges = self->_cellularPowerLogWCDMARRCStateChanges;
  }
  [(NSMutableArray *)cellularPowerLogWCDMARRCStateChanges addObject:v4];
}

- (unint64_t)cellularPowerLogWCDMARRCStateChangesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogWCDMARRCStateChanges count];
}

- (id)cellularPowerLogWCDMARRCStateChangeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogWCDMARRCStateChanges objectAtIndex:a3];
}

+ (Class)cellularPowerLogWCDMARRCStateChangeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogLTERRCStateChanges
{
}

- (void)addCellularPowerLogLTERRCStateChange:(id)a3
{
  id v4 = a3;
  cellularPowerLogLTERRCStateChanges = self->_cellularPowerLogLTERRCStateChanges;
  id v8 = v4;
  if (!cellularPowerLogLTERRCStateChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogLTERRCStateChanges;
    self->_cellularPowerLogLTERRCStateChanges = v6;

    id v4 = v8;
    cellularPowerLogLTERRCStateChanges = self->_cellularPowerLogLTERRCStateChanges;
  }
  [(NSMutableArray *)cellularPowerLogLTERRCStateChanges addObject:v4];
}

- (unint64_t)cellularPowerLogLTERRCStateChangesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogLTERRCStateChanges count];
}

- (id)cellularPowerLogLTERRCStateChangeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogLTERRCStateChanges objectAtIndex:a3];
}

+ (Class)cellularPowerLogLTERRCStateChangeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogSystemEvents
{
}

- (void)addCellularPowerLogSystemEvent:(id)a3
{
  id v4 = a3;
  cellularPowerLogSystemEvents = self->_cellularPowerLogSystemEvents;
  id v8 = v4;
  if (!cellularPowerLogSystemEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogSystemEvents;
    self->_cellularPowerLogSystemEvents = v6;

    id v4 = v8;
    cellularPowerLogSystemEvents = self->_cellularPowerLogSystemEvents;
  }
  [(NSMutableArray *)cellularPowerLogSystemEvents addObject:v4];
}

- (unint64_t)cellularPowerLogSystemEventsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogSystemEvents count];
}

- (id)cellularPowerLogSystemEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogSystemEvents objectAtIndex:a3];
}

+ (Class)cellularPowerLogSystemEventType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogRATReselectionEvents
{
}

- (void)addCellularPowerLogRATReselectionEvent:(id)a3
{
  id v4 = a3;
  cellularPowerLogRATReselectionEvents = self->_cellularPowerLogRATReselectionEvents;
  id v8 = v4;
  if (!cellularPowerLogRATReselectionEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogRATReselectionEvents;
    self->_cellularPowerLogRATReselectionEvents = v6;

    id v4 = v8;
    cellularPowerLogRATReselectionEvents = self->_cellularPowerLogRATReselectionEvents;
  }
  [(NSMutableArray *)cellularPowerLogRATReselectionEvents addObject:v4];
}

- (unint64_t)cellularPowerLogRATReselectionEventsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogRATReselectionEvents count];
}

- (id)cellularPowerLogRATReselectionEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogRATReselectionEvents objectAtIndex:a3];
}

+ (Class)cellularPowerLogRATReselectionEventType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogRATRedirectionEvents
{
}

- (void)addCellularPowerLogRATRedirectionEvent:(id)a3
{
  id v4 = a3;
  cellularPowerLogRATRedirectionEvents = self->_cellularPowerLogRATRedirectionEvents;
  id v8 = v4;
  if (!cellularPowerLogRATRedirectionEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogRATRedirectionEvents;
    self->_cellularPowerLogRATRedirectionEvents = v6;

    id v4 = v8;
    cellularPowerLogRATRedirectionEvents = self->_cellularPowerLogRATRedirectionEvents;
  }
  [(NSMutableArray *)cellularPowerLogRATRedirectionEvents addObject:v4];
}

- (unint64_t)cellularPowerLogRATRedirectionEventsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogRATRedirectionEvents count];
}

- (id)cellularPowerLogRATRedirectionEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogRATRedirectionEvents objectAtIndex:a3];
}

+ (Class)cellularPowerLogRATRedirectionEventType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogGSMRRCStateChanges
{
}

- (void)addCellularPowerLogGSMRRCStateChange:(id)a3
{
  id v4 = a3;
  cellularPowerLogGSMRRCStateChanges = self->_cellularPowerLogGSMRRCStateChanges;
  id v8 = v4;
  if (!cellularPowerLogGSMRRCStateChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogGSMRRCStateChanges;
    self->_cellularPowerLogGSMRRCStateChanges = v6;

    id v4 = v8;
    cellularPowerLogGSMRRCStateChanges = self->_cellularPowerLogGSMRRCStateChanges;
  }
  [(NSMutableArray *)cellularPowerLogGSMRRCStateChanges addObject:v4];
}

- (unint64_t)cellularPowerLogGSMRRCStateChangesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogGSMRRCStateChanges count];
}

- (id)cellularPowerLogGSMRRCStateChangeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogGSMRRCStateChanges objectAtIndex:a3];
}

+ (Class)cellularPowerLogGSMRRCStateChangeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogCDMA1XRRCStateChanges
{
}

- (void)addCellularPowerLogCDMA1XRRCStateChange:(id)a3
{
  id v4 = a3;
  cellularPowerLogCDMA1XRRCStateChanges = self->_cellularPowerLogCDMA1XRRCStateChanges;
  id v8 = v4;
  if (!cellularPowerLogCDMA1XRRCStateChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogCDMA1XRRCStateChanges;
    self->_cellularPowerLogCDMA1XRRCStateChanges = v6;

    id v4 = v8;
    cellularPowerLogCDMA1XRRCStateChanges = self->_cellularPowerLogCDMA1XRRCStateChanges;
  }
  [(NSMutableArray *)cellularPowerLogCDMA1XRRCStateChanges addObject:v4];
}

- (unint64_t)cellularPowerLogCDMA1XRRCStateChangesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogCDMA1XRRCStateChanges count];
}

- (id)cellularPowerLogCDMA1XRRCStateChangeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogCDMA1XRRCStateChanges objectAtIndex:a3];
}

+ (Class)cellularPowerLogCDMA1XRRCStateChangeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogHybridRRCStateChanges
{
}

- (void)addCellularPowerLogHybridRRCStateChange:(id)a3
{
  id v4 = a3;
  cellularPowerLogHybridRRCStateChanges = self->_cellularPowerLogHybridRRCStateChanges;
  id v8 = v4;
  if (!cellularPowerLogHybridRRCStateChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogHybridRRCStateChanges;
    self->_cellularPowerLogHybridRRCStateChanges = v6;

    id v4 = v8;
    cellularPowerLogHybridRRCStateChanges = self->_cellularPowerLogHybridRRCStateChanges;
  }
  [(NSMutableArray *)cellularPowerLogHybridRRCStateChanges addObject:v4];
}

- (unint64_t)cellularPowerLogHybridRRCStateChangesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogHybridRRCStateChanges count];
}

- (id)cellularPowerLogHybridRRCStateChangeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogHybridRRCStateChanges objectAtIndex:a3];
}

+ (Class)cellularPowerLogHybridRRCStateChangeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogServiceStateEvents
{
}

- (void)addCellularPowerLogServiceStateEvent:(id)a3
{
  id v4 = a3;
  cellularPowerLogServiceStateEvents = self->_cellularPowerLogServiceStateEvents;
  id v8 = v4;
  if (!cellularPowerLogServiceStateEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogServiceStateEvents;
    self->_cellularPowerLogServiceStateEvents = v6;

    id v4 = v8;
    cellularPowerLogServiceStateEvents = self->_cellularPowerLogServiceStateEvents;
  }
  [(NSMutableArray *)cellularPowerLogServiceStateEvents addObject:v4];
}

- (unint64_t)cellularPowerLogServiceStateEventsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogServiceStateEvents count];
}

- (id)cellularPowerLogServiceStateEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogServiceStateEvents objectAtIndex:a3];
}

+ (Class)cellularPowerLogServiceStateEventType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogPLMNScanEvents
{
}

- (void)addCellularPowerLogPLMNScanEvent:(id)a3
{
  id v4 = a3;
  cellularPowerLogPLMNScanEvents = self->_cellularPowerLogPLMNScanEvents;
  id v8 = v4;
  if (!cellularPowerLogPLMNScanEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogPLMNScanEvents;
    self->_cellularPowerLogPLMNScanEvents = v6;

    id v4 = v8;
    cellularPowerLogPLMNScanEvents = self->_cellularPowerLogPLMNScanEvents;
  }
  [(NSMutableArray *)cellularPowerLogPLMNScanEvents addObject:v4];
}

- (unint64_t)cellularPowerLogPLMNScanEventsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogPLMNScanEvents count];
}

- (id)cellularPowerLogPLMNScanEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogPLMNScanEvents objectAtIndex:a3];
}

+ (Class)cellularPowerLogPLMNScanEventType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogPLMNSearchEvents
{
}

- (void)addCellularPowerLogPLMNSearchEvent:(id)a3
{
  id v4 = a3;
  cellularPowerLogPLMNSearchEvents = self->_cellularPowerLogPLMNSearchEvents;
  id v8 = v4;
  if (!cellularPowerLogPLMNSearchEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogPLMNSearchEvents;
    self->_cellularPowerLogPLMNSearchEvents = v6;

    id v4 = v8;
    cellularPowerLogPLMNSearchEvents = self->_cellularPowerLogPLMNSearchEvents;
  }
  [(NSMutableArray *)cellularPowerLogPLMNSearchEvents addObject:v4];
}

- (unint64_t)cellularPowerLogPLMNSearchEventsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogPLMNSearchEvents count];
}

- (id)cellularPowerLogPLMNSearchEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogPLMNSearchEvents objectAtIndex:a3];
}

+ (Class)cellularPowerLogPLMNSearchEventType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRSARRCStateChanges
{
}

- (void)addCellularPowerLogNRSARRCStateChange:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRSARRCStateChanges = self->_cellularPowerLogNRSARRCStateChanges;
  id v8 = v4;
  if (!cellularPowerLogNRSARRCStateChanges)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRSARRCStateChanges;
    self->_cellularPowerLogNRSARRCStateChanges = v6;

    id v4 = v8;
    cellularPowerLogNRSARRCStateChanges = self->_cellularPowerLogNRSARRCStateChanges;
  }
  [(NSMutableArray *)cellularPowerLogNRSARRCStateChanges addObject:v4];
}

- (unint64_t)cellularPowerLogNRSARRCStateChangesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRSARRCStateChanges count];
}

- (id)cellularPowerLogNRSARRCStateChangeAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRSARRCStateChanges objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRSARRCStateChangeType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRNSAENDCEvents
{
}

- (void)addCellularPowerLogNRNSAENDCEvent:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRNSAENDCEvents = self->_cellularPowerLogNRNSAENDCEvents;
  id v8 = v4;
  if (!cellularPowerLogNRNSAENDCEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRNSAENDCEvents;
    self->_cellularPowerLogNRNSAENDCEvents = v6;

    id v4 = v8;
    cellularPowerLogNRNSAENDCEvents = self->_cellularPowerLogNRNSAENDCEvents;
  }
  [(NSMutableArray *)cellularPowerLogNRNSAENDCEvents addObject:v4];
}

- (unint64_t)cellularPowerLogNRNSAENDCEventsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRNSAENDCEvents count];
}

- (id)cellularPowerLogNRNSAENDCEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRNSAENDCEvents objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRNSAENDCEventType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRCDRXConfigs
{
}

- (void)addCellularPowerLogNRCDRXConfig:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRCDRXConfigs = self->_cellularPowerLogNRCDRXConfigs;
  id v8 = v4;
  if (!cellularPowerLogNRCDRXConfigs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRCDRXConfigs;
    self->_cellularPowerLogNRCDRXConfigs = v6;

    id v4 = v8;
    cellularPowerLogNRCDRXConfigs = self->_cellularPowerLogNRCDRXConfigs;
  }
  [(NSMutableArray *)cellularPowerLogNRCDRXConfigs addObject:v4];
}

- (unint64_t)cellularPowerLogNRCDRXConfigsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRCDRXConfigs count];
}

- (id)cellularPowerLogNRCDRXConfigAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRCDRXConfigs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRCDRXConfigType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularNrSDMActivations
{
}

- (void)addCellularNrSDMActivation:(id)a3
{
  id v4 = a3;
  cellularNrSDMActivations = self->_cellularNrSDMActivations;
  id v8 = v4;
  if (!cellularNrSDMActivations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularNrSDMActivations;
    self->_cellularNrSDMActivations = v6;

    id v4 = v8;
    cellularNrSDMActivations = self->_cellularNrSDMActivations;
  }
  [(NSMutableArray *)cellularNrSDMActivations addObject:v4];
}

- (unint64_t)cellularNrSDMActivationsCount
{
  return [(NSMutableArray *)self->_cellularNrSDMActivations count];
}

- (id)cellularNrSDMActivationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularNrSDMActivations objectAtIndex:a3];
}

+ (Class)cellularNrSDMActivationType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularNrSdmEndcReleases
{
}

- (void)addCellularNrSdmEndcRelease:(id)a3
{
  id v4 = a3;
  cellularNrSdmEndcReleases = self->_cellularNrSdmEndcReleases;
  id v8 = v4;
  if (!cellularNrSdmEndcReleases)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularNrSdmEndcReleases;
    self->_cellularNrSdmEndcReleases = v6;

    id v4 = v8;
    cellularNrSdmEndcReleases = self->_cellularNrSdmEndcReleases;
  }
  [(NSMutableArray *)cellularNrSdmEndcReleases addObject:v4];
}

- (unint64_t)cellularNrSdmEndcReleasesCount
{
  return [(NSMutableArray *)self->_cellularNrSdmEndcReleases count];
}

- (id)cellularNrSdmEndcReleaseAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularNrSdmEndcReleases objectAtIndex:a3];
}

+ (Class)cellularNrSdmEndcReleaseType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRFRCoverages
{
}

- (void)addCellularPowerLogNRFRCoverage:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRFRCoverages = self->_cellularPowerLogNRFRCoverages;
  id v8 = v4;
  if (!cellularPowerLogNRFRCoverages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRFRCoverages;
    self->_cellularPowerLogNRFRCoverages = v6;

    id v4 = v8;
    cellularPowerLogNRFRCoverages = self->_cellularPowerLogNRFRCoverages;
  }
  [(NSMutableArray *)cellularPowerLogNRFRCoverages addObject:v4];
}

- (unint64_t)cellularPowerLogNRFRCoveragesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRFRCoverages count];
}

- (id)cellularPowerLogNRFRCoverageAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRFRCoverages objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRFRCoverageType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRDCEvents
{
}

- (void)addCellularPowerLogNRDCEvent:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRDCEvents = self->_cellularPowerLogNRDCEvents;
  id v8 = v4;
  if (!cellularPowerLogNRDCEvents)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRDCEvents;
    self->_cellularPowerLogNRDCEvents = v6;

    id v4 = v8;
    cellularPowerLogNRDCEvents = self->_cellularPowerLogNRDCEvents;
  }
  [(NSMutableArray *)cellularPowerLogNRDCEvents addObject:v4];
}

- (unint64_t)cellularPowerLogNRDCEventsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRDCEvents count];
}

- (id)cellularPowerLogNRDCEventAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRDCEvents objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRDCEventType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularDynamicRatSelections
{
}

- (void)addCellularDynamicRatSelection:(id)a3
{
  id v4 = a3;
  cellularDynamicRatSelections = self->_cellularDynamicRatSelections;
  id v8 = v4;
  if (!cellularDynamicRatSelections)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularDynamicRatSelections;
    self->_cellularDynamicRatSelections = v6;

    id v4 = v8;
    cellularDynamicRatSelections = self->_cellularDynamicRatSelections;
  }
  [(NSMutableArray *)cellularDynamicRatSelections addObject:v4];
}

- (unint64_t)cellularDynamicRatSelectionsCount
{
  return [(NSMutableArray *)self->_cellularDynamicRatSelections count];
}

- (id)cellularDynamicRatSelectionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularDynamicRatSelections objectAtIndex:a3];
}

+ (Class)cellularDynamicRatSelectionType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogWUSs
{
}

- (void)addCellularPowerLogWUS:(id)a3
{
  id v4 = a3;
  cellularPowerLogWUSs = self->_cellularPowerLogWUSs;
  id v8 = v4;
  if (!cellularPowerLogWUSs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogWUSs;
    self->_cellularPowerLogWUSs = v6;

    id v4 = v8;
    cellularPowerLogWUSs = self->_cellularPowerLogWUSs;
  }
  [(NSMutableArray *)cellularPowerLogWUSs addObject:v4];
}

- (unint64_t)cellularPowerLogWUSsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogWUSs count];
}

- (id)cellularPowerLogWUSAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogWUSs objectAtIndex:a3];
}

+ (Class)cellularPowerLogWUSType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6BWPs
{
}

- (void)addCellularPowerLogNRsub6BWP:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6BWPs = self->_cellularPowerLogNRsub6BWPs;
  id v8 = v4;
  if (!cellularPowerLogNRsub6BWPs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6BWPs;
    self->_cellularPowerLogNRsub6BWPs = v6;

    id v4 = v8;
    cellularPowerLogNRsub6BWPs = self->_cellularPowerLogNRsub6BWPs;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6BWPs addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6BWPsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6BWPs count];
}

- (id)cellularPowerLogNRsub6BWPAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6BWPs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6BWPType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6CASCCConfigureds
{
}

- (void)addCellularPowerLogNRsub6CASCCConfigured:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6CASCCConfigureds = self->_cellularPowerLogNRsub6CASCCConfigureds;
  id v8 = v4;
  if (!cellularPowerLogNRsub6CASCCConfigureds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6CASCCConfigureds;
    self->_cellularPowerLogNRsub6CASCCConfigureds = v6;

    id v4 = v8;
    cellularPowerLogNRsub6CASCCConfigureds = self->_cellularPowerLogNRsub6CASCCConfigureds;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6CASCCConfigureds addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6CASCCConfiguredsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6CASCCConfigureds count];
}

- (id)cellularPowerLogNRsub6CASCCConfiguredAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6CASCCConfigureds objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6CASCCConfiguredType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6CASCCActivateds
{
}

- (void)addCellularPowerLogNRsub6CASCCActivated:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6CASCCActivateds = self->_cellularPowerLogNRsub6CASCCActivateds;
  id v8 = v4;
  if (!cellularPowerLogNRsub6CASCCActivateds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6CASCCActivateds;
    self->_cellularPowerLogNRsub6CASCCActivateds = v6;

    id v4 = v8;
    cellularPowerLogNRsub6CASCCActivateds = self->_cellularPowerLogNRsub6CASCCActivateds;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6CASCCActivateds addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6CASCCActivatedsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6CASCCActivateds count];
}

- (id)cellularPowerLogNRsub6CASCCActivatedAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6CASCCActivateds objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6CASCCActivatedType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6RxTxs
{
}

- (void)addCellularPowerLogNRsub6RxTx:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6RxTxs = self->_cellularPowerLogNRsub6RxTxs;
  id v8 = v4;
  if (!cellularPowerLogNRsub6RxTxs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6RxTxs;
    self->_cellularPowerLogNRsub6RxTxs = v6;

    id v4 = v8;
    cellularPowerLogNRsub6RxTxs = self->_cellularPowerLogNRsub6RxTxs;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6RxTxs addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6RxTxsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6RxTxs count];
}

- (id)cellularPowerLogNRsub6RxTxAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6RxTxs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6RxTxType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6CarrierComponentInfos
{
}

- (void)addCellularPowerLogNRsub6CarrierComponentInfo:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6CarrierComponentInfos = self->_cellularPowerLogNRsub6CarrierComponentInfos;
  id v8 = v4;
  if (!cellularPowerLogNRsub6CarrierComponentInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6CarrierComponentInfos;
    self->_cellularPowerLogNRsub6CarrierComponentInfos = v6;

    id v4 = v8;
    cellularPowerLogNRsub6CarrierComponentInfos = self->_cellularPowerLogNRsub6CarrierComponentInfos;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6CarrierComponentInfos addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6CarrierComponentInfosCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6CarrierComponentInfos count];
}

- (id)cellularPowerLogNRsub6CarrierComponentInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6CarrierComponentInfos objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6CarrierComponentInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6DLTBSs
{
}

- (void)addCellularPowerLogNRsub6DLTBS:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6DLTBSs = self->_cellularPowerLogNRsub6DLTBSs;
  id v8 = v4;
  if (!cellularPowerLogNRsub6DLTBSs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6DLTBSs;
    self->_cellularPowerLogNRsub6DLTBSs = v6;

    id v4 = v8;
    cellularPowerLogNRsub6DLTBSs = self->_cellularPowerLogNRsub6DLTBSs;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6DLTBSs addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6DLTBSsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6DLTBSs count];
}

- (id)cellularPowerLogNRsub6DLTBSAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6DLTBSs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6DLTBSType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6RSRPs
{
}

- (void)addCellularPowerLogNRsub6RSRP:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6RSRPs = self->_cellularPowerLogNRsub6RSRPs;
  id v8 = v4;
  if (!cellularPowerLogNRsub6RSRPs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6RSRPs;
    self->_cellularPowerLogNRsub6RSRPs = v6;

    id v4 = v8;
    cellularPowerLogNRsub6RSRPs = self->_cellularPowerLogNRsub6RSRPs;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6RSRPs addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6RSRPsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6RSRPs count];
}

- (id)cellularPowerLogNRsub6RSRPAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6RSRPs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6RSRPType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6ULCAStates
{
}

- (void)addCellularPowerLogNRsub6ULCAState:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6ULCAStates = self->_cellularPowerLogNRsub6ULCAStates;
  id v8 = v4;
  if (!cellularPowerLogNRsub6ULCAStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6ULCAStates;
    self->_cellularPowerLogNRsub6ULCAStates = v6;

    id v4 = v8;
    cellularPowerLogNRsub6ULCAStates = self->_cellularPowerLogNRsub6ULCAStates;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6ULCAStates addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6ULCAStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6ULCAStates count];
}

- (id)cellularPowerLogNRsub6ULCAStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6ULCAStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6ULCAStateType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6TxPowers
{
}

- (void)addCellularPowerLogNRsub6TxPower:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6TxPowers = self->_cellularPowerLogNRsub6TxPowers;
  id v8 = v4;
  if (!cellularPowerLogNRsub6TxPowers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6TxPowers;
    self->_cellularPowerLogNRsub6TxPowers = v6;

    id v4 = v8;
    cellularPowerLogNRsub6TxPowers = self->_cellularPowerLogNRsub6TxPowers;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6TxPowers addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6TxPowersCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6TxPowers count];
}

- (id)cellularPowerLogNRsub6TxPowerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6TxPowers objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6TxPowerType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6RxDiversitys
{
}

- (void)addCellularPowerLogNRsub6RxDiversity:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6RxDiversitys = self->_cellularPowerLogNRsub6RxDiversitys;
  id v8 = v4;
  if (!cellularPowerLogNRsub6RxDiversitys)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6RxDiversitys;
    self->_cellularPowerLogNRsub6RxDiversitys = v6;

    id v4 = v8;
    cellularPowerLogNRsub6RxDiversitys = self->_cellularPowerLogNRsub6RxDiversitys;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6RxDiversitys addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6RxDiversitysCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6RxDiversitys count];
}

- (id)cellularPowerLogNRsub6RxDiversityAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6RxDiversitys objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6RxDiversityType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6BWPSCCs
{
}

- (void)addCellularPowerLogNRsub6BWPSCC:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6BWPSCCs = self->_cellularPowerLogNRsub6BWPSCCs;
  id v8 = v4;
  if (!cellularPowerLogNRsub6BWPSCCs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6BWPSCCs;
    self->_cellularPowerLogNRsub6BWPSCCs = v6;

    id v4 = v8;
    cellularPowerLogNRsub6BWPSCCs = self->_cellularPowerLogNRsub6BWPSCCs;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6BWPSCCs addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6BWPSCCsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6BWPSCCs count];
}

- (id)cellularPowerLogNRsub6BWPSCCAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6BWPSCCs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6BWPSCCType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRsub6BWPSAs
{
}

- (void)addCellularPowerLogNRsub6BWPSA:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRsub6BWPSAs = self->_cellularPowerLogNRsub6BWPSAs;
  id v8 = v4;
  if (!cellularPowerLogNRsub6BWPSAs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRsub6BWPSAs;
    self->_cellularPowerLogNRsub6BWPSAs = v6;

    id v4 = v8;
    cellularPowerLogNRsub6BWPSAs = self->_cellularPowerLogNRsub6BWPSAs;
  }
  [(NSMutableArray *)cellularPowerLogNRsub6BWPSAs addObject:v4];
}

- (unint64_t)cellularPowerLogNRsub6BWPSAsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRsub6BWPSAs count];
}

- (id)cellularPowerLogNRsub6BWPSAAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRsub6BWPSAs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRsub6BWPSAType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRmmWaveBWPs
{
}

- (void)addCellularPowerLogNRmmWaveBWP:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRmmWaveBWPs = self->_cellularPowerLogNRmmWaveBWPs;
  id v8 = v4;
  if (!cellularPowerLogNRmmWaveBWPs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRmmWaveBWPs;
    self->_cellularPowerLogNRmmWaveBWPs = v6;

    id v4 = v8;
    cellularPowerLogNRmmWaveBWPs = self->_cellularPowerLogNRmmWaveBWPs;
  }
  [(NSMutableArray *)cellularPowerLogNRmmWaveBWPs addObject:v4];
}

- (unint64_t)cellularPowerLogNRmmWaveBWPsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRmmWaveBWPs count];
}

- (id)cellularPowerLogNRmmWaveBWPAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRmmWaveBWPs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRmmWaveBWPType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRmmWaveAntennaPanels
{
}

- (void)addCellularPowerLogNRmmWaveAntennaPanel:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRmmWaveAntennaPanels = self->_cellularPowerLogNRmmWaveAntennaPanels;
  id v8 = v4;
  if (!cellularPowerLogNRmmWaveAntennaPanels)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRmmWaveAntennaPanels;
    self->_cellularPowerLogNRmmWaveAntennaPanels = v6;

    id v4 = v8;
    cellularPowerLogNRmmWaveAntennaPanels = self->_cellularPowerLogNRmmWaveAntennaPanels;
  }
  [(NSMutableArray *)cellularPowerLogNRmmWaveAntennaPanels addObject:v4];
}

- (unint64_t)cellularPowerLogNRmmWaveAntennaPanelsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRmmWaveAntennaPanels count];
}

- (id)cellularPowerLogNRmmWaveAntennaPanelAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRmmWaveAntennaPanels objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRmmWaveAntennaPanelType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRmmWaveBeamIDs
{
}

- (void)addCellularPowerLogNRmmWaveBeamID:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRmmWaveBeamIDs = self->_cellularPowerLogNRmmWaveBeamIDs;
  id v8 = v4;
  if (!cellularPowerLogNRmmWaveBeamIDs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRmmWaveBeamIDs;
    self->_cellularPowerLogNRmmWaveBeamIDs = v6;

    id v4 = v8;
    cellularPowerLogNRmmWaveBeamIDs = self->_cellularPowerLogNRmmWaveBeamIDs;
  }
  [(NSMutableArray *)cellularPowerLogNRmmWaveBeamIDs addObject:v4];
}

- (unint64_t)cellularPowerLogNRmmWaveBeamIDsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRmmWaveBeamIDs count];
}

- (id)cellularPowerLogNRmmWaveBeamIDAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRmmWaveBeamIDs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRmmWaveBeamIDType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRmmWaveCASCCConfigureds
{
}

- (void)addCellularPowerLogNRmmWaveCASCCConfigured:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRmmWaveCASCCConfigureds = self->_cellularPowerLogNRmmWaveCASCCConfigureds;
  id v8 = v4;
  if (!cellularPowerLogNRmmWaveCASCCConfigureds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRmmWaveCASCCConfigureds;
    self->_cellularPowerLogNRmmWaveCASCCConfigureds = v6;

    id v4 = v8;
    cellularPowerLogNRmmWaveCASCCConfigureds = self->_cellularPowerLogNRmmWaveCASCCConfigureds;
  }
  [(NSMutableArray *)cellularPowerLogNRmmWaveCASCCConfigureds addObject:v4];
}

- (unint64_t)cellularPowerLogNRmmWaveCASCCConfiguredsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRmmWaveCASCCConfigureds count];
}

- (id)cellularPowerLogNRmmWaveCASCCConfiguredAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRmmWaveCASCCConfigureds objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRmmWaveCASCCConfiguredType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRmmWaveCASCCActivateds
{
}

- (void)addCellularPowerLogNRmmWaveCASCCActivated:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRmmWaveCASCCActivateds = self->_cellularPowerLogNRmmWaveCASCCActivateds;
  id v8 = v4;
  if (!cellularPowerLogNRmmWaveCASCCActivateds)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRmmWaveCASCCActivateds;
    self->_cellularPowerLogNRmmWaveCASCCActivateds = v6;

    id v4 = v8;
    cellularPowerLogNRmmWaveCASCCActivateds = self->_cellularPowerLogNRmmWaveCASCCActivateds;
  }
  [(NSMutableArray *)cellularPowerLogNRmmWaveCASCCActivateds addObject:v4];
}

- (unint64_t)cellularPowerLogNRmmWaveCASCCActivatedsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRmmWaveCASCCActivateds count];
}

- (id)cellularPowerLogNRmmWaveCASCCActivatedAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRmmWaveCASCCActivateds objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRmmWaveCASCCActivatedType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRmmWaveRxTxs
{
}

- (void)addCellularPowerLogNRmmWaveRxTx:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRmmWaveRxTxs = self->_cellularPowerLogNRmmWaveRxTxs;
  id v8 = v4;
  if (!cellularPowerLogNRmmWaveRxTxs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRmmWaveRxTxs;
    self->_cellularPowerLogNRmmWaveRxTxs = v6;

    id v4 = v8;
    cellularPowerLogNRmmWaveRxTxs = self->_cellularPowerLogNRmmWaveRxTxs;
  }
  [(NSMutableArray *)cellularPowerLogNRmmWaveRxTxs addObject:v4];
}

- (unint64_t)cellularPowerLogNRmmWaveRxTxsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRmmWaveRxTxs count];
}

- (id)cellularPowerLogNRmmWaveRxTxAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRmmWaveRxTxs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRmmWaveRxTxType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRmmWaveCarrierComponentInfos
{
}

- (void)addCellularPowerLogNRmmWaveCarrierComponentInfo:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRmmWaveCarrierComponentInfos = self->_cellularPowerLogNRmmWaveCarrierComponentInfos;
  id v8 = v4;
  if (!cellularPowerLogNRmmWaveCarrierComponentInfos)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRmmWaveCarrierComponentInfos;
    self->_cellularPowerLogNRmmWaveCarrierComponentInfos = v6;

    id v4 = v8;
    cellularPowerLogNRmmWaveCarrierComponentInfos = self->_cellularPowerLogNRmmWaveCarrierComponentInfos;
  }
  [(NSMutableArray *)cellularPowerLogNRmmWaveCarrierComponentInfos addObject:v4];
}

- (unint64_t)cellularPowerLogNRmmWaveCarrierComponentInfosCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRmmWaveCarrierComponentInfos count];
}

- (id)cellularPowerLogNRmmWaveCarrierComponentInfoAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRmmWaveCarrierComponentInfos objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRmmWaveCarrierComponentInfoType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRmmWaveDLTBSs
{
}

- (void)addCellularPowerLogNRmmWaveDLTBS:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRmmWaveDLTBSs = self->_cellularPowerLogNRmmWaveDLTBSs;
  id v8 = v4;
  if (!cellularPowerLogNRmmWaveDLTBSs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRmmWaveDLTBSs;
    self->_cellularPowerLogNRmmWaveDLTBSs = v6;

    id v4 = v8;
    cellularPowerLogNRmmWaveDLTBSs = self->_cellularPowerLogNRmmWaveDLTBSs;
  }
  [(NSMutableArray *)cellularPowerLogNRmmWaveDLTBSs addObject:v4];
}

- (unint64_t)cellularPowerLogNRmmWaveDLTBSsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRmmWaveDLTBSs count];
}

- (id)cellularPowerLogNRmmWaveDLTBSAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRmmWaveDLTBSs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRmmWaveDLTBSType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRMmWaveRSRPs
{
}

- (void)addCellularPowerLogNRMmWaveRSRP:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRMmWaveRSRPs = self->_cellularPowerLogNRMmWaveRSRPs;
  id v8 = v4;
  if (!cellularPowerLogNRMmWaveRSRPs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRMmWaveRSRPs;
    self->_cellularPowerLogNRMmWaveRSRPs = v6;

    id v4 = v8;
    cellularPowerLogNRMmWaveRSRPs = self->_cellularPowerLogNRMmWaveRSRPs;
  }
  [(NSMutableArray *)cellularPowerLogNRMmWaveRSRPs addObject:v4];
}

- (unint64_t)cellularPowerLogNRMmWaveRSRPsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRMmWaveRSRPs count];
}

- (id)cellularPowerLogNRMmWaveRSRPAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRMmWaveRSRPs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRMmWaveRSRPType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRMmWaveTxPowers
{
}

- (void)addCellularPowerLogNRMmWaveTxPower:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRMmWaveTxPowers = self->_cellularPowerLogNRMmWaveTxPowers;
  id v8 = v4;
  if (!cellularPowerLogNRMmWaveTxPowers)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRMmWaveTxPowers;
    self->_cellularPowerLogNRMmWaveTxPowers = v6;

    id v4 = v8;
    cellularPowerLogNRMmWaveTxPowers = self->_cellularPowerLogNRMmWaveTxPowers;
  }
  [(NSMutableArray *)cellularPowerLogNRMmWaveTxPowers addObject:v4];
}

- (unint64_t)cellularPowerLogNRMmWaveTxPowersCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRMmWaveTxPowers count];
}

- (id)cellularPowerLogNRMmWaveTxPowerAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRMmWaveTxPowers objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRMmWaveTxPowerType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRMmWaveULCAStates
{
}

- (void)addCellularPowerLogNRMmWaveULCAState:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRMmWaveULCAStates = self->_cellularPowerLogNRMmWaveULCAStates;
  id v8 = v4;
  if (!cellularPowerLogNRMmWaveULCAStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRMmWaveULCAStates;
    self->_cellularPowerLogNRMmWaveULCAStates = v6;

    id v4 = v8;
    cellularPowerLogNRMmWaveULCAStates = self->_cellularPowerLogNRMmWaveULCAStates;
  }
  [(NSMutableArray *)cellularPowerLogNRMmWaveULCAStates addObject:v4];
}

- (unint64_t)cellularPowerLogNRMmWaveULCAStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRMmWaveULCAStates count];
}

- (id)cellularPowerLogNRMmWaveULCAStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRMmWaveULCAStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRMmWaveULCAStateType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogNRmmWaveBWPSCCs
{
}

- (void)addCellularPowerLogNRmmWaveBWPSCC:(id)a3
{
  id v4 = a3;
  cellularPowerLogNRmmWaveBWPSCCs = self->_cellularPowerLogNRmmWaveBWPSCCs;
  id v8 = v4;
  if (!cellularPowerLogNRmmWaveBWPSCCs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogNRmmWaveBWPSCCs;
    self->_cellularPowerLogNRmmWaveBWPSCCs = v6;

    id v4 = v8;
    cellularPowerLogNRmmWaveBWPSCCs = self->_cellularPowerLogNRmmWaveBWPSCCs;
  }
  [(NSMutableArray *)cellularPowerLogNRmmWaveBWPSCCs addObject:v4];
}

- (unint64_t)cellularPowerLogNRmmWaveBWPSCCsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogNRmmWaveBWPSCCs count];
}

- (id)cellularPowerLogNRmmWaveBWPSCCAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogNRmmWaveBWPSCCs objectAtIndex:a3];
}

+ (Class)cellularPowerLogNRmmWaveBWPSCCType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogSFTStates
{
}

- (void)addCellularPowerLogSFTState:(id)a3
{
  id v4 = a3;
  cellularPowerLogSFTStates = self->_cellularPowerLogSFTStates;
  id v8 = v4;
  if (!cellularPowerLogSFTStates)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogSFTStates;
    self->_cellularPowerLogSFTStates = v6;

    id v4 = v8;
    cellularPowerLogSFTStates = self->_cellularPowerLogSFTStates;
  }
  [(NSMutableArray *)cellularPowerLogSFTStates addObject:v4];
}

- (unint64_t)cellularPowerLogSFTStatesCount
{
  return [(NSMutableArray *)self->_cellularPowerLogSFTStates count];
}

- (id)cellularPowerLogSFTStateAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogSFTStates objectAtIndex:a3];
}

+ (Class)cellularPowerLogSFTStateType
{
  return (Class)objc_opt_class();
}

- (void)clearCellularPowerLogSFTRxTxs
{
}

- (void)addCellularPowerLogSFTRxTx:(id)a3
{
  id v4 = a3;
  cellularPowerLogSFTRxTxs = self->_cellularPowerLogSFTRxTxs;
  id v8 = v4;
  if (!cellularPowerLogSFTRxTxs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cellularPowerLogSFTRxTxs;
    self->_cellularPowerLogSFTRxTxs = v6;

    id v4 = v8;
    cellularPowerLogSFTRxTxs = self->_cellularPowerLogSFTRxTxs;
  }
  [(NSMutableArray *)cellularPowerLogSFTRxTxs addObject:v4];
}

- (unint64_t)cellularPowerLogSFTRxTxsCount
{
  return [(NSMutableArray *)self->_cellularPowerLogSFTRxTxs count];
}

- (id)cellularPowerLogSFTRxTxAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cellularPowerLogSFTRxTxs objectAtIndex:a3];
}

+ (Class)cellularPowerLogSFTRxTxType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AWDMETRICSCellularPowerLog;
  id v4 = [(AWDMETRICSCellularPowerLog *)&v8 description];
  v5 = [(AWDMETRICSCellularPowerLog *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v1146 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_cellularPerClientProfileTriggerCounts count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPerClientProfileTriggerCounts, "count"));
    long long v1047 = 0u;
    long long v1048 = 0u;
    long long v1049 = 0u;
    long long v1050 = 0u;
    v5 = self->_cellularPerClientProfileTriggerCounts;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v1047 objects:v1145 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v1048;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v1048 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = [*(id *)(*((void *)&v1047 + 1) + 8 * v9) dictionaryRepresentation];
          [v4 addObject:v10];

          ++v9;
        }
        while (v7 != v9);
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v1047 objects:v1145 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"cellularPerClientProfileTriggerCount"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogXOShutdowns count])
  {
    v11 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogXOShutdowns, "count"));
    long long v1043 = 0u;
    long long v1044 = 0u;
    long long v1045 = 0u;
    long long v1046 = 0u;
    v12 = self->_cellularPowerLogXOShutdowns;
    uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v1043 objects:v1144 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v1044;
      do
      {
        uint64_t v16 = 0;
        do
        {
          if (*(void *)v1044 != v15) {
            objc_enumerationMutation(v12);
          }
          v17 = [*(id *)(*((void *)&v1043 + 1) + 8 * v16) dictionaryRepresentation];
          [v11 addObject:v17];

          ++v16;
        }
        while (v14 != v16);
        uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v1043 objects:v1144 count:16];
      }
      while (v14);
    }

    [v3 setObject:v11 forKey:@"cellularPowerLogXOShutdown"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogAPPSPerfLevels count])
  {
    v18 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogAPPSPerfLevels, "count"));
    long long v1039 = 0u;
    long long v1040 = 0u;
    long long v1041 = 0u;
    long long v1042 = 0u;
    v19 = self->_cellularPowerLogAPPSPerfLevels;
    uint64_t v20 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v1039 objects:v1143 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v1040;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v1040 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [*(id *)(*((void *)&v1039 + 1) + 8 * v23) dictionaryRepresentation];
          [v18 addObject:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [(NSMutableArray *)v19 countByEnumeratingWithState:&v1039 objects:v1143 count:16];
      }
      while (v21);
    }

    [v3 setObject:v18 forKey:@"cellularPowerLogAPPSPerfLevels"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogAPPSCXOShutdowns count])
  {
    v25 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogAPPSCXOShutdowns, "count"));
    long long v1035 = 0u;
    long long v1036 = 0u;
    long long v1037 = 0u;
    long long v1038 = 0u;
    v26 = self->_cellularPowerLogAPPSCXOShutdowns;
    uint64_t v27 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v1035 objects:v1142 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v29 = *(void *)v1036;
      do
      {
        uint64_t v30 = 0;
        do
        {
          if (*(void *)v1036 != v29) {
            objc_enumerationMutation(v26);
          }
          v31 = [*(id *)(*((void *)&v1035 + 1) + 8 * v30) dictionaryRepresentation];
          [v25 addObject:v31];

          ++v30;
        }
        while (v28 != v30);
        uint64_t v28 = [(NSMutableArray *)v26 countByEnumeratingWithState:&v1035 objects:v1142 count:16];
      }
      while (v28);
    }

    [v3 setObject:v25 forKey:@"cellularPowerLogAPPSCXOShutdown"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogAPPSSleepVetos count])
  {
    v32 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogAPPSSleepVetos, "count"));
    long long v1031 = 0u;
    long long v1032 = 0u;
    long long v1033 = 0u;
    long long v1034 = 0u;
    v33 = self->_cellularPowerLogAPPSSleepVetos;
    uint64_t v34 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v1031 objects:v1141 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v1032;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v1032 != v36) {
            objc_enumerationMutation(v33);
          }
          v38 = [*(id *)(*((void *)&v1031 + 1) + 8 * v37) dictionaryRepresentation];
          [v32 addObject:v38];

          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = [(NSMutableArray *)v33 countByEnumeratingWithState:&v1031 objects:v1141 count:16];
      }
      while (v35);
    }

    [v3 setObject:v32 forKey:@"cellularPowerLogAPPSSleepVeto"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogMCPMSleepVetos count])
  {
    v39 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogMCPMSleepVetos, "count"));
    long long v1027 = 0u;
    long long v1028 = 0u;
    long long v1029 = 0u;
    long long v1030 = 0u;
    v40 = self->_cellularPowerLogMCPMSleepVetos;
    uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v1027 objects:v1140 count:16];
    if (v41)
    {
      uint64_t v42 = v41;
      uint64_t v43 = *(void *)v1028;
      do
      {
        uint64_t v44 = 0;
        do
        {
          if (*(void *)v1028 != v43) {
            objc_enumerationMutation(v40);
          }
          v45 = [*(id *)(*((void *)&v1027 + 1) + 8 * v44) dictionaryRepresentation];
          [v39 addObject:v45];

          ++v44;
        }
        while (v42 != v44);
        uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v1027 objects:v1140 count:16];
      }
      while (v42);
    }

    [v3 setObject:v39 forKey:@"cellularPowerLogMCPMSleepVeto"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogMPSSPerfLevels count])
  {
    v46 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogMPSSPerfLevels, "count"));
    long long v1023 = 0u;
    long long v1024 = 0u;
    long long v1025 = 0u;
    long long v1026 = 0u;
    v47 = self->_cellularPowerLogMPSSPerfLevels;
    uint64_t v48 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v1023 objects:v1139 count:16];
    if (v48)
    {
      uint64_t v49 = v48;
      uint64_t v50 = *(void *)v1024;
      do
      {
        uint64_t v51 = 0;
        do
        {
          if (*(void *)v1024 != v50) {
            objc_enumerationMutation(v47);
          }
          v52 = [*(id *)(*((void *)&v1023 + 1) + 8 * v51) dictionaryRepresentation];
          [v46 addObject:v52];

          ++v51;
        }
        while (v49 != v51);
        uint64_t v49 = [(NSMutableArray *)v47 countByEnumeratingWithState:&v1023 objects:v1139 count:16];
      }
      while (v49);
    }

    [v3 setObject:v46 forKey:@"cellularPowerLogMPSSPerfLevels"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogGPSStates count])
  {
    v53 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogGPSStates, "count"));
    long long v1019 = 0u;
    long long v1020 = 0u;
    long long v1021 = 0u;
    long long v1022 = 0u;
    v54 = self->_cellularPowerLogGPSStates;
    uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v1019 objects:v1138 count:16];
    if (v55)
    {
      uint64_t v56 = v55;
      uint64_t v57 = *(void *)v1020;
      do
      {
        uint64_t v58 = 0;
        do
        {
          if (*(void *)v1020 != v57) {
            objc_enumerationMutation(v54);
          }
          v59 = [*(id *)(*((void *)&v1019 + 1) + 8 * v58) dictionaryRepresentation];
          [v53 addObject:v59];

          ++v58;
        }
        while (v56 != v58);
        uint64_t v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v1019 objects:v1138 count:16];
      }
      while (v56);
    }

    [v3 setObject:v53 forKey:@"cellularPowerLogGPSStates"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogAOPUARTStates count])
  {
    v60 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogAOPUARTStates, "count"));
    long long v1015 = 0u;
    long long v1016 = 0u;
    long long v1017 = 0u;
    long long v1018 = 0u;
    v61 = self->_cellularPowerLogAOPUARTStates;
    uint64_t v62 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v1015 objects:v1137 count:16];
    if (v62)
    {
      uint64_t v63 = v62;
      uint64_t v64 = *(void *)v1016;
      do
      {
        uint64_t v65 = 0;
        do
        {
          if (*(void *)v1016 != v64) {
            objc_enumerationMutation(v61);
          }
          v66 = [*(id *)(*((void *)&v1015 + 1) + 8 * v65) dictionaryRepresentation];
          [v60 addObject:v66];

          ++v65;
        }
        while (v63 != v65);
        uint64_t v63 = [(NSMutableArray *)v61 countByEnumeratingWithState:&v1015 objects:v1137 count:16];
      }
      while (v63);
    }

    [v3 setObject:v60 forKey:@"cellularPowerLogAOP_UARTStates"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogWLANUARTStates count])
  {
    v67 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogWLANUARTStates, "count"));
    long long v1011 = 0u;
    long long v1012 = 0u;
    long long v1013 = 0u;
    long long v1014 = 0u;
    v68 = self->_cellularPowerLogWLANUARTStates;
    uint64_t v69 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v1011 objects:v1136 count:16];
    if (v69)
    {
      uint64_t v70 = v69;
      uint64_t v71 = *(void *)v1012;
      do
      {
        uint64_t v72 = 0;
        do
        {
          if (*(void *)v1012 != v71) {
            objc_enumerationMutation(v68);
          }
          v73 = [*(id *)(*((void *)&v1011 + 1) + 8 * v72) dictionaryRepresentation];
          [v67 addObject:v73];

          ++v72;
        }
        while (v70 != v72);
        uint64_t v70 = [(NSMutableArray *)v68 countByEnumeratingWithState:&v1011 objects:v1136 count:16];
      }
      while (v70);
    }

    [v3 setObject:v67 forKey:@"cellularPowerLogWLAN_UARTStates"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogPCIeStates count])
  {
    v74 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogPCIeStates, "count"));
    long long v1007 = 0u;
    long long v1008 = 0u;
    long long v1009 = 0u;
    long long v1010 = 0u;
    v75 = self->_cellularPowerLogPCIeStates;
    uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v1007 objects:v1135 count:16];
    if (v76)
    {
      uint64_t v77 = v76;
      uint64_t v78 = *(void *)v1008;
      do
      {
        uint64_t v79 = 0;
        do
        {
          if (*(void *)v1008 != v78) {
            objc_enumerationMutation(v75);
          }
          v80 = [*(id *)(*((void *)&v1007 + 1) + 8 * v79) dictionaryRepresentation];
          [v74 addObject:v80];

          ++v79;
        }
        while (v77 != v79);
        uint64_t v77 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v1007 objects:v1135 count:16];
      }
      while (v77);
    }

    [v3 setObject:v74 forKey:@"cellularPowerLogPCIeStates"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogL1SleepStates count])
  {
    v81 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogL1SleepStates, "count"));
    long long v1003 = 0u;
    long long v1004 = 0u;
    long long v1005 = 0u;
    long long v1006 = 0u;
    v82 = self->_cellularPowerLogL1SleepStates;
    uint64_t v83 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v1003 objects:v1134 count:16];
    if (v83)
    {
      uint64_t v84 = v83;
      uint64_t v85 = *(void *)v1004;
      do
      {
        uint64_t v86 = 0;
        do
        {
          if (*(void *)v1004 != v85) {
            objc_enumerationMutation(v82);
          }
          v87 = [*(id *)(*((void *)&v1003 + 1) + 8 * v86) dictionaryRepresentation];
          [v81 addObject:v87];

          ++v86;
        }
        while (v84 != v86);
        uint64_t v84 = [(NSMutableArray *)v82 countByEnumeratingWithState:&v1003 objects:v1134 count:16];
      }
      while (v84);
    }

    [v3 setObject:v81 forKey:@"cellularPowerLogL1SleepStates"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogPowerEstimators count])
  {
    v88 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogPowerEstimators, "count"));
    long long v999 = 0u;
    long long v1000 = 0u;
    long long v1001 = 0u;
    long long v1002 = 0u;
    v89 = self->_cellularPowerLogPowerEstimators;
    uint64_t v90 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v999 objects:v1133 count:16];
    if (v90)
    {
      uint64_t v91 = v90;
      uint64_t v92 = *(void *)v1000;
      do
      {
        uint64_t v93 = 0;
        do
        {
          if (*(void *)v1000 != v92) {
            objc_enumerationMutation(v89);
          }
          v94 = [*(id *)(*((void *)&v999 + 1) + 8 * v93) dictionaryRepresentation];
          [v88 addObject:v94];

          ++v93;
        }
        while (v91 != v93);
        uint64_t v91 = [(NSMutableArray *)v89 countByEnumeratingWithState:&v999 objects:v1133 count:16];
      }
      while (v91);
    }

    [v3 setObject:v88 forKey:@"cellularPowerLogPowerEstimator"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogRFTunerStatsHists count])
  {
    v95 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogRFTunerStatsHists, "count"));
    long long v995 = 0u;
    long long v996 = 0u;
    long long v997 = 0u;
    long long v998 = 0u;
    v96 = self->_cellularPowerLogRFTunerStatsHists;
    uint64_t v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v995 objects:v1132 count:16];
    if (v97)
    {
      uint64_t v98 = v97;
      uint64_t v99 = *(void *)v996;
      do
      {
        uint64_t v100 = 0;
        do
        {
          if (*(void *)v996 != v99) {
            objc_enumerationMutation(v96);
          }
          v101 = [*(id *)(*((void *)&v995 + 1) + 8 * v100) dictionaryRepresentation];
          [v95 addObject:v101];

          ++v100;
        }
        while (v98 != v100);
        uint64_t v98 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v995 objects:v1132 count:16];
      }
      while (v98);
    }

    [v3 setObject:v95 forKey:@"cellularPowerLogRFTunerStatsHist"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogSPMIs count])
  {
    v102 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogSPMIs, "count"));
    long long v991 = 0u;
    long long v992 = 0u;
    long long v993 = 0u;
    long long v994 = 0u;
    v103 = self->_cellularPowerLogSPMIs;
    uint64_t v104 = [(NSMutableArray *)v103 countByEnumeratingWithState:&v991 objects:v1131 count:16];
    if (v104)
    {
      uint64_t v105 = v104;
      uint64_t v106 = *(void *)v992;
      do
      {
        uint64_t v107 = 0;
        do
        {
          if (*(void *)v992 != v106) {
            objc_enumerationMutation(v103);
          }
          v108 = [*(id *)(*((void *)&v991 + 1) + 8 * v107) dictionaryRepresentation];
          [v102 addObject:v108];

          ++v107;
        }
        while (v105 != v107);
        uint64_t v105 = [(NSMutableArray *)v103 countByEnumeratingWithState:&v991 objects:v1131 count:16];
      }
      while (v105);
    }

    [v3 setObject:v102 forKey:@"cellularPowerLogSPMI"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTEConfiguredCASCCStates count])
  {
    v109 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTEConfiguredCASCCStates, "count"));
    long long v987 = 0u;
    long long v988 = 0u;
    long long v989 = 0u;
    long long v990 = 0u;
    v110 = self->_cellularPowerLogLTEConfiguredCASCCStates;
    uint64_t v111 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v987 objects:v1130 count:16];
    if (v111)
    {
      uint64_t v112 = v111;
      uint64_t v113 = *(void *)v988;
      do
      {
        uint64_t v114 = 0;
        do
        {
          if (*(void *)v988 != v113) {
            objc_enumerationMutation(v110);
          }
          v115 = [*(id *)(*((void *)&v987 + 1) + 8 * v114) dictionaryRepresentation];
          [v109 addObject:v115];

          ++v114;
        }
        while (v112 != v114);
        uint64_t v112 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v987 objects:v1130 count:16];
      }
      while (v112);
    }

    [v3 setObject:v109 forKey:@"cellularPowerLogLTEConfiguredCA_SCCStates"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTEActivatedCASCCStates count])
  {
    v116 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTEActivatedCASCCStates, "count"));
    long long v983 = 0u;
    long long v984 = 0u;
    long long v985 = 0u;
    long long v986 = 0u;
    v117 = self->_cellularPowerLogLTEActivatedCASCCStates;
    uint64_t v118 = [(NSMutableArray *)v117 countByEnumeratingWithState:&v983 objects:v1129 count:16];
    if (v118)
    {
      uint64_t v119 = v118;
      uint64_t v120 = *(void *)v984;
      do
      {
        uint64_t v121 = 0;
        do
        {
          if (*(void *)v984 != v120) {
            objc_enumerationMutation(v117);
          }
          v122 = [*(id *)(*((void *)&v983 + 1) + 8 * v121) dictionaryRepresentation];
          [v116 addObject:v122];

          ++v121;
        }
        while (v119 != v121);
        uint64_t v119 = [(NSMutableArray *)v117 countByEnumeratingWithState:&v983 objects:v1129 count:16];
      }
      while (v119);
    }

    [v3 setObject:v116 forKey:@"cellularPowerLogLTEActivatedCA_SCCStates"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTERxTxActivityStates count])
  {
    v123 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTERxTxActivityStates, "count"));
    long long v979 = 0u;
    long long v980 = 0u;
    long long v981 = 0u;
    long long v982 = 0u;
    v124 = self->_cellularPowerLogLTERxTxActivityStates;
    uint64_t v125 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v979 objects:v1128 count:16];
    if (v125)
    {
      uint64_t v126 = v125;
      uint64_t v127 = *(void *)v980;
      do
      {
        uint64_t v128 = 0;
        do
        {
          if (*(void *)v980 != v127) {
            objc_enumerationMutation(v124);
          }
          v129 = [*(id *)(*((void *)&v979 + 1) + 8 * v128) dictionaryRepresentation];
          [v123 addObject:v129];

          ++v128;
        }
        while (v126 != v128);
        uint64_t v126 = [(NSMutableArray *)v124 countByEnumeratingWithState:&v979 objects:v1128 count:16];
      }
      while (v126);
    }

    [v3 setObject:v123 forKey:@"cellularPowerLogLTERxTxActivityStates"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTECarrierComponentInfos count])
  {
    v130 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTECarrierComponentInfos, "count"));
    long long v975 = 0u;
    long long v976 = 0u;
    long long v977 = 0u;
    long long v978 = 0u;
    v131 = self->_cellularPowerLogLTECarrierComponentInfos;
    uint64_t v132 = [(NSMutableArray *)v131 countByEnumeratingWithState:&v975 objects:v1127 count:16];
    if (v132)
    {
      uint64_t v133 = v132;
      uint64_t v134 = *(void *)v976;
      do
      {
        uint64_t v135 = 0;
        do
        {
          if (*(void *)v976 != v134) {
            objc_enumerationMutation(v131);
          }
          v136 = [*(id *)(*((void *)&v975 + 1) + 8 * v135) dictionaryRepresentation];
          [v130 addObject:v136];

          ++v135;
        }
        while (v133 != v135);
        uint64_t v133 = [(NSMutableArray *)v131 countByEnumeratingWithState:&v975 objects:v1127 count:16];
      }
      while (v133);
    }

    [v3 setObject:v130 forKey:@"cellularPowerLogLTECarrierComponentInfo"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTEAggregatedDLTBSs count])
  {
    v137 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTEAggregatedDLTBSs, "count"));
    long long v971 = 0u;
    long long v972 = 0u;
    long long v973 = 0u;
    long long v974 = 0u;
    v138 = self->_cellularPowerLogLTEAggregatedDLTBSs;
    uint64_t v139 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v971 objects:v1126 count:16];
    if (v139)
    {
      uint64_t v140 = v139;
      uint64_t v141 = *(void *)v972;
      do
      {
        uint64_t v142 = 0;
        do
        {
          if (*(void *)v972 != v141) {
            objc_enumerationMutation(v138);
          }
          v143 = [*(id *)(*((void *)&v971 + 1) + 8 * v142) dictionaryRepresentation];
          [v137 addObject:v143];

          ++v142;
        }
        while (v140 != v142);
        uint64_t v140 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v971 objects:v1126 count:16];
      }
      while (v140);
    }

    [v3 setObject:v137 forKey:@"cellularPowerLogLTEAggregatedDL_TBS"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTERSRPs count])
  {
    v144 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTERSRPs, "count"));
    long long v967 = 0u;
    long long v968 = 0u;
    long long v969 = 0u;
    long long v970 = 0u;
    v145 = self->_cellularPowerLogLTERSRPs;
    uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v967 objects:v1125 count:16];
    if (v146)
    {
      uint64_t v147 = v146;
      uint64_t v148 = *(void *)v968;
      do
      {
        uint64_t v149 = 0;
        do
        {
          if (*(void *)v968 != v148) {
            objc_enumerationMutation(v145);
          }
          v150 = [*(id *)(*((void *)&v967 + 1) + 8 * v149) dictionaryRepresentation];
          [v144 addObject:v150];

          ++v149;
        }
        while (v147 != v149);
        uint64_t v147 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v967 objects:v1125 count:16];
      }
      while (v147);
    }

    [v3 setObject:v144 forKey:@"cellularPowerLogLTE_RSRP"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTESINRs count])
  {
    v151 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTESINRs, "count"));
    long long v963 = 0u;
    long long v964 = 0u;
    long long v965 = 0u;
    long long v966 = 0u;
    v152 = self->_cellularPowerLogLTESINRs;
    uint64_t v153 = [(NSMutableArray *)v152 countByEnumeratingWithState:&v963 objects:v1124 count:16];
    if (v153)
    {
      uint64_t v154 = v153;
      uint64_t v155 = *(void *)v964;
      do
      {
        uint64_t v156 = 0;
        do
        {
          if (*(void *)v964 != v155) {
            objc_enumerationMutation(v152);
          }
          v157 = [*(id *)(*((void *)&v963 + 1) + 8 * v156) dictionaryRepresentation];
          [v151 addObject:v157];

          ++v156;
        }
        while (v154 != v156);
        uint64_t v154 = [(NSMutableArray *)v152 countByEnumeratingWithState:&v963 objects:v1124 count:16];
      }
      while (v154);
    }

    [v3 setObject:v151 forKey:@"cellularPowerLogLTE_SINR"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTETxPowers count])
  {
    v158 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTETxPowers, "count"));
    long long v959 = 0u;
    long long v960 = 0u;
    long long v961 = 0u;
    long long v962 = 0u;
    v159 = self->_cellularPowerLogLTETxPowers;
    uint64_t v160 = [(NSMutableArray *)v159 countByEnumeratingWithState:&v959 objects:v1123 count:16];
    if (v160)
    {
      uint64_t v161 = v160;
      uint64_t v162 = *(void *)v960;
      do
      {
        uint64_t v163 = 0;
        do
        {
          if (*(void *)v960 != v162) {
            objc_enumerationMutation(v159);
          }
          v164 = [*(id *)(*((void *)&v959 + 1) + 8 * v163) dictionaryRepresentation];
          [v158 addObject:v164];

          ++v163;
        }
        while (v161 != v163);
        uint64_t v161 = [(NSMutableArray *)v159 countByEnumeratingWithState:&v959 objects:v1123 count:16];
      }
      while (v161);
    }

    [v3 setObject:v158 forKey:@"cellularPowerLogLTETxPower"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTERxDiversitys count])
  {
    v165 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTERxDiversitys, "count"));
    long long v955 = 0u;
    long long v956 = 0u;
    long long v957 = 0u;
    long long v958 = 0u;
    v166 = self->_cellularPowerLogLTERxDiversitys;
    uint64_t v167 = [(NSMutableArray *)v166 countByEnumeratingWithState:&v955 objects:v1122 count:16];
    if (v167)
    {
      uint64_t v168 = v167;
      uint64_t v169 = *(void *)v956;
      do
      {
        uint64_t v170 = 0;
        do
        {
          if (*(void *)v956 != v169) {
            objc_enumerationMutation(v166);
          }
          v171 = [*(id *)(*((void *)&v955 + 1) + 8 * v170) dictionaryRepresentation];
          [v165 addObject:v171];

          ++v170;
        }
        while (v168 != v170);
        uint64_t v168 = [(NSMutableArray *)v166 countByEnumeratingWithState:&v955 objects:v1122 count:16];
      }
      while (v168);
    }

    [v3 setObject:v165 forKey:@"cellularPowerLogLTERxDiversity"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTEULCAStates count])
  {
    v172 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTEULCAStates, "count"));
    long long v951 = 0u;
    long long v952 = 0u;
    long long v953 = 0u;
    long long v954 = 0u;
    v173 = self->_cellularPowerLogLTEULCAStates;
    uint64_t v174 = [(NSMutableArray *)v173 countByEnumeratingWithState:&v951 objects:v1121 count:16];
    if (v174)
    {
      uint64_t v175 = v174;
      uint64_t v176 = *(void *)v952;
      do
      {
        uint64_t v177 = 0;
        do
        {
          if (*(void *)v952 != v176) {
            objc_enumerationMutation(v173);
          }
          v178 = [*(id *)(*((void *)&v951 + 1) + 8 * v177) dictionaryRepresentation];
          [v172 addObject:v178];

          ++v177;
        }
        while (v175 != v177);
        uint64_t v175 = [(NSMutableArray *)v173 countByEnumeratingWithState:&v951 objects:v1121 count:16];
      }
      while (v175);
    }

    [v3 setObject:v172 forKey:@"cellularPowerLogLTE_UL_CAState"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogProtocolStates count])
  {
    v179 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogProtocolStates, "count"));
    long long v947 = 0u;
    long long v948 = 0u;
    long long v949 = 0u;
    long long v950 = 0u;
    v180 = self->_cellularPowerLogProtocolStates;
    uint64_t v181 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v947 objects:v1120 count:16];
    if (v181)
    {
      uint64_t v182 = v181;
      uint64_t v183 = *(void *)v948;
      do
      {
        uint64_t v184 = 0;
        do
        {
          if (*(void *)v948 != v183) {
            objc_enumerationMutation(v180);
          }
          v185 = [*(id *)(*((void *)&v947 + 1) + 8 * v184) dictionaryRepresentation];
          [v179 addObject:v185];

          ++v184;
        }
        while (v182 != v184);
        uint64_t v182 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v947 objects:v1120 count:16];
      }
      while (v182);
    }

    [v3 setObject:v179 forKey:@"cellularPowerLogProtocolState"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogPLMNSearchs count])
  {
    v186 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogPLMNSearchs, "count"));
    long long v943 = 0u;
    long long v944 = 0u;
    long long v945 = 0u;
    long long v946 = 0u;
    v187 = self->_cellularPowerLogPLMNSearchs;
    uint64_t v188 = [(NSMutableArray *)v187 countByEnumeratingWithState:&v943 objects:v1119 count:16];
    if (v188)
    {
      uint64_t v189 = v188;
      uint64_t v190 = *(void *)v944;
      do
      {
        uint64_t v191 = 0;
        do
        {
          if (*(void *)v944 != v190) {
            objc_enumerationMutation(v187);
          }
          v192 = [*(id *)(*((void *)&v943 + 1) + 8 * v191) dictionaryRepresentation];
          [v186 addObject:v192];

          ++v191;
        }
        while (v189 != v191);
        uint64_t v189 = [(NSMutableArray *)v187 countByEnumeratingWithState:&v943 objects:v1119 count:16];
      }
      while (v189);
    }

    [v3 setObject:v186 forKey:@"cellularPowerLogPLMNSearch"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogGSMTxPowers count])
  {
    v193 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogGSMTxPowers, "count"));
    long long v939 = 0u;
    long long v940 = 0u;
    long long v941 = 0u;
    long long v942 = 0u;
    v194 = self->_cellularPowerLogGSMTxPowers;
    uint64_t v195 = [(NSMutableArray *)v194 countByEnumeratingWithState:&v939 objects:v1118 count:16];
    if (v195)
    {
      uint64_t v196 = v195;
      uint64_t v197 = *(void *)v940;
      do
      {
        uint64_t v198 = 0;
        do
        {
          if (*(void *)v940 != v197) {
            objc_enumerationMutation(v194);
          }
          v199 = [*(id *)(*((void *)&v939 + 1) + 8 * v198) dictionaryRepresentation];
          [v193 addObject:v199];

          ++v198;
        }
        while (v196 != v198);
        uint64_t v196 = [(NSMutableArray *)v194 countByEnumeratingWithState:&v939 objects:v1118 count:16];
      }
      while (v196);
    }

    [v3 setObject:v193 forKey:@"cellularPowerLogGSMTxPower"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogGSMRxRSSIs count])
  {
    v200 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogGSMRxRSSIs, "count"));
    long long v935 = 0u;
    long long v936 = 0u;
    long long v937 = 0u;
    long long v938 = 0u;
    v201 = self->_cellularPowerLogGSMRxRSSIs;
    uint64_t v202 = [(NSMutableArray *)v201 countByEnumeratingWithState:&v935 objects:v1117 count:16];
    if (v202)
    {
      uint64_t v203 = v202;
      uint64_t v204 = *(void *)v936;
      do
      {
        uint64_t v205 = 0;
        do
        {
          if (*(void *)v936 != v204) {
            objc_enumerationMutation(v201);
          }
          v206 = [*(id *)(*((void *)&v935 + 1) + 8 * v205) dictionaryRepresentation];
          [v200 addObject:v206];

          ++v205;
        }
        while (v203 != v205);
        uint64_t v203 = [(NSMutableArray *)v201 countByEnumeratingWithState:&v935 objects:v1117 count:16];
      }
      while (v203);
    }

    [v3 setObject:v200 forKey:@"cellularPowerLogGSMRxRSSI"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogGSMRABModes count])
  {
    v207 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogGSMRABModes, "count"));
    long long v931 = 0u;
    long long v932 = 0u;
    long long v933 = 0u;
    long long v934 = 0u;
    v208 = self->_cellularPowerLogGSMRABModes;
    uint64_t v209 = [(NSMutableArray *)v208 countByEnumeratingWithState:&v931 objects:v1116 count:16];
    if (v209)
    {
      uint64_t v210 = v209;
      uint64_t v211 = *(void *)v932;
      do
      {
        uint64_t v212 = 0;
        do
        {
          if (*(void *)v932 != v211) {
            objc_enumerationMutation(v208);
          }
          v213 = [*(id *)(*((void *)&v931 + 1) + 8 * v212) dictionaryRepresentation];
          [v207 addObject:v213];

          ++v212;
        }
        while (v210 != v212);
        uint64_t v210 = [(NSMutableArray *)v208 countByEnumeratingWithState:&v931 objects:v1116 count:16];
      }
      while (v210);
    }

    [v3 setObject:v207 forKey:@"cellularPowerLogGSM_RABMode"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogGSMRxDiversitys count])
  {
    v214 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogGSMRxDiversitys, "count"));
    long long v927 = 0u;
    long long v928 = 0u;
    long long v929 = 0u;
    long long v930 = 0u;
    v215 = self->_cellularPowerLogGSMRxDiversitys;
    uint64_t v216 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v927 objects:v1115 count:16];
    if (v216)
    {
      uint64_t v217 = v216;
      uint64_t v218 = *(void *)v928;
      do
      {
        uint64_t v219 = 0;
        do
        {
          if (*(void *)v928 != v218) {
            objc_enumerationMutation(v215);
          }
          v220 = [*(id *)(*((void *)&v927 + 1) + 8 * v219) dictionaryRepresentation];
          [v214 addObject:v220];

          ++v219;
        }
        while (v217 != v219);
        uint64_t v217 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v927 objects:v1115 count:16];
      }
      while (v217);
    }

    [v3 setObject:v214 forKey:@"cellularPowerLogGSMRxDiversity"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogWCDMATxPowers count])
  {
    v221 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogWCDMATxPowers, "count"));
    long long v923 = 0u;
    long long v924 = 0u;
    long long v925 = 0u;
    long long v926 = 0u;
    v222 = self->_cellularPowerLogWCDMATxPowers;
    uint64_t v223 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v923 objects:v1114 count:16];
    if (v223)
    {
      uint64_t v224 = v223;
      uint64_t v225 = *(void *)v924;
      do
      {
        uint64_t v226 = 0;
        do
        {
          if (*(void *)v924 != v225) {
            objc_enumerationMutation(v222);
          }
          v227 = [*(id *)(*((void *)&v923 + 1) + 8 * v226) dictionaryRepresentation];
          [v221 addObject:v227];

          ++v226;
        }
        while (v224 != v226);
        uint64_t v224 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v923 objects:v1114 count:16];
      }
      while (v224);
    }

    [v3 setObject:v221 forKey:@"cellularPowerLogWCDMATxPower"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogWCDMARxRSSIs count])
  {
    v228 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogWCDMARxRSSIs, "count"));
    long long v919 = 0u;
    long long v920 = 0u;
    long long v921 = 0u;
    long long v922 = 0u;
    v229 = self->_cellularPowerLogWCDMARxRSSIs;
    uint64_t v230 = [(NSMutableArray *)v229 countByEnumeratingWithState:&v919 objects:v1113 count:16];
    if (v230)
    {
      uint64_t v231 = v230;
      uint64_t v232 = *(void *)v920;
      do
      {
        uint64_t v233 = 0;
        do
        {
          if (*(void *)v920 != v232) {
            objc_enumerationMutation(v229);
          }
          v234 = [*(id *)(*((void *)&v919 + 1) + 8 * v233) dictionaryRepresentation];
          [v228 addObject:v234];

          ++v233;
        }
        while (v231 != v233);
        uint64_t v231 = [(NSMutableArray *)v229 countByEnumeratingWithState:&v919 objects:v1113 count:16];
      }
      while (v231);
    }

    [v3 setObject:v228 forKey:@"cellularPowerLogWCDMARxRSSI"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogWCDMARxDiversitys count])
  {
    v235 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogWCDMARxDiversitys, "count"));
    long long v915 = 0u;
    long long v916 = 0u;
    long long v917 = 0u;
    long long v918 = 0u;
    v236 = self->_cellularPowerLogWCDMARxDiversitys;
    uint64_t v237 = [(NSMutableArray *)v236 countByEnumeratingWithState:&v915 objects:v1112 count:16];
    if (v237)
    {
      uint64_t v238 = v237;
      uint64_t v239 = *(void *)v916;
      do
      {
        uint64_t v240 = 0;
        do
        {
          if (*(void *)v916 != v239) {
            objc_enumerationMutation(v236);
          }
          v241 = [*(id *)(*((void *)&v915 + 1) + 8 * v240) dictionaryRepresentation];
          [v235 addObject:v241];

          ++v240;
        }
        while (v238 != v240);
        uint64_t v238 = [(NSMutableArray *)v236 countByEnumeratingWithState:&v915 objects:v1112 count:16];
      }
      while (v238);
    }

    [v3 setObject:v235 forKey:@"cellularPowerLogWCDMARxDiversity"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogWCDMARABModes count])
  {
    v242 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogWCDMARABModes, "count"));
    long long v911 = 0u;
    long long v912 = 0u;
    long long v913 = 0u;
    long long v914 = 0u;
    v243 = self->_cellularPowerLogWCDMARABModes;
    uint64_t v244 = [(NSMutableArray *)v243 countByEnumeratingWithState:&v911 objects:v1111 count:16];
    if (v244)
    {
      uint64_t v245 = v244;
      uint64_t v246 = *(void *)v912;
      do
      {
        uint64_t v247 = 0;
        do
        {
          if (*(void *)v912 != v246) {
            objc_enumerationMutation(v243);
          }
          v248 = [*(id *)(*((void *)&v911 + 1) + 8 * v247) dictionaryRepresentation];
          [v242 addObject:v248];

          ++v247;
        }
        while (v245 != v247);
        uint64_t v245 = [(NSMutableArray *)v243 countByEnumeratingWithState:&v911 objects:v1111 count:16];
      }
      while (v245);
    }

    [v3 setObject:v242 forKey:@"cellularPowerLogWCDMA_RABMode"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogWCDMARABTypes count])
  {
    v249 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogWCDMARABTypes, "count"));
    long long v907 = 0u;
    long long v908 = 0u;
    long long v909 = 0u;
    long long v910 = 0u;
    v250 = self->_cellularPowerLogWCDMARABTypes;
    uint64_t v251 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v907 objects:v1110 count:16];
    if (v251)
    {
      uint64_t v252 = v251;
      uint64_t v253 = *(void *)v908;
      do
      {
        uint64_t v254 = 0;
        do
        {
          if (*(void *)v908 != v253) {
            objc_enumerationMutation(v250);
          }
          v255 = [*(id *)(*((void *)&v907 + 1) + 8 * v254) dictionaryRepresentation];
          [v249 addObject:v255];

          ++v254;
        }
        while (v252 != v254);
        uint64_t v252 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v907 objects:v1110 count:16];
      }
      while (v252);
    }

    [v3 setObject:v249 forKey:@"cellularPowerLogWCDMA_RABType"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogEVDOTxPowers count])
  {
    v256 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogEVDOTxPowers, "count"));
    long long v903 = 0u;
    long long v904 = 0u;
    long long v905 = 0u;
    long long v906 = 0u;
    v257 = self->_cellularPowerLogEVDOTxPowers;
    uint64_t v258 = [(NSMutableArray *)v257 countByEnumeratingWithState:&v903 objects:v1109 count:16];
    if (v258)
    {
      uint64_t v259 = v258;
      uint64_t v260 = *(void *)v904;
      do
      {
        uint64_t v261 = 0;
        do
        {
          if (*(void *)v904 != v260) {
            objc_enumerationMutation(v257);
          }
          v262 = [*(id *)(*((void *)&v903 + 1) + 8 * v261) dictionaryRepresentation];
          [v256 addObject:v262];

          ++v261;
        }
        while (v259 != v261);
        uint64_t v259 = [(NSMutableArray *)v257 countByEnumeratingWithState:&v903 objects:v1109 count:16];
      }
      while (v259);
    }

    [v3 setObject:v256 forKey:@"cellularPowerLogEVDOTxPower"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogEVDORxRSSIs count])
  {
    v263 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogEVDORxRSSIs, "count"));
    long long v899 = 0u;
    long long v900 = 0u;
    long long v901 = 0u;
    long long v902 = 0u;
    v264 = self->_cellularPowerLogEVDORxRSSIs;
    uint64_t v265 = [(NSMutableArray *)v264 countByEnumeratingWithState:&v899 objects:v1108 count:16];
    if (v265)
    {
      uint64_t v266 = v265;
      uint64_t v267 = *(void *)v900;
      do
      {
        uint64_t v268 = 0;
        do
        {
          if (*(void *)v900 != v267) {
            objc_enumerationMutation(v264);
          }
          v269 = [*(id *)(*((void *)&v899 + 1) + 8 * v268) dictionaryRepresentation];
          [v263 addObject:v269];

          ++v268;
        }
        while (v266 != v268);
        uint64_t v266 = [(NSMutableArray *)v264 countByEnumeratingWithState:&v899 objects:v1108 count:16];
      }
      while (v266);
    }

    [v3 setObject:v263 forKey:@"cellularPowerLogEVDORxRSSI"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogHybridRABModes count])
  {
    v270 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogHybridRABModes, "count"));
    long long v895 = 0u;
    long long v896 = 0u;
    long long v897 = 0u;
    long long v898 = 0u;
    v271 = self->_cellularPowerLogHybridRABModes;
    uint64_t v272 = [(NSMutableArray *)v271 countByEnumeratingWithState:&v895 objects:v1107 count:16];
    if (v272)
    {
      uint64_t v273 = v272;
      uint64_t v274 = *(void *)v896;
      do
      {
        uint64_t v275 = 0;
        do
        {
          if (*(void *)v896 != v274) {
            objc_enumerationMutation(v271);
          }
          v276 = [*(id *)(*((void *)&v895 + 1) + 8 * v275) dictionaryRepresentation];
          [v270 addObject:v276];

          ++v275;
        }
        while (v273 != v275);
        uint64_t v273 = [(NSMutableArray *)v271 countByEnumeratingWithState:&v895 objects:v1107 count:16];
      }
      while (v273);
    }

    [v3 setObject:v270 forKey:@"cellularPowerLogHybrid_RABMode"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogEVDORxDiversitys count])
  {
    v277 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogEVDORxDiversitys, "count"));
    long long v891 = 0u;
    long long v892 = 0u;
    long long v893 = 0u;
    long long v894 = 0u;
    v278 = self->_cellularPowerLogEVDORxDiversitys;
    uint64_t v279 = [(NSMutableArray *)v278 countByEnumeratingWithState:&v891 objects:v1106 count:16];
    if (v279)
    {
      uint64_t v280 = v279;
      uint64_t v281 = *(void *)v892;
      do
      {
        uint64_t v282 = 0;
        do
        {
          if (*(void *)v892 != v281) {
            objc_enumerationMutation(v278);
          }
          v283 = [*(id *)(*((void *)&v891 + 1) + 8 * v282) dictionaryRepresentation];
          [v277 addObject:v283];

          ++v282;
        }
        while (v280 != v282);
        uint64_t v280 = [(NSMutableArray *)v278 countByEnumeratingWithState:&v891 objects:v1106 count:16];
      }
      while (v280);
    }

    [v3 setObject:v277 forKey:@"cellularPowerLogEVDORxDiversity"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogCDMA1XTxPowers count])
  {
    v284 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogCDMA1XTxPowers, "count"));
    long long v887 = 0u;
    long long v888 = 0u;
    long long v889 = 0u;
    long long v890 = 0u;
    v285 = self->_cellularPowerLogCDMA1XTxPowers;
    uint64_t v286 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v887 objects:v1105 count:16];
    if (v286)
    {
      uint64_t v287 = v286;
      uint64_t v288 = *(void *)v888;
      do
      {
        uint64_t v289 = 0;
        do
        {
          if (*(void *)v888 != v288) {
            objc_enumerationMutation(v285);
          }
          v290 = [*(id *)(*((void *)&v887 + 1) + 8 * v289) dictionaryRepresentation];
          [v284 addObject:v290];

          ++v289;
        }
        while (v287 != v289);
        uint64_t v287 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v887 objects:v1105 count:16];
      }
      while (v287);
    }

    [v3 setObject:v284 forKey:@"cellularPowerLogCDMA1XTxPower"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogCDMA1XRxRSSIs count])
  {
    v291 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogCDMA1XRxRSSIs, "count"));
    long long v883 = 0u;
    long long v884 = 0u;
    long long v885 = 0u;
    long long v886 = 0u;
    v292 = self->_cellularPowerLogCDMA1XRxRSSIs;
    uint64_t v293 = [(NSMutableArray *)v292 countByEnumeratingWithState:&v883 objects:v1104 count:16];
    if (v293)
    {
      uint64_t v294 = v293;
      uint64_t v295 = *(void *)v884;
      do
      {
        uint64_t v296 = 0;
        do
        {
          if (*(void *)v884 != v295) {
            objc_enumerationMutation(v292);
          }
          v297 = [*(id *)(*((void *)&v883 + 1) + 8 * v296) dictionaryRepresentation];
          [v291 addObject:v297];

          ++v296;
        }
        while (v294 != v296);
        uint64_t v294 = [(NSMutableArray *)v292 countByEnumeratingWithState:&v883 objects:v1104 count:16];
      }
      while (v294);
    }

    [v3 setObject:v291 forKey:@"cellularPowerLogCDMA1XRxRSSI"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogCDMA1XRABModes count])
  {
    v298 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogCDMA1XRABModes, "count"));
    long long v879 = 0u;
    long long v880 = 0u;
    long long v881 = 0u;
    long long v882 = 0u;
    v299 = self->_cellularPowerLogCDMA1XRABModes;
    uint64_t v300 = [(NSMutableArray *)v299 countByEnumeratingWithState:&v879 objects:v1103 count:16];
    if (v300)
    {
      uint64_t v301 = v300;
      uint64_t v302 = *(void *)v880;
      do
      {
        uint64_t v303 = 0;
        do
        {
          if (*(void *)v880 != v302) {
            objc_enumerationMutation(v299);
          }
          v304 = [*(id *)(*((void *)&v879 + 1) + 8 * v303) dictionaryRepresentation];
          [v298 addObject:v304];

          ++v303;
        }
        while (v301 != v303);
        uint64_t v301 = [(NSMutableArray *)v299 countByEnumeratingWithState:&v879 objects:v1103 count:16];
      }
      while (v301);
    }

    [v3 setObject:v298 forKey:@"cellularPowerLogCDMA1X_RABMode"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogCDMA1XRxDiversitys count])
  {
    v305 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogCDMA1XRxDiversitys, "count"));
    long long v875 = 0u;
    long long v876 = 0u;
    long long v877 = 0u;
    long long v878 = 0u;
    v306 = self->_cellularPowerLogCDMA1XRxDiversitys;
    uint64_t v307 = [(NSMutableArray *)v306 countByEnumeratingWithState:&v875 objects:v1102 count:16];
    if (v307)
    {
      uint64_t v308 = v307;
      uint64_t v309 = *(void *)v876;
      do
      {
        uint64_t v310 = 0;
        do
        {
          if (*(void *)v876 != v309) {
            objc_enumerationMutation(v306);
          }
          v311 = [*(id *)(*((void *)&v875 + 1) + 8 * v310) dictionaryRepresentation];
          [v305 addObject:v311];

          ++v310;
        }
        while (v308 != v310);
        uint64_t v308 = [(NSMutableArray *)v306 countByEnumeratingWithState:&v875 objects:v1102 count:16];
      }
      while (v308);
    }

    [v3 setObject:v305 forKey:@"cellularPowerLogCDMA1XRxDiversity"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTEPagingDRXCycles count])
  {
    v312 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTEPagingDRXCycles, "count"));
    long long v871 = 0u;
    long long v872 = 0u;
    long long v873 = 0u;
    long long v874 = 0u;
    v313 = self->_cellularPowerLogLTEPagingDRXCycles;
    uint64_t v314 = [(NSMutableArray *)v313 countByEnumeratingWithState:&v871 objects:v1101 count:16];
    if (v314)
    {
      uint64_t v315 = v314;
      uint64_t v316 = *(void *)v872;
      do
      {
        uint64_t v317 = 0;
        do
        {
          if (*(void *)v872 != v316) {
            objc_enumerationMutation(v313);
          }
          v318 = [*(id *)(*((void *)&v871 + 1) + 8 * v317) dictionaryRepresentation];
          [v312 addObject:v318];

          ++v317;
        }
        while (v315 != v317);
        uint64_t v315 = [(NSMutableArray *)v313 countByEnumeratingWithState:&v871 objects:v1101 count:16];
      }
      while (v315);
    }

    [v3 setObject:v312 forKey:@"cellularPowerLogLTEPagingDRXCycle"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRPagingDRXCycles count])
  {
    v319 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRPagingDRXCycles, "count"));
    long long v867 = 0u;
    long long v868 = 0u;
    long long v869 = 0u;
    long long v870 = 0u;
    v320 = self->_cellularPowerLogNRPagingDRXCycles;
    uint64_t v321 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v867 objects:v1100 count:16];
    if (v321)
    {
      uint64_t v322 = v321;
      uint64_t v323 = *(void *)v868;
      do
      {
        uint64_t v324 = 0;
        do
        {
          if (*(void *)v868 != v323) {
            objc_enumerationMutation(v320);
          }
          v325 = [*(id *)(*((void *)&v867 + 1) + 8 * v324) dictionaryRepresentation];
          [v319 addObject:v325];

          ++v324;
        }
        while (v322 != v324);
        uint64_t v322 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v867 objects:v1100 count:16];
      }
      while (v322);
    }

    [v3 setObject:v319 forKey:@"cellularPowerLogNRPagingDRXCycle"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRSCGRels count])
  {
    v326 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRSCGRels, "count"));
    long long v863 = 0u;
    long long v864 = 0u;
    long long v865 = 0u;
    long long v866 = 0u;
    v327 = self->_cellularPowerLogNRSCGRels;
    uint64_t v328 = [(NSMutableArray *)v327 countByEnumeratingWithState:&v863 objects:v1099 count:16];
    if (v328)
    {
      uint64_t v329 = v328;
      uint64_t v330 = *(void *)v864;
      do
      {
        uint64_t v331 = 0;
        do
        {
          if (*(void *)v864 != v330) {
            objc_enumerationMutation(v327);
          }
          v332 = [*(id *)(*((void *)&v863 + 1) + 8 * v331) dictionaryRepresentation];
          [v326 addObject:v332];

          ++v331;
        }
        while (v329 != v331);
        uint64_t v329 = [(NSMutableArray *)v327 countByEnumeratingWithState:&v863 objects:v1099 count:16];
      }
      while (v329);
    }

    [v3 setObject:v326 forKey:@"cellularPowerLogNR_SCGRel"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogWCDMACDRXConfigs count])
  {
    v333 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogWCDMACDRXConfigs, "count"));
    long long v859 = 0u;
    long long v860 = 0u;
    long long v861 = 0u;
    long long v862 = 0u;
    v334 = self->_cellularPowerLogWCDMACDRXConfigs;
    uint64_t v335 = [(NSMutableArray *)v334 countByEnumeratingWithState:&v859 objects:v1098 count:16];
    if (v335)
    {
      uint64_t v336 = v335;
      uint64_t v337 = *(void *)v860;
      do
      {
        uint64_t v338 = 0;
        do
        {
          if (*(void *)v860 != v337) {
            objc_enumerationMutation(v334);
          }
          v339 = [*(id *)(*((void *)&v859 + 1) + 8 * v338) dictionaryRepresentation];
          [v333 addObject:v339];

          ++v338;
        }
        while (v336 != v338);
        uint64_t v336 = [(NSMutableArray *)v334 countByEnumeratingWithState:&v859 objects:v1098 count:16];
      }
      while (v336);
    }

    [v3 setObject:v333 forKey:@"cellularPowerLogWCDMA_CDRXConfig"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTECDRXConfigs count])
  {
    v340 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTECDRXConfigs, "count"));
    long long v855 = 0u;
    long long v856 = 0u;
    long long v857 = 0u;
    long long v858 = 0u;
    v341 = self->_cellularPowerLogLTECDRXConfigs;
    uint64_t v342 = [(NSMutableArray *)v341 countByEnumeratingWithState:&v855 objects:v1097 count:16];
    if (v342)
    {
      uint64_t v343 = v342;
      uint64_t v344 = *(void *)v856;
      do
      {
        uint64_t v345 = 0;
        do
        {
          if (*(void *)v856 != v344) {
            objc_enumerationMutation(v341);
          }
          v346 = [*(id *)(*((void *)&v855 + 1) + 8 * v345) dictionaryRepresentation];
          [v340 addObject:v346];

          ++v345;
        }
        while (v343 != v345);
        uint64_t v343 = [(NSMutableArray *)v341 countByEnumeratingWithState:&v855 objects:v1097 count:16];
      }
      while (v343);
    }

    [v3 setObject:v340 forKey:@"cellularPowerLogLTE_CDRXConfig"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogWCDMARRCStateChanges count])
  {
    v347 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogWCDMARRCStateChanges, "count"));
    long long v851 = 0u;
    long long v852 = 0u;
    long long v853 = 0u;
    long long v854 = 0u;
    v348 = self->_cellularPowerLogWCDMARRCStateChanges;
    uint64_t v349 = [(NSMutableArray *)v348 countByEnumeratingWithState:&v851 objects:v1096 count:16];
    if (v349)
    {
      uint64_t v350 = v349;
      uint64_t v351 = *(void *)v852;
      do
      {
        uint64_t v352 = 0;
        do
        {
          if (*(void *)v852 != v351) {
            objc_enumerationMutation(v348);
          }
          v353 = [*(id *)(*((void *)&v851 + 1) + 8 * v352) dictionaryRepresentation];
          [v347 addObject:v353];

          ++v352;
        }
        while (v350 != v352);
        uint64_t v350 = [(NSMutableArray *)v348 countByEnumeratingWithState:&v851 objects:v1096 count:16];
      }
      while (v350);
    }

    [v3 setObject:v347 forKey:@"cellularPowerLogWCDMA_RRCStateChange"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogLTERRCStateChanges count])
  {
    v354 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogLTERRCStateChanges, "count"));
    long long v847 = 0u;
    long long v848 = 0u;
    long long v849 = 0u;
    long long v850 = 0u;
    v355 = self->_cellularPowerLogLTERRCStateChanges;
    uint64_t v356 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v847 objects:v1095 count:16];
    if (v356)
    {
      uint64_t v357 = v356;
      uint64_t v358 = *(void *)v848;
      do
      {
        uint64_t v359 = 0;
        do
        {
          if (*(void *)v848 != v358) {
            objc_enumerationMutation(v355);
          }
          v360 = [*(id *)(*((void *)&v847 + 1) + 8 * v359) dictionaryRepresentation];
          [v354 addObject:v360];

          ++v359;
        }
        while (v357 != v359);
        uint64_t v357 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v847 objects:v1095 count:16];
      }
      while (v357);
    }

    [v3 setObject:v354 forKey:@"cellularPowerLogLTE_RRCStateChange"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogSystemEvents count])
  {
    v361 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogSystemEvents, "count"));
    long long v843 = 0u;
    long long v844 = 0u;
    long long v845 = 0u;
    long long v846 = 0u;
    v362 = self->_cellularPowerLogSystemEvents;
    uint64_t v363 = [(NSMutableArray *)v362 countByEnumeratingWithState:&v843 objects:v1094 count:16];
    if (v363)
    {
      uint64_t v364 = v363;
      uint64_t v365 = *(void *)v844;
      do
      {
        uint64_t v366 = 0;
        do
        {
          if (*(void *)v844 != v365) {
            objc_enumerationMutation(v362);
          }
          v367 = [*(id *)(*((void *)&v843 + 1) + 8 * v366) dictionaryRepresentation];
          [v361 addObject:v367];

          ++v366;
        }
        while (v364 != v366);
        uint64_t v364 = [(NSMutableArray *)v362 countByEnumeratingWithState:&v843 objects:v1094 count:16];
      }
      while (v364);
    }

    [v3 setObject:v361 forKey:@"cellularPowerLogSystemEvent"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogRATReselectionEvents count])
  {
    v368 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogRATReselectionEvents, "count"));
    long long v839 = 0u;
    long long v840 = 0u;
    long long v841 = 0u;
    long long v842 = 0u;
    v369 = self->_cellularPowerLogRATReselectionEvents;
    uint64_t v370 = [(NSMutableArray *)v369 countByEnumeratingWithState:&v839 objects:v1093 count:16];
    if (v370)
    {
      uint64_t v371 = v370;
      uint64_t v372 = *(void *)v840;
      do
      {
        uint64_t v373 = 0;
        do
        {
          if (*(void *)v840 != v372) {
            objc_enumerationMutation(v369);
          }
          v374 = [*(id *)(*((void *)&v839 + 1) + 8 * v373) dictionaryRepresentation];
          [v368 addObject:v374];

          ++v373;
        }
        while (v371 != v373);
        uint64_t v371 = [(NSMutableArray *)v369 countByEnumeratingWithState:&v839 objects:v1093 count:16];
      }
      while (v371);
    }

    [v3 setObject:v368 forKey:@"cellularPowerLogRATReselectionEvent"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogRATRedirectionEvents count])
  {
    v375 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogRATRedirectionEvents, "count"));
    long long v835 = 0u;
    long long v836 = 0u;
    long long v837 = 0u;
    long long v838 = 0u;
    v376 = self->_cellularPowerLogRATRedirectionEvents;
    uint64_t v377 = [(NSMutableArray *)v376 countByEnumeratingWithState:&v835 objects:v1092 count:16];
    if (v377)
    {
      uint64_t v378 = v377;
      uint64_t v379 = *(void *)v836;
      do
      {
        uint64_t v380 = 0;
        do
        {
          if (*(void *)v836 != v379) {
            objc_enumerationMutation(v376);
          }
          v381 = [*(id *)(*((void *)&v835 + 1) + 8 * v380) dictionaryRepresentation];
          [v375 addObject:v381];

          ++v380;
        }
        while (v378 != v380);
        uint64_t v378 = [(NSMutableArray *)v376 countByEnumeratingWithState:&v835 objects:v1092 count:16];
      }
      while (v378);
    }

    [v3 setObject:v375 forKey:@"cellularPowerLogRATRedirectionEvent"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogGSMRRCStateChanges count])
  {
    v382 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogGSMRRCStateChanges, "count"));
    long long v831 = 0u;
    long long v832 = 0u;
    long long v833 = 0u;
    long long v834 = 0u;
    v383 = self->_cellularPowerLogGSMRRCStateChanges;
    uint64_t v384 = [(NSMutableArray *)v383 countByEnumeratingWithState:&v831 objects:v1091 count:16];
    if (v384)
    {
      uint64_t v385 = v384;
      uint64_t v386 = *(void *)v832;
      do
      {
        uint64_t v387 = 0;
        do
        {
          if (*(void *)v832 != v386) {
            objc_enumerationMutation(v383);
          }
          v388 = [*(id *)(*((void *)&v831 + 1) + 8 * v387) dictionaryRepresentation];
          [v382 addObject:v388];

          ++v387;
        }
        while (v385 != v387);
        uint64_t v385 = [(NSMutableArray *)v383 countByEnumeratingWithState:&v831 objects:v1091 count:16];
      }
      while (v385);
    }

    [v3 setObject:v382 forKey:@"cellularPowerLogGSM_RRCStateChange"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogCDMA1XRRCStateChanges count])
  {
    v389 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogCDMA1XRRCStateChanges, "count"));
    long long v827 = 0u;
    long long v828 = 0u;
    long long v829 = 0u;
    long long v830 = 0u;
    v390 = self->_cellularPowerLogCDMA1XRRCStateChanges;
    uint64_t v391 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v827 objects:v1090 count:16];
    if (v391)
    {
      uint64_t v392 = v391;
      uint64_t v393 = *(void *)v828;
      do
      {
        uint64_t v394 = 0;
        do
        {
          if (*(void *)v828 != v393) {
            objc_enumerationMutation(v390);
          }
          v395 = [*(id *)(*((void *)&v827 + 1) + 8 * v394) dictionaryRepresentation];
          [v389 addObject:v395];

          ++v394;
        }
        while (v392 != v394);
        uint64_t v392 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v827 objects:v1090 count:16];
      }
      while (v392);
    }

    [v3 setObject:v389 forKey:@"cellularPowerLogCDMA1XRRCStateChange"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogHybridRRCStateChanges count])
  {
    v396 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogHybridRRCStateChanges, "count"));
    long long v823 = 0u;
    long long v824 = 0u;
    long long v825 = 0u;
    long long v826 = 0u;
    v397 = self->_cellularPowerLogHybridRRCStateChanges;
    uint64_t v398 = [(NSMutableArray *)v397 countByEnumeratingWithState:&v823 objects:v1089 count:16];
    if (v398)
    {
      uint64_t v399 = v398;
      uint64_t v400 = *(void *)v824;
      do
      {
        uint64_t v401 = 0;
        do
        {
          if (*(void *)v824 != v400) {
            objc_enumerationMutation(v397);
          }
          v402 = [*(id *)(*((void *)&v823 + 1) + 8 * v401) dictionaryRepresentation];
          [v396 addObject:v402];

          ++v401;
        }
        while (v399 != v401);
        uint64_t v399 = [(NSMutableArray *)v397 countByEnumeratingWithState:&v823 objects:v1089 count:16];
      }
      while (v399);
    }

    [v3 setObject:v396 forKey:@"cellularPowerLogHybridRRCStateChange"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogServiceStateEvents count])
  {
    v403 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogServiceStateEvents, "count"));
    long long v819 = 0u;
    long long v820 = 0u;
    long long v821 = 0u;
    long long v822 = 0u;
    v404 = self->_cellularPowerLogServiceStateEvents;
    uint64_t v405 = [(NSMutableArray *)v404 countByEnumeratingWithState:&v819 objects:v1088 count:16];
    if (v405)
    {
      uint64_t v406 = v405;
      uint64_t v407 = *(void *)v820;
      do
      {
        uint64_t v408 = 0;
        do
        {
          if (*(void *)v820 != v407) {
            objc_enumerationMutation(v404);
          }
          v409 = [*(id *)(*((void *)&v819 + 1) + 8 * v408) dictionaryRepresentation];
          [v403 addObject:v409];

          ++v408;
        }
        while (v406 != v408);
        uint64_t v406 = [(NSMutableArray *)v404 countByEnumeratingWithState:&v819 objects:v1088 count:16];
      }
      while (v406);
    }

    [v3 setObject:v403 forKey:@"cellularPowerLogServiceStateEvent"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogPLMNScanEvents count])
  {
    v410 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogPLMNScanEvents, "count"));
    long long v815 = 0u;
    long long v816 = 0u;
    long long v817 = 0u;
    long long v818 = 0u;
    v411 = self->_cellularPowerLogPLMNScanEvents;
    uint64_t v412 = [(NSMutableArray *)v411 countByEnumeratingWithState:&v815 objects:v1087 count:16];
    if (v412)
    {
      uint64_t v413 = v412;
      uint64_t v414 = *(void *)v816;
      do
      {
        uint64_t v415 = 0;
        do
        {
          if (*(void *)v816 != v414) {
            objc_enumerationMutation(v411);
          }
          v416 = [*(id *)(*((void *)&v815 + 1) + 8 * v415) dictionaryRepresentation];
          [v410 addObject:v416];

          ++v415;
        }
        while (v413 != v415);
        uint64_t v413 = [(NSMutableArray *)v411 countByEnumeratingWithState:&v815 objects:v1087 count:16];
      }
      while (v413);
    }

    [v3 setObject:v410 forKey:@"cellularPowerLogPLMNScanEvent"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogPLMNSearchEvents count])
  {
    v417 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogPLMNSearchEvents, "count"));
    long long v811 = 0u;
    long long v812 = 0u;
    long long v813 = 0u;
    long long v814 = 0u;
    v418 = self->_cellularPowerLogPLMNSearchEvents;
    uint64_t v419 = [(NSMutableArray *)v418 countByEnumeratingWithState:&v811 objects:v1086 count:16];
    if (v419)
    {
      uint64_t v420 = v419;
      uint64_t v421 = *(void *)v812;
      do
      {
        uint64_t v422 = 0;
        do
        {
          if (*(void *)v812 != v421) {
            objc_enumerationMutation(v418);
          }
          v423 = [*(id *)(*((void *)&v811 + 1) + 8 * v422) dictionaryRepresentation];
          [v417 addObject:v423];

          ++v422;
        }
        while (v420 != v422);
        uint64_t v420 = [(NSMutableArray *)v418 countByEnumeratingWithState:&v811 objects:v1086 count:16];
      }
      while (v420);
    }

    [v3 setObject:v417 forKey:@"cellularPowerLogPLMNSearchEvent"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRSARRCStateChanges count])
  {
    v424 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRSARRCStateChanges, "count"));
    long long v807 = 0u;
    long long v808 = 0u;
    long long v809 = 0u;
    long long v810 = 0u;
    v425 = self->_cellularPowerLogNRSARRCStateChanges;
    uint64_t v426 = [(NSMutableArray *)v425 countByEnumeratingWithState:&v807 objects:v1085 count:16];
    if (v426)
    {
      uint64_t v427 = v426;
      uint64_t v428 = *(void *)v808;
      do
      {
        uint64_t v429 = 0;
        do
        {
          if (*(void *)v808 != v428) {
            objc_enumerationMutation(v425);
          }
          v430 = [*(id *)(*((void *)&v807 + 1) + 8 * v429) dictionaryRepresentation];
          [v424 addObject:v430];

          ++v429;
        }
        while (v427 != v429);
        uint64_t v427 = [(NSMutableArray *)v425 countByEnumeratingWithState:&v807 objects:v1085 count:16];
      }
      while (v427);
    }

    [v3 setObject:v424 forKey:@"cellularPowerLogNR_SA_RRCStateChange"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRNSAENDCEvents count])
  {
    v431 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRNSAENDCEvents, "count"));
    long long v803 = 0u;
    long long v804 = 0u;
    long long v805 = 0u;
    long long v806 = 0u;
    v432 = self->_cellularPowerLogNRNSAENDCEvents;
    uint64_t v433 = [(NSMutableArray *)v432 countByEnumeratingWithState:&v803 objects:v1084 count:16];
    if (v433)
    {
      uint64_t v434 = v433;
      uint64_t v435 = *(void *)v804;
      do
      {
        uint64_t v436 = 0;
        do
        {
          if (*(void *)v804 != v435) {
            objc_enumerationMutation(v432);
          }
          v437 = [*(id *)(*((void *)&v803 + 1) + 8 * v436) dictionaryRepresentation];
          [v431 addObject:v437];

          ++v436;
        }
        while (v434 != v436);
        uint64_t v434 = [(NSMutableArray *)v432 countByEnumeratingWithState:&v803 objects:v1084 count:16];
      }
      while (v434);
    }

    [v3 setObject:v431 forKey:@"cellularPowerLogNR_NSA_ENDCEvent"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRCDRXConfigs count])
  {
    v438 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRCDRXConfigs, "count"));
    long long v799 = 0u;
    long long v800 = 0u;
    long long v801 = 0u;
    long long v802 = 0u;
    v439 = self->_cellularPowerLogNRCDRXConfigs;
    uint64_t v440 = [(NSMutableArray *)v439 countByEnumeratingWithState:&v799 objects:v1083 count:16];
    if (v440)
    {
      uint64_t v441 = v440;
      uint64_t v442 = *(void *)v800;
      do
      {
        uint64_t v443 = 0;
        do
        {
          if (*(void *)v800 != v442) {
            objc_enumerationMutation(v439);
          }
          v444 = [*(id *)(*((void *)&v799 + 1) + 8 * v443) dictionaryRepresentation];
          [v438 addObject:v444];

          ++v443;
        }
        while (v441 != v443);
        uint64_t v441 = [(NSMutableArray *)v439 countByEnumeratingWithState:&v799 objects:v1083 count:16];
      }
      while (v441);
    }

    [v3 setObject:v438 forKey:@"cellularPowerLogNR_CDRXConfig"];
  }
  if ([(NSMutableArray *)self->_cellularNrSDMActivations count])
  {
    v445 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularNrSDMActivations, "count"));
    long long v795 = 0u;
    long long v796 = 0u;
    long long v797 = 0u;
    long long v798 = 0u;
    v446 = self->_cellularNrSDMActivations;
    uint64_t v447 = [(NSMutableArray *)v446 countByEnumeratingWithState:&v795 objects:v1082 count:16];
    if (v447)
    {
      uint64_t v448 = v447;
      uint64_t v449 = *(void *)v796;
      do
      {
        uint64_t v450 = 0;
        do
        {
          if (*(void *)v796 != v449) {
            objc_enumerationMutation(v446);
          }
          v451 = [*(id *)(*((void *)&v795 + 1) + 8 * v450) dictionaryRepresentation];
          [v445 addObject:v451];

          ++v450;
        }
        while (v448 != v450);
        uint64_t v448 = [(NSMutableArray *)v446 countByEnumeratingWithState:&v795 objects:v1082 count:16];
      }
      while (v448);
    }

    [v3 setObject:v445 forKey:@"cellularNrSDMActivation"];
  }
  if ([(NSMutableArray *)self->_cellularNrSdmEndcReleases count])
  {
    v452 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularNrSdmEndcReleases, "count"));
    long long v791 = 0u;
    long long v792 = 0u;
    long long v793 = 0u;
    long long v794 = 0u;
    v453 = self->_cellularNrSdmEndcReleases;
    uint64_t v454 = [(NSMutableArray *)v453 countByEnumeratingWithState:&v791 objects:v1081 count:16];
    if (v454)
    {
      uint64_t v455 = v454;
      uint64_t v456 = *(void *)v792;
      do
      {
        uint64_t v457 = 0;
        do
        {
          if (*(void *)v792 != v456) {
            objc_enumerationMutation(v453);
          }
          v458 = [*(id *)(*((void *)&v791 + 1) + 8 * v457) dictionaryRepresentation];
          [v452 addObject:v458];

          ++v457;
        }
        while (v455 != v457);
        uint64_t v455 = [(NSMutableArray *)v453 countByEnumeratingWithState:&v791 objects:v1081 count:16];
      }
      while (v455);
    }

    [v3 setObject:v452 forKey:@"cellularNrSdmEndcRelease"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRFRCoverages count])
  {
    v459 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRFRCoverages, "count"));
    long long v787 = 0u;
    long long v788 = 0u;
    long long v789 = 0u;
    long long v790 = 0u;
    v460 = self->_cellularPowerLogNRFRCoverages;
    uint64_t v461 = [(NSMutableArray *)v460 countByEnumeratingWithState:&v787 objects:v1080 count:16];
    if (v461)
    {
      uint64_t v462 = v461;
      uint64_t v463 = *(void *)v788;
      do
      {
        uint64_t v464 = 0;
        do
        {
          if (*(void *)v788 != v463) {
            objc_enumerationMutation(v460);
          }
          v465 = [*(id *)(*((void *)&v787 + 1) + 8 * v464) dictionaryRepresentation];
          [v459 addObject:v465];

          ++v464;
        }
        while (v462 != v464);
        uint64_t v462 = [(NSMutableArray *)v460 countByEnumeratingWithState:&v787 objects:v1080 count:16];
      }
      while (v462);
    }

    [v3 setObject:v459 forKey:@"cellularPowerLogNR_FRCoverage"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRDCEvents count])
  {
    v466 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRDCEvents, "count"));
    long long v783 = 0u;
    long long v784 = 0u;
    long long v785 = 0u;
    long long v786 = 0u;
    v467 = self->_cellularPowerLogNRDCEvents;
    uint64_t v468 = [(NSMutableArray *)v467 countByEnumeratingWithState:&v783 objects:v1079 count:16];
    if (v468)
    {
      uint64_t v469 = v468;
      uint64_t v470 = *(void *)v784;
      do
      {
        uint64_t v471 = 0;
        do
        {
          if (*(void *)v784 != v470) {
            objc_enumerationMutation(v467);
          }
          v472 = [*(id *)(*((void *)&v783 + 1) + 8 * v471) dictionaryRepresentation];
          [v466 addObject:v472];

          ++v471;
        }
        while (v469 != v471);
        uint64_t v469 = [(NSMutableArray *)v467 countByEnumeratingWithState:&v783 objects:v1079 count:16];
      }
      while (v469);
    }

    [v3 setObject:v466 forKey:@"cellularPowerLogNRDCEvent"];
  }
  if ([(NSMutableArray *)self->_cellularDynamicRatSelections count])
  {
    v473 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularDynamicRatSelections, "count"));
    long long v779 = 0u;
    long long v780 = 0u;
    long long v781 = 0u;
    long long v782 = 0u;
    v474 = self->_cellularDynamicRatSelections;
    uint64_t v475 = [(NSMutableArray *)v474 countByEnumeratingWithState:&v779 objects:v1078 count:16];
    if (v475)
    {
      uint64_t v476 = v475;
      uint64_t v477 = *(void *)v780;
      do
      {
        uint64_t v478 = 0;
        do
        {
          if (*(void *)v780 != v477) {
            objc_enumerationMutation(v474);
          }
          v479 = [*(id *)(*((void *)&v779 + 1) + 8 * v478) dictionaryRepresentation];
          [v473 addObject:v479];

          ++v478;
        }
        while (v476 != v478);
        uint64_t v476 = [(NSMutableArray *)v474 countByEnumeratingWithState:&v779 objects:v1078 count:16];
      }
      while (v476);
    }

    [v3 setObject:v473 forKey:@"cellularDynamicRatSelection"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogWUSs count])
  {
    v480 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogWUSs, "count"));
    long long v775 = 0u;
    long long v776 = 0u;
    long long v777 = 0u;
    long long v778 = 0u;
    v481 = self->_cellularPowerLogWUSs;
    uint64_t v482 = [(NSMutableArray *)v481 countByEnumeratingWithState:&v775 objects:v1077 count:16];
    if (v482)
    {
      uint64_t v483 = v482;
      uint64_t v484 = *(void *)v776;
      do
      {
        uint64_t v485 = 0;
        do
        {
          if (*(void *)v776 != v484) {
            objc_enumerationMutation(v481);
          }
          v486 = [*(id *)(*((void *)&v775 + 1) + 8 * v485) dictionaryRepresentation];
          [v480 addObject:v486];

          ++v485;
        }
        while (v483 != v485);
        uint64_t v483 = [(NSMutableArray *)v481 countByEnumeratingWithState:&v775 objects:v1077 count:16];
      }
      while (v483);
    }

    [v3 setObject:v480 forKey:@"cellularPowerLogWUS"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6BWPs count])
  {
    v487 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6BWPs, "count"));
    long long v771 = 0u;
    long long v772 = 0u;
    long long v773 = 0u;
    long long v774 = 0u;
    v488 = self->_cellularPowerLogNRsub6BWPs;
    uint64_t v489 = [(NSMutableArray *)v488 countByEnumeratingWithState:&v771 objects:v1076 count:16];
    if (v489)
    {
      uint64_t v490 = v489;
      uint64_t v491 = *(void *)v772;
      do
      {
        uint64_t v492 = 0;
        do
        {
          if (*(void *)v772 != v491) {
            objc_enumerationMutation(v488);
          }
          v493 = [*(id *)(*((void *)&v771 + 1) + 8 * v492) dictionaryRepresentation];
          [v487 addObject:v493];

          ++v492;
        }
        while (v490 != v492);
        uint64_t v490 = [(NSMutableArray *)v488 countByEnumeratingWithState:&v771 objects:v1076 count:16];
      }
      while (v490);
    }

    [v3 setObject:v487 forKey:@"cellularPowerLogNRsub6BWP"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6CASCCConfigureds count])
  {
    v494 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6CASCCConfigureds, "count"));
    long long v767 = 0u;
    long long v768 = 0u;
    long long v769 = 0u;
    long long v770 = 0u;
    v495 = self->_cellularPowerLogNRsub6CASCCConfigureds;
    uint64_t v496 = [(NSMutableArray *)v495 countByEnumeratingWithState:&v767 objects:v1075 count:16];
    if (v496)
    {
      uint64_t v497 = v496;
      uint64_t v498 = *(void *)v768;
      do
      {
        uint64_t v499 = 0;
        do
        {
          if (*(void *)v768 != v498) {
            objc_enumerationMutation(v495);
          }
          v500 = [*(id *)(*((void *)&v767 + 1) + 8 * v499) dictionaryRepresentation];
          [v494 addObject:v500];

          ++v499;
        }
        while (v497 != v499);
        uint64_t v497 = [(NSMutableArray *)v495 countByEnumeratingWithState:&v767 objects:v1075 count:16];
      }
      while (v497);
    }

    [v3 setObject:v494 forKey:@"cellularPowerLogNRsub6CA_SCCConfigured"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6CASCCActivateds count])
  {
    v501 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6CASCCActivateds, "count"));
    long long v763 = 0u;
    long long v764 = 0u;
    long long v765 = 0u;
    long long v766 = 0u;
    v502 = self->_cellularPowerLogNRsub6CASCCActivateds;
    uint64_t v503 = [(NSMutableArray *)v502 countByEnumeratingWithState:&v763 objects:v1074 count:16];
    if (v503)
    {
      uint64_t v504 = v503;
      uint64_t v505 = *(void *)v764;
      do
      {
        uint64_t v506 = 0;
        do
        {
          if (*(void *)v764 != v505) {
            objc_enumerationMutation(v502);
          }
          v507 = [*(id *)(*((void *)&v763 + 1) + 8 * v506) dictionaryRepresentation];
          [v501 addObject:v507];

          ++v506;
        }
        while (v504 != v506);
        uint64_t v504 = [(NSMutableArray *)v502 countByEnumeratingWithState:&v763 objects:v1074 count:16];
      }
      while (v504);
    }

    [v3 setObject:v501 forKey:@"cellularPowerLogNRsub6CA_SCCActivated"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6RxTxs count])
  {
    v508 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6RxTxs, "count"));
    long long v759 = 0u;
    long long v760 = 0u;
    long long v761 = 0u;
    long long v762 = 0u;
    v509 = self->_cellularPowerLogNRsub6RxTxs;
    uint64_t v510 = [(NSMutableArray *)v509 countByEnumeratingWithState:&v759 objects:v1073 count:16];
    if (v510)
    {
      uint64_t v511 = v510;
      uint64_t v512 = *(void *)v760;
      do
      {
        uint64_t v513 = 0;
        do
        {
          if (*(void *)v760 != v512) {
            objc_enumerationMutation(v509);
          }
          v514 = [*(id *)(*((void *)&v759 + 1) + 8 * v513) dictionaryRepresentation];
          [v508 addObject:v514];

          ++v513;
        }
        while (v511 != v513);
        uint64_t v511 = [(NSMutableArray *)v509 countByEnumeratingWithState:&v759 objects:v1073 count:16];
      }
      while (v511);
    }

    [v3 setObject:v508 forKey:@"cellularPowerLogNRsub6RxTx"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6CarrierComponentInfos count])
  {
    v515 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6CarrierComponentInfos, "count"));
    long long v755 = 0u;
    long long v756 = 0u;
    long long v757 = 0u;
    long long v758 = 0u;
    v516 = self->_cellularPowerLogNRsub6CarrierComponentInfos;
    uint64_t v517 = [(NSMutableArray *)v516 countByEnumeratingWithState:&v755 objects:v1072 count:16];
    if (v517)
    {
      uint64_t v518 = v517;
      uint64_t v519 = *(void *)v756;
      do
      {
        uint64_t v520 = 0;
        do
        {
          if (*(void *)v756 != v519) {
            objc_enumerationMutation(v516);
          }
          v521 = [*(id *)(*((void *)&v755 + 1) + 8 * v520) dictionaryRepresentation];
          [v515 addObject:v521];

          ++v520;
        }
        while (v518 != v520);
        uint64_t v518 = [(NSMutableArray *)v516 countByEnumeratingWithState:&v755 objects:v1072 count:16];
      }
      while (v518);
    }

    [v3 setObject:v515 forKey:@"cellularPowerLogNRsub6CarrierComponentInfo"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6DLTBSs count])
  {
    v522 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6DLTBSs, "count"));
    long long v751 = 0u;
    long long v752 = 0u;
    long long v753 = 0u;
    long long v754 = 0u;
    v523 = self->_cellularPowerLogNRsub6DLTBSs;
    uint64_t v524 = [(NSMutableArray *)v523 countByEnumeratingWithState:&v751 objects:v1071 count:16];
    if (v524)
    {
      uint64_t v525 = v524;
      uint64_t v526 = *(void *)v752;
      do
      {
        uint64_t v527 = 0;
        do
        {
          if (*(void *)v752 != v526) {
            objc_enumerationMutation(v523);
          }
          v528 = [*(id *)(*((void *)&v751 + 1) + 8 * v527) dictionaryRepresentation];
          [v522 addObject:v528];

          ++v527;
        }
        while (v525 != v527);
        uint64_t v525 = [(NSMutableArray *)v523 countByEnumeratingWithState:&v751 objects:v1071 count:16];
      }
      while (v525);
    }

    [v3 setObject:v522 forKey:@"cellularPowerLogNRsub6DL_TBS"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6RSRPs count])
  {
    v529 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6RSRPs, "count"));
    long long v747 = 0u;
    long long v748 = 0u;
    long long v749 = 0u;
    long long v750 = 0u;
    v530 = self->_cellularPowerLogNRsub6RSRPs;
    uint64_t v531 = [(NSMutableArray *)v530 countByEnumeratingWithState:&v747 objects:v1070 count:16];
    if (v531)
    {
      uint64_t v532 = v531;
      uint64_t v533 = *(void *)v748;
      do
      {
        uint64_t v534 = 0;
        do
        {
          if (*(void *)v748 != v533) {
            objc_enumerationMutation(v530);
          }
          v535 = [*(id *)(*((void *)&v747 + 1) + 8 * v534) dictionaryRepresentation];
          [v529 addObject:v535];

          ++v534;
        }
        while (v532 != v534);
        uint64_t v532 = [(NSMutableArray *)v530 countByEnumeratingWithState:&v747 objects:v1070 count:16];
      }
      while (v532);
    }

    [v3 setObject:v529 forKey:@"cellularPowerLogNRsub6RSRP"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6ULCAStates count])
  {
    v536 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6ULCAStates, "count"));
    long long v743 = 0u;
    long long v744 = 0u;
    long long v745 = 0u;
    long long v746 = 0u;
    v537 = self->_cellularPowerLogNRsub6ULCAStates;
    uint64_t v538 = [(NSMutableArray *)v537 countByEnumeratingWithState:&v743 objects:v1069 count:16];
    if (v538)
    {
      uint64_t v539 = v538;
      uint64_t v540 = *(void *)v744;
      do
      {
        uint64_t v541 = 0;
        do
        {
          if (*(void *)v744 != v540) {
            objc_enumerationMutation(v537);
          }
          v542 = [*(id *)(*((void *)&v743 + 1) + 8 * v541) dictionaryRepresentation];
          [v536 addObject:v542];

          ++v541;
        }
        while (v539 != v541);
        uint64_t v539 = [(NSMutableArray *)v537 countByEnumeratingWithState:&v743 objects:v1069 count:16];
      }
      while (v539);
    }

    [v3 setObject:v536 forKey:@"cellularPowerLogNRsub6UL_CAState"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6TxPowers count])
  {
    v543 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6TxPowers, "count"));
    long long v739 = 0u;
    long long v740 = 0u;
    long long v741 = 0u;
    long long v742 = 0u;
    v544 = self->_cellularPowerLogNRsub6TxPowers;
    uint64_t v545 = [(NSMutableArray *)v544 countByEnumeratingWithState:&v739 objects:v1068 count:16];
    if (v545)
    {
      uint64_t v546 = v545;
      uint64_t v547 = *(void *)v740;
      do
      {
        uint64_t v548 = 0;
        do
        {
          if (*(void *)v740 != v547) {
            objc_enumerationMutation(v544);
          }
          v549 = [*(id *)(*((void *)&v739 + 1) + 8 * v548) dictionaryRepresentation];
          [v543 addObject:v549];

          ++v548;
        }
        while (v546 != v548);
        uint64_t v546 = [(NSMutableArray *)v544 countByEnumeratingWithState:&v739 objects:v1068 count:16];
      }
      while (v546);
    }

    [v3 setObject:v543 forKey:@"cellularPowerLogNRsub6TxPower"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6RxDiversitys count])
  {
    v550 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6RxDiversitys, "count"));
    long long v735 = 0u;
    long long v736 = 0u;
    long long v737 = 0u;
    long long v738 = 0u;
    v551 = self->_cellularPowerLogNRsub6RxDiversitys;
    uint64_t v552 = [(NSMutableArray *)v551 countByEnumeratingWithState:&v735 objects:v1067 count:16];
    if (v552)
    {
      uint64_t v553 = v552;
      uint64_t v554 = *(void *)v736;
      do
      {
        uint64_t v555 = 0;
        do
        {
          if (*(void *)v736 != v554) {
            objc_enumerationMutation(v551);
          }
          v556 = [*(id *)(*((void *)&v735 + 1) + 8 * v555) dictionaryRepresentation];
          [v550 addObject:v556];

          ++v555;
        }
        while (v553 != v555);
        uint64_t v553 = [(NSMutableArray *)v551 countByEnumeratingWithState:&v735 objects:v1067 count:16];
      }
      while (v553);
    }

    [v3 setObject:v550 forKey:@"cellularPowerLogNRsub6RxDiversity"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6BWPSCCs count])
  {
    v557 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6BWPSCCs, "count"));
    long long v731 = 0u;
    long long v732 = 0u;
    long long v733 = 0u;
    long long v734 = 0u;
    v558 = self->_cellularPowerLogNRsub6BWPSCCs;
    uint64_t v559 = [(NSMutableArray *)v558 countByEnumeratingWithState:&v731 objects:v1066 count:16];
    if (v559)
    {
      uint64_t v560 = v559;
      uint64_t v561 = *(void *)v732;
      do
      {
        uint64_t v562 = 0;
        do
        {
          if (*(void *)v732 != v561) {
            objc_enumerationMutation(v558);
          }
          v563 = [*(id *)(*((void *)&v731 + 1) + 8 * v562) dictionaryRepresentation];
          [v557 addObject:v563];

          ++v562;
        }
        while (v560 != v562);
        uint64_t v560 = [(NSMutableArray *)v558 countByEnumeratingWithState:&v731 objects:v1066 count:16];
      }
      while (v560);
    }

    [v3 setObject:v557 forKey:@"cellularPowerLogNRsub6BWP_SCC"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRsub6BWPSAs count])
  {
    v564 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRsub6BWPSAs, "count"));
    long long v727 = 0u;
    long long v728 = 0u;
    long long v729 = 0u;
    long long v730 = 0u;
    v565 = self->_cellularPowerLogNRsub6BWPSAs;
    uint64_t v566 = [(NSMutableArray *)v565 countByEnumeratingWithState:&v727 objects:v1065 count:16];
    if (v566)
    {
      uint64_t v567 = v566;
      uint64_t v568 = *(void *)v728;
      do
      {
        uint64_t v569 = 0;
        do
        {
          if (*(void *)v728 != v568) {
            objc_enumerationMutation(v565);
          }
          v570 = [*(id *)(*((void *)&v727 + 1) + 8 * v569) dictionaryRepresentation];
          [v564 addObject:v570];

          ++v569;
        }
        while (v567 != v569);
        uint64_t v567 = [(NSMutableArray *)v565 countByEnumeratingWithState:&v727 objects:v1065 count:16];
      }
      while (v567);
    }

    [v3 setObject:v564 forKey:@"cellularPowerLogNRsub6BWP_SA"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRmmWaveBWPs count])
  {
    v571 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRmmWaveBWPs, "count"));
    long long v723 = 0u;
    long long v724 = 0u;
    long long v725 = 0u;
    long long v726 = 0u;
    v572 = self->_cellularPowerLogNRmmWaveBWPs;
    uint64_t v573 = [(NSMutableArray *)v572 countByEnumeratingWithState:&v723 objects:v1064 count:16];
    if (v573)
    {
      uint64_t v574 = v573;
      uint64_t v575 = *(void *)v724;
      do
      {
        uint64_t v576 = 0;
        do
        {
          if (*(void *)v724 != v575) {
            objc_enumerationMutation(v572);
          }
          v577 = [*(id *)(*((void *)&v723 + 1) + 8 * v576) dictionaryRepresentation];
          [v571 addObject:v577];

          ++v576;
        }
        while (v574 != v576);
        uint64_t v574 = [(NSMutableArray *)v572 countByEnumeratingWithState:&v723 objects:v1064 count:16];
      }
      while (v574);
    }

    [v3 setObject:v571 forKey:@"cellularPowerLogNRmmWaveBWP"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRmmWaveAntennaPanels count])
  {
    v578 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRmmWaveAntennaPanels, "count"));
    long long v719 = 0u;
    long long v720 = 0u;
    long long v721 = 0u;
    long long v722 = 0u;
    v579 = self->_cellularPowerLogNRmmWaveAntennaPanels;
    uint64_t v580 = [(NSMutableArray *)v579 countByEnumeratingWithState:&v719 objects:v1063 count:16];
    if (v580)
    {
      uint64_t v581 = v580;
      uint64_t v582 = *(void *)v720;
      do
      {
        uint64_t v583 = 0;
        do
        {
          if (*(void *)v720 != v582) {
            objc_enumerationMutation(v579);
          }
          v584 = [*(id *)(*((void *)&v719 + 1) + 8 * v583) dictionaryRepresentation];
          [v578 addObject:v584];

          ++v583;
        }
        while (v581 != v583);
        uint64_t v581 = [(NSMutableArray *)v579 countByEnumeratingWithState:&v719 objects:v1063 count:16];
      }
      while (v581);
    }

    [v3 setObject:v578 forKey:@"cellularPowerLogNRmmWaveAntennaPanel"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRmmWaveBeamIDs count])
  {
    v585 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRmmWaveBeamIDs, "count"));
    long long v715 = 0u;
    long long v716 = 0u;
    long long v717 = 0u;
    long long v718 = 0u;
    v586 = self->_cellularPowerLogNRmmWaveBeamIDs;
    uint64_t v587 = [(NSMutableArray *)v586 countByEnumeratingWithState:&v715 objects:v1062 count:16];
    if (v587)
    {
      uint64_t v588 = v587;
      uint64_t v589 = *(void *)v716;
      do
      {
        uint64_t v590 = 0;
        do
        {
          if (*(void *)v716 != v589) {
            objc_enumerationMutation(v586);
          }
          v591 = [*(id *)(*((void *)&v715 + 1) + 8 * v590) dictionaryRepresentation];
          [v585 addObject:v591];

          ++v590;
        }
        while (v588 != v590);
        uint64_t v588 = [(NSMutableArray *)v586 countByEnumeratingWithState:&v715 objects:v1062 count:16];
      }
      while (v588);
    }

    [v3 setObject:v585 forKey:@"cellularPowerLogNRmmWaveBeamID"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRmmWaveCASCCConfigureds count])
  {
    v592 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRmmWaveCASCCConfigureds, "count"));
    long long v711 = 0u;
    long long v712 = 0u;
    long long v713 = 0u;
    long long v714 = 0u;
    v593 = self->_cellularPowerLogNRmmWaveCASCCConfigureds;
    uint64_t v594 = [(NSMutableArray *)v593 countByEnumeratingWithState:&v711 objects:v1061 count:16];
    if (v594)
    {
      uint64_t v595 = v594;
      uint64_t v596 = *(void *)v712;
      do
      {
        uint64_t v597 = 0;
        do
        {
          if (*(void *)v712 != v596) {
            objc_enumerationMutation(v593);
          }
          v598 = [*(id *)(*((void *)&v711 + 1) + 8 * v597) dictionaryRepresentation];
          [v592 addObject:v598];

          ++v597;
        }
        while (v595 != v597);
        uint64_t v595 = [(NSMutableArray *)v593 countByEnumeratingWithState:&v711 objects:v1061 count:16];
      }
      while (v595);
    }

    [v3 setObject:v592 forKey:@"cellularPowerLogNRmmWaveCA_SCCConfigured"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRmmWaveCASCCActivateds count])
  {
    v599 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRmmWaveCASCCActivateds, "count"));
    long long v707 = 0u;
    long long v708 = 0u;
    long long v709 = 0u;
    long long v710 = 0u;
    v600 = self->_cellularPowerLogNRmmWaveCASCCActivateds;
    uint64_t v601 = [(NSMutableArray *)v600 countByEnumeratingWithState:&v707 objects:v1060 count:16];
    if (v601)
    {
      uint64_t v602 = v601;
      uint64_t v603 = *(void *)v708;
      do
      {
        uint64_t v604 = 0;
        do
        {
          if (*(void *)v708 != v603) {
            objc_enumerationMutation(v600);
          }
          v605 = [*(id *)(*((void *)&v707 + 1) + 8 * v604) dictionaryRepresentation];
          [v599 addObject:v605];

          ++v604;
        }
        while (v602 != v604);
        uint64_t v602 = [(NSMutableArray *)v600 countByEnumeratingWithState:&v707 objects:v1060 count:16];
      }
      while (v602);
    }

    [v3 setObject:v599 forKey:@"cellularPowerLogNRmmWaveCA_SCCActivated"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRmmWaveRxTxs count])
  {
    v606 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRmmWaveRxTxs, "count"));
    long long v703 = 0u;
    long long v704 = 0u;
    long long v705 = 0u;
    long long v706 = 0u;
    v607 = self->_cellularPowerLogNRmmWaveRxTxs;
    uint64_t v608 = [(NSMutableArray *)v607 countByEnumeratingWithState:&v703 objects:v1059 count:16];
    if (v608)
    {
      uint64_t v609 = v608;
      uint64_t v610 = *(void *)v704;
      do
      {
        uint64_t v611 = 0;
        do
        {
          if (*(void *)v704 != v610) {
            objc_enumerationMutation(v607);
          }
          v612 = [*(id *)(*((void *)&v703 + 1) + 8 * v611) dictionaryRepresentation];
          [v606 addObject:v612];

          ++v611;
        }
        while (v609 != v611);
        uint64_t v609 = [(NSMutableArray *)v607 countByEnumeratingWithState:&v703 objects:v1059 count:16];
      }
      while (v609);
    }

    [v3 setObject:v606 forKey:@"cellularPowerLogNRmmWaveRxTx"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRmmWaveCarrierComponentInfos count])
  {
    v613 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRmmWaveCarrierComponentInfos, "count"));
    long long v699 = 0u;
    long long v700 = 0u;
    long long v701 = 0u;
    long long v702 = 0u;
    v614 = self->_cellularPowerLogNRmmWaveCarrierComponentInfos;
    uint64_t v615 = [(NSMutableArray *)v614 countByEnumeratingWithState:&v699 objects:v1058 count:16];
    if (v615)
    {
      uint64_t v616 = v615;
      uint64_t v617 = *(void *)v700;
      do
      {
        uint64_t v618 = 0;
        do
        {
          if (*(void *)v700 != v617) {
            objc_enumerationMutation(v614);
          }
          v619 = [*(id *)(*((void *)&v699 + 1) + 8 * v618) dictionaryRepresentation];
          [v613 addObject:v619];

          ++v618;
        }
        while (v616 != v618);
        uint64_t v616 = [(NSMutableArray *)v614 countByEnumeratingWithState:&v699 objects:v1058 count:16];
      }
      while (v616);
    }

    [v3 setObject:v613 forKey:@"cellularPowerLogNRmmWaveCarrierComponentInfo"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRmmWaveDLTBSs count])
  {
    v620 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRmmWaveDLTBSs, "count"));
    long long v695 = 0u;
    long long v696 = 0u;
    long long v697 = 0u;
    long long v698 = 0u;
    v621 = self->_cellularPowerLogNRmmWaveDLTBSs;
    uint64_t v622 = [(NSMutableArray *)v621 countByEnumeratingWithState:&v695 objects:v1057 count:16];
    if (v622)
    {
      uint64_t v623 = v622;
      uint64_t v624 = *(void *)v696;
      do
      {
        uint64_t v625 = 0;
        do
        {
          if (*(void *)v696 != v624) {
            objc_enumerationMutation(v621);
          }
          v626 = [*(id *)(*((void *)&v695 + 1) + 8 * v625) dictionaryRepresentation];
          [v620 addObject:v626];

          ++v625;
        }
        while (v623 != v625);
        uint64_t v623 = [(NSMutableArray *)v621 countByEnumeratingWithState:&v695 objects:v1057 count:16];
      }
      while (v623);
    }

    [v3 setObject:v620 forKey:@"cellularPowerLogNRmmWaveDL_TBS"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRMmWaveRSRPs count])
  {
    v627 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRMmWaveRSRPs, "count"));
    long long v691 = 0u;
    long long v692 = 0u;
    long long v693 = 0u;
    long long v694 = 0u;
    v628 = self->_cellularPowerLogNRMmWaveRSRPs;
    uint64_t v629 = [(NSMutableArray *)v628 countByEnumeratingWithState:&v691 objects:v1056 count:16];
    if (v629)
    {
      uint64_t v630 = v629;
      uint64_t v631 = *(void *)v692;
      do
      {
        uint64_t v632 = 0;
        do
        {
          if (*(void *)v692 != v631) {
            objc_enumerationMutation(v628);
          }
          v633 = [*(id *)(*((void *)&v691 + 1) + 8 * v632) dictionaryRepresentation];
          [v627 addObject:v633];

          ++v632;
        }
        while (v630 != v632);
        uint64_t v630 = [(NSMutableArray *)v628 countByEnumeratingWithState:&v691 objects:v1056 count:16];
      }
      while (v630);
    }

    [v3 setObject:v627 forKey:@"cellularPowerLogNR_mmWaveRSRP"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRMmWaveTxPowers count])
  {
    v634 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRMmWaveTxPowers, "count"));
    long long v687 = 0u;
    long long v688 = 0u;
    long long v689 = 0u;
    long long v690 = 0u;
    v635 = self->_cellularPowerLogNRMmWaveTxPowers;
    uint64_t v636 = [(NSMutableArray *)v635 countByEnumeratingWithState:&v687 objects:v1055 count:16];
    if (v636)
    {
      uint64_t v637 = v636;
      uint64_t v638 = *(void *)v688;
      do
      {
        uint64_t v639 = 0;
        do
        {
          if (*(void *)v688 != v638) {
            objc_enumerationMutation(v635);
          }
          v640 = [*(id *)(*((void *)&v687 + 1) + 8 * v639) dictionaryRepresentation];
          [v634 addObject:v640];

          ++v639;
        }
        while (v637 != v639);
        uint64_t v637 = [(NSMutableArray *)v635 countByEnumeratingWithState:&v687 objects:v1055 count:16];
      }
      while (v637);
    }

    [v3 setObject:v634 forKey:@"cellularPowerLogNR_mmWaveTxPower"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRMmWaveULCAStates count])
  {
    v641 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRMmWaveULCAStates, "count"));
    long long v683 = 0u;
    long long v684 = 0u;
    long long v685 = 0u;
    long long v686 = 0u;
    v642 = self->_cellularPowerLogNRMmWaveULCAStates;
    uint64_t v643 = [(NSMutableArray *)v642 countByEnumeratingWithState:&v683 objects:v1054 count:16];
    if (v643)
    {
      uint64_t v644 = v643;
      uint64_t v645 = *(void *)v684;
      do
      {
        uint64_t v646 = 0;
        do
        {
          if (*(void *)v684 != v645) {
            objc_enumerationMutation(v642);
          }
          v647 = [*(id *)(*((void *)&v683 + 1) + 8 * v646) dictionaryRepresentation];
          [v641 addObject:v647];

          ++v646;
        }
        while (v644 != v646);
        uint64_t v644 = [(NSMutableArray *)v642 countByEnumeratingWithState:&v683 objects:v1054 count:16];
      }
      while (v644);
    }

    [v3 setObject:v641 forKey:@"cellularPowerLogNR_mmWaveUL_CAState"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogNRmmWaveBWPSCCs count])
  {
    v648 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogNRmmWaveBWPSCCs, "count"));
    long long v679 = 0u;
    long long v680 = 0u;
    long long v681 = 0u;
    long long v682 = 0u;
    v649 = self->_cellularPowerLogNRmmWaveBWPSCCs;
    uint64_t v650 = [(NSMutableArray *)v649 countByEnumeratingWithState:&v679 objects:v1053 count:16];
    if (v650)
    {
      uint64_t v651 = v650;
      uint64_t v652 = *(void *)v680;
      do
      {
        uint64_t v653 = 0;
        do
        {
          if (*(void *)v680 != v652) {
            objc_enumerationMutation(v649);
          }
          v654 = [*(id *)(*((void *)&v679 + 1) + 8 * v653) dictionaryRepresentation];
          [v648 addObject:v654];

          ++v653;
        }
        while (v651 != v653);
        uint64_t v651 = [(NSMutableArray *)v649 countByEnumeratingWithState:&v679 objects:v1053 count:16];
      }
      while (v651);
    }

    [v3 setObject:v648 forKey:@"cellularPowerLogNRmmWaveBWP_SCC"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogSFTStates count])
  {
    v655 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogSFTStates, "count"));
    long long v675 = 0u;
    long long v676 = 0u;
    long long v677 = 0u;
    long long v678 = 0u;
    v656 = self->_cellularPowerLogSFTStates;
    uint64_t v657 = [(NSMutableArray *)v656 countByEnumeratingWithState:&v675 objects:v1052 count:16];
    if (v657)
    {
      uint64_t v658 = v657;
      uint64_t v659 = *(void *)v676;
      do
      {
        uint64_t v660 = 0;
        do
        {
          if (*(void *)v676 != v659) {
            objc_enumerationMutation(v656);
          }
          v661 = [*(id *)(*((void *)&v675 + 1) + 8 * v660) dictionaryRepresentation];
          [v655 addObject:v661];

          ++v660;
        }
        while (v658 != v660);
        uint64_t v658 = [(NSMutableArray *)v656 countByEnumeratingWithState:&v675 objects:v1052 count:16];
      }
      while (v658);
    }

    [v3 setObject:v655 forKey:@"cellularPowerLogSFTState"];
  }
  if ([(NSMutableArray *)self->_cellularPowerLogSFTRxTxs count])
  {
    v662 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cellularPowerLogSFTRxTxs, "count"));
    long long v671 = 0u;
    long long v672 = 0u;
    long long v673 = 0u;
    long long v674 = 0u;
    v663 = self->_cellularPowerLogSFTRxTxs;
    uint64_t v664 = [(NSMutableArray *)v663 countByEnumeratingWithState:&v671 objects:v1051 count:16];
    if (v664)
    {
      uint64_t v665 = v664;
      uint64_t v666 = *(void *)v672;
      do
      {
        uint64_t v667 = 0;
        do
        {
          if (*(void *)v672 != v666) {
            objc_enumerationMutation(v663);
          }
          v668 = objc_msgSend(*(id *)(*((void *)&v671 + 1) + 8 * v667), "dictionaryRepresentation", (void)v671);
          [v662 addObject:v668];

          ++v667;
        }
        while (v665 != v667);
        uint64_t v665 = [(NSMutableArray *)v663 countByEnumeratingWithState:&v671 objects:v1051 count:16];
      }
      while (v665);
    }

    [v3 setObject:v662 forKey:@"cellularPowerLogSFTRxTx"];
  }
  id v669 = v3;

  return v669;
}

- (BOOL)readFrom:(id)a3
{
  return AWDMETRICSCellularPowerLogReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v955 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v856 = 0u;
  long long v857 = 0u;
  long long v858 = 0u;
  long long v859 = 0u;
  v5 = self->_cellularPerClientProfileTriggerCounts;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v856 objects:v954 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v857;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v857 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v856 objects:v954 count:16];
    }
    while (v7);
  }

  long long v855 = 0u;
  long long v854 = 0u;
  long long v853 = 0u;
  long long v852 = 0u;
  v10 = self->_cellularNrSDMActivations;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v852 objects:v953 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v853;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v853 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v852 objects:v953 count:16];
    }
    while (v12);
  }

  long long v851 = 0u;
  long long v850 = 0u;
  long long v849 = 0u;
  long long v848 = 0u;
  uint64_t v15 = self->_cellularNrSdmEndcReleases;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v848 objects:v952 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v849;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v849 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v848 objects:v952 count:16];
    }
    while (v17);
  }

  long long v847 = 0u;
  long long v846 = 0u;
  long long v845 = 0u;
  long long v844 = 0u;
  uint64_t v20 = self->_cellularDynamicRatSelections;
  uint64_t v21 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v844 objects:v951 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v845;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v845 != v23) {
          objc_enumerationMutation(v20);
        }
        PBDataWriterWriteSubmessage();
        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = [(NSMutableArray *)v20 countByEnumeratingWithState:&v844 objects:v951 count:16];
    }
    while (v22);
  }

  long long v843 = 0u;
  long long v842 = 0u;
  long long v841 = 0u;
  long long v840 = 0u;
  v25 = self->_cellularPowerLogXOShutdowns;
  uint64_t v26 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v840 objects:v950 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v841;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v841 != v28) {
          objc_enumerationMutation(v25);
        }
        PBDataWriterWriteSubmessage();
        ++v29;
      }
      while (v27 != v29);
      uint64_t v27 = [(NSMutableArray *)v25 countByEnumeratingWithState:&v840 objects:v950 count:16];
    }
    while (v27);
  }

  long long v839 = 0u;
  long long v838 = 0u;
  long long v837 = 0u;
  long long v836 = 0u;
  uint64_t v30 = self->_cellularPowerLogAPPSPerfLevels;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v836 objects:v949 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v837;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v837 != v33) {
          objc_enumerationMutation(v30);
        }
        PBDataWriterWriteSubmessage();
        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v836 objects:v949 count:16];
    }
    while (v32);
  }

  long long v835 = 0u;
  long long v834 = 0u;
  long long v833 = 0u;
  long long v832 = 0u;
  uint64_t v35 = self->_cellularPowerLogAPPSCXOShutdowns;
  uint64_t v36 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v832 objects:v948 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v833;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v833 != v38) {
          objc_enumerationMutation(v35);
        }
        PBDataWriterWriteSubmessage();
        ++v39;
      }
      while (v37 != v39);
      uint64_t v37 = [(NSMutableArray *)v35 countByEnumeratingWithState:&v832 objects:v948 count:16];
    }
    while (v37);
  }

  long long v831 = 0u;
  long long v830 = 0u;
  long long v829 = 0u;
  long long v828 = 0u;
  v40 = self->_cellularPowerLogAPPSSleepVetos;
  uint64_t v41 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v828 objects:v947 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v829;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v829 != v43) {
          objc_enumerationMutation(v40);
        }
        PBDataWriterWriteSubmessage();
        ++v44;
      }
      while (v42 != v44);
      uint64_t v42 = [(NSMutableArray *)v40 countByEnumeratingWithState:&v828 objects:v947 count:16];
    }
    while (v42);
  }

  long long v827 = 0u;
  long long v826 = 0u;
  long long v825 = 0u;
  long long v824 = 0u;
  v45 = self->_cellularPowerLogMCPMSleepVetos;
  uint64_t v46 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v824 objects:v946 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v825;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v825 != v48) {
          objc_enumerationMutation(v45);
        }
        PBDataWriterWriteSubmessage();
        ++v49;
      }
      while (v47 != v49);
      uint64_t v47 = [(NSMutableArray *)v45 countByEnumeratingWithState:&v824 objects:v946 count:16];
    }
    while (v47);
  }

  long long v823 = 0u;
  long long v822 = 0u;
  long long v821 = 0u;
  long long v820 = 0u;
  uint64_t v50 = self->_cellularPowerLogMPSSPerfLevels;
  uint64_t v51 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v820 objects:v945 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v821;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v821 != v53) {
          objc_enumerationMutation(v50);
        }
        PBDataWriterWriteSubmessage();
        ++v54;
      }
      while (v52 != v54);
      uint64_t v52 = [(NSMutableArray *)v50 countByEnumeratingWithState:&v820 objects:v945 count:16];
    }
    while (v52);
  }

  long long v819 = 0u;
  long long v818 = 0u;
  long long v817 = 0u;
  long long v816 = 0u;
  uint64_t v55 = self->_cellularPowerLogGPSStates;
  uint64_t v56 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v816 objects:v944 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v817;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v817 != v58) {
          objc_enumerationMutation(v55);
        }
        PBDataWriterWriteSubmessage();
        ++v59;
      }
      while (v57 != v59);
      uint64_t v57 = [(NSMutableArray *)v55 countByEnumeratingWithState:&v816 objects:v944 count:16];
    }
    while (v57);
  }

  long long v815 = 0u;
  long long v814 = 0u;
  long long v813 = 0u;
  long long v812 = 0u;
  v60 = self->_cellularPowerLogAOPUARTStates;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v812 objects:v943 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v813;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v813 != v63) {
          objc_enumerationMutation(v60);
        }
        PBDataWriterWriteSubmessage();
        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v812 objects:v943 count:16];
    }
    while (v62);
  }

  long long v811 = 0u;
  long long v810 = 0u;
  long long v809 = 0u;
  long long v808 = 0u;
  uint64_t v65 = self->_cellularPowerLogWLANUARTStates;
  uint64_t v66 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v808 objects:v942 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v809;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v809 != v68) {
          objc_enumerationMutation(v65);
        }
        PBDataWriterWriteSubmessage();
        ++v69;
      }
      while (v67 != v69);
      uint64_t v67 = [(NSMutableArray *)v65 countByEnumeratingWithState:&v808 objects:v942 count:16];
    }
    while (v67);
  }

  long long v807 = 0u;
  long long v806 = 0u;
  long long v805 = 0u;
  long long v804 = 0u;
  uint64_t v70 = self->_cellularPowerLogPCIeStates;
  uint64_t v71 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v804 objects:v941 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v805;
    do
    {
      uint64_t v74 = 0;
      do
      {
        if (*(void *)v805 != v73) {
          objc_enumerationMutation(v70);
        }
        PBDataWriterWriteSubmessage();
        ++v74;
      }
      while (v72 != v74);
      uint64_t v72 = [(NSMutableArray *)v70 countByEnumeratingWithState:&v804 objects:v941 count:16];
    }
    while (v72);
  }

  long long v803 = 0u;
  long long v802 = 0u;
  long long v801 = 0u;
  long long v800 = 0u;
  v75 = self->_cellularPowerLogL1SleepStates;
  uint64_t v76 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v800 objects:v940 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v801;
    do
    {
      uint64_t v79 = 0;
      do
      {
        if (*(void *)v801 != v78) {
          objc_enumerationMutation(v75);
        }
        PBDataWriterWriteSubmessage();
        ++v79;
      }
      while (v77 != v79);
      uint64_t v77 = [(NSMutableArray *)v75 countByEnumeratingWithState:&v800 objects:v940 count:16];
    }
    while (v77);
  }

  long long v799 = 0u;
  long long v798 = 0u;
  long long v797 = 0u;
  long long v796 = 0u;
  v80 = self->_cellularPowerLogLTEConfiguredCASCCStates;
  uint64_t v81 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v796 objects:v939 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v797;
    do
    {
      uint64_t v84 = 0;
      do
      {
        if (*(void *)v797 != v83) {
          objc_enumerationMutation(v80);
        }
        PBDataWriterWriteSubmessage();
        ++v84;
      }
      while (v82 != v84);
      uint64_t v82 = [(NSMutableArray *)v80 countByEnumeratingWithState:&v796 objects:v939 count:16];
    }
    while (v82);
  }

  long long v795 = 0u;
  long long v794 = 0u;
  long long v793 = 0u;
  long long v792 = 0u;
  uint64_t v85 = self->_cellularPowerLogLTEActivatedCASCCStates;
  uint64_t v86 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v792 objects:v938 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v793;
    do
    {
      uint64_t v89 = 0;
      do
      {
        if (*(void *)v793 != v88) {
          objc_enumerationMutation(v85);
        }
        PBDataWriterWriteSubmessage();
        ++v89;
      }
      while (v87 != v89);
      uint64_t v87 = [(NSMutableArray *)v85 countByEnumeratingWithState:&v792 objects:v938 count:16];
    }
    while (v87);
  }

  long long v791 = 0u;
  long long v790 = 0u;
  long long v789 = 0u;
  long long v788 = 0u;
  uint64_t v90 = self->_cellularPowerLogLTERxTxActivityStates;
  uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v788 objects:v937 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v789;
    do
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v789 != v93) {
          objc_enumerationMutation(v90);
        }
        PBDataWriterWriteSubmessage();
        ++v94;
      }
      while (v92 != v94);
      uint64_t v92 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v788 objects:v937 count:16];
    }
    while (v92);
  }

  long long v787 = 0u;
  long long v786 = 0u;
  long long v785 = 0u;
  long long v784 = 0u;
  v95 = self->_cellularPowerLogLTECarrierComponentInfos;
  uint64_t v96 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v784 objects:v936 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v785;
    do
    {
      uint64_t v99 = 0;
      do
      {
        if (*(void *)v785 != v98) {
          objc_enumerationMutation(v95);
        }
        PBDataWriterWriteSubmessage();
        ++v99;
      }
      while (v97 != v99);
      uint64_t v97 = [(NSMutableArray *)v95 countByEnumeratingWithState:&v784 objects:v936 count:16];
    }
    while (v97);
  }

  long long v783 = 0u;
  long long v782 = 0u;
  long long v781 = 0u;
  long long v780 = 0u;
  uint64_t v100 = self->_cellularPowerLogLTEAggregatedDLTBSs;
  uint64_t v101 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v780 objects:v935 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v781;
    do
    {
      uint64_t v104 = 0;
      do
      {
        if (*(void *)v781 != v103) {
          objc_enumerationMutation(v100);
        }
        PBDataWriterWriteSubmessage();
        ++v104;
      }
      while (v102 != v104);
      uint64_t v102 = [(NSMutableArray *)v100 countByEnumeratingWithState:&v780 objects:v935 count:16];
    }
    while (v102);
  }

  long long v779 = 0u;
  long long v778 = 0u;
  long long v777 = 0u;
  long long v776 = 0u;
  uint64_t v105 = self->_cellularPowerLogLTERSRPs;
  uint64_t v106 = [(NSMutableArray *)v105 countByEnumeratingWithState:&v776 objects:v934 count:16];
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v777;
    do
    {
      uint64_t v109 = 0;
      do
      {
        if (*(void *)v777 != v108) {
          objc_enumerationMutation(v105);
        }
        PBDataWriterWriteSubmessage();
        ++v109;
      }
      while (v107 != v109);
      uint64_t v107 = [(NSMutableArray *)v105 countByEnumeratingWithState:&v776 objects:v934 count:16];
    }
    while (v107);
  }

  long long v775 = 0u;
  long long v774 = 0u;
  long long v773 = 0u;
  long long v772 = 0u;
  v110 = self->_cellularPowerLogLTESINRs;
  uint64_t v111 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v772 objects:v933 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v773;
    do
    {
      uint64_t v114 = 0;
      do
      {
        if (*(void *)v773 != v113) {
          objc_enumerationMutation(v110);
        }
        PBDataWriterWriteSubmessage();
        ++v114;
      }
      while (v112 != v114);
      uint64_t v112 = [(NSMutableArray *)v110 countByEnumeratingWithState:&v772 objects:v933 count:16];
    }
    while (v112);
  }

  long long v771 = 0u;
  long long v770 = 0u;
  long long v769 = 0u;
  long long v768 = 0u;
  v115 = self->_cellularPowerLogLTETxPowers;
  uint64_t v116 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v768 objects:v932 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v769;
    do
    {
      uint64_t v119 = 0;
      do
      {
        if (*(void *)v769 != v118) {
          objc_enumerationMutation(v115);
        }
        PBDataWriterWriteSubmessage();
        ++v119;
      }
      while (v117 != v119);
      uint64_t v117 = [(NSMutableArray *)v115 countByEnumeratingWithState:&v768 objects:v932 count:16];
    }
    while (v117);
  }

  long long v767 = 0u;
  long long v766 = 0u;
  long long v765 = 0u;
  long long v764 = 0u;
  uint64_t v120 = self->_cellularPowerLogLTERxDiversitys;
  uint64_t v121 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v764 objects:v931 count:16];
  if (v121)
  {
    uint64_t v122 = v121;
    uint64_t v123 = *(void *)v765;
    do
    {
      uint64_t v124 = 0;
      do
      {
        if (*(void *)v765 != v123) {
          objc_enumerationMutation(v120);
        }
        PBDataWriterWriteSubmessage();
        ++v124;
      }
      while (v122 != v124);
      uint64_t v122 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v764 objects:v931 count:16];
    }
    while (v122);
  }

  long long v763 = 0u;
  long long v762 = 0u;
  long long v761 = 0u;
  long long v760 = 0u;
  uint64_t v125 = self->_cellularPowerLogLTEULCAStates;
  uint64_t v126 = [(NSMutableArray *)v125 countByEnumeratingWithState:&v760 objects:v930 count:16];
  if (v126)
  {
    uint64_t v127 = v126;
    uint64_t v128 = *(void *)v761;
    do
    {
      uint64_t v129 = 0;
      do
      {
        if (*(void *)v761 != v128) {
          objc_enumerationMutation(v125);
        }
        PBDataWriterWriteSubmessage();
        ++v129;
      }
      while (v127 != v129);
      uint64_t v127 = [(NSMutableArray *)v125 countByEnumeratingWithState:&v760 objects:v930 count:16];
    }
    while (v127);
  }

  long long v759 = 0u;
  long long v758 = 0u;
  long long v757 = 0u;
  long long v756 = 0u;
  v130 = self->_cellularPowerLogPowerEstimators;
  uint64_t v131 = [(NSMutableArray *)v130 countByEnumeratingWithState:&v756 objects:v929 count:16];
  if (v131)
  {
    uint64_t v132 = v131;
    uint64_t v133 = *(void *)v757;
    do
    {
      uint64_t v134 = 0;
      do
      {
        if (*(void *)v757 != v133) {
          objc_enumerationMutation(v130);
        }
        PBDataWriterWriteSubmessage();
        ++v134;
      }
      while (v132 != v134);
      uint64_t v132 = [(NSMutableArray *)v130 countByEnumeratingWithState:&v756 objects:v929 count:16];
    }
    while (v132);
  }

  long long v755 = 0u;
  long long v754 = 0u;
  long long v753 = 0u;
  long long v752 = 0u;
  uint64_t v135 = self->_cellularPowerLogLTEPagingDRXCycles;
  uint64_t v136 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v752 objects:v928 count:16];
  if (v136)
  {
    uint64_t v137 = v136;
    uint64_t v138 = *(void *)v753;
    do
    {
      uint64_t v139 = 0;
      do
      {
        if (*(void *)v753 != v138) {
          objc_enumerationMutation(v135);
        }
        PBDataWriterWriteSubmessage();
        ++v139;
      }
      while (v137 != v139);
      uint64_t v137 = [(NSMutableArray *)v135 countByEnumeratingWithState:&v752 objects:v928 count:16];
    }
    while (v137);
  }

  long long v751 = 0u;
  long long v750 = 0u;
  long long v749 = 0u;
  long long v748 = 0u;
  uint64_t v140 = self->_cellularPowerLogNRPagingDRXCycles;
  uint64_t v141 = [(NSMutableArray *)v140 countByEnumeratingWithState:&v748 objects:v927 count:16];
  if (v141)
  {
    uint64_t v142 = v141;
    uint64_t v143 = *(void *)v749;
    do
    {
      uint64_t v144 = 0;
      do
      {
        if (*(void *)v749 != v143) {
          objc_enumerationMutation(v140);
        }
        PBDataWriterWriteSubmessage();
        ++v144;
      }
      while (v142 != v144);
      uint64_t v142 = [(NSMutableArray *)v140 countByEnumeratingWithState:&v748 objects:v927 count:16];
    }
    while (v142);
  }

  long long v747 = 0u;
  long long v746 = 0u;
  long long v745 = 0u;
  long long v744 = 0u;
  v145 = self->_cellularPowerLogProtocolStates;
  uint64_t v146 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v744 objects:v926 count:16];
  if (v146)
  {
    uint64_t v147 = v146;
    uint64_t v148 = *(void *)v745;
    do
    {
      uint64_t v149 = 0;
      do
      {
        if (*(void *)v745 != v148) {
          objc_enumerationMutation(v145);
        }
        PBDataWriterWriteSubmessage();
        ++v149;
      }
      while (v147 != v149);
      uint64_t v147 = [(NSMutableArray *)v145 countByEnumeratingWithState:&v744 objects:v926 count:16];
    }
    while (v147);
  }

  long long v743 = 0u;
  long long v742 = 0u;
  long long v741 = 0u;
  long long v740 = 0u;
  v150 = self->_cellularPowerLogPLMNSearchs;
  uint64_t v151 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v740 objects:v925 count:16];
  if (v151)
  {
    uint64_t v152 = v151;
    uint64_t v153 = *(void *)v741;
    do
    {
      uint64_t v154 = 0;
      do
      {
        if (*(void *)v741 != v153) {
          objc_enumerationMutation(v150);
        }
        PBDataWriterWriteSubmessage();
        ++v154;
      }
      while (v152 != v154);
      uint64_t v152 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v740 objects:v925 count:16];
    }
    while (v152);
  }

  long long v739 = 0u;
  long long v738 = 0u;
  long long v737 = 0u;
  long long v736 = 0u;
  uint64_t v155 = self->_cellularPowerLogGSMTxPowers;
  uint64_t v156 = [(NSMutableArray *)v155 countByEnumeratingWithState:&v736 objects:v924 count:16];
  if (v156)
  {
    uint64_t v157 = v156;
    uint64_t v158 = *(void *)v737;
    do
    {
      uint64_t v159 = 0;
      do
      {
        if (*(void *)v737 != v158) {
          objc_enumerationMutation(v155);
        }
        PBDataWriterWriteSubmessage();
        ++v159;
      }
      while (v157 != v159);
      uint64_t v157 = [(NSMutableArray *)v155 countByEnumeratingWithState:&v736 objects:v924 count:16];
    }
    while (v157);
  }

  long long v735 = 0u;
  long long v734 = 0u;
  long long v733 = 0u;
  long long v732 = 0u;
  uint64_t v160 = self->_cellularPowerLogGSMRxRSSIs;
  uint64_t v161 = [(NSMutableArray *)v160 countByEnumeratingWithState:&v732 objects:v923 count:16];
  if (v161)
  {
    uint64_t v162 = v161;
    uint64_t v163 = *(void *)v733;
    do
    {
      uint64_t v164 = 0;
      do
      {
        if (*(void *)v733 != v163) {
          objc_enumerationMutation(v160);
        }
        PBDataWriterWriteSubmessage();
        ++v164;
      }
      while (v162 != v164);
      uint64_t v162 = [(NSMutableArray *)v160 countByEnumeratingWithState:&v732 objects:v923 count:16];
    }
    while (v162);
  }

  long long v731 = 0u;
  long long v730 = 0u;
  long long v729 = 0u;
  long long v728 = 0u;
  v165 = self->_cellularPowerLogGSMRABModes;
  uint64_t v166 = [(NSMutableArray *)v165 countByEnumeratingWithState:&v728 objects:v922 count:16];
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v168 = *(void *)v729;
    do
    {
      uint64_t v169 = 0;
      do
      {
        if (*(void *)v729 != v168) {
          objc_enumerationMutation(v165);
        }
        PBDataWriterWriteSubmessage();
        ++v169;
      }
      while (v167 != v169);
      uint64_t v167 = [(NSMutableArray *)v165 countByEnumeratingWithState:&v728 objects:v922 count:16];
    }
    while (v167);
  }

  long long v727 = 0u;
  long long v726 = 0u;
  long long v725 = 0u;
  long long v724 = 0u;
  uint64_t v170 = self->_cellularPowerLogGSMRxDiversitys;
  uint64_t v171 = [(NSMutableArray *)v170 countByEnumeratingWithState:&v724 objects:v921 count:16];
  if (v171)
  {
    uint64_t v172 = v171;
    uint64_t v173 = *(void *)v725;
    do
    {
      uint64_t v174 = 0;
      do
      {
        if (*(void *)v725 != v173) {
          objc_enumerationMutation(v170);
        }
        PBDataWriterWriteSubmessage();
        ++v174;
      }
      while (v172 != v174);
      uint64_t v172 = [(NSMutableArray *)v170 countByEnumeratingWithState:&v724 objects:v921 count:16];
    }
    while (v172);
  }

  long long v723 = 0u;
  long long v722 = 0u;
  long long v721 = 0u;
  long long v720 = 0u;
  uint64_t v175 = self->_cellularPowerLogWCDMATxPowers;
  uint64_t v176 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v720 objects:v920 count:16];
  if (v176)
  {
    uint64_t v177 = v176;
    uint64_t v178 = *(void *)v721;
    do
    {
      uint64_t v179 = 0;
      do
      {
        if (*(void *)v721 != v178) {
          objc_enumerationMutation(v175);
        }
        PBDataWriterWriteSubmessage();
        ++v179;
      }
      while (v177 != v179);
      uint64_t v177 = [(NSMutableArray *)v175 countByEnumeratingWithState:&v720 objects:v920 count:16];
    }
    while (v177);
  }

  long long v719 = 0u;
  long long v718 = 0u;
  long long v717 = 0u;
  long long v716 = 0u;
  v180 = self->_cellularPowerLogWCDMARxRSSIs;
  uint64_t v181 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v716 objects:v919 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v717;
    do
    {
      uint64_t v184 = 0;
      do
      {
        if (*(void *)v717 != v183) {
          objc_enumerationMutation(v180);
        }
        PBDataWriterWriteSubmessage();
        ++v184;
      }
      while (v182 != v184);
      uint64_t v182 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v716 objects:v919 count:16];
    }
    while (v182);
  }

  long long v715 = 0u;
  long long v714 = 0u;
  long long v713 = 0u;
  long long v712 = 0u;
  v185 = self->_cellularPowerLogNRSCGRels;
  uint64_t v186 = [(NSMutableArray *)v185 countByEnumeratingWithState:&v712 objects:v918 count:16];
  if (v186)
  {
    uint64_t v187 = v186;
    uint64_t v188 = *(void *)v713;
    do
    {
      uint64_t v189 = 0;
      do
      {
        if (*(void *)v713 != v188) {
          objc_enumerationMutation(v185);
        }
        PBDataWriterWriteSubmessage();
        ++v189;
      }
      while (v187 != v189);
      uint64_t v187 = [(NSMutableArray *)v185 countByEnumeratingWithState:&v712 objects:v918 count:16];
    }
    while (v187);
  }

  long long v711 = 0u;
  long long v710 = 0u;
  long long v709 = 0u;
  long long v708 = 0u;
  uint64_t v190 = self->_cellularPowerLogWCDMARxDiversitys;
  uint64_t v191 = [(NSMutableArray *)v190 countByEnumeratingWithState:&v708 objects:v917 count:16];
  if (v191)
  {
    uint64_t v192 = v191;
    uint64_t v193 = *(void *)v709;
    do
    {
      uint64_t v194 = 0;
      do
      {
        if (*(void *)v709 != v193) {
          objc_enumerationMutation(v190);
        }
        PBDataWriterWriteSubmessage();
        ++v194;
      }
      while (v192 != v194);
      uint64_t v192 = [(NSMutableArray *)v190 countByEnumeratingWithState:&v708 objects:v917 count:16];
    }
    while (v192);
  }

  long long v707 = 0u;
  long long v706 = 0u;
  long long v705 = 0u;
  long long v704 = 0u;
  uint64_t v195 = self->_cellularPowerLogWCDMARABModes;
  uint64_t v196 = [(NSMutableArray *)v195 countByEnumeratingWithState:&v704 objects:v916 count:16];
  if (v196)
  {
    uint64_t v197 = v196;
    uint64_t v198 = *(void *)v705;
    do
    {
      uint64_t v199 = 0;
      do
      {
        if (*(void *)v705 != v198) {
          objc_enumerationMutation(v195);
        }
        PBDataWriterWriteSubmessage();
        ++v199;
      }
      while (v197 != v199);
      uint64_t v197 = [(NSMutableArray *)v195 countByEnumeratingWithState:&v704 objects:v916 count:16];
    }
    while (v197);
  }

  long long v703 = 0u;
  long long v702 = 0u;
  long long v701 = 0u;
  long long v700 = 0u;
  v200 = self->_cellularPowerLogWCDMARABTypes;
  uint64_t v201 = [(NSMutableArray *)v200 countByEnumeratingWithState:&v700 objects:v915 count:16];
  if (v201)
  {
    uint64_t v202 = v201;
    uint64_t v203 = *(void *)v701;
    do
    {
      uint64_t v204 = 0;
      do
      {
        if (*(void *)v701 != v203) {
          objc_enumerationMutation(v200);
        }
        PBDataWriterWriteSubmessage();
        ++v204;
      }
      while (v202 != v204);
      uint64_t v202 = [(NSMutableArray *)v200 countByEnumeratingWithState:&v700 objects:v915 count:16];
    }
    while (v202);
  }

  long long v699 = 0u;
  long long v698 = 0u;
  long long v697 = 0u;
  long long v696 = 0u;
  uint64_t v205 = self->_cellularPowerLogEVDOTxPowers;
  uint64_t v206 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v696 objects:v914 count:16];
  if (v206)
  {
    uint64_t v207 = v206;
    uint64_t v208 = *(void *)v697;
    do
    {
      uint64_t v209 = 0;
      do
      {
        if (*(void *)v697 != v208) {
          objc_enumerationMutation(v205);
        }
        PBDataWriterWriteSubmessage();
        ++v209;
      }
      while (v207 != v209);
      uint64_t v207 = [(NSMutableArray *)v205 countByEnumeratingWithState:&v696 objects:v914 count:16];
    }
    while (v207);
  }

  long long v695 = 0u;
  long long v694 = 0u;
  long long v693 = 0u;
  long long v692 = 0u;
  uint64_t v210 = self->_cellularPowerLogEVDORxRSSIs;
  uint64_t v211 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v692 objects:v913 count:16];
  if (v211)
  {
    uint64_t v212 = v211;
    uint64_t v213 = *(void *)v693;
    do
    {
      uint64_t v214 = 0;
      do
      {
        if (*(void *)v693 != v213) {
          objc_enumerationMutation(v210);
        }
        PBDataWriterWriteSubmessage();
        ++v214;
      }
      while (v212 != v214);
      uint64_t v212 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v692 objects:v913 count:16];
    }
    while (v212);
  }

  long long v691 = 0u;
  long long v690 = 0u;
  long long v689 = 0u;
  long long v688 = 0u;
  v215 = self->_cellularPowerLogHybridRABModes;
  uint64_t v216 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v688 objects:v912 count:16];
  if (v216)
  {
    uint64_t v217 = v216;
    uint64_t v218 = *(void *)v689;
    do
    {
      uint64_t v219 = 0;
      do
      {
        if (*(void *)v689 != v218) {
          objc_enumerationMutation(v215);
        }
        PBDataWriterWriteSubmessage();
        ++v219;
      }
      while (v217 != v219);
      uint64_t v217 = [(NSMutableArray *)v215 countByEnumeratingWithState:&v688 objects:v912 count:16];
    }
    while (v217);
  }

  long long v687 = 0u;
  long long v686 = 0u;
  long long v685 = 0u;
  long long v684 = 0u;
  v220 = self->_cellularPowerLogEVDORxDiversitys;
  uint64_t v221 = [(NSMutableArray *)v220 countByEnumeratingWithState:&v684 objects:v911 count:16];
  if (v221)
  {
    uint64_t v222 = v221;
    uint64_t v223 = *(void *)v685;
    do
    {
      uint64_t v224 = 0;
      do
      {
        if (*(void *)v685 != v223) {
          objc_enumerationMutation(v220);
        }
        PBDataWriterWriteSubmessage();
        ++v224;
      }
      while (v222 != v224);
      uint64_t v222 = [(NSMutableArray *)v220 countByEnumeratingWithState:&v684 objects:v911 count:16];
    }
    while (v222);
  }

  long long v683 = 0u;
  long long v682 = 0u;
  long long v681 = 0u;
  long long v680 = 0u;
  uint64_t v225 = self->_cellularPowerLogCDMA1XTxPowers;
  uint64_t v226 = [(NSMutableArray *)v225 countByEnumeratingWithState:&v680 objects:v910 count:16];
  if (v226)
  {
    uint64_t v227 = v226;
    uint64_t v228 = *(void *)v681;
    do
    {
      uint64_t v229 = 0;
      do
      {
        if (*(void *)v681 != v228) {
          objc_enumerationMutation(v225);
        }
        PBDataWriterWriteSubmessage();
        ++v229;
      }
      while (v227 != v229);
      uint64_t v227 = [(NSMutableArray *)v225 countByEnumeratingWithState:&v680 objects:v910 count:16];
    }
    while (v227);
  }

  long long v679 = 0u;
  long long v678 = 0u;
  long long v677 = 0u;
  long long v676 = 0u;
  uint64_t v230 = self->_cellularPowerLogCDMA1XRxRSSIs;
  uint64_t v231 = [(NSMutableArray *)v230 countByEnumeratingWithState:&v676 objects:v909 count:16];
  if (v231)
  {
    uint64_t v232 = v231;
    uint64_t v233 = *(void *)v677;
    do
    {
      uint64_t v234 = 0;
      do
      {
        if (*(void *)v677 != v233) {
          objc_enumerationMutation(v230);
        }
        PBDataWriterWriteSubmessage();
        ++v234;
      }
      while (v232 != v234);
      uint64_t v232 = [(NSMutableArray *)v230 countByEnumeratingWithState:&v676 objects:v909 count:16];
    }
    while (v232);
  }

  long long v675 = 0u;
  long long v674 = 0u;
  long long v673 = 0u;
  long long v672 = 0u;
  v235 = self->_cellularPowerLogCDMA1XRABModes;
  uint64_t v236 = [(NSMutableArray *)v235 countByEnumeratingWithState:&v672 objects:v908 count:16];
  if (v236)
  {
    uint64_t v237 = v236;
    uint64_t v238 = *(void *)v673;
    do
    {
      uint64_t v239 = 0;
      do
      {
        if (*(void *)v673 != v238) {
          objc_enumerationMutation(v235);
        }
        PBDataWriterWriteSubmessage();
        ++v239;
      }
      while (v237 != v239);
      uint64_t v237 = [(NSMutableArray *)v235 countByEnumeratingWithState:&v672 objects:v908 count:16];
    }
    while (v237);
  }

  long long v671 = 0u;
  long long v670 = 0u;
  long long v669 = 0u;
  long long v668 = 0u;
  uint64_t v240 = self->_cellularPowerLogCDMA1XRxDiversitys;
  uint64_t v241 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v668 objects:v907 count:16];
  if (v241)
  {
    uint64_t v242 = v241;
    uint64_t v243 = *(void *)v669;
    do
    {
      uint64_t v244 = 0;
      do
      {
        if (*(void *)v669 != v243) {
          objc_enumerationMutation(v240);
        }
        PBDataWriterWriteSubmessage();
        ++v244;
      }
      while (v242 != v244);
      uint64_t v242 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v668 objects:v907 count:16];
    }
    while (v242);
  }

  long long v667 = 0u;
  long long v666 = 0u;
  long long v665 = 0u;
  long long v664 = 0u;
  uint64_t v245 = self->_cellularPowerLogWCDMACDRXConfigs;
  uint64_t v246 = [(NSMutableArray *)v245 countByEnumeratingWithState:&v664 objects:v906 count:16];
  if (v246)
  {
    uint64_t v247 = v246;
    uint64_t v248 = *(void *)v665;
    do
    {
      uint64_t v249 = 0;
      do
      {
        if (*(void *)v665 != v248) {
          objc_enumerationMutation(v245);
        }
        PBDataWriterWriteSubmessage();
        ++v249;
      }
      while (v247 != v249);
      uint64_t v247 = [(NSMutableArray *)v245 countByEnumeratingWithState:&v664 objects:v906 count:16];
    }
    while (v247);
  }

  long long v663 = 0u;
  long long v662 = 0u;
  long long v661 = 0u;
  long long v660 = 0u;
  v250 = self->_cellularPowerLogLTECDRXConfigs;
  uint64_t v251 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v660 objects:v905 count:16];
  if (v251)
  {
    uint64_t v252 = v251;
    uint64_t v253 = *(void *)v661;
    do
    {
      uint64_t v254 = 0;
      do
      {
        if (*(void *)v661 != v253) {
          objc_enumerationMutation(v250);
        }
        PBDataWriterWriteSubmessage();
        ++v254;
      }
      while (v252 != v254);
      uint64_t v252 = [(NSMutableArray *)v250 countByEnumeratingWithState:&v660 objects:v905 count:16];
    }
    while (v252);
  }

  long long v659 = 0u;
  long long v658 = 0u;
  long long v657 = 0u;
  long long v656 = 0u;
  v255 = self->_cellularPowerLogWCDMARRCStateChanges;
  uint64_t v256 = [(NSMutableArray *)v255 countByEnumeratingWithState:&v656 objects:v904 count:16];
  if (v256)
  {
    uint64_t v257 = v256;
    uint64_t v258 = *(void *)v657;
    do
    {
      uint64_t v259 = 0;
      do
      {
        if (*(void *)v657 != v258) {
          objc_enumerationMutation(v255);
        }
        PBDataWriterWriteSubmessage();
        ++v259;
      }
      while (v257 != v259);
      uint64_t v257 = [(NSMutableArray *)v255 countByEnumeratingWithState:&v656 objects:v904 count:16];
    }
    while (v257);
  }

  long long v655 = 0u;
  long long v654 = 0u;
  long long v653 = 0u;
  long long v652 = 0u;
  uint64_t v260 = self->_cellularPowerLogLTERRCStateChanges;
  uint64_t v261 = [(NSMutableArray *)v260 countByEnumeratingWithState:&v652 objects:v903 count:16];
  if (v261)
  {
    uint64_t v262 = v261;
    uint64_t v263 = *(void *)v653;
    do
    {
      uint64_t v264 = 0;
      do
      {
        if (*(void *)v653 != v263) {
          objc_enumerationMutation(v260);
        }
        PBDataWriterWriteSubmessage();
        ++v264;
      }
      while (v262 != v264);
      uint64_t v262 = [(NSMutableArray *)v260 countByEnumeratingWithState:&v652 objects:v903 count:16];
    }
    while (v262);
  }

  long long v651 = 0u;
  long long v650 = 0u;
  long long v649 = 0u;
  long long v648 = 0u;
  uint64_t v265 = self->_cellularPowerLogSystemEvents;
  uint64_t v266 = [(NSMutableArray *)v265 countByEnumeratingWithState:&v648 objects:v902 count:16];
  if (v266)
  {
    uint64_t v267 = v266;
    uint64_t v268 = *(void *)v649;
    do
    {
      uint64_t v269 = 0;
      do
      {
        if (*(void *)v649 != v268) {
          objc_enumerationMutation(v265);
        }
        PBDataWriterWriteSubmessage();
        ++v269;
      }
      while (v267 != v269);
      uint64_t v267 = [(NSMutableArray *)v265 countByEnumeratingWithState:&v648 objects:v902 count:16];
    }
    while (v267);
  }

  long long v647 = 0u;
  long long v646 = 0u;
  long long v645 = 0u;
  long long v644 = 0u;
  v270 = self->_cellularPowerLogRATReselectionEvents;
  uint64_t v271 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v644 objects:v901 count:16];
  if (v271)
  {
    uint64_t v272 = v271;
    uint64_t v273 = *(void *)v645;
    do
    {
      uint64_t v274 = 0;
      do
      {
        if (*(void *)v645 != v273) {
          objc_enumerationMutation(v270);
        }
        PBDataWriterWriteSubmessage();
        ++v274;
      }
      while (v272 != v274);
      uint64_t v272 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v644 objects:v901 count:16];
    }
    while (v272);
  }

  long long v643 = 0u;
  long long v642 = 0u;
  long long v641 = 0u;
  long long v640 = 0u;
  uint64_t v275 = self->_cellularPowerLogRATRedirectionEvents;
  uint64_t v276 = [(NSMutableArray *)v275 countByEnumeratingWithState:&v640 objects:v900 count:16];
  if (v276)
  {
    uint64_t v277 = v276;
    uint64_t v278 = *(void *)v641;
    do
    {
      uint64_t v279 = 0;
      do
      {
        if (*(void *)v641 != v278) {
          objc_enumerationMutation(v275);
        }
        PBDataWriterWriteSubmessage();
        ++v279;
      }
      while (v277 != v279);
      uint64_t v277 = [(NSMutableArray *)v275 countByEnumeratingWithState:&v640 objects:v900 count:16];
    }
    while (v277);
  }

  long long v639 = 0u;
  long long v638 = 0u;
  long long v637 = 0u;
  long long v636 = 0u;
  uint64_t v280 = self->_cellularPowerLogGSMRRCStateChanges;
  uint64_t v281 = [(NSMutableArray *)v280 countByEnumeratingWithState:&v636 objects:v899 count:16];
  if (v281)
  {
    uint64_t v282 = v281;
    uint64_t v283 = *(void *)v637;
    do
    {
      uint64_t v284 = 0;
      do
      {
        if (*(void *)v637 != v283) {
          objc_enumerationMutation(v280);
        }
        PBDataWriterWriteSubmessage();
        ++v284;
      }
      while (v282 != v284);
      uint64_t v282 = [(NSMutableArray *)v280 countByEnumeratingWithState:&v636 objects:v899 count:16];
    }
    while (v282);
  }

  long long v635 = 0u;
  long long v634 = 0u;
  long long v633 = 0u;
  long long v632 = 0u;
  v285 = self->_cellularPowerLogCDMA1XRRCStateChanges;
  uint64_t v286 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v632 objects:v898 count:16];
  if (v286)
  {
    uint64_t v287 = v286;
    uint64_t v288 = *(void *)v633;
    do
    {
      uint64_t v289 = 0;
      do
      {
        if (*(void *)v633 != v288) {
          objc_enumerationMutation(v285);
        }
        PBDataWriterWriteSubmessage();
        ++v289;
      }
      while (v287 != v289);
      uint64_t v287 = [(NSMutableArray *)v285 countByEnumeratingWithState:&v632 objects:v898 count:16];
    }
    while (v287);
  }

  long long v631 = 0u;
  long long v630 = 0u;
  long long v629 = 0u;
  long long v628 = 0u;
  v290 = self->_cellularPowerLogHybridRRCStateChanges;
  uint64_t v291 = [(NSMutableArray *)v290 countByEnumeratingWithState:&v628 objects:v897 count:16];
  if (v291)
  {
    uint64_t v292 = v291;
    uint64_t v293 = *(void *)v629;
    do
    {
      uint64_t v294 = 0;
      do
      {
        if (*(void *)v629 != v293) {
          objc_enumerationMutation(v290);
        }
        PBDataWriterWriteSubmessage();
        ++v294;
      }
      while (v292 != v294);
      uint64_t v292 = [(NSMutableArray *)v290 countByEnumeratingWithState:&v628 objects:v897 count:16];
    }
    while (v292);
  }

  long long v627 = 0u;
  long long v626 = 0u;
  long long v625 = 0u;
  long long v624 = 0u;
  uint64_t v295 = self->_cellularPowerLogServiceStateEvents;
  uint64_t v296 = [(NSMutableArray *)v295 countByEnumeratingWithState:&v624 objects:v896 count:16];
  if (v296)
  {
    uint64_t v297 = v296;
    uint64_t v298 = *(void *)v625;
    do
    {
      uint64_t v299 = 0;
      do
      {
        if (*(void *)v625 != v298) {
          objc_enumerationMutation(v295);
        }
        PBDataWriterWriteSubmessage();
        ++v299;
      }
      while (v297 != v299);
      uint64_t v297 = [(NSMutableArray *)v295 countByEnumeratingWithState:&v624 objects:v896 count:16];
    }
    while (v297);
  }

  long long v623 = 0u;
  long long v622 = 0u;
  long long v621 = 0u;
  long long v620 = 0u;
  uint64_t v300 = self->_cellularPowerLogPLMNScanEvents;
  uint64_t v301 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v620 objects:v895 count:16];
  if (v301)
  {
    uint64_t v302 = v301;
    uint64_t v303 = *(void *)v621;
    do
    {
      uint64_t v304 = 0;
      do
      {
        if (*(void *)v621 != v303) {
          objc_enumerationMutation(v300);
        }
        PBDataWriterWriteSubmessage();
        ++v304;
      }
      while (v302 != v304);
      uint64_t v302 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v620 objects:v895 count:16];
    }
    while (v302);
  }

  long long v619 = 0u;
  long long v618 = 0u;
  long long v617 = 0u;
  long long v616 = 0u;
  v305 = self->_cellularPowerLogPLMNSearchEvents;
  uint64_t v306 = [(NSMutableArray *)v305 countByEnumeratingWithState:&v616 objects:v894 count:16];
  if (v306)
  {
    uint64_t v307 = v306;
    uint64_t v308 = *(void *)v617;
    do
    {
      uint64_t v309 = 0;
      do
      {
        if (*(void *)v617 != v308) {
          objc_enumerationMutation(v305);
        }
        PBDataWriterWriteSubmessage();
        ++v309;
      }
      while (v307 != v309);
      uint64_t v307 = [(NSMutableArray *)v305 countByEnumeratingWithState:&v616 objects:v894 count:16];
    }
    while (v307);
  }

  long long v615 = 0u;
  long long v614 = 0u;
  long long v613 = 0u;
  long long v612 = 0u;
  uint64_t v310 = self->_cellularPowerLogNRSARRCStateChanges;
  uint64_t v311 = [(NSMutableArray *)v310 countByEnumeratingWithState:&v612 objects:v893 count:16];
  if (v311)
  {
    uint64_t v312 = v311;
    uint64_t v313 = *(void *)v613;
    do
    {
      uint64_t v314 = 0;
      do
      {
        if (*(void *)v613 != v313) {
          objc_enumerationMutation(v310);
        }
        PBDataWriterWriteSubmessage();
        ++v314;
      }
      while (v312 != v314);
      uint64_t v312 = [(NSMutableArray *)v310 countByEnumeratingWithState:&v612 objects:v893 count:16];
    }
    while (v312);
  }

  long long v611 = 0u;
  long long v610 = 0u;
  long long v609 = 0u;
  long long v608 = 0u;
  uint64_t v315 = self->_cellularPowerLogNRNSAENDCEvents;
  uint64_t v316 = [(NSMutableArray *)v315 countByEnumeratingWithState:&v608 objects:v892 count:16];
  if (v316)
  {
    uint64_t v317 = v316;
    uint64_t v318 = *(void *)v609;
    do
    {
      uint64_t v319 = 0;
      do
      {
        if (*(void *)v609 != v318) {
          objc_enumerationMutation(v315);
        }
        PBDataWriterWriteSubmessage();
        ++v319;
      }
      while (v317 != v319);
      uint64_t v317 = [(NSMutableArray *)v315 countByEnumeratingWithState:&v608 objects:v892 count:16];
    }
    while (v317);
  }

  long long v607 = 0u;
  long long v606 = 0u;
  long long v605 = 0u;
  long long v604 = 0u;
  v320 = self->_cellularPowerLogNRCDRXConfigs;
  uint64_t v321 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v604 objects:v891 count:16];
  if (v321)
  {
    uint64_t v322 = v321;
    uint64_t v323 = *(void *)v605;
    do
    {
      uint64_t v324 = 0;
      do
      {
        if (*(void *)v605 != v323) {
          objc_enumerationMutation(v320);
        }
        PBDataWriterWriteSubmessage();
        ++v324;
      }
      while (v322 != v324);
      uint64_t v322 = [(NSMutableArray *)v320 countByEnumeratingWithState:&v604 objects:v891 count:16];
    }
    while (v322);
  }

  long long v603 = 0u;
  long long v602 = 0u;
  long long v601 = 0u;
  long long v600 = 0u;
  v325 = self->_cellularPowerLogNRsub6BWPs;
  uint64_t v326 = [(NSMutableArray *)v325 countByEnumeratingWithState:&v600 objects:v890 count:16];
  if (v326)
  {
    uint64_t v327 = v326;
    uint64_t v328 = *(void *)v601;
    do
    {
      uint64_t v329 = 0;
      do
      {
        if (*(void *)v601 != v328) {
          objc_enumerationMutation(v325);
        }
        PBDataWriterWriteSubmessage();
        ++v329;
      }
      while (v327 != v329);
      uint64_t v327 = [(NSMutableArray *)v325 countByEnumeratingWithState:&v600 objects:v890 count:16];
    }
    while (v327);
  }

  long long v599 = 0u;
  long long v598 = 0u;
  long long v597 = 0u;
  long long v596 = 0u;
  uint64_t v330 = self->_cellularPowerLogRFTunerStatsHists;
  uint64_t v331 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v596 objects:v889 count:16];
  if (v331)
  {
    uint64_t v332 = v331;
    uint64_t v333 = *(void *)v597;
    do
    {
      uint64_t v334 = 0;
      do
      {
        if (*(void *)v597 != v333) {
          objc_enumerationMutation(v330);
        }
        PBDataWriterWriteSubmessage();
        ++v334;
      }
      while (v332 != v334);
      uint64_t v332 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v596 objects:v889 count:16];
    }
    while (v332);
  }

  long long v595 = 0u;
  long long v594 = 0u;
  long long v593 = 0u;
  long long v592 = 0u;
  uint64_t v335 = self->_cellularPowerLogNRsub6CASCCConfigureds;
  uint64_t v336 = [(NSMutableArray *)v335 countByEnumeratingWithState:&v592 objects:v888 count:16];
  if (v336)
  {
    uint64_t v337 = v336;
    uint64_t v338 = *(void *)v593;
    do
    {
      uint64_t v339 = 0;
      do
      {
        if (*(void *)v593 != v338) {
          objc_enumerationMutation(v335);
        }
        PBDataWriterWriteSubmessage();
        ++v339;
      }
      while (v337 != v339);
      uint64_t v337 = [(NSMutableArray *)v335 countByEnumeratingWithState:&v592 objects:v888 count:16];
    }
    while (v337);
  }

  long long v591 = 0u;
  long long v590 = 0u;
  long long v589 = 0u;
  long long v588 = 0u;
  v340 = self->_cellularPowerLogNRsub6CASCCActivateds;
  uint64_t v341 = [(NSMutableArray *)v340 countByEnumeratingWithState:&v588 objects:v887 count:16];
  if (v341)
  {
    uint64_t v342 = v341;
    uint64_t v343 = *(void *)v589;
    do
    {
      uint64_t v344 = 0;
      do
      {
        if (*(void *)v589 != v343) {
          objc_enumerationMutation(v340);
        }
        PBDataWriterWriteSubmessage();
        ++v344;
      }
      while (v342 != v344);
      uint64_t v342 = [(NSMutableArray *)v340 countByEnumeratingWithState:&v588 objects:v887 count:16];
    }
    while (v342);
  }

  long long v587 = 0u;
  long long v586 = 0u;
  long long v585 = 0u;
  long long v584 = 0u;
  uint64_t v345 = self->_cellularPowerLogNRsub6RxTxs;
  uint64_t v346 = [(NSMutableArray *)v345 countByEnumeratingWithState:&v584 objects:v886 count:16];
  if (v346)
  {
    uint64_t v347 = v346;
    uint64_t v348 = *(void *)v585;
    do
    {
      uint64_t v349 = 0;
      do
      {
        if (*(void *)v585 != v348) {
          objc_enumerationMutation(v345);
        }
        PBDataWriterWriteSubmessage();
        ++v349;
      }
      while (v347 != v349);
      uint64_t v347 = [(NSMutableArray *)v345 countByEnumeratingWithState:&v584 objects:v886 count:16];
    }
    while (v347);
  }

  long long v583 = 0u;
  long long v582 = 0u;
  long long v581 = 0u;
  long long v580 = 0u;
  uint64_t v350 = self->_cellularPowerLogNRsub6CarrierComponentInfos;
  uint64_t v351 = [(NSMutableArray *)v350 countByEnumeratingWithState:&v580 objects:v885 count:16];
  if (v351)
  {
    uint64_t v352 = v351;
    uint64_t v353 = *(void *)v581;
    do
    {
      uint64_t v354 = 0;
      do
      {
        if (*(void *)v581 != v353) {
          objc_enumerationMutation(v350);
        }
        PBDataWriterWriteSubmessage();
        ++v354;
      }
      while (v352 != v354);
      uint64_t v352 = [(NSMutableArray *)v350 countByEnumeratingWithState:&v580 objects:v885 count:16];
    }
    while (v352);
  }

  long long v579 = 0u;
  long long v578 = 0u;
  long long v577 = 0u;
  long long v576 = 0u;
  v355 = self->_cellularPowerLogNRsub6DLTBSs;
  uint64_t v356 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v576 objects:v884 count:16];
  if (v356)
  {
    uint64_t v357 = v356;
    uint64_t v358 = *(void *)v577;
    do
    {
      uint64_t v359 = 0;
      do
      {
        if (*(void *)v577 != v358) {
          objc_enumerationMutation(v355);
        }
        PBDataWriterWriteSubmessage();
        ++v359;
      }
      while (v357 != v359);
      uint64_t v357 = [(NSMutableArray *)v355 countByEnumeratingWithState:&v576 objects:v884 count:16];
    }
    while (v357);
  }

  long long v575 = 0u;
  long long v574 = 0u;
  long long v573 = 0u;
  long long v572 = 0u;
  v360 = self->_cellularPowerLogNRsub6RSRPs;
  uint64_t v361 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v572 objects:v883 count:16];
  if (v361)
  {
    uint64_t v362 = v361;
    uint64_t v363 = *(void *)v573;
    do
    {
      uint64_t v364 = 0;
      do
      {
        if (*(void *)v573 != v363) {
          objc_enumerationMutation(v360);
        }
        PBDataWriterWriteSubmessage();
        ++v364;
      }
      while (v362 != v364);
      uint64_t v362 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v572 objects:v883 count:16];
    }
    while (v362);
  }

  long long v571 = 0u;
  long long v570 = 0u;
  long long v569 = 0u;
  long long v568 = 0u;
  uint64_t v365 = self->_cellularPowerLogNRsub6ULCAStates;
  uint64_t v366 = [(NSMutableArray *)v365 countByEnumeratingWithState:&v568 objects:v882 count:16];
  if (v366)
  {
    uint64_t v367 = v366;
    uint64_t v368 = *(void *)v569;
    do
    {
      uint64_t v369 = 0;
      do
      {
        if (*(void *)v569 != v368) {
          objc_enumerationMutation(v365);
        }
        PBDataWriterWriteSubmessage();
        ++v369;
      }
      while (v367 != v369);
      uint64_t v367 = [(NSMutableArray *)v365 countByEnumeratingWithState:&v568 objects:v882 count:16];
    }
    while (v367);
  }

  long long v567 = 0u;
  long long v566 = 0u;
  long long v565 = 0u;
  long long v564 = 0u;
  uint64_t v370 = self->_cellularPowerLogNRsub6TxPowers;
  uint64_t v371 = [(NSMutableArray *)v370 countByEnumeratingWithState:&v564 objects:v881 count:16];
  if (v371)
  {
    uint64_t v372 = v371;
    uint64_t v373 = *(void *)v565;
    do
    {
      uint64_t v374 = 0;
      do
      {
        if (*(void *)v565 != v373) {
          objc_enumerationMutation(v370);
        }
        PBDataWriterWriteSubmessage();
        ++v374;
      }
      while (v372 != v374);
      uint64_t v372 = [(NSMutableArray *)v370 countByEnumeratingWithState:&v564 objects:v881 count:16];
    }
    while (v372);
  }

  long long v563 = 0u;
  long long v562 = 0u;
  long long v561 = 0u;
  long long v560 = 0u;
  v375 = self->_cellularPowerLogNRsub6RxDiversitys;
  uint64_t v376 = [(NSMutableArray *)v375 countByEnumeratingWithState:&v560 objects:v880 count:16];
  if (v376)
  {
    uint64_t v377 = v376;
    uint64_t v378 = *(void *)v561;
    do
    {
      uint64_t v379 = 0;
      do
      {
        if (*(void *)v561 != v378) {
          objc_enumerationMutation(v375);
        }
        PBDataWriterWriteSubmessage();
        ++v379;
      }
      while (v377 != v379);
      uint64_t v377 = [(NSMutableArray *)v375 countByEnumeratingWithState:&v560 objects:v880 count:16];
    }
    while (v377);
  }

  long long v559 = 0u;
  long long v558 = 0u;
  long long v557 = 0u;
  long long v556 = 0u;
  uint64_t v380 = self->_cellularPowerLogSPMIs;
  uint64_t v381 = [(NSMutableArray *)v380 countByEnumeratingWithState:&v556 objects:v879 count:16];
  if (v381)
  {
    uint64_t v382 = v381;
    uint64_t v383 = *(void *)v557;
    do
    {
      uint64_t v384 = 0;
      do
      {
        if (*(void *)v557 != v383) {
          objc_enumerationMutation(v380);
        }
        PBDataWriterWriteSubmessage();
        ++v384;
      }
      while (v382 != v384);
      uint64_t v382 = [(NSMutableArray *)v380 countByEnumeratingWithState:&v556 objects:v879 count:16];
    }
    while (v382);
  }

  long long v555 = 0u;
  long long v554 = 0u;
  long long v553 = 0u;
  long long v552 = 0u;
  uint64_t v385 = self->_cellularPowerLogNRmmWaveBWPs;
  uint64_t v386 = [(NSMutableArray *)v385 countByEnumeratingWithState:&v552 objects:v878 count:16];
  if (v386)
  {
    uint64_t v387 = v386;
    uint64_t v388 = *(void *)v553;
    do
    {
      uint64_t v389 = 0;
      do
      {
        if (*(void *)v553 != v388) {
          objc_enumerationMutation(v385);
        }
        PBDataWriterWriteSubmessage();
        ++v389;
      }
      while (v387 != v389);
      uint64_t v387 = [(NSMutableArray *)v385 countByEnumeratingWithState:&v552 objects:v878 count:16];
    }
    while (v387);
  }

  long long v551 = 0u;
  long long v550 = 0u;
  long long v549 = 0u;
  long long v548 = 0u;
  v390 = self->_cellularPowerLogNRmmWaveAntennaPanels;
  uint64_t v391 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v548 objects:v877 count:16];
  if (v391)
  {
    uint64_t v392 = v391;
    uint64_t v393 = *(void *)v549;
    do
    {
      uint64_t v394 = 0;
      do
      {
        if (*(void *)v549 != v393) {
          objc_enumerationMutation(v390);
        }
        PBDataWriterWriteSubmessage();
        ++v394;
      }
      while (v392 != v394);
      uint64_t v392 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v548 objects:v877 count:16];
    }
    while (v392);
  }

  long long v547 = 0u;
  long long v546 = 0u;
  long long v545 = 0u;
  long long v544 = 0u;
  v395 = self->_cellularPowerLogNRFRCoverages;
  uint64_t v396 = [(NSMutableArray *)v395 countByEnumeratingWithState:&v544 objects:v876 count:16];
  if (v396)
  {
    uint64_t v397 = v396;
    uint64_t v398 = *(void *)v545;
    do
    {
      uint64_t v399 = 0;
      do
      {
        if (*(void *)v545 != v398) {
          objc_enumerationMutation(v395);
        }
        PBDataWriterWriteSubmessage();
        ++v399;
      }
      while (v397 != v399);
      uint64_t v397 = [(NSMutableArray *)v395 countByEnumeratingWithState:&v544 objects:v876 count:16];
    }
    while (v397);
  }

  long long v542 = 0u;
  long long v543 = 0u;
  long long v540 = 0u;
  long long v541 = 0u;
  uint64_t v400 = self->_cellularPowerLogNRmmWaveBeamIDs;
  uint64_t v401 = [(NSMutableArray *)v400 countByEnumeratingWithState:&v540 objects:v875 count:16];
  if (v401)
  {
    uint64_t v402 = v401;
    uint64_t v403 = *(void *)v541;
    do
    {
      uint64_t v404 = 0;
      do
      {
        if (*(void *)v541 != v403) {
          objc_enumerationMutation(v400);
        }
        PBDataWriterWriteSubmessage();
        ++v404;
      }
      while (v402 != v404);
      uint64_t v402 = [(NSMutableArray *)v400 countByEnumeratingWithState:&v540 objects:v875 count:16];
    }
    while (v402);
  }

  long long v538 = 0u;
  long long v539 = 0u;
  long long v536 = 0u;
  long long v537 = 0u;
  uint64_t v405 = self->_cellularPowerLogSFTStates;
  uint64_t v406 = [(NSMutableArray *)v405 countByEnumeratingWithState:&v536 objects:v874 count:16];
  if (v406)
  {
    uint64_t v407 = v406;
    uint64_t v408 = *(void *)v537;
    do
    {
      uint64_t v409 = 0;
      do
      {
        if (*(void *)v537 != v408) {
          objc_enumerationMutation(v405);
        }
        PBDataWriterWriteSubmessage();
        ++v409;
      }
      while (v407 != v409);
      uint64_t v407 = [(NSMutableArray *)v405 countByEnumeratingWithState:&v536 objects:v874 count:16];
    }
    while (v407);
  }

  long long v534 = 0u;
  long long v535 = 0u;
  long long v532 = 0u;
  long long v533 = 0u;
  v410 = self->_cellularPowerLogNRmmWaveCASCCConfigureds;
  uint64_t v411 = [(NSMutableArray *)v410 countByEnumeratingWithState:&v532 objects:v873 count:16];
  if (v411)
  {
    uint64_t v412 = v411;
    uint64_t v413 = *(void *)v533;
    do
    {
      uint64_t v414 = 0;
      do
      {
        if (*(void *)v533 != v413) {
          objc_enumerationMutation(v410);
        }
        PBDataWriterWriteSubmessage();
        ++v414;
      }
      while (v412 != v414);
      uint64_t v412 = [(NSMutableArray *)v410 countByEnumeratingWithState:&v532 objects:v873 count:16];
    }
    while (v412);
  }

  long long v530 = 0u;
  long long v531 = 0u;
  long long v528 = 0u;
  long long v529 = 0u;
  uint64_t v415 = self->_cellularPowerLogNRmmWaveCASCCActivateds;
  uint64_t v416 = [(NSMutableArray *)v415 countByEnumeratingWithState:&v528 objects:v872 count:16];
  if (v416)
  {
    uint64_t v417 = v416;
    uint64_t v418 = *(void *)v529;
    do
    {
      uint64_t v419 = 0;
      do
      {
        if (*(void *)v529 != v418) {
          objc_enumerationMutation(v415);
        }
        PBDataWriterWriteSubmessage();
        ++v419;
      }
      while (v417 != v419);
      uint64_t v417 = [(NSMutableArray *)v415 countByEnumeratingWithState:&v528 objects:v872 count:16];
    }
    while (v417);
  }

  long long v526 = 0u;
  long long v527 = 0u;
  long long v524 = 0u;
  long long v525 = 0u;
  uint64_t v420 = self->_cellularPowerLogNRmmWaveRxTxs;
  uint64_t v421 = [(NSMutableArray *)v420 countByEnumeratingWithState:&v524 objects:v871 count:16];
  if (v421)
  {
    uint64_t v422 = v421;
    uint64_t v423 = *(void *)v525;
    do
    {
      uint64_t v424 = 0;
      do
      {
        if (*(void *)v525 != v423) {
          objc_enumerationMutation(v420);
        }
        PBDataWriterWriteSubmessage();
        ++v424;
      }
      while (v422 != v424);
      uint64_t v422 = [(NSMutableArray *)v420 countByEnumeratingWithState:&v524 objects:v871 count:16];
    }
    while (v422);
  }

  long long v522 = 0u;
  long long v523 = 0u;
  long long v520 = 0u;
  long long v521 = 0u;
  v425 = self->_cellularPowerLogNRmmWaveCarrierComponentInfos;
  uint64_t v426 = [(NSMutableArray *)v425 countByEnumeratingWithState:&v520 objects:v870 count:16];
  if (v426)
  {
    uint64_t v427 = v426;
    uint64_t v428 = *(void *)v521;
    do
    {
      uint64_t v429 = 0;
      do
      {
        if (*(void *)v521 != v428) {
          objc_enumerationMutation(v425);
        }
        PBDataWriterWriteSubmessage();
        ++v429;
      }
      while (v427 != v429);
      uint64_t v427 = [(NSMutableArray *)v425 countByEnumeratingWithState:&v520 objects:v870 count:16];
    }
    while (v427);
  }

  long long v518 = 0u;
  long long v519 = 0u;
  long long v516 = 0u;
  long long v517 = 0u;
  v430 = self->_cellularPowerLogNRmmWaveDLTBSs;
  uint64_t v431 = [(NSMutableArray *)v430 countByEnumeratingWithState:&v516 objects:v869 count:16];
  if (v431)
  {
    uint64_t v432 = v431;
    uint64_t v433 = *(void *)v517;
    do
    {
      uint64_t v434 = 0;
      do
      {
        if (*(void *)v517 != v433) {
          objc_enumerationMutation(v430);
        }
        PBDataWriterWriteSubmessage();
        ++v434;
      }
      while (v432 != v434);
      uint64_t v432 = [(NSMutableArray *)v430 countByEnumeratingWithState:&v516 objects:v869 count:16];
    }
    while (v432);
  }

  long long v514 = 0u;
  long long v515 = 0u;
  long long v512 = 0u;
  long long v513 = 0u;
  uint64_t v435 = self->_cellularPowerLogNRMmWaveRSRPs;
  uint64_t v436 = [(NSMutableArray *)v435 countByEnumeratingWithState:&v512 objects:v868 count:16];
  if (v436)
  {
    uint64_t v437 = v436;
    uint64_t v438 = *(void *)v513;
    do
    {
      uint64_t v439 = 0;
      do
      {
        if (*(void *)v513 != v438) {
          objc_enumerationMutation(v435);
        }
        PBDataWriterWriteSubmessage();
        ++v439;
      }
      while (v437 != v439);
      uint64_t v437 = [(NSMutableArray *)v435 countByEnumeratingWithState:&v512 objects:v868 count:16];
    }
    while (v437);
  }

  long long v510 = 0u;
  long long v511 = 0u;
  long long v508 = 0u;
  long long v509 = 0u;
  uint64_t v440 = self->_cellularPowerLogSFTRxTxs;
  uint64_t v441 = [(NSMutableArray *)v440 countByEnumeratingWithState:&v508 objects:v867 count:16];
  if (v441)
  {
    uint64_t v442 = v441;
    uint64_t v443 = *(void *)v509;
    do
    {
      uint64_t v444 = 0;
      do
      {
        if (*(void *)v509 != v443) {
          objc_enumerationMutation(v440);
        }
        PBDataWriterWriteSubmessage();
        ++v444;
      }
      while (v442 != v444);
      uint64_t v442 = [(NSMutableArray *)v440 countByEnumeratingWithState:&v508 objects:v867 count:16];
    }
    while (v442);
  }

  long long v506 = 0u;
  long long v507 = 0u;
  long long v504 = 0u;
  long long v505 = 0u;
  v445 = self->_cellularPowerLogNRMmWaveTxPowers;
  uint64_t v446 = [(NSMutableArray *)v445 countByEnumeratingWithState:&v504 objects:v866 count:16];
  if (v446)
  {
    uint64_t v447 = v446;
    uint64_t v448 = *(void *)v505;
    do
    {
      uint64_t v449 = 0;
      do
      {
        if (*(void *)v505 != v448) {
          objc_enumerationMutation(v445);
        }
        PBDataWriterWriteSubmessage();
        ++v449;
      }
      while (v447 != v449);
      uint64_t v447 = [(NSMutableArray *)v445 countByEnumeratingWithState:&v504 objects:v866 count:16];
    }
    while (v447);
  }

  long long v502 = 0u;
  long long v503 = 0u;
  long long v500 = 0u;
  long long v501 = 0u;
  uint64_t v450 = self->_cellularPowerLogNRMmWaveULCAStates;
  uint64_t v451 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v500 objects:v865 count:16];
  if (v451)
  {
    uint64_t v452 = v451;
    uint64_t v453 = *(void *)v501;
    do
    {
      uint64_t v454 = 0;
      do
      {
        if (*(void *)v501 != v453) {
          objc_enumerationMutation(v450);
        }
        PBDataWriterWriteSubmessage();
        ++v454;
      }
      while (v452 != v454);
      uint64_t v452 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v500 objects:v865 count:16];
    }
    while (v452);
  }

  long long v498 = 0u;
  long long v499 = 0u;
  long long v496 = 0u;
  long long v497 = 0u;
  uint64_t v455 = self->_cellularPowerLogNRsub6BWPSCCs;
  uint64_t v456 = [(NSMutableArray *)v455 countByEnumeratingWithState:&v496 objects:v864 count:16];
  if (v456)
  {
    uint64_t v457 = v456;
    uint64_t v458 = *(void *)v497;
    do
    {
      uint64_t v459 = 0;
      do
      {
        if (*(void *)v497 != v458) {
          objc_enumerationMutation(v455);
        }
        PBDataWriterWriteSubmessage();
        ++v459;
      }
      while (v457 != v459);
      uint64_t v457 = [(NSMutableArray *)v455 countByEnumeratingWithState:&v496 objects:v864 count:16];
    }
    while (v457);
  }

  long long v494 = 0u;
  long long v495 = 0u;
  long long v492 = 0u;
  long long v493 = 0u;
  v460 = self->_cellularPowerLogNRmmWaveBWPSCCs;
  uint64_t v461 = [(NSMutableArray *)v460 countByEnumeratingWithState:&v492 objects:v863 count:16];
  if (v461)
  {
    uint64_t v462 = v461;
    uint64_t v463 = *(void *)v493;
    do
    {
      uint64_t v464 = 0;
      do
      {
        if (*(void *)v493 != v463) {
          objc_enumerationMutation(v460);
        }
        PBDataWriterWriteSubmessage();
        ++v464;
      }
      while (v462 != v464);
      uint64_t v462 = [(NSMutableArray *)v460 countByEnumeratingWithState:&v492 objects:v863 count:16];
    }
    while (v462);
  }

  long long v490 = 0u;
  long long v491 = 0u;
  long long v488 = 0u;
  long long v489 = 0u;
  v465 = self->_cellularPowerLogNRDCEvents;
  uint64_t v466 = [(NSMutableArray *)v465 countByEnumeratingWithState:&v488 objects:v862 count:16];
  if (v466)
  {
    uint64_t v467 = v466;
    uint64_t v468 = *(void *)v489;
    do
    {
      uint64_t v469 = 0;
      do
      {
        if (*(void *)v489 != v468) {
          objc_enumerationMutation(v465);
        }
        PBDataWriterWriteSubmessage();
        ++v469;
      }
      while (v467 != v469);
      uint64_t v467 = [(NSMutableArray *)v465 countByEnumeratingWithState:&v488 objects:v862 count:16];
    }
    while (v467);
  }

  long long v486 = 0u;
  long long v487 = 0u;
  long long v484 = 0u;
  long long v485 = 0u;
  uint64_t v470 = self->_cellularPowerLogWUSs;
  uint64_t v471 = [(NSMutableArray *)v470 countByEnumeratingWithState:&v484 objects:v861 count:16];
  if (v471)
  {
    uint64_t v472 = v471;
    uint64_t v473 = *(void *)v485;
    do
    {
      uint64_t v474 = 0;
      do
      {
        if (*(void *)v485 != v473) {
          objc_enumerationMutation(v470);
        }
        PBDataWriterWriteSubmessage();
        ++v474;
      }
      while (v472 != v474);
      uint64_t v472 = [(NSMutableArray *)v470 countByEnumeratingWithState:&v484 objects:v861 count:16];
    }
    while (v472);
  }

  long long v482 = 0u;
  long long v483 = 0u;
  long long v480 = 0u;
  long long v481 = 0u;
  uint64_t v475 = self->_cellularPowerLogNRsub6BWPSAs;
  uint64_t v476 = [(NSMutableArray *)v475 countByEnumeratingWithState:&v480 objects:v860 count:16];
  if (v476)
  {
    uint64_t v477 = v476;
    uint64_t v478 = *(void *)v481;
    do
    {
      uint64_t v479 = 0;
      do
      {
        if (*(void *)v481 != v478) {
          objc_enumerationMutation(v475);
        }
        PBDataWriterWriteSubmessage();
        ++v479;
      }
      while (v477 != v479);
      uint64_t v477 = [(NSMutableArray *)v475 countByEnumeratingWithState:&v480 objects:v860 count:16];
    }
    while (v477);
  }
}

- (void)copyTo:(id)a3
{
  id v384 = a3;
  if ([(AWDMETRICSCellularPowerLog *)self cellularPerClientProfileTriggerCountsCount])
  {
    [v384 clearCellularPerClientProfileTriggerCounts];
    unint64_t v4 = [(AWDMETRICSCellularPowerLog *)self cellularPerClientProfileTriggerCountsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(AWDMETRICSCellularPowerLog *)self cellularPerClientProfileTriggerCountAtIndex:i];
        [v384 addCellularPerClientProfileTriggerCount:v7];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularNrSDMActivationsCount])
  {
    [v384 clearCellularNrSDMActivations];
    unint64_t v8 = [(AWDMETRICSCellularPowerLog *)self cellularNrSDMActivationsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(AWDMETRICSCellularPowerLog *)self cellularNrSDMActivationAtIndex:j];
        [v384 addCellularNrSDMActivation:v11];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularNrSdmEndcReleasesCount])
  {
    [v384 clearCellularNrSdmEndcReleases];
    unint64_t v12 = [(AWDMETRICSCellularPowerLog *)self cellularNrSdmEndcReleasesCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        uint64_t v15 = [(AWDMETRICSCellularPowerLog *)self cellularNrSdmEndcReleaseAtIndex:k];
        [v384 addCellularNrSdmEndcRelease:v15];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularDynamicRatSelectionsCount])
  {
    [v384 clearCellularDynamicRatSelections];
    unint64_t v16 = [(AWDMETRICSCellularPowerLog *)self cellularDynamicRatSelectionsCount];
    if (v16)
    {
      unint64_t v17 = v16;
      for (uint64_t m = 0; m != v17; ++m)
      {
        uint64_t v19 = [(AWDMETRICSCellularPowerLog *)self cellularDynamicRatSelectionAtIndex:m];
        [v384 addCellularDynamicRatSelection:v19];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogXOShutdownsCount])
  {
    [v384 clearCellularPowerLogXOShutdowns];
    unint64_t v20 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogXOShutdownsCount];
    if (v20)
    {
      unint64_t v21 = v20;
      for (uint64_t n = 0; n != v21; ++n)
      {
        uint64_t v23 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogXOShutdownAtIndex:n];
        [v384 addCellularPowerLogXOShutdown:v23];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogAPPSPerfLevelsCount])
  {
    [v384 clearCellularPowerLogAPPSPerfLevels];
    unint64_t v24 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogAPPSPerfLevelsCount];
    if (v24)
    {
      unint64_t v25 = v24;
      for (iuint64_t i = 0; ii != v25; ++ii)
      {
        uint64_t v27 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogAPPSPerfLevelsAtIndex:ii];
        [v384 addCellularPowerLogAPPSPerfLevels:v27];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogAPPSCXOShutdownsCount])
  {
    [v384 clearCellularPowerLogAPPSCXOShutdowns];
    unint64_t v28 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogAPPSCXOShutdownsCount];
    if (v28)
    {
      unint64_t v29 = v28;
      for (juint64_t j = 0; jj != v29; ++jj)
      {
        uint64_t v31 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogAPPSCXOShutdownAtIndex:jj];
        [v384 addCellularPowerLogAPPSCXOShutdown:v31];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogAPPSSleepVetosCount])
  {
    [v384 clearCellularPowerLogAPPSSleepVetos];
    unint64_t v32 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogAPPSSleepVetosCount];
    if (v32)
    {
      unint64_t v33 = v32;
      for (kuint64_t k = 0; kk != v33; ++kk)
      {
        uint64_t v35 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogAPPSSleepVetoAtIndex:kk];
        [v384 addCellularPowerLogAPPSSleepVeto:v35];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogMCPMSleepVetosCount])
  {
    [v384 clearCellularPowerLogMCPMSleepVetos];
    unint64_t v36 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogMCPMSleepVetosCount];
    if (v36)
    {
      unint64_t v37 = v36;
      for (muint64_t m = 0; mm != v37; ++mm)
      {
        uint64_t v39 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogMCPMSleepVetoAtIndex:mm];
        [v384 addCellularPowerLogMCPMSleepVeto:v39];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogMPSSPerfLevelsCount])
  {
    [v384 clearCellularPowerLogMPSSPerfLevels];
    unint64_t v40 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogMPSSPerfLevelsCount];
    if (v40)
    {
      unint64_t v41 = v40;
      for (nuint64_t n = 0; nn != v41; ++nn)
      {
        uint64_t v43 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogMPSSPerfLevelsAtIndex:nn];
        [v384 addCellularPowerLogMPSSPerfLevels:v43];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogGPSStatesCount])
  {
    [v384 clearCellularPowerLogGPSStates];
    unint64_t v44 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGPSStatesCount];
    if (v44)
    {
      unint64_t v45 = v44;
      for (uint64_t i1 = 0; i1 != v45; ++i1)
      {
        uint64_t v47 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGPSStatesAtIndex:i1];
        [v384 addCellularPowerLogGPSStates:v47];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogAOPUARTStatesCount])
  {
    [v384 clearCellularPowerLogAOPUARTStates];
    unint64_t v48 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogAOPUARTStatesCount];
    if (v48)
    {
      unint64_t v49 = v48;
      for (uint64_t i2 = 0; i2 != v49; ++i2)
      {
        uint64_t v51 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogAOPUARTStatesAtIndex:i2];
        [v384 addCellularPowerLogAOPUARTStates:v51];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogWLANUARTStatesCount])
  {
    [v384 clearCellularPowerLogWLANUARTStates];
    unint64_t v52 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWLANUARTStatesCount];
    if (v52)
    {
      unint64_t v53 = v52;
      for (uint64_t i3 = 0; i3 != v53; ++i3)
      {
        uint64_t v55 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWLANUARTStatesAtIndex:i3];
        [v384 addCellularPowerLogWLANUARTStates:v55];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogPCIeStatesCount])
  {
    [v384 clearCellularPowerLogPCIeStates];
    unint64_t v56 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPCIeStatesCount];
    if (v56)
    {
      unint64_t v57 = v56;
      for (uint64_t i4 = 0; i4 != v57; ++i4)
      {
        uint64_t v59 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPCIeStatesAtIndex:i4];
        [v384 addCellularPowerLogPCIeStates:v59];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogL1SleepStatesCount])
  {
    [v384 clearCellularPowerLogL1SleepStates];
    unint64_t v60 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogL1SleepStatesCount];
    if (v60)
    {
      unint64_t v61 = v60;
      for (uint64_t i5 = 0; i5 != v61; ++i5)
      {
        uint64_t v63 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogL1SleepStatesAtIndex:i5];
        [v384 addCellularPowerLogL1SleepStates:v63];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEConfiguredCASCCStatesCount])
  {
    [v384 clearCellularPowerLogLTEConfiguredCASCCStates];
    unint64_t v64 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEConfiguredCASCCStatesCount];
    if (v64)
    {
      unint64_t v65 = v64;
      for (uint64_t i6 = 0; i6 != v65; ++i6)
      {
        uint64_t v67 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEConfiguredCASCCStatesAtIndex:i6];
        [v384 addCellularPowerLogLTEConfiguredCASCCStates:v67];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEActivatedCASCCStatesCount])
  {
    [v384 clearCellularPowerLogLTEActivatedCASCCStates];
    unint64_t v68 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEActivatedCASCCStatesCount];
    if (v68)
    {
      unint64_t v69 = v68;
      for (uint64_t i7 = 0; i7 != v69; ++i7)
      {
        uint64_t v71 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEActivatedCASCCStatesAtIndex:i7];
        [v384 addCellularPowerLogLTEActivatedCASCCStates:v71];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERxTxActivityStatesCount])
  {
    [v384 clearCellularPowerLogLTERxTxActivityStates];
    unint64_t v72 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERxTxActivityStatesCount];
    if (v72)
    {
      unint64_t v73 = v72;
      for (uint64_t i8 = 0; i8 != v73; ++i8)
      {
        v75 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERxTxActivityStatesAtIndex:i8];
        [v384 addCellularPowerLogLTERxTxActivityStates:v75];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTECarrierComponentInfosCount])
  {
    [v384 clearCellularPowerLogLTECarrierComponentInfos];
    unint64_t v76 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTECarrierComponentInfosCount];
    if (v76)
    {
      unint64_t v77 = v76;
      for (uint64_t i9 = 0; i9 != v77; ++i9)
      {
        uint64_t v79 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTECarrierComponentInfoAtIndex:i9];
        [v384 addCellularPowerLogLTECarrierComponentInfo:v79];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEAggregatedDLTBSsCount])
  {
    [v384 clearCellularPowerLogLTEAggregatedDLTBSs];
    unint64_t v80 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEAggregatedDLTBSsCount];
    if (v80)
    {
      unint64_t v81 = v80;
      for (uint64_t i10 = 0; i10 != v81; ++i10)
      {
        uint64_t v83 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEAggregatedDLTBSAtIndex:i10];
        [v384 addCellularPowerLogLTEAggregatedDLTBS:v83];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERSRPsCount])
  {
    [v384 clearCellularPowerLogLTERSRPs];
    unint64_t v84 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERSRPsCount];
    if (v84)
    {
      unint64_t v85 = v84;
      for (uint64_t i11 = 0; i11 != v85; ++i11)
      {
        uint64_t v87 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERSRPAtIndex:i11];
        [v384 addCellularPowerLogLTERSRP:v87];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTESINRsCount])
  {
    [v384 clearCellularPowerLogLTESINRs];
    unint64_t v88 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTESINRsCount];
    if (v88)
    {
      unint64_t v89 = v88;
      for (uint64_t i12 = 0; i12 != v89; ++i12)
      {
        uint64_t v91 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTESINRAtIndex:i12];
        [v384 addCellularPowerLogLTESINR:v91];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTETxPowersCount])
  {
    [v384 clearCellularPowerLogLTETxPowers];
    unint64_t v92 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTETxPowersCount];
    if (v92)
    {
      unint64_t v93 = v92;
      for (uint64_t i13 = 0; i13 != v93; ++i13)
      {
        v95 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTETxPowerAtIndex:i13];
        [v384 addCellularPowerLogLTETxPower:v95];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERxDiversitysCount])
  {
    [v384 clearCellularPowerLogLTERxDiversitys];
    unint64_t v96 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERxDiversitysCount];
    if (v96)
    {
      unint64_t v97 = v96;
      for (uint64_t i14 = 0; i14 != v97; ++i14)
      {
        uint64_t v99 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERxDiversityAtIndex:i14];
        [v384 addCellularPowerLogLTERxDiversity:v99];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEULCAStatesCount])
  {
    [v384 clearCellularPowerLogLTEULCAStates];
    unint64_t v100 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEULCAStatesCount];
    if (v100)
    {
      unint64_t v101 = v100;
      for (uint64_t i15 = 0; i15 != v101; ++i15)
      {
        uint64_t v103 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEULCAStateAtIndex:i15];
        [v384 addCellularPowerLogLTEULCAState:v103];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogPowerEstimatorsCount])
  {
    [v384 clearCellularPowerLogPowerEstimators];
    unint64_t v104 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPowerEstimatorsCount];
    if (v104)
    {
      unint64_t v105 = v104;
      for (uint64_t i16 = 0; i16 != v105; ++i16)
      {
        uint64_t v107 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPowerEstimatorAtIndex:i16];
        [v384 addCellularPowerLogPowerEstimator:v107];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEPagingDRXCyclesCount])
  {
    [v384 clearCellularPowerLogLTEPagingDRXCycles];
    unint64_t v108 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEPagingDRXCyclesCount];
    if (v108)
    {
      unint64_t v109 = v108;
      for (uint64_t i17 = 0; i17 != v109; ++i17)
      {
        uint64_t v111 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTEPagingDRXCycleAtIndex:i17];
        [v384 addCellularPowerLogLTEPagingDRXCycle:v111];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRPagingDRXCyclesCount])
  {
    [v384 clearCellularPowerLogNRPagingDRXCycles];
    unint64_t v112 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRPagingDRXCyclesCount];
    if (v112)
    {
      unint64_t v113 = v112;
      for (uint64_t i18 = 0; i18 != v113; ++i18)
      {
        v115 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRPagingDRXCycleAtIndex:i18];
        [v384 addCellularPowerLogNRPagingDRXCycle:v115];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogProtocolStatesCount])
  {
    [v384 clearCellularPowerLogProtocolStates];
    unint64_t v116 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogProtocolStatesCount];
    if (v116)
    {
      unint64_t v117 = v116;
      for (uint64_t i19 = 0; i19 != v117; ++i19)
      {
        uint64_t v119 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogProtocolStateAtIndex:i19];
        [v384 addCellularPowerLogProtocolState:v119];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogPLMNSearchsCount])
  {
    [v384 clearCellularPowerLogPLMNSearchs];
    unint64_t v120 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPLMNSearchsCount];
    if (v120)
    {
      unint64_t v121 = v120;
      for (uint64_t i20 = 0; i20 != v121; ++i20)
      {
        uint64_t v123 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPLMNSearchAtIndex:i20];
        [v384 addCellularPowerLogPLMNSearch:v123];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMTxPowersCount])
  {
    [v384 clearCellularPowerLogGSMTxPowers];
    unint64_t v124 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMTxPowersCount];
    if (v124)
    {
      unint64_t v125 = v124;
      for (uint64_t i21 = 0; i21 != v125; ++i21)
      {
        uint64_t v127 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMTxPowerAtIndex:i21];
        [v384 addCellularPowerLogGSMTxPower:v127];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRxRSSIsCount])
  {
    [v384 clearCellularPowerLogGSMRxRSSIs];
    unint64_t v128 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRxRSSIsCount];
    if (v128)
    {
      unint64_t v129 = v128;
      for (uint64_t i22 = 0; i22 != v129; ++i22)
      {
        uint64_t v131 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRxRSSIAtIndex:i22];
        [v384 addCellularPowerLogGSMRxRSSI:v131];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRABModesCount])
  {
    [v384 clearCellularPowerLogGSMRABModes];
    unint64_t v132 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRABModesCount];
    if (v132)
    {
      unint64_t v133 = v132;
      for (uint64_t i23 = 0; i23 != v133; ++i23)
      {
        uint64_t v135 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRABModeAtIndex:i23];
        [v384 addCellularPowerLogGSMRABMode:v135];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRxDiversitysCount])
  {
    [v384 clearCellularPowerLogGSMRxDiversitys];
    unint64_t v136 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRxDiversitysCount];
    if (v136)
    {
      unint64_t v137 = v136;
      for (uint64_t i24 = 0; i24 != v137; ++i24)
      {
        uint64_t v139 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRxDiversityAtIndex:i24];
        [v384 addCellularPowerLogGSMRxDiversity:v139];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMATxPowersCount])
  {
    [v384 clearCellularPowerLogWCDMATxPowers];
    unint64_t v140 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMATxPowersCount];
    if (v140)
    {
      unint64_t v141 = v140;
      for (uint64_t i25 = 0; i25 != v141; ++i25)
      {
        uint64_t v143 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMATxPowerAtIndex:i25];
        [v384 addCellularPowerLogWCDMATxPower:v143];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARxRSSIsCount])
  {
    [v384 clearCellularPowerLogWCDMARxRSSIs];
    unint64_t v144 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARxRSSIsCount];
    if (v144)
    {
      unint64_t v145 = v144;
      for (uint64_t i26 = 0; i26 != v145; ++i26)
      {
        uint64_t v147 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARxRSSIAtIndex:i26];
        [v384 addCellularPowerLogWCDMARxRSSI:v147];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRSCGRelsCount])
  {
    [v384 clearCellularPowerLogNRSCGRels];
    unint64_t v148 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRSCGRelsCount];
    if (v148)
    {
      unint64_t v149 = v148;
      for (uint64_t i27 = 0; i27 != v149; ++i27)
      {
        uint64_t v151 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRSCGRelAtIndex:i27];
        [v384 addCellularPowerLogNRSCGRel:v151];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARxDiversitysCount])
  {
    [v384 clearCellularPowerLogWCDMARxDiversitys];
    unint64_t v152 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARxDiversitysCount];
    if (v152)
    {
      unint64_t v153 = v152;
      for (uint64_t i28 = 0; i28 != v153; ++i28)
      {
        uint64_t v155 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARxDiversityAtIndex:i28];
        [v384 addCellularPowerLogWCDMARxDiversity:v155];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARABModesCount])
  {
    [v384 clearCellularPowerLogWCDMARABModes];
    unint64_t v156 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARABModesCount];
    if (v156)
    {
      unint64_t v157 = v156;
      for (uint64_t i29 = 0; i29 != v157; ++i29)
      {
        uint64_t v159 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARABModeAtIndex:i29];
        [v384 addCellularPowerLogWCDMARABMode:v159];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARABTypesCount])
  {
    [v384 clearCellularPowerLogWCDMARABTypes];
    unint64_t v160 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARABTypesCount];
    if (v160)
    {
      unint64_t v161 = v160;
      for (uint64_t i30 = 0; i30 != v161; ++i30)
      {
        uint64_t v163 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARABTypeAtIndex:i30];
        [v384 addCellularPowerLogWCDMARABType:v163];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogEVDOTxPowersCount])
  {
    [v384 clearCellularPowerLogEVDOTxPowers];
    unint64_t v164 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogEVDOTxPowersCount];
    if (v164)
    {
      unint64_t v165 = v164;
      for (uint64_t i31 = 0; i31 != v165; ++i31)
      {
        uint64_t v167 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogEVDOTxPowerAtIndex:i31];
        [v384 addCellularPowerLogEVDOTxPower:v167];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogEVDORxRSSIsCount])
  {
    [v384 clearCellularPowerLogEVDORxRSSIs];
    unint64_t v168 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogEVDORxRSSIsCount];
    if (v168)
    {
      unint64_t v169 = v168;
      for (uint64_t i32 = 0; i32 != v169; ++i32)
      {
        uint64_t v171 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogEVDORxRSSIAtIndex:i32];
        [v384 addCellularPowerLogEVDORxRSSI:v171];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogHybridRABModesCount])
  {
    [v384 clearCellularPowerLogHybridRABModes];
    unint64_t v172 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogHybridRABModesCount];
    if (v172)
    {
      unint64_t v173 = v172;
      for (uint64_t i33 = 0; i33 != v173; ++i33)
      {
        uint64_t v175 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogHybridRABModeAtIndex:i33];
        [v384 addCellularPowerLogHybridRABMode:v175];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogEVDORxDiversitysCount])
  {
    [v384 clearCellularPowerLogEVDORxDiversitys];
    unint64_t v176 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogEVDORxDiversitysCount];
    if (v176)
    {
      unint64_t v177 = v176;
      for (uint64_t i34 = 0; i34 != v177; ++i34)
      {
        uint64_t v179 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogEVDORxDiversityAtIndex:i34];
        [v384 addCellularPowerLogEVDORxDiversity:v179];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XTxPowersCount])
  {
    [v384 clearCellularPowerLogCDMA1XTxPowers];
    unint64_t v180 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XTxPowersCount];
    if (v180)
    {
      unint64_t v181 = v180;
      for (uint64_t i35 = 0; i35 != v181; ++i35)
      {
        uint64_t v183 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XTxPowerAtIndex:i35];
        [v384 addCellularPowerLogCDMA1XTxPower:v183];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRxRSSIsCount])
  {
    [v384 clearCellularPowerLogCDMA1XRxRSSIs];
    unint64_t v184 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRxRSSIsCount];
    if (v184)
    {
      unint64_t v185 = v184;
      for (uint64_t i36 = 0; i36 != v185; ++i36)
      {
        uint64_t v187 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRxRSSIAtIndex:i36];
        [v384 addCellularPowerLogCDMA1XRxRSSI:v187];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRABModesCount])
  {
    [v384 clearCellularPowerLogCDMA1XRABModes];
    unint64_t v188 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRABModesCount];
    if (v188)
    {
      unint64_t v189 = v188;
      for (uint64_t i37 = 0; i37 != v189; ++i37)
      {
        uint64_t v191 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRABModeAtIndex:i37];
        [v384 addCellularPowerLogCDMA1XRABMode:v191];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRxDiversitysCount])
  {
    [v384 clearCellularPowerLogCDMA1XRxDiversitys];
    unint64_t v192 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRxDiversitysCount];
    if (v192)
    {
      unint64_t v193 = v192;
      for (uint64_t i38 = 0; i38 != v193; ++i38)
      {
        uint64_t v195 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRxDiversityAtIndex:i38];
        [v384 addCellularPowerLogCDMA1XRxDiversity:v195];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMACDRXConfigsCount])
  {
    [v384 clearCellularPowerLogWCDMACDRXConfigs];
    unint64_t v196 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMACDRXConfigsCount];
    if (v196)
    {
      unint64_t v197 = v196;
      for (uint64_t i39 = 0; i39 != v197; ++i39)
      {
        uint64_t v199 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMACDRXConfigAtIndex:i39];
        [v384 addCellularPowerLogWCDMACDRXConfig:v199];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTECDRXConfigsCount])
  {
    [v384 clearCellularPowerLogLTECDRXConfigs];
    unint64_t v200 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTECDRXConfigsCount];
    if (v200)
    {
      unint64_t v201 = v200;
      for (uint64_t i40 = 0; i40 != v201; ++i40)
      {
        uint64_t v203 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTECDRXConfigAtIndex:i40];
        [v384 addCellularPowerLogLTECDRXConfig:v203];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARRCStateChangesCount])
  {
    [v384 clearCellularPowerLogWCDMARRCStateChanges];
    unint64_t v204 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARRCStateChangesCount];
    if (v204)
    {
      unint64_t v205 = v204;
      for (uint64_t i41 = 0; i41 != v205; ++i41)
      {
        uint64_t v207 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWCDMARRCStateChangeAtIndex:i41];
        [v384 addCellularPowerLogWCDMARRCStateChange:v207];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERRCStateChangesCount])
  {
    [v384 clearCellularPowerLogLTERRCStateChanges];
    unint64_t v208 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERRCStateChangesCount];
    if (v208)
    {
      unint64_t v209 = v208;
      for (uint64_t i42 = 0; i42 != v209; ++i42)
      {
        uint64_t v211 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogLTERRCStateChangeAtIndex:i42];
        [v384 addCellularPowerLogLTERRCStateChange:v211];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogSystemEventsCount])
  {
    [v384 clearCellularPowerLogSystemEvents];
    unint64_t v212 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogSystemEventsCount];
    if (v212)
    {
      unint64_t v213 = v212;
      for (uint64_t i43 = 0; i43 != v213; ++i43)
      {
        v215 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogSystemEventAtIndex:i43];
        [v384 addCellularPowerLogSystemEvent:v215];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogRATReselectionEventsCount])
  {
    [v384 clearCellularPowerLogRATReselectionEvents];
    unint64_t v216 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogRATReselectionEventsCount];
    if (v216)
    {
      unint64_t v217 = v216;
      for (uint64_t i44 = 0; i44 != v217; ++i44)
      {
        uint64_t v219 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogRATReselectionEventAtIndex:i44];
        [v384 addCellularPowerLogRATReselectionEvent:v219];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogRATRedirectionEventsCount])
  {
    [v384 clearCellularPowerLogRATRedirectionEvents];
    unint64_t v220 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogRATRedirectionEventsCount];
    if (v220)
    {
      unint64_t v221 = v220;
      for (uint64_t i45 = 0; i45 != v221; ++i45)
      {
        uint64_t v223 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogRATRedirectionEventAtIndex:i45];
        [v384 addCellularPowerLogRATRedirectionEvent:v223];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRRCStateChangesCount])
  {
    [v384 clearCellularPowerLogGSMRRCStateChanges];
    unint64_t v224 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRRCStateChangesCount];
    if (v224)
    {
      unint64_t v225 = v224;
      for (uint64_t i46 = 0; i46 != v225; ++i46)
      {
        uint64_t v227 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogGSMRRCStateChangeAtIndex:i46];
        [v384 addCellularPowerLogGSMRRCStateChange:v227];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRRCStateChangesCount])
  {
    [v384 clearCellularPowerLogCDMA1XRRCStateChanges];
    unint64_t v228 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRRCStateChangesCount];
    if (v228)
    {
      unint64_t v229 = v228;
      for (uint64_t i47 = 0; i47 != v229; ++i47)
      {
        uint64_t v231 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogCDMA1XRRCStateChangeAtIndex:i47];
        [v384 addCellularPowerLogCDMA1XRRCStateChange:v231];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogHybridRRCStateChangesCount])
  {
    [v384 clearCellularPowerLogHybridRRCStateChanges];
    unint64_t v232 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogHybridRRCStateChangesCount];
    if (v232)
    {
      unint64_t v233 = v232;
      for (uint64_t i48 = 0; i48 != v233; ++i48)
      {
        v235 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogHybridRRCStateChangeAtIndex:i48];
        [v384 addCellularPowerLogHybridRRCStateChange:v235];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogServiceStateEventsCount])
  {
    [v384 clearCellularPowerLogServiceStateEvents];
    unint64_t v236 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogServiceStateEventsCount];
    if (v236)
    {
      unint64_t v237 = v236;
      for (uint64_t i49 = 0; i49 != v237; ++i49)
      {
        uint64_t v239 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogServiceStateEventAtIndex:i49];
        [v384 addCellularPowerLogServiceStateEvent:v239];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogPLMNScanEventsCount])
  {
    [v384 clearCellularPowerLogPLMNScanEvents];
    unint64_t v240 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPLMNScanEventsCount];
    if (v240)
    {
      unint64_t v241 = v240;
      for (uint64_t i50 = 0; i50 != v241; ++i50)
      {
        uint64_t v243 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPLMNScanEventAtIndex:i50];
        [v384 addCellularPowerLogPLMNScanEvent:v243];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogPLMNSearchEventsCount])
  {
    [v384 clearCellularPowerLogPLMNSearchEvents];
    unint64_t v244 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPLMNSearchEventsCount];
    if (v244)
    {
      unint64_t v245 = v244;
      for (uint64_t i51 = 0; i51 != v245; ++i51)
      {
        uint64_t v247 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogPLMNSearchEventAtIndex:i51];
        [v384 addCellularPowerLogPLMNSearchEvent:v247];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRSARRCStateChangesCount])
  {
    [v384 clearCellularPowerLogNRSARRCStateChanges];
    unint64_t v248 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRSARRCStateChangesCount];
    if (v248)
    {
      unint64_t v249 = v248;
      for (uint64_t i52 = 0; i52 != v249; ++i52)
      {
        uint64_t v251 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRSARRCStateChangeAtIndex:i52];
        [v384 addCellularPowerLogNRSARRCStateChange:v251];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRNSAENDCEventsCount])
  {
    [v384 clearCellularPowerLogNRNSAENDCEvents];
    unint64_t v252 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRNSAENDCEventsCount];
    if (v252)
    {
      unint64_t v253 = v252;
      for (uint64_t i53 = 0; i53 != v253; ++i53)
      {
        v255 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRNSAENDCEventAtIndex:i53];
        [v384 addCellularPowerLogNRNSAENDCEvent:v255];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRCDRXConfigsCount])
  {
    [v384 clearCellularPowerLogNRCDRXConfigs];
    unint64_t v256 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRCDRXConfigsCount];
    if (v256)
    {
      unint64_t v257 = v256;
      for (uint64_t i54 = 0; i54 != v257; ++i54)
      {
        uint64_t v259 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRCDRXConfigAtIndex:i54];
        [v384 addCellularPowerLogNRCDRXConfig:v259];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6BWPsCount])
  {
    [v384 clearCellularPowerLogNRsub6BWPs];
    unint64_t v260 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6BWPsCount];
    if (v260)
    {
      unint64_t v261 = v260;
      for (uint64_t i55 = 0; i55 != v261; ++i55)
      {
        uint64_t v263 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6BWPAtIndex:i55];
        [v384 addCellularPowerLogNRsub6BWP:v263];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogRFTunerStatsHistsCount])
  {
    [v384 clearCellularPowerLogRFTunerStatsHists];
    unint64_t v264 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogRFTunerStatsHistsCount];
    if (v264)
    {
      unint64_t v265 = v264;
      for (uint64_t i56 = 0; i56 != v265; ++i56)
      {
        uint64_t v267 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogRFTunerStatsHistAtIndex:i56];
        [v384 addCellularPowerLogRFTunerStatsHist:v267];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6CASCCConfiguredsCount])
  {
    [v384 clearCellularPowerLogNRsub6CASCCConfigureds];
    unint64_t v268 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6CASCCConfiguredsCount];
    if (v268)
    {
      unint64_t v269 = v268;
      for (uint64_t i57 = 0; i57 != v269; ++i57)
      {
        uint64_t v271 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6CASCCConfiguredAtIndex:i57];
        [v384 addCellularPowerLogNRsub6CASCCConfigured:v271];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6CASCCActivatedsCount])
  {
    [v384 clearCellularPowerLogNRsub6CASCCActivateds];
    unint64_t v272 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6CASCCActivatedsCount];
    if (v272)
    {
      unint64_t v273 = v272;
      for (uint64_t i58 = 0; i58 != v273; ++i58)
      {
        uint64_t v275 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6CASCCActivatedAtIndex:i58];
        [v384 addCellularPowerLogNRsub6CASCCActivated:v275];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6RxTxsCount])
  {
    [v384 clearCellularPowerLogNRsub6RxTxs];
    unint64_t v276 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6RxTxsCount];
    if (v276)
    {
      unint64_t v277 = v276;
      for (uint64_t i59 = 0; i59 != v277; ++i59)
      {
        uint64_t v279 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6RxTxAtIndex:i59];
        [v384 addCellularPowerLogNRsub6RxTx:v279];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6CarrierComponentInfosCount])
  {
    [v384 clearCellularPowerLogNRsub6CarrierComponentInfos];
    unint64_t v280 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6CarrierComponentInfosCount];
    if (v280)
    {
      unint64_t v281 = v280;
      for (uint64_t i60 = 0; i60 != v281; ++i60)
      {
        uint64_t v283 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6CarrierComponentInfoAtIndex:i60];
        [v384 addCellularPowerLogNRsub6CarrierComponentInfo:v283];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6DLTBSsCount])
  {
    [v384 clearCellularPowerLogNRsub6DLTBSs];
    unint64_t v284 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6DLTBSsCount];
    if (v284)
    {
      unint64_t v285 = v284;
      for (uint64_t i61 = 0; i61 != v285; ++i61)
      {
        uint64_t v287 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6DLTBSAtIndex:i61];
        [v384 addCellularPowerLogNRsub6DLTBS:v287];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6RSRPsCount])
  {
    [v384 clearCellularPowerLogNRsub6RSRPs];
    unint64_t v288 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6RSRPsCount];
    if (v288)
    {
      unint64_t v289 = v288;
      for (uint64_t i62 = 0; i62 != v289; ++i62)
      {
        uint64_t v291 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6RSRPAtIndex:i62];
        [v384 addCellularPowerLogNRsub6RSRP:v291];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6ULCAStatesCount])
  {
    [v384 clearCellularPowerLogNRsub6ULCAStates];
    unint64_t v292 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6ULCAStatesCount];
    if (v292)
    {
      unint64_t v293 = v292;
      for (uint64_t i63 = 0; i63 != v293; ++i63)
      {
        uint64_t v295 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6ULCAStateAtIndex:i63];
        [v384 addCellularPowerLogNRsub6ULCAState:v295];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6TxPowersCount])
  {
    [v384 clearCellularPowerLogNRsub6TxPowers];
    unint64_t v296 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6TxPowersCount];
    if (v296)
    {
      unint64_t v297 = v296;
      for (uint64_t i64 = 0; i64 != v297; ++i64)
      {
        uint64_t v299 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6TxPowerAtIndex:i64];
        [v384 addCellularPowerLogNRsub6TxPower:v299];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6RxDiversitysCount])
  {
    [v384 clearCellularPowerLogNRsub6RxDiversitys];
    unint64_t v300 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6RxDiversitysCount];
    if (v300)
    {
      unint64_t v301 = v300;
      for (uint64_t i65 = 0; i65 != v301; ++i65)
      {
        uint64_t v303 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6RxDiversityAtIndex:i65];
        [v384 addCellularPowerLogNRsub6RxDiversity:v303];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogSPMIsCount])
  {
    [v384 clearCellularPowerLogSPMIs];
    unint64_t v304 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogSPMIsCount];
    if (v304)
    {
      unint64_t v305 = v304;
      for (uint64_t i66 = 0; i66 != v305; ++i66)
      {
        uint64_t v307 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogSPMIAtIndex:i66];
        [v384 addCellularPowerLogSPMI:v307];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveBWPsCount])
  {
    [v384 clearCellularPowerLogNRmmWaveBWPs];
    unint64_t v308 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveBWPsCount];
    if (v308)
    {
      unint64_t v309 = v308;
      for (uint64_t i67 = 0; i67 != v309; ++i67)
      {
        uint64_t v311 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveBWPAtIndex:i67];
        [v384 addCellularPowerLogNRmmWaveBWP:v311];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveAntennaPanelsCount])
  {
    [v384 clearCellularPowerLogNRmmWaveAntennaPanels];
    unint64_t v312 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveAntennaPanelsCount];
    if (v312)
    {
      unint64_t v313 = v312;
      for (uint64_t i68 = 0; i68 != v313; ++i68)
      {
        uint64_t v315 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveAntennaPanelAtIndex:i68];
        [v384 addCellularPowerLogNRmmWaveAntennaPanel:v315];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRFRCoveragesCount])
  {
    [v384 clearCellularPowerLogNRFRCoverages];
    unint64_t v316 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRFRCoveragesCount];
    if (v316)
    {
      unint64_t v317 = v316;
      for (uint64_t i69 = 0; i69 != v317; ++i69)
      {
        uint64_t v319 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRFRCoverageAtIndex:i69];
        [v384 addCellularPowerLogNRFRCoverage:v319];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveBeamIDsCount])
  {
    [v384 clearCellularPowerLogNRmmWaveBeamIDs];
    unint64_t v320 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveBeamIDsCount];
    if (v320)
    {
      unint64_t v321 = v320;
      for (uint64_t i70 = 0; i70 != v321; ++i70)
      {
        uint64_t v323 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveBeamIDAtIndex:i70];
        [v384 addCellularPowerLogNRmmWaveBeamID:v323];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogSFTStatesCount])
  {
    [v384 clearCellularPowerLogSFTStates];
    unint64_t v324 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogSFTStatesCount];
    if (v324)
    {
      unint64_t v325 = v324;
      for (uint64_t i71 = 0; i71 != v325; ++i71)
      {
        uint64_t v327 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogSFTStateAtIndex:i71];
        [v384 addCellularPowerLogSFTState:v327];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveCASCCConfiguredsCount])
  {
    [v384 clearCellularPowerLogNRmmWaveCASCCConfigureds];
    unint64_t v328 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveCASCCConfiguredsCount];
    if (v328)
    {
      unint64_t v329 = v328;
      for (uint64_t i72 = 0; i72 != v329; ++i72)
      {
        uint64_t v331 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveCASCCConfiguredAtIndex:i72];
        [v384 addCellularPowerLogNRmmWaveCASCCConfigured:v331];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveCASCCActivatedsCount])
  {
    [v384 clearCellularPowerLogNRmmWaveCASCCActivateds];
    unint64_t v332 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveCASCCActivatedsCount];
    if (v332)
    {
      unint64_t v333 = v332;
      for (uint64_t i73 = 0; i73 != v333; ++i73)
      {
        uint64_t v335 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveCASCCActivatedAtIndex:i73];
        [v384 addCellularPowerLogNRmmWaveCASCCActivated:v335];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveRxTxsCount])
  {
    [v384 clearCellularPowerLogNRmmWaveRxTxs];
    unint64_t v336 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveRxTxsCount];
    if (v336)
    {
      unint64_t v337 = v336;
      for (uint64_t i74 = 0; i74 != v337; ++i74)
      {
        uint64_t v339 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveRxTxAtIndex:i74];
        [v384 addCellularPowerLogNRmmWaveRxTx:v339];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveCarrierComponentInfosCount])
  {
    [v384 clearCellularPowerLogNRmmWaveCarrierComponentInfos];
    unint64_t v340 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveCarrierComponentInfosCount];
    if (v340)
    {
      unint64_t v341 = v340;
      for (uint64_t i75 = 0; i75 != v341; ++i75)
      {
        uint64_t v343 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveCarrierComponentInfoAtIndex:i75];
        [v384 addCellularPowerLogNRmmWaveCarrierComponentInfo:v343];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveDLTBSsCount])
  {
    [v384 clearCellularPowerLogNRmmWaveDLTBSs];
    unint64_t v344 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveDLTBSsCount];
    if (v344)
    {
      unint64_t v345 = v344;
      for (uint64_t i76 = 0; i76 != v345; ++i76)
      {
        uint64_t v347 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveDLTBSAtIndex:i76];
        [v384 addCellularPowerLogNRmmWaveDLTBS:v347];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRMmWaveRSRPsCount])
  {
    [v384 clearCellularPowerLogNRMmWaveRSRPs];
    unint64_t v348 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRMmWaveRSRPsCount];
    if (v348)
    {
      unint64_t v349 = v348;
      for (uint64_t i77 = 0; i77 != v349; ++i77)
      {
        uint64_t v351 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRMmWaveRSRPAtIndex:i77];
        [v384 addCellularPowerLogNRMmWaveRSRP:v351];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogSFTRxTxsCount])
  {
    [v384 clearCellularPowerLogSFTRxTxs];
    unint64_t v352 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogSFTRxTxsCount];
    if (v352)
    {
      unint64_t v353 = v352;
      for (uint64_t i78 = 0; i78 != v353; ++i78)
      {
        v355 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogSFTRxTxAtIndex:i78];
        [v384 addCellularPowerLogSFTRxTx:v355];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRMmWaveTxPowersCount])
  {
    [v384 clearCellularPowerLogNRMmWaveTxPowers];
    unint64_t v356 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRMmWaveTxPowersCount];
    if (v356)
    {
      unint64_t v357 = v356;
      for (uint64_t i79 = 0; i79 != v357; ++i79)
      {
        uint64_t v359 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRMmWaveTxPowerAtIndex:i79];
        [v384 addCellularPowerLogNRMmWaveTxPower:v359];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRMmWaveULCAStatesCount])
  {
    [v384 clearCellularPowerLogNRMmWaveULCAStates];
    unint64_t v360 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRMmWaveULCAStatesCount];
    if (v360)
    {
      unint64_t v361 = v360;
      for (uint64_t i80 = 0; i80 != v361; ++i80)
      {
        uint64_t v363 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRMmWaveULCAStateAtIndex:i80];
        [v384 addCellularPowerLogNRMmWaveULCAState:v363];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6BWPSCCsCount])
  {
    [v384 clearCellularPowerLogNRsub6BWPSCCs];
    unint64_t v364 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6BWPSCCsCount];
    if (v364)
    {
      unint64_t v365 = v364;
      for (uint64_t i81 = 0; i81 != v365; ++i81)
      {
        uint64_t v367 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6BWPSCCAtIndex:i81];
        [v384 addCellularPowerLogNRsub6BWPSCC:v367];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveBWPSCCsCount])
  {
    [v384 clearCellularPowerLogNRmmWaveBWPSCCs];
    unint64_t v368 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveBWPSCCsCount];
    if (v368)
    {
      unint64_t v369 = v368;
      for (uint64_t i82 = 0; i82 != v369; ++i82)
      {
        uint64_t v371 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRmmWaveBWPSCCAtIndex:i82];
        [v384 addCellularPowerLogNRmmWaveBWPSCC:v371];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRDCEventsCount])
  {
    [v384 clearCellularPowerLogNRDCEvents];
    unint64_t v372 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRDCEventsCount];
    if (v372)
    {
      unint64_t v373 = v372;
      for (uint64_t i83 = 0; i83 != v373; ++i83)
      {
        v375 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRDCEventAtIndex:i83];
        [v384 addCellularPowerLogNRDCEvent:v375];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogWUSsCount])
  {
    [v384 clearCellularPowerLogWUSs];
    unint64_t v376 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWUSsCount];
    if (v376)
    {
      unint64_t v377 = v376;
      for (uint64_t i84 = 0; i84 != v377; ++i84)
      {
        uint64_t v379 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogWUSAtIndex:i84];
        [v384 addCellularPowerLogWUS:v379];
      }
    }
  }
  if ([(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6BWPSAsCount])
  {
    [v384 clearCellularPowerLogNRsub6BWPSAs];
    unint64_t v380 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6BWPSAsCount];
    if (v380)
    {
      unint64_t v381 = v380;
      for (uint64_t i85 = 0; i85 != v381; ++i85)
      {
        uint64_t v383 = [(AWDMETRICSCellularPowerLog *)self cellularPowerLogNRsub6BWPSAAtIndex:i85];
        [v384 addCellularPowerLogNRsub6BWPSA:v383];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v1053 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v954 = 0u;
  long long v955 = 0u;
  long long v956 = 0u;
  long long v957 = 0u;
  uint64_t v6 = self->_cellularPerClientProfileTriggerCounts;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v954 objects:v1052 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v955;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v955 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = (void *)[*(id *)(*((void *)&v954 + 1) + 8 * v10) copyWithZone:a3];
        [v5 addCellularPerClientProfileTriggerCount:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v954 objects:v1052 count:16];
    }
    while (v8);
  }

  long long v953 = 0u;
  long long v952 = 0u;
  long long v951 = 0u;
  long long v950 = 0u;
  unint64_t v12 = self->_cellularNrSDMActivations;
  uint64_t v13 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v950 objects:v1051 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v951;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v951 != v15) {
          objc_enumerationMutation(v12);
        }
        unint64_t v17 = (void *)[*(id *)(*((void *)&v950 + 1) + 8 * v16) copyWithZone:a3];
        [v5 addCellularNrSDMActivation:v17];

        ++v16;
      }
      while (v14 != v16);
      uint64_t v14 = [(NSMutableArray *)v12 countByEnumeratingWithState:&v950 objects:v1051 count:16];
    }
    while (v14);
  }

  long long v949 = 0u;
  long long v948 = 0u;
  long long v947 = 0u;
  long long v946 = 0u;
  uint64_t v18 = self->_cellularNrSdmEndcReleases;
  uint64_t v19 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v946 objects:v1050 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v947;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v947 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = (void *)[*(id *)(*((void *)&v946 + 1) + 8 * v22) copyWithZone:a3];
        [v5 addCellularNrSdmEndcRelease:v23];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(NSMutableArray *)v18 countByEnumeratingWithState:&v946 objects:v1050 count:16];
    }
    while (v20);
  }

  long long v945 = 0u;
  long long v944 = 0u;
  long long v943 = 0u;
  long long v942 = 0u;
  unint64_t v24 = self->_cellularDynamicRatSelections;
  uint64_t v25 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v942 objects:v1049 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v943;
    do
    {
      uint64_t v28 = 0;
      do
      {
        if (*(void *)v943 != v27) {
          objc_enumerationMutation(v24);
        }
        unint64_t v29 = (void *)[*(id *)(*((void *)&v942 + 1) + 8 * v28) copyWithZone:a3];
        [v5 addCellularDynamicRatSelection:v29];

        ++v28;
      }
      while (v26 != v28);
      uint64_t v26 = [(NSMutableArray *)v24 countByEnumeratingWithState:&v942 objects:v1049 count:16];
    }
    while (v26);
  }

  long long v941 = 0u;
  long long v940 = 0u;
  long long v939 = 0u;
  long long v938 = 0u;
  uint64_t v30 = self->_cellularPowerLogXOShutdowns;
  uint64_t v31 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v938 objects:v1048 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v939;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v939 != v33) {
          objc_enumerationMutation(v30);
        }
        uint64_t v35 = (void *)[*(id *)(*((void *)&v938 + 1) + 8 * v34) copyWithZone:a3];
        [v5 addCellularPowerLogXOShutdown:v35];

        ++v34;
      }
      while (v32 != v34);
      uint64_t v32 = [(NSMutableArray *)v30 countByEnumeratingWithState:&v938 objects:v1048 count:16];
    }
    while (v32);
  }

  long long v937 = 0u;
  long long v936 = 0u;
  long long v935 = 0u;
  long long v934 = 0u;
  unint64_t v36 = self->_cellularPowerLogAPPSPerfLevels;
  uint64_t v37 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v934 objects:v1047 count:16];
  if (v37)
  {
    uint64_t v38 = v37;
    uint64_t v39 = *(void *)v935;
    do
    {
      uint64_t v40 = 0;
      do
      {
        if (*(void *)v935 != v39) {
          objc_enumerationMutation(v36);
        }
        unint64_t v41 = (void *)[*(id *)(*((void *)&v934 + 1) + 8 * v40) copyWithZone:a3];
        [v5 addCellularPowerLogAPPSPerfLevels:v41];

        ++v40;
      }
      while (v38 != v40);
      uint64_t v38 = [(NSMutableArray *)v36 countByEnumeratingWithState:&v934 objects:v1047 count:16];
    }
    while (v38);
  }

  long long v933 = 0u;
  long long v932 = 0u;
  long long v931 = 0u;
  long long v930 = 0u;
  uint64_t v42 = self->_cellularPowerLogAPPSCXOShutdowns;
  uint64_t v43 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v930 objects:v1046 count:16];
  if (v43)
  {
    uint64_t v44 = v43;
    uint64_t v45 = *(void *)v931;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v931 != v45) {
          objc_enumerationMutation(v42);
        }
        uint64_t v47 = (void *)[*(id *)(*((void *)&v930 + 1) + 8 * v46) copyWithZone:a3];
        [v5 addCellularPowerLogAPPSCXOShutdown:v47];

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = [(NSMutableArray *)v42 countByEnumeratingWithState:&v930 objects:v1046 count:16];
    }
    while (v44);
  }

  long long v929 = 0u;
  long long v928 = 0u;
  long long v927 = 0u;
  long long v926 = 0u;
  unint64_t v48 = self->_cellularPowerLogAPPSSleepVetos;
  uint64_t v49 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v926 objects:v1045 count:16];
  if (v49)
  {
    uint64_t v50 = v49;
    uint64_t v51 = *(void *)v927;
    do
    {
      uint64_t v52 = 0;
      do
      {
        if (*(void *)v927 != v51) {
          objc_enumerationMutation(v48);
        }
        unint64_t v53 = (void *)[*(id *)(*((void *)&v926 + 1) + 8 * v52) copyWithZone:a3];
        [v5 addCellularPowerLogAPPSSleepVeto:v53];

        ++v52;
      }
      while (v50 != v52);
      uint64_t v50 = [(NSMutableArray *)v48 countByEnumeratingWithState:&v926 objects:v1045 count:16];
    }
    while (v50);
  }

  long long v925 = 0u;
  long long v924 = 0u;
  long long v923 = 0u;
  long long v922 = 0u;
  uint64_t v54 = self->_cellularPowerLogMCPMSleepVetos;
  uint64_t v55 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v922 objects:v1044 count:16];
  if (v55)
  {
    uint64_t v56 = v55;
    uint64_t v57 = *(void *)v923;
    do
    {
      uint64_t v58 = 0;
      do
      {
        if (*(void *)v923 != v57) {
          objc_enumerationMutation(v54);
        }
        uint64_t v59 = (void *)[*(id *)(*((void *)&v922 + 1) + 8 * v58) copyWithZone:a3];
        [v5 addCellularPowerLogMCPMSleepVeto:v59];

        ++v58;
      }
      while (v56 != v58);
      uint64_t v56 = [(NSMutableArray *)v54 countByEnumeratingWithState:&v922 objects:v1044 count:16];
    }
    while (v56);
  }

  long long v921 = 0u;
  long long v920 = 0u;
  long long v919 = 0u;
  long long v918 = 0u;
  unint64_t v60 = self->_cellularPowerLogMPSSPerfLevels;
  uint64_t v61 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v918 objects:v1043 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v919;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v919 != v63) {
          objc_enumerationMutation(v60);
        }
        unint64_t v65 = (void *)[*(id *)(*((void *)&v918 + 1) + 8 * v64) copyWithZone:a3];
        [v5 addCellularPowerLogMPSSPerfLevels:v65];

        ++v64;
      }
      while (v62 != v64);
      uint64_t v62 = [(NSMutableArray *)v60 countByEnumeratingWithState:&v918 objects:v1043 count:16];
    }
    while (v62);
  }

  long long v917 = 0u;
  long long v916 = 0u;
  long long v915 = 0u;
  long long v914 = 0u;
  uint64_t v66 = self->_cellularPowerLogGPSStates;
  uint64_t v67 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v914 objects:v1042 count:16];
  if (v67)
  {
    uint64_t v68 = v67;
    uint64_t v69 = *(void *)v915;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v915 != v69) {
          objc_enumerationMutation(v66);
        }
        uint64_t v71 = (void *)[*(id *)(*((void *)&v914 + 1) + 8 * v70) copyWithZone:a3];
        [v5 addCellularPowerLogGPSStates:v71];

        ++v70;
      }
      while (v68 != v70);
      uint64_t v68 = [(NSMutableArray *)v66 countByEnumeratingWithState:&v914 objects:v1042 count:16];
    }
    while (v68);
  }

  long long v913 = 0u;
  long long v912 = 0u;
  long long v911 = 0u;
  long long v910 = 0u;
  unint64_t v72 = self->_cellularPowerLogAOPUARTStates;
  uint64_t v73 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v910 objects:v1041 count:16];
  if (v73)
  {
    uint64_t v74 = v73;
    uint64_t v75 = *(void *)v911;
    do
    {
      uint64_t v76 = 0;
      do
      {
        if (*(void *)v911 != v75) {
          objc_enumerationMutation(v72);
        }
        unint64_t v77 = (void *)[*(id *)(*((void *)&v910 + 1) + 8 * v76) copyWithZone:a3];
        [v5 addCellularPowerLogAOPUARTStates:v77];

        ++v76;
      }
      while (v74 != v76);
      uint64_t v74 = [(NSMutableArray *)v72 countByEnumeratingWithState:&v910 objects:v1041 count:16];
    }
    while (v74);
  }

  long long v909 = 0u;
  long long v908 = 0u;
  long long v907 = 0u;
  long long v906 = 0u;
  uint64_t v78 = self->_cellularPowerLogWLANUARTStates;
  uint64_t v79 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v906 objects:v1040 count:16];
  if (v79)
  {
    uint64_t v80 = v79;
    uint64_t v81 = *(void *)v907;
    do
    {
      uint64_t v82 = 0;
      do
      {
        if (*(void *)v907 != v81) {
          objc_enumerationMutation(v78);
        }
        uint64_t v83 = (void *)[*(id *)(*((void *)&v906 + 1) + 8 * v82) copyWithZone:a3];
        [v5 addCellularPowerLogWLANUARTStates:v83];

        ++v82;
      }
      while (v80 != v82);
      uint64_t v80 = [(NSMutableArray *)v78 countByEnumeratingWithState:&v906 objects:v1040 count:16];
    }
    while (v80);
  }

  long long v905 = 0u;
  long long v904 = 0u;
  long long v903 = 0u;
  long long v902 = 0u;
  unint64_t v84 = self->_cellularPowerLogPCIeStates;
  uint64_t v85 = [(NSMutableArray *)v84 countByEnumeratingWithState:&v902 objects:v1039 count:16];
  if (v85)
  {
    uint64_t v86 = v85;
    uint64_t v87 = *(void *)v903;
    do
    {
      uint64_t v88 = 0;
      do
      {
        if (*(void *)v903 != v87) {
          objc_enumerationMutation(v84);
        }
        unint64_t v89 = (void *)[*(id *)(*((void *)&v902 + 1) + 8 * v88) copyWithZone:a3];
        [v5 addCellularPowerLogPCIeStates:v89];

        ++v88;
      }
      while (v86 != v88);
      uint64_t v86 = [(NSMutableArray *)v84 countByEnumeratingWithState:&v902 objects:v1039 count:16];
    }
    while (v86);
  }

  long long v901 = 0u;
  long long v900 = 0u;
  long long v899 = 0u;
  long long v898 = 0u;
  uint64_t v90 = self->_cellularPowerLogL1SleepStates;
  uint64_t v91 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v898 objects:v1038 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v899;
    do
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v899 != v93) {
          objc_enumerationMutation(v90);
        }
        v95 = (void *)[*(id *)(*((void *)&v898 + 1) + 8 * v94) copyWithZone:a3];
        [v5 addCellularPowerLogL1SleepStates:v95];

        ++v94;
      }
      while (v92 != v94);
      uint64_t v92 = [(NSMutableArray *)v90 countByEnumeratingWithState:&v898 objects:v1038 count:16];
    }
    while (v92);
  }

  long long v897 = 0u;
  long long v896 = 0u;
  long long v895 = 0u;
  long long v894 = 0u;
  unint64_t v96 = self->_cellularPowerLogLTEConfiguredCASCCStates;
  uint64_t v97 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v894 objects:v1037 count:16];
  if (v97)
  {
    uint64_t v98 = v97;
    uint64_t v99 = *(void *)v895;
    do
    {
      uint64_t v100 = 0;
      do
      {
        if (*(void *)v895 != v99) {
          objc_enumerationMutation(v96);
        }
        unint64_t v101 = (void *)[*(id *)(*((void *)&v894 + 1) + 8 * v100) copyWithZone:a3];
        [v5 addCellularPowerLogLTEConfiguredCASCCStates:v101];

        ++v100;
      }
      while (v98 != v100);
      uint64_t v98 = [(NSMutableArray *)v96 countByEnumeratingWithState:&v894 objects:v1037 count:16];
    }
    while (v98);
  }

  long long v893 = 0u;
  long long v892 = 0u;
  long long v891 = 0u;
  long long v890 = 0u;
  uint64_t v102 = self->_cellularPowerLogLTEActivatedCASCCStates;
  uint64_t v103 = [(NSMutableArray *)v102 countByEnumeratingWithState:&v890 objects:v1036 count:16];
  if (v103)
  {
    uint64_t v104 = v103;
    uint64_t v105 = *(void *)v891;
    do
    {
      uint64_t v106 = 0;
      do
      {
        if (*(void *)v891 != v105) {
          objc_enumerationMutation(v102);
        }
        uint64_t v107 = (void *)[*(id *)(*((void *)&v890 + 1) + 8 * v106) copyWithZone:a3];
        [v5 addCellularPowerLogLTEActivatedCASCCStates:v107];

        ++v106;
      }
      while (v104 != v106);
      uint64_t v104 = [(NSMutableArray *)v102 countByEnumeratingWithState:&v890 objects:v1036 count:16];
    }
    while (v104);
  }

  long long v889 = 0u;
  long long v888 = 0u;
  long long v887 = 0u;
  long long v886 = 0u;
  unint64_t v108 = self->_cellularPowerLogLTERxTxActivityStates;
  uint64_t v109 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v886 objects:v1035 count:16];
  if (v109)
  {
    uint64_t v110 = v109;
    uint64_t v111 = *(void *)v887;
    do
    {
      uint64_t v112 = 0;
      do
      {
        if (*(void *)v887 != v111) {
          objc_enumerationMutation(v108);
        }
        unint64_t v113 = (void *)[*(id *)(*((void *)&v886 + 1) + 8 * v112) copyWithZone:a3];
        [v5 addCellularPowerLogLTERxTxActivityStates:v113];

        ++v112;
      }
      while (v110 != v112);
      uint64_t v110 = [(NSMutableArray *)v108 countByEnumeratingWithState:&v886 objects:v1035 count:16];
    }
    while (v110);
  }

  long long v885 = 0u;
  long long v884 = 0u;
  long long v883 = 0u;
  long long v882 = 0u;
  uint64_t v114 = self->_cellularPowerLogLTECarrierComponentInfos;
  uint64_t v115 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v882 objects:v1034 count:16];
  if (v115)
  {
    uint64_t v116 = v115;
    uint64_t v117 = *(void *)v883;
    do
    {
      uint64_t v118 = 0;
      do
      {
        if (*(void *)v883 != v117) {
          objc_enumerationMutation(v114);
        }
        uint64_t v119 = (void *)[*(id *)(*((void *)&v882 + 1) + 8 * v118) copyWithZone:a3];
        [v5 addCellularPowerLogLTECarrierComponentInfo:v119];

        ++v118;
      }
      while (v116 != v118);
      uint64_t v116 = [(NSMutableArray *)v114 countByEnumeratingWithState:&v882 objects:v1034 count:16];
    }
    while (v116);
  }

  long long v881 = 0u;
  long long v880 = 0u;
  long long v879 = 0u;
  long long v878 = 0u;
  unint64_t v120 = self->_cellularPowerLogLTEAggregatedDLTBSs;
  uint64_t v121 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v878 objects:v1033 count:16];
  if (v121)
  {
    uint64_t v122 = v121;
    uint64_t v123 = *(void *)v879;
    do
    {
      uint64_t v124 = 0;
      do
      {
        if (*(void *)v879 != v123) {
          objc_enumerationMutation(v120);
        }
        unint64_t v125 = (void *)[*(id *)(*((void *)&v878 + 1) + 8 * v124) copyWithZone:a3];
        [v5 addCellularPowerLogLTEAggregatedDLTBS:v125];

        ++v124;
      }
      while (v122 != v124);
      uint64_t v122 = [(NSMutableArray *)v120 countByEnumeratingWithState:&v878 objects:v1033 count:16];
    }
    while (v122);
  }

  long long v877 = 0u;
  long long v876 = 0u;
  long long v875 = 0u;
  long long v874 = 0u;
  uint64_t v126 = self->_cellularPowerLogLTERSRPs;
  uint64_t v127 = [(NSMutableArray *)v126 countByEnumeratingWithState:&v874 objects:v1032 count:16];
  if (v127)
  {
    uint64_t v128 = v127;
    uint64_t v129 = *(void *)v875;
    do
    {
      uint64_t v130 = 0;
      do
      {
        if (*(void *)v875 != v129) {
          objc_enumerationMutation(v126);
        }
        uint64_t v131 = (void *)[*(id *)(*((void *)&v874 + 1) + 8 * v130) copyWithZone:a3];
        [v5 addCellularPowerLogLTERSRP:v131];

        ++v130;
      }
      while (v128 != v130);
      uint64_t v128 = [(NSMutableArray *)v126 countByEnumeratingWithState:&v874 objects:v1032 count:16];
    }
    while (v128);
  }

  long long v873 = 0u;
  long long v872 = 0u;
  long long v871 = 0u;
  long long v870 = 0u;
  unint64_t v132 = self->_cellularPowerLogLTESINRs;
  uint64_t v133 = [(NSMutableArray *)v132 countByEnumeratingWithState:&v870 objects:v1031 count:16];
  if (v133)
  {
    uint64_t v134 = v133;
    uint64_t v135 = *(void *)v871;
    do
    {
      uint64_t v136 = 0;
      do
      {
        if (*(void *)v871 != v135) {
          objc_enumerationMutation(v132);
        }
        unint64_t v137 = (void *)[*(id *)(*((void *)&v870 + 1) + 8 * v136) copyWithZone:a3];
        [v5 addCellularPowerLogLTESINR:v137];

        ++v136;
      }
      while (v134 != v136);
      uint64_t v134 = [(NSMutableArray *)v132 countByEnumeratingWithState:&v870 objects:v1031 count:16];
    }
    while (v134);
  }

  long long v869 = 0u;
  long long v868 = 0u;
  long long v867 = 0u;
  long long v866 = 0u;
  uint64_t v138 = self->_cellularPowerLogLTETxPowers;
  uint64_t v139 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v866 objects:v1030 count:16];
  if (v139)
  {
    uint64_t v140 = v139;
    uint64_t v141 = *(void *)v867;
    do
    {
      uint64_t v142 = 0;
      do
      {
        if (*(void *)v867 != v141) {
          objc_enumerationMutation(v138);
        }
        uint64_t v143 = (void *)[*(id *)(*((void *)&v866 + 1) + 8 * v142) copyWithZone:a3];
        [v5 addCellularPowerLogLTETxPower:v143];

        ++v142;
      }
      while (v140 != v142);
      uint64_t v140 = [(NSMutableArray *)v138 countByEnumeratingWithState:&v866 objects:v1030 count:16];
    }
    while (v140);
  }

  long long v865 = 0u;
  long long v864 = 0u;
  long long v863 = 0u;
  long long v862 = 0u;
  unint64_t v144 = self->_cellularPowerLogLTERxDiversitys;
  uint64_t v145 = [(NSMutableArray *)v144 countByEnumeratingWithState:&v862 objects:v1029 count:16];
  if (v145)
  {
    uint64_t v146 = v145;
    uint64_t v147 = *(void *)v863;
    do
    {
      uint64_t v148 = 0;
      do
      {
        if (*(void *)v863 != v147) {
          objc_enumerationMutation(v144);
        }
        unint64_t v149 = (void *)[*(id *)(*((void *)&v862 + 1) + 8 * v148) copyWithZone:a3];
        [v5 addCellularPowerLogLTERxDiversity:v149];

        ++v148;
      }
      while (v146 != v148);
      uint64_t v146 = [(NSMutableArray *)v144 countByEnumeratingWithState:&v862 objects:v1029 count:16];
    }
    while (v146);
  }

  long long v861 = 0u;
  long long v860 = 0u;
  long long v859 = 0u;
  long long v858 = 0u;
  v150 = self->_cellularPowerLogLTEULCAStates;
  uint64_t v151 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v858 objects:v1028 count:16];
  if (v151)
  {
    uint64_t v152 = v151;
    uint64_t v153 = *(void *)v859;
    do
    {
      uint64_t v154 = 0;
      do
      {
        if (*(void *)v859 != v153) {
          objc_enumerationMutation(v150);
        }
        uint64_t v155 = (void *)[*(id *)(*((void *)&v858 + 1) + 8 * v154) copyWithZone:a3];
        [v5 addCellularPowerLogLTEULCAState:v155];

        ++v154;
      }
      while (v152 != v154);
      uint64_t v152 = [(NSMutableArray *)v150 countByEnumeratingWithState:&v858 objects:v1028 count:16];
    }
    while (v152);
  }

  long long v857 = 0u;
  long long v856 = 0u;
  long long v855 = 0u;
  long long v854 = 0u;
  unint64_t v156 = self->_cellularPowerLogPowerEstimators;
  uint64_t v157 = [(NSMutableArray *)v156 countByEnumeratingWithState:&v854 objects:v1027 count:16];
  if (v157)
  {
    uint64_t v158 = v157;
    uint64_t v159 = *(void *)v855;
    do
    {
      uint64_t v160 = 0;
      do
      {
        if (*(void *)v855 != v159) {
          objc_enumerationMutation(v156);
        }
        unint64_t v161 = (void *)[*(id *)(*((void *)&v854 + 1) + 8 * v160) copyWithZone:a3];
        [v5 addCellularPowerLogPowerEstimator:v161];

        ++v160;
      }
      while (v158 != v160);
      uint64_t v158 = [(NSMutableArray *)v156 countByEnumeratingWithState:&v854 objects:v1027 count:16];
    }
    while (v158);
  }

  long long v853 = 0u;
  long long v852 = 0u;
  long long v851 = 0u;
  long long v850 = 0u;
  uint64_t v162 = self->_cellularPowerLogLTEPagingDRXCycles;
  uint64_t v163 = [(NSMutableArray *)v162 countByEnumeratingWithState:&v850 objects:v1026 count:16];
  if (v163)
  {
    uint64_t v164 = v163;
    uint64_t v165 = *(void *)v851;
    do
    {
      uint64_t v166 = 0;
      do
      {
        if (*(void *)v851 != v165) {
          objc_enumerationMutation(v162);
        }
        uint64_t v167 = (void *)[*(id *)(*((void *)&v850 + 1) + 8 * v166) copyWithZone:a3];
        [v5 addCellularPowerLogLTEPagingDRXCycle:v167];

        ++v166;
      }
      while (v164 != v166);
      uint64_t v164 = [(NSMutableArray *)v162 countByEnumeratingWithState:&v850 objects:v1026 count:16];
    }
    while (v164);
  }

  long long v849 = 0u;
  long long v848 = 0u;
  long long v847 = 0u;
  long long v846 = 0u;
  unint64_t v168 = self->_cellularPowerLogNRPagingDRXCycles;
  uint64_t v169 = [(NSMutableArray *)v168 countByEnumeratingWithState:&v846 objects:v1025 count:16];
  if (v169)
  {
    uint64_t v170 = v169;
    uint64_t v171 = *(void *)v847;
    do
    {
      uint64_t v172 = 0;
      do
      {
        if (*(void *)v847 != v171) {
          objc_enumerationMutation(v168);
        }
        unint64_t v173 = (void *)[*(id *)(*((void *)&v846 + 1) + 8 * v172) copyWithZone:a3];
        [v5 addCellularPowerLogNRPagingDRXCycle:v173];

        ++v172;
      }
      while (v170 != v172);
      uint64_t v170 = [(NSMutableArray *)v168 countByEnumeratingWithState:&v846 objects:v1025 count:16];
    }
    while (v170);
  }

  long long v845 = 0u;
  long long v844 = 0u;
  long long v843 = 0u;
  long long v842 = 0u;
  uint64_t v174 = self->_cellularPowerLogProtocolStates;
  uint64_t v175 = [(NSMutableArray *)v174 countByEnumeratingWithState:&v842 objects:v1024 count:16];
  if (v175)
  {
    uint64_t v176 = v175;
    uint64_t v177 = *(void *)v843;
    do
    {
      uint64_t v178 = 0;
      do
      {
        if (*(void *)v843 != v177) {
          objc_enumerationMutation(v174);
        }
        uint64_t v179 = (void *)[*(id *)(*((void *)&v842 + 1) + 8 * v178) copyWithZone:a3];
        [v5 addCellularPowerLogProtocolState:v179];

        ++v178;
      }
      while (v176 != v178);
      uint64_t v176 = [(NSMutableArray *)v174 countByEnumeratingWithState:&v842 objects:v1024 count:16];
    }
    while (v176);
  }

  long long v841 = 0u;
  long long v840 = 0u;
  long long v839 = 0u;
  long long v838 = 0u;
  unint64_t v180 = self->_cellularPowerLogPLMNSearchs;
  uint64_t v181 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v838 objects:v1023 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v839;
    do
    {
      uint64_t v184 = 0;
      do
      {
        if (*(void *)v839 != v183) {
          objc_enumerationMutation(v180);
        }
        unint64_t v185 = (void *)[*(id *)(*((void *)&v838 + 1) + 8 * v184) copyWithZone:a3];
        [v5 addCellularPowerLogPLMNSearch:v185];

        ++v184;
      }
      while (v182 != v184);
      uint64_t v182 = [(NSMutableArray *)v180 countByEnumeratingWithState:&v838 objects:v1023 count:16];
    }
    while (v182);
  }

  long long v837 = 0u;
  long long v836 = 0u;
  long long v835 = 0u;
  long long v834 = 0u;
  uint64_t v186 = self->_cellularPowerLogGSMTxPowers;
  uint64_t v187 = [(NSMutableArray *)v186 countByEnumeratingWithState:&v834 objects:v1022 count:16];
  if (v187)
  {
    uint64_t v188 = v187;
    uint64_t v189 = *(void *)v835;
    do
    {
      uint64_t v190 = 0;
      do
      {
        if (*(void *)v835 != v189) {
          objc_enumerationMutation(v186);
        }
        uint64_t v191 = (void *)[*(id *)(*((void *)&v834 + 1) + 8 * v190) copyWithZone:a3];
        [v5 addCellularPowerLogGSMTxPower:v191];

        ++v190;
      }
      while (v188 != v190);
      uint64_t v188 = [(NSMutableArray *)v186 countByEnumeratingWithState:&v834 objects:v1022 count:16];
    }
    while (v188);
  }

  long long v833 = 0u;
  long long v832 = 0u;
  long long v831 = 0u;
  long long v830 = 0u;
  unint64_t v192 = self->_cellularPowerLogGSMRxRSSIs;
  uint64_t v193 = [(NSMutableArray *)v192 countByEnumeratingWithState:&v830 objects:v1021 count:16];
  if (v193)
  {
    uint64_t v194 = v193;
    uint64_t v195 = *(void *)v831;
    do
    {
      uint64_t v196 = 0;
      do
      {
        if (*(void *)v831 != v195) {
          objc_enumerationMutation(v192);
        }
        unint64_t v197 = (void *)[*(id *)(*((void *)&v830 + 1) + 8 * v196) copyWithZone:a3];
        [v5 addCellularPowerLogGSMRxRSSI:v197];

        ++v196;
      }
      while (v194 != v196);
      uint64_t v194 = [(NSMutableArray *)v192 countByEnumeratingWithState:&v830 objects:v1021 count:16];
    }
    while (v194);
  }

  long long v829 = 0u;
  long long v828 = 0u;
  long long v827 = 0u;
  long long v826 = 0u;
  uint64_t v198 = self->_cellularPowerLogGSMRABModes;
  uint64_t v199 = [(NSMutableArray *)v198 countByEnumeratingWithState:&v826 objects:v1020 count:16];
  if (v199)
  {
    uint64_t v200 = v199;
    uint64_t v201 = *(void *)v827;
    do
    {
      uint64_t v202 = 0;
      do
      {
        if (*(void *)v827 != v201) {
          objc_enumerationMutation(v198);
        }
        uint64_t v203 = (void *)[*(id *)(*((void *)&v826 + 1) + 8 * v202) copyWithZone:a3];
        [v5 addCellularPowerLogGSMRABMode:v203];

        ++v202;
      }
      while (v200 != v202);
      uint64_t v200 = [(NSMutableArray *)v198 countByEnumeratingWithState:&v826 objects:v1020 count:16];
    }
    while (v200);
  }

  long long v825 = 0u;
  long long v824 = 0u;
  long long v823 = 0u;
  long long v822 = 0u;
  unint64_t v204 = self->_cellularPowerLogGSMRxDiversitys;
  uint64_t v205 = [(NSMutableArray *)v204 countByEnumeratingWithState:&v822 objects:v1019 count:16];
  if (v205)
  {
    uint64_t v206 = v205;
    uint64_t v207 = *(void *)v823;
    do
    {
      uint64_t v208 = 0;
      do
      {
        if (*(void *)v823 != v207) {
          objc_enumerationMutation(v204);
        }
        unint64_t v209 = (void *)[*(id *)(*((void *)&v822 + 1) + 8 * v208) copyWithZone:a3];
        [v5 addCellularPowerLogGSMRxDiversity:v209];

        ++v208;
      }
      while (v206 != v208);
      uint64_t v206 = [(NSMutableArray *)v204 countByEnumeratingWithState:&v822 objects:v1019 count:16];
    }
    while (v206);
  }

  long long v821 = 0u;
  long long v820 = 0u;
  long long v819 = 0u;
  long long v818 = 0u;
  uint64_t v210 = self->_cellularPowerLogWCDMATxPowers;
  uint64_t v211 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v818 objects:v1018 count:16];
  if (v211)
  {
    uint64_t v212 = v211;
    uint64_t v213 = *(void *)v819;
    do
    {
      uint64_t v214 = 0;
      do
      {
        if (*(void *)v819 != v213) {
          objc_enumerationMutation(v210);
        }
        v215 = (void *)[*(id *)(*((void *)&v818 + 1) + 8 * v214) copyWithZone:a3];
        [v5 addCellularPowerLogWCDMATxPower:v215];

        ++v214;
      }
      while (v212 != v214);
      uint64_t v212 = [(NSMutableArray *)v210 countByEnumeratingWithState:&v818 objects:v1018 count:16];
    }
    while (v212);
  }

  long long v817 = 0u;
  long long v816 = 0u;
  long long v815 = 0u;
  long long v814 = 0u;
  unint64_t v216 = self->_cellularPowerLogWCDMARxRSSIs;
  uint64_t v217 = [(NSMutableArray *)v216 countByEnumeratingWithState:&v814 objects:v1017 count:16];
  if (v217)
  {
    uint64_t v218 = v217;
    uint64_t v219 = *(void *)v815;
    do
    {
      uint64_t v220 = 0;
      do
      {
        if (*(void *)v815 != v219) {
          objc_enumerationMutation(v216);
        }
        unint64_t v221 = (void *)[*(id *)(*((void *)&v814 + 1) + 8 * v220) copyWithZone:a3];
        [v5 addCellularPowerLogWCDMARxRSSI:v221];

        ++v220;
      }
      while (v218 != v220);
      uint64_t v218 = [(NSMutableArray *)v216 countByEnumeratingWithState:&v814 objects:v1017 count:16];
    }
    while (v218);
  }

  long long v813 = 0u;
  long long v812 = 0u;
  long long v811 = 0u;
  long long v810 = 0u;
  uint64_t v222 = self->_cellularPowerLogNRSCGRels;
  uint64_t v223 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v810 objects:v1016 count:16];
  if (v223)
  {
    uint64_t v224 = v223;
    uint64_t v225 = *(void *)v811;
    do
    {
      uint64_t v226 = 0;
      do
      {
        if (*(void *)v811 != v225) {
          objc_enumerationMutation(v222);
        }
        uint64_t v227 = (void *)[*(id *)(*((void *)&v810 + 1) + 8 * v226) copyWithZone:a3];
        [v5 addCellularPowerLogNRSCGRel:v227];

        ++v226;
      }
      while (v224 != v226);
      uint64_t v224 = [(NSMutableArray *)v222 countByEnumeratingWithState:&v810 objects:v1016 count:16];
    }
    while (v224);
  }

  long long v809 = 0u;
  long long v808 = 0u;
  long long v807 = 0u;
  long long v806 = 0u;
  unint64_t v228 = self->_cellularPowerLogWCDMARxDiversitys;
  uint64_t v229 = [(NSMutableArray *)v228 countByEnumeratingWithState:&v806 objects:v1015 count:16];
  if (v229)
  {
    uint64_t v230 = v229;
    uint64_t v231 = *(void *)v807;
    do
    {
      uint64_t v232 = 0;
      do
      {
        if (*(void *)v807 != v231) {
          objc_enumerationMutation(v228);
        }
        unint64_t v233 = (void *)[*(id *)(*((void *)&v806 + 1) + 8 * v232) copyWithZone:a3];
        [v5 addCellularPowerLogWCDMARxDiversity:v233];

        ++v232;
      }
      while (v230 != v232);
      uint64_t v230 = [(NSMutableArray *)v228 countByEnumeratingWithState:&v806 objects:v1015 count:16];
    }
    while (v230);
  }

  long long v805 = 0u;
  long long v804 = 0u;
  long long v803 = 0u;
  long long v802 = 0u;
  uint64_t v234 = self->_cellularPowerLogWCDMARABModes;
  uint64_t v235 = [(NSMutableArray *)v234 countByEnumeratingWithState:&v802 objects:v1014 count:16];
  if (v235)
  {
    uint64_t v236 = v235;
    uint64_t v237 = *(void *)v803;
    do
    {
      uint64_t v238 = 0;
      do
      {
        if (*(void *)v803 != v237) {
          objc_enumerationMutation(v234);
        }
        uint64_t v239 = (void *)[*(id *)(*((void *)&v802 + 1) + 8 * v238) copyWithZone:a3];
        [v5 addCellularPowerLogWCDMARABMode:v239];

        ++v238;
      }
      while (v236 != v238);
      uint64_t v236 = [(NSMutableArray *)v234 countByEnumeratingWithState:&v802 objects:v1014 count:16];
    }
    while (v236);
  }

  long long v801 = 0u;
  long long v800 = 0u;
  long long v799 = 0u;
  long long v798 = 0u;
  unint64_t v240 = self->_cellularPowerLogWCDMARABTypes;
  uint64_t v241 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v798 objects:v1013 count:16];
  if (v241)
  {
    uint64_t v242 = v241;
    uint64_t v243 = *(void *)v799;
    do
    {
      uint64_t v244 = 0;
      do
      {
        if (*(void *)v799 != v243) {
          objc_enumerationMutation(v240);
        }
        unint64_t v245 = (void *)[*(id *)(*((void *)&v798 + 1) + 8 * v244) copyWithZone:a3];
        [v5 addCellularPowerLogWCDMARABType:v245];

        ++v244;
      }
      while (v242 != v244);
      uint64_t v242 = [(NSMutableArray *)v240 countByEnumeratingWithState:&v798 objects:v1013 count:16];
    }
    while (v242);
  }

  long long v797 = 0u;
  long long v796 = 0u;
  long long v795 = 0u;
  long long v794 = 0u;
  uint64_t v246 = self->_cellularPowerLogEVDOTxPowers;
  uint64_t v247 = [(NSMutableArray *)v246 countByEnumeratingWithState:&v794 objects:v1012 count:16];
  if (v247)
  {
    uint64_t v248 = v247;
    uint64_t v249 = *(void *)v795;
    do
    {
      uint64_t v250 = 0;
      do
      {
        if (*(void *)v795 != v249) {
          objc_enumerationMutation(v246);
        }
        uint64_t v251 = (void *)[*(id *)(*((void *)&v794 + 1) + 8 * v250) copyWithZone:a3];
        [v5 addCellularPowerLogEVDOTxPower:v251];

        ++v250;
      }
      while (v248 != v250);
      uint64_t v248 = [(NSMutableArray *)v246 countByEnumeratingWithState:&v794 objects:v1012 count:16];
    }
    while (v248);
  }

  long long v793 = 0u;
  long long v792 = 0u;
  long long v791 = 0u;
  long long v790 = 0u;
  unint64_t v252 = self->_cellularPowerLogEVDORxRSSIs;
  uint64_t v253 = [(NSMutableArray *)v252 countByEnumeratingWithState:&v790 objects:v1011 count:16];
  if (v253)
  {
    uint64_t v254 = v253;
    uint64_t v255 = *(void *)v791;
    do
    {
      uint64_t v256 = 0;
      do
      {
        if (*(void *)v791 != v255) {
          objc_enumerationMutation(v252);
        }
        unint64_t v257 = (void *)[*(id *)(*((void *)&v790 + 1) + 8 * v256) copyWithZone:a3];
        [v5 addCellularPowerLogEVDORxRSSI:v257];

        ++v256;
      }
      while (v254 != v256);
      uint64_t v254 = [(NSMutableArray *)v252 countByEnumeratingWithState:&v790 objects:v1011 count:16];
    }
    while (v254);
  }

  long long v789 = 0u;
  long long v788 = 0u;
  long long v787 = 0u;
  long long v786 = 0u;
  uint64_t v258 = self->_cellularPowerLogHybridRABModes;
  uint64_t v259 = [(NSMutableArray *)v258 countByEnumeratingWithState:&v786 objects:v1010 count:16];
  if (v259)
  {
    uint64_t v260 = v259;
    uint64_t v261 = *(void *)v787;
    do
    {
      uint64_t v262 = 0;
      do
      {
        if (*(void *)v787 != v261) {
          objc_enumerationMutation(v258);
        }
        uint64_t v263 = (void *)[*(id *)(*((void *)&v786 + 1) + 8 * v262) copyWithZone:a3];
        [v5 addCellularPowerLogHybridRABMode:v263];

        ++v262;
      }
      while (v260 != v262);
      uint64_t v260 = [(NSMutableArray *)v258 countByEnumeratingWithState:&v786 objects:v1010 count:16];
    }
    while (v260);
  }

  long long v785 = 0u;
  long long v784 = 0u;
  long long v783 = 0u;
  long long v782 = 0u;
  unint64_t v264 = self->_cellularPowerLogEVDORxDiversitys;
  uint64_t v265 = [(NSMutableArray *)v264 countByEnumeratingWithState:&v782 objects:v1009 count:16];
  if (v265)
  {
    uint64_t v266 = v265;
    uint64_t v267 = *(void *)v783;
    do
    {
      uint64_t v268 = 0;
      do
      {
        if (*(void *)v783 != v267) {
          objc_enumerationMutation(v264);
        }
        unint64_t v269 = (void *)[*(id *)(*((void *)&v782 + 1) + 8 * v268) copyWithZone:a3];
        [v5 addCellularPowerLogEVDORxDiversity:v269];

        ++v268;
      }
      while (v266 != v268);
      uint64_t v266 = [(NSMutableArray *)v264 countByEnumeratingWithState:&v782 objects:v1009 count:16];
    }
    while (v266);
  }

  long long v781 = 0u;
  long long v780 = 0u;
  long long v779 = 0u;
  long long v778 = 0u;
  v270 = self->_cellularPowerLogCDMA1XTxPowers;
  uint64_t v271 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v778 objects:v1008 count:16];
  if (v271)
  {
    uint64_t v272 = v271;
    uint64_t v273 = *(void *)v779;
    do
    {
      uint64_t v274 = 0;
      do
      {
        if (*(void *)v779 != v273) {
          objc_enumerationMutation(v270);
        }
        uint64_t v275 = (void *)[*(id *)(*((void *)&v778 + 1) + 8 * v274) copyWithZone:a3];
        [v5 addCellularPowerLogCDMA1XTxPower:v275];

        ++v274;
      }
      while (v272 != v274);
      uint64_t v272 = [(NSMutableArray *)v270 countByEnumeratingWithState:&v778 objects:v1008 count:16];
    }
    while (v272);
  }

  long long v777 = 0u;
  long long v776 = 0u;
  long long v775 = 0u;
  long long v774 = 0u;
  unint64_t v276 = self->_cellularPowerLogCDMA1XRxRSSIs;
  uint64_t v277 = [(NSMutableArray *)v276 countByEnumeratingWithState:&v774 objects:v1007 count:16];
  if (v277)
  {
    uint64_t v278 = v277;
    uint64_t v279 = *(void *)v775;
    do
    {
      uint64_t v280 = 0;
      do
      {
        if (*(void *)v775 != v279) {
          objc_enumerationMutation(v276);
        }
        unint64_t v281 = (void *)[*(id *)(*((void *)&v774 + 1) + 8 * v280) copyWithZone:a3];
        [v5 addCellularPowerLogCDMA1XRxRSSI:v281];

        ++v280;
      }
      while (v278 != v280);
      uint64_t v278 = [(NSMutableArray *)v276 countByEnumeratingWithState:&v774 objects:v1007 count:16];
    }
    while (v278);
  }

  long long v773 = 0u;
  long long v772 = 0u;
  long long v771 = 0u;
  long long v770 = 0u;
  uint64_t v282 = self->_cellularPowerLogCDMA1XRABModes;
  uint64_t v283 = [(NSMutableArray *)v282 countByEnumeratingWithState:&v770 objects:v1006 count:16];
  if (v283)
  {
    uint64_t v284 = v283;
    uint64_t v285 = *(void *)v771;
    do
    {
      uint64_t v286 = 0;
      do
      {
        if (*(void *)v771 != v285) {
          objc_enumerationMutation(v282);
        }
        uint64_t v287 = (void *)[*(id *)(*((void *)&v770 + 1) + 8 * v286) copyWithZone:a3];
        [v5 addCellularPowerLogCDMA1XRABMode:v287];

        ++v286;
      }
      while (v284 != v286);
      uint64_t v284 = [(NSMutableArray *)v282 countByEnumeratingWithState:&v770 objects:v1006 count:16];
    }
    while (v284);
  }

  long long v769 = 0u;
  long long v768 = 0u;
  long long v767 = 0u;
  long long v766 = 0u;
  unint64_t v288 = self->_cellularPowerLogCDMA1XRxDiversitys;
  uint64_t v289 = [(NSMutableArray *)v288 countByEnumeratingWithState:&v766 objects:v1005 count:16];
  if (v289)
  {
    uint64_t v290 = v289;
    uint64_t v291 = *(void *)v767;
    do
    {
      uint64_t v292 = 0;
      do
      {
        if (*(void *)v767 != v291) {
          objc_enumerationMutation(v288);
        }
        unint64_t v293 = (void *)[*(id *)(*((void *)&v766 + 1) + 8 * v292) copyWithZone:a3];
        [v5 addCellularPowerLogCDMA1XRxDiversity:v293];

        ++v292;
      }
      while (v290 != v292);
      uint64_t v290 = [(NSMutableArray *)v288 countByEnumeratingWithState:&v766 objects:v1005 count:16];
    }
    while (v290);
  }

  long long v765 = 0u;
  long long v764 = 0u;
  long long v763 = 0u;
  long long v762 = 0u;
  uint64_t v294 = self->_cellularPowerLogWCDMACDRXConfigs;
  uint64_t v295 = [(NSMutableArray *)v294 countByEnumeratingWithState:&v762 objects:v1004 count:16];
  if (v295)
  {
    uint64_t v296 = v295;
    uint64_t v297 = *(void *)v763;
    do
    {
      uint64_t v298 = 0;
      do
      {
        if (*(void *)v763 != v297) {
          objc_enumerationMutation(v294);
        }
        uint64_t v299 = (void *)[*(id *)(*((void *)&v762 + 1) + 8 * v298) copyWithZone:a3];
        [v5 addCellularPowerLogWCDMACDRXConfig:v299];

        ++v298;
      }
      while (v296 != v298);
      uint64_t v296 = [(NSMutableArray *)v294 countByEnumeratingWithState:&v762 objects:v1004 count:16];
    }
    while (v296);
  }

  long long v761 = 0u;
  long long v760 = 0u;
  long long v759 = 0u;
  long long v758 = 0u;
  unint64_t v300 = self->_cellularPowerLogLTECDRXConfigs;
  uint64_t v301 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v758 objects:v1003 count:16];
  if (v301)
  {
    uint64_t v302 = v301;
    uint64_t v303 = *(void *)v759;
    do
    {
      uint64_t v304 = 0;
      do
      {
        if (*(void *)v759 != v303) {
          objc_enumerationMutation(v300);
        }
        unint64_t v305 = (void *)[*(id *)(*((void *)&v758 + 1) + 8 * v304) copyWithZone:a3];
        [v5 addCellularPowerLogLTECDRXConfig:v305];

        ++v304;
      }
      while (v302 != v304);
      uint64_t v302 = [(NSMutableArray *)v300 countByEnumeratingWithState:&v758 objects:v1003 count:16];
    }
    while (v302);
  }

  long long v757 = 0u;
  long long v756 = 0u;
  long long v755 = 0u;
  long long v754 = 0u;
  uint64_t v306 = self->_cellularPowerLogWCDMARRCStateChanges;
  uint64_t v307 = [(NSMutableArray *)v306 countByEnumeratingWithState:&v754 objects:v1002 count:16];
  if (v307)
  {
    uint64_t v308 = v307;
    uint64_t v309 = *(void *)v755;
    do
    {
      uint64_t v310 = 0;
      do
      {
        if (*(void *)v755 != v309) {
          objc_enumerationMutation(v306);
        }
        uint64_t v311 = (void *)[*(id *)(*((void *)&v754 + 1) + 8 * v310) copyWithZone:a3];
        [v5 addCellularPowerLogWCDMARRCStateChange:v311];

        ++v310;
      }
      while (v308 != v310);
      uint64_t v308 = [(NSMutableArray *)v306 countByEnumeratingWithState:&v754 objects:v1002 count:16];
    }
    while (v308);
  }

  long long v753 = 0u;
  long long v752 = 0u;
  long long v751 = 0u;
  long long v750 = 0u;
  unint64_t v312 = self->_cellularPowerLogLTERRCStateChanges;
  uint64_t v313 = [(NSMutableArray *)v312 countByEnumeratingWithState:&v750 objects:v1001 count:16];
  if (v313)
  {
    uint64_t v314 = v313;
    uint64_t v315 = *(void *)v751;
    do
    {
      uint64_t v316 = 0;
      do
      {
        if (*(void *)v751 != v315) {
          objc_enumerationMutation(v312);
        }
        unint64_t v317 = (void *)[*(id *)(*((void *)&v750 + 1) + 8 * v316) copyWithZone:a3];
        [v5 addCellularPowerLogLTERRCStateChange:v317];

        ++v316;
      }
      while (v314 != v316);
      uint64_t v314 = [(NSMutableArray *)v312 countByEnumeratingWithState:&v750 objects:v1001 count:16];
    }
    while (v314);
  }

  long long v749 = 0u;
  long long v748 = 0u;
  long long v747 = 0u;
  long long v746 = 0u;
  uint64_t v318 = self->_cellularPowerLogSystemEvents;
  uint64_t v319 = [(NSMutableArray *)v318 countByEnumeratingWithState:&v746 objects:v1000 count:16];
  if (v319)
  {
    uint64_t v320 = v319;
    uint64_t v321 = *(void *)v747;
    do
    {
      uint64_t v322 = 0;
      do
      {
        if (*(void *)v747 != v321) {
          objc_enumerationMutation(v318);
        }
        uint64_t v323 = (void *)[*(id *)(*((void *)&v746 + 1) + 8 * v322) copyWithZone:a3];
        [v5 addCellularPowerLogSystemEvent:v323];

        ++v322;
      }
      while (v320 != v322);
      uint64_t v320 = [(NSMutableArray *)v318 countByEnumeratingWithState:&v746 objects:v1000 count:16];
    }
    while (v320);
  }

  long long v745 = 0u;
  long long v744 = 0u;
  long long v743 = 0u;
  long long v742 = 0u;
  unint64_t v324 = self->_cellularPowerLogRATReselectionEvents;
  uint64_t v325 = [(NSMutableArray *)v324 countByEnumeratingWithState:&v742 objects:v999 count:16];
  if (v325)
  {
    uint64_t v326 = v325;
    uint64_t v327 = *(void *)v743;
    do
    {
      uint64_t v328 = 0;
      do
      {
        if (*(void *)v743 != v327) {
          objc_enumerationMutation(v324);
        }
        unint64_t v329 = (void *)[*(id *)(*((void *)&v742 + 1) + 8 * v328) copyWithZone:a3];
        [v5 addCellularPowerLogRATReselectionEvent:v329];

        ++v328;
      }
      while (v326 != v328);
      uint64_t v326 = [(NSMutableArray *)v324 countByEnumeratingWithState:&v742 objects:v999 count:16];
    }
    while (v326);
  }

  long long v741 = 0u;
  long long v740 = 0u;
  long long v739 = 0u;
  long long v738 = 0u;
  uint64_t v330 = self->_cellularPowerLogRATRedirectionEvents;
  uint64_t v331 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v738 objects:v998 count:16];
  if (v331)
  {
    uint64_t v332 = v331;
    uint64_t v333 = *(void *)v739;
    do
    {
      uint64_t v334 = 0;
      do
      {
        if (*(void *)v739 != v333) {
          objc_enumerationMutation(v330);
        }
        uint64_t v335 = (void *)[*(id *)(*((void *)&v738 + 1) + 8 * v334) copyWithZone:a3];
        [v5 addCellularPowerLogRATRedirectionEvent:v335];

        ++v334;
      }
      while (v332 != v334);
      uint64_t v332 = [(NSMutableArray *)v330 countByEnumeratingWithState:&v738 objects:v998 count:16];
    }
    while (v332);
  }

  long long v737 = 0u;
  long long v736 = 0u;
  long long v735 = 0u;
  long long v734 = 0u;
  unint64_t v336 = self->_cellularPowerLogGSMRRCStateChanges;
  uint64_t v337 = [(NSMutableArray *)v336 countByEnumeratingWithState:&v734 objects:v997 count:16];
  if (v337)
  {
    uint64_t v338 = v337;
    uint64_t v339 = *(void *)v735;
    do
    {
      uint64_t v340 = 0;
      do
      {
        if (*(void *)v735 != v339) {
          objc_enumerationMutation(v336);
        }
        unint64_t v341 = (void *)[*(id *)(*((void *)&v734 + 1) + 8 * v340) copyWithZone:a3];
        [v5 addCellularPowerLogGSMRRCStateChange:v341];

        ++v340;
      }
      while (v338 != v340);
      uint64_t v338 = [(NSMutableArray *)v336 countByEnumeratingWithState:&v734 objects:v997 count:16];
    }
    while (v338);
  }

  long long v733 = 0u;
  long long v732 = 0u;
  long long v731 = 0u;
  long long v730 = 0u;
  uint64_t v342 = self->_cellularPowerLogCDMA1XRRCStateChanges;
  uint64_t v343 = [(NSMutableArray *)v342 countByEnumeratingWithState:&v730 objects:v996 count:16];
  if (v343)
  {
    uint64_t v344 = v343;
    uint64_t v345 = *(void *)v731;
    do
    {
      uint64_t v346 = 0;
      do
      {
        if (*(void *)v731 != v345) {
          objc_enumerationMutation(v342);
        }
        uint64_t v347 = (void *)[*(id *)(*((void *)&v730 + 1) + 8 * v346) copyWithZone:a3];
        [v5 addCellularPowerLogCDMA1XRRCStateChange:v347];

        ++v346;
      }
      while (v344 != v346);
      uint64_t v344 = [(NSMutableArray *)v342 countByEnumeratingWithState:&v730 objects:v996 count:16];
    }
    while (v344);
  }

  long long v729 = 0u;
  long long v728 = 0u;
  long long v727 = 0u;
  long long v726 = 0u;
  unint64_t v348 = self->_cellularPowerLogHybridRRCStateChanges;
  uint64_t v349 = [(NSMutableArray *)v348 countByEnumeratingWithState:&v726 objects:v995 count:16];
  if (v349)
  {
    uint64_t v350 = v349;
    uint64_t v351 = *(void *)v727;
    do
    {
      uint64_t v352 = 0;
      do
      {
        if (*(void *)v727 != v351) {
          objc_enumerationMutation(v348);
        }
        unint64_t v353 = (void *)[*(id *)(*((void *)&v726 + 1) + 8 * v352) copyWithZone:a3];
        [v5 addCellularPowerLogHybridRRCStateChange:v353];

        ++v352;
      }
      while (v350 != v352);
      uint64_t v350 = [(NSMutableArray *)v348 countByEnumeratingWithState:&v726 objects:v995 count:16];
    }
    while (v350);
  }

  long long v725 = 0u;
  long long v724 = 0u;
  long long v723 = 0u;
  long long v722 = 0u;
  uint64_t v354 = self->_cellularPowerLogServiceStateEvents;
  uint64_t v355 = [(NSMutableArray *)v354 countByEnumeratingWithState:&v722 objects:v994 count:16];
  if (v355)
  {
    uint64_t v356 = v355;
    uint64_t v357 = *(void *)v723;
    do
    {
      uint64_t v358 = 0;
      do
      {
        if (*(void *)v723 != v357) {
          objc_enumerationMutation(v354);
        }
        uint64_t v359 = (void *)[*(id *)(*((void *)&v722 + 1) + 8 * v358) copyWithZone:a3];
        [v5 addCellularPowerLogServiceStateEvent:v359];

        ++v358;
      }
      while (v356 != v358);
      uint64_t v356 = [(NSMutableArray *)v354 countByEnumeratingWithState:&v722 objects:v994 count:16];
    }
    while (v356);
  }

  long long v721 = 0u;
  long long v720 = 0u;
  long long v719 = 0u;
  long long v718 = 0u;
  unint64_t v360 = self->_cellularPowerLogPLMNScanEvents;
  uint64_t v361 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v718 objects:v993 count:16];
  if (v361)
  {
    uint64_t v362 = v361;
    uint64_t v363 = *(void *)v719;
    do
    {
      uint64_t v364 = 0;
      do
      {
        if (*(void *)v719 != v363) {
          objc_enumerationMutation(v360);
        }
        unint64_t v365 = (void *)[*(id *)(*((void *)&v718 + 1) + 8 * v364) copyWithZone:a3];
        [v5 addCellularPowerLogPLMNScanEvent:v365];

        ++v364;
      }
      while (v362 != v364);
      uint64_t v362 = [(NSMutableArray *)v360 countByEnumeratingWithState:&v718 objects:v993 count:16];
    }
    while (v362);
  }

  long long v717 = 0u;
  long long v716 = 0u;
  long long v715 = 0u;
  long long v714 = 0u;
  uint64_t v366 = self->_cellularPowerLogPLMNSearchEvents;
  uint64_t v367 = [(NSMutableArray *)v366 countByEnumeratingWithState:&v714 objects:v992 count:16];
  if (v367)
  {
    uint64_t v368 = v367;
    uint64_t v369 = *(void *)v715;
    do
    {
      uint64_t v370 = 0;
      do
      {
        if (*(void *)v715 != v369) {
          objc_enumerationMutation(v366);
        }
        uint64_t v371 = (void *)[*(id *)(*((void *)&v714 + 1) + 8 * v370) copyWithZone:a3];
        [v5 addCellularPowerLogPLMNSearchEvent:v371];

        ++v370;
      }
      while (v368 != v370);
      uint64_t v368 = [(NSMutableArray *)v366 countByEnumeratingWithState:&v714 objects:v992 count:16];
    }
    while (v368);
  }

  long long v713 = 0u;
  long long v712 = 0u;
  long long v711 = 0u;
  long long v710 = 0u;
  unint64_t v372 = self->_cellularPowerLogNRSARRCStateChanges;
  uint64_t v373 = [(NSMutableArray *)v372 countByEnumeratingWithState:&v710 objects:v991 count:16];
  if (v373)
  {
    uint64_t v374 = v373;
    uint64_t v375 = *(void *)v711;
    do
    {
      uint64_t v376 = 0;
      do
      {
        if (*(void *)v711 != v375) {
          objc_enumerationMutation(v372);
        }
        unint64_t v377 = (void *)[*(id *)(*((void *)&v710 + 1) + 8 * v376) copyWithZone:a3];
        [v5 addCellularPowerLogNRSARRCStateChange:v377];

        ++v376;
      }
      while (v374 != v376);
      uint64_t v374 = [(NSMutableArray *)v372 countByEnumeratingWithState:&v710 objects:v991 count:16];
    }
    while (v374);
  }

  long long v709 = 0u;
  long long v708 = 0u;
  long long v707 = 0u;
  long long v706 = 0u;
  uint64_t v378 = self->_cellularPowerLogNRNSAENDCEvents;
  uint64_t v379 = [(NSMutableArray *)v378 countByEnumeratingWithState:&v706 objects:v990 count:16];
  if (v379)
  {
    uint64_t v380 = v379;
    uint64_t v381 = *(void *)v707;
    do
    {
      uint64_t v382 = 0;
      do
      {
        if (*(void *)v707 != v381) {
          objc_enumerationMutation(v378);
        }
        uint64_t v383 = (void *)[*(id *)(*((void *)&v706 + 1) + 8 * v382) copyWithZone:a3];
        [v5 addCellularPowerLogNRNSAENDCEvent:v383];

        ++v382;
      }
      while (v380 != v382);
      uint64_t v380 = [(NSMutableArray *)v378 countByEnumeratingWithState:&v706 objects:v990 count:16];
    }
    while (v380);
  }

  long long v705 = 0u;
  long long v704 = 0u;
  long long v703 = 0u;
  long long v702 = 0u;
  id v384 = self->_cellularPowerLogNRCDRXConfigs;
  uint64_t v385 = [(NSMutableArray *)v384 countByEnumeratingWithState:&v702 objects:v989 count:16];
  if (v385)
  {
    uint64_t v386 = v385;
    uint64_t v387 = *(void *)v703;
    do
    {
      uint64_t v388 = 0;
      do
      {
        if (*(void *)v703 != v387) {
          objc_enumerationMutation(v384);
        }
        uint64_t v389 = (void *)[*(id *)(*((void *)&v702 + 1) + 8 * v388) copyWithZone:a3];
        [v5 addCellularPowerLogNRCDRXConfig:v389];

        ++v388;
      }
      while (v386 != v388);
      uint64_t v386 = [(NSMutableArray *)v384 countByEnumeratingWithState:&v702 objects:v989 count:16];
    }
    while (v386);
  }

  long long v701 = 0u;
  long long v700 = 0u;
  long long v699 = 0u;
  long long v698 = 0u;
  v390 = self->_cellularPowerLogNRsub6BWPs;
  uint64_t v391 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v698 objects:v988 count:16];
  if (v391)
  {
    uint64_t v392 = v391;
    uint64_t v393 = *(void *)v699;
    do
    {
      uint64_t v394 = 0;
      do
      {
        if (*(void *)v699 != v393) {
          objc_enumerationMutation(v390);
        }
        v395 = (void *)[*(id *)(*((void *)&v698 + 1) + 8 * v394) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6BWP:v395];

        ++v394;
      }
      while (v392 != v394);
      uint64_t v392 = [(NSMutableArray *)v390 countByEnumeratingWithState:&v698 objects:v988 count:16];
    }
    while (v392);
  }

  long long v697 = 0u;
  long long v696 = 0u;
  long long v695 = 0u;
  long long v694 = 0u;
  uint64_t v396 = self->_cellularPowerLogRFTunerStatsHists;
  uint64_t v397 = [(NSMutableArray *)v396 countByEnumeratingWithState:&v694 objects:v987 count:16];
  if (v397)
  {
    uint64_t v398 = v397;
    uint64_t v399 = *(void *)v695;
    do
    {
      uint64_t v400 = 0;
      do
      {
        if (*(void *)v695 != v399) {
          objc_enumerationMutation(v396);
        }
        uint64_t v401 = (void *)[*(id *)(*((void *)&v694 + 1) + 8 * v400) copyWithZone:a3];
        [v5 addCellularPowerLogRFTunerStatsHist:v401];

        ++v400;
      }
      while (v398 != v400);
      uint64_t v398 = [(NSMutableArray *)v396 countByEnumeratingWithState:&v694 objects:v987 count:16];
    }
    while (v398);
  }

  long long v693 = 0u;
  long long v692 = 0u;
  long long v691 = 0u;
  long long v690 = 0u;
  uint64_t v402 = self->_cellularPowerLogNRsub6CASCCConfigureds;
  uint64_t v403 = [(NSMutableArray *)v402 countByEnumeratingWithState:&v690 objects:v986 count:16];
  if (v403)
  {
    uint64_t v404 = v403;
    uint64_t v405 = *(void *)v691;
    do
    {
      uint64_t v406 = 0;
      do
      {
        if (*(void *)v691 != v405) {
          objc_enumerationMutation(v402);
        }
        uint64_t v407 = (void *)[*(id *)(*((void *)&v690 + 1) + 8 * v406) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6CASCCConfigured:v407];

        ++v406;
      }
      while (v404 != v406);
      uint64_t v404 = [(NSMutableArray *)v402 countByEnumeratingWithState:&v690 objects:v986 count:16];
    }
    while (v404);
  }

  long long v689 = 0u;
  long long v688 = 0u;
  long long v687 = 0u;
  long long v686 = 0u;
  uint64_t v408 = self->_cellularPowerLogNRsub6CASCCActivateds;
  uint64_t v409 = [(NSMutableArray *)v408 countByEnumeratingWithState:&v686 objects:v985 count:16];
  if (v409)
  {
    uint64_t v410 = v409;
    uint64_t v411 = *(void *)v687;
    do
    {
      uint64_t v412 = 0;
      do
      {
        if (*(void *)v687 != v411) {
          objc_enumerationMutation(v408);
        }
        uint64_t v413 = (void *)[*(id *)(*((void *)&v686 + 1) + 8 * v412) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6CASCCActivated:v413];

        ++v412;
      }
      while (v410 != v412);
      uint64_t v410 = [(NSMutableArray *)v408 countByEnumeratingWithState:&v686 objects:v985 count:16];
    }
    while (v410);
  }

  long long v685 = 0u;
  long long v684 = 0u;
  long long v683 = 0u;
  long long v682 = 0u;
  uint64_t v414 = self->_cellularPowerLogNRsub6RxTxs;
  uint64_t v415 = [(NSMutableArray *)v414 countByEnumeratingWithState:&v682 objects:v984 count:16];
  if (v415)
  {
    uint64_t v416 = v415;
    uint64_t v417 = *(void *)v683;
    do
    {
      uint64_t v418 = 0;
      do
      {
        if (*(void *)v683 != v417) {
          objc_enumerationMutation(v414);
        }
        uint64_t v419 = (void *)[*(id *)(*((void *)&v682 + 1) + 8 * v418) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6RxTx:v419];

        ++v418;
      }
      while (v416 != v418);
      uint64_t v416 = [(NSMutableArray *)v414 countByEnumeratingWithState:&v682 objects:v984 count:16];
    }
    while (v416);
  }

  long long v681 = 0u;
  long long v680 = 0u;
  long long v679 = 0u;
  long long v678 = 0u;
  uint64_t v420 = self->_cellularPowerLogNRsub6CarrierComponentInfos;
  uint64_t v421 = [(NSMutableArray *)v420 countByEnumeratingWithState:&v678 objects:v983 count:16];
  if (v421)
  {
    uint64_t v422 = v421;
    uint64_t v423 = *(void *)v679;
    do
    {
      uint64_t v424 = 0;
      do
      {
        if (*(void *)v679 != v423) {
          objc_enumerationMutation(v420);
        }
        v425 = (void *)[*(id *)(*((void *)&v678 + 1) + 8 * v424) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6CarrierComponentInfo:v425];

        ++v424;
      }
      while (v422 != v424);
      uint64_t v422 = [(NSMutableArray *)v420 countByEnumeratingWithState:&v678 objects:v983 count:16];
    }
    while (v422);
  }

  long long v677 = 0u;
  long long v676 = 0u;
  long long v675 = 0u;
  long long v674 = 0u;
  uint64_t v426 = self->_cellularPowerLogNRsub6DLTBSs;
  uint64_t v427 = [(NSMutableArray *)v426 countByEnumeratingWithState:&v674 objects:v982 count:16];
  if (v427)
  {
    uint64_t v428 = v427;
    uint64_t v429 = *(void *)v675;
    do
    {
      uint64_t v430 = 0;
      do
      {
        if (*(void *)v675 != v429) {
          objc_enumerationMutation(v426);
        }
        uint64_t v431 = (void *)[*(id *)(*((void *)&v674 + 1) + 8 * v430) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6DLTBS:v431];

        ++v430;
      }
      while (v428 != v430);
      uint64_t v428 = [(NSMutableArray *)v426 countByEnumeratingWithState:&v674 objects:v982 count:16];
    }
    while (v428);
  }

  long long v673 = 0u;
  long long v672 = 0u;
  long long v671 = 0u;
  long long v670 = 0u;
  uint64_t v432 = self->_cellularPowerLogNRsub6RSRPs;
  uint64_t v433 = [(NSMutableArray *)v432 countByEnumeratingWithState:&v670 objects:v981 count:16];
  if (v433)
  {
    uint64_t v434 = v433;
    uint64_t v435 = *(void *)v671;
    do
    {
      uint64_t v436 = 0;
      do
      {
        if (*(void *)v671 != v435) {
          objc_enumerationMutation(v432);
        }
        uint64_t v437 = (void *)[*(id *)(*((void *)&v670 + 1) + 8 * v436) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6RSRP:v437];

        ++v436;
      }
      while (v434 != v436);
      uint64_t v434 = [(NSMutableArray *)v432 countByEnumeratingWithState:&v670 objects:v981 count:16];
    }
    while (v434);
  }

  long long v669 = 0u;
  long long v668 = 0u;
  long long v667 = 0u;
  long long v666 = 0u;
  uint64_t v438 = self->_cellularPowerLogNRsub6ULCAStates;
  uint64_t v439 = [(NSMutableArray *)v438 countByEnumeratingWithState:&v666 objects:v980 count:16];
  if (v439)
  {
    uint64_t v440 = v439;
    uint64_t v441 = *(void *)v667;
    do
    {
      uint64_t v442 = 0;
      do
      {
        if (*(void *)v667 != v441) {
          objc_enumerationMutation(v438);
        }
        uint64_t v443 = (void *)[*(id *)(*((void *)&v666 + 1) + 8 * v442) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6ULCAState:v443];

        ++v442;
      }
      while (v440 != v442);
      uint64_t v440 = [(NSMutableArray *)v438 countByEnumeratingWithState:&v666 objects:v980 count:16];
    }
    while (v440);
  }

  long long v665 = 0u;
  long long v664 = 0u;
  long long v663 = 0u;
  long long v662 = 0u;
  uint64_t v444 = self->_cellularPowerLogNRsub6TxPowers;
  uint64_t v445 = [(NSMutableArray *)v444 countByEnumeratingWithState:&v662 objects:v979 count:16];
  if (v445)
  {
    uint64_t v446 = v445;
    uint64_t v447 = *(void *)v663;
    do
    {
      uint64_t v448 = 0;
      do
      {
        if (*(void *)v663 != v447) {
          objc_enumerationMutation(v444);
        }
        uint64_t v449 = (void *)[*(id *)(*((void *)&v662 + 1) + 8 * v448) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6TxPower:v449];

        ++v448;
      }
      while (v446 != v448);
      uint64_t v446 = [(NSMutableArray *)v444 countByEnumeratingWithState:&v662 objects:v979 count:16];
    }
    while (v446);
  }

  long long v661 = 0u;
  long long v660 = 0u;
  long long v659 = 0u;
  long long v658 = 0u;
  uint64_t v450 = self->_cellularPowerLogNRsub6RxDiversitys;
  uint64_t v451 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v658 objects:v978 count:16];
  if (v451)
  {
    uint64_t v452 = v451;
    uint64_t v453 = *(void *)v659;
    do
    {
      uint64_t v454 = 0;
      do
      {
        if (*(void *)v659 != v453) {
          objc_enumerationMutation(v450);
        }
        uint64_t v455 = (void *)[*(id *)(*((void *)&v658 + 1) + 8 * v454) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6RxDiversity:v455];

        ++v454;
      }
      while (v452 != v454);
      uint64_t v452 = [(NSMutableArray *)v450 countByEnumeratingWithState:&v658 objects:v978 count:16];
    }
    while (v452);
  }

  long long v657 = 0u;
  long long v656 = 0u;
  long long v655 = 0u;
  long long v654 = 0u;
  uint64_t v456 = self->_cellularPowerLogSPMIs;
  uint64_t v457 = [(NSMutableArray *)v456 countByEnumeratingWithState:&v654 objects:v977 count:16];
  if (v457)
  {
    uint64_t v458 = v457;
    uint64_t v459 = *(void *)v655;
    do
    {
      uint64_t v460 = 0;
      do
      {
        if (*(void *)v655 != v459) {
          objc_enumerationMutation(v456);
        }
        uint64_t v461 = (void *)[*(id *)(*((void *)&v654 + 1) + 8 * v460) copyWithZone:a3];
        [v5 addCellularPowerLogSPMI:v461];

        ++v460;
      }
      while (v458 != v460);
      uint64_t v458 = [(NSMutableArray *)v456 countByEnumeratingWithState:&v654 objects:v977 count:16];
    }
    while (v458);
  }

  long long v653 = 0u;
  long long v652 = 0u;
  long long v651 = 0u;
  long long v650 = 0u;
  uint64_t v462 = self->_cellularPowerLogNRmmWaveBWPs;
  uint64_t v463 = [(NSMutableArray *)v462 countByEnumeratingWithState:&v650 objects:v976 count:16];
  if (v463)
  {
    uint64_t v464 = v463;
    uint64_t v465 = *(void *)v651;
    do
    {
      uint64_t v466 = 0;
      do
      {
        if (*(void *)v651 != v465) {
          objc_enumerationMutation(v462);
        }
        uint64_t v467 = (void *)[*(id *)(*((void *)&v650 + 1) + 8 * v466) copyWithZone:a3];
        [v5 addCellularPowerLogNRmmWaveBWP:v467];

        ++v466;
      }
      while (v464 != v466);
      uint64_t v464 = [(NSMutableArray *)v462 countByEnumeratingWithState:&v650 objects:v976 count:16];
    }
    while (v464);
  }

  long long v649 = 0u;
  long long v648 = 0u;
  long long v647 = 0u;
  long long v646 = 0u;
  uint64_t v468 = self->_cellularPowerLogNRmmWaveAntennaPanels;
  uint64_t v469 = [(NSMutableArray *)v468 countByEnumeratingWithState:&v646 objects:v975 count:16];
  if (v469)
  {
    uint64_t v470 = v469;
    uint64_t v471 = *(void *)v647;
    do
    {
      uint64_t v472 = 0;
      do
      {
        if (*(void *)v647 != v471) {
          objc_enumerationMutation(v468);
        }
        uint64_t v473 = (void *)[*(id *)(*((void *)&v646 + 1) + 8 * v472) copyWithZone:a3];
        [v5 addCellularPowerLogNRmmWaveAntennaPanel:v473];

        ++v472;
      }
      while (v470 != v472);
      uint64_t v470 = [(NSMutableArray *)v468 countByEnumeratingWithState:&v646 objects:v975 count:16];
    }
    while (v470);
  }

  long long v645 = 0u;
  long long v644 = 0u;
  long long v643 = 0u;
  long long v642 = 0u;
  uint64_t v474 = self->_cellularPowerLogNRFRCoverages;
  uint64_t v475 = [(NSMutableArray *)v474 countByEnumeratingWithState:&v642 objects:v974 count:16];
  if (v475)
  {
    uint64_t v476 = v475;
    uint64_t v477 = *(void *)v643;
    do
    {
      uint64_t v478 = 0;
      do
      {
        if (*(void *)v643 != v477) {
          objc_enumerationMutation(v474);
        }
        uint64_t v479 = (void *)[*(id *)(*((void *)&v642 + 1) + 8 * v478) copyWithZone:a3];
        [v5 addCellularPowerLogNRFRCoverage:v479];

        ++v478;
      }
      while (v476 != v478);
      uint64_t v476 = [(NSMutableArray *)v474 countByEnumeratingWithState:&v642 objects:v974 count:16];
    }
    while (v476);
  }

  long long v640 = 0u;
  long long v641 = 0u;
  long long v638 = 0u;
  long long v639 = 0u;
  long long v480 = self->_cellularPowerLogNRmmWaveBeamIDs;
  uint64_t v481 = [(NSMutableArray *)v480 countByEnumeratingWithState:&v638 objects:v973 count:16];
  if (v481)
  {
    uint64_t v482 = v481;
    uint64_t v483 = *(void *)v639;
    do
    {
      uint64_t v484 = 0;
      do
      {
        if (*(void *)v639 != v483) {
          objc_enumerationMutation(v480);
        }
        long long v485 = (void *)[*(id *)(*((void *)&v638 + 1) + 8 * v484) copyWithZone:a3];
        [v5 addCellularPowerLogNRmmWaveBeamID:v485];

        ++v484;
      }
      while (v482 != v484);
      uint64_t v482 = [(NSMutableArray *)v480 countByEnumeratingWithState:&v638 objects:v973 count:16];
    }
    while (v482);
  }

  long long v636 = 0u;
  long long v637 = 0u;
  long long v634 = 0u;
  long long v635 = 0u;
  long long v486 = self->_cellularPowerLogSFTStates;
  uint64_t v487 = [(NSMutableArray *)v486 countByEnumeratingWithState:&v634 objects:v972 count:16];
  if (v487)
  {
    uint64_t v488 = v487;
    uint64_t v489 = *(void *)v635;
    do
    {
      uint64_t v490 = 0;
      do
      {
        if (*(void *)v635 != v489) {
          objc_enumerationMutation(v486);
        }
        long long v491 = (void *)[*(id *)(*((void *)&v634 + 1) + 8 * v490) copyWithZone:a3];
        [v5 addCellularPowerLogSFTState:v491];

        ++v490;
      }
      while (v488 != v490);
      uint64_t v488 = [(NSMutableArray *)v486 countByEnumeratingWithState:&v634 objects:v972 count:16];
    }
    while (v488);
  }

  long long v632 = 0u;
  long long v633 = 0u;
  long long v630 = 0u;
  long long v631 = 0u;
  long long v492 = self->_cellularPowerLogNRmmWaveCASCCConfigureds;
  uint64_t v493 = [(NSMutableArray *)v492 countByEnumeratingWithState:&v630 objects:v971 count:16];
  if (v493)
  {
    uint64_t v494 = v493;
    uint64_t v495 = *(void *)v631;
    do
    {
      uint64_t v496 = 0;
      do
      {
        if (*(void *)v631 != v495) {
          objc_enumerationMutation(v492);
        }
        long long v497 = (void *)[*(id *)(*((void *)&v630 + 1) + 8 * v496) copyWithZone:a3];
        [v5 addCellularPowerLogNRmmWaveCASCCConfigured:v497];

        ++v496;
      }
      while (v494 != v496);
      uint64_t v494 = [(NSMutableArray *)v492 countByEnumeratingWithState:&v630 objects:v971 count:16];
    }
    while (v494);
  }

  long long v628 = 0u;
  long long v629 = 0u;
  long long v626 = 0u;
  long long v627 = 0u;
  long long v498 = self->_cellularPowerLogNRmmWaveCASCCActivateds;
  uint64_t v499 = [(NSMutableArray *)v498 countByEnumeratingWithState:&v626 objects:v970 count:16];
  if (v499)
  {
    uint64_t v500 = v499;
    uint64_t v501 = *(void *)v627;
    do
    {
      uint64_t v502 = 0;
      do
      {
        if (*(void *)v627 != v501) {
          objc_enumerationMutation(v498);
        }
        long long v503 = (void *)[*(id *)(*((void *)&v626 + 1) + 8 * v502) copyWithZone:a3];
        [v5 addCellularPowerLogNRmmWaveCASCCActivated:v503];

        ++v502;
      }
      while (v500 != v502);
      uint64_t v500 = [(NSMutableArray *)v498 countByEnumeratingWithState:&v626 objects:v970 count:16];
    }
    while (v500);
  }

  long long v624 = 0u;
  long long v625 = 0u;
  long long v622 = 0u;
  long long v623 = 0u;
  long long v504 = self->_cellularPowerLogNRmmWaveRxTxs;
  uint64_t v505 = [(NSMutableArray *)v504 countByEnumeratingWithState:&v622 objects:v969 count:16];
  if (v505)
  {
    uint64_t v506 = v505;
    uint64_t v507 = *(void *)v623;
    do
    {
      uint64_t v508 = 0;
      do
      {
        if (*(void *)v623 != v507) {
          objc_enumerationMutation(v504);
        }
        long long v509 = (void *)[*(id *)(*((void *)&v622 + 1) + 8 * v508) copyWithZone:a3];
        [v5 addCellularPowerLogNRmmWaveRxTx:v509];

        ++v508;
      }
      while (v506 != v508);
      uint64_t v506 = [(NSMutableArray *)v504 countByEnumeratingWithState:&v622 objects:v969 count:16];
    }
    while (v506);
  }

  long long v620 = 0u;
  long long v621 = 0u;
  long long v618 = 0u;
  long long v619 = 0u;
  long long v510 = self->_cellularPowerLogNRmmWaveCarrierComponentInfos;
  uint64_t v511 = [(NSMutableArray *)v510 countByEnumeratingWithState:&v618 objects:v968 count:16];
  if (v511)
  {
    uint64_t v512 = v511;
    uint64_t v513 = *(void *)v619;
    do
    {
      uint64_t v514 = 0;
      do
      {
        if (*(void *)v619 != v513) {
          objc_enumerationMutation(v510);
        }
        long long v515 = (void *)[*(id *)(*((void *)&v618 + 1) + 8 * v514) copyWithZone:a3];
        [v5 addCellularPowerLogNRmmWaveCarrierComponentInfo:v515];

        ++v514;
      }
      while (v512 != v514);
      uint64_t v512 = [(NSMutableArray *)v510 countByEnumeratingWithState:&v618 objects:v968 count:16];
    }
    while (v512);
  }

  long long v616 = 0u;
  long long v617 = 0u;
  long long v614 = 0u;
  long long v615 = 0u;
  long long v516 = self->_cellularPowerLogNRmmWaveDLTBSs;
  uint64_t v517 = [(NSMutableArray *)v516 countByEnumeratingWithState:&v614 objects:v967 count:16];
  if (v517)
  {
    uint64_t v518 = v517;
    uint64_t v519 = *(void *)v615;
    do
    {
      uint64_t v520 = 0;
      do
      {
        if (*(void *)v615 != v519) {
          objc_enumerationMutation(v516);
        }
        long long v521 = (void *)[*(id *)(*((void *)&v614 + 1) + 8 * v520) copyWithZone:a3];
        [v5 addCellularPowerLogNRmmWaveDLTBS:v521];

        ++v520;
      }
      while (v518 != v520);
      uint64_t v518 = [(NSMutableArray *)v516 countByEnumeratingWithState:&v614 objects:v967 count:16];
    }
    while (v518);
  }

  long long v612 = 0u;
  long long v613 = 0u;
  long long v610 = 0u;
  long long v611 = 0u;
  long long v522 = self->_cellularPowerLogNRMmWaveRSRPs;
  uint64_t v523 = [(NSMutableArray *)v522 countByEnumeratingWithState:&v610 objects:v966 count:16];
  if (v523)
  {
    uint64_t v524 = v523;
    uint64_t v525 = *(void *)v611;
    do
    {
      uint64_t v526 = 0;
      do
      {
        if (*(void *)v611 != v525) {
          objc_enumerationMutation(v522);
        }
        long long v527 = (void *)[*(id *)(*((void *)&v610 + 1) + 8 * v526) copyWithZone:a3];
        [v5 addCellularPowerLogNRMmWaveRSRP:v527];

        ++v526;
      }
      while (v524 != v526);
      uint64_t v524 = [(NSMutableArray *)v522 countByEnumeratingWithState:&v610 objects:v966 count:16];
    }
    while (v524);
  }

  long long v608 = 0u;
  long long v609 = 0u;
  long long v606 = 0u;
  long long v607 = 0u;
  long long v528 = self->_cellularPowerLogSFTRxTxs;
  uint64_t v529 = [(NSMutableArray *)v528 countByEnumeratingWithState:&v606 objects:v965 count:16];
  if (v529)
  {
    uint64_t v530 = v529;
    uint64_t v531 = *(void *)v607;
    do
    {
      uint64_t v532 = 0;
      do
      {
        if (*(void *)v607 != v531) {
          objc_enumerationMutation(v528);
        }
        long long v533 = (void *)[*(id *)(*((void *)&v606 + 1) + 8 * v532) copyWithZone:a3];
        [v5 addCellularPowerLogSFTRxTx:v533];

        ++v532;
      }
      while (v530 != v532);
      uint64_t v530 = [(NSMutableArray *)v528 countByEnumeratingWithState:&v606 objects:v965 count:16];
    }
    while (v530);
  }

  long long v604 = 0u;
  long long v605 = 0u;
  long long v602 = 0u;
  long long v603 = 0u;
  long long v534 = self->_cellularPowerLogNRMmWaveTxPowers;
  uint64_t v535 = [(NSMutableArray *)v534 countByEnumeratingWithState:&v602 objects:v964 count:16];
  if (v535)
  {
    uint64_t v536 = v535;
    uint64_t v537 = *(void *)v603;
    do
    {
      uint64_t v538 = 0;
      do
      {
        if (*(void *)v603 != v537) {
          objc_enumerationMutation(v534);
        }
        long long v539 = (void *)[*(id *)(*((void *)&v602 + 1) + 8 * v538) copyWithZone:a3];
        [v5 addCellularPowerLogNRMmWaveTxPower:v539];

        ++v538;
      }
      while (v536 != v538);
      uint64_t v536 = [(NSMutableArray *)v534 countByEnumeratingWithState:&v602 objects:v964 count:16];
    }
    while (v536);
  }

  long long v600 = 0u;
  long long v601 = 0u;
  long long v598 = 0u;
  long long v599 = 0u;
  long long v540 = self->_cellularPowerLogNRMmWaveULCAStates;
  uint64_t v541 = [(NSMutableArray *)v540 countByEnumeratingWithState:&v598 objects:v963 count:16];
  if (v541)
  {
    uint64_t v542 = v541;
    uint64_t v543 = *(void *)v599;
    do
    {
      uint64_t v544 = 0;
      do
      {
        if (*(void *)v599 != v543) {
          objc_enumerationMutation(v540);
        }
        long long v545 = (void *)[*(id *)(*((void *)&v598 + 1) + 8 * v544) copyWithZone:a3];
        [v5 addCellularPowerLogNRMmWaveULCAState:v545];

        ++v544;
      }
      while (v542 != v544);
      uint64_t v542 = [(NSMutableArray *)v540 countByEnumeratingWithState:&v598 objects:v963 count:16];
    }
    while (v542);
  }

  long long v596 = 0u;
  long long v597 = 0u;
  long long v594 = 0u;
  long long v595 = 0u;
  long long v546 = self->_cellularPowerLogNRsub6BWPSCCs;
  uint64_t v547 = [(NSMutableArray *)v546 countByEnumeratingWithState:&v594 objects:v962 count:16];
  if (v547)
  {
    uint64_t v548 = v547;
    uint64_t v549 = *(void *)v595;
    do
    {
      uint64_t v550 = 0;
      do
      {
        if (*(void *)v595 != v549) {
          objc_enumerationMutation(v546);
        }
        long long v551 = (void *)[*(id *)(*((void *)&v594 + 1) + 8 * v550) copyWithZone:a3];
        [v5 addCellularPowerLogNRsub6BWPSCC:v551];

        ++v550;
      }
      while (v548 != v550);
      uint64_t v548 = [(NSMutableArray *)v546 countByEnumeratingWithState:&v594 objects:v962 count:16];
    }
    while (v548);
  }

  long long v592 = 0u;
  long long v593 = 0u;
  long long v590 = 0u;
  long long v591 = 0u;
  long long v552 = self->_cellularPowerLogNRmmWaveBWPSCCs;
  uint64_t v553 = [(NSMutableArray *)v552 countByEnumeratingWithState:&v590 objects:v961 count:16];
  if (v553)
  {
    uint64_t v554 = v553;
    uint64_t v555 = *(void *)v591;
    do
    {
      uint64_t v556 = 0;
      do
      {
        if (*(void *)v591 != v555) {
          objc_enumerationMutation(v552);
        }
        long long v557 = (void *)[*(id *)(*((void *)&v590 + 1) + 8 * v556) copyWithZone:a3];
        [v5 addCellularPowerLogNRmmWaveBWPSCC:v557];

        ++v556;
      }
      while (v554 != v556);
      uint64_t v554 = [(NSMutableArray *)v552 countByEnumeratingWithState:&v590 objects:v961 count:16];
    }
    while (v554);
  }

  long long v588 = 0u;
  long long v589 = 0u;
  long long v586 = 0u;
  long long v587 = 0u;
  long long v558 = self->_cellularPowerLogNRDCEvents;
  uint64_t v559 = [(NSMutableArray *)v558 countByEnumeratingWithState:&v586 objects:v960 count:16];
  if (v559)
  {
    uint64_t v560 = v559;
    uint64_t v561 = *(void *)v587;
    do
    {
      uint64_t v562 = 0;
      do
      {
        if (*(void *)v587 != v561) {
          objc_enumerationMutation(v558);
        }
        long long v563 = (void *)[*(id *)(*((void *)&v586 + 1) + 8 * v562) copyWithZone:a3];
        [v5 addCellularPowerLogNRDCEvent:v563];

        ++v562;
      }
      while (v560 != v562);
      uint64_t v560 = [(NSMutableArray *)v558 countByEnumeratingWithState:&v586 objects:v960 count:16];
    }
    while (v560);
  }

  long long v584 = 0u;
  long long v585 = 0u;
  long long v582 = 0u;
  long long v583 = 0u;
  long long v564 = self->_cellularPowerLogWUSs;
  uint64_t v565 = [(NSMutableArray *)v564 countByEnumeratingWithState:&v582 objects:v959 count:16];
  if (v565)
  {
    uint64_t v566 = v565;
    uint64_t v567 = *(void *)v583;
    do
    {
      uint64_t v568 = 0;
      do
      {
        if (*(void *)v583 != v567) {
          objc_enumerationMutation(v564);
        }
        long long v569 = (void *)[*(id *)(*((void *)&v582 + 1) + 8 * v568) copyWithZone:a3];
        [v5 addCellularPowerLogWUS:v569];

        ++v568;
      }
      while (v566 != v568);
      uint64_t v566 = [(NSMutableArray *)v564 countByEnumeratingWithState:&v582 objects:v959 count:16];
    }
    while (v566);
  }

  long long v580 = 0u;
  long long v581 = 0u;
  long long v578 = 0u;
  long long v579 = 0u;
  long long v570 = self->_cellularPowerLogNRsub6BWPSAs;
  uint64_t v571 = [(NSMutableArray *)v570 countByEnumeratingWithState:&v578 objects:v958 count:16];
  if (v571)
  {
    uint64_t v572 = v571;
    uint64_t v573 = *(void *)v579;
    do
    {
      uint64_t v574 = 0;
      do
      {
        if (*(void *)v579 != v573) {
          objc_enumerationMutation(v570);
        }
        long long v575 = objc_msgSend(*(id *)(*((void *)&v578 + 1) + 8 * v574), "copyWithZone:", a3, (void)v578);
        [v5 addCellularPowerLogNRsub6BWPSA:v575];

        ++v574;
      }
      while (v572 != v574);
      uint64_t v572 = [(NSMutableArray *)v570 countByEnumeratingWithState:&v578 objects:v958 count:16];
    }
    while (v572);
  }

  id v576 = v5;
  return v576;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_192;
  }
  cellularPerClientProfileTriggerCounts = self->_cellularPerClientProfileTriggerCounts;
  if ((unint64_t)cellularPerClientProfileTriggerCounts | v4[4])
  {
    if (!-[NSMutableArray isEqual:](cellularPerClientProfileTriggerCounts, "isEqual:")) {
      goto LABEL_192;
    }
  }
  cellularNrSDMActivations = self->_cellularNrSDMActivations;
  if ((unint64_t)cellularNrSDMActivations | v4[2]
    && !-[NSMutableArray isEqual:](cellularNrSDMActivations, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularNrSdmEndcReleases = self->_cellularNrSdmEndcReleases;
  if ((unint64_t)cellularNrSdmEndcReleases | v4[3]
    && !-[NSMutableArray isEqual:](cellularNrSdmEndcReleases, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularDynamicRatSelections = self->_cellularDynamicRatSelections;
  if ((unint64_t)cellularDynamicRatSelections | v4[1]
    && !-[NSMutableArray isEqual:](cellularDynamicRatSelections, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogXOShutdowns = self->_cellularPowerLogXOShutdowns;
  if ((unint64_t)cellularPowerLogXOShutdowns | v4[95]
    && !-[NSMutableArray isEqual:](cellularPowerLogXOShutdowns, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogAPPSPerfLevels = self->_cellularPowerLogAPPSPerfLevels;
  if ((unint64_t)cellularPowerLogAPPSPerfLevels | v4[7]
    && !-[NSMutableArray isEqual:](cellularPowerLogAPPSPerfLevels, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogAPPSCXOShutdowns = self->_cellularPowerLogAPPSCXOShutdowns;
  if ((unint64_t)cellularPowerLogAPPSCXOShutdowns | v4[6]
    && !-[NSMutableArray isEqual:](cellularPowerLogAPPSCXOShutdowns, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogAPPSSleepVetos = self->_cellularPowerLogAPPSSleepVetos;
  if ((unint64_t)cellularPowerLogAPPSSleepVetos | v4[8]
    && !-[NSMutableArray isEqual:](cellularPowerLogAPPSSleepVetos, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogMCPMSleepVetos = self->_cellularPowerLogMCPMSleepVetos;
  if ((unint64_t)cellularPowerLogMCPMSleepVetos | v4[39]
    && !-[NSMutableArray isEqual:](cellularPowerLogMCPMSleepVetos, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogMPSSPerfLevels = self->_cellularPowerLogMPSSPerfLevels;
  if ((unint64_t)cellularPowerLogMPSSPerfLevels | v4[40]
    && !-[NSMutableArray isEqual:](cellularPowerLogMPSSPerfLevels, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogGPSStates = self->_cellularPowerLogGPSStates;
  if ((unint64_t)cellularPowerLogGPSStates | v4[17]
    && !-[NSMutableArray isEqual:](cellularPowerLogGPSStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogAOPUARTStates = self->_cellularPowerLogAOPUARTStates;
  if ((unint64_t)cellularPowerLogAOPUARTStates | v4[5]
    && !-[NSMutableArray isEqual:](cellularPowerLogAOPUARTStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogWLANUARTStates = self->_cellularPowerLogWLANUARTStates;
  if ((unint64_t)cellularPowerLogWLANUARTStates | v4[93]
    && !-[NSMutableArray isEqual:](cellularPowerLogWLANUARTStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogPCIeStates = self->_cellularPowerLogPCIeStates;
  if ((unint64_t)cellularPowerLogPCIeStates | v4[72]
    && !-[NSMutableArray isEqual:](cellularPowerLogPCIeStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogL1SleepStates = self->_cellularPowerLogL1SleepStates;
  if ((unint64_t)cellularPowerLogL1SleepStates | v4[25]
    && !-[NSMutableArray isEqual:](cellularPowerLogL1SleepStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTEConfiguredCASCCStates = self->_cellularPowerLogLTEConfiguredCASCCStates;
  if ((unint64_t)cellularPowerLogLTEConfiguredCASCCStates | v4[30]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTEConfiguredCASCCStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTEActivatedCASCCStates = self->_cellularPowerLogLTEActivatedCASCCStates;
  if ((unint64_t)cellularPowerLogLTEActivatedCASCCStates | v4[26]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTEActivatedCASCCStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTERxTxActivityStates = self->_cellularPowerLogLTERxTxActivityStates;
  if ((unint64_t)cellularPowerLogLTERxTxActivityStates | v4[35]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTERxTxActivityStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTECarrierComponentInfos = self->_cellularPowerLogLTECarrierComponentInfos;
  if ((unint64_t)cellularPowerLogLTECarrierComponentInfos | v4[29]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTECarrierComponentInfos, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTEAggregatedDLTBSs = self->_cellularPowerLogLTEAggregatedDLTBSs;
  if ((unint64_t)cellularPowerLogLTEAggregatedDLTBSs | v4[27]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTEAggregatedDLTBSs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTERSRPs = self->_cellularPowerLogLTERSRPs;
  if ((unint64_t)cellularPowerLogLTERSRPs | v4[33]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTERSRPs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTESINRs = self->_cellularPowerLogLTESINRs;
  if ((unint64_t)cellularPowerLogLTESINRs | v4[36]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTESINRs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTETxPowers = self->_cellularPowerLogLTETxPowers;
  if ((unint64_t)cellularPowerLogLTETxPowers | v4[37]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTETxPowers, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTERxDiversitys = self->_cellularPowerLogLTERxDiversitys;
  if ((unint64_t)cellularPowerLogLTERxDiversitys | v4[34]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTERxDiversitys, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTEULCAStates = self->_cellularPowerLogLTEULCAStates;
  if ((unint64_t)cellularPowerLogLTEULCAStates | v4[38]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTEULCAStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogPowerEstimators = self->_cellularPowerLogPowerEstimators;
  if ((unint64_t)cellularPowerLogPowerEstimators | v4[76]
    && !-[NSMutableArray isEqual:](cellularPowerLogPowerEstimators, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTEPagingDRXCycles = self->_cellularPowerLogLTEPagingDRXCycles;
  if ((unint64_t)cellularPowerLogLTEPagingDRXCycles | v4[31]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTEPagingDRXCycles, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRPagingDRXCycles = self->_cellularPowerLogNRPagingDRXCycles;
  if ((unint64_t)cellularPowerLogNRPagingDRXCycles | v4[48]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRPagingDRXCycles, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogProtocolStates = self->_cellularPowerLogProtocolStates;
  if ((unint64_t)cellularPowerLogProtocolStates | v4[77]
    && !-[NSMutableArray isEqual:](cellularPowerLogProtocolStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogPLMNSearchs = self->_cellularPowerLogPLMNSearchs;
  if ((unint64_t)cellularPowerLogPLMNSearchs | v4[75]
    && !-[NSMutableArray isEqual:](cellularPowerLogPLMNSearchs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogGSMTxPowers = self->_cellularPowerLogGSMTxPowers;
  if ((unint64_t)cellularPowerLogGSMTxPowers | v4[22]
    && !-[NSMutableArray isEqual:](cellularPowerLogGSMTxPowers, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogGSMRxRSSIs = self->_cellularPowerLogGSMRxRSSIs;
  if ((unint64_t)cellularPowerLogGSMRxRSSIs | v4[21]
    && !-[NSMutableArray isEqual:](cellularPowerLogGSMRxRSSIs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogGSMRABModes = self->_cellularPowerLogGSMRABModes;
  if ((unint64_t)cellularPowerLogGSMRABModes | v4[18]
    && !-[NSMutableArray isEqual:](cellularPowerLogGSMRABModes, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogGSMRxDiversitys = self->_cellularPowerLogGSMRxDiversitys;
  if ((unint64_t)cellularPowerLogGSMRxDiversitys | v4[20]
    && !-[NSMutableArray isEqual:](cellularPowerLogGSMRxDiversitys, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogWCDMATxPowers = self->_cellularPowerLogWCDMATxPowers;
  if ((unint64_t)cellularPowerLogWCDMATxPowers | v4[92]
    && !-[NSMutableArray isEqual:](cellularPowerLogWCDMATxPowers, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogWCDMARxRSSIs = self->_cellularPowerLogWCDMARxRSSIs;
  if ((unint64_t)cellularPowerLogWCDMARxRSSIs | v4[91]
    && !-[NSMutableArray isEqual:](cellularPowerLogWCDMARxRSSIs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRSCGRels = self->_cellularPowerLogNRSCGRels;
  if ((unint64_t)cellularPowerLogNRSCGRels | v4[50]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRSCGRels, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogWCDMARxDiversitys = self->_cellularPowerLogWCDMARxDiversitys;
  if ((unint64_t)cellularPowerLogWCDMARxDiversitys | v4[90]
    && !-[NSMutableArray isEqual:](cellularPowerLogWCDMARxDiversitys, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogWCDMARABModes = self->_cellularPowerLogWCDMARABModes;
  if ((unint64_t)cellularPowerLogWCDMARABModes | v4[87]
    && !-[NSMutableArray isEqual:](cellularPowerLogWCDMARABModes, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogWCDMARABTypes = self->_cellularPowerLogWCDMARABTypes;
  if ((unint64_t)cellularPowerLogWCDMARABTypes | v4[88]
    && !-[NSMutableArray isEqual:](cellularPowerLogWCDMARABTypes, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogEVDOTxPowers = self->_cellularPowerLogEVDOTxPowers;
  if ((unint64_t)cellularPowerLogEVDOTxPowers | v4[16]
    && !-[NSMutableArray isEqual:](cellularPowerLogEVDOTxPowers, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogEVDORxRSSIs = self->_cellularPowerLogEVDORxRSSIs;
  if ((unint64_t)cellularPowerLogEVDORxRSSIs | v4[15]
    && !-[NSMutableArray isEqual:](cellularPowerLogEVDORxRSSIs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogHybridRABModes = self->_cellularPowerLogHybridRABModes;
  if ((unint64_t)cellularPowerLogHybridRABModes | v4[23]
    && !-[NSMutableArray isEqual:](cellularPowerLogHybridRABModes, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogEVDORxDiversitys = self->_cellularPowerLogEVDORxDiversitys;
  if ((unint64_t)cellularPowerLogEVDORxDiversitys | v4[14]
    && !-[NSMutableArray isEqual:](cellularPowerLogEVDORxDiversitys, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogCDMA1XTxPowers = self->_cellularPowerLogCDMA1XTxPowers;
  if ((unint64_t)cellularPowerLogCDMA1XTxPowers | v4[13]
    && !-[NSMutableArray isEqual:](cellularPowerLogCDMA1XTxPowers, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogCDMA1XRxRSSIs = self->_cellularPowerLogCDMA1XRxRSSIs;
  if ((unint64_t)cellularPowerLogCDMA1XRxRSSIs | v4[12]
    && !-[NSMutableArray isEqual:](cellularPowerLogCDMA1XRxRSSIs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogCDMA1XRABModes = self->_cellularPowerLogCDMA1XRABModes;
  if ((unint64_t)cellularPowerLogCDMA1XRABModes | v4[9]
    && !-[NSMutableArray isEqual:](cellularPowerLogCDMA1XRABModes, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogCDMA1XRxDiversitys = self->_cellularPowerLogCDMA1XRxDiversitys;
  if ((unint64_t)cellularPowerLogCDMA1XRxDiversitys | v4[11]
    && !-[NSMutableArray isEqual:](cellularPowerLogCDMA1XRxDiversitys, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogWCDMACDRXConfigs = self->_cellularPowerLogWCDMACDRXConfigs;
  if ((unint64_t)cellularPowerLogWCDMACDRXConfigs | v4[86]
    && !-[NSMutableArray isEqual:](cellularPowerLogWCDMACDRXConfigs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTECDRXConfigs = self->_cellularPowerLogLTECDRXConfigs;
  if ((unint64_t)cellularPowerLogLTECDRXConfigs | v4[28]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTECDRXConfigs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogWCDMARRCStateChanges = self->_cellularPowerLogWCDMARRCStateChanges;
  if ((unint64_t)cellularPowerLogWCDMARRCStateChanges | v4[89]
    && !-[NSMutableArray isEqual:](cellularPowerLogWCDMARRCStateChanges, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogLTERRCStateChanges = self->_cellularPowerLogLTERRCStateChanges;
  if ((unint64_t)cellularPowerLogLTERRCStateChanges | v4[32]
    && !-[NSMutableArray isEqual:](cellularPowerLogLTERRCStateChanges, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogSystemEvents = self->_cellularPowerLogSystemEvents;
  if ((unint64_t)cellularPowerLogSystemEvents | v4[85]
    && !-[NSMutableArray isEqual:](cellularPowerLogSystemEvents, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogRATReselectionEvents = self->_cellularPowerLogRATReselectionEvents;
  if ((unint64_t)cellularPowerLogRATReselectionEvents | v4[79]
    && !-[NSMutableArray isEqual:](cellularPowerLogRATReselectionEvents, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogRATRedirectionEvents = self->_cellularPowerLogRATRedirectionEvents;
  if ((unint64_t)cellularPowerLogRATRedirectionEvents | v4[78]
    && !-[NSMutableArray isEqual:](cellularPowerLogRATRedirectionEvents, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogGSMRRCStateChanges = self->_cellularPowerLogGSMRRCStateChanges;
  if ((unint64_t)cellularPowerLogGSMRRCStateChanges | v4[19]
    && !-[NSMutableArray isEqual:](cellularPowerLogGSMRRCStateChanges, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogCDMA1XRRCStateChanges = self->_cellularPowerLogCDMA1XRRCStateChanges;
  if ((unint64_t)cellularPowerLogCDMA1XRRCStateChanges | v4[10]
    && !-[NSMutableArray isEqual:](cellularPowerLogCDMA1XRRCStateChanges, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogHybridRRCStateChanges = self->_cellularPowerLogHybridRRCStateChanges;
  if ((unint64_t)cellularPowerLogHybridRRCStateChanges | v4[24]
    && !-[NSMutableArray isEqual:](cellularPowerLogHybridRRCStateChanges, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogServiceStateEvents = self->_cellularPowerLogServiceStateEvents;
  if ((unint64_t)cellularPowerLogServiceStateEvents | v4[84]
    && !-[NSMutableArray isEqual:](cellularPowerLogServiceStateEvents, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogPLMNScanEvents = self->_cellularPowerLogPLMNScanEvents;
  if ((unint64_t)cellularPowerLogPLMNScanEvents | v4[73]
    && !-[NSMutableArray isEqual:](cellularPowerLogPLMNScanEvents, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogPLMNSearchEvents = self->_cellularPowerLogPLMNSearchEvents;
  if ((unint64_t)cellularPowerLogPLMNSearchEvents | v4[74]
    && !-[NSMutableArray isEqual:](cellularPowerLogPLMNSearchEvents, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRSARRCStateChanges = self->_cellularPowerLogNRSARRCStateChanges;
  if ((unint64_t)cellularPowerLogNRSARRCStateChanges | v4[49]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRSARRCStateChanges, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRNSAENDCEvents = self->_cellularPowerLogNRNSAENDCEvents;
  if ((unint64_t)cellularPowerLogNRNSAENDCEvents | v4[47]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRNSAENDCEvents, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRCDRXConfigs = self->_cellularPowerLogNRCDRXConfigs;
  if ((unint64_t)cellularPowerLogNRCDRXConfigs | v4[41]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRCDRXConfigs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6BWPs = self->_cellularPowerLogNRsub6BWPs;
  if ((unint64_t)cellularPowerLogNRsub6BWPs | v4[62]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6BWPs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogRFTunerStatsHists = self->_cellularPowerLogRFTunerStatsHists;
  if ((unint64_t)cellularPowerLogRFTunerStatsHists | v4[80]
    && !-[NSMutableArray isEqual:](cellularPowerLogRFTunerStatsHists, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6CASCCConfigureds = self->_cellularPowerLogNRsub6CASCCConfigureds;
  if ((unint64_t)cellularPowerLogNRsub6CASCCConfigureds | v4[64]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6CASCCConfigureds, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6CASCCActivateds = self->_cellularPowerLogNRsub6CASCCActivateds;
  if ((unint64_t)cellularPowerLogNRsub6CASCCActivateds | v4[63]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6CASCCActivateds, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6RxTxs = self->_cellularPowerLogNRsub6RxTxs;
  if ((unint64_t)cellularPowerLogNRsub6RxTxs | v4[69]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6RxTxs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6CarrierComponentInfos = self->_cellularPowerLogNRsub6CarrierComponentInfos;
  if ((unint64_t)cellularPowerLogNRsub6CarrierComponentInfos | v4[65]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6CarrierComponentInfos, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6DLTBSs = self->_cellularPowerLogNRsub6DLTBSs;
  if ((unint64_t)cellularPowerLogNRsub6DLTBSs | v4[66]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6DLTBSs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6RSRPs = self->_cellularPowerLogNRsub6RSRPs;
  if ((unint64_t)cellularPowerLogNRsub6RSRPs | v4[67]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6RSRPs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6ULCAStates = self->_cellularPowerLogNRsub6ULCAStates;
  if ((unint64_t)cellularPowerLogNRsub6ULCAStates | v4[71]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6ULCAStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6TxPowers = self->_cellularPowerLogNRsub6TxPowers;
  if ((unint64_t)cellularPowerLogNRsub6TxPowers | v4[70]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6TxPowers, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRsub6RxDiversitys = self->_cellularPowerLogNRsub6RxDiversitys;
  if ((unint64_t)cellularPowerLogNRsub6RxDiversitys | v4[68]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRsub6RxDiversitys, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogSPMIs = self->_cellularPowerLogSPMIs;
  if ((unint64_t)cellularPowerLogSPMIs | v4[83]
    && !-[NSMutableArray isEqual:](cellularPowerLogSPMIs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRmmWaveBWPs = self->_cellularPowerLogNRmmWaveBWPs;
  if ((unint64_t)cellularPowerLogNRmmWaveBWPs | v4[53]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRmmWaveBWPs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRmmWaveAntennaPanels = self->_cellularPowerLogNRmmWaveAntennaPanels;
  if ((unint64_t)cellularPowerLogNRmmWaveAntennaPanels | v4[51]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRmmWaveAntennaPanels, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRFRCoverages = self->_cellularPowerLogNRFRCoverages;
  if ((unint64_t)cellularPowerLogNRFRCoverages | v4[43]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRFRCoverages, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRmmWaveBeamIDs = self->_cellularPowerLogNRmmWaveBeamIDs;
  if ((unint64_t)cellularPowerLogNRmmWaveBeamIDs | v4[54]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRmmWaveBeamIDs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogSFTStates = self->_cellularPowerLogSFTStates;
  if ((unint64_t)cellularPowerLogSFTStates | v4[82]
    && !-[NSMutableArray isEqual:](cellularPowerLogSFTStates, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRmmWaveCASCCConfigureds = self->_cellularPowerLogNRmmWaveCASCCConfigureds;
  if ((unint64_t)cellularPowerLogNRmmWaveCASCCConfigureds | v4[56]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRmmWaveCASCCConfigureds, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRmmWaveCASCCActivateds = self->_cellularPowerLogNRmmWaveCASCCActivateds;
  if ((unint64_t)cellularPowerLogNRmmWaveCASCCActivateds | v4[55]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRmmWaveCASCCActivateds, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRmmWaveRxTxs = self->_cellularPowerLogNRmmWaveRxTxs;
  if ((unint64_t)cellularPowerLogNRmmWaveRxTxs | v4[59]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRmmWaveRxTxs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRmmWaveCarrierComponentInfos = self->_cellularPowerLogNRmmWaveCarrierComponentInfos;
  if ((unint64_t)cellularPowerLogNRmmWaveCarrierComponentInfos | v4[57]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRmmWaveCarrierComponentInfos, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRmmWaveDLTBSs = self->_cellularPowerLogNRmmWaveDLTBSs;
  if ((unint64_t)cellularPowerLogNRmmWaveDLTBSs | v4[58]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRmmWaveDLTBSs, "isEqual:"))
  {
    goto LABEL_192;
  }
  cellularPowerLogNRMmWaveRSRPs = self->_cellularPowerLogNRMmWaveRSRPs;
  if ((unint64_t)cellularPowerLogNRMmWaveRSRPs | v4[44]
    && !-[NSMutableArray isEqual:](cellularPowerLogNRMmWaveRSRPs, "isEqual:"))
  {
    goto LABEL_192;
  }
  if (((cellularPowerLogSFTRxTxs = self->_cellularPowerLogSFTRxTxs,
         !((unint64_t)cellularPowerLogSFTRxTxs | v4[81]))
     || -[NSMutableArray isEqual:](cellularPowerLogSFTRxTxs, "isEqual:"))
    && ((cellularPowerLogNRMmWaveTxPowers = self->_cellularPowerLogNRMmWaveTxPowers,
         !((unint64_t)cellularPowerLogNRMmWaveTxPowers | v4[45]))
     || -[NSMutableArray isEqual:](cellularPowerLogNRMmWaveTxPowers, "isEqual:"))
    && ((cellularPowerLogNRMmWaveULCAStates = self->_cellularPowerLogNRMmWaveULCAStates,
         !((unint64_t)cellularPowerLogNRMmWaveULCAStates | v4[46]))
     || -[NSMutableArray isEqual:](cellularPowerLogNRMmWaveULCAStates, "isEqual:"))
    && ((cellularPowerLogNRsub6BWPSCCs = self->_cellularPowerLogNRsub6BWPSCCs,
         !((unint64_t)cellularPowerLogNRsub6BWPSCCs | v4[61]))
     || -[NSMutableArray isEqual:](cellularPowerLogNRsub6BWPSCCs, "isEqual:"))
    && ((cellularPowerLogNRmmWaveBWPSCCs = self->_cellularPowerLogNRmmWaveBWPSCCs,
         !((unint64_t)cellularPowerLogNRmmWaveBWPSCCs | v4[52]))
     || -[NSMutableArray isEqual:](cellularPowerLogNRmmWaveBWPSCCs, "isEqual:"))
    && ((cellularPowerLogNRDCEvents = self->_cellularPowerLogNRDCEvents,
         !((unint64_t)cellularPowerLogNRDCEvents | v4[42]))
     || -[NSMutableArray isEqual:](cellularPowerLogNRDCEvents, "isEqual:"))
    && ((cellularPowerLogWUSs = self->_cellularPowerLogWUSs, !((unint64_t)cellularPowerLogWUSs | v4[94]))
     || -[NSMutableArray isEqual:](cellularPowerLogWUSs, "isEqual:")))
  {
    cellularPowerLogNRsub6BWPSAs = self->_cellularPowerLogNRsub6BWPSAs;
    if ((unint64_t)cellularPowerLogNRsub6BWPSAs | v4[60]) {
      char v100 = -[NSMutableArray isEqual:](cellularPowerLogNRsub6BWPSAs, "isEqual:");
    }
    else {
      char v100 = 1;
    }
  }
  else
  {
LABEL_192:
    char v100 = 0;
  }

  return v100;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_cellularPerClientProfileTriggerCounts hash];
  uint64_t v4 = [(NSMutableArray *)self->_cellularNrSDMActivations hash] ^ v3;
  uint64_t v5 = [(NSMutableArray *)self->_cellularNrSdmEndcReleases hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_cellularDynamicRatSelections hash];
  uint64_t v7 = [(NSMutableArray *)self->_cellularPowerLogXOShutdowns hash];
  uint64_t v8 = v7 ^ [(NSMutableArray *)self->_cellularPowerLogAPPSPerfLevels hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSMutableArray *)self->_cellularPowerLogAPPSCXOShutdowns hash];
  uint64_t v10 = [(NSMutableArray *)self->_cellularPowerLogAPPSSleepVetos hash];
  uint64_t v11 = v10 ^ [(NSMutableArray *)self->_cellularPowerLogMCPMSleepVetos hash];
  uint64_t v12 = v11 ^ [(NSMutableArray *)self->_cellularPowerLogMPSSPerfLevels hash];
  uint64_t v13 = v9 ^ v12 ^ [(NSMutableArray *)self->_cellularPowerLogGPSStates hash];
  uint64_t v14 = [(NSMutableArray *)self->_cellularPowerLogAOPUARTStates hash];
  uint64_t v15 = v14 ^ [(NSMutableArray *)self->_cellularPowerLogWLANUARTStates hash];
  uint64_t v16 = v15 ^ [(NSMutableArray *)self->_cellularPowerLogPCIeStates hash];
  uint64_t v17 = v16 ^ [(NSMutableArray *)self->_cellularPowerLogL1SleepStates hash];
  uint64_t v18 = v13 ^ v17 ^ [(NSMutableArray *)self->_cellularPowerLogLTEConfiguredCASCCStates hash];
  uint64_t v19 = [(NSMutableArray *)self->_cellularPowerLogLTEActivatedCASCCStates hash];
  uint64_t v20 = v19 ^ [(NSMutableArray *)self->_cellularPowerLogLTERxTxActivityStates hash];
  uint64_t v21 = v20 ^ [(NSMutableArray *)self->_cellularPowerLogLTECarrierComponentInfos hash];
  uint64_t v22 = v21 ^ [(NSMutableArray *)self->_cellularPowerLogLTEAggregatedDLTBSs hash];
  uint64_t v23 = v22 ^ [(NSMutableArray *)self->_cellularPowerLogLTERSRPs hash];
  uint64_t v24 = v18 ^ v23 ^ [(NSMutableArray *)self->_cellularPowerLogLTESINRs hash];
  uint64_t v25 = [(NSMutableArray *)self->_cellularPowerLogLTETxPowers hash];
  uint64_t v26 = v25 ^ [(NSMutableArray *)self->_cellularPowerLogLTERxDiversitys hash];
  uint64_t v27 = v26 ^ [(NSMutableArray *)self->_cellularPowerLogLTEULCAStates hash];
  uint64_t v28 = v27 ^ [(NSMutableArray *)self->_cellularPowerLogPowerEstimators hash];
  uint64_t v29 = v28 ^ [(NSMutableArray *)self->_cellularPowerLogLTEPagingDRXCycles hash];
  uint64_t v30 = v29 ^ [(NSMutableArray *)self->_cellularPowerLogNRPagingDRXCycles hash];
  uint64_t v31 = v24 ^ v30 ^ [(NSMutableArray *)self->_cellularPowerLogProtocolStates hash];
  uint64_t v32 = [(NSMutableArray *)self->_cellularPowerLogPLMNSearchs hash];
  uint64_t v33 = v32 ^ [(NSMutableArray *)self->_cellularPowerLogGSMTxPowers hash];
  uint64_t v34 = v33 ^ [(NSMutableArray *)self->_cellularPowerLogGSMRxRSSIs hash];
  uint64_t v35 = v34 ^ [(NSMutableArray *)self->_cellularPowerLogGSMRABModes hash];
  uint64_t v36 = v35 ^ [(NSMutableArray *)self->_cellularPowerLogGSMRxDiversitys hash];
  uint64_t v37 = v36 ^ [(NSMutableArray *)self->_cellularPowerLogWCDMATxPowers hash];
  uint64_t v38 = v37 ^ [(NSMutableArray *)self->_cellularPowerLogWCDMARxRSSIs hash];
  uint64_t v39 = v31 ^ v38 ^ [(NSMutableArray *)self->_cellularPowerLogNRSCGRels hash];
  uint64_t v40 = [(NSMutableArray *)self->_cellularPowerLogWCDMARxDiversitys hash];
  uint64_t v41 = v40 ^ [(NSMutableArray *)self->_cellularPowerLogWCDMARABModes hash];
  uint64_t v42 = v41 ^ [(NSMutableArray *)self->_cellularPowerLogWCDMARABTypes hash];
  uint64_t v43 = v42 ^ [(NSMutableArray *)self->_cellularPowerLogEVDOTxPowers hash];
  uint64_t v44 = v43 ^ [(NSMutableArray *)self->_cellularPowerLogEVDORxRSSIs hash];
  uint64_t v45 = v44 ^ [(NSMutableArray *)self->_cellularPowerLogHybridRABModes hash];
  uint64_t v46 = v45 ^ [(NSMutableArray *)self->_cellularPowerLogEVDORxDiversitys hash];
  uint64_t v47 = v46 ^ [(NSMutableArray *)self->_cellularPowerLogCDMA1XTxPowers hash];
  uint64_t v48 = v39 ^ v47 ^ [(NSMutableArray *)self->_cellularPowerLogCDMA1XRxRSSIs hash];
  uint64_t v49 = [(NSMutableArray *)self->_cellularPowerLogCDMA1XRABModes hash];
  uint64_t v50 = v49 ^ [(NSMutableArray *)self->_cellularPowerLogCDMA1XRxDiversitys hash];
  uint64_t v51 = v50 ^ [(NSMutableArray *)self->_cellularPowerLogWCDMACDRXConfigs hash];
  uint64_t v52 = v51 ^ [(NSMutableArray *)self->_cellularPowerLogLTECDRXConfigs hash];
  uint64_t v53 = v52 ^ [(NSMutableArray *)self->_cellularPowerLogWCDMARRCStateChanges hash];
  uint64_t v54 = v53 ^ [(NSMutableArray *)self->_cellularPowerLogLTERRCStateChanges hash];
  uint64_t v55 = v54 ^ [(NSMutableArray *)self->_cellularPowerLogSystemEvents hash];
  uint64_t v56 = v55 ^ [(NSMutableArray *)self->_cellularPowerLogRATReselectionEvents hash];
  uint64_t v57 = v56 ^ [(NSMutableArray *)self->_cellularPowerLogRATRedirectionEvents hash];
  uint64_t v58 = v48 ^ v57 ^ [(NSMutableArray *)self->_cellularPowerLogGSMRRCStateChanges hash];
  uint64_t v59 = [(NSMutableArray *)self->_cellularPowerLogCDMA1XRRCStateChanges hash];
  uint64_t v60 = v59 ^ [(NSMutableArray *)self->_cellularPowerLogHybridRRCStateChanges hash];
  uint64_t v61 = v60 ^ [(NSMutableArray *)self->_cellularPowerLogServiceStateEvents hash];
  uint64_t v62 = v61 ^ [(NSMutableArray *)self->_cellularPowerLogPLMNScanEvents hash];
  uint64_t v63 = v62 ^ [(NSMutableArray *)self->_cellularPowerLogPLMNSearchEvents hash];
  uint64_t v64 = v63 ^ [(NSMutableArray *)self->_cellularPowerLogNRSARRCStateChanges hash];
  uint64_t v65 = v64 ^ [(NSMutableArray *)self->_cellularPowerLogNRNSAENDCEvents hash];
  uint64_t v66 = v65 ^ [(NSMutableArray *)self->_cellularPowerLogNRCDRXConfigs hash];
  uint64_t v67 = v66 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6BWPs hash];
  uint64_t v68 = v67 ^ [(NSMutableArray *)self->_cellularPowerLogRFTunerStatsHists hash];
  uint64_t v69 = v58 ^ v68 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6CASCCConfigureds hash];
  uint64_t v70 = [(NSMutableArray *)self->_cellularPowerLogNRsub6CASCCActivateds hash];
  uint64_t v71 = v70 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6RxTxs hash];
  uint64_t v72 = v71 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6CarrierComponentInfos hash];
  uint64_t v73 = v72 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6DLTBSs hash];
  uint64_t v74 = v73 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6RSRPs hash];
  uint64_t v75 = v74 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6ULCAStates hash];
  uint64_t v76 = v75 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6TxPowers hash];
  uint64_t v77 = v76 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6RxDiversitys hash];
  uint64_t v78 = v77 ^ [(NSMutableArray *)self->_cellularPowerLogSPMIs hash];
  uint64_t v79 = v78 ^ [(NSMutableArray *)self->_cellularPowerLogNRmmWaveBWPs hash];
  uint64_t v80 = v79 ^ [(NSMutableArray *)self->_cellularPowerLogNRmmWaveAntennaPanels hash];
  uint64_t v81 = v69 ^ v80 ^ [(NSMutableArray *)self->_cellularPowerLogNRFRCoverages hash];
  uint64_t v82 = [(NSMutableArray *)self->_cellularPowerLogNRmmWaveBeamIDs hash];
  uint64_t v83 = v82 ^ [(NSMutableArray *)self->_cellularPowerLogSFTStates hash];
  uint64_t v84 = v83 ^ [(NSMutableArray *)self->_cellularPowerLogNRmmWaveCASCCConfigureds hash];
  uint64_t v85 = v84 ^ [(NSMutableArray *)self->_cellularPowerLogNRmmWaveCASCCActivateds hash];
  uint64_t v86 = v85 ^ [(NSMutableArray *)self->_cellularPowerLogNRmmWaveRxTxs hash];
  uint64_t v87 = v86 ^ [(NSMutableArray *)self->_cellularPowerLogNRmmWaveCarrierComponentInfos hash];
  uint64_t v88 = v87 ^ [(NSMutableArray *)self->_cellularPowerLogNRmmWaveDLTBSs hash];
  uint64_t v89 = v88 ^ [(NSMutableArray *)self->_cellularPowerLogNRMmWaveRSRPs hash];
  uint64_t v90 = v89 ^ [(NSMutableArray *)self->_cellularPowerLogSFTRxTxs hash];
  uint64_t v91 = v90 ^ [(NSMutableArray *)self->_cellularPowerLogNRMmWaveTxPowers hash];
  uint64_t v92 = v91 ^ [(NSMutableArray *)self->_cellularPowerLogNRMmWaveULCAStates hash];
  uint64_t v93 = v92 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6BWPSCCs hash];
  uint64_t v94 = v81 ^ v93 ^ [(NSMutableArray *)self->_cellularPowerLogNRmmWaveBWPSCCs hash];
  uint64_t v95 = [(NSMutableArray *)self->_cellularPowerLogNRDCEvents hash];
  uint64_t v96 = v95 ^ [(NSMutableArray *)self->_cellularPowerLogWUSs hash];
  return v94 ^ v96 ^ [(NSMutableArray *)self->_cellularPowerLogNRsub6BWPSAs hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v955 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)a3;
  long long v856 = 0u;
  long long v857 = 0u;
  long long v858 = 0u;
  long long v859 = 0u;
  id v5 = v4[4];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v856 objects:v954 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v857;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v857 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPerClientProfileTriggerCount:*(void *)(*((void *)&v856 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v856 objects:v954 count:16];
    }
    while (v7);
  }

  long long v855 = 0u;
  long long v854 = 0u;
  long long v853 = 0u;
  long long v852 = 0u;
  id v10 = v4[2];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v852 objects:v953 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v853;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v853 != v13) {
          objc_enumerationMutation(v10);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularNrSDMActivation:*(void *)(*((void *)&v852 + 1) + 8 * v14++)];
      }
      while (v12 != v14);
      uint64_t v12 = [v10 countByEnumeratingWithState:&v852 objects:v953 count:16];
    }
    while (v12);
  }

  long long v851 = 0u;
  long long v850 = 0u;
  long long v849 = 0u;
  long long v848 = 0u;
  id v15 = v4[3];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v848 objects:v952 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v849;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v849 != v18) {
          objc_enumerationMutation(v15);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularNrSdmEndcRelease:*(void *)(*((void *)&v848 + 1) + 8 * v19++)];
      }
      while (v17 != v19);
      uint64_t v17 = [v15 countByEnumeratingWithState:&v848 objects:v952 count:16];
    }
    while (v17);
  }

  long long v847 = 0u;
  long long v846 = 0u;
  long long v845 = 0u;
  long long v844 = 0u;
  id v20 = v4[1];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v844 objects:v951 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v845;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v845 != v23) {
          objc_enumerationMutation(v20);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularDynamicRatSelection:*(void *)(*((void *)&v844 + 1) + 8 * v24++)];
      }
      while (v22 != v24);
      uint64_t v22 = [v20 countByEnumeratingWithState:&v844 objects:v951 count:16];
    }
    while (v22);
  }

  long long v843 = 0u;
  long long v842 = 0u;
  long long v841 = 0u;
  long long v840 = 0u;
  id v25 = v4[95];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v840 objects:v950 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v841;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v841 != v28) {
          objc_enumerationMutation(v25);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogXOShutdown:*(void *)(*((void *)&v840 + 1) + 8 * v29++)];
      }
      while (v27 != v29);
      uint64_t v27 = [v25 countByEnumeratingWithState:&v840 objects:v950 count:16];
    }
    while (v27);
  }

  long long v839 = 0u;
  long long v838 = 0u;
  long long v837 = 0u;
  long long v836 = 0u;
  id v30 = v4[7];
  uint64_t v31 = [v30 countByEnumeratingWithState:&v836 objects:v949 count:16];
  if (v31)
  {
    uint64_t v32 = v31;
    uint64_t v33 = *(void *)v837;
    do
    {
      uint64_t v34 = 0;
      do
      {
        if (*(void *)v837 != v33) {
          objc_enumerationMutation(v30);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogAPPSPerfLevels:*(void *)(*((void *)&v836 + 1) + 8 * v34++)];
      }
      while (v32 != v34);
      uint64_t v32 = [v30 countByEnumeratingWithState:&v836 objects:v949 count:16];
    }
    while (v32);
  }

  long long v835 = 0u;
  long long v834 = 0u;
  long long v833 = 0u;
  long long v832 = 0u;
  id v35 = v4[6];
  uint64_t v36 = [v35 countByEnumeratingWithState:&v832 objects:v948 count:16];
  if (v36)
  {
    uint64_t v37 = v36;
    uint64_t v38 = *(void *)v833;
    do
    {
      uint64_t v39 = 0;
      do
      {
        if (*(void *)v833 != v38) {
          objc_enumerationMutation(v35);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogAPPSCXOShutdown:*(void *)(*((void *)&v832 + 1) + 8 * v39++)];
      }
      while (v37 != v39);
      uint64_t v37 = [v35 countByEnumeratingWithState:&v832 objects:v948 count:16];
    }
    while (v37);
  }

  long long v831 = 0u;
  long long v830 = 0u;
  long long v829 = 0u;
  long long v828 = 0u;
  id v40 = v4[8];
  uint64_t v41 = [v40 countByEnumeratingWithState:&v828 objects:v947 count:16];
  if (v41)
  {
    uint64_t v42 = v41;
    uint64_t v43 = *(void *)v829;
    do
    {
      uint64_t v44 = 0;
      do
      {
        if (*(void *)v829 != v43) {
          objc_enumerationMutation(v40);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogAPPSSleepVeto:*(void *)(*((void *)&v828 + 1) + 8 * v44++)];
      }
      while (v42 != v44);
      uint64_t v42 = [v40 countByEnumeratingWithState:&v828 objects:v947 count:16];
    }
    while (v42);
  }

  long long v827 = 0u;
  long long v826 = 0u;
  long long v825 = 0u;
  long long v824 = 0u;
  id v45 = v4[39];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v824 objects:v946 count:16];
  if (v46)
  {
    uint64_t v47 = v46;
    uint64_t v48 = *(void *)v825;
    do
    {
      uint64_t v49 = 0;
      do
      {
        if (*(void *)v825 != v48) {
          objc_enumerationMutation(v45);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogMCPMSleepVeto:*(void *)(*((void *)&v824 + 1) + 8 * v49++)];
      }
      while (v47 != v49);
      uint64_t v47 = [v45 countByEnumeratingWithState:&v824 objects:v946 count:16];
    }
    while (v47);
  }

  long long v823 = 0u;
  long long v822 = 0u;
  long long v821 = 0u;
  long long v820 = 0u;
  id v50 = v4[40];
  uint64_t v51 = [v50 countByEnumeratingWithState:&v820 objects:v945 count:16];
  if (v51)
  {
    uint64_t v52 = v51;
    uint64_t v53 = *(void *)v821;
    do
    {
      uint64_t v54 = 0;
      do
      {
        if (*(void *)v821 != v53) {
          objc_enumerationMutation(v50);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogMPSSPerfLevels:*(void *)(*((void *)&v820 + 1) + 8 * v54++)];
      }
      while (v52 != v54);
      uint64_t v52 = [v50 countByEnumeratingWithState:&v820 objects:v945 count:16];
    }
    while (v52);
  }

  long long v819 = 0u;
  long long v818 = 0u;
  long long v817 = 0u;
  long long v816 = 0u;
  id v55 = v4[17];
  uint64_t v56 = [v55 countByEnumeratingWithState:&v816 objects:v944 count:16];
  if (v56)
  {
    uint64_t v57 = v56;
    uint64_t v58 = *(void *)v817;
    do
    {
      uint64_t v59 = 0;
      do
      {
        if (*(void *)v817 != v58) {
          objc_enumerationMutation(v55);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogGPSStates:*(void *)(*((void *)&v816 + 1) + 8 * v59++)];
      }
      while (v57 != v59);
      uint64_t v57 = [v55 countByEnumeratingWithState:&v816 objects:v944 count:16];
    }
    while (v57);
  }

  long long v815 = 0u;
  long long v814 = 0u;
  long long v813 = 0u;
  long long v812 = 0u;
  id v60 = v4[5];
  uint64_t v61 = [v60 countByEnumeratingWithState:&v812 objects:v943 count:16];
  if (v61)
  {
    uint64_t v62 = v61;
    uint64_t v63 = *(void *)v813;
    do
    {
      uint64_t v64 = 0;
      do
      {
        if (*(void *)v813 != v63) {
          objc_enumerationMutation(v60);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogAOPUARTStates:*(void *)(*((void *)&v812 + 1) + 8 * v64++)];
      }
      while (v62 != v64);
      uint64_t v62 = [v60 countByEnumeratingWithState:&v812 objects:v943 count:16];
    }
    while (v62);
  }

  long long v811 = 0u;
  long long v810 = 0u;
  long long v809 = 0u;
  long long v808 = 0u;
  id v65 = v4[93];
  uint64_t v66 = [v65 countByEnumeratingWithState:&v808 objects:v942 count:16];
  if (v66)
  {
    uint64_t v67 = v66;
    uint64_t v68 = *(void *)v809;
    do
    {
      uint64_t v69 = 0;
      do
      {
        if (*(void *)v809 != v68) {
          objc_enumerationMutation(v65);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogWLANUARTStates:*(void *)(*((void *)&v808 + 1) + 8 * v69++)];
      }
      while (v67 != v69);
      uint64_t v67 = [v65 countByEnumeratingWithState:&v808 objects:v942 count:16];
    }
    while (v67);
  }

  long long v807 = 0u;
  long long v806 = 0u;
  long long v805 = 0u;
  long long v804 = 0u;
  id v70 = v4[72];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v804 objects:v941 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    uint64_t v73 = *(void *)v805;
    do
    {
      uint64_t v74 = 0;
      do
      {
        if (*(void *)v805 != v73) {
          objc_enumerationMutation(v70);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogPCIeStates:*(void *)(*((void *)&v804 + 1) + 8 * v74++)];
      }
      while (v72 != v74);
      uint64_t v72 = [v70 countByEnumeratingWithState:&v804 objects:v941 count:16];
    }
    while (v72);
  }

  long long v803 = 0u;
  long long v802 = 0u;
  long long v801 = 0u;
  long long v800 = 0u;
  id v75 = v4[25];
  uint64_t v76 = [v75 countByEnumeratingWithState:&v800 objects:v940 count:16];
  if (v76)
  {
    uint64_t v77 = v76;
    uint64_t v78 = *(void *)v801;
    do
    {
      uint64_t v79 = 0;
      do
      {
        if (*(void *)v801 != v78) {
          objc_enumerationMutation(v75);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogL1SleepStates:*(void *)(*((void *)&v800 + 1) + 8 * v79++)];
      }
      while (v77 != v79);
      uint64_t v77 = [v75 countByEnumeratingWithState:&v800 objects:v940 count:16];
    }
    while (v77);
  }

  long long v799 = 0u;
  long long v798 = 0u;
  long long v797 = 0u;
  long long v796 = 0u;
  id v80 = v4[30];
  uint64_t v81 = [v80 countByEnumeratingWithState:&v796 objects:v939 count:16];
  if (v81)
  {
    uint64_t v82 = v81;
    uint64_t v83 = *(void *)v797;
    do
    {
      uint64_t v84 = 0;
      do
      {
        if (*(void *)v797 != v83) {
          objc_enumerationMutation(v80);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTEConfiguredCASCCStates:*(void *)(*((void *)&v796 + 1) + 8 * v84++)];
      }
      while (v82 != v84);
      uint64_t v82 = [v80 countByEnumeratingWithState:&v796 objects:v939 count:16];
    }
    while (v82);
  }

  long long v795 = 0u;
  long long v794 = 0u;
  long long v793 = 0u;
  long long v792 = 0u;
  id v85 = v4[26];
  uint64_t v86 = [v85 countByEnumeratingWithState:&v792 objects:v938 count:16];
  if (v86)
  {
    uint64_t v87 = v86;
    uint64_t v88 = *(void *)v793;
    do
    {
      uint64_t v89 = 0;
      do
      {
        if (*(void *)v793 != v88) {
          objc_enumerationMutation(v85);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTEActivatedCASCCStates:*(void *)(*((void *)&v792 + 1) + 8 * v89++)];
      }
      while (v87 != v89);
      uint64_t v87 = [v85 countByEnumeratingWithState:&v792 objects:v938 count:16];
    }
    while (v87);
  }

  long long v791 = 0u;
  long long v790 = 0u;
  long long v789 = 0u;
  long long v788 = 0u;
  id v90 = v4[35];
  uint64_t v91 = [v90 countByEnumeratingWithState:&v788 objects:v937 count:16];
  if (v91)
  {
    uint64_t v92 = v91;
    uint64_t v93 = *(void *)v789;
    do
    {
      uint64_t v94 = 0;
      do
      {
        if (*(void *)v789 != v93) {
          objc_enumerationMutation(v90);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTERxTxActivityStates:*(void *)(*((void *)&v788 + 1) + 8 * v94++)];
      }
      while (v92 != v94);
      uint64_t v92 = [v90 countByEnumeratingWithState:&v788 objects:v937 count:16];
    }
    while (v92);
  }

  long long v787 = 0u;
  long long v786 = 0u;
  long long v785 = 0u;
  long long v784 = 0u;
  id v95 = v4[29];
  uint64_t v96 = [v95 countByEnumeratingWithState:&v784 objects:v936 count:16];
  if (v96)
  {
    uint64_t v97 = v96;
    uint64_t v98 = *(void *)v785;
    do
    {
      uint64_t v99 = 0;
      do
      {
        if (*(void *)v785 != v98) {
          objc_enumerationMutation(v95);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTECarrierComponentInfo:*(void *)(*((void *)&v784 + 1) + 8 * v99++)];
      }
      while (v97 != v99);
      uint64_t v97 = [v95 countByEnumeratingWithState:&v784 objects:v936 count:16];
    }
    while (v97);
  }

  long long v783 = 0u;
  long long v782 = 0u;
  long long v781 = 0u;
  long long v780 = 0u;
  id v100 = v4[27];
  uint64_t v101 = [v100 countByEnumeratingWithState:&v780 objects:v935 count:16];
  if (v101)
  {
    uint64_t v102 = v101;
    uint64_t v103 = *(void *)v781;
    do
    {
      uint64_t v104 = 0;
      do
      {
        if (*(void *)v781 != v103) {
          objc_enumerationMutation(v100);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTEAggregatedDLTBS:*(void *)(*((void *)&v780 + 1) + 8 * v104++)];
      }
      while (v102 != v104);
      uint64_t v102 = [v100 countByEnumeratingWithState:&v780 objects:v935 count:16];
    }
    while (v102);
  }

  long long v779 = 0u;
  long long v778 = 0u;
  long long v777 = 0u;
  long long v776 = 0u;
  id v105 = v4[33];
  uint64_t v106 = [v105 countByEnumeratingWithState:&v776 objects:v934 count:16];
  if (v106)
  {
    uint64_t v107 = v106;
    uint64_t v108 = *(void *)v777;
    do
    {
      uint64_t v109 = 0;
      do
      {
        if (*(void *)v777 != v108) {
          objc_enumerationMutation(v105);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTERSRP:*(void *)(*((void *)&v776 + 1) + 8 * v109++)];
      }
      while (v107 != v109);
      uint64_t v107 = [v105 countByEnumeratingWithState:&v776 objects:v934 count:16];
    }
    while (v107);
  }

  long long v775 = 0u;
  long long v774 = 0u;
  long long v773 = 0u;
  long long v772 = 0u;
  id v110 = v4[36];
  uint64_t v111 = [v110 countByEnumeratingWithState:&v772 objects:v933 count:16];
  if (v111)
  {
    uint64_t v112 = v111;
    uint64_t v113 = *(void *)v773;
    do
    {
      uint64_t v114 = 0;
      do
      {
        if (*(void *)v773 != v113) {
          objc_enumerationMutation(v110);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTESINR:*(void *)(*((void *)&v772 + 1) + 8 * v114++)];
      }
      while (v112 != v114);
      uint64_t v112 = [v110 countByEnumeratingWithState:&v772 objects:v933 count:16];
    }
    while (v112);
  }

  long long v771 = 0u;
  long long v770 = 0u;
  long long v769 = 0u;
  long long v768 = 0u;
  id v115 = v4[37];
  uint64_t v116 = [v115 countByEnumeratingWithState:&v768 objects:v932 count:16];
  if (v116)
  {
    uint64_t v117 = v116;
    uint64_t v118 = *(void *)v769;
    do
    {
      uint64_t v119 = 0;
      do
      {
        if (*(void *)v769 != v118) {
          objc_enumerationMutation(v115);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTETxPower:*(void *)(*((void *)&v768 + 1) + 8 * v119++)];
      }
      while (v117 != v119);
      uint64_t v117 = [v115 countByEnumeratingWithState:&v768 objects:v932 count:16];
    }
    while (v117);
  }

  long long v767 = 0u;
  long long v766 = 0u;
  long long v765 = 0u;
  long long v764 = 0u;
  id v120 = v4[34];
  uint64_t v121 = [v120 countByEnumeratingWithState:&v764 objects:v931 count:16];
  if (v121)
  {
    uint64_t v122 = v121;
    uint64_t v123 = *(void *)v765;
    do
    {
      uint64_t v124 = 0;
      do
      {
        if (*(void *)v765 != v123) {
          objc_enumerationMutation(v120);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTERxDiversity:*(void *)(*((void *)&v764 + 1) + 8 * v124++)];
      }
      while (v122 != v124);
      uint64_t v122 = [v120 countByEnumeratingWithState:&v764 objects:v931 count:16];
    }
    while (v122);
  }

  long long v763 = 0u;
  long long v762 = 0u;
  long long v761 = 0u;
  long long v760 = 0u;
  id v125 = v4[38];
  uint64_t v126 = [v125 countByEnumeratingWithState:&v760 objects:v930 count:16];
  if (v126)
  {
    uint64_t v127 = v126;
    uint64_t v128 = *(void *)v761;
    do
    {
      uint64_t v129 = 0;
      do
      {
        if (*(void *)v761 != v128) {
          objc_enumerationMutation(v125);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTEULCAState:*(void *)(*((void *)&v760 + 1) + 8 * v129++)];
      }
      while (v127 != v129);
      uint64_t v127 = [v125 countByEnumeratingWithState:&v760 objects:v930 count:16];
    }
    while (v127);
  }

  long long v759 = 0u;
  long long v758 = 0u;
  long long v757 = 0u;
  long long v756 = 0u;
  id v130 = v4[76];
  uint64_t v131 = [v130 countByEnumeratingWithState:&v756 objects:v929 count:16];
  if (v131)
  {
    uint64_t v132 = v131;
    uint64_t v133 = *(void *)v757;
    do
    {
      uint64_t v134 = 0;
      do
      {
        if (*(void *)v757 != v133) {
          objc_enumerationMutation(v130);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogPowerEstimator:*(void *)(*((void *)&v756 + 1) + 8 * v134++)];
      }
      while (v132 != v134);
      uint64_t v132 = [v130 countByEnumeratingWithState:&v756 objects:v929 count:16];
    }
    while (v132);
  }

  long long v755 = 0u;
  long long v754 = 0u;
  long long v753 = 0u;
  long long v752 = 0u;
  id v135 = v4[31];
  uint64_t v136 = [v135 countByEnumeratingWithState:&v752 objects:v928 count:16];
  if (v136)
  {
    uint64_t v137 = v136;
    uint64_t v138 = *(void *)v753;
    do
    {
      uint64_t v139 = 0;
      do
      {
        if (*(void *)v753 != v138) {
          objc_enumerationMutation(v135);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTEPagingDRXCycle:*(void *)(*((void *)&v752 + 1) + 8 * v139++)];
      }
      while (v137 != v139);
      uint64_t v137 = [v135 countByEnumeratingWithState:&v752 objects:v928 count:16];
    }
    while (v137);
  }

  long long v751 = 0u;
  long long v750 = 0u;
  long long v749 = 0u;
  long long v748 = 0u;
  id v140 = v4[48];
  uint64_t v141 = [v140 countByEnumeratingWithState:&v748 objects:v927 count:16];
  if (v141)
  {
    uint64_t v142 = v141;
    uint64_t v143 = *(void *)v749;
    do
    {
      uint64_t v144 = 0;
      do
      {
        if (*(void *)v749 != v143) {
          objc_enumerationMutation(v140);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRPagingDRXCycle:*(void *)(*((void *)&v748 + 1) + 8 * v144++)];
      }
      while (v142 != v144);
      uint64_t v142 = [v140 countByEnumeratingWithState:&v748 objects:v927 count:16];
    }
    while (v142);
  }

  long long v747 = 0u;
  long long v746 = 0u;
  long long v745 = 0u;
  long long v744 = 0u;
  id v145 = v4[77];
  uint64_t v146 = [v145 countByEnumeratingWithState:&v744 objects:v926 count:16];
  if (v146)
  {
    uint64_t v147 = v146;
    uint64_t v148 = *(void *)v745;
    do
    {
      uint64_t v149 = 0;
      do
      {
        if (*(void *)v745 != v148) {
          objc_enumerationMutation(v145);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogProtocolState:*(void *)(*((void *)&v744 + 1) + 8 * v149++)];
      }
      while (v147 != v149);
      uint64_t v147 = [v145 countByEnumeratingWithState:&v744 objects:v926 count:16];
    }
    while (v147);
  }

  long long v743 = 0u;
  long long v742 = 0u;
  long long v741 = 0u;
  long long v740 = 0u;
  id v150 = v4[75];
  uint64_t v151 = [v150 countByEnumeratingWithState:&v740 objects:v925 count:16];
  if (v151)
  {
    uint64_t v152 = v151;
    uint64_t v153 = *(void *)v741;
    do
    {
      uint64_t v154 = 0;
      do
      {
        if (*(void *)v741 != v153) {
          objc_enumerationMutation(v150);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogPLMNSearch:*(void *)(*((void *)&v740 + 1) + 8 * v154++)];
      }
      while (v152 != v154);
      uint64_t v152 = [v150 countByEnumeratingWithState:&v740 objects:v925 count:16];
    }
    while (v152);
  }

  long long v739 = 0u;
  long long v738 = 0u;
  long long v737 = 0u;
  long long v736 = 0u;
  id v155 = v4[22];
  uint64_t v156 = [v155 countByEnumeratingWithState:&v736 objects:v924 count:16];
  if (v156)
  {
    uint64_t v157 = v156;
    uint64_t v158 = *(void *)v737;
    do
    {
      uint64_t v159 = 0;
      do
      {
        if (*(void *)v737 != v158) {
          objc_enumerationMutation(v155);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogGSMTxPower:*(void *)(*((void *)&v736 + 1) + 8 * v159++)];
      }
      while (v157 != v159);
      uint64_t v157 = [v155 countByEnumeratingWithState:&v736 objects:v924 count:16];
    }
    while (v157);
  }

  long long v735 = 0u;
  long long v734 = 0u;
  long long v733 = 0u;
  long long v732 = 0u;
  id v160 = v4[21];
  uint64_t v161 = [v160 countByEnumeratingWithState:&v732 objects:v923 count:16];
  if (v161)
  {
    uint64_t v162 = v161;
    uint64_t v163 = *(void *)v733;
    do
    {
      uint64_t v164 = 0;
      do
      {
        if (*(void *)v733 != v163) {
          objc_enumerationMutation(v160);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogGSMRxRSSI:*(void *)(*((void *)&v732 + 1) + 8 * v164++)];
      }
      while (v162 != v164);
      uint64_t v162 = [v160 countByEnumeratingWithState:&v732 objects:v923 count:16];
    }
    while (v162);
  }

  long long v731 = 0u;
  long long v730 = 0u;
  long long v729 = 0u;
  long long v728 = 0u;
  id v165 = v4[18];
  uint64_t v166 = [v165 countByEnumeratingWithState:&v728 objects:v922 count:16];
  if (v166)
  {
    uint64_t v167 = v166;
    uint64_t v168 = *(void *)v729;
    do
    {
      uint64_t v169 = 0;
      do
      {
        if (*(void *)v729 != v168) {
          objc_enumerationMutation(v165);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogGSMRABMode:*(void *)(*((void *)&v728 + 1) + 8 * v169++)];
      }
      while (v167 != v169);
      uint64_t v167 = [v165 countByEnumeratingWithState:&v728 objects:v922 count:16];
    }
    while (v167);
  }

  long long v727 = 0u;
  long long v726 = 0u;
  long long v725 = 0u;
  long long v724 = 0u;
  id v170 = v4[20];
  uint64_t v171 = [v170 countByEnumeratingWithState:&v724 objects:v921 count:16];
  if (v171)
  {
    uint64_t v172 = v171;
    uint64_t v173 = *(void *)v725;
    do
    {
      uint64_t v174 = 0;
      do
      {
        if (*(void *)v725 != v173) {
          objc_enumerationMutation(v170);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogGSMRxDiversity:*(void *)(*((void *)&v724 + 1) + 8 * v174++)];
      }
      while (v172 != v174);
      uint64_t v172 = [v170 countByEnumeratingWithState:&v724 objects:v921 count:16];
    }
    while (v172);
  }

  long long v723 = 0u;
  long long v722 = 0u;
  long long v721 = 0u;
  long long v720 = 0u;
  id v175 = v4[92];
  uint64_t v176 = [v175 countByEnumeratingWithState:&v720 objects:v920 count:16];
  if (v176)
  {
    uint64_t v177 = v176;
    uint64_t v178 = *(void *)v721;
    do
    {
      uint64_t v179 = 0;
      do
      {
        if (*(void *)v721 != v178) {
          objc_enumerationMutation(v175);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogWCDMATxPower:*(void *)(*((void *)&v720 + 1) + 8 * v179++)];
      }
      while (v177 != v179);
      uint64_t v177 = [v175 countByEnumeratingWithState:&v720 objects:v920 count:16];
    }
    while (v177);
  }

  long long v719 = 0u;
  long long v718 = 0u;
  long long v717 = 0u;
  long long v716 = 0u;
  id v180 = v4[91];
  uint64_t v181 = [v180 countByEnumeratingWithState:&v716 objects:v919 count:16];
  if (v181)
  {
    uint64_t v182 = v181;
    uint64_t v183 = *(void *)v717;
    do
    {
      uint64_t v184 = 0;
      do
      {
        if (*(void *)v717 != v183) {
          objc_enumerationMutation(v180);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogWCDMARxRSSI:*(void *)(*((void *)&v716 + 1) + 8 * v184++)];
      }
      while (v182 != v184);
      uint64_t v182 = [v180 countByEnumeratingWithState:&v716 objects:v919 count:16];
    }
    while (v182);
  }

  long long v715 = 0u;
  long long v714 = 0u;
  long long v713 = 0u;
  long long v712 = 0u;
  id v185 = v4[50];
  uint64_t v186 = [v185 countByEnumeratingWithState:&v712 objects:v918 count:16];
  if (v186)
  {
    uint64_t v187 = v186;
    uint64_t v188 = *(void *)v713;
    do
    {
      uint64_t v189 = 0;
      do
      {
        if (*(void *)v713 != v188) {
          objc_enumerationMutation(v185);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRSCGRel:*(void *)(*((void *)&v712 + 1) + 8 * v189++)];
      }
      while (v187 != v189);
      uint64_t v187 = [v185 countByEnumeratingWithState:&v712 objects:v918 count:16];
    }
    while (v187);
  }

  long long v711 = 0u;
  long long v710 = 0u;
  long long v709 = 0u;
  long long v708 = 0u;
  id v190 = v4[90];
  uint64_t v191 = [v190 countByEnumeratingWithState:&v708 objects:v917 count:16];
  if (v191)
  {
    uint64_t v192 = v191;
    uint64_t v193 = *(void *)v709;
    do
    {
      uint64_t v194 = 0;
      do
      {
        if (*(void *)v709 != v193) {
          objc_enumerationMutation(v190);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogWCDMARxDiversity:*(void *)(*((void *)&v708 + 1) + 8 * v194++)];
      }
      while (v192 != v194);
      uint64_t v192 = [v190 countByEnumeratingWithState:&v708 objects:v917 count:16];
    }
    while (v192);
  }

  long long v707 = 0u;
  long long v706 = 0u;
  long long v705 = 0u;
  long long v704 = 0u;
  id v195 = v4[87];
  uint64_t v196 = [v195 countByEnumeratingWithState:&v704 objects:v916 count:16];
  if (v196)
  {
    uint64_t v197 = v196;
    uint64_t v198 = *(void *)v705;
    do
    {
      uint64_t v199 = 0;
      do
      {
        if (*(void *)v705 != v198) {
          objc_enumerationMutation(v195);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogWCDMARABMode:*(void *)(*((void *)&v704 + 1) + 8 * v199++)];
      }
      while (v197 != v199);
      uint64_t v197 = [v195 countByEnumeratingWithState:&v704 objects:v916 count:16];
    }
    while (v197);
  }

  long long v703 = 0u;
  long long v702 = 0u;
  long long v701 = 0u;
  long long v700 = 0u;
  id v200 = v4[88];
  uint64_t v201 = [v200 countByEnumeratingWithState:&v700 objects:v915 count:16];
  if (v201)
  {
    uint64_t v202 = v201;
    uint64_t v203 = *(void *)v701;
    do
    {
      uint64_t v204 = 0;
      do
      {
        if (*(void *)v701 != v203) {
          objc_enumerationMutation(v200);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogWCDMARABType:*(void *)(*((void *)&v700 + 1) + 8 * v204++)];
      }
      while (v202 != v204);
      uint64_t v202 = [v200 countByEnumeratingWithState:&v700 objects:v915 count:16];
    }
    while (v202);
  }

  long long v699 = 0u;
  long long v698 = 0u;
  long long v697 = 0u;
  long long v696 = 0u;
  id v205 = v4[16];
  uint64_t v206 = [v205 countByEnumeratingWithState:&v696 objects:v914 count:16];
  if (v206)
  {
    uint64_t v207 = v206;
    uint64_t v208 = *(void *)v697;
    do
    {
      uint64_t v209 = 0;
      do
      {
        if (*(void *)v697 != v208) {
          objc_enumerationMutation(v205);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogEVDOTxPower:*(void *)(*((void *)&v696 + 1) + 8 * v209++)];
      }
      while (v207 != v209);
      uint64_t v207 = [v205 countByEnumeratingWithState:&v696 objects:v914 count:16];
    }
    while (v207);
  }

  long long v695 = 0u;
  long long v694 = 0u;
  long long v693 = 0u;
  long long v692 = 0u;
  id v210 = v4[15];
  uint64_t v211 = [v210 countByEnumeratingWithState:&v692 objects:v913 count:16];
  if (v211)
  {
    uint64_t v212 = v211;
    uint64_t v213 = *(void *)v693;
    do
    {
      uint64_t v214 = 0;
      do
      {
        if (*(void *)v693 != v213) {
          objc_enumerationMutation(v210);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogEVDORxRSSI:*(void *)(*((void *)&v692 + 1) + 8 * v214++)];
      }
      while (v212 != v214);
      uint64_t v212 = [v210 countByEnumeratingWithState:&v692 objects:v913 count:16];
    }
    while (v212);
  }

  long long v691 = 0u;
  long long v690 = 0u;
  long long v689 = 0u;
  long long v688 = 0u;
  id v215 = v4[23];
  uint64_t v216 = [v215 countByEnumeratingWithState:&v688 objects:v912 count:16];
  if (v216)
  {
    uint64_t v217 = v216;
    uint64_t v218 = *(void *)v689;
    do
    {
      uint64_t v219 = 0;
      do
      {
        if (*(void *)v689 != v218) {
          objc_enumerationMutation(v215);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogHybridRABMode:*(void *)(*((void *)&v688 + 1) + 8 * v219++)];
      }
      while (v217 != v219);
      uint64_t v217 = [v215 countByEnumeratingWithState:&v688 objects:v912 count:16];
    }
    while (v217);
  }

  long long v687 = 0u;
  long long v686 = 0u;
  long long v685 = 0u;
  long long v684 = 0u;
  id v220 = v4[14];
  uint64_t v221 = [v220 countByEnumeratingWithState:&v684 objects:v911 count:16];
  if (v221)
  {
    uint64_t v222 = v221;
    uint64_t v223 = *(void *)v685;
    do
    {
      uint64_t v224 = 0;
      do
      {
        if (*(void *)v685 != v223) {
          objc_enumerationMutation(v220);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogEVDORxDiversity:*(void *)(*((void *)&v684 + 1) + 8 * v224++)];
      }
      while (v222 != v224);
      uint64_t v222 = [v220 countByEnumeratingWithState:&v684 objects:v911 count:16];
    }
    while (v222);
  }

  long long v683 = 0u;
  long long v682 = 0u;
  long long v681 = 0u;
  long long v680 = 0u;
  id v225 = v4[13];
  uint64_t v226 = [v225 countByEnumeratingWithState:&v680 objects:v910 count:16];
  if (v226)
  {
    uint64_t v227 = v226;
    uint64_t v228 = *(void *)v681;
    do
    {
      uint64_t v229 = 0;
      do
      {
        if (*(void *)v681 != v228) {
          objc_enumerationMutation(v225);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogCDMA1XTxPower:*(void *)(*((void *)&v680 + 1) + 8 * v229++)];
      }
      while (v227 != v229);
      uint64_t v227 = [v225 countByEnumeratingWithState:&v680 objects:v910 count:16];
    }
    while (v227);
  }

  long long v679 = 0u;
  long long v678 = 0u;
  long long v677 = 0u;
  long long v676 = 0u;
  id v230 = v4[12];
  uint64_t v231 = [v230 countByEnumeratingWithState:&v676 objects:v909 count:16];
  if (v231)
  {
    uint64_t v232 = v231;
    uint64_t v233 = *(void *)v677;
    do
    {
      uint64_t v234 = 0;
      do
      {
        if (*(void *)v677 != v233) {
          objc_enumerationMutation(v230);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogCDMA1XRxRSSI:*(void *)(*((void *)&v676 + 1) + 8 * v234++)];
      }
      while (v232 != v234);
      uint64_t v232 = [v230 countByEnumeratingWithState:&v676 objects:v909 count:16];
    }
    while (v232);
  }

  long long v675 = 0u;
  long long v674 = 0u;
  long long v673 = 0u;
  long long v672 = 0u;
  id v235 = v4[9];
  uint64_t v236 = [v235 countByEnumeratingWithState:&v672 objects:v908 count:16];
  if (v236)
  {
    uint64_t v237 = v236;
    uint64_t v238 = *(void *)v673;
    do
    {
      uint64_t v239 = 0;
      do
      {
        if (*(void *)v673 != v238) {
          objc_enumerationMutation(v235);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogCDMA1XRABMode:*(void *)(*((void *)&v672 + 1) + 8 * v239++)];
      }
      while (v237 != v239);
      uint64_t v237 = [v235 countByEnumeratingWithState:&v672 objects:v908 count:16];
    }
    while (v237);
  }

  long long v671 = 0u;
  long long v670 = 0u;
  long long v669 = 0u;
  long long v668 = 0u;
  id v240 = v4[11];
  uint64_t v241 = [v240 countByEnumeratingWithState:&v668 objects:v907 count:16];
  if (v241)
  {
    uint64_t v242 = v241;
    uint64_t v243 = *(void *)v669;
    do
    {
      uint64_t v244 = 0;
      do
      {
        if (*(void *)v669 != v243) {
          objc_enumerationMutation(v240);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogCDMA1XRxDiversity:*(void *)(*((void *)&v668 + 1) + 8 * v244++)];
      }
      while (v242 != v244);
      uint64_t v242 = [v240 countByEnumeratingWithState:&v668 objects:v907 count:16];
    }
    while (v242);
  }

  long long v667 = 0u;
  long long v666 = 0u;
  long long v665 = 0u;
  long long v664 = 0u;
  id v245 = v4[86];
  uint64_t v246 = [v245 countByEnumeratingWithState:&v664 objects:v906 count:16];
  if (v246)
  {
    uint64_t v247 = v246;
    uint64_t v248 = *(void *)v665;
    do
    {
      uint64_t v249 = 0;
      do
      {
        if (*(void *)v665 != v248) {
          objc_enumerationMutation(v245);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogWCDMACDRXConfig:*(void *)(*((void *)&v664 + 1) + 8 * v249++)];
      }
      while (v247 != v249);
      uint64_t v247 = [v245 countByEnumeratingWithState:&v664 objects:v906 count:16];
    }
    while (v247);
  }

  long long v663 = 0u;
  long long v662 = 0u;
  long long v661 = 0u;
  long long v660 = 0u;
  id v250 = v4[28];
  uint64_t v251 = [v250 countByEnumeratingWithState:&v660 objects:v905 count:16];
  if (v251)
  {
    uint64_t v252 = v251;
    uint64_t v253 = *(void *)v661;
    do
    {
      uint64_t v254 = 0;
      do
      {
        if (*(void *)v661 != v253) {
          objc_enumerationMutation(v250);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTECDRXConfig:*(void *)(*((void *)&v660 + 1) + 8 * v254++)];
      }
      while (v252 != v254);
      uint64_t v252 = [v250 countByEnumeratingWithState:&v660 objects:v905 count:16];
    }
    while (v252);
  }

  long long v659 = 0u;
  long long v658 = 0u;
  long long v657 = 0u;
  long long v656 = 0u;
  id v255 = v4[89];
  uint64_t v256 = [v255 countByEnumeratingWithState:&v656 objects:v904 count:16];
  if (v256)
  {
    uint64_t v257 = v256;
    uint64_t v258 = *(void *)v657;
    do
    {
      uint64_t v259 = 0;
      do
      {
        if (*(void *)v657 != v258) {
          objc_enumerationMutation(v255);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogWCDMARRCStateChange:*(void *)(*((void *)&v656 + 1) + 8 * v259++)];
      }
      while (v257 != v259);
      uint64_t v257 = [v255 countByEnumeratingWithState:&v656 objects:v904 count:16];
    }
    while (v257);
  }

  long long v655 = 0u;
  long long v654 = 0u;
  long long v653 = 0u;
  long long v652 = 0u;
  id v260 = v4[32];
  uint64_t v261 = [v260 countByEnumeratingWithState:&v652 objects:v903 count:16];
  if (v261)
  {
    uint64_t v262 = v261;
    uint64_t v263 = *(void *)v653;
    do
    {
      uint64_t v264 = 0;
      do
      {
        if (*(void *)v653 != v263) {
          objc_enumerationMutation(v260);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogLTERRCStateChange:*(void *)(*((void *)&v652 + 1) + 8 * v264++)];
      }
      while (v262 != v264);
      uint64_t v262 = [v260 countByEnumeratingWithState:&v652 objects:v903 count:16];
    }
    while (v262);
  }

  long long v651 = 0u;
  long long v650 = 0u;
  long long v649 = 0u;
  long long v648 = 0u;
  id v265 = v4[85];
  uint64_t v266 = [v265 countByEnumeratingWithState:&v648 objects:v902 count:16];
  if (v266)
  {
    uint64_t v267 = v266;
    uint64_t v268 = *(void *)v649;
    do
    {
      uint64_t v269 = 0;
      do
      {
        if (*(void *)v649 != v268) {
          objc_enumerationMutation(v265);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogSystemEvent:*(void *)(*((void *)&v648 + 1) + 8 * v269++)];
      }
      while (v267 != v269);
      uint64_t v267 = [v265 countByEnumeratingWithState:&v648 objects:v902 count:16];
    }
    while (v267);
  }

  long long v647 = 0u;
  long long v646 = 0u;
  long long v645 = 0u;
  long long v644 = 0u;
  id v270 = v4[79];
  uint64_t v271 = [v270 countByEnumeratingWithState:&v644 objects:v901 count:16];
  if (v271)
  {
    uint64_t v272 = v271;
    uint64_t v273 = *(void *)v645;
    do
    {
      uint64_t v274 = 0;
      do
      {
        if (*(void *)v645 != v273) {
          objc_enumerationMutation(v270);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogRATReselectionEvent:*(void *)(*((void *)&v644 + 1) + 8 * v274++)];
      }
      while (v272 != v274);
      uint64_t v272 = [v270 countByEnumeratingWithState:&v644 objects:v901 count:16];
    }
    while (v272);
  }

  long long v643 = 0u;
  long long v642 = 0u;
  long long v641 = 0u;
  long long v640 = 0u;
  id v275 = v4[78];
  uint64_t v276 = [v275 countByEnumeratingWithState:&v640 objects:v900 count:16];
  if (v276)
  {
    uint64_t v277 = v276;
    uint64_t v278 = *(void *)v641;
    do
    {
      uint64_t v279 = 0;
      do
      {
        if (*(void *)v641 != v278) {
          objc_enumerationMutation(v275);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogRATRedirectionEvent:*(void *)(*((void *)&v640 + 1) + 8 * v279++)];
      }
      while (v277 != v279);
      uint64_t v277 = [v275 countByEnumeratingWithState:&v640 objects:v900 count:16];
    }
    while (v277);
  }

  long long v639 = 0u;
  long long v638 = 0u;
  long long v637 = 0u;
  long long v636 = 0u;
  id v280 = v4[19];
  uint64_t v281 = [v280 countByEnumeratingWithState:&v636 objects:v899 count:16];
  if (v281)
  {
    uint64_t v282 = v281;
    uint64_t v283 = *(void *)v637;
    do
    {
      uint64_t v284 = 0;
      do
      {
        if (*(void *)v637 != v283) {
          objc_enumerationMutation(v280);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogGSMRRCStateChange:*(void *)(*((void *)&v636 + 1) + 8 * v284++)];
      }
      while (v282 != v284);
      uint64_t v282 = [v280 countByEnumeratingWithState:&v636 objects:v899 count:16];
    }
    while (v282);
  }

  long long v635 = 0u;
  long long v634 = 0u;
  long long v633 = 0u;
  long long v632 = 0u;
  id v285 = v4[10];
  uint64_t v286 = [v285 countByEnumeratingWithState:&v632 objects:v898 count:16];
  if (v286)
  {
    uint64_t v287 = v286;
    uint64_t v288 = *(void *)v633;
    do
    {
      uint64_t v289 = 0;
      do
      {
        if (*(void *)v633 != v288) {
          objc_enumerationMutation(v285);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogCDMA1XRRCStateChange:*(void *)(*((void *)&v632 + 1) + 8 * v289++)];
      }
      while (v287 != v289);
      uint64_t v287 = [v285 countByEnumeratingWithState:&v632 objects:v898 count:16];
    }
    while (v287);
  }

  long long v631 = 0u;
  long long v630 = 0u;
  long long v629 = 0u;
  long long v628 = 0u;
  id v290 = v4[24];
  uint64_t v291 = [v290 countByEnumeratingWithState:&v628 objects:v897 count:16];
  if (v291)
  {
    uint64_t v292 = v291;
    uint64_t v293 = *(void *)v629;
    do
    {
      uint64_t v294 = 0;
      do
      {
        if (*(void *)v629 != v293) {
          objc_enumerationMutation(v290);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogHybridRRCStateChange:*(void *)(*((void *)&v628 + 1) + 8 * v294++)];
      }
      while (v292 != v294);
      uint64_t v292 = [v290 countByEnumeratingWithState:&v628 objects:v897 count:16];
    }
    while (v292);
  }

  long long v627 = 0u;
  long long v626 = 0u;
  long long v625 = 0u;
  long long v624 = 0u;
  id v295 = v4[84];
  uint64_t v296 = [v295 countByEnumeratingWithState:&v624 objects:v896 count:16];
  if (v296)
  {
    uint64_t v297 = v296;
    uint64_t v298 = *(void *)v625;
    do
    {
      uint64_t v299 = 0;
      do
      {
        if (*(void *)v625 != v298) {
          objc_enumerationMutation(v295);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogServiceStateEvent:*(void *)(*((void *)&v624 + 1) + 8 * v299++)];
      }
      while (v297 != v299);
      uint64_t v297 = [v295 countByEnumeratingWithState:&v624 objects:v896 count:16];
    }
    while (v297);
  }

  long long v623 = 0u;
  long long v622 = 0u;
  long long v621 = 0u;
  long long v620 = 0u;
  id v300 = v4[73];
  uint64_t v301 = [v300 countByEnumeratingWithState:&v620 objects:v895 count:16];
  if (v301)
  {
    uint64_t v302 = v301;
    uint64_t v303 = *(void *)v621;
    do
    {
      uint64_t v304 = 0;
      do
      {
        if (*(void *)v621 != v303) {
          objc_enumerationMutation(v300);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogPLMNScanEvent:*(void *)(*((void *)&v620 + 1) + 8 * v304++)];
      }
      while (v302 != v304);
      uint64_t v302 = [v300 countByEnumeratingWithState:&v620 objects:v895 count:16];
    }
    while (v302);
  }

  long long v619 = 0u;
  long long v618 = 0u;
  long long v617 = 0u;
  long long v616 = 0u;
  id v305 = v4[74];
  uint64_t v306 = [v305 countByEnumeratingWithState:&v616 objects:v894 count:16];
  if (v306)
  {
    uint64_t v307 = v306;
    uint64_t v308 = *(void *)v617;
    do
    {
      uint64_t v309 = 0;
      do
      {
        if (*(void *)v617 != v308) {
          objc_enumerationMutation(v305);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogPLMNSearchEvent:*(void *)(*((void *)&v616 + 1) + 8 * v309++)];
      }
      while (v307 != v309);
      uint64_t v307 = [v305 countByEnumeratingWithState:&v616 objects:v894 count:16];
    }
    while (v307);
  }

  long long v615 = 0u;
  long long v614 = 0u;
  long long v613 = 0u;
  long long v612 = 0u;
  id v310 = v4[49];
  uint64_t v311 = [v310 countByEnumeratingWithState:&v612 objects:v893 count:16];
  if (v311)
  {
    uint64_t v312 = v311;
    uint64_t v313 = *(void *)v613;
    do
    {
      uint64_t v314 = 0;
      do
      {
        if (*(void *)v613 != v313) {
          objc_enumerationMutation(v310);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRSARRCStateChange:*(void *)(*((void *)&v612 + 1) + 8 * v314++)];
      }
      while (v312 != v314);
      uint64_t v312 = [v310 countByEnumeratingWithState:&v612 objects:v893 count:16];
    }
    while (v312);
  }

  long long v611 = 0u;
  long long v610 = 0u;
  long long v609 = 0u;
  long long v608 = 0u;
  id v315 = v4[47];
  uint64_t v316 = [v315 countByEnumeratingWithState:&v608 objects:v892 count:16];
  if (v316)
  {
    uint64_t v317 = v316;
    uint64_t v318 = *(void *)v609;
    do
    {
      uint64_t v319 = 0;
      do
      {
        if (*(void *)v609 != v318) {
          objc_enumerationMutation(v315);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRNSAENDCEvent:*(void *)(*((void *)&v608 + 1) + 8 * v319++)];
      }
      while (v317 != v319);
      uint64_t v317 = [v315 countByEnumeratingWithState:&v608 objects:v892 count:16];
    }
    while (v317);
  }

  long long v607 = 0u;
  long long v606 = 0u;
  long long v605 = 0u;
  long long v604 = 0u;
  id v320 = v4[41];
  uint64_t v321 = [v320 countByEnumeratingWithState:&v604 objects:v891 count:16];
  if (v321)
  {
    uint64_t v322 = v321;
    uint64_t v323 = *(void *)v605;
    do
    {
      uint64_t v324 = 0;
      do
      {
        if (*(void *)v605 != v323) {
          objc_enumerationMutation(v320);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRCDRXConfig:*(void *)(*((void *)&v604 + 1) + 8 * v324++)];
      }
      while (v322 != v324);
      uint64_t v322 = [v320 countByEnumeratingWithState:&v604 objects:v891 count:16];
    }
    while (v322);
  }

  long long v603 = 0u;
  long long v602 = 0u;
  long long v601 = 0u;
  long long v600 = 0u;
  id v325 = v4[62];
  uint64_t v326 = [v325 countByEnumeratingWithState:&v600 objects:v890 count:16];
  if (v326)
  {
    uint64_t v327 = v326;
    uint64_t v328 = *(void *)v601;
    do
    {
      uint64_t v329 = 0;
      do
      {
        if (*(void *)v601 != v328) {
          objc_enumerationMutation(v325);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6BWP:*(void *)(*((void *)&v600 + 1) + 8 * v329++)];
      }
      while (v327 != v329);
      uint64_t v327 = [v325 countByEnumeratingWithState:&v600 objects:v890 count:16];
    }
    while (v327);
  }

  long long v599 = 0u;
  long long v598 = 0u;
  long long v597 = 0u;
  long long v596 = 0u;
  id v330 = v4[80];
  uint64_t v331 = [v330 countByEnumeratingWithState:&v596 objects:v889 count:16];
  if (v331)
  {
    uint64_t v332 = v331;
    uint64_t v333 = *(void *)v597;
    do
    {
      uint64_t v334 = 0;
      do
      {
        if (*(void *)v597 != v333) {
          objc_enumerationMutation(v330);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogRFTunerStatsHist:*(void *)(*((void *)&v596 + 1) + 8 * v334++)];
      }
      while (v332 != v334);
      uint64_t v332 = [v330 countByEnumeratingWithState:&v596 objects:v889 count:16];
    }
    while (v332);
  }

  long long v595 = 0u;
  long long v594 = 0u;
  long long v593 = 0u;
  long long v592 = 0u;
  id v335 = v4[64];
  uint64_t v336 = [v335 countByEnumeratingWithState:&v592 objects:v888 count:16];
  if (v336)
  {
    uint64_t v337 = v336;
    uint64_t v338 = *(void *)v593;
    do
    {
      uint64_t v339 = 0;
      do
      {
        if (*(void *)v593 != v338) {
          objc_enumerationMutation(v335);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6CASCCConfigured:*(void *)(*((void *)&v592 + 1) + 8 * v339++)];
      }
      while (v337 != v339);
      uint64_t v337 = [v335 countByEnumeratingWithState:&v592 objects:v888 count:16];
    }
    while (v337);
  }

  long long v591 = 0u;
  long long v590 = 0u;
  long long v589 = 0u;
  long long v588 = 0u;
  id v340 = v4[63];
  uint64_t v341 = [v340 countByEnumeratingWithState:&v588 objects:v887 count:16];
  if (v341)
  {
    uint64_t v342 = v341;
    uint64_t v343 = *(void *)v589;
    do
    {
      uint64_t v344 = 0;
      do
      {
        if (*(void *)v589 != v343) {
          objc_enumerationMutation(v340);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6CASCCActivated:*(void *)(*((void *)&v588 + 1) + 8 * v344++)];
      }
      while (v342 != v344);
      uint64_t v342 = [v340 countByEnumeratingWithState:&v588 objects:v887 count:16];
    }
    while (v342);
  }

  long long v587 = 0u;
  long long v586 = 0u;
  long long v585 = 0u;
  long long v584 = 0u;
  id v345 = v4[69];
  uint64_t v346 = [v345 countByEnumeratingWithState:&v584 objects:v886 count:16];
  if (v346)
  {
    uint64_t v347 = v346;
    uint64_t v348 = *(void *)v585;
    do
    {
      uint64_t v349 = 0;
      do
      {
        if (*(void *)v585 != v348) {
          objc_enumerationMutation(v345);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6RxTx:*(void *)(*((void *)&v584 + 1) + 8 * v349++)];
      }
      while (v347 != v349);
      uint64_t v347 = [v345 countByEnumeratingWithState:&v584 objects:v886 count:16];
    }
    while (v347);
  }

  long long v583 = 0u;
  long long v582 = 0u;
  long long v581 = 0u;
  long long v580 = 0u;
  id v350 = v4[65];
  uint64_t v351 = [v350 countByEnumeratingWithState:&v580 objects:v885 count:16];
  if (v351)
  {
    uint64_t v352 = v351;
    uint64_t v353 = *(void *)v581;
    do
    {
      uint64_t v354 = 0;
      do
      {
        if (*(void *)v581 != v353) {
          objc_enumerationMutation(v350);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6CarrierComponentInfo:*(void *)(*((void *)&v580 + 1) + 8 * v354++)];
      }
      while (v352 != v354);
      uint64_t v352 = [v350 countByEnumeratingWithState:&v580 objects:v885 count:16];
    }
    while (v352);
  }

  long long v579 = 0u;
  long long v578 = 0u;
  long long v577 = 0u;
  long long v576 = 0u;
  id v355 = v4[66];
  uint64_t v356 = [v355 countByEnumeratingWithState:&v576 objects:v884 count:16];
  if (v356)
  {
    uint64_t v357 = v356;
    uint64_t v358 = *(void *)v577;
    do
    {
      uint64_t v359 = 0;
      do
      {
        if (*(void *)v577 != v358) {
          objc_enumerationMutation(v355);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6DLTBS:*(void *)(*((void *)&v576 + 1) + 8 * v359++)];
      }
      while (v357 != v359);
      uint64_t v357 = [v355 countByEnumeratingWithState:&v576 objects:v884 count:16];
    }
    while (v357);
  }

  long long v575 = 0u;
  long long v574 = 0u;
  long long v573 = 0u;
  long long v572 = 0u;
  id v360 = v4[67];
  uint64_t v361 = [v360 countByEnumeratingWithState:&v572 objects:v883 count:16];
  if (v361)
  {
    uint64_t v362 = v361;
    uint64_t v363 = *(void *)v573;
    do
    {
      uint64_t v364 = 0;
      do
      {
        if (*(void *)v573 != v363) {
          objc_enumerationMutation(v360);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6RSRP:*(void *)(*((void *)&v572 + 1) + 8 * v364++)];
      }
      while (v362 != v364);
      uint64_t v362 = [v360 countByEnumeratingWithState:&v572 objects:v883 count:16];
    }
    while (v362);
  }

  long long v571 = 0u;
  long long v570 = 0u;
  long long v569 = 0u;
  long long v568 = 0u;
  id v365 = v4[71];
  uint64_t v366 = [v365 countByEnumeratingWithState:&v568 objects:v882 count:16];
  if (v366)
  {
    uint64_t v367 = v366;
    uint64_t v368 = *(void *)v569;
    do
    {
      uint64_t v369 = 0;
      do
      {
        if (*(void *)v569 != v368) {
          objc_enumerationMutation(v365);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6ULCAState:*(void *)(*((void *)&v568 + 1) + 8 * v369++)];
      }
      while (v367 != v369);
      uint64_t v367 = [v365 countByEnumeratingWithState:&v568 objects:v882 count:16];
    }
    while (v367);
  }

  long long v567 = 0u;
  long long v566 = 0u;
  long long v565 = 0u;
  long long v564 = 0u;
  id v370 = v4[70];
  uint64_t v371 = [v370 countByEnumeratingWithState:&v564 objects:v881 count:16];
  if (v371)
  {
    uint64_t v372 = v371;
    uint64_t v373 = *(void *)v565;
    do
    {
      uint64_t v374 = 0;
      do
      {
        if (*(void *)v565 != v373) {
          objc_enumerationMutation(v370);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6TxPower:*(void *)(*((void *)&v564 + 1) + 8 * v374++)];
      }
      while (v372 != v374);
      uint64_t v372 = [v370 countByEnumeratingWithState:&v564 objects:v881 count:16];
    }
    while (v372);
  }

  long long v563 = 0u;
  long long v562 = 0u;
  long long v561 = 0u;
  long long v560 = 0u;
  id v375 = v4[68];
  uint64_t v376 = [v375 countByEnumeratingWithState:&v560 objects:v880 count:16];
  if (v376)
  {
    uint64_t v377 = v376;
    uint64_t v378 = *(void *)v561;
    do
    {
      uint64_t v379 = 0;
      do
      {
        if (*(void *)v561 != v378) {
          objc_enumerationMutation(v375);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6RxDiversity:*(void *)(*((void *)&v560 + 1) + 8 * v379++)];
      }
      while (v377 != v379);
      uint64_t v377 = [v375 countByEnumeratingWithState:&v560 objects:v880 count:16];
    }
    while (v377);
  }

  long long v559 = 0u;
  long long v558 = 0u;
  long long v557 = 0u;
  long long v556 = 0u;
  id v380 = v4[83];
  uint64_t v381 = [v380 countByEnumeratingWithState:&v556 objects:v879 count:16];
  if (v381)
  {
    uint64_t v382 = v381;
    uint64_t v383 = *(void *)v557;
    do
    {
      uint64_t v384 = 0;
      do
      {
        if (*(void *)v557 != v383) {
          objc_enumerationMutation(v380);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogSPMI:*(void *)(*((void *)&v556 + 1) + 8 * v384++)];
      }
      while (v382 != v384);
      uint64_t v382 = [v380 countByEnumeratingWithState:&v556 objects:v879 count:16];
    }
    while (v382);
  }

  long long v555 = 0u;
  long long v554 = 0u;
  long long v553 = 0u;
  long long v552 = 0u;
  id v385 = v4[53];
  uint64_t v386 = [v385 countByEnumeratingWithState:&v552 objects:v878 count:16];
  if (v386)
  {
    uint64_t v387 = v386;
    uint64_t v388 = *(void *)v553;
    do
    {
      uint64_t v389 = 0;
      do
      {
        if (*(void *)v553 != v388) {
          objc_enumerationMutation(v385);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRmmWaveBWP:*(void *)(*((void *)&v552 + 1) + 8 * v389++)];
      }
      while (v387 != v389);
      uint64_t v387 = [v385 countByEnumeratingWithState:&v552 objects:v878 count:16];
    }
    while (v387);
  }

  long long v551 = 0u;
  long long v550 = 0u;
  long long v549 = 0u;
  long long v548 = 0u;
  id v390 = v4[51];
  uint64_t v391 = [v390 countByEnumeratingWithState:&v548 objects:v877 count:16];
  if (v391)
  {
    uint64_t v392 = v391;
    uint64_t v393 = *(void *)v549;
    do
    {
      uint64_t v394 = 0;
      do
      {
        if (*(void *)v549 != v393) {
          objc_enumerationMutation(v390);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRmmWaveAntennaPanel:*(void *)(*((void *)&v548 + 1) + 8 * v394++)];
      }
      while (v392 != v394);
      uint64_t v392 = [v390 countByEnumeratingWithState:&v548 objects:v877 count:16];
    }
    while (v392);
  }

  long long v547 = 0u;
  long long v546 = 0u;
  long long v545 = 0u;
  long long v544 = 0u;
  id v395 = v4[43];
  uint64_t v396 = [v395 countByEnumeratingWithState:&v544 objects:v876 count:16];
  if (v396)
  {
    uint64_t v397 = v396;
    uint64_t v398 = *(void *)v545;
    do
    {
      uint64_t v399 = 0;
      do
      {
        if (*(void *)v545 != v398) {
          objc_enumerationMutation(v395);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRFRCoverage:*(void *)(*((void *)&v544 + 1) + 8 * v399++)];
      }
      while (v397 != v399);
      uint64_t v397 = [v395 countByEnumeratingWithState:&v544 objects:v876 count:16];
    }
    while (v397);
  }

  long long v542 = 0u;
  long long v543 = 0u;
  long long v540 = 0u;
  long long v541 = 0u;
  id v400 = v4[54];
  uint64_t v401 = [v400 countByEnumeratingWithState:&v540 objects:v875 count:16];
  if (v401)
  {
    uint64_t v402 = v401;
    uint64_t v403 = *(void *)v541;
    do
    {
      uint64_t v404 = 0;
      do
      {
        if (*(void *)v541 != v403) {
          objc_enumerationMutation(v400);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRmmWaveBeamID:*(void *)(*((void *)&v540 + 1) + 8 * v404++)];
      }
      while (v402 != v404);
      uint64_t v402 = [v400 countByEnumeratingWithState:&v540 objects:v875 count:16];
    }
    while (v402);
  }

  long long v538 = 0u;
  long long v539 = 0u;
  long long v536 = 0u;
  long long v537 = 0u;
  id v405 = v4[82];
  uint64_t v406 = [v405 countByEnumeratingWithState:&v536 objects:v874 count:16];
  if (v406)
  {
    uint64_t v407 = v406;
    uint64_t v408 = *(void *)v537;
    do
    {
      uint64_t v409 = 0;
      do
      {
        if (*(void *)v537 != v408) {
          objc_enumerationMutation(v405);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogSFTState:*(void *)(*((void *)&v536 + 1) + 8 * v409++)];
      }
      while (v407 != v409);
      uint64_t v407 = [v405 countByEnumeratingWithState:&v536 objects:v874 count:16];
    }
    while (v407);
  }

  long long v534 = 0u;
  long long v535 = 0u;
  long long v532 = 0u;
  long long v533 = 0u;
  id v410 = v4[56];
  uint64_t v411 = [v410 countByEnumeratingWithState:&v532 objects:v873 count:16];
  if (v411)
  {
    uint64_t v412 = v411;
    uint64_t v413 = *(void *)v533;
    do
    {
      uint64_t v414 = 0;
      do
      {
        if (*(void *)v533 != v413) {
          objc_enumerationMutation(v410);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRmmWaveCASCCConfigured:*(void *)(*((void *)&v532 + 1) + 8 * v414++)];
      }
      while (v412 != v414);
      uint64_t v412 = [v410 countByEnumeratingWithState:&v532 objects:v873 count:16];
    }
    while (v412);
  }

  long long v530 = 0u;
  long long v531 = 0u;
  long long v528 = 0u;
  long long v529 = 0u;
  id v415 = v4[55];
  uint64_t v416 = [v415 countByEnumeratingWithState:&v528 objects:v872 count:16];
  if (v416)
  {
    uint64_t v417 = v416;
    uint64_t v418 = *(void *)v529;
    do
    {
      uint64_t v419 = 0;
      do
      {
        if (*(void *)v529 != v418) {
          objc_enumerationMutation(v415);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRmmWaveCASCCActivated:*(void *)(*((void *)&v528 + 1) + 8 * v419++)];
      }
      while (v417 != v419);
      uint64_t v417 = [v415 countByEnumeratingWithState:&v528 objects:v872 count:16];
    }
    while (v417);
  }

  long long v526 = 0u;
  long long v527 = 0u;
  long long v524 = 0u;
  long long v525 = 0u;
  id v420 = v4[59];
  uint64_t v421 = [v420 countByEnumeratingWithState:&v524 objects:v871 count:16];
  if (v421)
  {
    uint64_t v422 = v421;
    uint64_t v423 = *(void *)v525;
    do
    {
      uint64_t v424 = 0;
      do
      {
        if (*(void *)v525 != v423) {
          objc_enumerationMutation(v420);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRmmWaveRxTx:*(void *)(*((void *)&v524 + 1) + 8 * v424++)];
      }
      while (v422 != v424);
      uint64_t v422 = [v420 countByEnumeratingWithState:&v524 objects:v871 count:16];
    }
    while (v422);
  }

  long long v522 = 0u;
  long long v523 = 0u;
  long long v520 = 0u;
  long long v521 = 0u;
  id v425 = v4[57];
  uint64_t v426 = [v425 countByEnumeratingWithState:&v520 objects:v870 count:16];
  if (v426)
  {
    uint64_t v427 = v426;
    uint64_t v428 = *(void *)v521;
    do
    {
      uint64_t v429 = 0;
      do
      {
        if (*(void *)v521 != v428) {
          objc_enumerationMutation(v425);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRmmWaveCarrierComponentInfo:*(void *)(*((void *)&v520 + 1) + 8 * v429++)];
      }
      while (v427 != v429);
      uint64_t v427 = [v425 countByEnumeratingWithState:&v520 objects:v870 count:16];
    }
    while (v427);
  }

  long long v518 = 0u;
  long long v519 = 0u;
  long long v516 = 0u;
  long long v517 = 0u;
  id v430 = v4[58];
  uint64_t v431 = [v430 countByEnumeratingWithState:&v516 objects:v869 count:16];
  if (v431)
  {
    uint64_t v432 = v431;
    uint64_t v433 = *(void *)v517;
    do
    {
      uint64_t v434 = 0;
      do
      {
        if (*(void *)v517 != v433) {
          objc_enumerationMutation(v430);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRmmWaveDLTBS:*(void *)(*((void *)&v516 + 1) + 8 * v434++)];
      }
      while (v432 != v434);
      uint64_t v432 = [v430 countByEnumeratingWithState:&v516 objects:v869 count:16];
    }
    while (v432);
  }

  long long v514 = 0u;
  long long v515 = 0u;
  long long v512 = 0u;
  long long v513 = 0u;
  id v435 = v4[44];
  uint64_t v436 = [v435 countByEnumeratingWithState:&v512 objects:v868 count:16];
  if (v436)
  {
    uint64_t v437 = v436;
    uint64_t v438 = *(void *)v513;
    do
    {
      uint64_t v439 = 0;
      do
      {
        if (*(void *)v513 != v438) {
          objc_enumerationMutation(v435);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRMmWaveRSRP:*(void *)(*((void *)&v512 + 1) + 8 * v439++)];
      }
      while (v437 != v439);
      uint64_t v437 = [v435 countByEnumeratingWithState:&v512 objects:v868 count:16];
    }
    while (v437);
  }

  long long v510 = 0u;
  long long v511 = 0u;
  long long v508 = 0u;
  long long v509 = 0u;
  id v440 = v4[81];
  uint64_t v441 = [v440 countByEnumeratingWithState:&v508 objects:v867 count:16];
  if (v441)
  {
    uint64_t v442 = v441;
    uint64_t v443 = *(void *)v509;
    do
    {
      uint64_t v444 = 0;
      do
      {
        if (*(void *)v509 != v443) {
          objc_enumerationMutation(v440);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogSFTRxTx:*(void *)(*((void *)&v508 + 1) + 8 * v444++)];
      }
      while (v442 != v444);
      uint64_t v442 = [v440 countByEnumeratingWithState:&v508 objects:v867 count:16];
    }
    while (v442);
  }

  long long v506 = 0u;
  long long v507 = 0u;
  long long v504 = 0u;
  long long v505 = 0u;
  id v445 = v4[45];
  uint64_t v446 = [v445 countByEnumeratingWithState:&v504 objects:v866 count:16];
  if (v446)
  {
    uint64_t v447 = v446;
    uint64_t v448 = *(void *)v505;
    do
    {
      uint64_t v449 = 0;
      do
      {
        if (*(void *)v505 != v448) {
          objc_enumerationMutation(v445);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRMmWaveTxPower:*(void *)(*((void *)&v504 + 1) + 8 * v449++)];
      }
      while (v447 != v449);
      uint64_t v447 = [v445 countByEnumeratingWithState:&v504 objects:v866 count:16];
    }
    while (v447);
  }

  long long v502 = 0u;
  long long v503 = 0u;
  long long v500 = 0u;
  long long v501 = 0u;
  id v450 = v4[46];
  uint64_t v451 = [v450 countByEnumeratingWithState:&v500 objects:v865 count:16];
  if (v451)
  {
    uint64_t v452 = v451;
    uint64_t v453 = *(void *)v501;
    do
    {
      uint64_t v454 = 0;
      do
      {
        if (*(void *)v501 != v453) {
          objc_enumerationMutation(v450);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRMmWaveULCAState:*(void *)(*((void *)&v500 + 1) + 8 * v454++)];
      }
      while (v452 != v454);
      uint64_t v452 = [v450 countByEnumeratingWithState:&v500 objects:v865 count:16];
    }
    while (v452);
  }

  long long v498 = 0u;
  long long v499 = 0u;
  long long v496 = 0u;
  long long v497 = 0u;
  id v455 = v4[61];
  uint64_t v456 = [v455 countByEnumeratingWithState:&v496 objects:v864 count:16];
  if (v456)
  {
    uint64_t v457 = v456;
    uint64_t v458 = *(void *)v497;
    do
    {
      uint64_t v459 = 0;
      do
      {
        if (*(void *)v497 != v458) {
          objc_enumerationMutation(v455);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRsub6BWPSCC:*(void *)(*((void *)&v496 + 1) + 8 * v459++)];
      }
      while (v457 != v459);
      uint64_t v457 = [v455 countByEnumeratingWithState:&v496 objects:v864 count:16];
    }
    while (v457);
  }

  long long v494 = 0u;
  long long v495 = 0u;
  long long v492 = 0u;
  long long v493 = 0u;
  id v460 = v4[52];
  uint64_t v461 = [v460 countByEnumeratingWithState:&v492 objects:v863 count:16];
  if (v461)
  {
    uint64_t v462 = v461;
    uint64_t v463 = *(void *)v493;
    do
    {
      uint64_t v464 = 0;
      do
      {
        if (*(void *)v493 != v463) {
          objc_enumerationMutation(v460);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRmmWaveBWPSCC:*(void *)(*((void *)&v492 + 1) + 8 * v464++)];
      }
      while (v462 != v464);
      uint64_t v462 = [v460 countByEnumeratingWithState:&v492 objects:v863 count:16];
    }
    while (v462);
  }

  long long v490 = 0u;
  long long v491 = 0u;
  long long v488 = 0u;
  long long v489 = 0u;
  id v465 = v4[42];
  uint64_t v466 = [v465 countByEnumeratingWithState:&v488 objects:v862 count:16];
  if (v466)
  {
    uint64_t v467 = v466;
    uint64_t v468 = *(void *)v489;
    do
    {
      uint64_t v469 = 0;
      do
      {
        if (*(void *)v489 != v468) {
          objc_enumerationMutation(v465);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogNRDCEvent:*(void *)(*((void *)&v488 + 1) + 8 * v469++)];
      }
      while (v467 != v469);
      uint64_t v467 = [v465 countByEnumeratingWithState:&v488 objects:v862 count:16];
    }
    while (v467);
  }

  long long v486 = 0u;
  long long v487 = 0u;
  long long v484 = 0u;
  long long v485 = 0u;
  id v470 = v4[94];
  uint64_t v471 = [v470 countByEnumeratingWithState:&v484 objects:v861 count:16];
  if (v471)
  {
    uint64_t v472 = v471;
    uint64_t v473 = *(void *)v485;
    do
    {
      uint64_t v474 = 0;
      do
      {
        if (*(void *)v485 != v473) {
          objc_enumerationMutation(v470);
        }
        [(AWDMETRICSCellularPowerLog *)self addCellularPowerLogWUS:*(void *)(*((void *)&v484 + 1) + 8 * v474++)];
      }
      while (v472 != v474);
      uint64_t v472 = [v470 countByEnumeratingWithState:&v484 objects:v861 count:16];
    }
    while (v472);
  }

  long long v482 = 0u;
  long long v483 = 0u;
  long long v480 = 0u;
  long long v481 = 0u;
  id v475 = v4[60];
  uint64_t v476 = [v475 countByEnumeratingWithState:&v480 objects:v860 count:16];
  if (v476)
  {
    uint64_t v477 = v476;
    uint64_t v478 = *(void *)v481;
    do
    {
      uint64_t v479 = 0;
      do
      {
        if (*(void *)v481 != v478) {
          objc_enumerationMutation(v475);
        }
        -[AWDMETRICSCellularPowerLog addCellularPowerLogNRsub6BWPSA:](self, "addCellularPowerLogNRsub6BWPSA:", *(void *)(*((void *)&v480 + 1) + 8 * v479++), (void)v480);
      }
      while (v477 != v479);
      uint64_t v477 = [v475 countByEnumeratingWithState:&v480 objects:v860 count:16];
    }
    while (v477);
  }
}

- (NSMutableArray)cellularPerClientProfileTriggerCounts
{
  return self->_cellularPerClientProfileTriggerCounts;
}

- (void)setCellularPerClientProfileTriggerCounts:(id)a3
{
}

- (NSMutableArray)cellularPowerLogXOShutdowns
{
  return self->_cellularPowerLogXOShutdowns;
}

- (void)setCellularPowerLogXOShutdowns:(id)a3
{
}

- (NSMutableArray)cellularPowerLogAPPSPerfLevels
{
  return self->_cellularPowerLogAPPSPerfLevels;
}

- (void)setCellularPowerLogAPPSPerfLevels:(id)a3
{
}

- (NSMutableArray)cellularPowerLogAPPSCXOShutdowns
{
  return self->_cellularPowerLogAPPSCXOShutdowns;
}

- (void)setCellularPowerLogAPPSCXOShutdowns:(id)a3
{
}

- (NSMutableArray)cellularPowerLogAPPSSleepVetos
{
  return self->_cellularPowerLogAPPSSleepVetos;
}

- (void)setCellularPowerLogAPPSSleepVetos:(id)a3
{
}

- (NSMutableArray)cellularPowerLogMCPMSleepVetos
{
  return self->_cellularPowerLogMCPMSleepVetos;
}

- (void)setCellularPowerLogMCPMSleepVetos:(id)a3
{
}

- (NSMutableArray)cellularPowerLogMPSSPerfLevels
{
  return self->_cellularPowerLogMPSSPerfLevels;
}

- (void)setCellularPowerLogMPSSPerfLevels:(id)a3
{
}

- (NSMutableArray)cellularPowerLogGPSStates
{
  return self->_cellularPowerLogGPSStates;
}

- (void)setCellularPowerLogGPSStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogAOPUARTStates
{
  return self->_cellularPowerLogAOPUARTStates;
}

- (void)setCellularPowerLogAOPUARTStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogWLANUARTStates
{
  return self->_cellularPowerLogWLANUARTStates;
}

- (void)setCellularPowerLogWLANUARTStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogPCIeStates
{
  return self->_cellularPowerLogPCIeStates;
}

- (void)setCellularPowerLogPCIeStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogL1SleepStates
{
  return self->_cellularPowerLogL1SleepStates;
}

- (void)setCellularPowerLogL1SleepStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogPowerEstimators
{
  return self->_cellularPowerLogPowerEstimators;
}

- (void)setCellularPowerLogPowerEstimators:(id)a3
{
}

- (NSMutableArray)cellularPowerLogRFTunerStatsHists
{
  return self->_cellularPowerLogRFTunerStatsHists;
}

- (void)setCellularPowerLogRFTunerStatsHists:(id)a3
{
}

- (NSMutableArray)cellularPowerLogSPMIs
{
  return self->_cellularPowerLogSPMIs;
}

- (void)setCellularPowerLogSPMIs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTEConfiguredCASCCStates
{
  return self->_cellularPowerLogLTEConfiguredCASCCStates;
}

- (void)setCellularPowerLogLTEConfiguredCASCCStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTEActivatedCASCCStates
{
  return self->_cellularPowerLogLTEActivatedCASCCStates;
}

- (void)setCellularPowerLogLTEActivatedCASCCStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTERxTxActivityStates
{
  return self->_cellularPowerLogLTERxTxActivityStates;
}

- (void)setCellularPowerLogLTERxTxActivityStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTECarrierComponentInfos
{
  return self->_cellularPowerLogLTECarrierComponentInfos;
}

- (void)setCellularPowerLogLTECarrierComponentInfos:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTEAggregatedDLTBSs
{
  return self->_cellularPowerLogLTEAggregatedDLTBSs;
}

- (void)setCellularPowerLogLTEAggregatedDLTBSs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTERSRPs
{
  return self->_cellularPowerLogLTERSRPs;
}

- (void)setCellularPowerLogLTERSRPs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTESINRs
{
  return self->_cellularPowerLogLTESINRs;
}

- (void)setCellularPowerLogLTESINRs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTETxPowers
{
  return self->_cellularPowerLogLTETxPowers;
}

- (void)setCellularPowerLogLTETxPowers:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTERxDiversitys
{
  return self->_cellularPowerLogLTERxDiversitys;
}

- (void)setCellularPowerLogLTERxDiversitys:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTEULCAStates
{
  return self->_cellularPowerLogLTEULCAStates;
}

- (void)setCellularPowerLogLTEULCAStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogProtocolStates
{
  return self->_cellularPowerLogProtocolStates;
}

- (void)setCellularPowerLogProtocolStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogPLMNSearchs
{
  return self->_cellularPowerLogPLMNSearchs;
}

- (void)setCellularPowerLogPLMNSearchs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogGSMTxPowers
{
  return self->_cellularPowerLogGSMTxPowers;
}

- (void)setCellularPowerLogGSMTxPowers:(id)a3
{
}

- (NSMutableArray)cellularPowerLogGSMRxRSSIs
{
  return self->_cellularPowerLogGSMRxRSSIs;
}

- (void)setCellularPowerLogGSMRxRSSIs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogGSMRABModes
{
  return self->_cellularPowerLogGSMRABModes;
}

- (void)setCellularPowerLogGSMRABModes:(id)a3
{
}

- (NSMutableArray)cellularPowerLogGSMRxDiversitys
{
  return self->_cellularPowerLogGSMRxDiversitys;
}

- (void)setCellularPowerLogGSMRxDiversitys:(id)a3
{
}

- (NSMutableArray)cellularPowerLogWCDMATxPowers
{
  return self->_cellularPowerLogWCDMATxPowers;
}

- (void)setCellularPowerLogWCDMATxPowers:(id)a3
{
}

- (NSMutableArray)cellularPowerLogWCDMARxRSSIs
{
  return self->_cellularPowerLogWCDMARxRSSIs;
}

- (void)setCellularPowerLogWCDMARxRSSIs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogWCDMARxDiversitys
{
  return self->_cellularPowerLogWCDMARxDiversitys;
}

- (void)setCellularPowerLogWCDMARxDiversitys:(id)a3
{
}

- (NSMutableArray)cellularPowerLogWCDMARABModes
{
  return self->_cellularPowerLogWCDMARABModes;
}

- (void)setCellularPowerLogWCDMARABModes:(id)a3
{
}

- (NSMutableArray)cellularPowerLogWCDMARABTypes
{
  return self->_cellularPowerLogWCDMARABTypes;
}

- (void)setCellularPowerLogWCDMARABTypes:(id)a3
{
}

- (NSMutableArray)cellularPowerLogEVDOTxPowers
{
  return self->_cellularPowerLogEVDOTxPowers;
}

- (void)setCellularPowerLogEVDOTxPowers:(id)a3
{
}

- (NSMutableArray)cellularPowerLogEVDORxRSSIs
{
  return self->_cellularPowerLogEVDORxRSSIs;
}

- (void)setCellularPowerLogEVDORxRSSIs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogHybridRABModes
{
  return self->_cellularPowerLogHybridRABModes;
}

- (void)setCellularPowerLogHybridRABModes:(id)a3
{
}

- (NSMutableArray)cellularPowerLogEVDORxDiversitys
{
  return self->_cellularPowerLogEVDORxDiversitys;
}

- (void)setCellularPowerLogEVDORxDiversitys:(id)a3
{
}

- (NSMutableArray)cellularPowerLogCDMA1XTxPowers
{
  return self->_cellularPowerLogCDMA1XTxPowers;
}

- (void)setCellularPowerLogCDMA1XTxPowers:(id)a3
{
}

- (NSMutableArray)cellularPowerLogCDMA1XRxRSSIs
{
  return self->_cellularPowerLogCDMA1XRxRSSIs;
}

- (void)setCellularPowerLogCDMA1XRxRSSIs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogCDMA1XRABModes
{
  return self->_cellularPowerLogCDMA1XRABModes;
}

- (void)setCellularPowerLogCDMA1XRABModes:(id)a3
{
}

- (NSMutableArray)cellularPowerLogCDMA1XRxDiversitys
{
  return self->_cellularPowerLogCDMA1XRxDiversitys;
}

- (void)setCellularPowerLogCDMA1XRxDiversitys:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTEPagingDRXCycles
{
  return self->_cellularPowerLogLTEPagingDRXCycles;
}

- (void)setCellularPowerLogLTEPagingDRXCycles:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRPagingDRXCycles
{
  return self->_cellularPowerLogNRPagingDRXCycles;
}

- (void)setCellularPowerLogNRPagingDRXCycles:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRSCGRels
{
  return self->_cellularPowerLogNRSCGRels;
}

- (void)setCellularPowerLogNRSCGRels:(id)a3
{
}

- (NSMutableArray)cellularPowerLogWCDMACDRXConfigs
{
  return self->_cellularPowerLogWCDMACDRXConfigs;
}

- (void)setCellularPowerLogWCDMACDRXConfigs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTECDRXConfigs
{
  return self->_cellularPowerLogLTECDRXConfigs;
}

- (void)setCellularPowerLogLTECDRXConfigs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogWCDMARRCStateChanges
{
  return self->_cellularPowerLogWCDMARRCStateChanges;
}

- (void)setCellularPowerLogWCDMARRCStateChanges:(id)a3
{
}

- (NSMutableArray)cellularPowerLogLTERRCStateChanges
{
  return self->_cellularPowerLogLTERRCStateChanges;
}

- (void)setCellularPowerLogLTERRCStateChanges:(id)a3
{
}

- (NSMutableArray)cellularPowerLogSystemEvents
{
  return self->_cellularPowerLogSystemEvents;
}

- (void)setCellularPowerLogSystemEvents:(id)a3
{
}

- (NSMutableArray)cellularPowerLogRATReselectionEvents
{
  return self->_cellularPowerLogRATReselectionEvents;
}

- (void)setCellularPowerLogRATReselectionEvents:(id)a3
{
}

- (NSMutableArray)cellularPowerLogRATRedirectionEvents
{
  return self->_cellularPowerLogRATRedirectionEvents;
}

- (void)setCellularPowerLogRATRedirectionEvents:(id)a3
{
}

- (NSMutableArray)cellularPowerLogGSMRRCStateChanges
{
  return self->_cellularPowerLogGSMRRCStateChanges;
}

- (void)setCellularPowerLogGSMRRCStateChanges:(id)a3
{
}

- (NSMutableArray)cellularPowerLogCDMA1XRRCStateChanges
{
  return self->_cellularPowerLogCDMA1XRRCStateChanges;
}

- (void)setCellularPowerLogCDMA1XRRCStateChanges:(id)a3
{
}

- (NSMutableArray)cellularPowerLogHybridRRCStateChanges
{
  return self->_cellularPowerLogHybridRRCStateChanges;
}

- (void)setCellularPowerLogHybridRRCStateChanges:(id)a3
{
}

- (NSMutableArray)cellularPowerLogServiceStateEvents
{
  return self->_cellularPowerLogServiceStateEvents;
}

- (void)setCellularPowerLogServiceStateEvents:(id)a3
{
}

- (NSMutableArray)cellularPowerLogPLMNScanEvents
{
  return self->_cellularPowerLogPLMNScanEvents;
}

- (void)setCellularPowerLogPLMNScanEvents:(id)a3
{
}

- (NSMutableArray)cellularPowerLogPLMNSearchEvents
{
  return self->_cellularPowerLogPLMNSearchEvents;
}

- (void)setCellularPowerLogPLMNSearchEvents:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRSARRCStateChanges
{
  return self->_cellularPowerLogNRSARRCStateChanges;
}

- (void)setCellularPowerLogNRSARRCStateChanges:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRNSAENDCEvents
{
  return self->_cellularPowerLogNRNSAENDCEvents;
}

- (void)setCellularPowerLogNRNSAENDCEvents:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRCDRXConfigs
{
  return self->_cellularPowerLogNRCDRXConfigs;
}

- (void)setCellularPowerLogNRCDRXConfigs:(id)a3
{
}

- (NSMutableArray)cellularNrSDMActivations
{
  return self->_cellularNrSDMActivations;
}

- (void)setCellularNrSDMActivations:(id)a3
{
}

- (NSMutableArray)cellularNrSdmEndcReleases
{
  return self->_cellularNrSdmEndcReleases;
}

- (void)setCellularNrSdmEndcReleases:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRFRCoverages
{
  return self->_cellularPowerLogNRFRCoverages;
}

- (void)setCellularPowerLogNRFRCoverages:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRDCEvents
{
  return self->_cellularPowerLogNRDCEvents;
}

- (void)setCellularPowerLogNRDCEvents:(id)a3
{
}

- (NSMutableArray)cellularDynamicRatSelections
{
  return self->_cellularDynamicRatSelections;
}

- (void)setCellularDynamicRatSelections:(id)a3
{
}

- (NSMutableArray)cellularPowerLogWUSs
{
  return self->_cellularPowerLogWUSs;
}

- (void)setCellularPowerLogWUSs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6BWPs
{
  return self->_cellularPowerLogNRsub6BWPs;
}

- (void)setCellularPowerLogNRsub6BWPs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6CASCCConfigureds
{
  return self->_cellularPowerLogNRsub6CASCCConfigureds;
}

- (void)setCellularPowerLogNRsub6CASCCConfigureds:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6CASCCActivateds
{
  return self->_cellularPowerLogNRsub6CASCCActivateds;
}

- (void)setCellularPowerLogNRsub6CASCCActivateds:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6RxTxs
{
  return self->_cellularPowerLogNRsub6RxTxs;
}

- (void)setCellularPowerLogNRsub6RxTxs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6CarrierComponentInfos
{
  return self->_cellularPowerLogNRsub6CarrierComponentInfos;
}

- (void)setCellularPowerLogNRsub6CarrierComponentInfos:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6DLTBSs
{
  return self->_cellularPowerLogNRsub6DLTBSs;
}

- (void)setCellularPowerLogNRsub6DLTBSs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6RSRPs
{
  return self->_cellularPowerLogNRsub6RSRPs;
}

- (void)setCellularPowerLogNRsub6RSRPs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6ULCAStates
{
  return self->_cellularPowerLogNRsub6ULCAStates;
}

- (void)setCellularPowerLogNRsub6ULCAStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6TxPowers
{
  return self->_cellularPowerLogNRsub6TxPowers;
}

- (void)setCellularPowerLogNRsub6TxPowers:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6RxDiversitys
{
  return self->_cellularPowerLogNRsub6RxDiversitys;
}

- (void)setCellularPowerLogNRsub6RxDiversitys:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6BWPSCCs
{
  return self->_cellularPowerLogNRsub6BWPSCCs;
}

- (void)setCellularPowerLogNRsub6BWPSCCs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRsub6BWPSAs
{
  return self->_cellularPowerLogNRsub6BWPSAs;
}

- (void)setCellularPowerLogNRsub6BWPSAs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRmmWaveBWPs
{
  return self->_cellularPowerLogNRmmWaveBWPs;
}

- (void)setCellularPowerLogNRmmWaveBWPs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRmmWaveAntennaPanels
{
  return self->_cellularPowerLogNRmmWaveAntennaPanels;
}

- (void)setCellularPowerLogNRmmWaveAntennaPanels:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRmmWaveBeamIDs
{
  return self->_cellularPowerLogNRmmWaveBeamIDs;
}

- (void)setCellularPowerLogNRmmWaveBeamIDs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRmmWaveCASCCConfigureds
{
  return self->_cellularPowerLogNRmmWaveCASCCConfigureds;
}

- (void)setCellularPowerLogNRmmWaveCASCCConfigureds:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRmmWaveCASCCActivateds
{
  return self->_cellularPowerLogNRmmWaveCASCCActivateds;
}

- (void)setCellularPowerLogNRmmWaveCASCCActivateds:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRmmWaveRxTxs
{
  return self->_cellularPowerLogNRmmWaveRxTxs;
}

- (void)setCellularPowerLogNRmmWaveRxTxs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRmmWaveCarrierComponentInfos
{
  return self->_cellularPowerLogNRmmWaveCarrierComponentInfos;
}

- (void)setCellularPowerLogNRmmWaveCarrierComponentInfos:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRmmWaveDLTBSs
{
  return self->_cellularPowerLogNRmmWaveDLTBSs;
}

- (void)setCellularPowerLogNRmmWaveDLTBSs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRMmWaveRSRPs
{
  return self->_cellularPowerLogNRMmWaveRSRPs;
}

- (void)setCellularPowerLogNRMmWaveRSRPs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRMmWaveTxPowers
{
  return self->_cellularPowerLogNRMmWaveTxPowers;
}

- (void)setCellularPowerLogNRMmWaveTxPowers:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRMmWaveULCAStates
{
  return self->_cellularPowerLogNRMmWaveULCAStates;
}

- (void)setCellularPowerLogNRMmWaveULCAStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogNRmmWaveBWPSCCs
{
  return self->_cellularPowerLogNRmmWaveBWPSCCs;
}

- (void)setCellularPowerLogNRmmWaveBWPSCCs:(id)a3
{
}

- (NSMutableArray)cellularPowerLogSFTStates
{
  return self->_cellularPowerLogSFTStates;
}

- (void)setCellularPowerLogSFTStates:(id)a3
{
}

- (NSMutableArray)cellularPowerLogSFTRxTxs
{
  return self->_cellularPowerLogSFTRxTxs;
}

- (void)setCellularPowerLogSFTRxTxs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cellularPowerLogXOShutdowns, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogWUSs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogWLANUARTStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogWCDMATxPowers, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogWCDMARxRSSIs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogWCDMARxDiversitys, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogWCDMARRCStateChanges, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogWCDMARABTypes, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogWCDMARABModes, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogWCDMACDRXConfigs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogSystemEvents, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogServiceStateEvents, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogSPMIs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogSFTStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogSFTRxTxs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogRFTunerStatsHists, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogRATReselectionEvents, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogRATRedirectionEvents, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogProtocolStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogPowerEstimators, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogPLMNSearchs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogPLMNSearchEvents, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogPLMNScanEvents, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogPCIeStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6ULCAStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6TxPowers, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6RxTxs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6RxDiversitys, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6RSRPs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6DLTBSs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6CarrierComponentInfos, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6CASCCConfigureds, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6CASCCActivateds, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6BWPs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6BWPSCCs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRsub6BWPSAs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRmmWaveRxTxs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRmmWaveDLTBSs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRmmWaveCarrierComponentInfos, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRmmWaveCASCCConfigureds, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRmmWaveCASCCActivateds, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRmmWaveBeamIDs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRmmWaveBWPs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRmmWaveBWPSCCs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRmmWaveAntennaPanels, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRSCGRels, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRSARRCStateChanges, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRPagingDRXCycles, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRNSAENDCEvents, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRMmWaveULCAStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRMmWaveTxPowers, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRMmWaveRSRPs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRFRCoverages, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRDCEvents, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogNRCDRXConfigs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogMPSSPerfLevels, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogMCPMSleepVetos, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTEULCAStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTETxPowers, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTESINRs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTERxTxActivityStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTERxDiversitys, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTERSRPs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTERRCStateChanges, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTEPagingDRXCycles, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTEConfiguredCASCCStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTECarrierComponentInfos, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTECDRXConfigs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTEAggregatedDLTBSs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogLTEActivatedCASCCStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogL1SleepStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogHybridRRCStateChanges, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogHybridRABModes, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogGSMTxPowers, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogGSMRxRSSIs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogGSMRxDiversitys, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogGSMRRCStateChanges, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogGSMRABModes, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogGPSStates, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogEVDOTxPowers, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogEVDORxRSSIs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogEVDORxDiversitys, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogCDMA1XTxPowers, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogCDMA1XRxRSSIs, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogCDMA1XRxDiversitys, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogCDMA1XRRCStateChanges, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogCDMA1XRABModes, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogAPPSSleepVetos, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogAPPSPerfLevels, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogAPPSCXOShutdowns, 0);
  objc_storeStrong((id *)&self->_cellularPowerLogAOPUARTStates, 0);
  objc_storeStrong((id *)&self->_cellularPerClientProfileTriggerCounts, 0);
  objc_storeStrong((id *)&self->_cellularNrSdmEndcReleases, 0);
  objc_storeStrong((id *)&self->_cellularNrSDMActivations, 0);
  objc_storeStrong((id *)&self->_cellularDynamicRatSelections, 0);
}

@end
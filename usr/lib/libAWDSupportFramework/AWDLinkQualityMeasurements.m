@interface AWDLinkQualityMeasurements
- (BOOL)hasAPTxDataStall;
- (BOOL)hasAccessPointOUI;
- (BOOL)hasAvailWLANDurMS;
- (BOOL)hasAvailWLANRxDurMS;
- (BOOL)hasAvailWLANTxDurMS;
- (BOOL)hasAvgTxLatencyMS;
- (BOOL)hasBTAntennaDurMS;
- (BOOL)hasBaselineThroughput;
- (BOOL)hasCCA;
- (BOOL)hasConcurrentIntDurMS;
- (BOOL)hasDelayedThroughput;
- (BOOL)hasExpectedThroughput;
- (BOOL)hasHighRxDataPERFalse;
- (BOOL)hasHighRxDataPERTrue;
- (BOOL)hasHighRxDecryptErrsFalse;
- (BOOL)hasHighRxDecryptErrsTrue;
- (BOOL)hasHighRxDupsFalse;
- (BOOL)hasHighRxDupsTrue;
- (BOOL)hasHighRxFCSErrsFalse;
- (BOOL)hasHighRxFCSErrsTrue;
- (BOOL)hasHighRxOverflowsFalse;
- (BOOL)hasHighRxOverflowsTrue;
- (BOOL)hasHighRxPhyPERFalse;
- (BOOL)hasHighRxPhyPERTrue;
- (BOOL)hasHighRxReplaysFalse;
- (BOOL)hasHighRxReplaysTrue;
- (BOOL)hasHighRxRetriesFalse;
- (BOOL)hasHighRxRetriesTrue;
- (BOOL)hasHighTxLatencyFalse;
- (BOOL)hasHighTxLatencyTrue;
- (BOOL)hasHighTxPerFalse;
- (BOOL)hasHighTxPerTrue;
- (BOOL)hasHighTxRetriesFalse;
- (BOOL)hasHighTxRetriesTrue;
- (BOOL)hasInfraDutyCycle;
- (BOOL)hasInputThroughput;
- (BOOL)hasIs2GBand;
- (BOOL)hasIsFGTraffic;
- (BOOL)hasLTECoexDurationMS;
- (BOOL)hasLastScanReason;
- (BOOL)hasLowAvailWLANDurFalse;
- (BOOL)hasLowAvailWLANDurTrue;
- (BOOL)hasLowAvailWLANRxDurFalse;
- (BOOL)hasLowAvailWLANRxDurTrue;
- (BOOL)hasLowAvailWLANTxDurFalse;
- (BOOL)hasLowAvailWLANTxDurTrue;
- (BOOL)hasLowTxAMPDUDensityFalse;
- (BOOL)hasLowTxAMPDUDensityTrue;
- (BOOL)hasLowTxPhyRateFalse;
- (BOOL)hasLowTxPhyRateTrue;
- (BOOL)hasMaxQueueFullDurMS;
- (BOOL)hasMeasurementDurMS;
- (BOOL)hasOffChanDurMS;
- (BOOL)hasOutputThroughput;
- (BOOL)hasPhyRxActivityDurMS;
- (BOOL)hasPhyTxActivityDurMS;
- (BOOL)hasRC1CoexDurationMS;
- (BOOL)hasRC2CoexDurationMS;
- (BOOL)hasRSSI;
- (BOOL)hasRxAmpduTxBaMismatch;
- (BOOL)hasRxCRSErrs;
- (BOOL)hasRxDecryErrs;
- (BOOL)hasRxDupErrs;
- (BOOL)hasRxFCSErrs;
- (BOOL)hasRxFrames;
- (BOOL)hasRxGoodPlcps;
- (BOOL)hasRxLowFrameCountFalse;
- (BOOL)hasRxLowFrameCountTrue;
- (BOOL)hasRxOvflErrs;
- (BOOL)hasRxPLCPErrs;
- (BOOL)hasRxPhyRate;
- (BOOL)hasRxReplayErrs;
- (BOOL)hasRxRetries;
- (BOOL)hasRxThroughput;
- (BOOL)hasSNR;
- (BOOL)hasSymptomsFails;
- (BOOL)hasTVPMActiveDurationMS;
- (BOOL)hasTestThroughput;
- (BOOL)hasTimeSinceLastRecovery;
- (BOOL)hasTimestamp;
- (BOOL)hasTxAMPDUDensity;
- (BOOL)hasTxCompBytes;
- (BOOL)hasTxCompPkts;
- (BOOL)hasTxDelayBytes;
- (BOOL)hasTxExpectedAMPDUDensity;
- (BOOL)hasTxFails;
- (BOOL)hasTxFrames;
- (BOOL)hasTxLowFrameCountFalse;
- (BOOL)hasTxLowFrameCountTrue;
- (BOOL)hasTxOutputBelowExpectedFalse;
- (BOOL)hasTxOutputBelowExpectedTrue;
- (BOOL)hasTxOutputBelowInputFalse;
- (BOOL)hasTxOutputBelowInputTrue;
- (BOOL)hasTxPhyRate;
- (BOOL)hasTxQueueFullFalse;
- (BOOL)hasTxQueueFullTrue;
- (BOOL)hasTxRetries;
- (BOOL)hasTxSubBytes;
- (BOOL)hasTxSubPkts;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)rSSI;
- (unint64_t)aPTxDataStall;
- (unint64_t)accessPointOUI;
- (unint64_t)availWLANDurMS;
- (unint64_t)availWLANRxDurMS;
- (unint64_t)availWLANTxDurMS;
- (unint64_t)avgTxLatencyMS;
- (unint64_t)bTAntennaDurMS;
- (unint64_t)baselineThroughput;
- (unint64_t)cCA;
- (unint64_t)concurrentIntDurMS;
- (unint64_t)delayedThroughput;
- (unint64_t)expectedThroughput;
- (unint64_t)hash;
- (unint64_t)highRxDataPERFalse;
- (unint64_t)highRxDataPERTrue;
- (unint64_t)highRxDecryptErrsFalse;
- (unint64_t)highRxDecryptErrsTrue;
- (unint64_t)highRxDupsFalse;
- (unint64_t)highRxDupsTrue;
- (unint64_t)highRxFCSErrsFalse;
- (unint64_t)highRxFCSErrsTrue;
- (unint64_t)highRxOverflowsFalse;
- (unint64_t)highRxOverflowsTrue;
- (unint64_t)highRxPhyPERFalse;
- (unint64_t)highRxPhyPERTrue;
- (unint64_t)highRxReplaysFalse;
- (unint64_t)highRxReplaysTrue;
- (unint64_t)highRxRetriesFalse;
- (unint64_t)highRxRetriesTrue;
- (unint64_t)highTxLatencyFalse;
- (unint64_t)highTxLatencyTrue;
- (unint64_t)highTxPerFalse;
- (unint64_t)highTxPerTrue;
- (unint64_t)highTxRetriesFalse;
- (unint64_t)highTxRetriesTrue;
- (unint64_t)infraDutyCycle;
- (unint64_t)inputThroughput;
- (unint64_t)is2GBand;
- (unint64_t)isFGTraffic;
- (unint64_t)lTECoexDurationMS;
- (unint64_t)lastScanReason;
- (unint64_t)lowAvailWLANDurFalse;
- (unint64_t)lowAvailWLANDurTrue;
- (unint64_t)lowAvailWLANRxDurFalse;
- (unint64_t)lowAvailWLANRxDurTrue;
- (unint64_t)lowAvailWLANTxDurFalse;
- (unint64_t)lowAvailWLANTxDurTrue;
- (unint64_t)lowTxAMPDUDensityFalse;
- (unint64_t)lowTxAMPDUDensityTrue;
- (unint64_t)lowTxPhyRateFalse;
- (unint64_t)lowTxPhyRateTrue;
- (unint64_t)maxQueueFullDurMS;
- (unint64_t)measurementDurMS;
- (unint64_t)offChanDurMS;
- (unint64_t)outputThroughput;
- (unint64_t)phyRxActivityDurMS;
- (unint64_t)phyTxActivityDurMS;
- (unint64_t)rC1CoexDurationMS;
- (unint64_t)rC2CoexDurationMS;
- (unint64_t)rxAmpduTxBaMismatch;
- (unint64_t)rxCRSErrs;
- (unint64_t)rxDecryErrs;
- (unint64_t)rxDupErrs;
- (unint64_t)rxFCSErrs;
- (unint64_t)rxFrames;
- (unint64_t)rxGoodPlcps;
- (unint64_t)rxLowFrameCountFalse;
- (unint64_t)rxLowFrameCountTrue;
- (unint64_t)rxOvflErrs;
- (unint64_t)rxPLCPErrs;
- (unint64_t)rxPhyRate;
- (unint64_t)rxReplayErrs;
- (unint64_t)rxRetries;
- (unint64_t)rxThroughput;
- (unint64_t)sNR;
- (unint64_t)symptomsFails;
- (unint64_t)tVPMActiveDurationMS;
- (unint64_t)testThroughput;
- (unint64_t)timeSinceLastRecovery;
- (unint64_t)timestamp;
- (unint64_t)txAMPDUDensity;
- (unint64_t)txCompBytes;
- (unint64_t)txCompPkts;
- (unint64_t)txDelayBytes;
- (unint64_t)txExpectedAMPDUDensity;
- (unint64_t)txFails;
- (unint64_t)txFrames;
- (unint64_t)txLowFrameCountFalse;
- (unint64_t)txLowFrameCountTrue;
- (unint64_t)txOutputBelowExpectedFalse;
- (unint64_t)txOutputBelowExpectedTrue;
- (unint64_t)txOutputBelowInputFalse;
- (unint64_t)txOutputBelowInputTrue;
- (unint64_t)txPhyRate;
- (unint64_t)txQueueFullFalse;
- (unint64_t)txQueueFullTrue;
- (unint64_t)txRetries;
- (unint64_t)txSubBytes;
- (unint64_t)txSubPkts;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAPTxDataStall:(unint64_t)a3;
- (void)setAccessPointOUI:(unint64_t)a3;
- (void)setAvailWLANDurMS:(unint64_t)a3;
- (void)setAvailWLANRxDurMS:(unint64_t)a3;
- (void)setAvailWLANTxDurMS:(unint64_t)a3;
- (void)setAvgTxLatencyMS:(unint64_t)a3;
- (void)setBTAntennaDurMS:(unint64_t)a3;
- (void)setBaselineThroughput:(unint64_t)a3;
- (void)setCCA:(unint64_t)a3;
- (void)setConcurrentIntDurMS:(unint64_t)a3;
- (void)setDelayedThroughput:(unint64_t)a3;
- (void)setExpectedThroughput:(unint64_t)a3;
- (void)setHasAPTxDataStall:(BOOL)a3;
- (void)setHasAccessPointOUI:(BOOL)a3;
- (void)setHasAvailWLANDurMS:(BOOL)a3;
- (void)setHasAvailWLANRxDurMS:(BOOL)a3;
- (void)setHasAvailWLANTxDurMS:(BOOL)a3;
- (void)setHasAvgTxLatencyMS:(BOOL)a3;
- (void)setHasBTAntennaDurMS:(BOOL)a3;
- (void)setHasBaselineThroughput:(BOOL)a3;
- (void)setHasCCA:(BOOL)a3;
- (void)setHasConcurrentIntDurMS:(BOOL)a3;
- (void)setHasDelayedThroughput:(BOOL)a3;
- (void)setHasExpectedThroughput:(BOOL)a3;
- (void)setHasHighRxDataPERFalse:(BOOL)a3;
- (void)setHasHighRxDataPERTrue:(BOOL)a3;
- (void)setHasHighRxDecryptErrsFalse:(BOOL)a3;
- (void)setHasHighRxDecryptErrsTrue:(BOOL)a3;
- (void)setHasHighRxDupsFalse:(BOOL)a3;
- (void)setHasHighRxDupsTrue:(BOOL)a3;
- (void)setHasHighRxFCSErrsFalse:(BOOL)a3;
- (void)setHasHighRxFCSErrsTrue:(BOOL)a3;
- (void)setHasHighRxOverflowsFalse:(BOOL)a3;
- (void)setHasHighRxOverflowsTrue:(BOOL)a3;
- (void)setHasHighRxPhyPERFalse:(BOOL)a3;
- (void)setHasHighRxPhyPERTrue:(BOOL)a3;
- (void)setHasHighRxReplaysFalse:(BOOL)a3;
- (void)setHasHighRxReplaysTrue:(BOOL)a3;
- (void)setHasHighRxRetriesFalse:(BOOL)a3;
- (void)setHasHighRxRetriesTrue:(BOOL)a3;
- (void)setHasHighTxLatencyFalse:(BOOL)a3;
- (void)setHasHighTxLatencyTrue:(BOOL)a3;
- (void)setHasHighTxPerFalse:(BOOL)a3;
- (void)setHasHighTxPerTrue:(BOOL)a3;
- (void)setHasHighTxRetriesFalse:(BOOL)a3;
- (void)setHasHighTxRetriesTrue:(BOOL)a3;
- (void)setHasInfraDutyCycle:(BOOL)a3;
- (void)setHasInputThroughput:(BOOL)a3;
- (void)setHasIs2GBand:(BOOL)a3;
- (void)setHasIsFGTraffic:(BOOL)a3;
- (void)setHasLTECoexDurationMS:(BOOL)a3;
- (void)setHasLastScanReason:(BOOL)a3;
- (void)setHasLowAvailWLANDurFalse:(BOOL)a3;
- (void)setHasLowAvailWLANDurTrue:(BOOL)a3;
- (void)setHasLowAvailWLANRxDurFalse:(BOOL)a3;
- (void)setHasLowAvailWLANRxDurTrue:(BOOL)a3;
- (void)setHasLowAvailWLANTxDurFalse:(BOOL)a3;
- (void)setHasLowAvailWLANTxDurTrue:(BOOL)a3;
- (void)setHasLowTxAMPDUDensityFalse:(BOOL)a3;
- (void)setHasLowTxAMPDUDensityTrue:(BOOL)a3;
- (void)setHasLowTxPhyRateFalse:(BOOL)a3;
- (void)setHasLowTxPhyRateTrue:(BOOL)a3;
- (void)setHasMaxQueueFullDurMS:(BOOL)a3;
- (void)setHasMeasurementDurMS:(BOOL)a3;
- (void)setHasOffChanDurMS:(BOOL)a3;
- (void)setHasOutputThroughput:(BOOL)a3;
- (void)setHasPhyRxActivityDurMS:(BOOL)a3;
- (void)setHasPhyTxActivityDurMS:(BOOL)a3;
- (void)setHasRC1CoexDurationMS:(BOOL)a3;
- (void)setHasRC2CoexDurationMS:(BOOL)a3;
- (void)setHasRSSI:(BOOL)a3;
- (void)setHasRxAmpduTxBaMismatch:(BOOL)a3;
- (void)setHasRxCRSErrs:(BOOL)a3;
- (void)setHasRxDecryErrs:(BOOL)a3;
- (void)setHasRxDupErrs:(BOOL)a3;
- (void)setHasRxFCSErrs:(BOOL)a3;
- (void)setHasRxFrames:(BOOL)a3;
- (void)setHasRxGoodPlcps:(BOOL)a3;
- (void)setHasRxLowFrameCountFalse:(BOOL)a3;
- (void)setHasRxLowFrameCountTrue:(BOOL)a3;
- (void)setHasRxOvflErrs:(BOOL)a3;
- (void)setHasRxPLCPErrs:(BOOL)a3;
- (void)setHasRxPhyRate:(BOOL)a3;
- (void)setHasRxReplayErrs:(BOOL)a3;
- (void)setHasRxRetries:(BOOL)a3;
- (void)setHasRxThroughput:(BOOL)a3;
- (void)setHasSNR:(BOOL)a3;
- (void)setHasSymptomsFails:(BOOL)a3;
- (void)setHasTVPMActiveDurationMS:(BOOL)a3;
- (void)setHasTestThroughput:(BOOL)a3;
- (void)setHasTimeSinceLastRecovery:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTxAMPDUDensity:(BOOL)a3;
- (void)setHasTxCompBytes:(BOOL)a3;
- (void)setHasTxCompPkts:(BOOL)a3;
- (void)setHasTxDelayBytes:(BOOL)a3;
- (void)setHasTxExpectedAMPDUDensity:(BOOL)a3;
- (void)setHasTxFails:(BOOL)a3;
- (void)setHasTxFrames:(BOOL)a3;
- (void)setHasTxLowFrameCountFalse:(BOOL)a3;
- (void)setHasTxLowFrameCountTrue:(BOOL)a3;
- (void)setHasTxOutputBelowExpectedFalse:(BOOL)a3;
- (void)setHasTxOutputBelowExpectedTrue:(BOOL)a3;
- (void)setHasTxOutputBelowInputFalse:(BOOL)a3;
- (void)setHasTxOutputBelowInputTrue:(BOOL)a3;
- (void)setHasTxPhyRate:(BOOL)a3;
- (void)setHasTxQueueFullFalse:(BOOL)a3;
- (void)setHasTxQueueFullTrue:(BOOL)a3;
- (void)setHasTxRetries:(BOOL)a3;
- (void)setHasTxSubBytes:(BOOL)a3;
- (void)setHasTxSubPkts:(BOOL)a3;
- (void)setHighRxDataPERFalse:(unint64_t)a3;
- (void)setHighRxDataPERTrue:(unint64_t)a3;
- (void)setHighRxDecryptErrsFalse:(unint64_t)a3;
- (void)setHighRxDecryptErrsTrue:(unint64_t)a3;
- (void)setHighRxDupsFalse:(unint64_t)a3;
- (void)setHighRxDupsTrue:(unint64_t)a3;
- (void)setHighRxFCSErrsFalse:(unint64_t)a3;
- (void)setHighRxFCSErrsTrue:(unint64_t)a3;
- (void)setHighRxOverflowsFalse:(unint64_t)a3;
- (void)setHighRxOverflowsTrue:(unint64_t)a3;
- (void)setHighRxPhyPERFalse:(unint64_t)a3;
- (void)setHighRxPhyPERTrue:(unint64_t)a3;
- (void)setHighRxReplaysFalse:(unint64_t)a3;
- (void)setHighRxReplaysTrue:(unint64_t)a3;
- (void)setHighRxRetriesFalse:(unint64_t)a3;
- (void)setHighRxRetriesTrue:(unint64_t)a3;
- (void)setHighTxLatencyFalse:(unint64_t)a3;
- (void)setHighTxLatencyTrue:(unint64_t)a3;
- (void)setHighTxPerFalse:(unint64_t)a3;
- (void)setHighTxPerTrue:(unint64_t)a3;
- (void)setHighTxRetriesFalse:(unint64_t)a3;
- (void)setHighTxRetriesTrue:(unint64_t)a3;
- (void)setInfraDutyCycle:(unint64_t)a3;
- (void)setInputThroughput:(unint64_t)a3;
- (void)setIs2GBand:(unint64_t)a3;
- (void)setIsFGTraffic:(unint64_t)a3;
- (void)setLTECoexDurationMS:(unint64_t)a3;
- (void)setLastScanReason:(unint64_t)a3;
- (void)setLowAvailWLANDurFalse:(unint64_t)a3;
- (void)setLowAvailWLANDurTrue:(unint64_t)a3;
- (void)setLowAvailWLANRxDurFalse:(unint64_t)a3;
- (void)setLowAvailWLANRxDurTrue:(unint64_t)a3;
- (void)setLowAvailWLANTxDurFalse:(unint64_t)a3;
- (void)setLowAvailWLANTxDurTrue:(unint64_t)a3;
- (void)setLowTxAMPDUDensityFalse:(unint64_t)a3;
- (void)setLowTxAMPDUDensityTrue:(unint64_t)a3;
- (void)setLowTxPhyRateFalse:(unint64_t)a3;
- (void)setLowTxPhyRateTrue:(unint64_t)a3;
- (void)setMaxQueueFullDurMS:(unint64_t)a3;
- (void)setMeasurementDurMS:(unint64_t)a3;
- (void)setOffChanDurMS:(unint64_t)a3;
- (void)setOutputThroughput:(unint64_t)a3;
- (void)setPhyRxActivityDurMS:(unint64_t)a3;
- (void)setPhyTxActivityDurMS:(unint64_t)a3;
- (void)setRC1CoexDurationMS:(unint64_t)a3;
- (void)setRC2CoexDurationMS:(unint64_t)a3;
- (void)setRSSI:(int64_t)a3;
- (void)setRxAmpduTxBaMismatch:(unint64_t)a3;
- (void)setRxCRSErrs:(unint64_t)a3;
- (void)setRxDecryErrs:(unint64_t)a3;
- (void)setRxDupErrs:(unint64_t)a3;
- (void)setRxFCSErrs:(unint64_t)a3;
- (void)setRxFrames:(unint64_t)a3;
- (void)setRxGoodPlcps:(unint64_t)a3;
- (void)setRxLowFrameCountFalse:(unint64_t)a3;
- (void)setRxLowFrameCountTrue:(unint64_t)a3;
- (void)setRxOvflErrs:(unint64_t)a3;
- (void)setRxPLCPErrs:(unint64_t)a3;
- (void)setRxPhyRate:(unint64_t)a3;
- (void)setRxReplayErrs:(unint64_t)a3;
- (void)setRxRetries:(unint64_t)a3;
- (void)setRxThroughput:(unint64_t)a3;
- (void)setSNR:(unint64_t)a3;
- (void)setSymptomsFails:(unint64_t)a3;
- (void)setTVPMActiveDurationMS:(unint64_t)a3;
- (void)setTestThroughput:(unint64_t)a3;
- (void)setTimeSinceLastRecovery:(unint64_t)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTxAMPDUDensity:(unint64_t)a3;
- (void)setTxCompBytes:(unint64_t)a3;
- (void)setTxCompPkts:(unint64_t)a3;
- (void)setTxDelayBytes:(unint64_t)a3;
- (void)setTxExpectedAMPDUDensity:(unint64_t)a3;
- (void)setTxFails:(unint64_t)a3;
- (void)setTxFrames:(unint64_t)a3;
- (void)setTxLowFrameCountFalse:(unint64_t)a3;
- (void)setTxLowFrameCountTrue:(unint64_t)a3;
- (void)setTxOutputBelowExpectedFalse:(unint64_t)a3;
- (void)setTxOutputBelowExpectedTrue:(unint64_t)a3;
- (void)setTxOutputBelowInputFalse:(unint64_t)a3;
- (void)setTxOutputBelowInputTrue:(unint64_t)a3;
- (void)setTxPhyRate:(unint64_t)a3;
- (void)setTxQueueFullFalse:(unint64_t)a3;
- (void)setTxQueueFullTrue:(unint64_t)a3;
- (void)setTxRetries:(unint64_t)a3;
- (void)setTxSubBytes:(unint64_t)a3;
- (void)setTxSubPkts:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDLinkQualityMeasurements

- (void)setTimestamp:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x8000uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasTimestamp
{
  return *((unsigned __int8 *)&self->_has + 9) >> 7;
}

- (void)setTxOutputBelowExpectedTrue:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x4000000uLL;
  self->_txOutputBelowExpectedTrue = a3;
}

- (void)setHasTxOutputBelowExpectedTrue:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasTxOutputBelowExpectedTrue
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 2) & 1;
}

- (void)setTxOutputBelowExpectedFalse:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x2000000uLL;
  self->_txOutputBelowExpectedFalse = a3;
}

- (void)setHasTxOutputBelowExpectedFalse:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasTxOutputBelowExpectedFalse
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 1) & 1;
}

- (void)setTxOutputBelowInputTrue:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x10000000uLL;
  self->_txOutputBelowInputTrue = a3;
}

- (void)setHasTxOutputBelowInputTrue:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasTxOutputBelowInputTrue
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 4) & 1;
}

- (void)setTxOutputBelowInputFalse:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x8000000uLL;
  self->_txOutputBelowInputFalse = a3;
}

- (void)setHasTxOutputBelowInputFalse:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasTxOutputBelowInputFalse
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 3) & 1;
}

- (void)setTxLowFrameCountTrue:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x1000000uLL;
  self->_txLowFrameCountTrue = a3;
}

- (void)setHasTxLowFrameCountTrue:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasTxLowFrameCountTrue
{
  return *((unsigned char *)&self->_has + 11) & 1;
}

- (void)setTxLowFrameCountFalse:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x800000uLL;
  self->_txLowFrameCountFalse = a3;
}

- (void)setHasTxLowFrameCountFalse:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasTxLowFrameCountFalse
{
  return *((unsigned __int8 *)&self->_has + 10) >> 7;
}

- (void)setRxLowFrameCountTrue:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 8uLL;
  self->_rxLowFrameCountTrue = a3;
}

- (void)setHasRxLowFrameCountTrue:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasRxLowFrameCountTrue
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 3) & 1;
}

- (void)setRxLowFrameCountFalse:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 4uLL;
  self->_rxLowFrameCountFalse = a3;
}

- (void)setHasRxLowFrameCountFalse:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasRxLowFrameCountFalse
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 2) & 1;
}

- (void)setHighTxLatencyTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_highTxLatencyTrue = a3;
}

- (void)setHasHighTxLatencyTrue:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasHighTxLatencyTrue
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setHighTxLatencyFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_highTxLatencyFalse = a3;
}

- (void)setHasHighTxLatencyFalse:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3;
}

- (BOOL)hasHighTxLatencyFalse
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (void)setLowTxPhyRateTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_lowTxPhyRateTrue = a3;
}

- (void)setHasLowTxPhyRateTrue:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowTxPhyRateTrue
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setLowTxPhyRateFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_lowTxPhyRateFalse = a3;
}

- (void)setHasLowTxPhyRateFalse:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowTxPhyRateFalse
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (void)setHighTxPerTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_highTxPerTrue = a3;
}

- (void)setHasHighTxPerTrue:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasHighTxPerTrue
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setHighTxPerFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_highTxPerFalse = a3;
}

- (void)setHasHighTxPerFalse:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasHighTxPerFalse
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setHighTxRetriesTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_highTxRetriesTrue = a3;
}

- (void)setHasHighTxRetriesTrue:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasHighTxRetriesTrue
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setHighTxRetriesFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_highTxRetriesFalse = a3;
}

- (void)setHasHighTxRetriesFalse:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasHighTxRetriesFalse
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setTxQueueFullTrue:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x80000000uLL;
  self->_txQueueFullTrue = a3;
}

- (void)setHasTxQueueFullTrue:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFF7FFFFFFFLL | v3;
}

- (BOOL)hasTxQueueFullTrue
{
  return *((unsigned __int8 *)&self->_has + 11) >> 7;
}

- (void)setTxQueueFullFalse:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x40000000uLL;
  self->_txQueueFullFalse = a3;
}

- (void)setHasTxQueueFullFalse:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFBFFFFFFFLL | v3;
}

- (BOOL)hasTxQueueFullFalse
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 6) & 1;
}

- (void)setLowTxAMPDUDensityTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_lowTxAMPDUDensityTrue = a3;
}

- (void)setHasLowTxAMPDUDensityTrue:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowTxAMPDUDensityTrue
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setLowTxAMPDUDensityFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_lowTxAMPDUDensityFalse = a3;
}

- (void)setHasLowTxAMPDUDensityFalse:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowTxAMPDUDensityFalse
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setHighRxRetriesTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_highRxRetriesTrue = a3;
}

- (void)setHasHighRxRetriesTrue:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3;
}

- (BOOL)hasHighRxRetriesTrue
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setHighRxRetriesFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_highRxRetriesFalse = a3;
}

- (void)setHasHighRxRetriesFalse:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3;
}

- (BOOL)hasHighRxRetriesFalse
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setHighRxPhyPERTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_highRxPhyPERTrue = a3;
}

- (void)setHasHighRxPhyPERTrue:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3;
}

- (BOOL)hasHighRxPhyPERTrue
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setHighRxPhyPERFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_highRxPhyPERFalse = a3;
}

- (void)setHasHighRxPhyPERFalse:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasHighRxPhyPERFalse
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setHighRxFCSErrsTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_highRxFCSErrsTrue = a3;
}

- (void)setHasHighRxFCSErrsTrue:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasHighRxFCSErrsTrue
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setHighRxFCSErrsFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_highRxFCSErrsFalse = a3;
}

- (void)setHasHighRxFCSErrsFalse:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasHighRxFCSErrsFalse
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setHighRxOverflowsTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_highRxOverflowsTrue = a3;
}

- (void)setHasHighRxOverflowsTrue:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasHighRxOverflowsTrue
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setHighRxOverflowsFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_highRxOverflowsFalse = a3;
}

- (void)setHasHighRxOverflowsFalse:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasHighRxOverflowsFalse
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setHighRxDupsTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_highRxDupsTrue = a3;
}

- (void)setHasHighRxDupsTrue:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasHighRxDupsTrue
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setHighRxDupsFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_highRxDupsFalse = a3;
}

- (void)setHasHighRxDupsFalse:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasHighRxDupsFalse
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setHighRxReplaysTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_highRxReplaysTrue = a3;
}

- (void)setHasHighRxReplaysTrue:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3;
}

- (BOOL)hasHighRxReplaysTrue
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setHighRxReplaysFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_highRxReplaysFalse = a3;
}

- (void)setHasHighRxReplaysFalse:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3;
}

- (BOOL)hasHighRxReplaysFalse
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHighRxDecryptErrsTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_highRxDecryptErrsTrue = a3;
}

- (void)setHasHighRxDecryptErrsTrue:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3;
}

- (BOOL)hasHighRxDecryptErrsTrue
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setHighRxDecryptErrsFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_highRxDecryptErrsFalse = a3;
}

- (void)setHasHighRxDecryptErrsFalse:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasHighRxDecryptErrsFalse
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setHighRxDataPERTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_highRxDataPERTrue = a3;
}

- (void)setHasHighRxDataPERTrue:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasHighRxDataPERTrue
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setHighRxDataPERFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_highRxDataPERFalse = a3;
}

- (void)setHasHighRxDataPERFalse:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasHighRxDataPERFalse
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setLowAvailWLANDurTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_lowAvailWLANDurTrue = a3;
}

- (void)setHasLowAvailWLANDurTrue:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANDurTrue
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setLowAvailWLANDurFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_lowAvailWLANDurFalse = a3;
}

- (void)setHasLowAvailWLANDurFalse:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANDurFalse
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setLowAvailWLANTxDurTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_lowAvailWLANTxDurTrue = a3;
}

- (void)setHasLowAvailWLANTxDurTrue:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANTxDurTrue
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setLowAvailWLANTxDurFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_lowAvailWLANTxDurFalse = a3;
}

- (void)setHasLowAvailWLANTxDurFalse:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANTxDurFalse
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setLowAvailWLANRxDurTrue:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_lowAvailWLANRxDurTrue = a3;
}

- (void)setHasLowAvailWLANRxDurTrue:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANRxDurTrue
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setLowAvailWLANRxDurFalse:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_lowAvailWLANRxDurFalse = a3;
}

- (void)setHasLowAvailWLANRxDurFalse:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3;
}

- (BOOL)hasLowAvailWLANRxDurFalse
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setCCA:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_cCA = a3;
}

- (void)setHasCCA:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasCCA
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setRSSI:(int64_t)a3
{
  *(void *)&self->_has |= 0x400000000000000uLL;
  self->_rSSI = a3;
}

- (void)setHasRSSI:(BOOL)a3
{
  uint64_t v3 = 0x400000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFBFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRSSI
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 2) & 1;
}

- (void)setTxPhyRate:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x20000000uLL;
  self->_txPhyRate = a3;
}

- (void)setHasTxPhyRate:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFDFFFFFFFLL | v3;
}

- (BOOL)hasTxPhyRate
{
  return (*((unsigned __int8 *)&self->_has + 11) >> 5) & 1;
}

- (void)setRxPhyRate:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x40uLL;
  self->_rxPhyRate = a3;
}

- (void)setHasRxPhyRate:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasRxPhyRate
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 6) & 1;
}

- (void)setTxAMPDUDensity:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x10000uLL;
  self->_txAMPDUDensity = a3;
}

- (void)setHasTxAMPDUDensity:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFEFFFFLL | v3;
}

- (BOOL)hasTxAMPDUDensity
{
  return *((unsigned char *)&self->_has + 10) & 1;
}

- (void)setMeasurementDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000000uLL;
  self->_measurementDurMS = a3;
}

- (void)setHasMeasurementDurMS:(BOOL)a3
{
  uint64_t v3 = 0x8000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFF7FFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMeasurementDurMS
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 3) & 1;
}

- (void)setConcurrentIntDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_concurrentIntDurMS = a3;
}

- (void)setHasConcurrentIntDurMS:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasConcurrentIntDurMS
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setTVPMActiveDurationMS:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x1000uLL;
  self->_tVPMActiveDurationMS = a3;
}

- (void)setHasTVPMActiveDurationMS:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFEFFFLL | v3;
}

- (BOOL)hasTVPMActiveDurationMS
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 4) & 1;
}

- (void)setPhyTxActivityDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80000000000000uLL;
  self->_phyTxActivityDurMS = a3;
}

- (void)setHasPhyTxActivityDurMS:(BOOL)a3
{
  uint64_t v3 = 0x80000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFF7FFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPhyTxActivityDurMS
{
  return *((unsigned __int8 *)&self->_has + 6) >> 7;
}

- (void)setPhyRxActivityDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40000000000000uLL;
  self->_phyRxActivityDurMS = a3;
}

- (void)setHasPhyRxActivityDurMS:(BOOL)a3
{
  uint64_t v3 = 0x40000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFBFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasPhyRxActivityDurMS
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 6) & 1;
}

- (void)setTxSubBytes:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x200000000uLL;
  self->_txSubBytes = a3;
}

- (void)setHasTxSubBytes:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFDFFFFFFFFLL | v3;
}

- (BOOL)hasTxSubBytes
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 1) & 1;
}

- (void)setTxCompBytes:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x20000uLL;
  self->_txCompBytes = a3;
}

- (void)setHasTxCompBytes:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFDFFFFLL | v3;
}

- (BOOL)hasTxCompBytes
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 1) & 1;
}

- (void)setTxDelayBytes:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x80000uLL;
  self->_txDelayBytes = a3;
}

- (void)setHasTxDelayBytes:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFF7FFFFLL | v3;
}

- (BOOL)hasTxDelayBytes
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 3) & 1;
}

- (void)setOffChanDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10000000000000uLL;
  self->_offChanDurMS = a3;
}

- (void)setHasOffChanDurMS:(BOOL)a3
{
  uint64_t v3 = 0x10000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFEFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasOffChanDurMS
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 4) & 1;
}

- (void)setTxSubPkts:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x400000000uLL;
  self->_txSubPkts = a3;
}

- (void)setHasTxSubPkts:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasTxSubPkts
{
  return (*((unsigned __int8 *)&self->_has + 12) >> 2) & 1;
}

- (void)setTxCompPkts:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x40000uLL;
  self->_txCompPkts = a3;
}

- (void)setHasTxCompPkts:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFBFFFFLL | v3;
}

- (BOOL)hasTxCompPkts
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 2) & 1;
}

- (void)setMaxQueueFullDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_maxQueueFullDurMS = a3;
}

- (void)setHasMaxQueueFullDurMS:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasMaxQueueFullDurMS
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setAvgTxLatencyMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_avgTxLatencyMS = a3;
}

- (void)setHasAvgTxLatencyMS:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasAvgTxLatencyMS
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setBTAntennaDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_bTAntennaDurMS = a3;
}

- (void)setHasBTAntennaDurMS:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3;
}

- (BOOL)hasBTAntennaDurMS
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setOutputThroughput:(unint64_t)a3
{
  *(void *)&self->_has |= 0x20000000000000uLL;
  self->_outputThroughput = a3;
}

- (void)setHasOutputThroughput:(BOOL)a3
{
  uint64_t v3 = 0x20000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFDFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasOutputThroughput
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 5) & 1;
}

- (void)setInputThroughput:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_inputThroughput = a3;
}

- (void)setHasInputThroughput:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3;
}

- (BOOL)hasInputThroughput
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setExpectedThroughput:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_expectedThroughput = a3;
}

- (void)setHasExpectedThroughput:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasExpectedThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setDelayedThroughput:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_delayedThroughput = a3;
}

- (void)setHasDelayedThroughput:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasDelayedThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setAvailWLANDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_availWLANDurMS = a3;
}

- (void)setHasAvailWLANDurMS:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3;
}

- (BOOL)hasAvailWLANDurMS
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAvailWLANTxDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_availWLANTxDurMS = a3;
}

- (void)setHasAvailWLANTxDurMS:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasAvailWLANTxDurMS
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAvailWLANRxDurMS:(unint64_t)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_availWLANRxDurMS = a3;
}

- (void)setHasAvailWLANRxDurMS:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3;
}

- (BOOL)hasAvailWLANRxDurMS
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setTxRetries:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x100000000uLL;
  self->_txRetries = a3;
}

- (void)setHasTxRetries:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFEFFFFFFFFLL | v3;
}

- (BOOL)hasTxRetries
{
  return *((unsigned char *)&self->_has + 12) & 1;
}

- (void)setTxFails:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x200000uLL;
  self->_txFails = a3;
}

- (void)setHasTxFails:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFDFFFFFLL | v3;
}

- (BOOL)hasTxFails
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 5) & 1;
}

- (void)setTxFrames:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x400000uLL;
  self->_txFrames = a3;
}

- (void)setHasTxFrames:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFBFFFFFLL | v3;
}

- (BOOL)hasTxFrames
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 6) & 1;
}

- (void)setRxOvflErrs:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x10uLL;
  self->_rxOvflErrs = a3;
}

- (void)setHasRxOvflErrs:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFEFLL | v3;
}

- (BOOL)hasRxOvflErrs
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 4) & 1;
}

- (void)setRxFCSErrs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000000000;
  self->_rxFCSErrs = a3;
}

- (void)setHasRxFCSErrs:(BOOL)a3
{
  unint64_t v3 = 0x8000000000000000;
  if (!a3) {
    unint64_t v3 = 0;
  }
  *(void *)&self->_has = v3 & 0x8000000000000000 | *(void *)&self->_has & 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)hasRxFCSErrs
{
  return *((unsigned __int8 *)&self->_has + 7) >> 7;
}

- (void)setRxPLCPErrs:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x20uLL;
  self->_rxPLCPErrs = a3;
}

- (void)setHasRxPLCPErrs:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFDFLL | v3;
}

- (BOOL)hasRxPLCPErrs
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 5) & 1;
}

- (void)setRxCRSErrs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000000000000uLL;
  self->_rxCRSErrs = a3;
}

- (void)setHasRxCRSErrs:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xEFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRxCRSErrs
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 4) & 1;
}

- (void)setRxDupErrs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000000000000uLL;
  self->_rxDupErrs = a3;
}

- (void)setHasRxDupErrs:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xBFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRxDupErrs
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 6) & 1;
}

- (void)setRxReplayErrs:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x80uLL;
  self->_rxReplayErrs = a3;
}

- (void)setHasRxReplayErrs:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasRxReplayErrs
{
  return *((unsigned __int8 *)&self->_has + 8) >> 7;
}

- (void)setRxDecryErrs:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000000000000uLL;
  self->_rxDecryErrs = a3;
}

- (void)setHasRxDecryErrs:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xDFFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRxDecryErrs
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 5) & 1;
}

- (void)setRxRetries:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x100uLL;
  self->_rxRetries = a3;
}

- (void)setHasRxRetries:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFEFFLL | v3;
}

- (BOOL)hasRxRetries
{
  return *((unsigned char *)&self->_has + 9) & 1;
}

- (void)setRxGoodPlcps:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 2uLL;
  self->_rxGoodPlcps = a3;
}

- (void)setHasRxGoodPlcps:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasRxGoodPlcps
{
  return (*((unsigned __int8 *)&self->_has + 8) >> 1) & 1;
}

- (void)setRxFrames:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 1uLL;
  self->_rxFrames = a3;
}

- (void)setHasRxFrames:(BOOL)a3
{
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasRxFrames
{
  return *((unsigned char *)&self->_has + 8) & 1;
}

- (void)setSNR:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x400uLL;
  self->_sNR = a3;
}

- (void)setHasSNR:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFBFFLL | v3;
}

- (BOOL)hasSNR
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 2) & 1;
}

- (void)setTxExpectedAMPDUDensity:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x100000uLL;
  self->_txExpectedAMPDUDensity = a3;
}

- (void)setHasTxExpectedAMPDUDensity:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFEFFFFFLL | v3;
}

- (BOOL)hasTxExpectedAMPDUDensity
{
  return (*((unsigned __int8 *)&self->_has + 10) >> 4) & 1;
}

- (void)setRC1CoexDurationMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x100000000000000uLL;
  self->_rC1CoexDurationMS = a3;
}

- (void)setHasRC1CoexDurationMS:(BOOL)a3
{
  uint64_t v3 = 0x100000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFEFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRC1CoexDurationMS
{
  return *((unsigned char *)&self->_has + 7) & 1;
}

- (void)setRC2CoexDurationMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x200000000000000uLL;
  self->_rC2CoexDurationMS = a3;
}

- (void)setHasRC2CoexDurationMS:(BOOL)a3
{
  uint64_t v3 = 0x200000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFDFFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRC2CoexDurationMS
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 1) & 1;
}

- (void)setLTECoexDurationMS:(unint64_t)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_lTECoexDurationMS = a3;
}

- (void)setHasLTECoexDurationMS:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3;
}

- (BOOL)hasLTECoexDurationMS
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setRxThroughput:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x200uLL;
  self->_rxThroughput = a3;
}

- (void)setHasRxThroughput:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFFDFFLL | v3;
}

- (BOOL)hasRxThroughput
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 1) & 1;
}

- (void)setAPTxDataStall:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_aPTxDataStall = a3;
}

- (void)setHasAPTxDataStall:(BOOL)a3
{
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3;
}

- (BOOL)hasAPTxDataStall
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setRxAmpduTxBaMismatch:(unint64_t)a3
{
  *(void *)&self->_has |= 0x800000000000000uLL;
  self->_rxAmpduTxBaMismatch = a3;
}

- (void)setHasRxAmpduTxBaMismatch:(BOOL)a3
{
  uint64_t v3 = 0x800000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xF7FFFFFFFFFFFFFFLL | v3;
}

- (BOOL)hasRxAmpduTxBaMismatch
{
  return (*((unsigned __int8 *)&self->_has + 7) >> 3) & 1;
}

- (void)setSymptomsFails:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x800uLL;
  self->_symptomsFails = a3;
}

- (void)setHasSymptomsFails:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFF7FFLL | v3;
}

- (BOOL)hasSymptomsFails
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 3) & 1;
}

- (void)setIs2GBand:(unint64_t)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_is2GBand = a3;
}

- (void)setHasIs2GBand:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3;
}

- (BOOL)hasIs2GBand
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setIsFGTraffic:(unint64_t)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_isFGTraffic = a3;
}

- (void)setHasIsFGTraffic:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3;
}

- (BOOL)hasIsFGTraffic
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setBaselineThroughput:(unint64_t)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_baselineThroughput = a3;
}

- (void)setHasBaselineThroughput:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3;
}

- (BOOL)hasBaselineThroughput
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setTestThroughput:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x2000uLL;
  self->_testThroughput = a3;
}

- (void)setHasTestThroughput:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFDFFFLL | v3;
}

- (BOOL)hasTestThroughput
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 5) & 1;
}

- (void)setInfraDutyCycle:(unint64_t)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_infraDutyCycle = a3;
}

- (void)setHasInfraDutyCycle:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3;
}

- (BOOL)hasInfraDutyCycle
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setLastScanReason:(unint64_t)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_lastScanReason = a3;
}

- (void)setHasLastScanReason:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3;
}

- (BOOL)hasLastScanReason
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setAccessPointOUI:(unint64_t)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_accessPointOUI = a3;
}

- (void)setHasAccessPointOUI:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *(void *)&self->_has = *(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3;
}

- (BOOL)hasAccessPointOUI
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTimeSinceLastRecovery:(unint64_t)a3
{
  *((void *)&self->_has + 1) |= 0x4000uLL;
  self->_timeSinceLastRecovery = a3;
}

- (void)setHasTimeSinceLastRecovery:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  *((void *)&self->_has + 1) = *((void *)&self->_has + 1) & 0xFFFFFFFFFFFFBFFFLL | v3;
}

- (BOOL)hasTimeSinceLastRecovery
{
  return (*((unsigned __int8 *)&self->_has + 9) >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDLinkQualityMeasurements;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDLinkQualityMeasurements description](&v3, sel_description), -[AWDLinkQualityMeasurements dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x8000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    uint64_t v4 = *((void *)&self->_has + 1);
  }
  uint64_t has = (uint64_t)self->_has;
  if ((v4 & 0x4000000) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txOutputBelowExpectedTrue] forKey:@"TxOutputBelowExpected_true"];
    uint64_t has = (uint64_t)self->_has;
    uint64_t v4 = *((void *)&self->_has + 1);
    if ((v4 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v4 & 0x10000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_105;
    }
  }
  else if ((v4 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txOutputBelowExpectedFalse] forKey:@"TxOutputBelowExpected_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v4 & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_106;
  }
LABEL_105:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txOutputBelowInputTrue] forKey:@"TxOutputBelowInput_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v4 & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_107;
  }
LABEL_106:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txOutputBelowInputFalse] forKey:@"TxOutputBelowInput_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v4 & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_108;
  }
LABEL_107:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txLowFrameCountTrue] forKey:@"TxLowFrameCount_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x800000) == 0)
  {
LABEL_9:
    if ((v4 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_109;
  }
LABEL_108:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txLowFrameCountFalse] forKey:@"TxLowFrameCount_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 8) == 0)
  {
LABEL_10:
    if ((v4 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_110;
  }
LABEL_109:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxLowFrameCountTrue] forKey:@"RxLowFrameCount_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 4) == 0)
  {
LABEL_11:
    if ((has & 0x20000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_111;
  }
LABEL_110:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxLowFrameCountFalse] forKey:@"RxLowFrameCount_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_12:
    if ((has & 0x10000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_112;
  }
LABEL_111:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highTxLatencyTrue] forKey:@"HighTxLatency_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_13:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_113;
  }
LABEL_112:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highTxLatencyFalse] forKey:@"HighTxLatency_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_114;
  }
LABEL_113:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowTxPhyRateTrue] forKey:@"LowTxPhyRate_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x80000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_115;
  }
LABEL_114:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowTxPhyRateFalse] forKey:@"LowTxPhyRate_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x80000000) == 0)
  {
LABEL_16:
    if ((has & 0x40000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_116;
  }
LABEL_115:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highTxPerTrue] forKey:@"HighTxPer_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_17:
    if ((has & 0x200000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_117;
  }
LABEL_116:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highTxPerFalse] forKey:@"HighTxPer_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_18:
    if ((has & 0x100000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_118;
  }
LABEL_117:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highTxRetriesTrue] forKey:@"HighTxRetries_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_19:
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_119;
  }
LABEL_118:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highTxRetriesFalse] forKey:@"HighTxRetries_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v4 & 0x40000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_120;
  }
LABEL_119:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txQueueFullTrue] forKey:@"TxQueueFull_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x40000000) == 0)
  {
LABEL_21:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_121;
  }
LABEL_120:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txQueueFullFalse] forKey:@"TxQueueFull_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_22:
    if ((has & 0x400000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_122;
  }
LABEL_121:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowTxAMPDUDensityTrue] forKey:@"LowTxAMPDUDensity_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_23:
    if ((has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_123;
  }
LABEL_122:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowTxAMPDUDensityFalse] forKey:@"LowTxAMPDUDensity_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_24:
    if ((has & 0x4000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_124;
  }
LABEL_123:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxRetriesTrue] forKey:@"HighRxRetries_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_125;
  }
LABEL_124:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxRetriesFalse] forKey:@"HighRxRetries_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_126;
  }
LABEL_125:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxPhyPERTrue] forKey:@"HighRxPhyPER_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_27:
    if ((has & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_127;
  }
LABEL_126:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxPhyPERFalse] forKey:@"HighRxPhyPER_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_28:
    if ((has & 0x40000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_128;
  }
LABEL_127:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxFCSErrsTrue] forKey:@"HighRxFCSErrs_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_29:
    if ((has & 0x200000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_129;
  }
LABEL_128:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxFCSErrsFalse] forKey:@"HighRxFCSErrs_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_30:
    if ((has & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_130;
  }
LABEL_129:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxOverflowsTrue] forKey:@"HighRxOverflows_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_31:
    if ((has & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_131;
  }
LABEL_130:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxOverflowsFalse] forKey:@"HighRxOverflows_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_32:
    if ((has & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_132;
  }
LABEL_131:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxDupsTrue] forKey:@"HighRxDups_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_33:
    if ((has & 0x2000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_133;
  }
LABEL_132:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxDupsFalse] forKey:@"HighRxDups_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_34:
    if ((has & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_134;
  }
LABEL_133:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxReplaysTrue] forKey:@"HighRxReplays_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_35:
    if ((has & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_135;
  }
LABEL_134:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxReplaysFalse] forKey:@"HighRxReplays_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_36:
    if ((has & 0x4000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_136;
  }
LABEL_135:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxDecryptErrsTrue] forKey:@"HighRxDecryptErrs_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_37:
    if ((has & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_137;
  }
LABEL_136:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxDecryptErrsFalse] forKey:@"HighRxDecryptErrs_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_38:
    if ((has & 0x1000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_138;
  }
LABEL_137:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxDataPERTrue] forKey:@"HighRxDataPER_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_39:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_139;
  }
LABEL_138:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_highRxDataPERFalse] forKey:@"HighRxDataPER_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_140;
  }
LABEL_139:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowAvailWLANDurTrue] forKey:@"LowAvailWLANDur_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_141;
  }
LABEL_140:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowAvailWLANDurFalse] forKey:@"LowAvailWLANDur_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_142;
  }
LABEL_141:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowAvailWLANTxDurTrue] forKey:@"LowAvailWLANTxDur_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_43:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_143;
  }
LABEL_142:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowAvailWLANTxDurFalse] forKey:@"LowAvailWLANTxDur_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_144;
  }
LABEL_143:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowAvailWLANRxDurTrue] forKey:@"LowAvailWLANRxDur_true"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_145;
  }
LABEL_144:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lowAvailWLANRxDurFalse] forKey:@"LowAvailWLANRxDur_false"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_46:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_146;
  }
LABEL_145:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_cCA] forKey:@"CCA"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v4 & 0x20000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_147;
  }
LABEL_146:
  [v3 setObject:[NSNumber numberWithLongLong:self->_rSSI] forKey:@"RSSI"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v4 & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_148;
  }
LABEL_147:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txPhyRate] forKey:@"TxPhyRate"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x40) == 0)
  {
LABEL_49:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_149;
  }
LABEL_148:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxPhyRate] forKey:@"RxPhyRate"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x10000) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_150;
  }
LABEL_149:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txAMPDUDensity] forKey:@"TxAMPDUDensity"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x200) == 0) {
      goto LABEL_52;
    }
    goto LABEL_151;
  }
LABEL_150:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_measurementDurMS] forKey:@"MeasurementDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_52:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_152;
  }
LABEL_151:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_concurrentIntDurMS] forKey:@"ConcurrentIntDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x1000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_153;
  }
LABEL_152:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_tVPMActiveDurationMS] forKey:@"TVPMActiveDurationMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_154;
  }
LABEL_153:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_phyTxActivityDurMS] forKey:@"PhyTxActivityDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v4 & 0x200000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_155;
  }
LABEL_154:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_phyRxActivityDurMS] forKey:@"PhyRxActivityDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_156;
  }
LABEL_155:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txSubBytes] forKey:@"TxSubBytes"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x20000) == 0)
  {
LABEL_57:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_157;
  }
LABEL_156:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txCompBytes] forKey:@"TxCompBytes"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x80000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_158;
  }
LABEL_157:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txDelayBytes] forKey:@"TxDelayBytes"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v4 & 0x400000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_159;
  }
LABEL_158:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_offChanDurMS] forKey:@"OffChanDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_160;
  }
LABEL_159:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txSubPkts] forKey:@"TxSubPkts"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_161;
  }
LABEL_160:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txCompPkts] forKey:@"TxCompPkts"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_162;
  }
LABEL_161:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_maxQueueFullDurMS] forKey:@"MaxQueueFullDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_163;
  }
LABEL_162:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_avgTxLatencyMS] forKey:@"AvgTxLatencyMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_164;
  }
LABEL_163:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_bTAntennaDurMS] forKey:@"BTAntennaDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x800000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_165;
  }
LABEL_164:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_outputThroughput] forKey:@"OutputThroughput"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_66:
    if ((has & 0x800) == 0) {
      goto LABEL_67;
    }
    goto LABEL_166;
  }
LABEL_165:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_inputThroughput] forKey:@"InputThroughput"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_67:
    if ((has & 0x400) == 0) {
      goto LABEL_68;
    }
    goto LABEL_167;
  }
LABEL_166:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_expectedThroughput] forKey:@"ExpectedThroughput"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_68:
    if ((has & 4) == 0) {
      goto LABEL_69;
    }
    goto LABEL_168;
  }
LABEL_167:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_delayedThroughput] forKey:@"DelayedThroughput"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_169;
  }
LABEL_168:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_availWLANDurMS] forKey:@"AvailWLANDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 8) == 0) {
      goto LABEL_71;
    }
    goto LABEL_170;
  }
LABEL_169:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_availWLANTxDurMS] forKey:@"AvailWLANTxDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_71:
    if ((v4 & 0x100000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_171;
  }
LABEL_170:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_availWLANRxDurMS] forKey:@"AvailWLANRxDurMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_172;
  }
LABEL_171:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txRetries] forKey:@"TxRetries"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x200000) == 0)
  {
LABEL_73:
    if ((v4 & 0x400000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_173;
  }
LABEL_172:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txFails] forKey:@"TxFails"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x400000) == 0)
  {
LABEL_74:
    if ((v4 & 0x10) == 0) {
      goto LABEL_75;
    }
    goto LABEL_174;
  }
LABEL_173:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txFrames] forKey:@"TxFrames"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_75:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_175;
  }
LABEL_174:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxOvflErrs] forKey:@"RxOvflErrs"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v4 & 0x20) == 0) {
      goto LABEL_77;
    }
    goto LABEL_176;
  }
LABEL_175:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxFCSErrs] forKey:@"RxFCSErrs"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x20) == 0)
  {
LABEL_77:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_177;
  }
LABEL_176:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxPLCPErrs] forKey:@"RxPLCPErrs"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_178;
  }
LABEL_177:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxCRSErrs] forKey:@"RxCRSErrs"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v4 & 0x80) == 0) {
      goto LABEL_80;
    }
    goto LABEL_179;
  }
LABEL_178:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxDupErrs] forKey:@"RxDupErrs"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x80) == 0)
  {
LABEL_80:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_180;
  }
LABEL_179:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxReplayErrs] forKey:@"RxReplayErrs"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v4 & 0x100) == 0) {
      goto LABEL_82;
    }
    goto LABEL_181;
  }
LABEL_180:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxDecryErrs] forKey:@"RxDecryErrs"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x100) == 0)
  {
LABEL_82:
    if ((v4 & 2) == 0) {
      goto LABEL_83;
    }
    goto LABEL_182;
  }
LABEL_181:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxRetries] forKey:@"RxRetries"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 2) == 0)
  {
LABEL_83:
    if ((v4 & 1) == 0) {
      goto LABEL_84;
    }
    goto LABEL_183;
  }
LABEL_182:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxGoodPlcps] forKey:@"RxGoodPlcps"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 1) == 0)
  {
LABEL_84:
    if ((v4 & 0x400) == 0) {
      goto LABEL_85;
    }
    goto LABEL_184;
  }
LABEL_183:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxFrames] forKey:@"RxFrames"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x400) == 0)
  {
LABEL_85:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_185;
  }
LABEL_184:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_sNR] forKey:@"SNR"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x100000) == 0)
  {
LABEL_86:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_186;
  }
LABEL_185:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_txExpectedAMPDUDensity] forKey:@"TxExpectedAMPDUDensity"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_187;
  }
LABEL_186:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rC1CoexDurationMS] forKey:@"RC1CoexDurationMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_188;
  }
LABEL_187:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rC2CoexDurationMS] forKey:@"RC2CoexDurationMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v4 & 0x200) == 0) {
      goto LABEL_90;
    }
    goto LABEL_189;
  }
LABEL_188:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lTECoexDurationMS] forKey:@"LTECoexDurationMS"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x200) == 0)
  {
LABEL_90:
    if ((has & 1) == 0) {
      goto LABEL_91;
    }
    goto LABEL_190;
  }
LABEL_189:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxThroughput] forKey:@"RxThroughput"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_91:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_191;
  }
LABEL_190:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_aPTxDataStall] forKey:@"APTxDataStall"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v4 & 0x800) == 0) {
      goto LABEL_93;
    }
    goto LABEL_192;
  }
LABEL_191:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_rxAmpduTxBaMismatch] forKey:@"RxAmpduTxBaMismatch"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x800) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_193;
  }
LABEL_192:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_symptomsFails] forKey:@"SymptomsFails"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_194;
  }
LABEL_193:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_is2GBand] forKey:@"Is2GBand"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x80) == 0) {
      goto LABEL_96;
    }
    goto LABEL_195;
  }
LABEL_194:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_isFGTraffic] forKey:@"IsFGTraffic"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_96:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_196;
  }
LABEL_195:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_baselineThroughput] forKey:@"BaselineThroughput"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((v4 & 0x2000) == 0)
  {
LABEL_97:
    if ((has & 0x400000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_197;
  }
LABEL_196:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_testThroughput] forKey:@"TestThroughput"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_198;
  }
LABEL_197:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_infraDutyCycle] forKey:@"InfraDutyCycle"];
  uint64_t has = (uint64_t)self->_has;
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_99:
    if ((has & 2) == 0) {
      goto LABEL_100;
    }
LABEL_199:
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_accessPointOUI] forKey:@"AccessPointOUI"];
    if ((*((void *)&self->_has + 1) & 0x4000) == 0) {
      return v3;
    }
    goto LABEL_101;
  }
LABEL_198:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_lastScanReason] forKey:@"LastScanReason"];
  uint64_t v4 = *((void *)&self->_has + 1);
  if ((*(void *)&self->_has & 2) != 0) {
    goto LABEL_199;
  }
LABEL_100:
  if ((v4 & 0x4000) != 0) {
LABEL_101:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timeSinceLastRecovery] forKey:@"TimeSinceLastRecovery"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDLinkQualityMeasurementsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  p_uint64_t has = &self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x8000) != 0)
  {
    PBDataWriterWriteUint64Field();
    uint64_t v5 = *((void *)p_has + 1);
  }
  uint64_t has = *(void *)p_has;
  if ((v5 & 0x4000000) != 0)
  {
    PBDataWriterWriteUint64Field();
    uint64_t has = (uint64_t)self->_has;
    uint64_t v5 = *((void *)&self->_has + 1);
    if ((v5 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x10000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_104;
    }
  }
  else if ((v5 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_105;
  }
LABEL_104:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_106;
  }
LABEL_105:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_107;
  }
LABEL_106:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_108;
  }
LABEL_107:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_109;
  }
LABEL_108:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((has & 0x20000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_110;
  }
LABEL_109:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_12:
    if ((has & 0x10000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_111;
  }
LABEL_110:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_13:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_112;
  }
LABEL_111:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_113;
  }
LABEL_112:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x80000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_114;
  }
LABEL_113:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000000) == 0)
  {
LABEL_16:
    if ((has & 0x40000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_115;
  }
LABEL_114:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_17:
    if ((has & 0x200000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_116;
  }
LABEL_115:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_18:
    if ((has & 0x100000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_117;
  }
LABEL_116:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_118;
  }
LABEL_117:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_119;
  }
LABEL_118:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_21:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_120;
  }
LABEL_119:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_22:
    if ((has & 0x400000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_121;
  }
LABEL_120:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_23:
    if ((has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_122;
  }
LABEL_121:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_24:
    if ((has & 0x4000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_123;
  }
LABEL_122:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_124;
  }
LABEL_123:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_125;
  }
LABEL_124:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_27:
    if ((has & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_126;
  }
LABEL_125:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_28:
    if ((has & 0x40000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_127;
  }
LABEL_126:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_29:
    if ((has & 0x200000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_128;
  }
LABEL_127:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_30:
    if ((has & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_129;
  }
LABEL_128:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_31:
    if ((has & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_130;
  }
LABEL_129:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_32:
    if ((has & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_131;
  }
LABEL_130:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_33:
    if ((has & 0x2000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_132;
  }
LABEL_131:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_34:
    if ((has & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_133;
  }
LABEL_132:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_35:
    if ((has & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_134;
  }
LABEL_133:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_36:
    if ((has & 0x4000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_135;
  }
LABEL_134:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_37:
    if ((has & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_136;
  }
LABEL_135:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_38:
    if ((has & 0x1000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_137;
  }
LABEL_136:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_39:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_138;
  }
LABEL_137:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_139;
  }
LABEL_138:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_140;
  }
LABEL_139:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_141;
  }
LABEL_140:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_43:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_142;
  }
LABEL_141:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_143;
  }
LABEL_142:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_144;
  }
LABEL_143:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_46:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_145;
  }
LABEL_144:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_146;
  }
LABEL_145:
  PBDataWriterWriteInt64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v5 & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_147;
  }
LABEL_146:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40) == 0)
  {
LABEL_49:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_148;
  }
LABEL_147:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10000) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_149;
  }
LABEL_148:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x200) == 0) {
      goto LABEL_52;
    }
    goto LABEL_150;
  }
LABEL_149:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_52:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_151;
  }
LABEL_150:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_152;
  }
LABEL_151:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_153;
  }
LABEL_152:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_154;
  }
LABEL_153:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_155;
  }
LABEL_154:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20000) == 0)
  {
LABEL_57:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_156;
  }
LABEL_155:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_157;
  }
LABEL_156:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_158;
  }
LABEL_157:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_159;
  }
LABEL_158:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_160;
  }
LABEL_159:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_161;
  }
LABEL_160:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_162;
  }
LABEL_161:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_163;
  }
LABEL_162:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x800000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_164;
  }
LABEL_163:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_66:
    if ((has & 0x800) == 0) {
      goto LABEL_67;
    }
    goto LABEL_165;
  }
LABEL_164:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_67:
    if ((has & 0x400) == 0) {
      goto LABEL_68;
    }
    goto LABEL_166;
  }
LABEL_165:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_68:
    if ((has & 4) == 0) {
      goto LABEL_69;
    }
    goto LABEL_167;
  }
LABEL_166:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_168;
  }
LABEL_167:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 8) == 0) {
      goto LABEL_71;
    }
    goto LABEL_169;
  }
LABEL_168:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_71:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_170;
  }
LABEL_169:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_171;
  }
LABEL_170:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200000) == 0)
  {
LABEL_73:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_172;
  }
LABEL_171:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400000) == 0)
  {
LABEL_74:
    if ((v5 & 0x10) == 0) {
      goto LABEL_75;
    }
    goto LABEL_173;
  }
LABEL_172:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_75:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_174;
  }
LABEL_173:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v5 & 0x20) == 0) {
      goto LABEL_77;
    }
    goto LABEL_175;
  }
LABEL_174:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_77:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_176;
  }
LABEL_175:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_177;
  }
LABEL_176:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v5 & 0x80) == 0) {
      goto LABEL_80;
    }
    goto LABEL_178;
  }
LABEL_177:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_80:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_179;
  }
LABEL_178:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v5 & 0x100) == 0) {
      goto LABEL_82;
    }
    goto LABEL_180;
  }
LABEL_179:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100) == 0)
  {
LABEL_82:
    if ((v5 & 2) == 0) {
      goto LABEL_83;
    }
    goto LABEL_181;
  }
LABEL_180:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 2) == 0)
  {
LABEL_83:
    if ((v5 & 1) == 0) {
      goto LABEL_84;
    }
    goto LABEL_182;
  }
LABEL_181:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 1) == 0)
  {
LABEL_84:
    if ((v5 & 0x400) == 0) {
      goto LABEL_85;
    }
    goto LABEL_183;
  }
LABEL_182:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_85:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_184;
  }
LABEL_183:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100000) == 0)
  {
LABEL_86:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_185;
  }
LABEL_184:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_186;
  }
LABEL_185:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_187;
  }
LABEL_186:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v5 & 0x200) == 0) {
      goto LABEL_90;
    }
    goto LABEL_188;
  }
LABEL_187:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_90:
    if ((has & 1) == 0) {
      goto LABEL_91;
    }
    goto LABEL_189;
  }
LABEL_188:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_91:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_190;
  }
LABEL_189:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v5 & 0x800) == 0) {
      goto LABEL_93;
    }
    goto LABEL_191;
  }
LABEL_190:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_192;
  }
LABEL_191:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_193;
  }
LABEL_192:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x80) == 0) {
      goto LABEL_96;
    }
    goto LABEL_194;
  }
LABEL_193:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_96:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_195;
  }
LABEL_194:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_97:
    if ((has & 0x400000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_196;
  }
LABEL_195:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_197;
  }
LABEL_196:
  PBDataWriterWriteUint64Field();
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_99:
    if ((has & 2) == 0) {
      goto LABEL_100;
    }
LABEL_198:
    PBDataWriterWriteUint64Field();
    if ((*((void *)&self->_has + 1) & 0x4000) == 0) {
      return;
    }
    goto LABEL_199;
  }
LABEL_197:
  PBDataWriterWriteUint64Field();
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)&self->_has & 2) != 0) {
    goto LABEL_198;
  }
LABEL_100:
  if ((v5 & 0x4000) == 0) {
    return;
  }
LABEL_199:

  PBDataWriterWriteUint64Field();
}

- (void)copyTo:(id)a3
{
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x8000) != 0)
  {
    *((void *)a3 + 80) = self->_timestamp;
    *((void *)a3 + 101) |= 0x8000uLL;
    uint64_t v3 = *((void *)&self->_has + 1);
  }
  uint64_t has = (uint64_t)self->_has;
  if ((v3 & 0x4000000) != 0)
  {
    *((void *)a3 + 91) = self->_txOutputBelowExpectedTrue;
    *((void *)a3 + 101) |= 0x4000000uLL;
    uint64_t has = (uint64_t)self->_has;
    uint64_t v3 = *((void *)&self->_has + 1);
    if ((v3 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v3 & 0x10000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_104;
    }
  }
  else if ((v3 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  *((void *)a3 + 90) = self->_txOutputBelowExpectedFalse;
  *((void *)a3 + 101) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((void *)a3 + 93) = self->_txOutputBelowInputTrue;
  *((void *)a3 + 101) |= 0x10000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((void *)a3 + 92) = self->_txOutputBelowInputFalse;
  *((void *)a3 + 101) |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((void *)a3 + 89) = self->_txLowFrameCountTrue;
  *((void *)a3 + 101) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x800000) == 0)
  {
LABEL_9:
    if ((v3 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((void *)a3 + 88) = self->_txLowFrameCountFalse;
  *((void *)a3 + 101) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 8) == 0)
  {
LABEL_10:
    if ((v3 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((void *)a3 + 68) = self->_rxLowFrameCountTrue;
  *((void *)a3 + 101) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 4) == 0)
  {
LABEL_11:
    if ((has & 0x20000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((void *)a3 + 67) = self->_rxLowFrameCountFalse;
  *((void *)a3 + 101) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_12:
    if ((has & 0x10000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((void *)a3 + 30) = self->_highTxLatencyTrue;
  *((void *)a3 + 100) |= 0x20000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_13:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((void *)a3 + 29) = self->_highTxLatencyFalse;
  *((void *)a3 + 100) |= 0x10000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((void *)a3 + 50) = self->_lowTxPhyRateTrue;
  *((void *)a3 + 100) |= 0x2000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x80000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((void *)a3 + 49) = self->_lowTxPhyRateFalse;
  *((void *)a3 + 100) |= 0x1000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x80000000) == 0)
  {
LABEL_16:
    if ((has & 0x40000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((void *)a3 + 32) = self->_highTxPerTrue;
  *((void *)a3 + 100) |= 0x80000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_17:
    if ((has & 0x200000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_116;
  }
LABEL_115:
  *((void *)a3 + 31) = self->_highTxPerFalse;
  *((void *)a3 + 100) |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_18:
    if ((has & 0x100000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((void *)a3 + 34) = self->_highTxRetriesTrue;
  *((void *)a3 + 100) |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_19:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_118;
  }
LABEL_117:
  *((void *)a3 + 33) = self->_highTxRetriesFalse;
  *((void *)a3 + 100) |= 0x100000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v3 & 0x40000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((void *)a3 + 96) = self->_txQueueFullTrue;
  *((void *)a3 + 101) |= 0x80000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_21:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((void *)a3 + 95) = self->_txQueueFullFalse;
  *((void *)a3 + 101) |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_22:
    if ((has & 0x400000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((void *)a3 + 48) = self->_lowTxAMPDUDensityTrue;
  *((void *)a3 + 100) |= 0x800000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_23:
    if ((has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((void *)a3 + 47) = self->_lowTxAMPDUDensityFalse;
  *((void *)a3 + 100) |= 0x400000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_24:
    if ((has & 0x4000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((void *)a3 + 28) = self->_highRxRetriesTrue;
  *((void *)a3 + 100) |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((void *)a3 + 27) = self->_highRxRetriesFalse;
  *((void *)a3 + 100) |= 0x4000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((void *)a3 + 24) = self->_highRxPhyPERTrue;
  *((void *)a3 + 100) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_27:
    if ((has & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((void *)a3 + 23) = self->_highRxPhyPERFalse;
  *((void *)a3 + 100) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_28:
    if ((has & 0x40000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((void *)a3 + 20) = self->_highRxFCSErrsTrue;
  *((void *)a3 + 100) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_29:
    if ((has & 0x200000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_128;
  }
LABEL_127:
  *((void *)a3 + 19) = self->_highRxFCSErrsFalse;
  *((void *)a3 + 100) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_30:
    if ((has & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_129;
  }
LABEL_128:
  *((void *)a3 + 22) = self->_highRxOverflowsTrue;
  *((void *)a3 + 100) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_31:
    if ((has & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_130;
  }
LABEL_129:
  *((void *)a3 + 21) = self->_highRxOverflowsFalse;
  *((void *)a3 + 100) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_32:
    if ((has & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_131;
  }
LABEL_130:
  *((void *)a3 + 18) = self->_highRxDupsTrue;
  *((void *)a3 + 100) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_33:
    if ((has & 0x2000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_132;
  }
LABEL_131:
  *((void *)a3 + 17) = self->_highRxDupsFalse;
  *((void *)a3 + 100) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_34:
    if ((has & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_133;
  }
LABEL_132:
  *((void *)a3 + 26) = self->_highRxReplaysTrue;
  *((void *)a3 + 100) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_35:
    if ((has & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_134;
  }
LABEL_133:
  *((void *)a3 + 25) = self->_highRxReplaysFalse;
  *((void *)a3 + 100) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_36:
    if ((has & 0x4000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_135;
  }
LABEL_134:
  *((void *)a3 + 16) = self->_highRxDecryptErrsTrue;
  *((void *)a3 + 100) |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_37:
    if ((has & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_136;
  }
LABEL_135:
  *((void *)a3 + 15) = self->_highRxDecryptErrsFalse;
  *((void *)a3 + 100) |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_38:
    if ((has & 0x1000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_137;
  }
LABEL_136:
  *((void *)a3 + 14) = self->_highRxDataPERTrue;
  *((void *)a3 + 100) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_39:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_138;
  }
LABEL_137:
  *((void *)a3 + 13) = self->_highRxDataPERFalse;
  *((void *)a3 + 100) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((void *)a3 + 42) = self->_lowAvailWLANDurTrue;
  *((void *)a3 + 100) |= 0x20000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_140;
  }
LABEL_139:
  *((void *)a3 + 41) = self->_lowAvailWLANDurFalse;
  *((void *)a3 + 100) |= 0x10000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((void *)a3 + 46) = self->_lowAvailWLANTxDurTrue;
  *((void *)a3 + 100) |= 0x200000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_43:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_142;
  }
LABEL_141:
  *((void *)a3 + 45) = self->_lowAvailWLANTxDurFalse;
  *((void *)a3 + 100) |= 0x100000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_143;
  }
LABEL_142:
  *((void *)a3 + 44) = self->_lowAvailWLANRxDurTrue;
  *((void *)a3 + 100) |= 0x80000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_144;
  }
LABEL_143:
  *((void *)a3 + 43) = self->_lowAvailWLANRxDurFalse;
  *((void *)a3 + 100) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_46:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_145;
  }
LABEL_144:
  *((void *)a3 + 9) = self->_cCA;
  *((void *)a3 + 100) |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_146;
  }
LABEL_145:
  *((void *)a3 + 59) = self->_rSSI;
  *((void *)a3 + 100) |= 0x400000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v3 & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_147;
  }
LABEL_146:
  *((void *)a3 + 94) = self->_txPhyRate;
  *((void *)a3 + 101) |= 0x20000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x40) == 0)
  {
LABEL_49:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((void *)a3 + 71) = self->_rxPhyRate;
  *((void *)a3 + 101) |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x10000) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((void *)a3 + 81) = self->_txAMPDUDensity;
  *((void *)a3 + 101) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x200) == 0) {
      goto LABEL_52;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((void *)a3 + 52) = self->_measurementDurMS;
  *((void *)a3 + 100) |= 0x8000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_52:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((void *)a3 + 10) = self->_concurrentIntDurMS;
  *((void *)a3 + 100) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x1000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_152;
  }
LABEL_151:
  *((void *)a3 + 77) = self->_tVPMActiveDurationMS;
  *((void *)a3 + 101) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_153;
  }
LABEL_152:
  *((void *)a3 + 56) = self->_phyTxActivityDurMS;
  *((void *)a3 + 100) |= 0x80000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v3 & 0x200000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_154;
  }
LABEL_153:
  *((void *)a3 + 55) = self->_phyRxActivityDurMS;
  *((void *)a3 + 100) |= 0x40000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_155;
  }
LABEL_154:
  *((void *)a3 + 98) = self->_txSubBytes;
  *((void *)a3 + 101) |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x20000) == 0)
  {
LABEL_57:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_156;
  }
LABEL_155:
  *((void *)a3 + 82) = self->_txCompBytes;
  *((void *)a3 + 101) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x80000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_157;
  }
LABEL_156:
  *((void *)a3 + 84) = self->_txDelayBytes;
  *((void *)a3 + 101) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v3 & 0x400000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_158;
  }
LABEL_157:
  *((void *)a3 + 53) = self->_offChanDurMS;
  *((void *)a3 + 100) |= 0x10000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_159;
  }
LABEL_158:
  *((void *)a3 + 99) = self->_txSubPkts;
  *((void *)a3 + 101) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_160;
  }
LABEL_159:
  *((void *)a3 + 83) = self->_txCompPkts;
  *((void *)a3 + 101) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_161;
  }
LABEL_160:
  *((void *)a3 + 51) = self->_maxQueueFullDurMS;
  *((void *)a3 + 100) |= 0x4000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_162;
  }
LABEL_161:
  *((void *)a3 + 6) = self->_avgTxLatencyMS;
  *((void *)a3 + 100) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_163;
  }
LABEL_162:
  *((void *)a3 + 7) = self->_bTAntennaDurMS;
  *((void *)a3 + 100) |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x800000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_164;
  }
LABEL_163:
  *((void *)a3 + 54) = self->_outputThroughput;
  *((void *)a3 + 100) |= 0x20000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_66:
    if ((has & 0x800) == 0) {
      goto LABEL_67;
    }
    goto LABEL_165;
  }
LABEL_164:
  *((void *)a3 + 36) = self->_inputThroughput;
  *((void *)a3 + 100) |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_67:
    if ((has & 0x400) == 0) {
      goto LABEL_68;
    }
    goto LABEL_166;
  }
LABEL_165:
  *((void *)a3 + 12) = self->_expectedThroughput;
  *((void *)a3 + 100) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_68:
    if ((has & 4) == 0) {
      goto LABEL_69;
    }
    goto LABEL_167;
  }
LABEL_166:
  *((void *)a3 + 11) = self->_delayedThroughput;
  *((void *)a3 + 100) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_168;
  }
LABEL_167:
  *((void *)a3 + 3) = self->_availWLANDurMS;
  *((void *)a3 + 100) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 8) == 0) {
      goto LABEL_71;
    }
    goto LABEL_169;
  }
LABEL_168:
  *((void *)a3 + 5) = self->_availWLANTxDurMS;
  *((void *)a3 + 100) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_71:
    if ((v3 & 0x100000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_170;
  }
LABEL_169:
  *((void *)a3 + 4) = self->_availWLANRxDurMS;
  *((void *)a3 + 100) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_171;
  }
LABEL_170:
  *((void *)a3 + 97) = self->_txRetries;
  *((void *)a3 + 101) |= 0x100000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x200000) == 0)
  {
LABEL_73:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_172;
  }
LABEL_171:
  *((void *)a3 + 86) = self->_txFails;
  *((void *)a3 + 101) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x400000) == 0)
  {
LABEL_74:
    if ((v3 & 0x10) == 0) {
      goto LABEL_75;
    }
    goto LABEL_173;
  }
LABEL_172:
  *((void *)a3 + 87) = self->_txFrames;
  *((void *)a3 + 101) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x10) == 0)
  {
LABEL_75:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_174;
  }
LABEL_173:
  *((void *)a3 + 69) = self->_rxOvflErrs;
  *((void *)a3 + 101) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v3 & 0x20) == 0) {
      goto LABEL_77;
    }
    goto LABEL_175;
  }
LABEL_174:
  *((void *)a3 + 64) = self->_rxFCSErrs;
  *((void *)a3 + 100) |= 0x8000000000000000;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x20) == 0)
  {
LABEL_77:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_176;
  }
LABEL_175:
  *((void *)a3 + 70) = self->_rxPLCPErrs;
  *((void *)a3 + 101) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_177;
  }
LABEL_176:
  *((void *)a3 + 61) = self->_rxCRSErrs;
  *((void *)a3 + 100) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v3 & 0x80) == 0) {
      goto LABEL_80;
    }
    goto LABEL_178;
  }
LABEL_177:
  *((void *)a3 + 63) = self->_rxDupErrs;
  *((void *)a3 + 100) |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x80) == 0)
  {
LABEL_80:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_179;
  }
LABEL_178:
  *((void *)a3 + 72) = self->_rxReplayErrs;
  *((void *)a3 + 101) |= 0x80uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v3 & 0x100) == 0) {
      goto LABEL_82;
    }
    goto LABEL_180;
  }
LABEL_179:
  *((void *)a3 + 62) = self->_rxDecryErrs;
  *((void *)a3 + 100) |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x100) == 0)
  {
LABEL_82:
    if ((v3 & 2) == 0) {
      goto LABEL_83;
    }
    goto LABEL_181;
  }
LABEL_180:
  *((void *)a3 + 73) = self->_rxRetries;
  *((void *)a3 + 101) |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 2) == 0)
  {
LABEL_83:
    if ((v3 & 1) == 0) {
      goto LABEL_84;
    }
    goto LABEL_182;
  }
LABEL_181:
  *((void *)a3 + 66) = self->_rxGoodPlcps;
  *((void *)a3 + 101) |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 1) == 0)
  {
LABEL_84:
    if ((v3 & 0x400) == 0) {
      goto LABEL_85;
    }
    goto LABEL_183;
  }
LABEL_182:
  *((void *)a3 + 65) = self->_rxFrames;
  *((void *)a3 + 101) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x400) == 0)
  {
LABEL_85:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_184;
  }
LABEL_183:
  *((void *)a3 + 75) = self->_sNR;
  *((void *)a3 + 101) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x100000) == 0)
  {
LABEL_86:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_185;
  }
LABEL_184:
  *((void *)a3 + 85) = self->_txExpectedAMPDUDensity;
  *((void *)a3 + 101) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_186;
  }
LABEL_185:
  *((void *)a3 + 57) = self->_rC1CoexDurationMS;
  *((void *)a3 + 100) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_187;
  }
LABEL_186:
  *((void *)a3 + 58) = self->_rC2CoexDurationMS;
  *((void *)a3 + 100) |= 0x200000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v3 & 0x200) == 0) {
      goto LABEL_90;
    }
    goto LABEL_188;
  }
LABEL_187:
  *((void *)a3 + 39) = self->_lTECoexDurationMS;
  *((void *)a3 + 100) |= 0x4000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x200) == 0)
  {
LABEL_90:
    if ((has & 1) == 0) {
      goto LABEL_91;
    }
    goto LABEL_189;
  }
LABEL_188:
  *((void *)a3 + 74) = self->_rxThroughput;
  *((void *)a3 + 101) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_91:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_190;
  }
LABEL_189:
  *((void *)a3 + 1) = self->_aPTxDataStall;
  *((void *)a3 + 100) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v3 & 0x800) == 0) {
      goto LABEL_93;
    }
    goto LABEL_191;
  }
LABEL_190:
  *((void *)a3 + 60) = self->_rxAmpduTxBaMismatch;
  *((void *)a3 + 100) |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x800) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_192;
  }
LABEL_191:
  *((void *)a3 + 76) = self->_symptomsFails;
  *((void *)a3 + 101) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_193;
  }
LABEL_192:
  *((void *)a3 + 37) = self->_is2GBand;
  *((void *)a3 + 100) |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x80) == 0) {
      goto LABEL_96;
    }
    goto LABEL_194;
  }
LABEL_193:
  *((void *)a3 + 38) = self->_isFGTraffic;
  *((void *)a3 + 100) |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_96:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_195;
  }
LABEL_194:
  *((void *)a3 + 8) = self->_baselineThroughput;
  *((void *)a3 + 100) |= 0x80uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((v3 & 0x2000) == 0)
  {
LABEL_97:
    if ((has & 0x400000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_196;
  }
LABEL_195:
  *((void *)a3 + 78) = self->_testThroughput;
  *((void *)a3 + 101) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_197;
  }
LABEL_196:
  *((void *)a3 + 35) = self->_infraDutyCycle;
  *((void *)a3 + 100) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_99:
    if ((has & 2) == 0) {
      goto LABEL_100;
    }
    goto LABEL_198;
  }
LABEL_197:
  *((void *)a3 + 40) = self->_lastScanReason;
  *((void *)a3 + 100) |= 0x8000000000uLL;
  uint64_t v3 = *((void *)&self->_has + 1);
  if ((*(void *)&self->_has & 2) == 0)
  {
LABEL_100:
    if ((v3 & 0x4000) == 0) {
      return;
    }
LABEL_199:
    *((void *)a3 + 79) = self->_timeSinceLastRecovery;
    *((void *)a3 + 101) |= 0x4000uLL;
    return;
  }
LABEL_198:
  *((void *)a3 + 2) = self->_accessPointOUI;
  *((void *)a3 + 100) |= 2uLL;
  if ((*((void *)&self->_has + 1) & 0x4000) != 0) {
    goto LABEL_199;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [(id)[(id)[(id)objc_opt_class() allocWithZone:a3] init];
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x8000) != 0)
  {
    *((void *)result + 80) = self->_timestamp;
    *((void *)result + 101) |= 0x8000uLL;
    uint64_t v5 = *((void *)&self->_has + 1);
  }
  uint64_t has = (uint64_t)self->_has;
  if ((v5 & 0x4000000) != 0)
  {
    *((void *)result + 91) = self->_txOutputBelowExpectedTrue;
    *((void *)result + 101) |= 0x4000000uLL;
    uint64_t has = (uint64_t)self->_has;
    uint64_t v5 = *((void *)&self->_has + 1);
    if ((v5 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v5 & 0x10000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_105;
    }
  }
  else if ((v5 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  *((void *)result + 90) = self->_txOutputBelowExpectedFalse;
  *((void *)result + 101) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((void *)result + 93) = self->_txOutputBelowInputTrue;
  *((void *)result + 101) |= 0x10000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_107;
  }
LABEL_106:
  *((void *)result + 92) = self->_txOutputBelowInputFalse;
  *((void *)result + 101) |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_108;
  }
LABEL_107:
  *((void *)result + 89) = self->_txLowFrameCountTrue;
  *((void *)result + 101) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x800000) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_109;
  }
LABEL_108:
  *((void *)result + 88) = self->_txLowFrameCountFalse;
  *((void *)result + 101) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_110;
  }
LABEL_109:
  *((void *)result + 68) = self->_rxLowFrameCountTrue;
  *((void *)result + 101) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 4) == 0)
  {
LABEL_11:
    if ((has & 0x20000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_111;
  }
LABEL_110:
  *((void *)result + 67) = self->_rxLowFrameCountFalse;
  *((void *)result + 101) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000000) == 0)
  {
LABEL_12:
    if ((has & 0x10000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_112;
  }
LABEL_111:
  *((void *)result + 30) = self->_highTxLatencyTrue;
  *((void *)result + 100) |= 0x20000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000000) == 0)
  {
LABEL_13:
    if ((has & 0x2000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_113;
  }
LABEL_112:
  *((void *)result + 29) = self->_highTxLatencyFalse;
  *((void *)result + 100) |= 0x10000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((has & 0x1000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_114;
  }
LABEL_113:
  *((void *)result + 50) = self->_lowTxPhyRateTrue;
  *((void *)result + 100) |= 0x2000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((has & 0x80000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_115;
  }
LABEL_114:
  *((void *)result + 49) = self->_lowTxPhyRateFalse;
  *((void *)result + 100) |= 0x1000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000000) == 0)
  {
LABEL_16:
    if ((has & 0x40000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_116;
  }
LABEL_115:
  *((void *)result + 32) = self->_highTxPerTrue;
  *((void *)result + 100) |= 0x80000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000000) == 0)
  {
LABEL_17:
    if ((has & 0x200000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_117;
  }
LABEL_116:
  *((void *)result + 31) = self->_highTxPerFalse;
  *((void *)result + 100) |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000000) == 0)
  {
LABEL_18:
    if ((has & 0x100000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_118;
  }
LABEL_117:
  *((void *)result + 34) = self->_highTxRetriesTrue;
  *((void *)result + 100) |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000000) == 0)
  {
LABEL_19:
    if ((v5 & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_119;
  }
LABEL_118:
  *((void *)result + 33) = self->_highTxRetriesFalse;
  *((void *)result + 100) |= 0x100000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v5 & 0x40000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_120;
  }
LABEL_119:
  *((void *)result + 96) = self->_txQueueFullTrue;
  *((void *)result + 101) |= 0x80000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40000000) == 0)
  {
LABEL_21:
    if ((has & 0x800000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_121;
  }
LABEL_120:
  *((void *)result + 95) = self->_txQueueFullFalse;
  *((void *)result + 101) |= 0x40000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000) == 0)
  {
LABEL_22:
    if ((has & 0x400000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_122;
  }
LABEL_121:
  *((void *)result + 48) = self->_lowTxAMPDUDensityTrue;
  *((void *)result + 100) |= 0x800000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000) == 0)
  {
LABEL_23:
    if ((has & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_123;
  }
LABEL_122:
  *((void *)result + 47) = self->_lowTxAMPDUDensityFalse;
  *((void *)result + 100) |= 0x400000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000) == 0)
  {
LABEL_24:
    if ((has & 0x4000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_124;
  }
LABEL_123:
  *((void *)result + 28) = self->_highRxRetriesTrue;
  *((void *)result + 100) |= 0x8000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000) == 0)
  {
LABEL_25:
    if ((has & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_125;
  }
LABEL_124:
  *((void *)result + 27) = self->_highRxRetriesFalse;
  *((void *)result + 100) |= 0x4000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000) == 0)
  {
LABEL_26:
    if ((has & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_126;
  }
LABEL_125:
  *((void *)result + 24) = self->_highRxPhyPERTrue;
  *((void *)result + 100) |= 0x800000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000) == 0)
  {
LABEL_27:
    if ((has & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_127;
  }
LABEL_126:
  *((void *)result + 23) = self->_highRxPhyPERFalse;
  *((void *)result + 100) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000) == 0)
  {
LABEL_28:
    if ((has & 0x40000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_128;
  }
LABEL_127:
  *((void *)result + 20) = self->_highRxFCSErrsTrue;
  *((void *)result + 100) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000) == 0)
  {
LABEL_29:
    if ((has & 0x200000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_129;
  }
LABEL_128:
  *((void *)result + 19) = self->_highRxFCSErrsFalse;
  *((void *)result + 100) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000) == 0)
  {
LABEL_30:
    if ((has & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_130;
  }
LABEL_129:
  *((void *)result + 22) = self->_highRxOverflowsTrue;
  *((void *)result + 100) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000) == 0)
  {
LABEL_31:
    if ((has & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_131;
  }
LABEL_130:
  *((void *)result + 21) = self->_highRxOverflowsFalse;
  *((void *)result + 100) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000) == 0)
  {
LABEL_32:
    if ((has & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_132;
  }
LABEL_131:
  *((void *)result + 18) = self->_highRxDupsTrue;
  *((void *)result + 100) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000) == 0)
  {
LABEL_33:
    if ((has & 0x2000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_133;
  }
LABEL_132:
  *((void *)result + 17) = self->_highRxDupsFalse;
  *((void *)result + 100) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000) == 0)
  {
LABEL_34:
    if ((has & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_134;
  }
LABEL_133:
  *((void *)result + 26) = self->_highRxReplaysTrue;
  *((void *)result + 100) |= 0x2000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000) == 0)
  {
LABEL_35:
    if ((has & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_135;
  }
LABEL_134:
  *((void *)result + 25) = self->_highRxReplaysFalse;
  *((void *)result + 100) |= 0x1000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000) == 0)
  {
LABEL_36:
    if ((has & 0x4000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_136;
  }
LABEL_135:
  *((void *)result + 16) = self->_highRxDecryptErrsTrue;
  *((void *)result + 100) |= 0x8000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000) == 0)
  {
LABEL_37:
    if ((has & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_137;
  }
LABEL_136:
  *((void *)result + 15) = self->_highRxDecryptErrsFalse;
  *((void *)result + 100) |= 0x4000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000) == 0)
  {
LABEL_38:
    if ((has & 0x1000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_138;
  }
LABEL_137:
  *((void *)result + 14) = self->_highRxDataPERTrue;
  *((void *)result + 100) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000) == 0)
  {
LABEL_39:
    if ((has & 0x20000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_139;
  }
LABEL_138:
  *((void *)result + 13) = self->_highRxDataPERFalse;
  *((void *)result + 100) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000) == 0)
  {
LABEL_40:
    if ((has & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_140;
  }
LABEL_139:
  *((void *)result + 42) = self->_lowAvailWLANDurTrue;
  *((void *)result + 100) |= 0x20000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000) == 0)
  {
LABEL_41:
    if ((has & 0x200000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_141;
  }
LABEL_140:
  *((void *)result + 41) = self->_lowAvailWLANDurFalse;
  *((void *)result + 100) |= 0x10000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000) == 0)
  {
LABEL_42:
    if ((has & 0x100000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_142;
  }
LABEL_141:
  *((void *)result + 46) = self->_lowAvailWLANTxDurTrue;
  *((void *)result + 100) |= 0x200000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000) == 0)
  {
LABEL_43:
    if ((has & 0x80000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_143;
  }
LABEL_142:
  *((void *)result + 45) = self->_lowAvailWLANTxDurFalse;
  *((void *)result + 100) |= 0x100000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000) == 0)
  {
LABEL_44:
    if ((has & 0x40000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_144;
  }
LABEL_143:
  *((void *)result + 44) = self->_lowAvailWLANRxDurTrue;
  *((void *)result + 100) |= 0x80000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000) == 0)
  {
LABEL_45:
    if ((has & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_145;
  }
LABEL_144:
  *((void *)result + 43) = self->_lowAvailWLANRxDurFalse;
  *((void *)result + 100) |= 0x40000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100) == 0)
  {
LABEL_46:
    if ((has & 0x400000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_146;
  }
LABEL_145:
  *((void *)result + 9) = self->_cCA;
  *((void *)result + 100) |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v5 & 0x20000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_147;
  }
LABEL_146:
  *((void *)result + 59) = self->_rSSI;
  *((void *)result + 100) |= 0x400000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v5 & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_148;
  }
LABEL_147:
  *((void *)result + 94) = self->_txPhyRate;
  *((void *)result + 101) |= 0x20000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40) == 0)
  {
LABEL_49:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_149;
  }
LABEL_148:
  *((void *)result + 71) = self->_rxPhyRate;
  *((void *)result + 101) |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10000) == 0)
  {
LABEL_50:
    if ((has & 0x8000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_150;
  }
LABEL_149:
  *((void *)result + 81) = self->_txAMPDUDensity;
  *((void *)result + 101) |= 0x10000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((has & 0x200) == 0) {
      goto LABEL_52;
    }
    goto LABEL_151;
  }
LABEL_150:
  *((void *)result + 52) = self->_measurementDurMS;
  *((void *)result + 100) |= 0x8000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200) == 0)
  {
LABEL_52:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_152;
  }
LABEL_151:
  *((void *)result + 10) = self->_concurrentIntDurMS;
  *((void *)result + 100) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x1000) == 0)
  {
LABEL_53:
    if ((has & 0x80000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_153;
  }
LABEL_152:
  *((void *)result + 77) = self->_tVPMActiveDurationMS;
  *((void *)result + 101) |= 0x1000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((has & 0x40000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_154;
  }
LABEL_153:
  *((void *)result + 56) = self->_phyTxActivityDurMS;
  *((void *)result + 100) |= 0x80000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_155;
  }
LABEL_154:
  *((void *)result + 55) = self->_phyRxActivityDurMS;
  *((void *)result + 100) |= 0x40000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v5 & 0x20000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_156;
  }
LABEL_155:
  *((void *)result + 98) = self->_txSubBytes;
  *((void *)result + 101) |= 0x200000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20000) == 0)
  {
LABEL_57:
    if ((v5 & 0x80000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_157;
  }
LABEL_156:
  *((void *)result + 82) = self->_txCompBytes;
  *((void *)result + 101) |= 0x20000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80000) == 0)
  {
LABEL_58:
    if ((has & 0x10000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_158;
  }
LABEL_157:
  *((void *)result + 84) = self->_txDelayBytes;
  *((void *)result + 101) |= 0x80000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_159;
  }
LABEL_158:
  *((void *)result + 53) = self->_offChanDurMS;
  *((void *)result + 100) |= 0x10000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v5 & 0x40000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_160;
  }
LABEL_159:
  *((void *)result + 99) = self->_txSubPkts;
  *((void *)result + 101) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x40000) == 0)
  {
LABEL_61:
    if ((has & 0x4000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_161;
  }
LABEL_160:
  *((void *)result + 83) = self->_txCompPkts;
  *((void *)result + 101) |= 0x40000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((has & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_162;
  }
LABEL_161:
  *((void *)result + 51) = self->_maxQueueFullDurMS;
  *((void *)result + 100) |= 0x4000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20) == 0)
  {
LABEL_63:
    if ((has & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_163;
  }
LABEL_162:
  *((void *)result + 6) = self->_avgTxLatencyMS;
  *((void *)result + 100) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x40) == 0)
  {
LABEL_64:
    if ((has & 0x20000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_164;
  }
LABEL_163:
  *((void *)result + 7) = self->_bTAntennaDurMS;
  *((void *)result + 100) |= 0x40uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((has & 0x800000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_165;
  }
LABEL_164:
  *((void *)result + 54) = self->_outputThroughput;
  *((void *)result + 100) |= 0x20000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000000) == 0)
  {
LABEL_66:
    if ((has & 0x800) == 0) {
      goto LABEL_67;
    }
    goto LABEL_166;
  }
LABEL_165:
  *((void *)result + 36) = self->_inputThroughput;
  *((void *)result + 100) |= 0x800000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800) == 0)
  {
LABEL_67:
    if ((has & 0x400) == 0) {
      goto LABEL_68;
    }
    goto LABEL_167;
  }
LABEL_166:
  *((void *)result + 12) = self->_expectedThroughput;
  *((void *)result + 100) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400) == 0)
  {
LABEL_68:
    if ((has & 4) == 0) {
      goto LABEL_69;
    }
    goto LABEL_168;
  }
LABEL_167:
  *((void *)result + 11) = self->_delayedThroughput;
  *((void *)result + 100) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 4) == 0)
  {
LABEL_69:
    if ((has & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_169;
  }
LABEL_168:
  *((void *)result + 3) = self->_availWLANDurMS;
  *((void *)result + 100) |= 4uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x10) == 0)
  {
LABEL_70:
    if ((has & 8) == 0) {
      goto LABEL_71;
    }
    goto LABEL_170;
  }
LABEL_169:
  *((void *)result + 5) = self->_availWLANTxDurMS;
  *((void *)result + 100) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 8) == 0)
  {
LABEL_71:
    if ((v5 & 0x100000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_171;
  }
LABEL_170:
  *((void *)result + 4) = self->_availWLANRxDurMS;
  *((void *)result + 100) |= 8uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v5 & 0x200000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_172;
  }
LABEL_171:
  *((void *)result + 97) = self->_txRetries;
  *((void *)result + 101) |= 0x100000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200000) == 0)
  {
LABEL_73:
    if ((v5 & 0x400000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_173;
  }
LABEL_172:
  *((void *)result + 86) = self->_txFails;
  *((void *)result + 101) |= 0x200000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400000) == 0)
  {
LABEL_74:
    if ((v5 & 0x10) == 0) {
      goto LABEL_75;
    }
    goto LABEL_174;
  }
LABEL_173:
  *((void *)result + 87) = self->_txFrames;
  *((void *)result + 101) |= 0x400000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x10) == 0)
  {
LABEL_75:
    if ((has & 0x8000000000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_175;
  }
LABEL_174:
  *((void *)result + 69) = self->_rxOvflErrs;
  *((void *)result + 101) |= 0x10uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v5 & 0x20) == 0) {
      goto LABEL_77;
    }
    goto LABEL_176;
  }
LABEL_175:
  *((void *)result + 64) = self->_rxFCSErrs;
  *((void *)result + 100) |= 0x8000000000000000;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x20) == 0)
  {
LABEL_77:
    if ((has & 0x1000000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_177;
  }
LABEL_176:
  *((void *)result + 70) = self->_rxPLCPErrs;
  *((void *)result + 101) |= 0x20uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((has & 0x4000000000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_178;
  }
LABEL_177:
  *((void *)result + 61) = self->_rxCRSErrs;
  *((void *)result + 100) |= 0x1000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v5 & 0x80) == 0) {
      goto LABEL_80;
    }
    goto LABEL_179;
  }
LABEL_178:
  *((void *)result + 63) = self->_rxDupErrs;
  *((void *)result + 100) |= 0x4000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x80) == 0)
  {
LABEL_80:
    if ((has & 0x2000000000000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_180;
  }
LABEL_179:
  *((void *)result + 72) = self->_rxReplayErrs;
  *((void *)result + 101) |= 0x80uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v5 & 0x100) == 0) {
      goto LABEL_82;
    }
    goto LABEL_181;
  }
LABEL_180:
  *((void *)result + 62) = self->_rxDecryErrs;
  *((void *)result + 100) |= 0x2000000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100) == 0)
  {
LABEL_82:
    if ((v5 & 2) == 0) {
      goto LABEL_83;
    }
    goto LABEL_182;
  }
LABEL_181:
  *((void *)result + 73) = self->_rxRetries;
  *((void *)result + 101) |= 0x100uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 2) == 0)
  {
LABEL_83:
    if ((v5 & 1) == 0) {
      goto LABEL_84;
    }
    goto LABEL_183;
  }
LABEL_182:
  *((void *)result + 66) = self->_rxGoodPlcps;
  *((void *)result + 101) |= 2uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 1) == 0)
  {
LABEL_84:
    if ((v5 & 0x400) == 0) {
      goto LABEL_85;
    }
    goto LABEL_184;
  }
LABEL_183:
  *((void *)result + 65) = self->_rxFrames;
  *((void *)result + 101) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x400) == 0)
  {
LABEL_85:
    if ((v5 & 0x100000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_185;
  }
LABEL_184:
  *((void *)result + 75) = self->_sNR;
  *((void *)result + 101) |= 0x400uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x100000) == 0)
  {
LABEL_86:
    if ((has & 0x100000000000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_186;
  }
LABEL_185:
  *((void *)result + 85) = self->_txExpectedAMPDUDensity;
  *((void *)result + 101) |= 0x100000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((has & 0x200000000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_187;
  }
LABEL_186:
  *((void *)result + 57) = self->_rC1CoexDurationMS;
  *((void *)result + 100) |= 0x100000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((has & 0x4000000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_188;
  }
LABEL_187:
  *((void *)result + 58) = self->_rC2CoexDurationMS;
  *((void *)result + 100) |= 0x200000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v5 & 0x200) == 0) {
      goto LABEL_90;
    }
    goto LABEL_189;
  }
LABEL_188:
  *((void *)result + 39) = self->_lTECoexDurationMS;
  *((void *)result + 100) |= 0x4000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x200) == 0)
  {
LABEL_90:
    if ((has & 1) == 0) {
      goto LABEL_91;
    }
    goto LABEL_190;
  }
LABEL_189:
  *((void *)result + 74) = self->_rxThroughput;
  *((void *)result + 101) |= 0x200uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 1) == 0)
  {
LABEL_91:
    if ((has & 0x800000000000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_191;
  }
LABEL_190:
  *((void *)result + 1) = self->_aPTxDataStall;
  *((void *)result + 100) |= 1uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v5 & 0x800) == 0) {
      goto LABEL_93;
    }
    goto LABEL_192;
  }
LABEL_191:
  *((void *)result + 60) = self->_rxAmpduTxBaMismatch;
  *((void *)result + 100) |= 0x800000000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x800) == 0)
  {
LABEL_93:
    if ((has & 0x1000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_193;
  }
LABEL_192:
  *((void *)result + 76) = self->_symptomsFails;
  *((void *)result + 101) |= 0x800uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x1000000000) == 0)
  {
LABEL_94:
    if ((has & 0x2000000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_194;
  }
LABEL_193:
  *((void *)result + 37) = self->_is2GBand;
  *((void *)result + 100) |= 0x1000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x2000000000) == 0)
  {
LABEL_95:
    if ((has & 0x80) == 0) {
      goto LABEL_96;
    }
    goto LABEL_195;
  }
LABEL_194:
  *((void *)result + 38) = self->_isFGTraffic;
  *((void *)result + 100) |= 0x2000000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x80) == 0)
  {
LABEL_96:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_196;
  }
LABEL_195:
  *((void *)result + 8) = self->_baselineThroughput;
  *((void *)result + 100) |= 0x80uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((v5 & 0x2000) == 0)
  {
LABEL_97:
    if ((has & 0x400000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_197;
  }
LABEL_196:
  *((void *)result + 78) = self->_testThroughput;
  *((void *)result + 101) |= 0x2000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x400000000) == 0)
  {
LABEL_98:
    if ((has & 0x8000000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_198;
  }
LABEL_197:
  *((void *)result + 35) = self->_infraDutyCycle;
  *((void *)result + 100) |= 0x400000000uLL;
  uint64_t has = (uint64_t)self->_has;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((has & 0x8000000000) == 0)
  {
LABEL_99:
    if ((has & 2) == 0) {
      goto LABEL_100;
    }
    goto LABEL_199;
  }
LABEL_198:
  *((void *)result + 40) = self->_lastScanReason;
  *((void *)result + 100) |= 0x8000000000uLL;
  uint64_t v5 = *((void *)&self->_has + 1);
  if ((*(void *)&self->_has & 2) == 0)
  {
LABEL_100:
    if ((v5 & 0x4000) == 0) {
      return result;
    }
    goto LABEL_101;
  }
LABEL_199:
  *((void *)result + 2) = self->_accessPointOUI;
  *((void *)result + 100) |= 2uLL;
  if ((*((void *)&self->_has + 1) & 0x4000) == 0) {
    return result;
  }
LABEL_101:
  *((void *)result + 79) = self->_timeSinceLastRecovery;
  *((void *)result + 101) |= 0x4000uLL;
  return result;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  uint64_t has = (uint64_t)self->_has;
  uint64_t v6 = *((void *)&self->_has + 1);
  uint64_t v9 = *((void *)a3 + 100);
  uint64_t v8 = *((void *)a3 + 101);
  if ((v6 & 0x8000) != 0)
  {
    if ((v8 & 0x8000) == 0 || self->_timestamp != *((void *)a3 + 80)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x8000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x4000000) != 0)
  {
    if ((v8 & 0x4000000) == 0 || self->_txOutputBelowExpectedTrue != *((void *)a3 + 91)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x4000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x2000000) != 0)
  {
    if ((v8 & 0x2000000) == 0 || self->_txOutputBelowExpectedFalse != *((void *)a3 + 90)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x2000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x10000000) != 0)
  {
    if ((v8 & 0x10000000) == 0 || self->_txOutputBelowInputTrue != *((void *)a3 + 93)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x10000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x8000000) != 0)
  {
    if ((v8 & 0x8000000) == 0 || self->_txOutputBelowInputFalse != *((void *)a3 + 92)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x8000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x1000000) != 0)
  {
    if ((v8 & 0x1000000) == 0 || self->_txLowFrameCountTrue != *((void *)a3 + 89)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x1000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x800000) != 0)
  {
    if ((v8 & 0x800000) == 0 || self->_txLowFrameCountFalse != *((void *)a3 + 88)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x800000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 8) != 0)
  {
    if ((v8 & 8) == 0 || self->_rxLowFrameCountTrue != *((void *)a3 + 68)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 8) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 4) != 0)
  {
    if ((v8 & 4) == 0 || self->_rxLowFrameCountFalse != *((void *)a3 + 67)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 4) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x20000000) != 0)
  {
    if ((v9 & 0x20000000) == 0 || self->_highTxLatencyTrue != *((void *)a3 + 30)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x20000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x10000000) != 0)
  {
    if ((v9 & 0x10000000) == 0 || self->_highTxLatencyFalse != *((void *)a3 + 29)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x10000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x2000000000000) != 0)
  {
    if ((v9 & 0x2000000000000) == 0 || self->_lowTxPhyRateTrue != *((void *)a3 + 50)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x2000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x1000000000000) != 0)
  {
    if ((v9 & 0x1000000000000) == 0 || self->_lowTxPhyRateFalse != *((void *)a3 + 49)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x1000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x80000000) != 0)
  {
    if ((v9 & 0x80000000) == 0 || self->_highTxPerTrue != *((void *)a3 + 32)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x80000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x40000000) != 0)
  {
    if ((v9 & 0x40000000) == 0 || self->_highTxPerFalse != *((void *)a3 + 31)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x40000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x200000000) != 0)
  {
    if ((v9 & 0x200000000) == 0 || self->_highTxRetriesTrue != *((void *)a3 + 34)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x200000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x100000000) != 0)
  {
    if ((v9 & 0x100000000) == 0 || self->_highTxRetriesFalse != *((void *)a3 + 33)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x100000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x80000000) != 0)
  {
    if ((v8 & 0x80000000) == 0 || self->_txQueueFullTrue != *((void *)a3 + 96)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x80000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x40000000) != 0)
  {
    if ((v8 & 0x40000000) == 0 || self->_txQueueFullFalse != *((void *)a3 + 95)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x40000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x800000000000) != 0)
  {
    if ((v9 & 0x800000000000) == 0 || self->_lowTxAMPDUDensityTrue != *((void *)a3 + 48)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x800000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x400000000000) != 0)
  {
    if ((v9 & 0x400000000000) == 0 || self->_lowTxAMPDUDensityFalse != *((void *)a3 + 47)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x400000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x8000000) != 0)
  {
    if ((v9 & 0x8000000) == 0 || self->_highRxRetriesTrue != *((void *)a3 + 28)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x8000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x4000000) != 0)
  {
    if ((v9 & 0x4000000) == 0 || self->_highRxRetriesFalse != *((void *)a3 + 27)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x4000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x800000) != 0)
  {
    if ((v9 & 0x800000) == 0 || self->_highRxPhyPERTrue != *((void *)a3 + 24)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x800000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x400000) != 0)
  {
    if ((v9 & 0x400000) == 0 || self->_highRxPhyPERFalse != *((void *)a3 + 23)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x400000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x80000) != 0)
  {
    if ((v9 & 0x80000) == 0 || self->_highRxFCSErrsTrue != *((void *)a3 + 20)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x80000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0 || self->_highRxFCSErrsFalse != *((void *)a3 + 19)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x200000) != 0)
  {
    if ((v9 & 0x200000) == 0 || self->_highRxOverflowsTrue != *((void *)a3 + 22)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x200000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) == 0 || self->_highRxOverflowsFalse != *((void *)a3 + 21)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x100000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x20000) != 0)
  {
    if ((v9 & 0x20000) == 0 || self->_highRxDupsTrue != *((void *)a3 + 18)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x20000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_highRxDupsFalse != *((void *)a3 + 17)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x2000000) != 0)
  {
    if ((v9 & 0x2000000) == 0 || self->_highRxReplaysTrue != *((void *)a3 + 26)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x2000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x1000000) != 0)
  {
    if ((v9 & 0x1000000) == 0 || self->_highRxReplaysFalse != *((void *)a3 + 25)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x1000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_highRxDecryptErrsTrue != *((void *)a3 + 16)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_highRxDecryptErrsFalse != *((void *)a3 + 15)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_highRxDataPERTrue != *((void *)a3 + 14)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_highRxDataPERFalse != *((void *)a3 + 13)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x20000000000) != 0)
  {
    if ((v9 & 0x20000000000) == 0 || self->_lowAvailWLANDurTrue != *((void *)a3 + 42)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x20000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x10000000000) != 0)
  {
    if ((v9 & 0x10000000000) == 0 || self->_lowAvailWLANDurFalse != *((void *)a3 + 41)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x10000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x200000000000) != 0)
  {
    if ((v9 & 0x200000000000) == 0 || self->_lowAvailWLANTxDurTrue != *((void *)a3 + 46)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x200000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x100000000000) != 0)
  {
    if ((v9 & 0x100000000000) == 0 || self->_lowAvailWLANTxDurFalse != *((void *)a3 + 45)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x100000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x80000000000) != 0)
  {
    if ((v9 & 0x80000000000) == 0 || self->_lowAvailWLANRxDurTrue != *((void *)a3 + 44)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x80000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x40000000000) != 0)
  {
    if ((v9 & 0x40000000000) == 0 || self->_lowAvailWLANRxDurFalse != *((void *)a3 + 43)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x40000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_cCA != *((void *)a3 + 9)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x400000000000000) != 0)
  {
    if ((v9 & 0x400000000000000) == 0 || self->_rSSI != *((void *)a3 + 59)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x400000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x20000000) != 0)
  {
    if ((v8 & 0x20000000) == 0 || self->_txPhyRate != *((void *)a3 + 94)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x20000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x40) != 0)
  {
    if ((v8 & 0x40) == 0 || self->_rxPhyRate != *((void *)a3 + 71)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x40) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x10000) != 0)
  {
    if ((v8 & 0x10000) == 0 || self->_txAMPDUDensity != *((void *)a3 + 81)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x10000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x8000000000000) != 0)
  {
    if ((v9 & 0x8000000000000) == 0 || self->_measurementDurMS != *((void *)a3 + 52)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x8000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_concurrentIntDurMS != *((void *)a3 + 10)) {
      goto LABEL_496;
    }
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x1000) != 0)
  {
    if ((v8 & 0x1000) == 0 || self->_tVPMActiveDurationMS != *((void *)a3 + 77)) {
      goto LABEL_496;
    }
  }
  else if ((v8 & 0x1000) != 0)
  {
    goto LABEL_496;
  }
  uint64_t v11 = *((void *)a3 + 100);
  uint64_t v10 = *((void *)a3 + 101);
  if ((has & 0x80000000000000) != 0)
  {
    if ((v11 & 0x80000000000000) == 0 || self->_phyTxActivityDurMS != *((void *)a3 + 56)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x80000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x40000000000000) != 0)
  {
    if ((v11 & 0x40000000000000) == 0 || self->_phyRxActivityDurMS != *((void *)a3 + 55)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x40000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x200000000) != 0)
  {
    if ((v10 & 0x200000000) == 0 || self->_txSubBytes != *((void *)a3 + 98)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x200000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x20000) != 0)
  {
    if ((v10 & 0x20000) == 0 || self->_txCompBytes != *((void *)a3 + 82)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x20000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x80000) != 0)
  {
    if ((v10 & 0x80000) == 0 || self->_txDelayBytes != *((void *)a3 + 84)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x80000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x10000000000000) != 0)
  {
    if ((v11 & 0x10000000000000) == 0 || self->_offChanDurMS != *((void *)a3 + 53)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x10000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x400000000) != 0)
  {
    if ((v10 & 0x400000000) == 0 || self->_txSubPkts != *((void *)a3 + 99)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x400000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x40000) != 0)
  {
    if ((v10 & 0x40000) == 0 || self->_txCompPkts != *((void *)a3 + 83)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x40000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x4000000000000) != 0)
  {
    if ((v11 & 0x4000000000000) == 0 || self->_maxQueueFullDurMS != *((void *)a3 + 51)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x4000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x20) != 0)
  {
    if ((v11 & 0x20) == 0 || self->_avgTxLatencyMS != *((void *)a3 + 6)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x20) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x40) != 0)
  {
    if ((v11 & 0x40) == 0 || self->_bTAntennaDurMS != *((void *)a3 + 7)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x40) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x20000000000000) != 0)
  {
    if ((v11 & 0x20000000000000) == 0 || self->_outputThroughput != *((void *)a3 + 54)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x20000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x800000000) != 0)
  {
    if ((v11 & 0x800000000) == 0 || self->_inputThroughput != *((void *)a3 + 36)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x800000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x800) != 0)
  {
    if ((v11 & 0x800) == 0 || self->_expectedThroughput != *((void *)a3 + 12)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x800) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x400) != 0)
  {
    if ((v11 & 0x400) == 0 || self->_delayedThroughput != *((void *)a3 + 11)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x400) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 4) != 0)
  {
    if ((v11 & 4) == 0 || self->_availWLANDurMS != *((void *)a3 + 3)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 4) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x10) != 0)
  {
    if ((v11 & 0x10) == 0 || self->_availWLANTxDurMS != *((void *)a3 + 5)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x10) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 8) != 0)
  {
    if ((v11 & 8) == 0 || self->_availWLANRxDurMS != *((void *)a3 + 4)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 8) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x100000000) != 0)
  {
    if ((v10 & 0x100000000) == 0 || self->_txRetries != *((void *)a3 + 97)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x100000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x200000) != 0)
  {
    if ((v10 & 0x200000) == 0 || self->_txFails != *((void *)a3 + 86)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x200000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x400000) != 0)
  {
    if ((v10 & 0x400000) == 0 || self->_txFrames != *((void *)a3 + 87)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x400000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x10) != 0)
  {
    if ((v10 & 0x10) == 0 || self->_rxOvflErrs != *((void *)a3 + 69)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x10) != 0)
  {
    goto LABEL_496;
  }
  if (has < 0)
  {
    if ((v11 & 0x8000000000000000) == 0 || self->_rxFCSErrs != *((void *)a3 + 64)) {
      goto LABEL_496;
    }
  }
  else if (v11 < 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x20) != 0)
  {
    if ((v10 & 0x20) == 0 || self->_rxPLCPErrs != *((void *)a3 + 70)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x20) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x1000000000000000) != 0)
  {
    if ((v11 & 0x1000000000000000) == 0 || self->_rxCRSErrs != *((void *)a3 + 61)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x1000000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x4000000000000000) != 0)
  {
    if ((v11 & 0x4000000000000000) == 0 || self->_rxDupErrs != *((void *)a3 + 63)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x4000000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x80) != 0)
  {
    if ((v10 & 0x80) == 0 || self->_rxReplayErrs != *((void *)a3 + 72)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x80) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x2000000000000000) != 0)
  {
    if ((v11 & 0x2000000000000000) == 0 || self->_rxDecryErrs != *((void *)a3 + 62)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x2000000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x100) != 0)
  {
    if ((v10 & 0x100) == 0 || self->_rxRetries != *((void *)a3 + 73)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x100) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 2) != 0)
  {
    if ((v10 & 2) == 0 || self->_rxGoodPlcps != *((void *)a3 + 66)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 2) != 0)
  {
    goto LABEL_496;
  }
  if (v6)
  {
    if ((v10 & 1) == 0 || self->_rxFrames != *((void *)a3 + 65)) {
      goto LABEL_496;
    }
  }
  else if (v10)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x400) != 0)
  {
    if ((v10 & 0x400) == 0 || self->_sNR != *((void *)a3 + 75)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x400) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x100000) != 0)
  {
    if ((v10 & 0x100000) == 0 || self->_txExpectedAMPDUDensity != *((void *)a3 + 85)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x100000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x100000000000000) != 0)
  {
    if ((v11 & 0x100000000000000) == 0 || self->_rC1CoexDurationMS != *((void *)a3 + 57)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x100000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x200000000000000) != 0)
  {
    if ((v11 & 0x200000000000000) == 0 || self->_rC2CoexDurationMS != *((void *)a3 + 58)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x200000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x4000000000) != 0)
  {
    if ((v11 & 0x4000000000) == 0 || self->_lTECoexDurationMS != *((void *)a3 + 39)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x4000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x200) != 0)
  {
    if ((v10 & 0x200) == 0 || self->_rxThroughput != *((void *)a3 + 74)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x200) != 0)
  {
    goto LABEL_496;
  }
  if (has)
  {
    if ((v11 & 1) == 0 || self->_aPTxDataStall != *((void *)a3 + 1)) {
      goto LABEL_496;
    }
  }
  else if (v11)
  {
    goto LABEL_496;
  }
  if ((has & 0x800000000000000) != 0)
  {
    if ((v11 & 0x800000000000000) == 0 || self->_rxAmpduTxBaMismatch != *((void *)a3 + 60)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x800000000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x800) != 0)
  {
    if ((v10 & 0x800) == 0 || self->_symptomsFails != *((void *)a3 + 76)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x800) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x1000000000) != 0)
  {
    if ((v11 & 0x1000000000) == 0 || self->_is2GBand != *((void *)a3 + 37)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x1000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x2000000000) != 0)
  {
    if ((v11 & 0x2000000000) == 0 || self->_isFGTraffic != *((void *)a3 + 38)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x2000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x80) != 0)
  {
    if ((v11 & 0x80) == 0 || self->_baselineThroughput != *((void *)a3 + 8)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x80) != 0)
  {
    goto LABEL_496;
  }
  if ((v6 & 0x2000) != 0)
  {
    if ((v10 & 0x2000) == 0 || self->_testThroughput != *((void *)a3 + 78)) {
      goto LABEL_496;
    }
  }
  else if ((v10 & 0x2000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x400000000) != 0)
  {
    if ((v11 & 0x400000000) == 0 || self->_infraDutyCycle != *((void *)a3 + 35)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x400000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 0x8000000000) != 0)
  {
    if ((v11 & 0x8000000000) == 0 || self->_lastScanReason != *((void *)a3 + 40)) {
      goto LABEL_496;
    }
  }
  else if ((v11 & 0x8000000000) != 0)
  {
    goto LABEL_496;
  }
  if ((has & 2) == 0)
  {
    if ((v11 & 2) == 0) {
      goto LABEL_492;
    }
LABEL_496:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v11 & 2) == 0 || self->_accessPointOUI != *((void *)a3 + 2)) {
    goto LABEL_496;
  }
LABEL_492:
  LOBYTE(v5) = (*((void *)a3 + 101) & 0x4000) == 0;
  if ((v6 & 0x4000) != 0)
  {
    if ((v10 & 0x4000) == 0 || self->_timeSinceLastRecovery != *((void *)a3 + 79)) {
      goto LABEL_496;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = *((void *)&self->_has + 1);
  if ((v2 & 0x8000) != 0)
  {
    unint64_t v103 = 2654435761u * self->_timestamp;
    if ((v2 & 0x4000000) != 0)
    {
LABEL_3:
      unint64_t v102 = 2654435761u * self->_txOutputBelowExpectedTrue;
      if ((v2 & 0x2000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v103 = 0;
    if ((v2 & 0x4000000) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v102 = 0;
  if ((v2 & 0x2000000) != 0)
  {
LABEL_4:
    unint64_t v101 = 2654435761u * self->_txOutputBelowExpectedFalse;
    if ((v2 & 0x10000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  unint64_t v101 = 0;
  if ((v2 & 0x10000000) != 0)
  {
LABEL_5:
    unint64_t v100 = 2654435761u * self->_txOutputBelowInputTrue;
    if ((v2 & 0x8000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v100 = 0;
  if ((v2 & 0x8000000) != 0)
  {
LABEL_6:
    unint64_t v99 = 2654435761u * self->_txOutputBelowInputFalse;
    if ((v2 & 0x1000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  unint64_t v99 = 0;
  if ((v2 & 0x1000000) != 0)
  {
LABEL_7:
    unint64_t v98 = 2654435761u * self->_txLowFrameCountTrue;
    if ((v2 & 0x800000) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    unint64_t v97 = 0;
    if ((v2 & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  unint64_t v98 = 0;
  if ((v2 & 0x800000) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  unint64_t v97 = 2654435761u * self->_txLowFrameCountFalse;
  if ((v2 & 8) != 0)
  {
LABEL_9:
    unint64_t v96 = 2654435761u * self->_rxLowFrameCountTrue;
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v96 = 0;
LABEL_18:
  uint64_t has = (uint64_t)self->_has;
  if ((v2 & 4) != 0)
  {
    unint64_t v95 = 2654435761u * self->_rxLowFrameCountFalse;
    if ((has & 0x20000000) != 0)
    {
LABEL_20:
      unint64_t v94 = 2654435761u * self->_highTxLatencyTrue;
      if ((has & 0x10000000) != 0) {
        goto LABEL_21;
      }
      goto LABEL_112;
    }
  }
  else
  {
    unint64_t v95 = 0;
    if ((has & 0x20000000) != 0) {
      goto LABEL_20;
    }
  }
  unint64_t v94 = 0;
  if ((has & 0x10000000) != 0)
  {
LABEL_21:
    unint64_t v93 = 2654435761u * self->_highTxLatencyFalse;
    if ((has & 0x2000000000000) != 0) {
      goto LABEL_22;
    }
    goto LABEL_113;
  }
LABEL_112:
  unint64_t v93 = 0;
  if ((has & 0x2000000000000) != 0)
  {
LABEL_22:
    unint64_t v92 = 2654435761u * self->_lowTxPhyRateTrue;
    if ((has & 0x1000000000000) != 0) {
      goto LABEL_23;
    }
    goto LABEL_114;
  }
LABEL_113:
  unint64_t v92 = 0;
  if ((has & 0x1000000000000) != 0)
  {
LABEL_23:
    unint64_t v91 = 2654435761u * self->_lowTxPhyRateFalse;
    if ((has & 0x80000000) != 0) {
      goto LABEL_24;
    }
    goto LABEL_115;
  }
LABEL_114:
  unint64_t v91 = 0;
  if ((has & 0x80000000) != 0)
  {
LABEL_24:
    unint64_t v90 = 2654435761u * self->_highTxPerTrue;
    if ((has & 0x40000000) != 0) {
      goto LABEL_25;
    }
    goto LABEL_116;
  }
LABEL_115:
  unint64_t v90 = 0;
  if ((has & 0x40000000) != 0)
  {
LABEL_25:
    unint64_t v89 = 2654435761u * self->_highTxPerFalse;
    if ((has & 0x200000000) != 0) {
      goto LABEL_26;
    }
    goto LABEL_117;
  }
LABEL_116:
  unint64_t v89 = 0;
  if ((has & 0x200000000) != 0)
  {
LABEL_26:
    unint64_t v88 = 2654435761u * self->_highTxRetriesTrue;
    if ((has & 0x100000000) != 0) {
      goto LABEL_27;
    }
    goto LABEL_118;
  }
LABEL_117:
  unint64_t v88 = 0;
  if ((has & 0x100000000) != 0)
  {
LABEL_27:
    unint64_t v87 = 2654435761u * self->_highTxRetriesFalse;
    if ((v2 & 0x80000000) != 0) {
      goto LABEL_28;
    }
    goto LABEL_119;
  }
LABEL_118:
  unint64_t v87 = 0;
  if ((v2 & 0x80000000) != 0)
  {
LABEL_28:
    unint64_t v86 = 2654435761u * self->_txQueueFullTrue;
    if ((v2 & 0x40000000) != 0) {
      goto LABEL_29;
    }
    goto LABEL_120;
  }
LABEL_119:
  unint64_t v86 = 0;
  if ((v2 & 0x40000000) != 0)
  {
LABEL_29:
    unint64_t v85 = 2654435761u * self->_txQueueFullFalse;
    if ((has & 0x800000000000) != 0) {
      goto LABEL_30;
    }
    goto LABEL_121;
  }
LABEL_120:
  unint64_t v85 = 0;
  if ((has & 0x800000000000) != 0)
  {
LABEL_30:
    unint64_t v84 = 2654435761u * self->_lowTxAMPDUDensityTrue;
    if ((has & 0x400000000000) != 0) {
      goto LABEL_31;
    }
    goto LABEL_122;
  }
LABEL_121:
  unint64_t v84 = 0;
  if ((has & 0x400000000000) != 0)
  {
LABEL_31:
    unint64_t v83 = 2654435761u * self->_lowTxAMPDUDensityFalse;
    if ((has & 0x8000000) != 0) {
      goto LABEL_32;
    }
    goto LABEL_123;
  }
LABEL_122:
  unint64_t v83 = 0;
  if ((has & 0x8000000) != 0)
  {
LABEL_32:
    unint64_t v82 = 2654435761u * self->_highRxRetriesTrue;
    if ((has & 0x4000000) != 0) {
      goto LABEL_33;
    }
    goto LABEL_124;
  }
LABEL_123:
  unint64_t v82 = 0;
  if ((has & 0x4000000) != 0)
  {
LABEL_33:
    unint64_t v81 = 2654435761u * self->_highRxRetriesFalse;
    if ((has & 0x800000) != 0) {
      goto LABEL_34;
    }
    goto LABEL_125;
  }
LABEL_124:
  unint64_t v81 = 0;
  if ((has & 0x800000) != 0)
  {
LABEL_34:
    unint64_t v80 = 2654435761u * self->_highRxPhyPERTrue;
    if ((has & 0x400000) != 0) {
      goto LABEL_35;
    }
    goto LABEL_126;
  }
LABEL_125:
  unint64_t v80 = 0;
  if ((has & 0x400000) != 0)
  {
LABEL_35:
    unint64_t v79 = 2654435761u * self->_highRxPhyPERFalse;
    if ((has & 0x80000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_127;
  }
LABEL_126:
  unint64_t v79 = 0;
  if ((has & 0x80000) != 0)
  {
LABEL_36:
    unint64_t v78 = 2654435761u * self->_highRxFCSErrsTrue;
    if ((has & 0x40000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_128;
  }
LABEL_127:
  unint64_t v78 = 0;
  if ((has & 0x40000) != 0)
  {
LABEL_37:
    unint64_t v77 = 2654435761u * self->_highRxFCSErrsFalse;
    if ((has & 0x200000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_129;
  }
LABEL_128:
  unint64_t v77 = 0;
  if ((has & 0x200000) != 0)
  {
LABEL_38:
    unint64_t v76 = 2654435761u * self->_highRxOverflowsTrue;
    if ((has & 0x100000) != 0) {
      goto LABEL_39;
    }
    goto LABEL_130;
  }
LABEL_129:
  unint64_t v76 = 0;
  if ((has & 0x100000) != 0)
  {
LABEL_39:
    unint64_t v75 = 2654435761u * self->_highRxOverflowsFalse;
    if ((has & 0x20000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_131;
  }
LABEL_130:
  unint64_t v75 = 0;
  if ((has & 0x20000) != 0)
  {
LABEL_40:
    unint64_t v74 = 2654435761u * self->_highRxDupsTrue;
    if ((has & 0x10000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_132;
  }
LABEL_131:
  unint64_t v74 = 0;
  if ((has & 0x10000) != 0)
  {
LABEL_41:
    unint64_t v73 = 2654435761u * self->_highRxDupsFalse;
    if ((has & 0x2000000) != 0) {
      goto LABEL_42;
    }
    goto LABEL_133;
  }
LABEL_132:
  unint64_t v73 = 0;
  if ((has & 0x2000000) != 0)
  {
LABEL_42:
    unint64_t v72 = 2654435761u * self->_highRxReplaysTrue;
    if ((has & 0x1000000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_134;
  }
LABEL_133:
  unint64_t v72 = 0;
  if ((has & 0x1000000) != 0)
  {
LABEL_43:
    unint64_t v71 = 2654435761u * self->_highRxReplaysFalse;
    if ((has & 0x8000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_135;
  }
LABEL_134:
  unint64_t v71 = 0;
  if ((has & 0x8000) != 0)
  {
LABEL_44:
    unint64_t v70 = 2654435761u * self->_highRxDecryptErrsTrue;
    if ((has & 0x4000) != 0) {
      goto LABEL_45;
    }
    goto LABEL_136;
  }
LABEL_135:
  unint64_t v70 = 0;
  if ((has & 0x4000) != 0)
  {
LABEL_45:
    unint64_t v69 = 2654435761u * self->_highRxDecryptErrsFalse;
    if ((has & 0x2000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_137;
  }
LABEL_136:
  unint64_t v69 = 0;
  if ((has & 0x2000) != 0)
  {
LABEL_46:
    unint64_t v68 = 2654435761u * self->_highRxDataPERTrue;
    if ((has & 0x1000) != 0) {
      goto LABEL_47;
    }
    goto LABEL_138;
  }
LABEL_137:
  unint64_t v68 = 0;
  if ((has & 0x1000) != 0)
  {
LABEL_47:
    unint64_t v67 = 2654435761u * self->_highRxDataPERFalse;
    if ((has & 0x20000000000) != 0) {
      goto LABEL_48;
    }
    goto LABEL_139;
  }
LABEL_138:
  unint64_t v67 = 0;
  if ((has & 0x20000000000) != 0)
  {
LABEL_48:
    unint64_t v66 = 2654435761u * self->_lowAvailWLANDurTrue;
    if ((has & 0x10000000000) != 0) {
      goto LABEL_49;
    }
    goto LABEL_140;
  }
LABEL_139:
  unint64_t v66 = 0;
  if ((has & 0x10000000000) != 0)
  {
LABEL_49:
    unint64_t v65 = 2654435761u * self->_lowAvailWLANDurFalse;
    if ((has & 0x200000000000) != 0) {
      goto LABEL_50;
    }
    goto LABEL_141;
  }
LABEL_140:
  unint64_t v65 = 0;
  if ((has & 0x200000000000) != 0)
  {
LABEL_50:
    unint64_t v64 = 2654435761u * self->_lowAvailWLANTxDurTrue;
    if ((has & 0x100000000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_142;
  }
LABEL_141:
  unint64_t v64 = 0;
  if ((has & 0x100000000000) != 0)
  {
LABEL_51:
    unint64_t v63 = 2654435761u * self->_lowAvailWLANTxDurFalse;
    if ((has & 0x80000000000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_143;
  }
LABEL_142:
  unint64_t v63 = 0;
  if ((has & 0x80000000000) != 0)
  {
LABEL_52:
    unint64_t v62 = 2654435761u * self->_lowAvailWLANRxDurTrue;
    if ((has & 0x40000000000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_144;
  }
LABEL_143:
  unint64_t v62 = 0;
  if ((has & 0x40000000000) != 0)
  {
LABEL_53:
    unint64_t v61 = 2654435761u * self->_lowAvailWLANRxDurFalse;
    if ((has & 0x100) != 0) {
      goto LABEL_54;
    }
    goto LABEL_145;
  }
LABEL_144:
  unint64_t v61 = 0;
  if ((has & 0x100) != 0)
  {
LABEL_54:
    unint64_t v60 = 2654435761u * self->_cCA;
    if ((has & 0x400000000000000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_146;
  }
LABEL_145:
  unint64_t v60 = 0;
  if ((has & 0x400000000000000) != 0)
  {
LABEL_55:
    uint64_t v59 = 2654435761 * self->_rSSI;
    if ((v2 & 0x20000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_147;
  }
LABEL_146:
  uint64_t v59 = 0;
  if ((v2 & 0x20000000) != 0)
  {
LABEL_56:
    unint64_t v58 = 2654435761u * self->_txPhyRate;
    if ((v2 & 0x40) != 0) {
      goto LABEL_57;
    }
    goto LABEL_148;
  }
LABEL_147:
  unint64_t v58 = 0;
  if ((v2 & 0x40) != 0)
  {
LABEL_57:
    unint64_t v57 = 2654435761u * self->_rxPhyRate;
    if ((v2 & 0x10000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_149;
  }
LABEL_148:
  unint64_t v57 = 0;
  if ((v2 & 0x10000) != 0)
  {
LABEL_58:
    unint64_t v56 = 2654435761u * self->_txAMPDUDensity;
    if ((has & 0x8000000000000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_150;
  }
LABEL_149:
  unint64_t v56 = 0;
  if ((has & 0x8000000000000) != 0)
  {
LABEL_59:
    unint64_t v55 = 2654435761u * self->_measurementDurMS;
    if ((has & 0x200) != 0) {
      goto LABEL_60;
    }
    goto LABEL_151;
  }
LABEL_150:
  unint64_t v55 = 0;
  if ((has & 0x200) != 0)
  {
LABEL_60:
    unint64_t v54 = 2654435761u * self->_concurrentIntDurMS;
    if ((v2 & 0x1000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_152;
  }
LABEL_151:
  unint64_t v54 = 0;
  if ((v2 & 0x1000) != 0)
  {
LABEL_61:
    unint64_t v53 = 2654435761u * self->_tVPMActiveDurationMS;
    if ((has & 0x80000000000000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_153;
  }
LABEL_152:
  unint64_t v53 = 0;
  if ((has & 0x80000000000000) != 0)
  {
LABEL_62:
    unint64_t v52 = 2654435761u * self->_phyTxActivityDurMS;
    if ((has & 0x40000000000000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_154;
  }
LABEL_153:
  unint64_t v52 = 0;
  if ((has & 0x40000000000000) != 0)
  {
LABEL_63:
    unint64_t v51 = 2654435761u * self->_phyRxActivityDurMS;
    if ((v2 & 0x200000000) != 0) {
      goto LABEL_64;
    }
    goto LABEL_155;
  }
LABEL_154:
  unint64_t v51 = 0;
  if ((v2 & 0x200000000) != 0)
  {
LABEL_64:
    unint64_t v50 = 2654435761u * self->_txSubBytes;
    if ((v2 & 0x20000) != 0) {
      goto LABEL_65;
    }
    goto LABEL_156;
  }
LABEL_155:
  unint64_t v50 = 0;
  if ((v2 & 0x20000) != 0)
  {
LABEL_65:
    unint64_t v49 = 2654435761u * self->_txCompBytes;
    if ((v2 & 0x80000) != 0) {
      goto LABEL_66;
    }
    goto LABEL_157;
  }
LABEL_156:
  unint64_t v49 = 0;
  if ((v2 & 0x80000) != 0)
  {
LABEL_66:
    unint64_t v48 = 2654435761u * self->_txDelayBytes;
    if ((has & 0x10000000000000) != 0) {
      goto LABEL_67;
    }
    goto LABEL_158;
  }
LABEL_157:
  unint64_t v48 = 0;
  if ((has & 0x10000000000000) != 0)
  {
LABEL_67:
    unint64_t v47 = 2654435761u * self->_offChanDurMS;
    if ((v2 & 0x400000000) != 0) {
      goto LABEL_68;
    }
    goto LABEL_159;
  }
LABEL_158:
  unint64_t v47 = 0;
  if ((v2 & 0x400000000) != 0)
  {
LABEL_68:
    unint64_t v46 = 2654435761u * self->_txSubPkts;
    if ((v2 & 0x40000) != 0) {
      goto LABEL_69;
    }
    goto LABEL_160;
  }
LABEL_159:
  unint64_t v46 = 0;
  if ((v2 & 0x40000) != 0)
  {
LABEL_69:
    unint64_t v45 = 2654435761u * self->_txCompPkts;
    if ((has & 0x4000000000000) != 0) {
      goto LABEL_70;
    }
    goto LABEL_161;
  }
LABEL_160:
  unint64_t v45 = 0;
  if ((has & 0x4000000000000) != 0)
  {
LABEL_70:
    unint64_t v44 = 2654435761u * self->_maxQueueFullDurMS;
    if ((has & 0x20) != 0) {
      goto LABEL_71;
    }
    goto LABEL_162;
  }
LABEL_161:
  unint64_t v44 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_71:
    unint64_t v43 = 2654435761u * self->_avgTxLatencyMS;
    if ((has & 0x40) != 0) {
      goto LABEL_72;
    }
    goto LABEL_163;
  }
LABEL_162:
  unint64_t v43 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_72:
    unint64_t v42 = 2654435761u * self->_bTAntennaDurMS;
    if ((has & 0x20000000000000) != 0) {
      goto LABEL_73;
    }
    goto LABEL_164;
  }
LABEL_163:
  unint64_t v42 = 0;
  if ((has & 0x20000000000000) != 0)
  {
LABEL_73:
    unint64_t v41 = 2654435761u * self->_outputThroughput;
    if ((has & 0x800000000) != 0) {
      goto LABEL_74;
    }
    goto LABEL_165;
  }
LABEL_164:
  unint64_t v41 = 0;
  if ((has & 0x800000000) != 0)
  {
LABEL_74:
    unint64_t v40 = 2654435761u * self->_inputThroughput;
    if ((has & 0x800) != 0) {
      goto LABEL_75;
    }
    goto LABEL_166;
  }
LABEL_165:
  unint64_t v40 = 0;
  if ((has & 0x800) != 0)
  {
LABEL_75:
    unint64_t v39 = 2654435761u * self->_expectedThroughput;
    if ((has & 0x400) != 0) {
      goto LABEL_76;
    }
    goto LABEL_167;
  }
LABEL_166:
  unint64_t v39 = 0;
  if ((has & 0x400) != 0)
  {
LABEL_76:
    unint64_t v38 = 2654435761u * self->_delayedThroughput;
    if ((has & 4) != 0) {
      goto LABEL_77;
    }
    goto LABEL_168;
  }
LABEL_167:
  unint64_t v38 = 0;
  if ((has & 4) != 0)
  {
LABEL_77:
    unint64_t v37 = 2654435761u * self->_availWLANDurMS;
    if ((has & 0x10) != 0) {
      goto LABEL_78;
    }
    goto LABEL_169;
  }
LABEL_168:
  unint64_t v37 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_78:
    unint64_t v36 = 2654435761u * self->_availWLANTxDurMS;
    if ((has & 8) != 0) {
      goto LABEL_79;
    }
    goto LABEL_170;
  }
LABEL_169:
  unint64_t v36 = 0;
  if ((has & 8) != 0)
  {
LABEL_79:
    unint64_t v35 = 2654435761u * self->_availWLANRxDurMS;
    if ((v2 & 0x100000000) != 0) {
      goto LABEL_80;
    }
    goto LABEL_171;
  }
LABEL_170:
  unint64_t v35 = 0;
  if ((v2 & 0x100000000) != 0)
  {
LABEL_80:
    unint64_t v34 = 2654435761u * self->_txRetries;
    if ((v2 & 0x200000) != 0) {
      goto LABEL_81;
    }
    goto LABEL_172;
  }
LABEL_171:
  unint64_t v34 = 0;
  if ((v2 & 0x200000) != 0)
  {
LABEL_81:
    unint64_t v33 = 2654435761u * self->_txFails;
    if ((v2 & 0x400000) != 0) {
      goto LABEL_82;
    }
    goto LABEL_173;
  }
LABEL_172:
  unint64_t v33 = 0;
  if ((v2 & 0x400000) != 0)
  {
LABEL_82:
    unint64_t v32 = 2654435761u * self->_txFrames;
    if ((v2 & 0x10) != 0) {
      goto LABEL_83;
    }
    goto LABEL_174;
  }
LABEL_173:
  unint64_t v32 = 0;
  if ((v2 & 0x10) != 0)
  {
LABEL_83:
    unint64_t v31 = 2654435761u * self->_rxOvflErrs;
    if (has < 0) {
      goto LABEL_84;
    }
    goto LABEL_175;
  }
LABEL_174:
  unint64_t v31 = 0;
  if (has < 0)
  {
LABEL_84:
    unint64_t v4 = 2654435761u * self->_rxFCSErrs;
    if ((v2 & 0x20) != 0) {
      goto LABEL_85;
    }
    goto LABEL_176;
  }
LABEL_175:
  unint64_t v4 = 0;
  if ((v2 & 0x20) != 0)
  {
LABEL_85:
    unint64_t v5 = 2654435761u * self->_rxPLCPErrs;
    if ((has & 0x1000000000000000) != 0) {
      goto LABEL_86;
    }
    goto LABEL_177;
  }
LABEL_176:
  unint64_t v5 = 0;
  if ((has & 0x1000000000000000) != 0)
  {
LABEL_86:
    unint64_t v6 = 2654435761u * self->_rxCRSErrs;
    if ((has & 0x4000000000000000) != 0) {
      goto LABEL_87;
    }
    goto LABEL_178;
  }
LABEL_177:
  unint64_t v6 = 0;
  if ((has & 0x4000000000000000) != 0)
  {
LABEL_87:
    unint64_t v7 = 2654435761u * self->_rxDupErrs;
    if ((v2 & 0x80) != 0) {
      goto LABEL_88;
    }
    goto LABEL_179;
  }
LABEL_178:
  unint64_t v7 = 0;
  if ((v2 & 0x80) != 0)
  {
LABEL_88:
    unint64_t v8 = 2654435761u * self->_rxReplayErrs;
    if ((has & 0x2000000000000000) != 0) {
      goto LABEL_89;
    }
    goto LABEL_180;
  }
LABEL_179:
  unint64_t v8 = 0;
  if ((has & 0x2000000000000000) != 0)
  {
LABEL_89:
    unint64_t v9 = 2654435761u * self->_rxDecryErrs;
    if ((v2 & 0x100) != 0) {
      goto LABEL_90;
    }
    goto LABEL_181;
  }
LABEL_180:
  unint64_t v9 = 0;
  if ((v2 & 0x100) != 0)
  {
LABEL_90:
    unint64_t v10 = 2654435761u * self->_rxRetries;
    if ((v2 & 2) != 0) {
      goto LABEL_91;
    }
    goto LABEL_182;
  }
LABEL_181:
  unint64_t v10 = 0;
  if ((v2 & 2) != 0)
  {
LABEL_91:
    unint64_t v11 = 2654435761u * self->_rxGoodPlcps;
    if (v2) {
      goto LABEL_92;
    }
    goto LABEL_183;
  }
LABEL_182:
  unint64_t v11 = 0;
  if (v2)
  {
LABEL_92:
    unint64_t v12 = 2654435761u * self->_rxFrames;
    if ((v2 & 0x400) != 0) {
      goto LABEL_93;
    }
    goto LABEL_184;
  }
LABEL_183:
  unint64_t v12 = 0;
  if ((v2 & 0x400) != 0)
  {
LABEL_93:
    unint64_t v13 = 2654435761u * self->_sNR;
    if ((v2 & 0x100000) != 0) {
      goto LABEL_94;
    }
    goto LABEL_185;
  }
LABEL_184:
  unint64_t v13 = 0;
  if ((v2 & 0x100000) != 0)
  {
LABEL_94:
    unint64_t v14 = 2654435761u * self->_txExpectedAMPDUDensity;
    if ((has & 0x100000000000000) != 0) {
      goto LABEL_95;
    }
    goto LABEL_186;
  }
LABEL_185:
  unint64_t v14 = 0;
  if ((has & 0x100000000000000) != 0)
  {
LABEL_95:
    unint64_t v15 = 2654435761u * self->_rC1CoexDurationMS;
    if ((has & 0x200000000000000) != 0) {
      goto LABEL_96;
    }
    goto LABEL_187;
  }
LABEL_186:
  unint64_t v15 = 0;
  if ((has & 0x200000000000000) != 0)
  {
LABEL_96:
    unint64_t v16 = 2654435761u * self->_rC2CoexDurationMS;
    if ((has & 0x4000000000) != 0) {
      goto LABEL_97;
    }
    goto LABEL_188;
  }
LABEL_187:
  unint64_t v16 = 0;
  if ((has & 0x4000000000) != 0)
  {
LABEL_97:
    unint64_t v17 = 2654435761u * self->_lTECoexDurationMS;
    if ((v2 & 0x200) != 0) {
      goto LABEL_98;
    }
    goto LABEL_189;
  }
LABEL_188:
  unint64_t v17 = 0;
  if ((v2 & 0x200) != 0)
  {
LABEL_98:
    unint64_t v18 = 2654435761u * self->_rxThroughput;
    if (has) {
      goto LABEL_99;
    }
    goto LABEL_190;
  }
LABEL_189:
  unint64_t v18 = 0;
  if (has)
  {
LABEL_99:
    unint64_t v19 = 2654435761u * self->_aPTxDataStall;
    if ((has & 0x800000000000000) != 0) {
      goto LABEL_100;
    }
    goto LABEL_191;
  }
LABEL_190:
  unint64_t v19 = 0;
  if ((has & 0x800000000000000) != 0)
  {
LABEL_100:
    unint64_t v20 = 2654435761u * self->_rxAmpduTxBaMismatch;
    if ((v2 & 0x800) != 0) {
      goto LABEL_101;
    }
    goto LABEL_192;
  }
LABEL_191:
  unint64_t v20 = 0;
  if ((v2 & 0x800) != 0)
  {
LABEL_101:
    unint64_t v21 = 2654435761u * self->_symptomsFails;
    if ((has & 0x1000000000) != 0) {
      goto LABEL_102;
    }
    goto LABEL_193;
  }
LABEL_192:
  unint64_t v21 = 0;
  if ((has & 0x1000000000) != 0)
  {
LABEL_102:
    unint64_t v22 = 2654435761u * self->_is2GBand;
    if ((has & 0x2000000000) != 0) {
      goto LABEL_103;
    }
    goto LABEL_194;
  }
LABEL_193:
  unint64_t v22 = 0;
  if ((has & 0x2000000000) != 0)
  {
LABEL_103:
    unint64_t v23 = 2654435761u * self->_isFGTraffic;
    if ((has & 0x80) != 0) {
      goto LABEL_104;
    }
    goto LABEL_195;
  }
LABEL_194:
  unint64_t v23 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_104:
    unint64_t v24 = 2654435761u * self->_baselineThroughput;
    if ((v2 & 0x2000) != 0) {
      goto LABEL_105;
    }
    goto LABEL_196;
  }
LABEL_195:
  unint64_t v24 = 0;
  if ((v2 & 0x2000) != 0)
  {
LABEL_105:
    unint64_t v25 = 2654435761u * self->_testThroughput;
    if ((has & 0x400000000) != 0) {
      goto LABEL_106;
    }
    goto LABEL_197;
  }
LABEL_196:
  unint64_t v25 = 0;
  if ((has & 0x400000000) != 0)
  {
LABEL_106:
    unint64_t v26 = 2654435761u * self->_infraDutyCycle;
    if ((has & 0x8000000000) != 0) {
      goto LABEL_107;
    }
    goto LABEL_198;
  }
LABEL_197:
  unint64_t v26 = 0;
  if ((has & 0x8000000000) != 0)
  {
LABEL_107:
    unint64_t v27 = 2654435761u * self->_lastScanReason;
    if ((has & 2) != 0) {
      goto LABEL_108;
    }
LABEL_199:
    unint64_t v28 = 0;
    if ((v2 & 0x4000) != 0) {
      goto LABEL_109;
    }
LABEL_200:
    unint64_t v29 = 0;
    return v102 ^ v103 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
  }
LABEL_198:
  unint64_t v27 = 0;
  if ((has & 2) == 0) {
    goto LABEL_199;
  }
LABEL_108:
  unint64_t v28 = 2654435761u * self->_accessPointOUI;
  if ((v2 & 0x4000) == 0) {
    goto LABEL_200;
  }
LABEL_109:
  unint64_t v29 = 2654435761u * self->_timeSinceLastRecovery;
  return v102 ^ v103 ^ v101 ^ v100 ^ v99 ^ v98 ^ v97 ^ v96 ^ v95 ^ v94 ^ v93 ^ v92 ^ v91 ^ v90 ^ v89 ^ v88 ^ v87 ^ v86 ^ v85 ^ v84 ^ v83 ^ v82 ^ v81 ^ v80 ^ v79 ^ v78 ^ v77 ^ v76 ^ v75 ^ v74 ^ v73 ^ v72 ^ v71 ^ v70 ^ v69 ^ v68 ^ v67 ^ v66 ^ v65 ^ v64 ^ v63 ^ v62 ^ v61 ^ v60 ^ v59 ^ v58 ^ v57 ^ v56 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v42 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x8000) != 0)
  {
    self->_timestamp = *((void *)a3 + 80);
    *((void *)&self->_has + 1) |= 0x8000uLL;
    uint64_t v3 = *((void *)a3 + 101);
  }
  uint64_t v4 = *((void *)a3 + 100);
  if ((v3 & 0x4000000) != 0)
  {
    self->_txOutputBelowExpectedTrue = *((void *)a3 + 91);
    *((void *)&self->_has + 1) |= 0x4000000uLL;
    uint64_t v4 = *((void *)a3 + 100);
    uint64_t v3 = *((void *)a3 + 101);
    if ((v3 & 0x2000000) == 0)
    {
LABEL_5:
      if ((v3 & 0x10000000) == 0) {
        goto LABEL_6;
      }
      goto LABEL_104;
    }
  }
  else if ((v3 & 0x2000000) == 0)
  {
    goto LABEL_5;
  }
  self->_txOutputBelowExpectedFalse = *((void *)a3 + 90);
  *((void *)&self->_has + 1) |= 0x2000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x10000000) == 0)
  {
LABEL_6:
    if ((v3 & 0x8000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_txOutputBelowInputTrue = *((void *)a3 + 93);
  *((void *)&self->_has + 1) |= 0x10000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x8000000) == 0)
  {
LABEL_7:
    if ((v3 & 0x1000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_txOutputBelowInputFalse = *((void *)a3 + 92);
  *((void *)&self->_has + 1) |= 0x8000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x1000000) == 0)
  {
LABEL_8:
    if ((v3 & 0x800000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_107;
  }
LABEL_106:
  self->_txLowFrameCountTrue = *((void *)a3 + 89);
  *((void *)&self->_has + 1) |= 0x1000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x800000) == 0)
  {
LABEL_9:
    if ((v3 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_108;
  }
LABEL_107:
  self->_txLowFrameCountFalse = *((void *)a3 + 88);
  *((void *)&self->_has + 1) |= 0x800000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 8) == 0)
  {
LABEL_10:
    if ((v3 & 4) == 0) {
      goto LABEL_11;
    }
    goto LABEL_109;
  }
LABEL_108:
  self->_rxLowFrameCountTrue = *((void *)a3 + 68);
  *((void *)&self->_has + 1) |= 8uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 4) == 0)
  {
LABEL_11:
    if ((v4 & 0x20000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_110;
  }
LABEL_109:
  self->_rxLowFrameCountFalse = *((void *)a3 + 67);
  *((void *)&self->_has + 1) |= 4uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x20000000) == 0)
  {
LABEL_12:
    if ((v4 & 0x10000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_111;
  }
LABEL_110:
  self->_highTxLatencyTrue = *((void *)a3 + 30);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x10000000) == 0)
  {
LABEL_13:
    if ((v4 & 0x2000000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_112;
  }
LABEL_111:
  self->_highTxLatencyFalse = *((void *)a3 + 29);
  *(void *)&self->_has |= 0x10000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x2000000000000) == 0)
  {
LABEL_14:
    if ((v4 & 0x1000000000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_113;
  }
LABEL_112:
  self->_lowTxPhyRateTrue = *((void *)a3 + 50);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x1000000000000) == 0)
  {
LABEL_15:
    if ((v4 & 0x80000000) == 0) {
      goto LABEL_16;
    }
    goto LABEL_114;
  }
LABEL_113:
  self->_lowTxPhyRateFalse = *((void *)a3 + 49);
  *(void *)&self->_has |= 0x1000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x80000000) == 0)
  {
LABEL_16:
    if ((v4 & 0x40000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_115;
  }
LABEL_114:
  self->_highTxPerTrue = *((void *)a3 + 32);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x40000000) == 0)
  {
LABEL_17:
    if ((v4 & 0x200000000) == 0) {
      goto LABEL_18;
    }
    goto LABEL_116;
  }
LABEL_115:
  self->_highTxPerFalse = *((void *)a3 + 31);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x200000000) == 0)
  {
LABEL_18:
    if ((v4 & 0x100000000) == 0) {
      goto LABEL_19;
    }
    goto LABEL_117;
  }
LABEL_116:
  self->_highTxRetriesTrue = *((void *)a3 + 34);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x100000000) == 0)
  {
LABEL_19:
    if ((v3 & 0x80000000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_118;
  }
LABEL_117:
  self->_highTxRetriesFalse = *((void *)a3 + 33);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x80000000) == 0)
  {
LABEL_20:
    if ((v3 & 0x40000000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_119;
  }
LABEL_118:
  self->_txQueueFullTrue = *((void *)a3 + 96);
  *((void *)&self->_has + 1) |= 0x80000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x40000000) == 0)
  {
LABEL_21:
    if ((v4 & 0x800000000000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_120;
  }
LABEL_119:
  self->_txQueueFullFalse = *((void *)a3 + 95);
  *((void *)&self->_has + 1) |= 0x40000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x800000000000) == 0)
  {
LABEL_22:
    if ((v4 & 0x400000000000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_121;
  }
LABEL_120:
  self->_lowTxAMPDUDensityTrue = *((void *)a3 + 48);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x400000000000) == 0)
  {
LABEL_23:
    if ((v4 & 0x8000000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_122;
  }
LABEL_121:
  self->_lowTxAMPDUDensityFalse = *((void *)a3 + 47);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x8000000) == 0)
  {
LABEL_24:
    if ((v4 & 0x4000000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_123;
  }
LABEL_122:
  self->_highRxRetriesTrue = *((void *)a3 + 28);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x4000000) == 0)
  {
LABEL_25:
    if ((v4 & 0x800000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_124;
  }
LABEL_123:
  self->_highRxRetriesFalse = *((void *)a3 + 27);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x800000) == 0)
  {
LABEL_26:
    if ((v4 & 0x400000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_125;
  }
LABEL_124:
  self->_highRxPhyPERTrue = *((void *)a3 + 24);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x400000) == 0)
  {
LABEL_27:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_126;
  }
LABEL_125:
  self->_highRxPhyPERFalse = *((void *)a3 + 23);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x80000) == 0)
  {
LABEL_28:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_127;
  }
LABEL_126:
  self->_highRxFCSErrsTrue = *((void *)a3 + 20);
  *(void *)&self->_has |= 0x80000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x40000) == 0)
  {
LABEL_29:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_128;
  }
LABEL_127:
  self->_highRxFCSErrsFalse = *((void *)a3 + 19);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x200000) == 0)
  {
LABEL_30:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_129;
  }
LABEL_128:
  self->_highRxOverflowsTrue = *((void *)a3 + 22);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x100000) == 0)
  {
LABEL_31:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_32;
    }
    goto LABEL_130;
  }
LABEL_129:
  self->_highRxOverflowsFalse = *((void *)a3 + 21);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x20000) == 0)
  {
LABEL_32:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_131;
  }
LABEL_130:
  self->_highRxDupsTrue = *((void *)a3 + 18);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x10000) == 0)
  {
LABEL_33:
    if ((v4 & 0x2000000) == 0) {
      goto LABEL_34;
    }
    goto LABEL_132;
  }
LABEL_131:
  self->_highRxDupsFalse = *((void *)a3 + 17);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x2000000) == 0)
  {
LABEL_34:
    if ((v4 & 0x1000000) == 0) {
      goto LABEL_35;
    }
    goto LABEL_133;
  }
LABEL_132:
  self->_highRxReplaysTrue = *((void *)a3 + 26);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x1000000) == 0)
  {
LABEL_35:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_134;
  }
LABEL_133:
  self->_highRxReplaysFalse = *((void *)a3 + 25);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x8000) == 0)
  {
LABEL_36:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_135;
  }
LABEL_134:
  self->_highRxDecryptErrsTrue = *((void *)a3 + 16);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x4000) == 0)
  {
LABEL_37:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_136;
  }
LABEL_135:
  self->_highRxDecryptErrsFalse = *((void *)a3 + 15);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x2000) == 0)
  {
LABEL_38:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_137;
  }
LABEL_136:
  self->_highRxDataPERTrue = *((void *)a3 + 14);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x1000) == 0)
  {
LABEL_39:
    if ((v4 & 0x20000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_138;
  }
LABEL_137:
  self->_highRxDataPERFalse = *((void *)a3 + 13);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x20000000000) == 0)
  {
LABEL_40:
    if ((v4 & 0x10000000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_139;
  }
LABEL_138:
  self->_lowAvailWLANDurTrue = *((void *)a3 + 42);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x10000000000) == 0)
  {
LABEL_41:
    if ((v4 & 0x200000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_140;
  }
LABEL_139:
  self->_lowAvailWLANDurFalse = *((void *)a3 + 41);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x200000000000) == 0)
  {
LABEL_42:
    if ((v4 & 0x100000000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_141;
  }
LABEL_140:
  self->_lowAvailWLANTxDurTrue = *((void *)a3 + 46);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x100000000000) == 0)
  {
LABEL_43:
    if ((v4 & 0x80000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_142;
  }
LABEL_141:
  self->_lowAvailWLANTxDurFalse = *((void *)a3 + 45);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x80000000000) == 0)
  {
LABEL_44:
    if ((v4 & 0x40000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_143;
  }
LABEL_142:
  self->_lowAvailWLANRxDurTrue = *((void *)a3 + 44);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x40000000000) == 0)
  {
LABEL_45:
    if ((v4 & 0x100) == 0) {
      goto LABEL_46;
    }
    goto LABEL_144;
  }
LABEL_143:
  self->_lowAvailWLANRxDurFalse = *((void *)a3 + 43);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x100) == 0)
  {
LABEL_46:
    if ((v4 & 0x400000000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_145;
  }
LABEL_144:
  self->_cCA = *((void *)a3 + 9);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x400000000000000) == 0)
  {
LABEL_47:
    if ((v3 & 0x20000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_146;
  }
LABEL_145:
  self->_rSSI = *((void *)a3 + 59);
  *(void *)&self->_has |= 0x400000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x20000000) == 0)
  {
LABEL_48:
    if ((v3 & 0x40) == 0) {
      goto LABEL_49;
    }
    goto LABEL_147;
  }
LABEL_146:
  self->_txPhyRate = *((void *)a3 + 94);
  *((void *)&self->_has + 1) |= 0x20000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x40) == 0)
  {
LABEL_49:
    if ((v3 & 0x10000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_148;
  }
LABEL_147:
  self->_rxPhyRate = *((void *)a3 + 71);
  *((void *)&self->_has + 1) |= 0x40uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x10000) == 0)
  {
LABEL_50:
    if ((v4 & 0x8000000000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_149;
  }
LABEL_148:
  self->_txAMPDUDensity = *((void *)a3 + 81);
  *((void *)&self->_has + 1) |= 0x10000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x8000000000000) == 0)
  {
LABEL_51:
    if ((v4 & 0x200) == 0) {
      goto LABEL_52;
    }
    goto LABEL_150;
  }
LABEL_149:
  self->_measurementDurMS = *((void *)a3 + 52);
  *(void *)&self->_has |= 0x8000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x200) == 0)
  {
LABEL_52:
    if ((v3 & 0x1000) == 0) {
      goto LABEL_53;
    }
    goto LABEL_151;
  }
LABEL_150:
  self->_concurrentIntDurMS = *((void *)a3 + 10);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x1000) == 0)
  {
LABEL_53:
    if ((v4 & 0x80000000000000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_152;
  }
LABEL_151:
  self->_tVPMActiveDurationMS = *((void *)a3 + 77);
  *((void *)&self->_has + 1) |= 0x1000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x80000000000000) == 0)
  {
LABEL_54:
    if ((v4 & 0x40000000000000) == 0) {
      goto LABEL_55;
    }
    goto LABEL_153;
  }
LABEL_152:
  self->_phyTxActivityDurMS = *((void *)a3 + 56);
  *(void *)&self->_has |= 0x80000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x40000000000000) == 0)
  {
LABEL_55:
    if ((v3 & 0x200000000) == 0) {
      goto LABEL_56;
    }
    goto LABEL_154;
  }
LABEL_153:
  self->_phyRxActivityDurMS = *((void *)a3 + 55);
  *(void *)&self->_has |= 0x40000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x200000000) == 0)
  {
LABEL_56:
    if ((v3 & 0x20000) == 0) {
      goto LABEL_57;
    }
    goto LABEL_155;
  }
LABEL_154:
  self->_txSubBytes = *((void *)a3 + 98);
  *((void *)&self->_has + 1) |= 0x200000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x20000) == 0)
  {
LABEL_57:
    if ((v3 & 0x80000) == 0) {
      goto LABEL_58;
    }
    goto LABEL_156;
  }
LABEL_155:
  self->_txCompBytes = *((void *)a3 + 82);
  *((void *)&self->_has + 1) |= 0x20000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x80000) == 0)
  {
LABEL_58:
    if ((v4 & 0x10000000000000) == 0) {
      goto LABEL_59;
    }
    goto LABEL_157;
  }
LABEL_156:
  self->_txDelayBytes = *((void *)a3 + 84);
  *((void *)&self->_has + 1) |= 0x80000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x10000000000000) == 0)
  {
LABEL_59:
    if ((v3 & 0x400000000) == 0) {
      goto LABEL_60;
    }
    goto LABEL_158;
  }
LABEL_157:
  self->_offChanDurMS = *((void *)a3 + 53);
  *(void *)&self->_has |= 0x10000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x400000000) == 0)
  {
LABEL_60:
    if ((v3 & 0x40000) == 0) {
      goto LABEL_61;
    }
    goto LABEL_159;
  }
LABEL_158:
  self->_txSubPkts = *((void *)a3 + 99);
  *((void *)&self->_has + 1) |= 0x400000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x40000) == 0)
  {
LABEL_61:
    if ((v4 & 0x4000000000000) == 0) {
      goto LABEL_62;
    }
    goto LABEL_160;
  }
LABEL_159:
  self->_txCompPkts = *((void *)a3 + 83);
  *((void *)&self->_has + 1) |= 0x40000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x4000000000000) == 0)
  {
LABEL_62:
    if ((v4 & 0x20) == 0) {
      goto LABEL_63;
    }
    goto LABEL_161;
  }
LABEL_160:
  self->_maxQueueFullDurMS = *((void *)a3 + 51);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x20) == 0)
  {
LABEL_63:
    if ((v4 & 0x40) == 0) {
      goto LABEL_64;
    }
    goto LABEL_162;
  }
LABEL_161:
  self->_avgTxLatencyMS = *((void *)a3 + 6);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x40) == 0)
  {
LABEL_64:
    if ((v4 & 0x20000000000000) == 0) {
      goto LABEL_65;
    }
    goto LABEL_163;
  }
LABEL_162:
  self->_bTAntennaDurMS = *((void *)a3 + 7);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x20000000000000) == 0)
  {
LABEL_65:
    if ((v4 & 0x800000000) == 0) {
      goto LABEL_66;
    }
    goto LABEL_164;
  }
LABEL_163:
  self->_outputThroughput = *((void *)a3 + 54);
  *(void *)&self->_has |= 0x20000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x800000000) == 0)
  {
LABEL_66:
    if ((v4 & 0x800) == 0) {
      goto LABEL_67;
    }
    goto LABEL_165;
  }
LABEL_164:
  self->_inputThroughput = *((void *)a3 + 36);
  *(void *)&self->_has |= 0x800000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x800) == 0)
  {
LABEL_67:
    if ((v4 & 0x400) == 0) {
      goto LABEL_68;
    }
    goto LABEL_166;
  }
LABEL_165:
  self->_expectedThroughput = *((void *)a3 + 12);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x400) == 0)
  {
LABEL_68:
    if ((v4 & 4) == 0) {
      goto LABEL_69;
    }
    goto LABEL_167;
  }
LABEL_166:
  self->_delayedThroughput = *((void *)a3 + 11);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 4) == 0)
  {
LABEL_69:
    if ((v4 & 0x10) == 0) {
      goto LABEL_70;
    }
    goto LABEL_168;
  }
LABEL_167:
  self->_availWLANDurMS = *((void *)a3 + 3);
  *(void *)&self->_has |= 4uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x10) == 0)
  {
LABEL_70:
    if ((v4 & 8) == 0) {
      goto LABEL_71;
    }
    goto LABEL_169;
  }
LABEL_168:
  self->_availWLANTxDurMS = *((void *)a3 + 5);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 8) == 0)
  {
LABEL_71:
    if ((v3 & 0x100000000) == 0) {
      goto LABEL_72;
    }
    goto LABEL_170;
  }
LABEL_169:
  self->_availWLANRxDurMS = *((void *)a3 + 4);
  *(void *)&self->_has |= 8uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x100000000) == 0)
  {
LABEL_72:
    if ((v3 & 0x200000) == 0) {
      goto LABEL_73;
    }
    goto LABEL_171;
  }
LABEL_170:
  self->_txRetries = *((void *)a3 + 97);
  *((void *)&self->_has + 1) |= 0x100000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x200000) == 0)
  {
LABEL_73:
    if ((v3 & 0x400000) == 0) {
      goto LABEL_74;
    }
    goto LABEL_172;
  }
LABEL_171:
  self->_txFails = *((void *)a3 + 86);
  *((void *)&self->_has + 1) |= 0x200000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x400000) == 0)
  {
LABEL_74:
    if ((v3 & 0x10) == 0) {
      goto LABEL_75;
    }
    goto LABEL_173;
  }
LABEL_172:
  self->_txFrames = *((void *)a3 + 87);
  *((void *)&self->_has + 1) |= 0x400000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x10) == 0)
  {
LABEL_75:
    if ((v4 & 0x8000000000000000) == 0) {
      goto LABEL_76;
    }
    goto LABEL_174;
  }
LABEL_173:
  self->_rxOvflErrs = *((void *)a3 + 69);
  *((void *)&self->_has + 1) |= 0x10uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x8000000000000000) == 0)
  {
LABEL_76:
    if ((v3 & 0x20) == 0) {
      goto LABEL_77;
    }
    goto LABEL_175;
  }
LABEL_174:
  self->_rxFCSErrs = *((void *)a3 + 64);
  *(void *)&self->_has |= 0x8000000000000000;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x20) == 0)
  {
LABEL_77:
    if ((v4 & 0x1000000000000000) == 0) {
      goto LABEL_78;
    }
    goto LABEL_176;
  }
LABEL_175:
  self->_rxPLCPErrs = *((void *)a3 + 70);
  *((void *)&self->_has + 1) |= 0x20uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x1000000000000000) == 0)
  {
LABEL_78:
    if ((v4 & 0x4000000000000000) == 0) {
      goto LABEL_79;
    }
    goto LABEL_177;
  }
LABEL_176:
  self->_rxCRSErrs = *((void *)a3 + 61);
  *(void *)&self->_has |= 0x1000000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x4000000000000000) == 0)
  {
LABEL_79:
    if ((v3 & 0x80) == 0) {
      goto LABEL_80;
    }
    goto LABEL_178;
  }
LABEL_177:
  self->_rxDupErrs = *((void *)a3 + 63);
  *(void *)&self->_has |= 0x4000000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x80) == 0)
  {
LABEL_80:
    if ((v4 & 0x2000000000000000) == 0) {
      goto LABEL_81;
    }
    goto LABEL_179;
  }
LABEL_178:
  self->_rxReplayErrs = *((void *)a3 + 72);
  *((void *)&self->_has + 1) |= 0x80uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x2000000000000000) == 0)
  {
LABEL_81:
    if ((v3 & 0x100) == 0) {
      goto LABEL_82;
    }
    goto LABEL_180;
  }
LABEL_179:
  self->_rxDecryErrs = *((void *)a3 + 62);
  *(void *)&self->_has |= 0x2000000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x100) == 0)
  {
LABEL_82:
    if ((v3 & 2) == 0) {
      goto LABEL_83;
    }
    goto LABEL_181;
  }
LABEL_180:
  self->_rxRetries = *((void *)a3 + 73);
  *((void *)&self->_has + 1) |= 0x100uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 2) == 0)
  {
LABEL_83:
    if ((v3 & 1) == 0) {
      goto LABEL_84;
    }
    goto LABEL_182;
  }
LABEL_181:
  self->_rxGoodPlcps = *((void *)a3 + 66);
  *((void *)&self->_has + 1) |= 2uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 1) == 0)
  {
LABEL_84:
    if ((v3 & 0x400) == 0) {
      goto LABEL_85;
    }
    goto LABEL_183;
  }
LABEL_182:
  self->_rxFrames = *((void *)a3 + 65);
  *((void *)&self->_has + 1) |= 1uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x400) == 0)
  {
LABEL_85:
    if ((v3 & 0x100000) == 0) {
      goto LABEL_86;
    }
    goto LABEL_184;
  }
LABEL_183:
  self->_sNR = *((void *)a3 + 75);
  *((void *)&self->_has + 1) |= 0x400uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x100000) == 0)
  {
LABEL_86:
    if ((v4 & 0x100000000000000) == 0) {
      goto LABEL_87;
    }
    goto LABEL_185;
  }
LABEL_184:
  self->_txExpectedAMPDUDensity = *((void *)a3 + 85);
  *((void *)&self->_has + 1) |= 0x100000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x100000000000000) == 0)
  {
LABEL_87:
    if ((v4 & 0x200000000000000) == 0) {
      goto LABEL_88;
    }
    goto LABEL_186;
  }
LABEL_185:
  self->_rC1CoexDurationMS = *((void *)a3 + 57);
  *(void *)&self->_has |= 0x100000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x200000000000000) == 0)
  {
LABEL_88:
    if ((v4 & 0x4000000000) == 0) {
      goto LABEL_89;
    }
    goto LABEL_187;
  }
LABEL_186:
  self->_rC2CoexDurationMS = *((void *)a3 + 58);
  *(void *)&self->_has |= 0x200000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x4000000000) == 0)
  {
LABEL_89:
    if ((v3 & 0x200) == 0) {
      goto LABEL_90;
    }
    goto LABEL_188;
  }
LABEL_187:
  self->_lTECoexDurationMS = *((void *)a3 + 39);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x200) == 0)
  {
LABEL_90:
    if ((v4 & 1) == 0) {
      goto LABEL_91;
    }
    goto LABEL_189;
  }
LABEL_188:
  self->_rxThroughput = *((void *)a3 + 74);
  *((void *)&self->_has + 1) |= 0x200uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 1) == 0)
  {
LABEL_91:
    if ((v4 & 0x800000000000000) == 0) {
      goto LABEL_92;
    }
    goto LABEL_190;
  }
LABEL_189:
  self->_aPTxDataStall = *((void *)a3 + 1);
  *(void *)&self->_has |= 1uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x800000000000000) == 0)
  {
LABEL_92:
    if ((v3 & 0x800) == 0) {
      goto LABEL_93;
    }
    goto LABEL_191;
  }
LABEL_190:
  self->_rxAmpduTxBaMismatch = *((void *)a3 + 60);
  *(void *)&self->_has |= 0x800000000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x800) == 0)
  {
LABEL_93:
    if ((v4 & 0x1000000000) == 0) {
      goto LABEL_94;
    }
    goto LABEL_192;
  }
LABEL_191:
  self->_symptomsFails = *((void *)a3 + 76);
  *((void *)&self->_has + 1) |= 0x800uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x1000000000) == 0)
  {
LABEL_94:
    if ((v4 & 0x2000000000) == 0) {
      goto LABEL_95;
    }
    goto LABEL_193;
  }
LABEL_192:
  self->_is2GBand = *((void *)a3 + 37);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x2000000000) == 0)
  {
LABEL_95:
    if ((v4 & 0x80) == 0) {
      goto LABEL_96;
    }
    goto LABEL_194;
  }
LABEL_193:
  self->_isFGTraffic = *((void *)a3 + 38);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x80) == 0)
  {
LABEL_96:
    if ((v3 & 0x2000) == 0) {
      goto LABEL_97;
    }
    goto LABEL_195;
  }
LABEL_194:
  self->_baselineThroughput = *((void *)a3 + 8);
  *(void *)&self->_has |= 0x80uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v3 & 0x2000) == 0)
  {
LABEL_97:
    if ((v4 & 0x400000000) == 0) {
      goto LABEL_98;
    }
    goto LABEL_196;
  }
LABEL_195:
  self->_testThroughput = *((void *)a3 + 78);
  *((void *)&self->_has + 1) |= 0x2000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x400000000) == 0)
  {
LABEL_98:
    if ((v4 & 0x8000000000) == 0) {
      goto LABEL_99;
    }
    goto LABEL_197;
  }
LABEL_196:
  self->_infraDutyCycle = *((void *)a3 + 35);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v4 = *((void *)a3 + 100);
  uint64_t v3 = *((void *)a3 + 101);
  if ((v4 & 0x8000000000) == 0)
  {
LABEL_99:
    if ((v4 & 2) == 0) {
      goto LABEL_100;
    }
    goto LABEL_198;
  }
LABEL_197:
  self->_lastScanReason = *((void *)a3 + 40);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v3 = *((void *)a3 + 101);
  if ((*((void *)a3 + 100) & 2) == 0)
  {
LABEL_100:
    if ((v3 & 0x4000) == 0) {
      return;
    }
LABEL_199:
    self->_timeSinceLastRecovery = *((void *)a3 + 79);
    *((void *)&self->_has + 1) |= 0x4000uLL;
    return;
  }
LABEL_198:
  self->_accessPointOUI = *((void *)a3 + 2);
  *(void *)&self->_has |= 2uLL;
  if ((*((void *)a3 + 101) & 0x4000) != 0) {
    goto LABEL_199;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)txOutputBelowExpectedTrue
{
  return self->_txOutputBelowExpectedTrue;
}

- (unint64_t)txOutputBelowExpectedFalse
{
  return self->_txOutputBelowExpectedFalse;
}

- (unint64_t)txOutputBelowInputTrue
{
  return self->_txOutputBelowInputTrue;
}

- (unint64_t)txOutputBelowInputFalse
{
  return self->_txOutputBelowInputFalse;
}

- (unint64_t)txLowFrameCountTrue
{
  return self->_txLowFrameCountTrue;
}

- (unint64_t)txLowFrameCountFalse
{
  return self->_txLowFrameCountFalse;
}

- (unint64_t)rxLowFrameCountTrue
{
  return self->_rxLowFrameCountTrue;
}

- (unint64_t)rxLowFrameCountFalse
{
  return self->_rxLowFrameCountFalse;
}

- (unint64_t)highTxLatencyTrue
{
  return self->_highTxLatencyTrue;
}

- (unint64_t)highTxLatencyFalse
{
  return self->_highTxLatencyFalse;
}

- (unint64_t)lowTxPhyRateTrue
{
  return self->_lowTxPhyRateTrue;
}

- (unint64_t)lowTxPhyRateFalse
{
  return self->_lowTxPhyRateFalse;
}

- (unint64_t)highTxPerTrue
{
  return self->_highTxPerTrue;
}

- (unint64_t)highTxPerFalse
{
  return self->_highTxPerFalse;
}

- (unint64_t)highTxRetriesTrue
{
  return self->_highTxRetriesTrue;
}

- (unint64_t)highTxRetriesFalse
{
  return self->_highTxRetriesFalse;
}

- (unint64_t)txQueueFullTrue
{
  return self->_txQueueFullTrue;
}

- (unint64_t)txQueueFullFalse
{
  return self->_txQueueFullFalse;
}

- (unint64_t)lowTxAMPDUDensityTrue
{
  return self->_lowTxAMPDUDensityTrue;
}

- (unint64_t)lowTxAMPDUDensityFalse
{
  return self->_lowTxAMPDUDensityFalse;
}

- (unint64_t)highRxRetriesTrue
{
  return self->_highRxRetriesTrue;
}

- (unint64_t)highRxRetriesFalse
{
  return self->_highRxRetriesFalse;
}

- (unint64_t)highRxPhyPERTrue
{
  return self->_highRxPhyPERTrue;
}

- (unint64_t)highRxPhyPERFalse
{
  return self->_highRxPhyPERFalse;
}

- (unint64_t)highRxFCSErrsTrue
{
  return self->_highRxFCSErrsTrue;
}

- (unint64_t)highRxFCSErrsFalse
{
  return self->_highRxFCSErrsFalse;
}

- (unint64_t)highRxOverflowsTrue
{
  return self->_highRxOverflowsTrue;
}

- (unint64_t)highRxOverflowsFalse
{
  return self->_highRxOverflowsFalse;
}

- (unint64_t)highRxDupsTrue
{
  return self->_highRxDupsTrue;
}

- (unint64_t)highRxDupsFalse
{
  return self->_highRxDupsFalse;
}

- (unint64_t)highRxReplaysTrue
{
  return self->_highRxReplaysTrue;
}

- (unint64_t)highRxReplaysFalse
{
  return self->_highRxReplaysFalse;
}

- (unint64_t)highRxDecryptErrsTrue
{
  return self->_highRxDecryptErrsTrue;
}

- (unint64_t)highRxDecryptErrsFalse
{
  return self->_highRxDecryptErrsFalse;
}

- (unint64_t)highRxDataPERTrue
{
  return self->_highRxDataPERTrue;
}

- (unint64_t)highRxDataPERFalse
{
  return self->_highRxDataPERFalse;
}

- (unint64_t)lowAvailWLANDurTrue
{
  return self->_lowAvailWLANDurTrue;
}

- (unint64_t)lowAvailWLANDurFalse
{
  return self->_lowAvailWLANDurFalse;
}

- (unint64_t)lowAvailWLANTxDurTrue
{
  return self->_lowAvailWLANTxDurTrue;
}

- (unint64_t)lowAvailWLANTxDurFalse
{
  return self->_lowAvailWLANTxDurFalse;
}

- (unint64_t)lowAvailWLANRxDurTrue
{
  return self->_lowAvailWLANRxDurTrue;
}

- (unint64_t)lowAvailWLANRxDurFalse
{
  return self->_lowAvailWLANRxDurFalse;
}

- (unint64_t)cCA
{
  return self->_cCA;
}

- (int64_t)rSSI
{
  return self->_rSSI;
}

- (unint64_t)txPhyRate
{
  return self->_txPhyRate;
}

- (unint64_t)rxPhyRate
{
  return self->_rxPhyRate;
}

- (unint64_t)txAMPDUDensity
{
  return self->_txAMPDUDensity;
}

- (unint64_t)measurementDurMS
{
  return self->_measurementDurMS;
}

- (unint64_t)concurrentIntDurMS
{
  return self->_concurrentIntDurMS;
}

- (unint64_t)tVPMActiveDurationMS
{
  return self->_tVPMActiveDurationMS;
}

- (unint64_t)phyTxActivityDurMS
{
  return self->_phyTxActivityDurMS;
}

- (unint64_t)phyRxActivityDurMS
{
  return self->_phyRxActivityDurMS;
}

- (unint64_t)txSubBytes
{
  return self->_txSubBytes;
}

- (unint64_t)txCompBytes
{
  return self->_txCompBytes;
}

- (unint64_t)txDelayBytes
{
  return self->_txDelayBytes;
}

- (unint64_t)offChanDurMS
{
  return self->_offChanDurMS;
}

- (unint64_t)txSubPkts
{
  return self->_txSubPkts;
}

- (unint64_t)txCompPkts
{
  return self->_txCompPkts;
}

- (unint64_t)maxQueueFullDurMS
{
  return self->_maxQueueFullDurMS;
}

- (unint64_t)avgTxLatencyMS
{
  return self->_avgTxLatencyMS;
}

- (unint64_t)bTAntennaDurMS
{
  return self->_bTAntennaDurMS;
}

- (unint64_t)outputThroughput
{
  return self->_outputThroughput;
}

- (unint64_t)inputThroughput
{
  return self->_inputThroughput;
}

- (unint64_t)expectedThroughput
{
  return self->_expectedThroughput;
}

- (unint64_t)delayedThroughput
{
  return self->_delayedThroughput;
}

- (unint64_t)availWLANDurMS
{
  return self->_availWLANDurMS;
}

- (unint64_t)availWLANTxDurMS
{
  return self->_availWLANTxDurMS;
}

- (unint64_t)availWLANRxDurMS
{
  return self->_availWLANRxDurMS;
}

- (unint64_t)txRetries
{
  return self->_txRetries;
}

- (unint64_t)txFails
{
  return self->_txFails;
}

- (unint64_t)txFrames
{
  return self->_txFrames;
}

- (unint64_t)rxOvflErrs
{
  return self->_rxOvflErrs;
}

- (unint64_t)rxFCSErrs
{
  return self->_rxFCSErrs;
}

- (unint64_t)rxPLCPErrs
{
  return self->_rxPLCPErrs;
}

- (unint64_t)rxCRSErrs
{
  return self->_rxCRSErrs;
}

- (unint64_t)rxDupErrs
{
  return self->_rxDupErrs;
}

- (unint64_t)rxReplayErrs
{
  return self->_rxReplayErrs;
}

- (unint64_t)rxDecryErrs
{
  return self->_rxDecryErrs;
}

- (unint64_t)rxRetries
{
  return self->_rxRetries;
}

- (unint64_t)rxGoodPlcps
{
  return self->_rxGoodPlcps;
}

- (unint64_t)rxFrames
{
  return self->_rxFrames;
}

- (unint64_t)sNR
{
  return self->_sNR;
}

- (unint64_t)txExpectedAMPDUDensity
{
  return self->_txExpectedAMPDUDensity;
}

- (unint64_t)rC1CoexDurationMS
{
  return self->_rC1CoexDurationMS;
}

- (unint64_t)rC2CoexDurationMS
{
  return self->_rC2CoexDurationMS;
}

- (unint64_t)lTECoexDurationMS
{
  return self->_lTECoexDurationMS;
}

- (unint64_t)rxThroughput
{
  return self->_rxThroughput;
}

- (unint64_t)aPTxDataStall
{
  return self->_aPTxDataStall;
}

- (unint64_t)rxAmpduTxBaMismatch
{
  return self->_rxAmpduTxBaMismatch;
}

- (unint64_t)symptomsFails
{
  return self->_symptomsFails;
}

- (unint64_t)is2GBand
{
  return self->_is2GBand;
}

- (unint64_t)isFGTraffic
{
  return self->_isFGTraffic;
}

- (unint64_t)baselineThroughput
{
  return self->_baselineThroughput;
}

- (unint64_t)testThroughput
{
  return self->_testThroughput;
}

- (unint64_t)infraDutyCycle
{
  return self->_infraDutyCycle;
}

- (unint64_t)lastScanReason
{
  return self->_lastScanReason;
}

- (unint64_t)accessPointOUI
{
  return self->_accessPointOUI;
}

- (unint64_t)timeSinceLastRecovery
{
  return self->_timeSinceLastRecovery;
}

@end
@interface AWDWRMWiFiCell5GData
- (BOOL)fr2DBRecommendation;
- (BOOL)hasApplicationCategory;
- (BOOL)hasCellDataLQM;
- (BOOL)hasCellDlBw;
- (BOOL)hasCellEstimatedBw;
- (BOOL)hasCellEstimatedLoad;
- (BOOL)hasCellLteEstimatedThroughput;
- (BOOL)hasCellLteRSRP;
- (BOOL)hasCellLteRSRQ;
- (BOOL)hasCellLteSNR;
- (BOOL)hasCellMaxDlCaNumConfigured;
- (BOOL)hasCellMaxUlCaNumConfigured;
- (BOOL)hasCellNrEstimatedThroughput;
- (BOOL)hasCellNrFR2active;
- (BOOL)hasCellNrRSRP;
- (BOOL)hasCellNrRSRQ;
- (BOOL)hasCellNrSNR;
- (BOOL)hasCellNsaEnabled;
- (BOOL)hasCellRatType;
- (BOOL)hasCellRrcState;
- (BOOL)hasCellTotalMimoLayers;
- (BOOL)hasCellUlBw;
- (BOOL)hasCellularRecommendationConfidence;
- (BOOL)hasCellularRecommendationScore;
- (BOOL)hasFr2DBRecommendation;
- (BOOL)hasHighThermalTemperatureNotification;
- (BOOL)hasLocationDBFR1Count;
- (BOOL)hasLocationDBFR2Count;
- (BOOL)hasRadioCoverage;
- (BOOL)hasRadioFrequency;
- (BOOL)hasRecommendedlink;
- (BOOL)hasTimestamp;
- (BOOL)hasTotalNrBandwidth;
- (BOOL)hasTriggerReason;
- (BOOL)hasWRMRecommendationReason;
- (BOOL)hasWiFiPredictedThroughput;
- (BOOL)hasWiFiThroughput;
- (BOOL)hasWifPoi;
- (BOOL)hasWifiCca;
- (BOOL)hasWifiEstThoughtput;
- (BOOL)hasWifiQbssLoad;
- (BOOL)hasWifiRecommendationConfidence;
- (BOOL)hasWifiRecommendationScore;
- (BOOL)hasWifiRssi;
- (BOOL)hasWifiRxRetry;
- (BOOL)hasWifiSnr;
- (BOOL)hasWifiStationCount;
- (BOOL)hasWifiTxPER;
- (BOOL)hasWifiWghtAVGRXPHYRATE;
- (BOOL)hasWifiWghtAVGSNR;
- (BOOL)hasWifiWghtAVGTXPHYRATE;
- (BOOL)hasWifiWgtAVGRSSI;
- (BOOL)hasWifiWifiEstThoughtputConfidence;
- (BOOL)highThermalTemperatureNotification;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)cellRatType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)cellLteRSRP;
- (int)cellLteRSRQ;
- (int)cellLteSNR;
- (int)cellNrRSRP;
- (int)cellNrRSRQ;
- (int)cellNrSNR;
- (int)wifiRssi;
- (int)wifiWgtAVGRSSI;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)applicationCategory;
- (unsigned)cellDataLQM;
- (unsigned)cellDlBw;
- (unsigned)cellEstimatedBw;
- (unsigned)cellEstimatedLoad;
- (unsigned)cellLteEstimatedThroughput;
- (unsigned)cellMaxDlCaNumConfigured;
- (unsigned)cellMaxUlCaNumConfigured;
- (unsigned)cellNrEstimatedThroughput;
- (unsigned)cellNrFR2active;
- (unsigned)cellNsaEnabled;
- (unsigned)cellRrcState;
- (unsigned)cellTotalMimoLayers;
- (unsigned)cellUlBw;
- (unsigned)cellularRecommendationConfidence;
- (unsigned)cellularRecommendationScore;
- (unsigned)locationDBFR1Count;
- (unsigned)locationDBFR2Count;
- (unsigned)radioCoverage;
- (unsigned)radioFrequency;
- (unsigned)recommendedlink;
- (unsigned)totalNrBandwidth;
- (unsigned)triggerReason;
- (unsigned)wRMRecommendationReason;
- (unsigned)wiFiPredictedThroughput;
- (unsigned)wiFiThroughput;
- (unsigned)wifPoi;
- (unsigned)wifiCca;
- (unsigned)wifiEstThoughtput;
- (unsigned)wifiQbssLoad;
- (unsigned)wifiRecommendationConfidence;
- (unsigned)wifiRecommendationScore;
- (unsigned)wifiRxRetry;
- (unsigned)wifiSnr;
- (unsigned)wifiStationCount;
- (unsigned)wifiTxPER;
- (unsigned)wifiWghtAVGRXPHYRATE;
- (unsigned)wifiWghtAVGSNR;
- (unsigned)wifiWghtAVGTXPHYRATE;
- (unsigned)wifiWifiEstThoughtputConfidence;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setApplicationCategory:(unsigned int)a3;
- (void)setCellDataLQM:(unsigned int)a3;
- (void)setCellDlBw:(unsigned int)a3;
- (void)setCellEstimatedBw:(unsigned int)a3;
- (void)setCellEstimatedLoad:(unsigned int)a3;
- (void)setCellLteEstimatedThroughput:(unsigned int)a3;
- (void)setCellLteRSRP:(int)a3;
- (void)setCellLteRSRQ:(int)a3;
- (void)setCellLteSNR:(int)a3;
- (void)setCellMaxDlCaNumConfigured:(unsigned int)a3;
- (void)setCellMaxUlCaNumConfigured:(unsigned int)a3;
- (void)setCellNrEstimatedThroughput:(unsigned int)a3;
- (void)setCellNrFR2active:(unsigned int)a3;
- (void)setCellNrRSRP:(int)a3;
- (void)setCellNrRSRQ:(int)a3;
- (void)setCellNrSNR:(int)a3;
- (void)setCellNsaEnabled:(unsigned int)a3;
- (void)setCellRatType:(id)a3;
- (void)setCellRrcState:(unsigned int)a3;
- (void)setCellTotalMimoLayers:(unsigned int)a3;
- (void)setCellUlBw:(unsigned int)a3;
- (void)setCellularRecommendationConfidence:(unsigned int)a3;
- (void)setCellularRecommendationScore:(unsigned int)a3;
- (void)setFr2DBRecommendation:(BOOL)a3;
- (void)setHasApplicationCategory:(BOOL)a3;
- (void)setHasCellDataLQM:(BOOL)a3;
- (void)setHasCellDlBw:(BOOL)a3;
- (void)setHasCellEstimatedBw:(BOOL)a3;
- (void)setHasCellEstimatedLoad:(BOOL)a3;
- (void)setHasCellLteEstimatedThroughput:(BOOL)a3;
- (void)setHasCellLteRSRP:(BOOL)a3;
- (void)setHasCellLteRSRQ:(BOOL)a3;
- (void)setHasCellLteSNR:(BOOL)a3;
- (void)setHasCellMaxDlCaNumConfigured:(BOOL)a3;
- (void)setHasCellMaxUlCaNumConfigured:(BOOL)a3;
- (void)setHasCellNrEstimatedThroughput:(BOOL)a3;
- (void)setHasCellNrFR2active:(BOOL)a3;
- (void)setHasCellNrRSRP:(BOOL)a3;
- (void)setHasCellNrRSRQ:(BOOL)a3;
- (void)setHasCellNrSNR:(BOOL)a3;
- (void)setHasCellNsaEnabled:(BOOL)a3;
- (void)setHasCellRrcState:(BOOL)a3;
- (void)setHasCellTotalMimoLayers:(BOOL)a3;
- (void)setHasCellUlBw:(BOOL)a3;
- (void)setHasCellularRecommendationConfidence:(BOOL)a3;
- (void)setHasCellularRecommendationScore:(BOOL)a3;
- (void)setHasFr2DBRecommendation:(BOOL)a3;
- (void)setHasHighThermalTemperatureNotification:(BOOL)a3;
- (void)setHasLocationDBFR1Count:(BOOL)a3;
- (void)setHasLocationDBFR2Count:(BOOL)a3;
- (void)setHasRadioCoverage:(BOOL)a3;
- (void)setHasRadioFrequency:(BOOL)a3;
- (void)setHasRecommendedlink:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTotalNrBandwidth:(BOOL)a3;
- (void)setHasTriggerReason:(BOOL)a3;
- (void)setHasWRMRecommendationReason:(BOOL)a3;
- (void)setHasWiFiPredictedThroughput:(BOOL)a3;
- (void)setHasWiFiThroughput:(BOOL)a3;
- (void)setHasWifPoi:(BOOL)a3;
- (void)setHasWifiCca:(BOOL)a3;
- (void)setHasWifiEstThoughtput:(BOOL)a3;
- (void)setHasWifiQbssLoad:(BOOL)a3;
- (void)setHasWifiRecommendationConfidence:(BOOL)a3;
- (void)setHasWifiRecommendationScore:(BOOL)a3;
- (void)setHasWifiRssi:(BOOL)a3;
- (void)setHasWifiRxRetry:(BOOL)a3;
- (void)setHasWifiSnr:(BOOL)a3;
- (void)setHasWifiStationCount:(BOOL)a3;
- (void)setHasWifiTxPER:(BOOL)a3;
- (void)setHasWifiWghtAVGRXPHYRATE:(BOOL)a3;
- (void)setHasWifiWghtAVGSNR:(BOOL)a3;
- (void)setHasWifiWghtAVGTXPHYRATE:(BOOL)a3;
- (void)setHasWifiWgtAVGRSSI:(BOOL)a3;
- (void)setHasWifiWifiEstThoughtputConfidence:(BOOL)a3;
- (void)setHighThermalTemperatureNotification:(BOOL)a3;
- (void)setLocationDBFR1Count:(unsigned int)a3;
- (void)setLocationDBFR2Count:(unsigned int)a3;
- (void)setRadioCoverage:(unsigned int)a3;
- (void)setRadioFrequency:(unsigned int)a3;
- (void)setRecommendedlink:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTotalNrBandwidth:(unsigned int)a3;
- (void)setTriggerReason:(unsigned int)a3;
- (void)setWRMRecommendationReason:(unsigned int)a3;
- (void)setWiFiPredictedThroughput:(unsigned int)a3;
- (void)setWiFiThroughput:(unsigned int)a3;
- (void)setWifPoi:(unsigned int)a3;
- (void)setWifiCca:(unsigned int)a3;
- (void)setWifiEstThoughtput:(unsigned int)a3;
- (void)setWifiQbssLoad:(unsigned int)a3;
- (void)setWifiRecommendationConfidence:(unsigned int)a3;
- (void)setWifiRecommendationScore:(unsigned int)a3;
- (void)setWifiRssi:(int)a3;
- (void)setWifiRxRetry:(unsigned int)a3;
- (void)setWifiSnr:(unsigned int)a3;
- (void)setWifiStationCount:(unsigned int)a3;
- (void)setWifiTxPER:(unsigned int)a3;
- (void)setWifiWghtAVGRXPHYRATE:(unsigned int)a3;
- (void)setWifiWghtAVGSNR:(unsigned int)a3;
- (void)setWifiWghtAVGTXPHYRATE:(unsigned int)a3;
- (void)setWifiWgtAVGRSSI:(int)a3;
- (void)setWifiWifiEstThoughtputConfidence:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWRMWiFiCell5GData

- (void)dealloc
{
  [(AWDWRMWiFiCell5GData *)self setCellRatType:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMWiFiCell5GData;
  [(AWDWRMWiFiCell5GData *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(void *)&self->_has |= 1uLL;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFELL | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setWifiRssi:(int)a3
{
  *(void *)&self->_has |= 0x8000000000uLL;
  self->_wifiRssi = a3;
}

- (void)setHasWifiRssi:(BOOL)a3
{
  uint64_t v3 = 0x8000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFF7FFFFFFFFFLL | v3);
}

- (BOOL)hasWifiRssi
{
  return *((unsigned __int8 *)&self->_has + 4) >> 7;
}

- (void)setWifiSnr:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000000uLL;
  self->_wifiSnr = a3;
}

- (void)setHasWifiSnr:(BOOL)a3
{
  uint64_t v3 = 0x20000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFDFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiSnr
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 1) & 1;
}

- (void)setWifiTxPER:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000000uLL;
  self->_wifiTxPER = a3;
}

- (void)setHasWifiTxPER:(BOOL)a3
{
  uint64_t v3 = 0x80000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFF7FFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiTxPER
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 3) & 1;
}

- (void)setWifiRxRetry:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000000uLL;
  self->_wifiRxRetry = a3;
}

- (void)setHasWifiRxRetry:(BOOL)a3
{
  uint64_t v3 = 0x10000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFEFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiRxRetry
{
  return *((unsigned char *)&self->_has + 5) & 1;
}

- (void)setWifiCca:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000uLL;
  self->_wifiCca = a3;
}

- (void)setHasWifiCca:(BOOL)a3
{
  uint64_t v3 = 0x400000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFBFFFFFFFFLL | v3);
}

- (BOOL)hasWifiCca
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 2) & 1;
}

- (void)setWifiQbssLoad:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000uLL;
  self->_wifiQbssLoad = a3;
}

- (void)setHasWifiQbssLoad:(BOOL)a3
{
  uint64_t v3 = 0x1000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFEFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiQbssLoad
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 4) & 1;
}

- (void)setWifiStationCount:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000000uLL;
  self->_wifiStationCount = a3;
}

- (void)setHasWifiStationCount:(BOOL)a3
{
  uint64_t v3 = 0x40000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFBFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiStationCount
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 2) & 1;
}

- (void)setWifPoi:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000uLL;
  self->_wifPoi = a3;
}

- (void)setHasWifPoi:(BOOL)a3
{
  uint64_t v3 = 0x200000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFDFFFFFFFFLL | v3);
}

- (BOOL)hasWifPoi
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 1) & 1;
}

- (void)setWifiWgtAVGRSSI:(int)a3
{
  *(void *)&self->_has |= 0x800000000000uLL;
  self->_wifiWgtAVGRSSI = a3;
}

- (void)setHasWifiWgtAVGRSSI:(BOOL)a3
{
  uint64_t v3 = 0x800000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFF7FFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWgtAVGRSSI
{
  return *((unsigned __int8 *)&self->_has + 5) >> 7;
}

- (void)setWifiWghtAVGSNR:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000000000uLL;
  self->_wifiWghtAVGSNR = a3;
}

- (void)setHasWifiWghtAVGSNR:(BOOL)a3
{
  uint64_t v3 = 0x200000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFDFFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWghtAVGSNR
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 5) & 1;
}

- (void)setWifiWghtAVGTXPHYRATE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000000000uLL;
  self->_wifiWghtAVGTXPHYRATE = a3;
}

- (void)setHasWifiWghtAVGTXPHYRATE:(BOOL)a3
{
  uint64_t v3 = 0x400000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFBFFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWghtAVGTXPHYRATE
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 6) & 1;
}

- (void)setWifiWghtAVGRXPHYRATE:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000000uLL;
  self->_wifiWghtAVGRXPHYRATE = a3;
}

- (void)setHasWifiWghtAVGRXPHYRATE:(BOOL)a3
{
  uint64_t v3 = 0x100000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFEFFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWghtAVGRXPHYRATE
{
  return (*((unsigned __int8 *)&self->_has + 5) >> 4) & 1;
}

- (void)setWifiEstThoughtput:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000000uLL;
  self->_wifiEstThoughtput = a3;
}

- (void)setHasWifiEstThoughtput:(BOOL)a3
{
  uint64_t v3 = 0x800000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFF7FFFFFFFFLL | v3);
}

- (BOOL)hasWifiEstThoughtput
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 3) & 1;
}

- (void)setWifiWifiEstThoughtputConfidence:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000000000uLL;
  self->_wifiWifiEstThoughtputConfidence = a3;
}

- (void)setHasWifiWifiEstThoughtputConfidence:(BOOL)a3
{
  uint64_t v3 = 0x1000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFEFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiWifiEstThoughtputConfidence
{
  return *((unsigned char *)&self->_has + 6) & 1;
}

- (BOOL)hasCellRatType
{
  return self->_cellRatType != 0;
}

- (void)setCellLteRSRP:(int)a3
{
  *(void *)&self->_has |= 0x80uLL;
  self->_cellLteRSRP = a3;
}

- (void)setHasCellLteRSRP:(BOOL)a3
{
  uint64_t v3 = 128;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFF7FLL | v3);
}

- (BOOL)hasCellLteRSRP
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setCellLteSNR:(int)a3
{
  *(void *)&self->_has |= 0x200uLL;
  self->_cellLteSNR = a3;
}

- (void)setHasCellLteSNR:(BOOL)a3
{
  uint64_t v3 = 512;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFDFFLL | v3);
}

- (BOOL)hasCellLteSNR
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (void)setCellLteRSRQ:(int)a3
{
  *(void *)&self->_has |= 0x100uLL;
  self->_cellLteRSRQ = a3;
}

- (void)setHasCellLteRSRQ:(BOOL)a3
{
  uint64_t v3 = 256;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFEFFLL | v3);
}

- (BOOL)hasCellLteRSRQ
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setCellNrRSRP:(int)a3
{
  *(void *)&self->_has |= 0x4000uLL;
  self->_cellNrRSRP = a3;
}

- (void)setHasCellNrRSRP:(BOOL)a3
{
  uint64_t v3 = 0x4000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFBFFFLL | v3);
}

- (BOOL)hasCellNrRSRP
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setCellNrRSRQ:(int)a3
{
  *(void *)&self->_has |= 0x8000uLL;
  self->_cellNrRSRQ = a3;
}

- (void)setHasCellNrRSRQ:(BOOL)a3
{
  uint64_t v3 = 0x8000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFF7FFFLL | v3);
}

- (BOOL)hasCellNrRSRQ
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setCellNrSNR:(int)a3
{
  *(void *)&self->_has |= 0x10000uLL;
  self->_cellNrSNR = a3;
}

- (void)setHasCellNrSNR:(BOOL)a3
{
  uint64_t v3 = 0x10000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFEFFFFLL | v3);
}

- (BOOL)hasCellNrSNR
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setCellDataLQM:(unsigned int)a3
{
  *(void *)&self->_has |= 4uLL;
  self->_cellDataLQM = a3;
}

- (void)setHasCellDataLQM:(BOOL)a3
{
  uint64_t v3 = 4;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFBLL | v3);
}

- (BOOL)hasCellDataLQM
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setCellRrcState:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000uLL;
  self->_cellRrcState = a3;
}

- (void)setHasCellRrcState:(BOOL)a3
{
  uint64_t v3 = 0x40000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFBFFFFLL | v3);
}

- (BOOL)hasCellRrcState
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 2) & 1;
}

- (void)setCellNrFR2active:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000uLL;
  self->_cellNrFR2active = a3;
}

- (void)setHasCellNrFR2active:(BOOL)a3
{
  uint64_t v3 = 0x2000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFDFFFLL | v3);
}

- (BOOL)hasCellNrFR2active
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setCellLteEstimatedThroughput:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40uLL;
  self->_cellLteEstimatedThroughput = a3;
}

- (void)setHasCellLteEstimatedThroughput:(BOOL)a3
{
  uint64_t v3 = 64;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFBFLL | v3);
}

- (BOOL)hasCellLteEstimatedThroughput
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setCellNrEstimatedThroughput:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000uLL;
  self->_cellNrEstimatedThroughput = a3;
}

- (void)setHasCellNrEstimatedThroughput:(BOOL)a3
{
  uint64_t v3 = 4096;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFEFFFLL | v3);
}

- (BOOL)hasCellNrEstimatedThroughput
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setCellNsaEnabled:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000uLL;
  self->_cellNsaEnabled = a3;
}

- (void)setHasCellNsaEnabled:(BOOL)a3
{
  uint64_t v3 = 0x20000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFDFFFFLL | v3);
}

- (BOOL)hasCellNsaEnabled
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 1) & 1;
}

- (void)setCellDlBw:(unsigned int)a3
{
  *(void *)&self->_has |= 8uLL;
  self->_cellDlBw = a3;
}

- (void)setHasCellDlBw:(BOOL)a3
{
  uint64_t v3 = 8;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFF7 | v3);
}

- (BOOL)hasCellDlBw
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setCellUlBw:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000uLL;
  self->_cellUlBw = a3;
}

- (void)setHasCellUlBw:(BOOL)a3
{
  uint64_t v3 = 0x100000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFEFFFFFLL | v3);
}

- (BOOL)hasCellUlBw
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 4) & 1;
}

- (void)setCellMaxDlCaNumConfigured:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400uLL;
  self->_cellMaxDlCaNumConfigured = a3;
}

- (void)setHasCellMaxDlCaNumConfigured:(BOOL)a3
{
  uint64_t v3 = 1024;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFBFFLL | v3);
}

- (BOOL)hasCellMaxDlCaNumConfigured
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)setCellMaxUlCaNumConfigured:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800uLL;
  self->_cellMaxUlCaNumConfigured = a3;
}

- (void)setHasCellMaxUlCaNumConfigured:(BOOL)a3
{
  uint64_t v3 = 2048;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFF7FFLL | v3);
}

- (BOOL)hasCellMaxUlCaNumConfigured
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setCellEstimatedLoad:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20uLL;
  self->_cellEstimatedLoad = a3;
}

- (void)setHasCellEstimatedLoad:(BOOL)a3
{
  uint64_t v3 = 32;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFDFLL | v3);
}

- (BOOL)hasCellEstimatedLoad
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setCellEstimatedBw:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10uLL;
  self->_cellEstimatedBw = a3;
}

- (void)setHasCellEstimatedBw:(BOOL)a3
{
  uint64_t v3 = 16;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFEFLL | v3);
}

- (BOOL)hasCellEstimatedBw
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setRecommendedlink:(unsigned int)a3
{
  *(void *)&self->_has |= 0x8000000uLL;
  self->_recommendedlink = a3;
}

- (void)setHasRecommendedlink:(BOOL)a3
{
  uint64_t v3 = 0x8000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFF7FFFFFFLL | v3);
}

- (BOOL)hasRecommendedlink
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 3) & 1;
}

- (void)setFr2DBRecommendation:(BOOL)a3
{
  *(void *)&self->_has |= 0x2000000000000uLL;
  self->_fr2DBRecommendation = a3;
}

- (void)setHasFr2DBRecommendation:(BOOL)a3
{
  uint64_t v3 = 0x2000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFDFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasFr2DBRecommendation
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 1) & 1;
}

- (void)setLocationDBFR1Count:(unsigned int)a3
{
  *(void *)&self->_has |= 0x800000uLL;
  self->_locationDBFR1Count = a3;
}

- (void)setHasLocationDBFR1Count:(BOOL)a3
{
  uint64_t v3 = 0x800000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFF7FFFFFLL | v3);
}

- (BOOL)hasLocationDBFR1Count
{
  return *((unsigned __int8 *)&self->_has + 2) >> 7;
}

- (void)setLocationDBFR2Count:(unsigned int)a3
{
  *(void *)&self->_has |= 0x1000000uLL;
  self->_locationDBFR2Count = a3;
}

- (void)setHasLocationDBFR2Count:(BOOL)a3
{
  uint64_t v3 = 0x1000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFEFFFFFFLL | v3);
}

- (BOOL)hasLocationDBFR2Count
{
  return *((unsigned char *)&self->_has + 3) & 1;
}

- (void)setHighThermalTemperatureNotification:(BOOL)a3
{
  *(void *)&self->_has |= 0x4000000000000uLL;
  self->_highThermalTemperatureNotification = a3;
}

- (void)setHasHighThermalTemperatureNotification:(BOOL)a3
{
  uint64_t v3 = 0x4000000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFBFFFFFFFFFFFFLL | v3);
}

- (BOOL)hasHighThermalTemperatureNotification
{
  return (*((unsigned __int8 *)&self->_has + 6) >> 2) & 1;
}

- (void)setWiFiThroughput:(unsigned int)a3
{
  *(void *)&self->_has |= 0x100000000uLL;
  self->_wiFiThroughput = a3;
}

- (void)setHasWiFiThroughput:(BOOL)a3
{
  uint64_t v3 = 0x100000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFEFFFFFFFFLL | v3);
}

- (BOOL)hasWiFiThroughput
{
  return *((unsigned char *)&self->_has + 4) & 1;
}

- (void)setWiFiPredictedThroughput:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000000uLL;
  self->_wiFiPredictedThroughput = a3;
}

- (void)setHasWiFiPredictedThroughput:(BOOL)a3
{
  uint64_t v3 = 0x80000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFF7FFFFFFFLL | v3);
}

- (BOOL)hasWiFiPredictedThroughput
{
  return *((unsigned __int8 *)&self->_has + 3) >> 7;
}

- (void)setWRMRecommendationReason:(unsigned int)a3
{
  *(void *)&self->_has |= 0x40000000uLL;
  self->_wRMRecommendationReason = a3;
}

- (void)setHasWRMRecommendationReason:(BOOL)a3
{
  uint64_t v3 = 0x40000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFBFFFFFFFLL | v3);
}

- (BOOL)hasWRMRecommendationReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 6) & 1;
}

- (void)setWifiRecommendationScore:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000000uLL;
  self->_wifiRecommendationScore = a3;
}

- (void)setHasWifiRecommendationScore:(BOOL)a3
{
  uint64_t v3 = 0x4000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFBFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiRecommendationScore
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 6) & 1;
}

- (void)setWifiRecommendationConfidence:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000000uLL;
  self->_wifiRecommendationConfidence = a3;
}

- (void)setHasWifiRecommendationConfidence:(BOOL)a3
{
  uint64_t v3 = 0x2000000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFDFFFFFFFFFLL | v3);
}

- (BOOL)hasWifiRecommendationConfidence
{
  return (*((unsigned __int8 *)&self->_has + 4) >> 5) & 1;
}

- (void)setCellularRecommendationScore:(unsigned int)a3
{
  *(void *)&self->_has |= 0x400000uLL;
  self->_cellularRecommendationScore = a3;
}

- (void)setHasCellularRecommendationScore:(BOOL)a3
{
  uint64_t v3 = 0x400000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFBFFFFFLL | v3);
}

- (BOOL)hasCellularRecommendationScore
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 6) & 1;
}

- (void)setCellularRecommendationConfidence:(unsigned int)a3
{
  *(void *)&self->_has |= 0x200000uLL;
  self->_cellularRecommendationConfidence = a3;
}

- (void)setHasCellularRecommendationConfidence:(BOOL)a3
{
  uint64_t v3 = 0x200000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFDFFFFFLL | v3);
}

- (BOOL)hasCellularRecommendationConfidence
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 5) & 1;
}

- (void)setRadioCoverage:(unsigned int)a3
{
  *(void *)&self->_has |= 0x2000000uLL;
  self->_radioCoverage = a3;
}

- (void)setHasRadioCoverage:(BOOL)a3
{
  uint64_t v3 = 0x2000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFDFFFFFFLL | v3);
}

- (BOOL)hasRadioCoverage
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 1) & 1;
}

- (void)setRadioFrequency:(unsigned int)a3
{
  *(void *)&self->_has |= 0x4000000uLL;
  self->_radioFrequency = a3;
}

- (void)setHasRadioFrequency:(BOOL)a3
{
  uint64_t v3 = 0x4000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFBFFFFFFLL | v3);
}

- (BOOL)hasRadioFrequency
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 2) & 1;
}

- (void)setTriggerReason:(unsigned int)a3
{
  *(void *)&self->_has |= 0x20000000uLL;
  self->_triggerReason = a3;
}

- (void)setHasTriggerReason:(BOOL)a3
{
  uint64_t v3 = 0x20000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFDFFFFFFFLL | v3);
}

- (BOOL)hasTriggerReason
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 5) & 1;
}

- (void)setApplicationCategory:(unsigned int)a3
{
  *(void *)&self->_has |= 2uLL;
  self->_applicationCategory = a3;
}

- (void)setHasApplicationCategory:(BOOL)a3
{
  uint64_t v3 = 2;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFFFFFFDLL | v3);
}

- (BOOL)hasApplicationCategory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setCellTotalMimoLayers:(unsigned int)a3
{
  *(void *)&self->_has |= 0x80000uLL;
  self->_cellTotalMimoLayers = a3;
}

- (void)setHasCellTotalMimoLayers:(BOOL)a3
{
  uint64_t v3 = 0x80000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFFFF7FFFFLL | v3);
}

- (BOOL)hasCellTotalMimoLayers
{
  return (*((unsigned __int8 *)&self->_has + 2) >> 3) & 1;
}

- (void)setTotalNrBandwidth:(unsigned int)a3
{
  *(void *)&self->_has |= 0x10000000uLL;
  self->_totalNrBandwidth = a3;
}

- (void)setHasTotalNrBandwidth:(BOOL)a3
{
  uint64_t v3 = 0x10000000;
  if (!a3) {
    uint64_t v3 = 0;
  }
  self->_has = ($C55178DCE1A7AB74CCE6B5DAE3DC8A08)(*(void *)&self->_has & 0xFFFFFFFFEFFFFFFFLL | v3);
}

- (BOOL)hasTotalNrBandwidth
{
  return (*((unsigned __int8 *)&self->_has + 3) >> 4) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMWiFiCell5GData;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWRMWiFiCell5GData description](&v3, sel_description), -[AWDWRMWiFiCell5GData dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if (*(unsigned char *)&has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
    if ((*(void *)&has & 0x8000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x20000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_59;
    }
  }
  else if ((*(void *)&has & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_wifiRssi] forKey:@"wifi_rssi"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_60;
  }
LABEL_59:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiSnr] forKey:@"wifi_snr"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_61;
  }
LABEL_60:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiTxPER] forKey:@"wifi_txPER"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_62;
  }
LABEL_61:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiRxRetry] forKey:@"wifi_rxRetry"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_63;
  }
LABEL_62:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiCca] forKey:@"wifi_cca"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_64;
  }
LABEL_63:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiQbssLoad] forKey:@"wifi_qbssLoad"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_65;
  }
LABEL_64:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiStationCount] forKey:@"wifi_stationCount"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_66;
  }
LABEL_65:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifPoi] forKey:@"wif_poi"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_67;
  }
LABEL_66:
  [v3 setObject:[NSNumber numberWithInt:self->_wifiWgtAVGRSSI] forKey:@"wifi_wgtAVG_RSSI"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_68;
  }
LABEL_67:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiWghtAVGSNR] forKey:@"wifi_wghtAVG_SNR"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_69;
  }
LABEL_68:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiWghtAVGTXPHYRATE] forKey:@"wifi_wghtAVG_TX_PHY_RATE"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_70;
  }
LABEL_69:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiWghtAVGRXPHYRATE] forKey:@"wifi_wghtAVG_RX_PHY_RATE"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_70:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiEstThoughtput] forKey:@"wifi_EstThoughtput"];
  if ((*(void *)&self->_has & 0x1000000000000) != 0) {
LABEL_16:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiWifiEstThoughtputConfidence] forKey:@"wifi_wifi_EstThoughtput_confidence"];
LABEL_17:
  cellRatType = self->_cellRatType;
  if (cellRatType) {
    [v3 setObject:cellRatType forKey:@"cell_ratType"];
  }
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_cellLteRSRP] forKey:@"cell_lteRSRP"];
    $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x100) == 0) {
        goto LABEL_22;
      }
      goto LABEL_74;
    }
  }
  else if ((*(_WORD *)&v6 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_cellLteSNR] forKey:@"cell_lteSNR"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_75;
  }
LABEL_74:
  [v3 setObject:[NSNumber numberWithInt:self->_cellLteRSRQ] forKey:@"cell_lteRSRQ"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
LABEL_75:
  [v3 setObject:[NSNumber numberWithInt:self->_cellNrRSRP] forKey:@"cell_nrRSRP"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_77;
  }
LABEL_76:
  [v3 setObject:[NSNumber numberWithInt:self->_cellNrRSRQ] forKey:@"cell_nrRSRQ"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_78;
  }
LABEL_77:
  [v3 setObject:[NSNumber numberWithInt:self->_cellNrSNR] forKey:@"cell_nrSNR"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_79;
  }
LABEL_78:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellDataLQM] forKey:@"cell_dataLQM"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_80;
  }
LABEL_79:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellRrcState] forKey:@"cell_rrcState"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_81;
  }
LABEL_80:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellNrFR2active] forKey:@"cell_nrFR2active"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_82;
  }
LABEL_81:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellLteEstimatedThroughput] forKey:@"cell_lteEstimatedThroughput"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_83;
  }
LABEL_82:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellNrEstimatedThroughput] forKey:@"cell_nrEstimatedThroughput"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_84;
  }
LABEL_83:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellNsaEnabled] forKey:@"cell_nsaEnabled"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_85;
  }
LABEL_84:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellDlBw] forKey:@"cell_dl_bw"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_86;
  }
LABEL_85:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellUlBw] forKey:@"cell_ul_bw"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_35;
    }
    goto LABEL_87;
  }
LABEL_86:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellMaxDlCaNumConfigured] forKey:@"cell_max_dl_ca_num_configured"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_36;
    }
    goto LABEL_88;
  }
LABEL_87:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellMaxUlCaNumConfigured] forKey:@"cell_max_ul_ca_num_configured"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_37;
    }
    goto LABEL_89;
  }
LABEL_88:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellEstimatedLoad] forKey:@"cell_estimated_load"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_90;
  }
LABEL_89:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellEstimatedBw] forKey:@"cell_estimated_bw"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_38:
    if ((*(void *)&v6 & 0x2000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_91;
  }
LABEL_90:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_recommendedlink] forKey:@"recommendedlink"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_92;
  }
LABEL_91:
  [v3 setObject:[NSNumber numberWithBool:self->_fr2DBRecommendation] forKey:@"fr2DBRecommendation"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_93;
  }
LABEL_92:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_locationDBFR1Count] forKey:@"locationDBFR1Count"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_41:
    if ((*(void *)&v6 & 0x4000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_94;
  }
LABEL_93:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_locationDBFR2Count] forKey:@"locationDBFR2Count"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&v6 & 0x100000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_95;
  }
LABEL_94:
  [v3 setObject:[NSNumber numberWithBool:self->_highThermalTemperatureNotification] forKey:@"highThermalTemperatureNotification"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_96;
  }
LABEL_95:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wiFiThroughput] forKey:@"WiFiThroughput"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v6 & 0x40000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_97;
  }
LABEL_96:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wiFiPredictedThroughput] forKey:@"WiFiPredictedThroughput"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) == 0)
  {
LABEL_45:
    if ((*(void *)&v6 & 0x4000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_98;
  }
LABEL_97:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wRMRecommendationReason] forKey:@"WRMRecommendationReason"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&v6 & 0x2000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_99;
  }
LABEL_98:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiRecommendationScore] forKey:@"wifiRecommendationScore"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x2000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_100;
  }
LABEL_99:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_wifiRecommendationConfidence] forKey:@"wifiRecommendationConfidence"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_101;
  }
LABEL_100:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellularRecommendationScore] forKey:@"cellularRecommendationScore"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_102;
  }
LABEL_101:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellularRecommendationConfidence] forKey:@"cellularRecommendationConfidence"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_103;
  }
LABEL_102:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_radioCoverage] forKey:@"radioCoverage"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_104;
  }
LABEL_103:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_radioFrequency] forKey:@"radioFrequency"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_52:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_53;
    }
    goto LABEL_105;
  }
LABEL_104:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_triggerReason] forKey:@"trigger_reason"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_54;
    }
LABEL_106:
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_cellTotalMimoLayers] forKey:@"cell_total_mimo_layers"];
    if ((*(void *)&self->_has & 0x10000000) == 0) {
      return v3;
    }
    goto LABEL_55;
  }
LABEL_105:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_applicationCategory] forKey:@"applicationCategory"];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) != 0) {
    goto LABEL_106;
  }
LABEL_54:
  if ((*(_DWORD *)&v6 & 0x10000000) != 0) {
LABEL_55:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_totalNrBandwidth] forKey:@"total_nr_bandwidth"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMWiFiCell5GDataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
    if ((*(void *)&has & 0x8000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x20000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_58;
    }
  }
  else if ((*(void *)&has & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteSint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_59;
  }
LABEL_58:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_60;
  }
LABEL_59:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_61;
  }
LABEL_60:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_62;
  }
LABEL_61:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_63;
  }
LABEL_62:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_64;
  }
LABEL_63:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_65;
  }
LABEL_64:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_66;
  }
LABEL_65:
  PBDataWriterWriteSint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_67;
  }
LABEL_66:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_68;
  }
LABEL_67:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_69;
  }
LABEL_68:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_69:
  PBDataWriterWriteUint32Field();
  if ((*(void *)&self->_has & 0x1000000000000) != 0) {
LABEL_16:
  }
    PBDataWriterWriteUint32Field();
LABEL_17:
  if (self->_cellRatType) {
    PBDataWriterWriteStringField();
  }
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x80) != 0)
  {
    PBDataWriterWriteSint32Field();
    $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
    if ((*(_WORD *)&v5 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v5 & 0x100) == 0) {
        goto LABEL_22;
      }
      goto LABEL_73;
    }
  }
  else if ((*(_WORD *)&v5 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteSint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v5 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_74;
  }
LABEL_73:
  PBDataWriterWriteSint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v5 & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_75;
  }
LABEL_74:
  PBDataWriterWriteSint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v5 & 0x10000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_76;
  }
LABEL_75:
  PBDataWriterWriteSint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v5 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_77;
  }
LABEL_76:
  PBDataWriterWriteSint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 4) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v5 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_78;
  }
LABEL_77:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v5 & 0x2000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_79;
  }
LABEL_78:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v5 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_80;
  }
LABEL_79:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v5 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_81;
  }
LABEL_80:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v5 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_82;
  }
LABEL_81:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v5 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_83;
  }
LABEL_82:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v5 & 0x100000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_84;
  }
LABEL_83:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v5 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_85;
  }
LABEL_84:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v5 & 0x800) == 0) {
      goto LABEL_35;
    }
    goto LABEL_86;
  }
LABEL_85:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_WORD *)&v5 & 0x800) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&v5 & 0x20) == 0) {
      goto LABEL_36;
    }
    goto LABEL_87;
  }
LABEL_86:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x20) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v5 & 0x10) == 0) {
      goto LABEL_37;
    }
    goto LABEL_88;
  }
LABEL_87:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 0x10) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v5 & 0x8000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_89;
  }
LABEL_88:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x8000000) == 0)
  {
LABEL_38:
    if ((*(void *)&v5 & 0x2000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_90;
  }
LABEL_89:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(void *)&v5 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v5 & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_91;
  }
LABEL_90:
  PBDataWriterWriteBOOLField();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v5 & 0x1000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_92;
  }
LABEL_91:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x1000000) == 0)
  {
LABEL_41:
    if ((*(void *)&v5 & 0x4000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_93;
  }
LABEL_92:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(void *)&v5 & 0x4000000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&v5 & 0x100000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_94;
  }
LABEL_93:
  PBDataWriterWriteBOOLField();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(void *)&v5 & 0x100000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v5 & 0x80000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_95;
  }
LABEL_94:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v5 & 0x40000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_96;
  }
LABEL_95:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x40000000) == 0)
  {
LABEL_45:
    if ((*(void *)&v5 & 0x4000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_97;
  }
LABEL_96:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(void *)&v5 & 0x4000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&v5 & 0x2000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_98;
  }
LABEL_97:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(void *)&v5 & 0x2000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v5 & 0x400000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_99;
  }
LABEL_98:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x400000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v5 & 0x200000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_100;
  }
LABEL_99:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v5 & 0x2000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_101;
  }
LABEL_100:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v5 & 0x4000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_102;
  }
LABEL_101:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x4000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v5 & 0x20000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_103;
  }
LABEL_102:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x20000000) == 0)
  {
LABEL_52:
    if ((*(unsigned char *)&v5 & 2) == 0) {
      goto LABEL_53;
    }
    goto LABEL_104;
  }
LABEL_103:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(unsigned char *)&v5 & 2) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v5 & 0x80000) == 0) {
      goto LABEL_54;
    }
LABEL_105:
    PBDataWriterWriteUint32Field();
    if ((*(void *)&self->_has & 0x10000000) == 0) {
      return;
    }
    goto LABEL_106;
  }
LABEL_104:
  PBDataWriterWriteUint32Field();
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v5 = self->_has;
  if ((*(_DWORD *)&v5 & 0x80000) != 0) {
    goto LABEL_105;
  }
LABEL_54:
  if ((*(_DWORD *)&v5 & 0x10000000) == 0) {
    return;
  }
LABEL_106:

  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((void *)a3 + 28) |= 1uLL;
    $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
    if ((*(void *)&has & 0x8000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x20000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_59;
    }
  }
  else if ((*(void *)&has & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 45) = self->_wifiRssi;
  *((void *)a3 + 28) |= 0x8000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_60;
  }
LABEL_59:
  *((_DWORD *)a3 + 47) = self->_wifiSnr;
  *((void *)a3 + 28) |= 0x20000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_61;
  }
LABEL_60:
  *((_DWORD *)a3 + 49) = self->_wifiTxPER;
  *((void *)a3 + 28) |= 0x80000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_62;
  }
LABEL_61:
  *((_DWORD *)a3 + 46) = self->_wifiRxRetry;
  *((void *)a3 + 28) |= 0x10000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_63;
  }
LABEL_62:
  *((_DWORD *)a3 + 40) = self->_wifiCca;
  *((void *)a3 + 28) |= 0x400000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_64;
  }
LABEL_63:
  *((_DWORD *)a3 + 42) = self->_wifiQbssLoad;
  *((void *)a3 + 28) |= 0x1000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_65;
  }
LABEL_64:
  *((_DWORD *)a3 + 48) = self->_wifiStationCount;
  *((void *)a3 + 28) |= 0x40000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_66;
  }
LABEL_65:
  *((_DWORD *)a3 + 39) = self->_wifPoi;
  *((void *)a3 + 28) |= 0x200000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_67;
  }
LABEL_66:
  *((_DWORD *)a3 + 53) = self->_wifiWgtAVGRSSI;
  *((void *)a3 + 28) |= 0x800000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_68;
  }
LABEL_67:
  *((_DWORD *)a3 + 51) = self->_wifiWghtAVGSNR;
  *((void *)a3 + 28) |= 0x200000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_69;
  }
LABEL_68:
  *((_DWORD *)a3 + 52) = self->_wifiWghtAVGTXPHYRATE;
  *((void *)a3 + 28) |= 0x400000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_70;
  }
LABEL_69:
  *((_DWORD *)a3 + 50) = self->_wifiWghtAVGRXPHYRATE;
  *((void *)a3 + 28) |= 0x100000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_70:
  *((_DWORD *)a3 + 41) = self->_wifiEstThoughtput;
  *((void *)a3 + 28) |= 0x800000000uLL;
  if ((*(void *)&self->_has & 0x1000000000000) != 0)
  {
LABEL_16:
    *((_DWORD *)a3 + 54) = self->_wifiWifiEstThoughtputConfidence;
    *((void *)a3 + 28) |= 0x1000000000000uLL;
  }
LABEL_17:
  if (self->_cellRatType) {
    [a3 setCellRatType:];
  }
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x80) != 0)
  {
    *((_DWORD *)a3 + 10) = self->_cellLteRSRP;
    *((void *)a3 + 28) |= 0x80uLL;
    $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
    if ((*(_WORD *)&v6 & 0x200) == 0)
    {
LABEL_21:
      if ((*(_WORD *)&v6 & 0x100) == 0) {
        goto LABEL_22;
      }
      goto LABEL_74;
    }
  }
  else if ((*(_WORD *)&v6 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)a3 + 12) = self->_cellLteSNR;
  *((void *)a3 + 28) |= 0x200uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x100) == 0)
  {
LABEL_22:
    if ((*(_WORD *)&v6 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_75;
  }
LABEL_74:
  *((_DWORD *)a3 + 11) = self->_cellLteRSRQ;
  *((void *)a3 + 28) |= 0x100uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x4000) == 0)
  {
LABEL_23:
    if ((*(_WORD *)&v6 & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
LABEL_75:
  *((_DWORD *)a3 + 17) = self->_cellNrRSRP;
  *((void *)a3 + 28) |= 0x4000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x8000) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v6 & 0x10000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_77;
  }
LABEL_76:
  *((_DWORD *)a3 + 18) = self->_cellNrRSRQ;
  *((void *)a3 + 28) |= 0x8000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x10000) == 0)
  {
LABEL_25:
    if ((*(unsigned char *)&v6 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_78;
  }
LABEL_77:
  *((_DWORD *)a3 + 19) = self->_cellNrSNR;
  *((void *)a3 + 28) |= 0x10000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 4) == 0)
  {
LABEL_26:
    if ((*(_DWORD *)&v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_79;
  }
LABEL_78:
  *((_DWORD *)a3 + 5) = self->_cellDataLQM;
  *((void *)a3 + 28) |= 4uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v6 & 0x2000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_80;
  }
LABEL_79:
  *((_DWORD *)a3 + 24) = self->_cellRrcState;
  *((void *)a3 + 28) |= 0x40000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x2000) == 0)
  {
LABEL_28:
    if ((*(unsigned char *)&v6 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_81;
  }
LABEL_80:
  *((_DWORD *)a3 + 16) = self->_cellNrFR2active;
  *((void *)a3 + 28) |= 0x2000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x40) == 0)
  {
LABEL_29:
    if ((*(_WORD *)&v6 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_82;
  }
LABEL_81:
  *((_DWORD *)a3 + 9) = self->_cellLteEstimatedThroughput;
  *((void *)a3 + 28) |= 0x40uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x1000) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v6 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_83;
  }
LABEL_82:
  *((_DWORD *)a3 + 15) = self->_cellNrEstimatedThroughput;
  *((void *)a3 + 28) |= 0x1000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((*(unsigned char *)&v6 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_84;
  }
LABEL_83:
  *((_DWORD *)a3 + 20) = self->_cellNsaEnabled;
  *((void *)a3 + 28) |= 0x20000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 8) == 0)
  {
LABEL_32:
    if ((*(_DWORD *)&v6 & 0x100000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_85;
  }
LABEL_84:
  *((_DWORD *)a3 + 6) = self->_cellDlBw;
  *((void *)a3 + 28) |= 8uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x100000) == 0)
  {
LABEL_33:
    if ((*(_WORD *)&v6 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_86;
  }
LABEL_85:
  *((_DWORD *)a3 + 26) = self->_cellUlBw;
  *((void *)a3 + 28) |= 0x100000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x400) == 0)
  {
LABEL_34:
    if ((*(_WORD *)&v6 & 0x800) == 0) {
      goto LABEL_35;
    }
    goto LABEL_87;
  }
LABEL_86:
  *((_DWORD *)a3 + 13) = self->_cellMaxDlCaNumConfigured;
  *((void *)a3 + 28) |= 0x400uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_WORD *)&v6 & 0x800) == 0)
  {
LABEL_35:
    if ((*(unsigned char *)&v6 & 0x20) == 0) {
      goto LABEL_36;
    }
    goto LABEL_88;
  }
LABEL_87:
  *((_DWORD *)a3 + 14) = self->_cellMaxUlCaNumConfigured;
  *((void *)a3 + 28) |= 0x800uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x20) == 0)
  {
LABEL_36:
    if ((*(unsigned char *)&v6 & 0x10) == 0) {
      goto LABEL_37;
    }
    goto LABEL_89;
  }
LABEL_88:
  *((_DWORD *)a3 + 8) = self->_cellEstimatedLoad;
  *((void *)a3 + 28) |= 0x20uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 0x10) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v6 & 0x8000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_90;
  }
LABEL_89:
  *((_DWORD *)a3 + 7) = self->_cellEstimatedBw;
  *((void *)a3 + 28) |= 0x10uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x8000000) == 0)
  {
LABEL_38:
    if ((*(void *)&v6 & 0x2000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_91;
  }
LABEL_90:
  *((_DWORD *)a3 + 33) = self->_recommendedlink;
  *((void *)a3 + 28) |= 0x8000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((*(_DWORD *)&v6 & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_92;
  }
LABEL_91:
  *((unsigned char *)a3 + 220) = self->_fr2DBRecommendation;
  *((void *)a3 + 28) |= 0x2000000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x800000) == 0)
  {
LABEL_40:
    if ((*(_DWORD *)&v6 & 0x1000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_93;
  }
LABEL_92:
  *((_DWORD *)a3 + 29) = self->_locationDBFR1Count;
  *((void *)a3 + 28) |= 0x800000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x1000000) == 0)
  {
LABEL_41:
    if ((*(void *)&v6 & 0x4000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_94;
  }
LABEL_93:
  *((_DWORD *)a3 + 30) = self->_locationDBFR2Count;
  *((void *)a3 + 28) |= 0x1000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000000) == 0)
  {
LABEL_42:
    if ((*(void *)&v6 & 0x100000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_95;
  }
LABEL_94:
  *((unsigned char *)a3 + 221) = self->_highThermalTemperatureNotification;
  *((void *)a3 + 28) |= 0x4000000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x100000000) == 0)
  {
LABEL_43:
    if ((*(_DWORD *)&v6 & 0x80000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_96;
  }
LABEL_95:
  *((_DWORD *)a3 + 38) = self->_wiFiThroughput;
  *((void *)a3 + 28) |= 0x100000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000000) == 0)
  {
LABEL_44:
    if ((*(_DWORD *)&v6 & 0x40000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_97;
  }
LABEL_96:
  *((_DWORD *)a3 + 37) = self->_wiFiPredictedThroughput;
  *((void *)a3 + 28) |= 0x80000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x40000000) == 0)
  {
LABEL_45:
    if ((*(void *)&v6 & 0x4000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_98;
  }
LABEL_97:
  *((_DWORD *)a3 + 36) = self->_wRMRecommendationReason;
  *((void *)a3 + 28) |= 0x40000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x4000000000) == 0)
  {
LABEL_46:
    if ((*(void *)&v6 & 0x2000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_99;
  }
LABEL_98:
  *((_DWORD *)a3 + 44) = self->_wifiRecommendationScore;
  *((void *)a3 + 28) |= 0x4000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(void *)&v6 & 0x2000000000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v6 & 0x400000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_100;
  }
LABEL_99:
  *((_DWORD *)a3 + 43) = self->_wifiRecommendationConfidence;
  *((void *)a3 + 28) |= 0x2000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x400000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v6 & 0x200000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_101;
  }
LABEL_100:
  *((_DWORD *)a3 + 28) = self->_cellularRecommendationScore;
  *((void *)a3 + 28) |= 0x400000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x200000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v6 & 0x2000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_102;
  }
LABEL_101:
  *((_DWORD *)a3 + 27) = self->_cellularRecommendationConfidence;
  *((void *)a3 + 28) |= 0x200000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x2000000) == 0)
  {
LABEL_50:
    if ((*(_DWORD *)&v6 & 0x4000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_103;
  }
LABEL_102:
  *((_DWORD *)a3 + 31) = self->_radioCoverage;
  *((void *)a3 + 28) |= 0x2000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x4000000) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v6 & 0x20000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_104;
  }
LABEL_103:
  *((_DWORD *)a3 + 32) = self->_radioFrequency;
  *((void *)a3 + 28) |= 0x4000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x20000000) == 0)
  {
LABEL_52:
    if ((*(unsigned char *)&v6 & 2) == 0) {
      goto LABEL_53;
    }
    goto LABEL_105;
  }
LABEL_104:
  *((_DWORD *)a3 + 35) = self->_triggerReason;
  *((void *)a3 + 28) |= 0x20000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(unsigned char *)&v6 & 2) == 0)
  {
LABEL_53:
    if ((*(_DWORD *)&v6 & 0x80000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_106;
  }
LABEL_105:
  *((_DWORD *)a3 + 4) = self->_applicationCategory;
  *((void *)a3 + 28) |= 2uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v6 = self->_has;
  if ((*(_DWORD *)&v6 & 0x80000) == 0)
  {
LABEL_54:
    if ((*(_DWORD *)&v6 & 0x10000000) == 0) {
      return;
    }
    goto LABEL_55;
  }
LABEL_106:
  *((_DWORD *)a3 + 25) = self->_cellTotalMimoLayers;
  *((void *)a3 + 28) |= 0x80000uLL;
  if ((*(void *)&self->_has & 0x10000000) == 0) {
    return;
  }
LABEL_55:
  *((_DWORD *)a3 + 34) = self->_totalNrBandwidth;
  *((void *)a3 + 28) |= 0x10000000uLL;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(void *)(v5 + 224) |= 1uLL;
    $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
    if ((*(void *)&has & 0x8000000000) == 0)
    {
LABEL_3:
      if ((*(void *)&has & 0x20000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_57;
    }
  }
  else if ((*(void *)&has & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 180) = self->_wifiRssi;
  *(void *)(v5 + 224) |= 0x8000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x20000000000) == 0)
  {
LABEL_4:
    if ((*(void *)&has & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_58;
  }
LABEL_57:
  *(_DWORD *)(v5 + 188) = self->_wifiSnr;
  *(void *)(v5 + 224) |= 0x20000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x80000000000) == 0)
  {
LABEL_5:
    if ((*(void *)&has & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_59;
  }
LABEL_58:
  *(_DWORD *)(v5 + 196) = self->_wifiTxPER;
  *(void *)(v5 + 224) |= 0x80000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x10000000000) == 0)
  {
LABEL_6:
    if ((*(void *)&has & 0x400000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_60;
  }
LABEL_59:
  *(_DWORD *)(v5 + 184) = self->_wifiRxRetry;
  *(void *)(v5 + 224) |= 0x10000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x400000000) == 0)
  {
LABEL_7:
    if ((*(void *)&has & 0x1000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_61;
  }
LABEL_60:
  *(_DWORD *)(v5 + 160) = self->_wifiCca;
  *(void *)(v5 + 224) |= 0x400000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x1000000000) == 0)
  {
LABEL_8:
    if ((*(void *)&has & 0x40000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_62;
  }
LABEL_61:
  *(_DWORD *)(v5 + 168) = self->_wifiQbssLoad;
  *(void *)(v5 + 224) |= 0x1000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x40000000000) == 0)
  {
LABEL_9:
    if ((*(void *)&has & 0x200000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_63;
  }
LABEL_62:
  *(_DWORD *)(v5 + 192) = self->_wifiStationCount;
  *(void *)(v5 + 224) |= 0x40000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x200000000) == 0)
  {
LABEL_10:
    if ((*(void *)&has & 0x800000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_64;
  }
LABEL_63:
  *(_DWORD *)(v5 + 156) = self->_wifPoi;
  *(void *)(v5 + 224) |= 0x200000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x800000000000) == 0)
  {
LABEL_11:
    if ((*(void *)&has & 0x200000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_65;
  }
LABEL_64:
  *(_DWORD *)(v5 + 212) = self->_wifiWgtAVGRSSI;
  *(void *)(v5 + 224) |= 0x800000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x200000000000) == 0)
  {
LABEL_12:
    if ((*(void *)&has & 0x400000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_66;
  }
LABEL_65:
  *(_DWORD *)(v5 + 204) = self->_wifiWghtAVGSNR;
  *(void *)(v5 + 224) |= 0x200000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x400000000000) == 0)
  {
LABEL_13:
    if ((*(void *)&has & 0x100000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_67;
  }
LABEL_66:
  *(_DWORD *)(v5 + 208) = self->_wifiWghtAVGTXPHYRATE;
  *(void *)(v5 + 224) |= 0x400000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x100000000000) == 0)
  {
LABEL_14:
    if ((*(void *)&has & 0x800000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_68;
  }
LABEL_67:
  *(_DWORD *)(v5 + 200) = self->_wifiWghtAVGRXPHYRATE;
  *(void *)(v5 + 224) |= 0x100000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if ((*(void *)&has & 0x800000000) == 0)
  {
LABEL_15:
    if ((*(void *)&has & 0x1000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_68:
  *(_DWORD *)(v5 + 164) = self->_wifiEstThoughtput;
  *(void *)(v5 + 224) |= 0x800000000uLL;
  if ((*(void *)&self->_has & 0x1000000000000) != 0)
  {
LABEL_16:
    *(_DWORD *)(v5 + 216) = self->_wifiWifiEstThoughtputConfidence;
    *(void *)(v5 + 224) |= 0x1000000000000uLL;
  }
LABEL_17:

  *(void *)(v6 + 88) = [(NSString *)self->_cellRatType copyWithZone:a3];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 40) = self->_cellLteRSRP;
    *(void *)(v6 + 224) |= 0x80uLL;
    $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
    if ((*(_WORD *)&v8 & 0x200) == 0)
    {
LABEL_19:
      if ((*(_WORD *)&v8 & 0x100) == 0) {
        goto LABEL_20;
      }
      goto LABEL_72;
    }
  }
  else if ((*(_WORD *)&v8 & 0x200) == 0)
  {
    goto LABEL_19;
  }
  *(_DWORD *)(v6 + 48) = self->_cellLteSNR;
  *(void *)(v6 + 224) |= 0x200uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x100) == 0)
  {
LABEL_20:
    if ((*(_WORD *)&v8 & 0x4000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_73;
  }
LABEL_72:
  *(_DWORD *)(v6 + 44) = self->_cellLteRSRQ;
  *(void *)(v6 + 224) |= 0x100uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x4000) == 0)
  {
LABEL_21:
    if ((*(_WORD *)&v8 & 0x8000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_74;
  }
LABEL_73:
  *(_DWORD *)(v6 + 68) = self->_cellNrRSRP;
  *(void *)(v6 + 224) |= 0x4000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x8000) == 0)
  {
LABEL_22:
    if ((*(_DWORD *)&v8 & 0x10000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_75;
  }
LABEL_74:
  *(_DWORD *)(v6 + 72) = self->_cellNrRSRQ;
  *(void *)(v6 + 224) |= 0x8000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x10000) == 0)
  {
LABEL_23:
    if ((*(unsigned char *)&v8 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
LABEL_75:
  *(_DWORD *)(v6 + 76) = self->_cellNrSNR;
  *(void *)(v6 + 224) |= 0x10000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 4) == 0)
  {
LABEL_24:
    if ((*(_DWORD *)&v8 & 0x40000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_77;
  }
LABEL_76:
  *(_DWORD *)(v6 + 20) = self->_cellDataLQM;
  *(void *)(v6 + 224) |= 4uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000) == 0)
  {
LABEL_25:
    if ((*(_WORD *)&v8 & 0x2000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_78;
  }
LABEL_77:
  *(_DWORD *)(v6 + 96) = self->_cellRrcState;
  *(void *)(v6 + 224) |= 0x40000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x2000) == 0)
  {
LABEL_26:
    if ((*(unsigned char *)&v8 & 0x40) == 0) {
      goto LABEL_27;
    }
    goto LABEL_79;
  }
LABEL_78:
  *(_DWORD *)(v6 + 64) = self->_cellNrFR2active;
  *(void *)(v6 + 224) |= 0x2000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x40) == 0)
  {
LABEL_27:
    if ((*(_WORD *)&v8 & 0x1000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_80;
  }
LABEL_79:
  *(_DWORD *)(v6 + 36) = self->_cellLteEstimatedThroughput;
  *(void *)(v6 + 224) |= 0x40uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x1000) == 0)
  {
LABEL_28:
    if ((*(_DWORD *)&v8 & 0x20000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_81;
  }
LABEL_80:
  *(_DWORD *)(v6 + 60) = self->_cellNrEstimatedThroughput;
  *(void *)(v6 + 224) |= 0x1000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000) == 0)
  {
LABEL_29:
    if ((*(unsigned char *)&v8 & 8) == 0) {
      goto LABEL_30;
    }
    goto LABEL_82;
  }
LABEL_81:
  *(_DWORD *)(v6 + 80) = self->_cellNsaEnabled;
  *(void *)(v6 + 224) |= 0x20000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 8) == 0)
  {
LABEL_30:
    if ((*(_DWORD *)&v8 & 0x100000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_83;
  }
LABEL_82:
  *(_DWORD *)(v6 + 24) = self->_cellDlBw;
  *(void *)(v6 + 224) |= 8uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x100000) == 0)
  {
LABEL_31:
    if ((*(_WORD *)&v8 & 0x400) == 0) {
      goto LABEL_32;
    }
    goto LABEL_84;
  }
LABEL_83:
  *(_DWORD *)(v6 + 104) = self->_cellUlBw;
  *(void *)(v6 + 224) |= 0x100000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x400) == 0)
  {
LABEL_32:
    if ((*(_WORD *)&v8 & 0x800) == 0) {
      goto LABEL_33;
    }
    goto LABEL_85;
  }
LABEL_84:
  *(_DWORD *)(v6 + 52) = self->_cellMaxDlCaNumConfigured;
  *(void *)(v6 + 224) |= 0x400uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_WORD *)&v8 & 0x800) == 0)
  {
LABEL_33:
    if ((*(unsigned char *)&v8 & 0x20) == 0) {
      goto LABEL_34;
    }
    goto LABEL_86;
  }
LABEL_85:
  *(_DWORD *)(v6 + 56) = self->_cellMaxUlCaNumConfigured;
  *(void *)(v6 + 224) |= 0x800uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x20) == 0)
  {
LABEL_34:
    if ((*(unsigned char *)&v8 & 0x10) == 0) {
      goto LABEL_35;
    }
    goto LABEL_87;
  }
LABEL_86:
  *(_DWORD *)(v6 + 32) = self->_cellEstimatedLoad;
  *(void *)(v6 + 224) |= 0x20uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 0x10) == 0)
  {
LABEL_35:
    if ((*(_DWORD *)&v8 & 0x8000000) == 0) {
      goto LABEL_36;
    }
    goto LABEL_88;
  }
LABEL_87:
  *(_DWORD *)(v6 + 28) = self->_cellEstimatedBw;
  *(void *)(v6 + 224) |= 0x10uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x8000000) == 0)
  {
LABEL_36:
    if ((*(void *)&v8 & 0x2000000000000) == 0) {
      goto LABEL_37;
    }
    goto LABEL_89;
  }
LABEL_88:
  *(_DWORD *)(v6 + 132) = self->_recommendedlink;
  *(void *)(v6 + 224) |= 0x8000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(void *)&v8 & 0x2000000000000) == 0)
  {
LABEL_37:
    if ((*(_DWORD *)&v8 & 0x800000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_90;
  }
LABEL_89:
  *(unsigned char *)(v6 + 220) = self->_fr2DBRecommendation;
  *(void *)(v6 + 224) |= 0x2000000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x800000) == 0)
  {
LABEL_38:
    if ((*(_DWORD *)&v8 & 0x1000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_91;
  }
LABEL_90:
  *(_DWORD *)(v6 + 116) = self->_locationDBFR1Count;
  *(void *)(v6 + 224) |= 0x800000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x1000000) == 0)
  {
LABEL_39:
    if ((*(void *)&v8 & 0x4000000000000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_92;
  }
LABEL_91:
  *(_DWORD *)(v6 + 120) = self->_locationDBFR2Count;
  *(void *)(v6 + 224) |= 0x1000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(void *)&v8 & 0x4000000000000) == 0)
  {
LABEL_40:
    if ((*(void *)&v8 & 0x100000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_93;
  }
LABEL_92:
  *(unsigned char *)(v6 + 221) = self->_highThermalTemperatureNotification;
  *(void *)(v6 + 224) |= 0x4000000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(void *)&v8 & 0x100000000) == 0)
  {
LABEL_41:
    if ((*(_DWORD *)&v8 & 0x80000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_94;
  }
LABEL_93:
  *(_DWORD *)(v6 + 152) = self->_wiFiThroughput;
  *(void *)(v6 + 224) |= 0x100000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000000) == 0)
  {
LABEL_42:
    if ((*(_DWORD *)&v8 & 0x40000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_95;
  }
LABEL_94:
  *(_DWORD *)(v6 + 148) = self->_wiFiPredictedThroughput;
  *(void *)(v6 + 224) |= 0x80000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x40000000) == 0)
  {
LABEL_43:
    if ((*(void *)&v8 & 0x4000000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_96;
  }
LABEL_95:
  *(_DWORD *)(v6 + 144) = self->_wRMRecommendationReason;
  *(void *)(v6 + 224) |= 0x40000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(void *)&v8 & 0x4000000000) == 0)
  {
LABEL_44:
    if ((*(void *)&v8 & 0x2000000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_97;
  }
LABEL_96:
  *(_DWORD *)(v6 + 176) = self->_wifiRecommendationScore;
  *(void *)(v6 + 224) |= 0x4000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(void *)&v8 & 0x2000000000) == 0)
  {
LABEL_45:
    if ((*(_DWORD *)&v8 & 0x400000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_98;
  }
LABEL_97:
  *(_DWORD *)(v6 + 172) = self->_wifiRecommendationConfidence;
  *(void *)(v6 + 224) |= 0x2000000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x400000) == 0)
  {
LABEL_46:
    if ((*(_DWORD *)&v8 & 0x200000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_99;
  }
LABEL_98:
  *(_DWORD *)(v6 + 112) = self->_cellularRecommendationScore;
  *(void *)(v6 + 224) |= 0x400000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x200000) == 0)
  {
LABEL_47:
    if ((*(_DWORD *)&v8 & 0x2000000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_100;
  }
LABEL_99:
  *(_DWORD *)(v6 + 108) = self->_cellularRecommendationConfidence;
  *(void *)(v6 + 224) |= 0x200000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x2000000) == 0)
  {
LABEL_48:
    if ((*(_DWORD *)&v8 & 0x4000000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_101;
  }
LABEL_100:
  *(_DWORD *)(v6 + 124) = self->_radioCoverage;
  *(void *)(v6 + 224) |= 0x2000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x4000000) == 0)
  {
LABEL_49:
    if ((*(_DWORD *)&v8 & 0x20000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_102;
  }
LABEL_101:
  *(_DWORD *)(v6 + 128) = self->_radioFrequency;
  *(void *)(v6 + 224) |= 0x4000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x20000000) == 0)
  {
LABEL_50:
    if ((*(unsigned char *)&v8 & 2) == 0) {
      goto LABEL_51;
    }
    goto LABEL_103;
  }
LABEL_102:
  *(_DWORD *)(v6 + 140) = self->_triggerReason;
  *(void *)(v6 + 224) |= 0x20000000uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(unsigned char *)&v8 & 2) == 0)
  {
LABEL_51:
    if ((*(_DWORD *)&v8 & 0x80000) == 0) {
      goto LABEL_52;
    }
LABEL_104:
    *(_DWORD *)(v6 + 100) = self->_cellTotalMimoLayers;
    *(void *)(v6 + 224) |= 0x80000uLL;
    if ((*(void *)&self->_has & 0x10000000) == 0) {
      return (id)v6;
    }
    goto LABEL_53;
  }
LABEL_103:
  *(_DWORD *)(v6 + 16) = self->_applicationCategory;
  *(void *)(v6 + 224) |= 2uLL;
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v8 = self->_has;
  if ((*(_DWORD *)&v8 & 0x80000) != 0) {
    goto LABEL_104;
  }
LABEL_52:
  if ((*(_DWORD *)&v8 & 0x10000000) != 0)
  {
LABEL_53:
    *(_DWORD *)(v6 + 136) = self->_totalNrBandwidth;
    *(void *)(v6 + 224) |= 0x10000000uLL;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  uint64_t v7 = *((void *)a3 + 28);
  if (*(unsigned char *)&has)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_265;
    }
  }
  else if (v7)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x8000000000) != 0)
  {
    if ((v7 & 0x8000000000) == 0 || self->_wifiRssi != *((_DWORD *)a3 + 45)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x8000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x20000000000) != 0)
  {
    if ((v7 & 0x20000000000) == 0 || self->_wifiSnr != *((_DWORD *)a3 + 47)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x20000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x80000000000) != 0)
  {
    if ((v7 & 0x80000000000) == 0 || self->_wifiTxPER != *((_DWORD *)a3 + 49)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x80000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x10000000000) != 0)
  {
    if ((v7 & 0x10000000000) == 0 || self->_wifiRxRetry != *((_DWORD *)a3 + 46)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x10000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x400000000) != 0)
  {
    if ((v7 & 0x400000000) == 0 || self->_wifiCca != *((_DWORD *)a3 + 40)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x400000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x1000000000) != 0)
  {
    if ((v7 & 0x1000000000) == 0 || self->_wifiQbssLoad != *((_DWORD *)a3 + 42)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x1000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x40000000000) != 0)
  {
    if ((v7 & 0x40000000000) == 0 || self->_wifiStationCount != *((_DWORD *)a3 + 48)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x40000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x200000000) != 0)
  {
    if ((v7 & 0x200000000) == 0 || self->_wifPoi != *((_DWORD *)a3 + 39)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x200000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x800000000000) != 0)
  {
    if ((v7 & 0x800000000000) == 0 || self->_wifiWgtAVGRSSI != *((_DWORD *)a3 + 53)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x800000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x200000000000) != 0)
  {
    if ((v7 & 0x200000000000) == 0 || self->_wifiWghtAVGSNR != *((_DWORD *)a3 + 51)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x200000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x400000000000) != 0)
  {
    if ((v7 & 0x400000000000) == 0 || self->_wifiWghtAVGTXPHYRATE != *((_DWORD *)a3 + 52)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x400000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x100000000000) != 0)
  {
    if ((v7 & 0x100000000000) == 0 || self->_wifiWghtAVGRXPHYRATE != *((_DWORD *)a3 + 50)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x100000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x800000000) != 0)
  {
    if ((v7 & 0x800000000) == 0 || self->_wifiEstThoughtput != *((_DWORD *)a3 + 41)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x800000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
    if ((v7 & 0x1000000000000) == 0 || self->_wifiWifiEstThoughtputConfidence != *((_DWORD *)a3 + 54)) {
      goto LABEL_265;
    }
  }
  else if ((v7 & 0x1000000000000) != 0)
  {
    goto LABEL_265;
  }
  cellRatType = self->_cellRatType;
  if ((unint64_t)cellRatType | *((void *)a3 + 11))
  {
    int v5 = -[NSString isEqual:](cellRatType, "isEqual:");
    if (!v5) {
      return v5;
    }
    $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  }
  uint64_t v9 = *((void *)a3 + 28);
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
    if ((v9 & 0x80) == 0 || self->_cellLteRSRP != *((_DWORD *)a3 + 10)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x80) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x200) != 0)
  {
    if ((v9 & 0x200) == 0 || self->_cellLteSNR != *((_DWORD *)a3 + 12)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x200) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x100) != 0)
  {
    if ((v9 & 0x100) == 0 || self->_cellLteRSRQ != *((_DWORD *)a3 + 11)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x100) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x4000) != 0)
  {
    if ((v9 & 0x4000) == 0 || self->_cellNrRSRP != *((_DWORD *)a3 + 17)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x4000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
    if ((v9 & 0x8000) == 0 || self->_cellNrRSRQ != *((_DWORD *)a3 + 18)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x8000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
    if ((v9 & 0x10000) == 0 || self->_cellNrSNR != *((_DWORD *)a3 + 19)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x10000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 4) != 0)
  {
    if ((v9 & 4) == 0 || self->_cellDataLQM != *((_DWORD *)a3 + 5)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 4) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x40000) != 0)
  {
    if ((v9 & 0x40000) == 0 || self->_cellRrcState != *((_DWORD *)a3 + 24)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x40000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
    if ((v9 & 0x2000) == 0 || self->_cellNrFR2active != *((_DWORD *)a3 + 16)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x2000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
    if ((v9 & 0x40) == 0 || self->_cellLteEstimatedThroughput != *((_DWORD *)a3 + 9)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x40) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
    if ((v9 & 0x1000) == 0 || self->_cellNrEstimatedThroughput != *((_DWORD *)a3 + 15)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x1000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x20000) != 0)
  {
    if ((v9 & 0x20000) == 0 || self->_cellNsaEnabled != *((_DWORD *)a3 + 20)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x20000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 8) != 0)
  {
    if ((v9 & 8) == 0 || self->_cellDlBw != *((_DWORD *)a3 + 6)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 8) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x100000) != 0)
  {
    if ((v9 & 0x100000) == 0 || self->_cellUlBw != *((_DWORD *)a3 + 26)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x100000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x400) != 0)
  {
    if ((v9 & 0x400) == 0 || self->_cellMaxDlCaNumConfigured != *((_DWORD *)a3 + 13)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x400) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_WORD *)&has & 0x800) != 0)
  {
    if ((v9 & 0x800) == 0 || self->_cellMaxUlCaNumConfigured != *((_DWORD *)a3 + 14)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x800) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
    if ((v9 & 0x20) == 0 || self->_cellEstimatedLoad != *((_DWORD *)a3 + 8)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x20) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_cellEstimatedBw != *((_DWORD *)a3 + 7)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x8000000) != 0)
  {
    if ((v9 & 0x8000000) == 0 || self->_recommendedlink != *((_DWORD *)a3 + 33)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x8000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x2000000000000) != 0)
  {
    if ((v9 & 0x2000000000000) == 0) {
      goto LABEL_265;
    }
    if (self->_fr2DBRecommendation)
    {
      if (!*((unsigned char *)a3 + 220)) {
        goto LABEL_265;
      }
    }
    else if (*((unsigned char *)a3 + 220))
    {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x2000000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x800000) != 0)
  {
    if ((v9 & 0x800000) == 0 || self->_locationDBFR1Count != *((_DWORD *)a3 + 29)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x800000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x1000000) != 0)
  {
    if ((v9 & 0x1000000) == 0 || self->_locationDBFR2Count != *((_DWORD *)a3 + 30)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x1000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x4000000000000) != 0)
  {
    if ((v9 & 0x4000000000000) == 0) {
      goto LABEL_265;
    }
    if (self->_highThermalTemperatureNotification)
    {
      if (!*((unsigned char *)a3 + 221)) {
        goto LABEL_265;
      }
    }
    else if (*((unsigned char *)a3 + 221))
    {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x4000000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x100000000) != 0)
  {
    if ((v9 & 0x100000000) == 0 || self->_wiFiThroughput != *((_DWORD *)a3 + 38)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x100000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v9 & 0x80000000) == 0 || self->_wiFiPredictedThroughput != *((_DWORD *)a3 + 37)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x80000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x40000000) != 0)
  {
    if ((v9 & 0x40000000) == 0 || self->_wRMRecommendationReason != *((_DWORD *)a3 + 36)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x40000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x4000000000) != 0)
  {
    if ((v9 & 0x4000000000) == 0 || self->_wifiRecommendationScore != *((_DWORD *)a3 + 44)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x4000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(void *)&has & 0x2000000000) != 0)
  {
    if ((v9 & 0x2000000000) == 0 || self->_wifiRecommendationConfidence != *((_DWORD *)a3 + 43)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x2000000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x400000) != 0)
  {
    if ((v9 & 0x400000) == 0 || self->_cellularRecommendationScore != *((_DWORD *)a3 + 28)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x400000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x200000) != 0)
  {
    if ((v9 & 0x200000) == 0 || self->_cellularRecommendationConfidence != *((_DWORD *)a3 + 27)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x200000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x2000000) != 0)
  {
    if ((v9 & 0x2000000) == 0 || self->_radioCoverage != *((_DWORD *)a3 + 31)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x2000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x4000000) != 0)
  {
    if ((v9 & 0x4000000) == 0 || self->_radioFrequency != *((_DWORD *)a3 + 32)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x4000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x20000000) != 0)
  {
    if ((v9 & 0x20000000) == 0 || self->_triggerReason != *((_DWORD *)a3 + 35)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 0x20000000) != 0)
  {
    goto LABEL_265;
  }
  if ((*(unsigned char *)&has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_applicationCategory != *((_DWORD *)a3 + 4)) {
      goto LABEL_265;
    }
  }
  else if ((v9 & 2) != 0)
  {
    goto LABEL_265;
  }
  if ((*(_DWORD *)&has & 0x80000) == 0)
  {
    if ((v9 & 0x80000) == 0) {
      goto LABEL_261;
    }
LABEL_265:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((v9 & 0x80000) == 0 || self->_cellTotalMimoLayers != *((_DWORD *)a3 + 25)) {
    goto LABEL_265;
  }
LABEL_261:
  LOBYTE(v5) = (*((void *)a3 + 28) & 0x10000000) == 0;
  if ((*(_DWORD *)&has & 0x10000000) != 0)
  {
    if ((v9 & 0x10000000) == 0 || self->_totalNrBandwidth != *((_DWORD *)a3 + 34)) {
      goto LABEL_265;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v57 = 2654435761u * self->_timestamp;
    if ((*(void *)&has & 0x8000000000) != 0)
    {
LABEL_3:
      uint64_t v56 = 2654435761 * self->_wifiRssi;
      if ((*(void *)&has & 0x20000000000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else
  {
    unint64_t v57 = 0;
    if ((*(void *)&has & 0x8000000000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v56 = 0;
  if ((*(void *)&has & 0x20000000000) != 0)
  {
LABEL_4:
    uint64_t v55 = 2654435761 * self->_wifiSnr;
    if ((*(void *)&has & 0x80000000000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v55 = 0;
  if ((*(void *)&has & 0x80000000000) != 0)
  {
LABEL_5:
    uint64_t v54 = 2654435761 * self->_wifiTxPER;
    if ((*(void *)&has & 0x10000000000) != 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v54 = 0;
  if ((*(void *)&has & 0x10000000000) != 0)
  {
LABEL_6:
    uint64_t v53 = 2654435761 * self->_wifiRxRetry;
    if ((*(void *)&has & 0x400000000) != 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v53 = 0;
  if ((*(void *)&has & 0x400000000) != 0)
  {
LABEL_7:
    uint64_t v52 = 2654435761 * self->_wifiCca;
    if ((*(void *)&has & 0x1000000000) != 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v52 = 0;
  if ((*(void *)&has & 0x1000000000) != 0)
  {
LABEL_8:
    uint64_t v51 = 2654435761 * self->_wifiQbssLoad;
    if ((*(void *)&has & 0x40000000000) != 0) {
      goto LABEL_9;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v51 = 0;
  if ((*(void *)&has & 0x40000000000) != 0)
  {
LABEL_9:
    uint64_t v50 = 2654435761 * self->_wifiStationCount;
    if ((*(void *)&has & 0x200000000) != 0) {
      goto LABEL_10;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v50 = 0;
  if ((*(void *)&has & 0x200000000) != 0)
  {
LABEL_10:
    uint64_t v49 = 2654435761 * self->_wifPoi;
    if ((*(void *)&has & 0x800000000000) != 0) {
      goto LABEL_11;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v49 = 0;
  if ((*(void *)&has & 0x800000000000) != 0)
  {
LABEL_11:
    uint64_t v48 = 2654435761 * self->_wifiWgtAVGRSSI;
    if ((*(void *)&has & 0x200000000000) != 0) {
      goto LABEL_12;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v48 = 0;
  if ((*(void *)&has & 0x200000000000) != 0)
  {
LABEL_12:
    uint64_t v47 = 2654435761 * self->_wifiWghtAVGSNR;
    if ((*(void *)&has & 0x400000000000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v47 = 0;
  if ((*(void *)&has & 0x400000000000) != 0)
  {
LABEL_13:
    uint64_t v46 = 2654435761 * self->_wifiWghtAVGTXPHYRATE;
    if ((*(void *)&has & 0x100000000000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v46 = 0;
  if ((*(void *)&has & 0x100000000000) != 0)
  {
LABEL_14:
    uint64_t v45 = 2654435761 * self->_wifiWghtAVGRXPHYRATE;
    if ((*(void *)&has & 0x800000000) != 0) {
      goto LABEL_15;
    }
LABEL_30:
    uint64_t v44 = 0;
    if ((*(void *)&has & 0x1000000000000) != 0) {
      goto LABEL_16;
    }
    goto LABEL_31;
  }
LABEL_29:
  uint64_t v45 = 0;
  if ((*(void *)&has & 0x800000000) == 0) {
    goto LABEL_30;
  }
LABEL_15:
  uint64_t v44 = 2654435761 * self->_wifiEstThoughtput;
  if ((*(void *)&has & 0x1000000000000) != 0)
  {
LABEL_16:
    uint64_t v43 = 2654435761 * self->_wifiWifiEstThoughtputConfidence;
    goto LABEL_32;
  }
LABEL_31:
  uint64_t v43 = 0;
LABEL_32:
  NSUInteger v42 = [(NSString *)self->_cellRatType hash];
  $C55178DCE1A7AB74CCE6B5DAE3DC8A08 v4 = self->_has;
  if ((*(unsigned char *)&v4 & 0x80) != 0)
  {
    uint64_t v41 = 2654435761 * self->_cellLteRSRP;
    if ((*(_WORD *)&v4 & 0x200) != 0)
    {
LABEL_34:
      uint64_t v40 = 2654435761 * self->_cellLteSNR;
      if ((*(_WORD *)&v4 & 0x100) != 0) {
        goto LABEL_35;
      }
      goto LABEL_71;
    }
  }
  else
  {
    uint64_t v41 = 0;
    if ((*(_WORD *)&v4 & 0x200) != 0) {
      goto LABEL_34;
    }
  }
  uint64_t v40 = 0;
  if ((*(_WORD *)&v4 & 0x100) != 0)
  {
LABEL_35:
    uint64_t v39 = 2654435761 * self->_cellLteRSRQ;
    if ((*(_WORD *)&v4 & 0x4000) != 0) {
      goto LABEL_36;
    }
    goto LABEL_72;
  }
LABEL_71:
  uint64_t v39 = 0;
  if ((*(_WORD *)&v4 & 0x4000) != 0)
  {
LABEL_36:
    uint64_t v38 = 2654435761 * self->_cellNrRSRP;
    if ((*(_WORD *)&v4 & 0x8000) != 0) {
      goto LABEL_37;
    }
    goto LABEL_73;
  }
LABEL_72:
  uint64_t v38 = 0;
  if ((*(_WORD *)&v4 & 0x8000) != 0)
  {
LABEL_37:
    uint64_t v37 = 2654435761 * self->_cellNrRSRQ;
    if ((*(_DWORD *)&v4 & 0x10000) != 0) {
      goto LABEL_38;
    }
    goto LABEL_74;
  }
LABEL_73:
  uint64_t v37 = 0;
  if ((*(_DWORD *)&v4 & 0x10000) != 0)
  {
LABEL_38:
    uint64_t v36 = 2654435761 * self->_cellNrSNR;
    if ((*(unsigned char *)&v4 & 4) != 0) {
      goto LABEL_39;
    }
    goto LABEL_75;
  }
LABEL_74:
  uint64_t v36 = 0;
  if ((*(unsigned char *)&v4 & 4) != 0)
  {
LABEL_39:
    uint64_t v35 = 2654435761 * self->_cellDataLQM;
    if ((*(_DWORD *)&v4 & 0x40000) != 0) {
      goto LABEL_40;
    }
    goto LABEL_76;
  }
LABEL_75:
  uint64_t v35 = 0;
  if ((*(_DWORD *)&v4 & 0x40000) != 0)
  {
LABEL_40:
    uint64_t v34 = 2654435761 * self->_cellRrcState;
    if ((*(_WORD *)&v4 & 0x2000) != 0) {
      goto LABEL_41;
    }
    goto LABEL_77;
  }
LABEL_76:
  uint64_t v34 = 0;
  if ((*(_WORD *)&v4 & 0x2000) != 0)
  {
LABEL_41:
    uint64_t v33 = 2654435761 * self->_cellNrFR2active;
    if ((*(unsigned char *)&v4 & 0x40) != 0) {
      goto LABEL_42;
    }
    goto LABEL_78;
  }
LABEL_77:
  uint64_t v33 = 0;
  if ((*(unsigned char *)&v4 & 0x40) != 0)
  {
LABEL_42:
    uint64_t v32 = 2654435761 * self->_cellLteEstimatedThroughput;
    if ((*(_WORD *)&v4 & 0x1000) != 0) {
      goto LABEL_43;
    }
    goto LABEL_79;
  }
LABEL_78:
  uint64_t v32 = 0;
  if ((*(_WORD *)&v4 & 0x1000) != 0)
  {
LABEL_43:
    uint64_t v5 = 2654435761 * self->_cellNrEstimatedThroughput;
    if ((*(_DWORD *)&v4 & 0x20000) != 0) {
      goto LABEL_44;
    }
    goto LABEL_80;
  }
LABEL_79:
  uint64_t v5 = 0;
  if ((*(_DWORD *)&v4 & 0x20000) != 0)
  {
LABEL_44:
    uint64_t v6 = 2654435761 * self->_cellNsaEnabled;
    if ((*(unsigned char *)&v4 & 8) != 0) {
      goto LABEL_45;
    }
    goto LABEL_81;
  }
LABEL_80:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&v4 & 8) != 0)
  {
LABEL_45:
    uint64_t v7 = 2654435761 * self->_cellDlBw;
    if ((*(_DWORD *)&v4 & 0x100000) != 0) {
      goto LABEL_46;
    }
    goto LABEL_82;
  }
LABEL_81:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&v4 & 0x100000) != 0)
  {
LABEL_46:
    uint64_t v8 = 2654435761 * self->_cellUlBw;
    if ((*(_WORD *)&v4 & 0x400) != 0) {
      goto LABEL_47;
    }
    goto LABEL_83;
  }
LABEL_82:
  uint64_t v8 = 0;
  if ((*(_WORD *)&v4 & 0x400) != 0)
  {
LABEL_47:
    uint64_t v9 = 2654435761 * self->_cellMaxDlCaNumConfigured;
    if ((*(_WORD *)&v4 & 0x800) != 0) {
      goto LABEL_48;
    }
    goto LABEL_84;
  }
LABEL_83:
  uint64_t v9 = 0;
  if ((*(_WORD *)&v4 & 0x800) != 0)
  {
LABEL_48:
    uint64_t v10 = 2654435761 * self->_cellMaxUlCaNumConfigured;
    if ((*(unsigned char *)&v4 & 0x20) != 0) {
      goto LABEL_49;
    }
    goto LABEL_85;
  }
LABEL_84:
  uint64_t v10 = 0;
  if ((*(unsigned char *)&v4 & 0x20) != 0)
  {
LABEL_49:
    uint64_t v11 = 2654435761 * self->_cellEstimatedLoad;
    if ((*(unsigned char *)&v4 & 0x10) != 0) {
      goto LABEL_50;
    }
    goto LABEL_86;
  }
LABEL_85:
  uint64_t v11 = 0;
  if ((*(unsigned char *)&v4 & 0x10) != 0)
  {
LABEL_50:
    uint64_t v12 = 2654435761 * self->_cellEstimatedBw;
    if ((*(_DWORD *)&v4 & 0x8000000) != 0) {
      goto LABEL_51;
    }
    goto LABEL_87;
  }
LABEL_86:
  uint64_t v12 = 0;
  if ((*(_DWORD *)&v4 & 0x8000000) != 0)
  {
LABEL_51:
    uint64_t v13 = 2654435761 * self->_recommendedlink;
    if ((*(void *)&v4 & 0x2000000000000) != 0) {
      goto LABEL_52;
    }
    goto LABEL_88;
  }
LABEL_87:
  uint64_t v13 = 0;
  if ((*(void *)&v4 & 0x2000000000000) != 0)
  {
LABEL_52:
    uint64_t v14 = 2654435761 * self->_fr2DBRecommendation;
    if ((*(_DWORD *)&v4 & 0x800000) != 0) {
      goto LABEL_53;
    }
    goto LABEL_89;
  }
LABEL_88:
  uint64_t v14 = 0;
  if ((*(_DWORD *)&v4 & 0x800000) != 0)
  {
LABEL_53:
    uint64_t v15 = 2654435761 * self->_locationDBFR1Count;
    if ((*(_DWORD *)&v4 & 0x1000000) != 0) {
      goto LABEL_54;
    }
    goto LABEL_90;
  }
LABEL_89:
  uint64_t v15 = 0;
  if ((*(_DWORD *)&v4 & 0x1000000) != 0)
  {
LABEL_54:
    uint64_t v16 = 2654435761 * self->_locationDBFR2Count;
    if ((*(void *)&v4 & 0x4000000000000) != 0) {
      goto LABEL_55;
    }
    goto LABEL_91;
  }
LABEL_90:
  uint64_t v16 = 0;
  if ((*(void *)&v4 & 0x4000000000000) != 0)
  {
LABEL_55:
    uint64_t v17 = 2654435761 * self->_highThermalTemperatureNotification;
    if ((*(void *)&v4 & 0x100000000) != 0) {
      goto LABEL_56;
    }
    goto LABEL_92;
  }
LABEL_91:
  uint64_t v17 = 0;
  if ((*(void *)&v4 & 0x100000000) != 0)
  {
LABEL_56:
    uint64_t v18 = 2654435761 * self->_wiFiThroughput;
    if ((*(_DWORD *)&v4 & 0x80000000) != 0) {
      goto LABEL_57;
    }
    goto LABEL_93;
  }
LABEL_92:
  uint64_t v18 = 0;
  if ((*(_DWORD *)&v4 & 0x80000000) != 0)
  {
LABEL_57:
    uint64_t v19 = 2654435761 * self->_wiFiPredictedThroughput;
    if ((*(_DWORD *)&v4 & 0x40000000) != 0) {
      goto LABEL_58;
    }
    goto LABEL_94;
  }
LABEL_93:
  uint64_t v19 = 0;
  if ((*(_DWORD *)&v4 & 0x40000000) != 0)
  {
LABEL_58:
    uint64_t v20 = 2654435761 * self->_wRMRecommendationReason;
    if ((*(void *)&v4 & 0x4000000000) != 0) {
      goto LABEL_59;
    }
    goto LABEL_95;
  }
LABEL_94:
  uint64_t v20 = 0;
  if ((*(void *)&v4 & 0x4000000000) != 0)
  {
LABEL_59:
    uint64_t v21 = 2654435761 * self->_wifiRecommendationScore;
    if ((*(void *)&v4 & 0x2000000000) != 0) {
      goto LABEL_60;
    }
    goto LABEL_96;
  }
LABEL_95:
  uint64_t v21 = 0;
  if ((*(void *)&v4 & 0x2000000000) != 0)
  {
LABEL_60:
    uint64_t v22 = 2654435761 * self->_wifiRecommendationConfidence;
    if ((*(_DWORD *)&v4 & 0x400000) != 0) {
      goto LABEL_61;
    }
    goto LABEL_97;
  }
LABEL_96:
  uint64_t v22 = 0;
  if ((*(_DWORD *)&v4 & 0x400000) != 0)
  {
LABEL_61:
    uint64_t v23 = 2654435761 * self->_cellularRecommendationScore;
    if ((*(_DWORD *)&v4 & 0x200000) != 0) {
      goto LABEL_62;
    }
    goto LABEL_98;
  }
LABEL_97:
  uint64_t v23 = 0;
  if ((*(_DWORD *)&v4 & 0x200000) != 0)
  {
LABEL_62:
    uint64_t v24 = 2654435761 * self->_cellularRecommendationConfidence;
    if ((*(_DWORD *)&v4 & 0x2000000) != 0) {
      goto LABEL_63;
    }
    goto LABEL_99;
  }
LABEL_98:
  uint64_t v24 = 0;
  if ((*(_DWORD *)&v4 & 0x2000000) != 0)
  {
LABEL_63:
    uint64_t v25 = 2654435761 * self->_radioCoverage;
    if ((*(_DWORD *)&v4 & 0x4000000) != 0) {
      goto LABEL_64;
    }
    goto LABEL_100;
  }
LABEL_99:
  uint64_t v25 = 0;
  if ((*(_DWORD *)&v4 & 0x4000000) != 0)
  {
LABEL_64:
    uint64_t v26 = 2654435761 * self->_radioFrequency;
    if ((*(_DWORD *)&v4 & 0x20000000) != 0) {
      goto LABEL_65;
    }
    goto LABEL_101;
  }
LABEL_100:
  uint64_t v26 = 0;
  if ((*(_DWORD *)&v4 & 0x20000000) != 0)
  {
LABEL_65:
    uint64_t v27 = 2654435761 * self->_triggerReason;
    if ((*(unsigned char *)&v4 & 2) != 0) {
      goto LABEL_66;
    }
    goto LABEL_102;
  }
LABEL_101:
  uint64_t v27 = 0;
  if ((*(unsigned char *)&v4 & 2) != 0)
  {
LABEL_66:
    uint64_t v28 = 2654435761 * self->_applicationCategory;
    if ((*(_DWORD *)&v4 & 0x80000) != 0) {
      goto LABEL_67;
    }
LABEL_103:
    uint64_t v29 = 0;
    if ((*(_DWORD *)&v4 & 0x10000000) != 0) {
      goto LABEL_68;
    }
LABEL_104:
    uint64_t v30 = 0;
    return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v42 ^ v35 ^ v34 ^ v33 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
  }
LABEL_102:
  uint64_t v28 = 0;
  if ((*(_DWORD *)&v4 & 0x80000) == 0) {
    goto LABEL_103;
  }
LABEL_67:
  uint64_t v29 = 2654435761 * self->_cellTotalMimoLayers;
  if ((*(_DWORD *)&v4 & 0x10000000) == 0) {
    goto LABEL_104;
  }
LABEL_68:
  uint64_t v30 = 2654435761 * self->_totalNrBandwidth;
  return v56 ^ v57 ^ v55 ^ v54 ^ v53 ^ v52 ^ v51 ^ v50 ^ v49 ^ v48 ^ v47 ^ v46 ^ v45 ^ v44 ^ v43 ^ v41 ^ v40 ^ v39 ^ v38 ^ v37 ^ v36 ^ v42 ^ v35 ^ v34 ^ v33 ^ v32 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19 ^ v20 ^ v21 ^ v22 ^ v23 ^ v24 ^ v25 ^ v26 ^ v27 ^ v28 ^ v29 ^ v30;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v5 = *((void *)a3 + 28);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(void *)&self->_has |= 1uLL;
    uint64_t v5 = *((void *)a3 + 28);
    if ((v5 & 0x8000000000) == 0)
    {
LABEL_3:
      if ((v5 & 0x20000000000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_59;
    }
  }
  else if ((v5 & 0x8000000000) == 0)
  {
    goto LABEL_3;
  }
  self->_wifiRssi = *((_DWORD *)a3 + 45);
  *(void *)&self->_has |= 0x8000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x20000000000) == 0)
  {
LABEL_4:
    if ((v5 & 0x80000000000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_60;
  }
LABEL_59:
  self->_wifiSnr = *((_DWORD *)a3 + 47);
  *(void *)&self->_has |= 0x20000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x80000000000) == 0)
  {
LABEL_5:
    if ((v5 & 0x10000000000) == 0) {
      goto LABEL_6;
    }
    goto LABEL_61;
  }
LABEL_60:
  self->_wifiTxPER = *((_DWORD *)a3 + 49);
  *(void *)&self->_has |= 0x80000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x10000000000) == 0)
  {
LABEL_6:
    if ((v5 & 0x400000000) == 0) {
      goto LABEL_7;
    }
    goto LABEL_62;
  }
LABEL_61:
  self->_wifiRxRetry = *((_DWORD *)a3 + 46);
  *(void *)&self->_has |= 0x10000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x400000000) == 0)
  {
LABEL_7:
    if ((v5 & 0x1000000000) == 0) {
      goto LABEL_8;
    }
    goto LABEL_63;
  }
LABEL_62:
  self->_wifiCca = *((_DWORD *)a3 + 40);
  *(void *)&self->_has |= 0x400000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x1000000000) == 0)
  {
LABEL_8:
    if ((v5 & 0x40000000000) == 0) {
      goto LABEL_9;
    }
    goto LABEL_64;
  }
LABEL_63:
  self->_wifiQbssLoad = *((_DWORD *)a3 + 42);
  *(void *)&self->_has |= 0x1000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x40000000000) == 0)
  {
LABEL_9:
    if ((v5 & 0x200000000) == 0) {
      goto LABEL_10;
    }
    goto LABEL_65;
  }
LABEL_64:
  self->_wifiStationCount = *((_DWORD *)a3 + 48);
  *(void *)&self->_has |= 0x40000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x200000000) == 0)
  {
LABEL_10:
    if ((v5 & 0x800000000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_66;
  }
LABEL_65:
  self->_wifPoi = *((_DWORD *)a3 + 39);
  *(void *)&self->_has |= 0x200000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x800000000000) == 0)
  {
LABEL_11:
    if ((v5 & 0x200000000000) == 0) {
      goto LABEL_12;
    }
    goto LABEL_67;
  }
LABEL_66:
  self->_wifiWgtAVGRSSI = *((_DWORD *)a3 + 53);
  *(void *)&self->_has |= 0x800000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x200000000000) == 0)
  {
LABEL_12:
    if ((v5 & 0x400000000000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_68;
  }
LABEL_67:
  self->_wifiWghtAVGSNR = *((_DWORD *)a3 + 51);
  *(void *)&self->_has |= 0x200000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x400000000000) == 0)
  {
LABEL_13:
    if ((v5 & 0x100000000000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_69;
  }
LABEL_68:
  self->_wifiWghtAVGTXPHYRATE = *((_DWORD *)a3 + 52);
  *(void *)&self->_has |= 0x400000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x100000000000) == 0)
  {
LABEL_14:
    if ((v5 & 0x800000000) == 0) {
      goto LABEL_15;
    }
    goto LABEL_70;
  }
LABEL_69:
  self->_wifiWghtAVGRXPHYRATE = *((_DWORD *)a3 + 50);
  *(void *)&self->_has |= 0x100000000000uLL;
  uint64_t v5 = *((void *)a3 + 28);
  if ((v5 & 0x800000000) == 0)
  {
LABEL_15:
    if ((v5 & 0x1000000000000) == 0) {
      goto LABEL_17;
    }
    goto LABEL_16;
  }
LABEL_70:
  self->_wifiEstThoughtput = *((_DWORD *)a3 + 41);
  *(void *)&self->_has |= 0x800000000uLL;
  if ((*((void *)a3 + 28) & 0x1000000000000) != 0)
  {
LABEL_16:
    self->_wifiWifiEstThoughtputConfidence = *((_DWORD *)a3 + 54);
    *(void *)&self->_has |= 0x1000000000000uLL;
  }
LABEL_17:
  if (*((void *)a3 + 11)) {
    -[AWDWRMWiFiCell5GData setCellRatType:](self, "setCellRatType:");
  }
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x80) != 0)
  {
    self->_cellLteRSRP = *((_DWORD *)a3 + 10);
    *(void *)&self->_has |= 0x80uLL;
    uint64_t v6 = *((void *)a3 + 28);
    if ((v6 & 0x200) == 0)
    {
LABEL_21:
      if ((v6 & 0x100) == 0) {
        goto LABEL_22;
      }
      goto LABEL_74;
    }
  }
  else if ((v6 & 0x200) == 0)
  {
    goto LABEL_21;
  }
  self->_cellLteSNR = *((_DWORD *)a3 + 12);
  *(void *)&self->_has |= 0x200uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x100) == 0)
  {
LABEL_22:
    if ((v6 & 0x4000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_75;
  }
LABEL_74:
  self->_cellLteRSRQ = *((_DWORD *)a3 + 11);
  *(void *)&self->_has |= 0x100uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x4000) == 0)
  {
LABEL_23:
    if ((v6 & 0x8000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_76;
  }
LABEL_75:
  self->_cellNrRSRP = *((_DWORD *)a3 + 17);
  *(void *)&self->_has |= 0x4000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x8000) == 0)
  {
LABEL_24:
    if ((v6 & 0x10000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_77;
  }
LABEL_76:
  self->_cellNrRSRQ = *((_DWORD *)a3 + 18);
  *(void *)&self->_has |= 0x8000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x10000) == 0)
  {
LABEL_25:
    if ((v6 & 4) == 0) {
      goto LABEL_26;
    }
    goto LABEL_78;
  }
LABEL_77:
  self->_cellNrSNR = *((_DWORD *)a3 + 19);
  *(void *)&self->_has |= 0x10000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 4) == 0)
  {
LABEL_26:
    if ((v6 & 0x40000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_79;
  }
LABEL_78:
  self->_cellDataLQM = *((_DWORD *)a3 + 5);
  *(void *)&self->_has |= 4uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x40000) == 0)
  {
LABEL_27:
    if ((v6 & 0x2000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_80;
  }
LABEL_79:
  self->_cellRrcState = *((_DWORD *)a3 + 24);
  *(void *)&self->_has |= 0x40000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x2000) == 0)
  {
LABEL_28:
    if ((v6 & 0x40) == 0) {
      goto LABEL_29;
    }
    goto LABEL_81;
  }
LABEL_80:
  self->_cellNrFR2active = *((_DWORD *)a3 + 16);
  *(void *)&self->_has |= 0x2000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x40) == 0)
  {
LABEL_29:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_30;
    }
    goto LABEL_82;
  }
LABEL_81:
  self->_cellLteEstimatedThroughput = *((_DWORD *)a3 + 9);
  *(void *)&self->_has |= 0x40uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x1000) == 0)
  {
LABEL_30:
    if ((v6 & 0x20000) == 0) {
      goto LABEL_31;
    }
    goto LABEL_83;
  }
LABEL_82:
  self->_cellNrEstimatedThroughput = *((_DWORD *)a3 + 15);
  *(void *)&self->_has |= 0x1000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x20000) == 0)
  {
LABEL_31:
    if ((v6 & 8) == 0) {
      goto LABEL_32;
    }
    goto LABEL_84;
  }
LABEL_83:
  self->_cellNsaEnabled = *((_DWORD *)a3 + 20);
  *(void *)&self->_has |= 0x20000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 8) == 0)
  {
LABEL_32:
    if ((v6 & 0x100000) == 0) {
      goto LABEL_33;
    }
    goto LABEL_85;
  }
LABEL_84:
  self->_cellDlBw = *((_DWORD *)a3 + 6);
  *(void *)&self->_has |= 8uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x100000) == 0)
  {
LABEL_33:
    if ((v6 & 0x400) == 0) {
      goto LABEL_34;
    }
    goto LABEL_86;
  }
LABEL_85:
  self->_cellUlBw = *((_DWORD *)a3 + 26);
  *(void *)&self->_has |= 0x100000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x400) == 0)
  {
LABEL_34:
    if ((v6 & 0x800) == 0) {
      goto LABEL_35;
    }
    goto LABEL_87;
  }
LABEL_86:
  self->_cellMaxDlCaNumConfigured = *((_DWORD *)a3 + 13);
  *(void *)&self->_has |= 0x400uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x800) == 0)
  {
LABEL_35:
    if ((v6 & 0x20) == 0) {
      goto LABEL_36;
    }
    goto LABEL_88;
  }
LABEL_87:
  self->_cellMaxUlCaNumConfigured = *((_DWORD *)a3 + 14);
  *(void *)&self->_has |= 0x800uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x20) == 0)
  {
LABEL_36:
    if ((v6 & 0x10) == 0) {
      goto LABEL_37;
    }
    goto LABEL_89;
  }
LABEL_88:
  self->_cellEstimatedLoad = *((_DWORD *)a3 + 8);
  *(void *)&self->_has |= 0x20uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x10) == 0)
  {
LABEL_37:
    if ((v6 & 0x8000000) == 0) {
      goto LABEL_38;
    }
    goto LABEL_90;
  }
LABEL_89:
  self->_cellEstimatedBw = *((_DWORD *)a3 + 7);
  *(void *)&self->_has |= 0x10uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x8000000) == 0)
  {
LABEL_38:
    if ((v6 & 0x2000000000000) == 0) {
      goto LABEL_39;
    }
    goto LABEL_91;
  }
LABEL_90:
  self->_recommendedlink = *((_DWORD *)a3 + 33);
  *(void *)&self->_has |= 0x8000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x2000000000000) == 0)
  {
LABEL_39:
    if ((v6 & 0x800000) == 0) {
      goto LABEL_40;
    }
    goto LABEL_92;
  }
LABEL_91:
  self->_fr2DBRecommendation = *((unsigned char *)a3 + 220);
  *(void *)&self->_has |= 0x2000000000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x800000) == 0)
  {
LABEL_40:
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_41;
    }
    goto LABEL_93;
  }
LABEL_92:
  self->_locationDBFR1Count = *((_DWORD *)a3 + 29);
  *(void *)&self->_has |= 0x800000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x1000000) == 0)
  {
LABEL_41:
    if ((v6 & 0x4000000000000) == 0) {
      goto LABEL_42;
    }
    goto LABEL_94;
  }
LABEL_93:
  self->_locationDBFR2Count = *((_DWORD *)a3 + 30);
  *(void *)&self->_has |= 0x1000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x4000000000000) == 0)
  {
LABEL_42:
    if ((v6 & 0x100000000) == 0) {
      goto LABEL_43;
    }
    goto LABEL_95;
  }
LABEL_94:
  self->_highThermalTemperatureNotification = *((unsigned char *)a3 + 221);
  *(void *)&self->_has |= 0x4000000000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x100000000) == 0)
  {
LABEL_43:
    if ((v6 & 0x80000000) == 0) {
      goto LABEL_44;
    }
    goto LABEL_96;
  }
LABEL_95:
  self->_wiFiThroughput = *((_DWORD *)a3 + 38);
  *(void *)&self->_has |= 0x100000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x80000000) == 0)
  {
LABEL_44:
    if ((v6 & 0x40000000) == 0) {
      goto LABEL_45;
    }
    goto LABEL_97;
  }
LABEL_96:
  self->_wiFiPredictedThroughput = *((_DWORD *)a3 + 37);
  *(void *)&self->_has |= 0x80000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x40000000) == 0)
  {
LABEL_45:
    if ((v6 & 0x4000000000) == 0) {
      goto LABEL_46;
    }
    goto LABEL_98;
  }
LABEL_97:
  self->_wRMRecommendationReason = *((_DWORD *)a3 + 36);
  *(void *)&self->_has |= 0x40000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x4000000000) == 0)
  {
LABEL_46:
    if ((v6 & 0x2000000000) == 0) {
      goto LABEL_47;
    }
    goto LABEL_99;
  }
LABEL_98:
  self->_wifiRecommendationScore = *((_DWORD *)a3 + 44);
  *(void *)&self->_has |= 0x4000000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x2000000000) == 0)
  {
LABEL_47:
    if ((v6 & 0x400000) == 0) {
      goto LABEL_48;
    }
    goto LABEL_100;
  }
LABEL_99:
  self->_wifiRecommendationConfidence = *((_DWORD *)a3 + 43);
  *(void *)&self->_has |= 0x2000000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x400000) == 0)
  {
LABEL_48:
    if ((v6 & 0x200000) == 0) {
      goto LABEL_49;
    }
    goto LABEL_101;
  }
LABEL_100:
  self->_cellularRecommendationScore = *((_DWORD *)a3 + 28);
  *(void *)&self->_has |= 0x400000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x200000) == 0)
  {
LABEL_49:
    if ((v6 & 0x2000000) == 0) {
      goto LABEL_50;
    }
    goto LABEL_102;
  }
LABEL_101:
  self->_cellularRecommendationConfidence = *((_DWORD *)a3 + 27);
  *(void *)&self->_has |= 0x200000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x2000000) == 0)
  {
LABEL_50:
    if ((v6 & 0x4000000) == 0) {
      goto LABEL_51;
    }
    goto LABEL_103;
  }
LABEL_102:
  self->_radioCoverage = *((_DWORD *)a3 + 31);
  *(void *)&self->_has |= 0x2000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x4000000) == 0)
  {
LABEL_51:
    if ((v6 & 0x20000000) == 0) {
      goto LABEL_52;
    }
    goto LABEL_104;
  }
LABEL_103:
  self->_radioFrequency = *((_DWORD *)a3 + 32);
  *(void *)&self->_has |= 0x4000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x20000000) == 0)
  {
LABEL_52:
    if ((v6 & 2) == 0) {
      goto LABEL_53;
    }
    goto LABEL_105;
  }
LABEL_104:
  self->_triggerReason = *((_DWORD *)a3 + 35);
  *(void *)&self->_has |= 0x20000000uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 2) == 0)
  {
LABEL_53:
    if ((v6 & 0x80000) == 0) {
      goto LABEL_54;
    }
    goto LABEL_106;
  }
LABEL_105:
  self->_applicationCategory = *((_DWORD *)a3 + 4);
  *(void *)&self->_has |= 2uLL;
  uint64_t v6 = *((void *)a3 + 28);
  if ((v6 & 0x80000) == 0)
  {
LABEL_54:
    if ((v6 & 0x10000000) == 0) {
      return;
    }
    goto LABEL_55;
  }
LABEL_106:
  self->_cellTotalMimoLayers = *((_DWORD *)a3 + 25);
  *(void *)&self->_has |= 0x80000uLL;
  if ((*((void *)a3 + 28) & 0x10000000) == 0) {
    return;
  }
LABEL_55:
  self->_totalNrBandwidth = *((_DWORD *)a3 + 34);
  *(void *)&self->_has |= 0x10000000uLL;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)wifiRssi
{
  return self->_wifiRssi;
}

- (unsigned)wifiSnr
{
  return self->_wifiSnr;
}

- (unsigned)wifiTxPER
{
  return self->_wifiTxPER;
}

- (unsigned)wifiRxRetry
{
  return self->_wifiRxRetry;
}

- (unsigned)wifiCca
{
  return self->_wifiCca;
}

- (unsigned)wifiQbssLoad
{
  return self->_wifiQbssLoad;
}

- (unsigned)wifiStationCount
{
  return self->_wifiStationCount;
}

- (unsigned)wifPoi
{
  return self->_wifPoi;
}

- (int)wifiWgtAVGRSSI
{
  return self->_wifiWgtAVGRSSI;
}

- (unsigned)wifiWghtAVGSNR
{
  return self->_wifiWghtAVGSNR;
}

- (unsigned)wifiWghtAVGTXPHYRATE
{
  return self->_wifiWghtAVGTXPHYRATE;
}

- (unsigned)wifiWghtAVGRXPHYRATE
{
  return self->_wifiWghtAVGRXPHYRATE;
}

- (unsigned)wifiEstThoughtput
{
  return self->_wifiEstThoughtput;
}

- (unsigned)wifiWifiEstThoughtputConfidence
{
  return self->_wifiWifiEstThoughtputConfidence;
}

- (NSString)cellRatType
{
  return self->_cellRatType;
}

- (void)setCellRatType:(id)a3
{
}

- (int)cellLteRSRP
{
  return self->_cellLteRSRP;
}

- (int)cellLteSNR
{
  return self->_cellLteSNR;
}

- (int)cellLteRSRQ
{
  return self->_cellLteRSRQ;
}

- (int)cellNrRSRP
{
  return self->_cellNrRSRP;
}

- (int)cellNrRSRQ
{
  return self->_cellNrRSRQ;
}

- (int)cellNrSNR
{
  return self->_cellNrSNR;
}

- (unsigned)cellDataLQM
{
  return self->_cellDataLQM;
}

- (unsigned)cellRrcState
{
  return self->_cellRrcState;
}

- (unsigned)cellNrFR2active
{
  return self->_cellNrFR2active;
}

- (unsigned)cellLteEstimatedThroughput
{
  return self->_cellLteEstimatedThroughput;
}

- (unsigned)cellNrEstimatedThroughput
{
  return self->_cellNrEstimatedThroughput;
}

- (unsigned)cellNsaEnabled
{
  return self->_cellNsaEnabled;
}

- (unsigned)cellDlBw
{
  return self->_cellDlBw;
}

- (unsigned)cellUlBw
{
  return self->_cellUlBw;
}

- (unsigned)cellMaxDlCaNumConfigured
{
  return self->_cellMaxDlCaNumConfigured;
}

- (unsigned)cellMaxUlCaNumConfigured
{
  return self->_cellMaxUlCaNumConfigured;
}

- (unsigned)cellEstimatedLoad
{
  return self->_cellEstimatedLoad;
}

- (unsigned)cellEstimatedBw
{
  return self->_cellEstimatedBw;
}

- (unsigned)recommendedlink
{
  return self->_recommendedlink;
}

- (BOOL)fr2DBRecommendation
{
  return self->_fr2DBRecommendation;
}

- (unsigned)locationDBFR1Count
{
  return self->_locationDBFR1Count;
}

- (unsigned)locationDBFR2Count
{
  return self->_locationDBFR2Count;
}

- (BOOL)highThermalTemperatureNotification
{
  return self->_highThermalTemperatureNotification;
}

- (unsigned)wiFiThroughput
{
  return self->_wiFiThroughput;
}

- (unsigned)wiFiPredictedThroughput
{
  return self->_wiFiPredictedThroughput;
}

- (unsigned)wRMRecommendationReason
{
  return self->_wRMRecommendationReason;
}

- (unsigned)wifiRecommendationScore
{
  return self->_wifiRecommendationScore;
}

- (unsigned)wifiRecommendationConfidence
{
  return self->_wifiRecommendationConfidence;
}

- (unsigned)cellularRecommendationScore
{
  return self->_cellularRecommendationScore;
}

- (unsigned)cellularRecommendationConfidence
{
  return self->_cellularRecommendationConfidence;
}

- (unsigned)radioCoverage
{
  return self->_radioCoverage;
}

- (unsigned)radioFrequency
{
  return self->_radioFrequency;
}

- (unsigned)triggerReason
{
  return self->_triggerReason;
}

- (unsigned)applicationCategory
{
  return self->_applicationCategory;
}

- (unsigned)cellTotalMimoLayers
{
  return self->_cellTotalMimoLayers;
}

- (unsigned)totalNrBandwidth
{
  return self->_totalNrBandwidth;
}

@end
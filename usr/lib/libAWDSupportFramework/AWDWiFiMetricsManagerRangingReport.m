@interface AWDWiFiMetricsManagerRangingReport
+ (Class)rttSamplesType;
- (BOOL)hasAwdlLatency;
- (BOOL)hasNumMeasurements;
- (BOOL)hasPeerMasterChannel;
- (BOOL)hasPeerPreferredChannel;
- (BOOL)hasPeerPreferredChannelFlags;
- (BOOL)hasProtocolVersion;
- (BOOL)hasRangingBandwidth;
- (BOOL)hasRangingChannel;
- (BOOL)hasRangingChannelQuality;
- (BOOL)hasRangingLatency;
- (BOOL)hasResultFlags;
- (BOOL)hasResultStatus;
- (BOOL)hasSelfMasterChannel;
- (BOOL)hasSelfPreferredChannel;
- (BOOL)hasSelfPreferredChannelFlags;
- (BOOL)hasTimestamp;
- (BOOL)hasValidCount;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)rttSamples;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)rttSamplesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)rttSamplesCount;
- (unint64_t)timestamp;
- (unsigned)awdlLatency;
- (unsigned)numMeasurements;
- (unsigned)peerMasterChannel;
- (unsigned)peerPreferredChannel;
- (unsigned)peerPreferredChannelFlags;
- (unsigned)protocolVersion;
- (unsigned)rangingBandwidth;
- (unsigned)rangingChannel;
- (unsigned)rangingChannelQuality;
- (unsigned)rangingLatency;
- (unsigned)resultFlags;
- (unsigned)resultStatus;
- (unsigned)selfMasterChannel;
- (unsigned)selfPreferredChannel;
- (unsigned)selfPreferredChannelFlags;
- (unsigned)validCount;
- (void)addRttSamples:(id)a3;
- (void)clearRttSamples;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAwdlLatency:(unsigned int)a3;
- (void)setHasAwdlLatency:(BOOL)a3;
- (void)setHasNumMeasurements:(BOOL)a3;
- (void)setHasPeerMasterChannel:(BOOL)a3;
- (void)setHasPeerPreferredChannel:(BOOL)a3;
- (void)setHasPeerPreferredChannelFlags:(BOOL)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setHasRangingBandwidth:(BOOL)a3;
- (void)setHasRangingChannel:(BOOL)a3;
- (void)setHasRangingChannelQuality:(BOOL)a3;
- (void)setHasRangingLatency:(BOOL)a3;
- (void)setHasResultFlags:(BOOL)a3;
- (void)setHasResultStatus:(BOOL)a3;
- (void)setHasSelfMasterChannel:(BOOL)a3;
- (void)setHasSelfPreferredChannel:(BOOL)a3;
- (void)setHasSelfPreferredChannelFlags:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasValidCount:(BOOL)a3;
- (void)setNumMeasurements:(unsigned int)a3;
- (void)setPeerMasterChannel:(unsigned int)a3;
- (void)setPeerPreferredChannel:(unsigned int)a3;
- (void)setPeerPreferredChannelFlags:(unsigned int)a3;
- (void)setProtocolVersion:(unsigned int)a3;
- (void)setRangingBandwidth:(unsigned int)a3;
- (void)setRangingChannel:(unsigned int)a3;
- (void)setRangingChannelQuality:(unsigned int)a3;
- (void)setRangingLatency:(unsigned int)a3;
- (void)setResultFlags:(unsigned int)a3;
- (void)setResultStatus:(unsigned int)a3;
- (void)setRttSamples:(id)a3;
- (void)setSelfMasterChannel:(unsigned int)a3;
- (void)setSelfPreferredChannel:(unsigned int)a3;
- (void)setSelfPreferredChannelFlags:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setValidCount:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWiFiMetricsManagerRangingReport

- (void)dealloc
{
  [(AWDWiFiMetricsManagerRangingReport *)self setRttSamples:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerRangingReport;
  [(AWDWiFiMetricsManagerRangingReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_DWORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFFE | a3);
}

- (BOOL)hasTimestamp
{
  return *(_DWORD *)&self->_has & 1;
}

- (void)setSelfPreferredChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x4000u;
  self->_selfPreferredChannel = a3;
}

- (void)setHasSelfPreferredChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x4000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFBFFF | v3);
}

- (BOOL)hasSelfPreferredChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 6) & 1;
}

- (void)setSelfPreferredChannelFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x8000u;
  self->_selfPreferredChannelFlags = a3;
}

- (void)setHasSelfPreferredChannelFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 0x8000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFF7FFF | v3);
}

- (BOOL)hasSelfPreferredChannelFlags
{
  return *((unsigned __int8 *)&self->_has + 1) >> 7;
}

- (void)setSelfMasterChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x2000u;
  self->_selfMasterChannel = a3;
}

- (void)setHasSelfMasterChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 0x2000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFDFFF | v3);
}

- (BOOL)hasSelfMasterChannel
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 5) & 1;
}

- (void)setPeerPreferredChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10u;
  self->_peerPreferredChannel = a3;
}

- (void)setHasPeerPreferredChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 16;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFEF | v3);
}

- (BOOL)hasPeerPreferredChannel
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setPeerPreferredChannelFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x20u;
  self->_peerPreferredChannelFlags = a3;
}

- (void)setHasPeerPreferredChannelFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 32;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFDF | v3);
}

- (BOOL)hasPeerPreferredChannelFlags
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setPeerMasterChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 8u;
  self->_peerMasterChannel = a3;
}

- (void)setHasPeerMasterChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 8;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFF7 | v3);
}

- (BOOL)hasPeerMasterChannel
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x40u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  if (a3) {
    int v3 = 64;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFBF | v3);
}

- (BOOL)hasProtocolVersion
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setRangingChannel:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x100u;
  self->_rangingChannel = a3;
}

- (void)setHasRangingChannel:(BOOL)a3
{
  if (a3) {
    int v3 = 256;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFEFF | v3);
}

- (BOOL)hasRangingChannel
{
  return *((unsigned char *)&self->_has + 1) & 1;
}

- (void)setRangingBandwidth:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x80u;
  self->_rangingBandwidth = a3;
}

- (void)setHasRangingBandwidth:(BOOL)a3
{
  if (a3) {
    int v3 = 128;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFF7F | v3);
}

- (BOOL)hasRangingBandwidth
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setResultFlags:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x800u;
  self->_resultFlags = a3;
}

- (void)setHasResultFlags:(BOOL)a3
{
  if (a3) {
    int v3 = 2048;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFF7FF | v3);
}

- (BOOL)hasResultFlags
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 3) & 1;
}

- (void)setResultStatus:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x1000u;
  self->_resultStatus = a3;
}

- (void)setHasResultStatus:(BOOL)a3
{
  if (a3) {
    int v3 = 4096;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFEFFF | v3);
}

- (BOOL)hasResultStatus
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 4) & 1;
}

- (void)setValidCount:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x10000u;
  self->_validCount = a3;
}

- (void)setHasValidCount:(BOOL)a3
{
  if (a3) {
    int v3 = 0x10000;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFEFFFF | v3);
}

- (BOOL)hasValidCount
{
  return *((unsigned char *)&self->_has + 2) & 1;
}

- (void)setNumMeasurements:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 4u;
  self->_numMeasurements = a3;
}

- (void)setHasNumMeasurements:(BOOL)a3
{
  if (a3) {
    int v3 = 4;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFFB | v3);
}

- (BOOL)hasNumMeasurements
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAwdlLatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 2u;
  self->_awdlLatency = a3;
}

- (void)setHasAwdlLatency:(BOOL)a3
{
  if (a3) {
    int v3 = 2;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFFFD | v3);
}

- (BOOL)hasAwdlLatency
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setRangingLatency:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x400u;
  self->_rangingLatency = a3;
}

- (void)setHasRangingLatency:(BOOL)a3
{
  if (a3) {
    int v3 = 1024;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFBFF | v3);
}

- (BOOL)hasRangingLatency
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 2) & 1;
}

- (void)clearRttSamples
{
}

- (void)addRttSamples:(id)a3
{
  rttSamples = self->_rttSamples;
  if (!rttSamples)
  {
    rttSamples = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_rttSamples = rttSamples;
  }

  [(NSMutableArray *)rttSamples addObject:a3];
}

- (unint64_t)rttSamplesCount
{
  return [(NSMutableArray *)self->_rttSamples count];
}

- (id)rttSamplesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_rttSamples objectAtIndex:a3];
}

+ (Class)rttSamplesType
{
  return (Class)objc_opt_class();
}

- (void)setRangingChannelQuality:(unsigned int)a3
{
  *(_DWORD *)&self->_has |= 0x200u;
  self->_rangingChannelQuality = a3;
}

- (void)setHasRangingChannelQuality:(BOOL)a3
{
  if (a3) {
    int v3 = 512;
  }
  else {
    int v3 = 0;
  }
  self->_has = ($43FC9849F3234CB89BE835B6112B5A07)(*(_DWORD *)&self->_has & 0xFFFFFDFF | v3);
}

- (BOOL)hasRangingChannelQuality
{
  return (*((unsigned __int8 *)&self->_has + 1) >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWiFiMetricsManagerRangingReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWiFiMetricsManagerRangingReport description](&v3, sel_description), -[AWDWiFiMetricsManagerRangingReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if (*(unsigned char *)&has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfPreferredChannel] forKey:@"selfPreferredChannel"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfPreferredChannelFlags] forKey:@"selfPreferredChannelFlags"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_selfMasterChannel] forKey:@"selfMasterChannel"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerPreferredChannel] forKey:@"peerPreferredChannel"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerPreferredChannelFlags] forKey:@"peerPreferredChannelFlags"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_37;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_peerMasterChannel] forKey:@"peerMasterChannel"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_38;
  }
LABEL_37:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_protocolVersion] forKey:@"protocolVersion"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_39;
  }
LABEL_38:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rangingChannel] forKey:@"rangingChannel"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_40;
  }
LABEL_39:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rangingBandwidth] forKey:@"rangingBandwidth"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_41;
  }
LABEL_40:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_resultFlags] forKey:@"resultFlags"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_42;
  }
LABEL_41:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_resultStatus] forKey:@"resultStatus"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_43;
  }
LABEL_42:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_validCount] forKey:@"validCount"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_44;
  }
LABEL_43:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numMeasurements] forKey:@"numMeasurements"];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_44:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_awdlLatency] forKey:@"awdlLatency"];
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
LABEL_17:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rangingLatency] forKey:@"rangingLatency"];
LABEL_18:
  if ([(NSMutableArray *)self->_rttSamples count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_rttSamples, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    rttSamples = self->_rttSamples;
    uint64_t v7 = [(NSMutableArray *)rttSamples countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(rttSamples);
          }
          [v5 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)rttSamples countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"rttSamples"];
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_rangingChannelQuality] forKey:@"rangingChannelQuality"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWiFiMetricsManagerRangingReportReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if (*(unsigned char *)&has)
  {
    PBDataWriterWriteUint64Field();
    $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  PBDataWriterWriteUint32Field();
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_42:
  PBDataWriterWriteUint32Field();
  if ((*(_DWORD *)&self->_has & 0x400) != 0) {
LABEL_17:
  }
    PBDataWriterWriteUint32Field();
LABEL_18:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  rttSamples = self->_rttSamples;
  uint64_t v6 = [(NSMutableArray *)rttSamples countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(rttSamples);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)rttSamples countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_DWORD *)a3 + 22) |= 1u;
    $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 19) = self->_selfPreferredChannel;
  *((_DWORD *)a3 + 22) |= 0x4000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 20) = self->_selfPreferredChannelFlags;
  *((_DWORD *)a3 + 22) |= 0x8000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 18) = self->_selfMasterChannel;
  *((_DWORD *)a3 + 22) |= 0x2000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)a3 + 7) = self->_peerPreferredChannel;
  *((_DWORD *)a3 + 22) |= 0x10u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((_DWORD *)a3 + 8) = self->_peerPreferredChannelFlags;
  *((_DWORD *)a3 + 22) |= 0x20u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)a3 + 6) = self->_peerMasterChannel;
  *((_DWORD *)a3 + 22) |= 8u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)a3 + 9) = self->_protocolVersion;
  *((_DWORD *)a3 + 22) |= 0x40u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_34;
  }
LABEL_33:
  *((_DWORD *)a3 + 11) = self->_rangingChannel;
  *((_DWORD *)a3 + 22) |= 0x100u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_35;
  }
LABEL_34:
  *((_DWORD *)a3 + 10) = self->_rangingBandwidth;
  *((_DWORD *)a3 + 22) |= 0x80u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_36;
  }
LABEL_35:
  *((_DWORD *)a3 + 14) = self->_resultFlags;
  *((_DWORD *)a3 + 22) |= 0x800u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_37;
  }
LABEL_36:
  *((_DWORD *)a3 + 15) = self->_resultStatus;
  *((_DWORD *)a3 + 22) |= 0x1000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)a3 + 21) = self->_validCount;
  *((_DWORD *)a3 + 22) |= 0x10000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
LABEL_39:
    *((_DWORD *)a3 + 4) = self->_awdlLatency;
    *((_DWORD *)a3 + 22) |= 2u;
    if ((*(_DWORD *)&self->_has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_38:
  *((_DWORD *)a3 + 5) = self->_numMeasurements;
  *((_DWORD *)a3 + 22) |= 4u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 2) != 0) {
    goto LABEL_39;
  }
LABEL_16:
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_17:
    *((_DWORD *)a3 + 13) = self->_rangingLatency;
    *((_DWORD *)a3 + 22) |= 0x400u;
  }
LABEL_18:
  if ([(AWDWiFiMetricsManagerRangingReport *)self rttSamplesCount])
  {
    [a3 clearRttSamples];
    unint64_t v6 = [(AWDWiFiMetricsManagerRangingReport *)self rttSamplesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addRttSamples:-[AWDWiFiMetricsManagerRangingReport rttSamplesAtIndex:](self, "rttSamplesAtIndex:", i)];
    }
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    *((_DWORD *)a3 + 12) = self->_rangingChannelQuality;
    *((_DWORD *)a3 + 22) |= 0x200u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (_DWORD *)v5;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if (*(unsigned char *)&has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_DWORD *)(v5 + 88) |= 1u;
    $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
    if ((*(_WORD *)&has & 0x4000) == 0)
    {
LABEL_3:
      if ((*(_WORD *)&has & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&has & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 76) = self->_selfPreferredChannel;
  *(_DWORD *)(v5 + 88) |= 0x4000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x8000) == 0)
  {
LABEL_4:
    if ((*(_WORD *)&has & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 80) = self->_selfPreferredChannelFlags;
  *(_DWORD *)(v5 + 88) |= 0x8000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x2000) == 0)
  {
LABEL_5:
    if ((*(unsigned char *)&has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(_DWORD *)(v5 + 72) = self->_selfMasterChannel;
  *(_DWORD *)(v5 + 88) |= 0x2000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x10) == 0)
  {
LABEL_6:
    if ((*(unsigned char *)&has & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  *(_DWORD *)(v5 + 28) = self->_peerPreferredChannel;
  *(_DWORD *)(v5 + 88) |= 0x10u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x20) == 0)
  {
LABEL_7:
    if ((*(unsigned char *)&has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  *(_DWORD *)(v5 + 32) = self->_peerPreferredChannelFlags;
  *(_DWORD *)(v5 + 88) |= 0x20u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 8) == 0)
  {
LABEL_8:
    if ((*(unsigned char *)&has & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  *(_DWORD *)(v5 + 24) = self->_peerMasterChannel;
  *(_DWORD *)(v5 + 88) |= 8u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x40) == 0)
  {
LABEL_9:
    if ((*(_WORD *)&has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  *(_DWORD *)(v5 + 36) = self->_protocolVersion;
  *(_DWORD *)(v5 + 88) |= 0x40u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x100) == 0)
  {
LABEL_10:
    if ((*(unsigned char *)&has & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  *(_DWORD *)(v5 + 44) = self->_rangingChannel;
  *(_DWORD *)(v5 + 88) |= 0x100u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 0x80) == 0)
  {
LABEL_11:
    if ((*(_WORD *)&has & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  *(_DWORD *)(v5 + 40) = self->_rangingBandwidth;
  *(_DWORD *)(v5 + 88) |= 0x80u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x800) == 0)
  {
LABEL_12:
    if ((*(_WORD *)&has & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  *(_DWORD *)(v5 + 56) = self->_resultFlags;
  *(_DWORD *)(v5 + 88) |= 0x800u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_WORD *)&has & 0x1000) == 0)
  {
LABEL_13:
    if ((*(_DWORD *)&has & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  *(_DWORD *)(v5 + 60) = self->_resultStatus;
  *(_DWORD *)(v5 + 88) |= 0x1000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(_DWORD *)&has & 0x10000) == 0)
  {
LABEL_14:
    if ((*(unsigned char *)&has & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  *(_DWORD *)(v5 + 84) = self->_validCount;
  *(_DWORD *)(v5 + 88) |= 0x10000u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 4) == 0)
  {
LABEL_15:
    if ((*(unsigned char *)&has & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  *(_DWORD *)(v5 + 20) = self->_numMeasurements;
  *(_DWORD *)(v5 + 88) |= 4u;
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if ((*(unsigned char *)&has & 2) == 0)
  {
LABEL_16:
    if ((*(_WORD *)&has & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_42:
  *(_DWORD *)(v5 + 16) = self->_awdlLatency;
  *(_DWORD *)(v5 + 88) |= 2u;
  if ((*(_DWORD *)&self->_has & 0x400) != 0)
  {
LABEL_17:
    *(_DWORD *)(v5 + 52) = self->_rangingLatency;
    *(_DWORD *)(v5 + 88) |= 0x400u;
  }
LABEL_18:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  rttSamples = self->_rttSamples;
  uint64_t v9 = [(NSMutableArray *)rttSamples countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(rttSamples);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addRttSamples:v13];
      }
      uint64_t v10 = [(NSMutableArray *)rttSamples countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0)
  {
    v6[12] = self->_rangingChannelQuality;
    v6[22] |= 0x200u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
    int v7 = *((_DWORD *)a3 + 22);
    if (*(unsigned char *)&has)
    {
      if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_89;
      }
    }
    else if (v7)
    {
LABEL_89:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
      if ((v7 & 0x4000) == 0 || self->_selfPreferredChannel != *((_DWORD *)a3 + 19)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x4000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x8000) != 0)
    {
      if ((v7 & 0x8000) == 0 || self->_selfPreferredChannelFlags != *((_DWORD *)a3 + 20)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x8000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x2000) != 0)
    {
      if ((v7 & 0x2000) == 0 || self->_selfMasterChannel != *((_DWORD *)a3 + 18)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x2000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(unsigned char *)&has & 0x10) != 0)
    {
      if ((v7 & 0x10) == 0 || self->_peerPreferredChannel != *((_DWORD *)a3 + 7)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x10) != 0)
    {
      goto LABEL_89;
    }
    if ((*(unsigned char *)&has & 0x20) != 0)
    {
      if ((v7 & 0x20) == 0 || self->_peerPreferredChannelFlags != *((_DWORD *)a3 + 8)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x20) != 0)
    {
      goto LABEL_89;
    }
    if ((*(unsigned char *)&has & 8) != 0)
    {
      if ((v7 & 8) == 0 || self->_peerMasterChannel != *((_DWORD *)a3 + 6)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 8) != 0)
    {
      goto LABEL_89;
    }
    if ((*(unsigned char *)&has & 0x40) != 0)
    {
      if ((v7 & 0x40) == 0 || self->_protocolVersion != *((_DWORD *)a3 + 9)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x40) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x100) != 0)
    {
      if ((v7 & 0x100) == 0 || self->_rangingChannel != *((_DWORD *)a3 + 11)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x100) != 0)
    {
      goto LABEL_89;
    }
    if ((*(unsigned char *)&has & 0x80) != 0)
    {
      if ((v7 & 0x80) == 0 || self->_rangingBandwidth != *((_DWORD *)a3 + 10)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x80) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x800) != 0)
    {
      if ((v7 & 0x800) == 0 || self->_resultFlags != *((_DWORD *)a3 + 14)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x800) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x1000) != 0)
    {
      if ((v7 & 0x1000) == 0 || self->_resultStatus != *((_DWORD *)a3 + 15)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x1000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_DWORD *)&has & 0x10000) != 0)
    {
      if ((v7 & 0x10000) == 0 || self->_validCount != *((_DWORD *)a3 + 21)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x10000) != 0)
    {
      goto LABEL_89;
    }
    if ((*(unsigned char *)&has & 4) != 0)
    {
      if ((v7 & 4) == 0 || self->_numMeasurements != *((_DWORD *)a3 + 5)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 4) != 0)
    {
      goto LABEL_89;
    }
    if ((*(unsigned char *)&has & 2) != 0)
    {
      if ((v7 & 2) == 0 || self->_awdlLatency != *((_DWORD *)a3 + 4)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 2) != 0)
    {
      goto LABEL_89;
    }
    if ((*(_WORD *)&has & 0x400) != 0)
    {
      if ((v7 & 0x400) == 0 || self->_rangingLatency != *((_DWORD *)a3 + 13)) {
        goto LABEL_89;
      }
    }
    else if ((v7 & 0x400) != 0)
    {
      goto LABEL_89;
    }
    rttSamples = self->_rttSamples;
    if ((unint64_t)rttSamples | *((void *)a3 + 8))
    {
      int v5 = -[NSMutableArray isEqual:](rttSamples, "isEqual:");
      if (!v5) {
        return v5;
      }
      $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
    }
    int v9 = *((_DWORD *)a3 + 22);
    LOBYTE(v5) = (v9 & 0x200) == 0;
    if ((*(_WORD *)&has & 0x200) != 0)
    {
      if ((v9 & 0x200) == 0 || self->_rangingChannelQuality != *((_DWORD *)a3 + 12)) {
        goto LABEL_89;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  $43FC9849F3234CB89BE835B6112B5A07 has = self->_has;
  if (*(unsigned char *)&has)
  {
    unint64_t v22 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&has & 0x4000) != 0)
    {
LABEL_3:
      uint64_t v21 = 2654435761 * self->_selfPreferredChannel;
      if ((*(_WORD *)&has & 0x8000) != 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else
  {
    unint64_t v22 = 0;
    if ((*(_WORD *)&has & 0x4000) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v21 = 0;
  if ((*(_WORD *)&has & 0x8000) != 0)
  {
LABEL_4:
    uint64_t v20 = 2654435761 * self->_selfPreferredChannelFlags;
    if ((*(_WORD *)&has & 0x2000) != 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v20 = 0;
  if ((*(_WORD *)&has & 0x2000) != 0)
  {
LABEL_5:
    uint64_t v19 = 2654435761 * self->_selfMasterChannel;
    if ((*(unsigned char *)&has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v19 = 0;
  if ((*(unsigned char *)&has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v18 = 2654435761 * self->_peerPreferredChannel;
    if ((*(unsigned char *)&has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  uint64_t v18 = 0;
  if ((*(unsigned char *)&has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v17 = 2654435761 * self->_peerPreferredChannelFlags;
    if ((*(unsigned char *)&has & 8) != 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  uint64_t v17 = 0;
  if ((*(unsigned char *)&has & 8) != 0)
  {
LABEL_8:
    uint64_t v16 = 2654435761 * self->_peerMasterChannel;
    if ((*(unsigned char *)&has & 0x40) != 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  uint64_t v16 = 0;
  if ((*(unsigned char *)&has & 0x40) != 0)
  {
LABEL_9:
    uint64_t v15 = 2654435761 * self->_protocolVersion;
    if ((*(_WORD *)&has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  uint64_t v15 = 0;
  if ((*(_WORD *)&has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v4 = 2654435761 * self->_rangingChannel;
    if ((*(unsigned char *)&has & 0x80) != 0) {
      goto LABEL_11;
    }
    goto LABEL_27;
  }
LABEL_26:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&has & 0x80) != 0)
  {
LABEL_11:
    uint64_t v5 = 2654435761 * self->_rangingBandwidth;
    if ((*(_WORD *)&has & 0x800) != 0) {
      goto LABEL_12;
    }
    goto LABEL_28;
  }
LABEL_27:
  uint64_t v5 = 0;
  if ((*(_WORD *)&has & 0x800) != 0)
  {
LABEL_12:
    uint64_t v6 = 2654435761 * self->_resultFlags;
    if ((*(_WORD *)&has & 0x1000) != 0) {
      goto LABEL_13;
    }
    goto LABEL_29;
  }
LABEL_28:
  uint64_t v6 = 0;
  if ((*(_WORD *)&has & 0x1000) != 0)
  {
LABEL_13:
    uint64_t v7 = 2654435761 * self->_resultStatus;
    if ((*(_DWORD *)&has & 0x10000) != 0) {
      goto LABEL_14;
    }
    goto LABEL_30;
  }
LABEL_29:
  uint64_t v7 = 0;
  if ((*(_DWORD *)&has & 0x10000) != 0)
  {
LABEL_14:
    uint64_t v8 = 2654435761 * self->_validCount;
    if ((*(unsigned char *)&has & 4) != 0) {
      goto LABEL_15;
    }
    goto LABEL_31;
  }
LABEL_30:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&has & 4) != 0)
  {
LABEL_15:
    uint64_t v9 = 2654435761 * self->_numMeasurements;
    if ((*(unsigned char *)&has & 2) != 0) {
      goto LABEL_16;
    }
LABEL_32:
    uint64_t v10 = 0;
    if ((*(_WORD *)&has & 0x400) != 0) {
      goto LABEL_17;
    }
    goto LABEL_33;
  }
LABEL_31:
  uint64_t v9 = 0;
  if ((*(unsigned char *)&has & 2) == 0) {
    goto LABEL_32;
  }
LABEL_16:
  uint64_t v10 = 2654435761 * self->_awdlLatency;
  if ((*(_WORD *)&has & 0x400) != 0)
  {
LABEL_17:
    uint64_t v11 = 2654435761 * self->_rangingLatency;
    goto LABEL_34;
  }
LABEL_33:
  uint64_t v11 = 0;
LABEL_34:
  uint64_t v12 = [(NSMutableArray *)self->_rttSamples hash];
  if ((*((unsigned char *)&self->_has + 1) & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_rangingChannelQuality;
  }
  else {
    uint64_t v13 = 0;
  }
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v12;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  int v5 = *((_DWORD *)a3 + 22);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_DWORD *)&self->_has |= 1u;
    int v5 = *((_DWORD *)a3 + 22);
    if ((v5 & 0x4000) == 0)
    {
LABEL_3:
      if ((v5 & 0x8000) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((v5 & 0x4000) == 0)
  {
    goto LABEL_3;
  }
  self->_selfPreferredChannel = *((_DWORD *)a3 + 19);
  *(_DWORD *)&self->_has |= 0x4000u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x8000) == 0)
  {
LABEL_4:
    if ((v5 & 0x2000) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_selfPreferredChannelFlags = *((_DWORD *)a3 + 20);
  *(_DWORD *)&self->_has |= 0x8000u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x2000) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_selfMasterChannel = *((_DWORD *)a3 + 18);
  *(_DWORD *)&self->_has |= 0x2000u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 0x20) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_peerPreferredChannel = *((_DWORD *)a3 + 7);
  *(_DWORD *)&self->_has |= 0x10u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x20) == 0)
  {
LABEL_7:
    if ((v5 & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_peerPreferredChannelFlags = *((_DWORD *)a3 + 8);
  *(_DWORD *)&self->_has |= 0x20u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 8) == 0)
  {
LABEL_8:
    if ((v5 & 0x40) == 0) {
      goto LABEL_9;
    }
    goto LABEL_35;
  }
LABEL_34:
  self->_peerMasterChannel = *((_DWORD *)a3 + 6);
  *(_DWORD *)&self->_has |= 8u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x40) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_36;
  }
LABEL_35:
  self->_protocolVersion = *((_DWORD *)a3 + 9);
  *(_DWORD *)&self->_has |= 0x40u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 0x80) == 0) {
      goto LABEL_11;
    }
    goto LABEL_37;
  }
LABEL_36:
  self->_rangingChannel = *((_DWORD *)a3 + 11);
  *(_DWORD *)&self->_has |= 0x100u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x80) == 0)
  {
LABEL_11:
    if ((v5 & 0x800) == 0) {
      goto LABEL_12;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_rangingBandwidth = *((_DWORD *)a3 + 10);
  *(_DWORD *)&self->_has |= 0x80u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x800) == 0)
  {
LABEL_12:
    if ((v5 & 0x1000) == 0) {
      goto LABEL_13;
    }
    goto LABEL_39;
  }
LABEL_38:
  self->_resultFlags = *((_DWORD *)a3 + 14);
  *(_DWORD *)&self->_has |= 0x800u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x1000) == 0)
  {
LABEL_13:
    if ((v5 & 0x10000) == 0) {
      goto LABEL_14;
    }
    goto LABEL_40;
  }
LABEL_39:
  self->_resultStatus = *((_DWORD *)a3 + 15);
  *(_DWORD *)&self->_has |= 0x1000u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 0x10000) == 0)
  {
LABEL_14:
    if ((v5 & 4) == 0) {
      goto LABEL_15;
    }
    goto LABEL_41;
  }
LABEL_40:
  self->_validCount = *((_DWORD *)a3 + 21);
  *(_DWORD *)&self->_has |= 0x10000u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 4) == 0)
  {
LABEL_15:
    if ((v5 & 2) == 0) {
      goto LABEL_16;
    }
    goto LABEL_42;
  }
LABEL_41:
  self->_numMeasurements = *((_DWORD *)a3 + 5);
  *(_DWORD *)&self->_has |= 4u;
  int v5 = *((_DWORD *)a3 + 22);
  if ((v5 & 2) == 0)
  {
LABEL_16:
    if ((v5 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_42:
  self->_awdlLatency = *((_DWORD *)a3 + 4);
  *(_DWORD *)&self->_has |= 2u;
  if ((*((_DWORD *)a3 + 22) & 0x400) != 0)
  {
LABEL_17:
    self->_rangingLatency = *((_DWORD *)a3 + 13);
    *(_DWORD *)&self->_has |= 0x400u;
  }
LABEL_18:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 8);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDWiFiMetricsManagerRangingReport *)self addRttSamples:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  if ((*((unsigned char *)a3 + 89) & 2) != 0)
  {
    self->_rangingChannelQuality = *((_DWORD *)a3 + 12);
    *(_DWORD *)&self->_has |= 0x200u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)selfPreferredChannel
{
  return self->_selfPreferredChannel;
}

- (unsigned)selfPreferredChannelFlags
{
  return self->_selfPreferredChannelFlags;
}

- (unsigned)selfMasterChannel
{
  return self->_selfMasterChannel;
}

- (unsigned)peerPreferredChannel
{
  return self->_peerPreferredChannel;
}

- (unsigned)peerPreferredChannelFlags
{
  return self->_peerPreferredChannelFlags;
}

- (unsigned)peerMasterChannel
{
  return self->_peerMasterChannel;
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (unsigned)rangingChannel
{
  return self->_rangingChannel;
}

- (unsigned)rangingBandwidth
{
  return self->_rangingBandwidth;
}

- (unsigned)resultFlags
{
  return self->_resultFlags;
}

- (unsigned)resultStatus
{
  return self->_resultStatus;
}

- (unsigned)validCount
{
  return self->_validCount;
}

- (unsigned)numMeasurements
{
  return self->_numMeasurements;
}

- (unsigned)awdlLatency
{
  return self->_awdlLatency;
}

- (unsigned)rangingLatency
{
  return self->_rangingLatency;
}

- (NSMutableArray)rttSamples
{
  return self->_rttSamples;
}

- (void)setRttSamples:(id)a3
{
}

- (unsigned)rangingChannelQuality
{
  return self->_rangingChannelQuality;
}

@end
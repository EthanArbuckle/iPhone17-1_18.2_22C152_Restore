@interface AWDWRMStreamingReport
+ (Class)instValuesType;
- (BOOL)hasCounter;
- (BOOL)hasDuration;
- (BOOL)hasDurationLPM;
- (BOOL)hasDurationOffline;
- (BOOL)hasIsEnd;
- (BOOL)hasLPM;
- (BOOL)hasNumStall;
- (BOOL)hasOffline;
- (BOOL)hasOnline;
- (BOOL)hasSamplePeriods;
- (BOOL)hasTimestamp;
- (BOOL)isEnd;
- (BOOL)isEqual:(id)a3;
- (BOOL)lPM;
- (BOOL)offline;
- (BOOL)online;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)instValues;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instValuesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)instValuesCount;
- (unint64_t)timestamp;
- (unsigned)counter;
- (unsigned)duration;
- (unsigned)durationLPM;
- (unsigned)durationOffline;
- (unsigned)numStall;
- (unsigned)samplePeriods;
- (void)addInstValues:(id)a3;
- (void)clearInstValues;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setCounter:(unsigned int)a3;
- (void)setDuration:(unsigned int)a3;
- (void)setDurationLPM:(unsigned int)a3;
- (void)setDurationOffline:(unsigned int)a3;
- (void)setHasCounter:(BOOL)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasDurationLPM:(BOOL)a3;
- (void)setHasDurationOffline:(BOOL)a3;
- (void)setHasIsEnd:(BOOL)a3;
- (void)setHasLPM:(BOOL)a3;
- (void)setHasNumStall:(BOOL)a3;
- (void)setHasOffline:(BOOL)a3;
- (void)setHasOnline:(BOOL)a3;
- (void)setHasSamplePeriods:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInstValues:(id)a3;
- (void)setIsEnd:(BOOL)a3;
- (void)setLPM:(BOOL)a3;
- (void)setNumStall:(unsigned int)a3;
- (void)setOffline:(BOOL)a3;
- (void)setOnline:(BOOL)a3;
- (void)setSamplePeriods:(unsigned int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDWRMStreamingReport

- (void)dealloc
{
  [(AWDWRMStreamingReport *)self setInstValues:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMStreamingReport;
  [(AWDWRMStreamingReport *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSamplePeriods:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_samplePeriods = a3;
}

- (void)setHasSamplePeriods:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasSamplePeriods
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDuration
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setIsEnd:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_isEnd = a3;
}

- (void)setHasIsEnd:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasIsEnd
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNumStall:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_numStall = a3;
}

- (void)setHasNumStall:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasNumStall
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setLPM:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_lPM = a3;
}

- (void)setHasLPM:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasLPM
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setOnline:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_online = a3;
}

- (void)setHasOnline:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasOnline
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setOffline:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_offline = a3;
}

- (void)setHasOffline:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasOffline
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setDurationLPM:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_durationLPM = a3;
}

- (void)setHasDurationLPM:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasDurationLPM
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setDurationOffline:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_durationOffline = a3;
}

- (void)setHasDurationOffline:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasDurationOffline
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)clearInstValues
{
}

- (void)addInstValues:(id)a3
{
  instValues = self->_instValues;
  if (!instValues)
  {
    instValues = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_instValues = instValues;
  }

  [(NSMutableArray *)instValues addObject:a3];
}

- (unint64_t)instValuesCount
{
  return [(NSMutableArray *)self->_instValues count];
}

- (id)instValuesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_instValues objectAtIndex:a3];
}

+ (Class)instValuesType
{
  return (Class)objc_opt_class();
}

- (void)setCounter:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_counter = a3;
}

- (void)setHasCounter:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasCounter
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDWRMStreamingReport;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDWRMStreamingReport description](&v3, sel_description), -[AWDWRMStreamingReport dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_26;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_samplePeriods] forKey:@"sample_periods"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_duration] forKey:@"duration"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithBool:self->_isEnd] forKey:@"isEnd"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_numStall] forKey:@"num_stall"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithBool:self->_lPM] forKey:@"LPM"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithBool:self->_online] forKey:@"online"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithBool:self->_offline] forKey:@"offline"];
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_durationLPM] forKey:@"duration_LPM"];
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_11:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_durationOffline] forKey:@"duration_offline"];
LABEL_12:
  if ([(NSMutableArray *)self->_instValues count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_instValues, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    instValues = self->_instValues;
    uint64_t v7 = [(NSMutableArray *)instValues countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(instValues);
          }
          [v5 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)instValues countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"inst_values"];
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_counter] forKey:@"counter"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDWRMStreamingReportReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x10) != 0) {
LABEL_11:
  }
    PBDataWriterWriteUint32Field();
LABEL_12:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  instValues = self->_instValues;
  uint64_t v6 = [(NSMutableArray *)instValues countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(instValues);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)instValues countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
  if ((*(_WORD *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint32Field();
  }
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((_WORD *)a3 + 26) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 11) = self->_samplePeriods;
  *((_WORD *)a3 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)a3 + 5) = self->_duration;
  *((_WORD *)a3 + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)a3 + 48) = self->_isEnd;
  *((_WORD *)a3 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((_DWORD *)a3 + 10) = self->_numStall;
  *((_WORD *)a3 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((unsigned char *)a3 + 49) = self->_lPM;
  *((_WORD *)a3 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((unsigned char *)a3 + 51) = self->_online;
  *((_WORD *)a3 + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
LABEL_27:
    *((_DWORD *)a3 + 6) = self->_durationLPM;
    *((_WORD *)a3 + 26) |= 8u;
    if ((*(_WORD *)&self->_has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_26:
  *((unsigned char *)a3 + 50) = self->_offline;
  *((_WORD *)a3 + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_27;
  }
LABEL_10:
  if ((has & 0x10) != 0)
  {
LABEL_11:
    *((_DWORD *)a3 + 7) = self->_durationOffline;
    *((_WORD *)a3 + 26) |= 0x10u;
  }
LABEL_12:
  if ([(AWDWRMStreamingReport *)self instValuesCount])
  {
    [a3 clearInstValues];
    unint64_t v6 = [(AWDWRMStreamingReport *)self instValuesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addInstValues:-[AWDWRMStreamingReport instValuesAtIndex:](self, "instValuesAtIndex:", i)];
    }
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *((_DWORD *)a3 + 4) = self->_counter;
    *((_WORD *)a3 + 26) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 52) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 44) = self->_samplePeriods;
  *(_WORD *)(v5 + 52) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(_DWORD *)(v5 + 20) = self->_duration;
  *(_WORD *)(v5 + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_5:
    if ((has & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(unsigned char *)(v5 + 48) = self->_isEnd;
  *(_WORD *)(v5 + 52) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(_DWORD *)(v5 + 40) = self->_numStall;
  *(_WORD *)(v5 + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(unsigned char *)(v5 + 49) = self->_lPM;
  *(_WORD *)(v5 + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_8:
    if ((has & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(unsigned char *)(v5 + 51) = self->_online;
  *(_WORD *)(v5 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_9:
    if ((has & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(unsigned char *)(v5 + 50) = self->_offline;
  *(_WORD *)(v5 + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  *(_DWORD *)(v5 + 24) = self->_durationLPM;
  *(_WORD *)(v5 + 52) |= 8u;
  if ((*(_WORD *)&self->_has & 0x10) != 0)
  {
LABEL_11:
    *(_DWORD *)(v5 + 28) = self->_durationOffline;
    *(_WORD *)(v5 + 52) |= 0x10u;
  }
LABEL_12:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  instValues = self->_instValues;
  uint64_t v9 = [(NSMutableArray *)instValues countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(instValues);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addInstValues:v13];
      }
      uint64_t v10 = [(NSMutableArray *)instValues countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v6 + 16) = self->_counter;
    *(_WORD *)(v6 + 52) |= 2u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)a3 + 26);
  if (has)
  {
    if ((v7 & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_71;
    }
  }
  else if (v7)
  {
    goto LABEL_71;
  }
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_samplePeriods != *((_DWORD *)a3 + 11)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_duration != *((_DWORD *)a3 + 5)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_71;
    }
    if (self->_isEnd)
    {
      if (!*((unsigned char *)a3 + 48)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)a3 + 48))
    {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_numStall != *((_DWORD *)a3 + 10)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x100) == 0) {
      goto LABEL_71;
    }
    if (self->_lPM)
    {
      if (!*((unsigned char *)a3 + 49)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)a3 + 49))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x100) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x400) == 0) {
      goto LABEL_71;
    }
    if (self->_online)
    {
      if (!*((unsigned char *)a3 + 51)) {
        goto LABEL_71;
      }
    }
    else if (*((unsigned char *)a3 + 51))
    {
      goto LABEL_71;
    }
  }
  else if ((*((_WORD *)a3 + 26) & 0x400) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x200) != 0) {
      goto LABEL_71;
    }
    goto LABEL_54;
  }
  if ((*((_WORD *)a3 + 26) & 0x200) == 0) {
    goto LABEL_71;
  }
  if (self->_offline)
  {
    if (!*((unsigned char *)a3 + 50)) {
      goto LABEL_71;
    }
    goto LABEL_54;
  }
  if (*((unsigned char *)a3 + 50))
  {
LABEL_71:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_54:
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_durationLPM != *((_DWORD *)a3 + 6)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_durationOffline != *((_DWORD *)a3 + 7)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  instValues = self->_instValues;
  if ((unint64_t)instValues | *((void *)a3 + 4))
  {
    int v5 = -[NSMutableArray isEqual:](instValues, "isEqual:");
    if (!v5) {
      return v5;
    }
    __int16 has = (__int16)self->_has;
  }
  __int16 v9 = *((_WORD *)a3 + 26);
  LOBYTE(v5) = (v9 & 2) == 0;
  if ((has & 2) != 0)
  {
    if ((v9 & 2) == 0 || self->_counter != *((_DWORD *)a3 + 4)) {
      goto LABEL_71;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v16 = 2654435761u * self->_timestamp;
    if ((has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v15 = 2654435761 * self->_samplePeriods;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_14;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if ((has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v15 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v14 = 2654435761 * self->_duration;
    if ((has & 0x80) != 0) {
      goto LABEL_5;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v14 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_5:
    uint64_t v4 = 2654435761 * self->_isEnd;
    if ((has & 0x20) != 0) {
      goto LABEL_6;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v4 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_6:
    uint64_t v5 = 2654435761 * self->_numStall;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v6 = 2654435761 * self->_lPM;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_8;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v6 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_8:
    uint64_t v7 = 2654435761 * self->_online;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_9;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_9:
    uint64_t v8 = 2654435761 * self->_offline;
    if ((has & 8) != 0) {
      goto LABEL_10;
    }
LABEL_20:
    uint64_t v9 = 0;
    if ((has & 0x10) != 0) {
      goto LABEL_11;
    }
    goto LABEL_21;
  }
LABEL_19:
  uint64_t v8 = 0;
  if ((has & 8) == 0) {
    goto LABEL_20;
  }
LABEL_10:
  uint64_t v9 = 2654435761 * self->_durationLPM;
  if ((has & 0x10) != 0)
  {
LABEL_11:
    uint64_t v10 = 2654435761 * self->_durationOffline;
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v10 = 0;
LABEL_22:
  uint64_t v11 = [(NSMutableArray *)self->_instValues hash];
  if ((*(_WORD *)&self->_has & 2) != 0) {
    uint64_t v12 = 2654435761 * self->_counter;
  }
  else {
    uint64_t v12 = 0;
  }
  return v15 ^ v16 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  __int16 v5 = *((_WORD *)a3 + 26);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v5 = *((_WORD *)a3 + 26);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((v5 & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_samplePeriods = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 26);
  if ((v5 & 4) == 0)
  {
LABEL_4:
    if ((v5 & 0x80) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_duration = *((_DWORD *)a3 + 5);
  *(_WORD *)&self->_has |= 4u;
  __int16 v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x80) == 0)
  {
LABEL_5:
    if ((v5 & 0x20) == 0) {
      goto LABEL_6;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_isEnd = *((unsigned char *)a3 + 48);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x20) == 0)
  {
LABEL_6:
    if ((v5 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_numStall = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x100) == 0)
  {
LABEL_7:
    if ((v5 & 0x400) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_lPM = *((unsigned char *)a3 + 49);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x400) == 0)
  {
LABEL_8:
    if ((v5 & 0x200) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_online = *((unsigned char *)a3 + 51);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 26);
  if ((v5 & 0x200) == 0)
  {
LABEL_9:
    if ((v5 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_offline = *((unsigned char *)a3 + 50);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 26);
  if ((v5 & 8) == 0)
  {
LABEL_10:
    if ((v5 & 0x10) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  self->_durationLPM = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 8u;
  if ((*((_WORD *)a3 + 26) & 0x10) != 0)
  {
LABEL_11:
    self->_durationOffline = *((_DWORD *)a3 + 7);
    *(_WORD *)&self->_has |= 0x10u;
  }
LABEL_12:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 4);
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
        [(AWDWRMStreamingReport *)self addInstValues:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
  if ((*((_WORD *)a3 + 26) & 2) != 0)
  {
    self->_counter = *((_DWORD *)a3 + 4);
    *(_WORD *)&self->_has |= 2u;
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unsigned)samplePeriods
{
  return self->_samplePeriods;
}

- (unsigned)duration
{
  return self->_duration;
}

- (BOOL)isEnd
{
  return self->_isEnd;
}

- (unsigned)numStall
{
  return self->_numStall;
}

- (BOOL)lPM
{
  return self->_lPM;
}

- (BOOL)online
{
  return self->_online;
}

- (BOOL)offline
{
  return self->_offline;
}

- (unsigned)durationLPM
{
  return self->_durationLPM;
}

- (unsigned)durationOffline
{
  return self->_durationOffline;
}

- (NSMutableArray)instValues
{
  return self->_instValues;
}

- (void)setInstValues:(id)a3
{
}

- (unsigned)counter
{
  return self->_counter;
}

@end
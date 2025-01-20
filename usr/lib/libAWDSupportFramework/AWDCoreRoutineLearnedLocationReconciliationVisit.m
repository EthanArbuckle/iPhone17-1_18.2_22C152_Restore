@interface AWDCoreRoutineLearnedLocationReconciliationVisit
+ (Class)alternativeVisitsType;
- (BOOL)didUnlock;
- (BOOL)hasDatapointCount;
- (BOOL)hasDeviceClass;
- (BOOL)hasDidUnlock;
- (BOOL)hasNewPlace;
- (BOOL)hasPercentageTransitions;
- (BOOL)hasPercentageVisits;
- (BOOL)hasPlaceAOIPOI;
- (BOOL)hasPlaceLabelType;
- (BOOL)hasPlaceType;
- (BOOL)hasTimestamp;
- (BOOL)hasWatchPresent;
- (BOOL)isEqual:(id)a3;
- (BOOL)newPlace;
- (BOOL)placeAOIPOI;
- (BOOL)readFrom:(id)a3;
- (BOOL)watchPresent;
- (NSMutableArray)alternativeVisits;
- (id)alternativeVisitsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)datapointCount;
- (int)deviceClass;
- (int)percentageTransitions;
- (int)percentageVisits;
- (int)placeLabelType;
- (int)placeType;
- (unint64_t)alternativeVisitsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)addAlternativeVisits:(id)a3;
- (void)clearAlternativeVisits;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAlternativeVisits:(id)a3;
- (void)setDatapointCount:(int)a3;
- (void)setDeviceClass:(int)a3;
- (void)setDidUnlock:(BOOL)a3;
- (void)setHasDatapointCount:(BOOL)a3;
- (void)setHasDeviceClass:(BOOL)a3;
- (void)setHasDidUnlock:(BOOL)a3;
- (void)setHasNewPlace:(BOOL)a3;
- (void)setHasPercentageTransitions:(BOOL)a3;
- (void)setHasPercentageVisits:(BOOL)a3;
- (void)setHasPlaceAOIPOI:(BOOL)a3;
- (void)setHasPlaceLabelType:(BOOL)a3;
- (void)setHasPlaceType:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasWatchPresent:(BOOL)a3;
- (void)setNewPlace:(BOOL)a3;
- (void)setPercentageTransitions:(int)a3;
- (void)setPercentageVisits:(int)a3;
- (void)setPlaceAOIPOI:(BOOL)a3;
- (void)setPlaceLabelType:(int)a3;
- (void)setPlaceType:(int)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setWatchPresent:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLearnedLocationReconciliationVisit

- (void)dealloc
{
  [(AWDCoreRoutineLearnedLocationReconciliationVisit *)self setAlternativeVisits:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedLocationReconciliationVisit;
  [(AWDCoreRoutineLearnedLocationReconciliationVisit *)&v3 dealloc];
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

- (void)setDatapointCount:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_datapointCount = a3;
}

- (void)setHasDatapointCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDatapointCount
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setDeviceClass:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_deviceClass = a3;
}

- (void)setHasDeviceClass:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasDeviceClass
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setWatchPresent:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_watchPresent = a3;
}

- (void)setHasWatchPresent:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasWatchPresent
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setDidUnlock:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_didUnlock = a3;
}

- (void)setHasDidUnlock:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasDidUnlock
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setNewPlace:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_newPlace = a3;
}

- (void)setHasNewPlace:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasNewPlace
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPlaceType:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_placeType = a3;
}

- (void)setHasPlaceType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPlaceType
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setPlaceLabelType:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_placeLabelType = a3;
}

- (void)setHasPlaceLabelType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPlaceLabelType
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPlaceAOIPOI:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_placeAOIPOI = a3;
}

- (void)setHasPlaceAOIPOI:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasPlaceAOIPOI
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setPercentageVisits:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_percentageVisits = a3;
}

- (void)setHasPercentageVisits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasPercentageVisits
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setPercentageTransitions:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_percentageTransitions = a3;
}

- (void)setHasPercentageTransitions:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasPercentageTransitions
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)clearAlternativeVisits
{
}

- (void)addAlternativeVisits:(id)a3
{
  alternativeVisits = self->_alternativeVisits;
  if (!alternativeVisits)
  {
    alternativeVisits = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_alternativeVisits = alternativeVisits;
  }

  [(NSMutableArray *)alternativeVisits addObject:a3];
}

- (unint64_t)alternativeVisitsCount
{
  return [(NSMutableArray *)self->_alternativeVisits count];
}

- (id)alternativeVisitsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_alternativeVisits objectAtIndex:a3];
}

+ (Class)alternativeVisitsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedLocationReconciliationVisit;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLearnedLocationReconciliationVisit description](&v3, sel_description), -[AWDCoreRoutineLearnedLocationReconciliationVisit dictionaryRepresentation](self, "dictionaryRepresentation")];
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_datapointCount] forKey:@"datapointCount"];
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  [v3 setObject:[NSNumber numberWithInt:self->_deviceClass] forKey:@"deviceClass"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  [v3 setObject:[NSNumber numberWithBool:self->_watchPresent] forKey:@"watchPresent"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithBool:self->_didUnlock] forKey:@"didUnlock"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_29;
  }
LABEL_28:
  [v3 setObject:[NSNumber numberWithBool:self->_newPlace] forKey:@"newPlace"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_30;
  }
LABEL_29:
  [v3 setObject:[NSNumber numberWithInt:self->_placeType] forKey:@"placeType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_31;
  }
LABEL_30:
  [v3 setObject:[NSNumber numberWithInt:self->_placeLabelType] forKey:@"placeLabelType"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithBool:self->_placeAOIPOI] forKey:@"placeAOIPOI"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithInt:self->_percentageVisits] forKey:@"percentageVisits"];
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_12:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_percentageTransitions] forKey:@"percentageTransitions"];
LABEL_13:
  if ([(NSMutableArray *)self->_alternativeVisits count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_alternativeVisits, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    alternativeVisits = self->_alternativeVisits;
    uint64_t v7 = [(NSMutableArray *)alternativeVisits countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(alternativeVisits);
          }
          [v5 addObject:[(*(id *)(*((void *)&v12 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)alternativeVisits countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"alternativeVisits"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLearnedLocationReconciliationVisitReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  if ((*(_WORD *)&self->_has & 8) != 0) {
LABEL_12:
  }
    PBDataWriterWriteInt32Field();
LABEL_13:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  alternativeVisits = self->_alternativeVisits;
  uint64_t v6 = [(NSMutableArray *)alternativeVisits countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(alternativeVisits);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)alternativeVisits countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
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
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_20;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 6) = self->_datapointCount;
  *((_WORD *)a3 + 26) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)a3 + 7) = self->_deviceClass;
  *((_WORD *)a3 + 26) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((unsigned char *)a3 + 51) = self->_watchPresent;
  *((_WORD *)a3 + 26) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((unsigned char *)a3 + 48) = self->_didUnlock;
  *((_WORD *)a3 + 26) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_24;
  }
LABEL_23:
  *((unsigned char *)a3 + 49) = self->_newPlace;
  *((_WORD *)a3 + 26) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((_DWORD *)a3 + 11) = self->_placeType;
  *((_WORD *)a3 + 26) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 10) = self->_placeLabelType;
  *((_WORD *)a3 + 26) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
LABEL_27:
    *((_DWORD *)a3 + 9) = self->_percentageVisits;
    *((_WORD *)a3 + 26) |= 0x10u;
    if ((*(_WORD *)&self->_has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_26:
  *((unsigned char *)a3 + 50) = self->_placeAOIPOI;
  *((_WORD *)a3 + 26) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_27;
  }
LABEL_11:
  if ((has & 8) != 0)
  {
LABEL_12:
    *((_DWORD *)a3 + 8) = self->_percentageTransitions;
    *((_WORD *)a3 + 26) |= 8u;
  }
LABEL_13:
  if ([(AWDCoreRoutineLearnedLocationReconciliationVisit *)self alternativeVisitsCount])
  {
    [a3 clearAlternativeVisits];
    unint64_t v6 = [(AWDCoreRoutineLearnedLocationReconciliationVisit *)self alternativeVisitsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addAlternativeVisits:-[AWDCoreRoutineLearnedLocationReconciliationVisit alternativeVisitsAtIndex:](self, "alternativeVisitsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(_WORD *)(v5 + 52) |= 1u;
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 24) = self->_datapointCount;
  *(_WORD *)(v5 + 52) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  *(_DWORD *)(v5 + 28) = self->_deviceClass;
  *(_WORD *)(v5 + 52) |= 4u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  *(unsigned char *)(v5 + 51) = self->_watchPresent;
  *(_WORD *)(v5 + 52) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  *(unsigned char *)(v5 + 48) = self->_didUnlock;
  *(_WORD *)(v5 + 52) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  *(unsigned char *)(v5 + 49) = self->_newPlace;
  *(_WORD *)(v5 + 52) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_8:
    if ((has & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 44) = self->_placeType;
  *(_WORD *)(v5 + 52) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_9:
    if ((has & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 40) = self->_placeLabelType;
  *(_WORD *)(v5 + 52) |= 0x20u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x200) == 0)
  {
LABEL_10:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(unsigned char *)(v5 + 50) = self->_placeAOIPOI;
  *(_WORD *)(v5 + 52) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_30:
  *(_DWORD *)(v5 + 36) = self->_percentageVisits;
  *(_WORD *)(v5 + 52) |= 0x10u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_12:
    *(_DWORD *)(v5 + 32) = self->_percentageTransitions;
    *(_WORD *)(v5 + 52) |= 8u;
  }
LABEL_13:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  alternativeVisits = self->_alternativeVisits;
  uint64_t v9 = [(NSMutableArray *)alternativeVisits countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(alternativeVisits);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addAlternativeVisits:v13];
      }
      uint64_t v10 = [(NSMutableArray *)alternativeVisits countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }
  return v6;
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
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_datapointCount != *((_DWORD *)a3 + 6)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_deviceClass != *((_DWORD *)a3 + 7)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x400) == 0) {
      goto LABEL_71;
    }
    if (self->_watchPresent)
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
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0) {
      goto LABEL_71;
    }
    if (self->_didUnlock)
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
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x100) == 0) {
      goto LABEL_71;
    }
    if (self->_newPlace)
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
  if ((has & 0x40) != 0)
  {
    if ((v7 & 0x40) == 0 || self->_placeType != *((_DWORD *)a3 + 11)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x40) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 0x20) != 0)
  {
    if ((v7 & 0x20) == 0 || self->_placeLabelType != *((_DWORD *)a3 + 10)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x20) != 0)
  {
    goto LABEL_71;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 26) & 0x200) != 0) {
      goto LABEL_71;
    }
    goto LABEL_59;
  }
  if ((*((_WORD *)a3 + 26) & 0x200) == 0) {
    goto LABEL_71;
  }
  if (self->_placeAOIPOI)
  {
    if (!*((unsigned char *)a3 + 50)) {
      goto LABEL_71;
    }
    goto LABEL_59;
  }
  if (*((unsigned char *)a3 + 50))
  {
LABEL_71:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_59:
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_percentageVisits != *((_DWORD *)a3 + 9)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_71;
  }
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_percentageTransitions != *((_DWORD *)a3 + 8)) {
      goto LABEL_71;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_71;
  }
  alternativeVisits = self->_alternativeVisits;
  if ((unint64_t)alternativeVisits | *((void *)a3 + 2))
  {
    LOBYTE(v5) = -[NSMutableArray isEqual:](alternativeVisits, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_datapointCount;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_deviceClass;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_5;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_watchPresent;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_didUnlock;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v7 = 0;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_newPlace;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_19;
  }
LABEL_18:
  uint64_t v8 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v9 = 2654435761 * self->_placeType;
    if ((has & 0x20) != 0) {
      goto LABEL_9;
    }
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v9 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_9:
    uint64_t v10 = 2654435761 * self->_placeLabelType;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_10;
    }
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_10:
    uint64_t v11 = 2654435761 * self->_placeAOIPOI;
    if ((has & 0x10) != 0) {
      goto LABEL_11;
    }
LABEL_22:
    uint64_t v12 = 0;
    if ((has & 8) != 0) {
      goto LABEL_12;
    }
LABEL_23:
    uint64_t v13 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSMutableArray *)self->_alternativeVisits hash];
  }
LABEL_21:
  uint64_t v11 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_22;
  }
LABEL_11:
  uint64_t v12 = 2654435761 * self->_percentageVisits;
  if ((has & 8) == 0) {
    goto LABEL_23;
  }
LABEL_12:
  uint64_t v13 = 2654435761 * self->_percentageTransitions;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(NSMutableArray *)self->_alternativeVisits hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  __int16 v4 = *((_WORD *)a3 + 26);
  if (v4)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(_WORD *)&self->_has |= 1u;
    __int16 v4 = *((_WORD *)a3 + 26);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_datapointCount = *((_DWORD *)a3 + 6);
  *(_WORD *)&self->_has |= 2u;
  __int16 v4 = *((_WORD *)a3 + 26);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 0x400) == 0) {
      goto LABEL_5;
    }
    goto LABEL_24;
  }
LABEL_23:
  self->_deviceClass = *((_DWORD *)a3 + 7);
  *(_WORD *)&self->_has |= 4u;
  __int16 v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x400) == 0)
  {
LABEL_5:
    if ((v4 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_25;
  }
LABEL_24:
  self->_watchPresent = *((unsigned char *)a3 + 51);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x80) == 0)
  {
LABEL_6:
    if ((v4 & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_26;
  }
LABEL_25:
  self->_didUnlock = *((unsigned char *)a3 + 48);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x100) == 0)
  {
LABEL_7:
    if ((v4 & 0x40) == 0) {
      goto LABEL_8;
    }
    goto LABEL_27;
  }
LABEL_26:
  self->_newPlace = *((unsigned char *)a3 + 49);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x40) == 0)
  {
LABEL_8:
    if ((v4 & 0x20) == 0) {
      goto LABEL_9;
    }
    goto LABEL_28;
  }
LABEL_27:
  self->_placeType = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x20) == 0)
  {
LABEL_9:
    if ((v4 & 0x200) == 0) {
      goto LABEL_10;
    }
    goto LABEL_29;
  }
LABEL_28:
  self->_placeLabelType = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x200) == 0)
  {
LABEL_10:
    if ((v4 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_placeAOIPOI = *((unsigned char *)a3 + 50);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v4 = *((_WORD *)a3 + 26);
  if ((v4 & 0x10) == 0)
  {
LABEL_11:
    if ((v4 & 8) == 0) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_30:
  self->_percentageVisits = *((_DWORD *)a3 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 26) & 8) != 0)
  {
LABEL_12:
    self->_percentageTransitions = *((_DWORD *)a3 + 8);
    *(_WORD *)&self->_has |= 8u;
  }
LABEL_13:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDCoreRoutineLearnedLocationReconciliationVisit *)self addAlternativeVisits:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)datapointCount
{
  return self->_datapointCount;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

- (BOOL)watchPresent
{
  return self->_watchPresent;
}

- (BOOL)didUnlock
{
  return self->_didUnlock;
}

- (BOOL)newPlace
{
  return self->_newPlace;
}

- (int)placeType
{
  return self->_placeType;
}

- (int)placeLabelType
{
  return self->_placeLabelType;
}

- (BOOL)placeAOIPOI
{
  return self->_placeAOIPOI;
}

- (int)percentageVisits
{
  return self->_percentageVisits;
}

- (int)percentageTransitions
{
  return self->_percentageTransitions;
}

- (NSMutableArray)alternativeVisits
{
  return self->_alternativeVisits;
}

- (void)setAlternativeVisits:(id)a3
{
}

@end
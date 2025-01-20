@interface AWDCoreRoutineLearnedLocationTrainingMetrics
+ (Class)placesType;
+ (Class)visitsType;
- (BOOL)hasIntervalSinceLastAttempt;
- (BOOL)hasLatency;
- (BOOL)hasLocationsProcessed;
- (BOOL)hasMaxIntervalBetweenLocations;
- (BOOL)hasPlaceCountDevice;
- (BOOL)hasPlaceCountTotal;
- (BOOL)hasTimestamp;
- (BOOL)hasTrainedVisits;
- (BOOL)hasVisitCountDevice;
- (BOOL)hasVisitCountTotal;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)trainedVisits;
- (NSMutableArray)places;
- (NSMutableArray)visits;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)placesAtIndex:(unint64_t)a3;
- (id)visitsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)intervalSinceLastAttempt;
- (unint64_t)latency;
- (unint64_t)maxIntervalBetweenLocations;
- (unint64_t)placesCount;
- (unint64_t)timestamp;
- (unint64_t)visitsCount;
- (unsigned)locationsProcessed;
- (unsigned)placeCountDevice;
- (unsigned)placeCountTotal;
- (unsigned)visitCountDevice;
- (unsigned)visitCountTotal;
- (void)addPlaces:(id)a3;
- (void)addVisits:(id)a3;
- (void)clearPlaces;
- (void)clearVisits;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasIntervalSinceLastAttempt:(BOOL)a3;
- (void)setHasLatency:(BOOL)a3;
- (void)setHasLocationsProcessed:(BOOL)a3;
- (void)setHasMaxIntervalBetweenLocations:(BOOL)a3;
- (void)setHasPlaceCountDevice:(BOOL)a3;
- (void)setHasPlaceCountTotal:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTrainedVisits:(BOOL)a3;
- (void)setHasVisitCountDevice:(BOOL)a3;
- (void)setHasVisitCountTotal:(BOOL)a3;
- (void)setIntervalSinceLastAttempt:(unint64_t)a3;
- (void)setLatency:(unint64_t)a3;
- (void)setLocationsProcessed:(unsigned int)a3;
- (void)setMaxIntervalBetweenLocations:(unint64_t)a3;
- (void)setPlaceCountDevice:(unsigned int)a3;
- (void)setPlaceCountTotal:(unsigned int)a3;
- (void)setPlaces:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTrainedVisits:(BOOL)a3;
- (void)setVisitCountDevice:(unsigned int)a3;
- (void)setVisitCountTotal:(unsigned int)a3;
- (void)setVisits:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLearnedLocationTrainingMetrics

- (void)dealloc
{
  [(AWDCoreRoutineLearnedLocationTrainingMetrics *)self setVisits:0];
  [(AWDCoreRoutineLearnedLocationTrainingMetrics *)self setPlaces:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedLocationTrainingMetrics;
  [(AWDCoreRoutineLearnedLocationTrainingMetrics *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasTimestamp
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setTrainedVisits:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_trainedVisits = a3;
}

- (void)setHasTrainedVisits:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTrainedVisits
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setIntervalSinceLastAttempt:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_intervalSinceLastAttempt = a3;
}

- (void)setHasIntervalSinceLastAttempt:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasIntervalSinceLastAttempt
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setLatency:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_latency = a3;
}

- (void)setHasLatency:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasLatency
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setLocationsProcessed:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_locationsProcessed = a3;
}

- (void)setHasLocationsProcessed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLocationsProcessed
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setMaxIntervalBetweenLocations:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_maxIntervalBetweenLocations = a3;
}

- (void)setHasMaxIntervalBetweenLocations:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasMaxIntervalBetweenLocations
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)clearVisits
{
}

- (void)addVisits:(id)a3
{
  visits = self->_visits;
  if (!visits)
  {
    visits = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_visits = visits;
  }

  [(NSMutableArray *)visits addObject:a3];
}

- (unint64_t)visitsCount
{
  return [(NSMutableArray *)self->_visits count];
}

- (id)visitsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_visits objectAtIndex:a3];
}

+ (Class)visitsType
{
  return (Class)objc_opt_class();
}

- (void)clearPlaces
{
}

- (void)addPlaces:(id)a3
{
  places = self->_places;
  if (!places)
  {
    places = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_places = places;
  }

  [(NSMutableArray *)places addObject:a3];
}

- (unint64_t)placesCount
{
  return [(NSMutableArray *)self->_places count];
}

- (id)placesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_places objectAtIndex:a3];
}

+ (Class)placesType
{
  return (Class)objc_opt_class();
}

- (void)setVisitCountDevice:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_visitCountDevice = a3;
}

- (void)setHasVisitCountDevice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasVisitCountDevice
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setVisitCountTotal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_visitCountTotal = a3;
}

- (void)setHasVisitCountTotal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasVisitCountTotal
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setPlaceCountDevice:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_placeCountDevice = a3;
}

- (void)setHasPlaceCountDevice:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasPlaceCountDevice
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setPlaceCountTotal:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_placeCountTotal = a3;
}

- (void)setHasPlaceCountTotal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasPlaceCountTotal
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedLocationTrainingMetrics;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLearnedLocationTrainingMetrics description](&v3, sel_description), -[AWDCoreRoutineLearnedLocationTrainingMetrics dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_34;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_trainedVisits] forKey:@"trainedVisits"];
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_intervalSinceLastAttempt] forKey:@"intervalSinceLastAttempt"];
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_36;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_latency] forKey:@"latency"];
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_36:
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_locationsProcessed] forKey:@"locationsProcessed"];
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_7:
  }
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_maxIntervalBetweenLocations] forKey:@"maxIntervalBetweenLocations"];
LABEL_8:
  if ([(NSMutableArray *)self->_visits count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_visits, "count")];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    visits = self->_visits;
    uint64_t v7 = [(NSMutableArray *)visits countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(visits);
          }
          [v5 addObject:[*(id *)(*((void *)&v23 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)visits countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"visits"];
  }
  if ([(NSMutableArray *)self->_places count])
  {
    v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_places, "count")];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    places = self->_places;
    uint64_t v13 = [(NSMutableArray *)places countByEnumeratingWithState:&v19 objects:v27 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v20;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v20 != v15) {
            objc_enumerationMutation(places);
          }
          [v11 addObject:[*(id *)(*((void *)&v19 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v14 = [(NSMutableArray *)places countByEnumeratingWithState:&v19 objects:v27 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"places"];
  }
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x80) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_visitCountDevice] forKey:@"visitCountDevice"];
    __int16 v17 = (__int16)self->_has;
    if ((v17 & 0x100) == 0)
    {
LABEL_28:
      if ((v17 & 0x20) == 0) {
        goto LABEL_29;
      }
LABEL_40:
      [v3 setObject:[NSNumber numberWithUnsignedInt:self->_placeCountDevice] forKey:@"placeCountDevice"];
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        return v3;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_28;
  }
  [v3 setObject:[NSNumber numberWithUnsignedInt:self->_visitCountTotal] forKey:@"visitCountTotal"];
  __int16 v17 = (__int16)self->_has;
  if ((v17 & 0x20) != 0) {
    goto LABEL_40;
  }
LABEL_29:
  if ((v17 & 0x40) != 0) {
LABEL_30:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_placeCountTotal] forKey:@"placeCountTotal"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLearnedLocationTrainingMetricsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_32:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 4) != 0) {
LABEL_7:
  }
    PBDataWriterWriteUint64Field();
LABEL_8:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  visits = self->_visits;
  uint64_t v6 = [(NSMutableArray *)visits countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(visits);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)visits countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  places = self->_places;
  uint64_t v11 = [(NSMutableArray *)places countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(places);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)places countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v12);
  }
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x80) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x100) == 0)
    {
LABEL_24:
      if ((v15 & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_36;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_24;
  }
  PBDataWriterWriteUint32Field();
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x20) == 0)
  {
LABEL_25:
    if ((v15 & 0x40) == 0) {
      return;
    }
    goto LABEL_26;
  }
LABEL_36:
  PBDataWriterWriteUint32Field();
  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    return;
  }
LABEL_26:
  PBDataWriterWriteUint32Field();
}

- (void)copyTo:(id)a3
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((_WORD *)a3 + 42) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_24;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)a3 + 80) = self->_trainedVisits;
  *((_WORD *)a3 + 42) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_25;
  }
LABEL_24:
  *((void *)a3 + 1) = self->_intervalSinceLastAttempt;
  *((_WORD *)a3 + 42) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
LABEL_26:
    *((_DWORD *)a3 + 10) = self->_locationsProcessed;
    *((_WORD *)a3 + 42) |= 0x10u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_25:
  *((void *)a3 + 2) = self->_latency;
  *((_WORD *)a3 + 42) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) != 0) {
    goto LABEL_26;
  }
LABEL_6:
  if ((has & 4) != 0)
  {
LABEL_7:
    *((void *)a3 + 3) = self->_maxIntervalBetweenLocations;
    *((_WORD *)a3 + 42) |= 4u;
  }
LABEL_8:
  if ([(AWDCoreRoutineLearnedLocationTrainingMetrics *)self visitsCount])
  {
    [a3 clearVisits];
    unint64_t v6 = [(AWDCoreRoutineLearnedLocationTrainingMetrics *)self visitsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addVisits:-[AWDCoreRoutineLearnedLocationTrainingMetrics visitsAtIndex:](self, "visitsAtIndex:", i)];
    }
  }
  if ([(AWDCoreRoutineLearnedLocationTrainingMetrics *)self placesCount])
  {
    [a3 clearPlaces];
    unint64_t v9 = [(AWDCoreRoutineLearnedLocationTrainingMetrics *)self placesCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addPlaces:-[AWDCoreRoutineLearnedLocationTrainingMetrics placesAtIndex:](self, "placesAtIndex:", j)];
    }
  }
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x80) != 0)
  {
    *((_DWORD *)a3 + 16) = self->_visitCountDevice;
    *((_WORD *)a3 + 42) |= 0x80u;
    __int16 v12 = (__int16)self->_has;
    if ((v12 & 0x100) == 0)
    {
LABEL_18:
      if ((v12 & 0x20) == 0) {
        goto LABEL_19;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_18;
  }
  *((_DWORD *)a3 + 17) = self->_visitCountTotal;
  *((_WORD *)a3 + 42) |= 0x100u;
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x20) == 0)
  {
LABEL_19:
    if ((v12 & 0x40) == 0) {
      return;
    }
    goto LABEL_20;
  }
LABEL_30:
  *((_DWORD *)a3 + 11) = self->_placeCountDevice;
  *((_WORD *)a3 + 42) |= 0x20u;
  if ((*(_WORD *)&self->_has & 0x40) == 0) {
    return;
  }
LABEL_20:
  *((_DWORD *)a3 + 12) = self->_placeCountTotal;
  *((_WORD *)a3 + 42) |= 0x40u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x263EF8340];
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  uint64_t v6 = v5;
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(_WORD *)(v5 + 84) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 80) = self->_trainedVisits;
  *(_WORD *)(v5 + 84) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(void *)(v5 + 8) = self->_intervalSinceLastAttempt;
  *(_WORD *)(v5 + 84) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 2) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  *(void *)(v5 + 16) = self->_latency;
  *(_WORD *)(v5 + 84) |= 2u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_6:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_32:
  *(_DWORD *)(v5 + 40) = self->_locationsProcessed;
  *(_WORD *)(v5 + 84) |= 0x10u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_7:
    *(void *)(v5 + 24) = self->_maxIntervalBetweenLocations;
    *(_WORD *)(v5 + 84) |= 4u;
  }
LABEL_8:
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  visits = self->_visits;
  uint64_t v9 = [(NSMutableArray *)visits countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v11) {
          objc_enumerationMutation(visits);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v26 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addVisits:v13];
      }
      uint64_t v10 = [(NSMutableArray *)visits countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v10);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  places = self->_places;
  uint64_t v15 = [(NSMutableArray *)places countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(places);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v22 + 1) + 8 * j) copyWithZone:a3];
        [(id)v6 addPlaces:v19];
      }
      uint64_t v16 = [(NSMutableArray *)places countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x80) != 0)
  {
    *(_DWORD *)(v6 + 64) = self->_visitCountDevice;
    *(_WORD *)(v6 + 84) |= 0x80u;
    __int16 v20 = (__int16)self->_has;
    if ((v20 & 0x100) == 0)
    {
LABEL_24:
      if ((v20 & 0x20) == 0) {
        goto LABEL_25;
      }
LABEL_36:
      *(_DWORD *)(v6 + 44) = self->_placeCountDevice;
      *(_WORD *)(v6 + 84) |= 0x20u;
      if ((*(_WORD *)&self->_has & 0x40) == 0) {
        return (id)v6;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_24;
  }
  *(_DWORD *)(v6 + 68) = self->_visitCountTotal;
  *(_WORD *)(v6 + 84) |= 0x100u;
  __int16 v20 = (__int16)self->_has;
  if ((v20 & 0x20) != 0) {
    goto LABEL_36;
  }
LABEL_25:
  if ((v20 & 0x40) != 0)
  {
LABEL_26:
    *(_DWORD *)(v6 + 48) = self->_placeCountTotal;
    *(_WORD *)(v6 + 84) |= 0x40u;
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
  __int16 v7 = *((_WORD *)a3 + 42);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_timestamp != *((void *)a3 + 4)) {
      goto LABEL_58;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_58;
  }
  if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    if ((*((_WORD *)a3 + 42) & 0x200) != 0) {
      goto LABEL_58;
    }
    goto LABEL_15;
  }
  if ((*((_WORD *)a3 + 42) & 0x200) == 0) {
    goto LABEL_58;
  }
  if (self->_trainedVisits)
  {
    if (!*((unsigned char *)a3 + 80)) {
      goto LABEL_58;
    }
    goto LABEL_15;
  }
  if (*((unsigned char *)a3 + 80))
  {
LABEL_58:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  if (has)
  {
    if ((v7 & 1) == 0 || self->_intervalSinceLastAttempt != *((void *)a3 + 1)) {
      goto LABEL_58;
    }
  }
  else if (v7)
  {
    goto LABEL_58;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_latency != *((void *)a3 + 2)) {
      goto LABEL_58;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 0x10) != 0)
  {
    if ((v7 & 0x10) == 0 || self->_locationsProcessed != *((_DWORD *)a3 + 10)) {
      goto LABEL_58;
    }
  }
  else if ((v7 & 0x10) != 0)
  {
    goto LABEL_58;
  }
  if ((has & 4) != 0)
  {
    if ((v7 & 4) == 0 || self->_maxIntervalBetweenLocations != *((void *)a3 + 3)) {
      goto LABEL_58;
    }
  }
  else if ((v7 & 4) != 0)
  {
    goto LABEL_58;
  }
  visits = self->_visits;
  if (!((unint64_t)visits | *((void *)a3 + 9)) || (int v5 = -[NSMutableArray isEqual:](visits, "isEqual:")) != 0)
  {
    places = self->_places;
    if (!((unint64_t)places | *((void *)a3 + 7)) || (int v5 = -[NSMutableArray isEqual:](places, "isEqual:")) != 0)
    {
      __int16 v10 = (__int16)self->_has;
      __int16 v11 = *((_WORD *)a3 + 42);
      if ((v10 & 0x80) != 0)
      {
        if ((v11 & 0x80) == 0 || self->_visitCountDevice != *((_DWORD *)a3 + 16)) {
          goto LABEL_58;
        }
      }
      else if ((v11 & 0x80) != 0)
      {
        goto LABEL_58;
      }
      if ((*(_WORD *)&self->_has & 0x100) != 0)
      {
        if ((*((_WORD *)a3 + 42) & 0x100) == 0 || self->_visitCountTotal != *((_DWORD *)a3 + 17)) {
          goto LABEL_58;
        }
      }
      else if ((*((_WORD *)a3 + 42) & 0x100) != 0)
      {
        goto LABEL_58;
      }
      if ((v10 & 0x20) != 0)
      {
        if ((v11 & 0x20) == 0 || self->_placeCountDevice != *((_DWORD *)a3 + 11)) {
          goto LABEL_58;
        }
      }
      else if ((v11 & 0x20) != 0)
      {
        goto LABEL_58;
      }
      LOBYTE(v5) = (v11 & 0x40) == 0;
      if ((v10 & 0x40) != 0)
      {
        if ((v11 & 0x40) == 0 || self->_placeCountTotal != *((_DWORD *)a3 + 12)) {
          goto LABEL_58;
        }
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    unint64_t v4 = 2654435761u * self->_timestamp;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_trainedVisits;
      if (has) {
        goto LABEL_4;
      }
      goto LABEL_10;
    }
  }
  else
  {
    unint64_t v4 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if (has)
  {
LABEL_4:
    unint64_t v6 = 2654435761u * self->_intervalSinceLastAttempt;
    if ((has & 2) != 0) {
      goto LABEL_5;
    }
    goto LABEL_11;
  }
LABEL_10:
  unint64_t v6 = 0;
  if ((has & 2) != 0)
  {
LABEL_5:
    unint64_t v7 = 2654435761u * self->_latency;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_12:
    uint64_t v8 = 0;
    if ((has & 4) != 0) {
      goto LABEL_7;
    }
    goto LABEL_13;
  }
LABEL_11:
  unint64_t v7 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_12;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_locationsProcessed;
  if ((has & 4) != 0)
  {
LABEL_7:
    unint64_t v9 = 2654435761u * self->_maxIntervalBetweenLocations;
    goto LABEL_14;
  }
LABEL_13:
  unint64_t v9 = 0;
LABEL_14:
  uint64_t v10 = [(NSMutableArray *)self->_visits hash];
  uint64_t v11 = [(NSMutableArray *)self->_places hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x80) != 0)
  {
    uint64_t v13 = 2654435761 * self->_visitCountDevice;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_16:
      uint64_t v14 = 2654435761 * self->_visitCountTotal;
      if ((v12 & 0x20) != 0) {
        goto LABEL_17;
      }
LABEL_21:
      uint64_t v15 = 0;
      if ((v12 & 0x40) != 0) {
        goto LABEL_18;
      }
LABEL_22:
      uint64_t v16 = 0;
      return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
    }
  }
  else
  {
    uint64_t v13 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_16;
    }
  }
  uint64_t v14 = 0;
  if ((v12 & 0x20) == 0) {
    goto LABEL_21;
  }
LABEL_17:
  uint64_t v15 = 2654435761 * self->_placeCountDevice;
  if ((v12 & 0x40) == 0) {
    goto LABEL_22;
  }
LABEL_18:
  uint64_t v16 = 2654435761 * self->_placeCountTotal;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 8) != 0)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)a3 + 42);
    if ((v5 & 0x200) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x200) == 0)
  {
    goto LABEL_3;
  }
  self->_trainedVisits = *((unsigned char *)a3 + 80);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_intervalSinceLastAttempt = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 2) == 0)
  {
LABEL_5:
    if ((v5 & 0x10) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_latency = *((void *)a3 + 2);
  *(_WORD *)&self->_has |= 2u;
  __int16 v5 = *((_WORD *)a3 + 42);
  if ((v5 & 0x10) == 0)
  {
LABEL_6:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_7;
  }
LABEL_32:
  self->_locationsProcessed = *((_DWORD *)a3 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  if ((*((_WORD *)a3 + 42) & 4) != 0)
  {
LABEL_7:
    self->_maxIntervalBetweenLocations = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_8:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  unint64_t v6 = (void *)*((void *)a3 + 9);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v22 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDCoreRoutineLearnedLocationTrainingMetrics *)self addVisits:*(void *)(*((void *)&v21 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v8);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v18 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AWDCoreRoutineLearnedLocationTrainingMetrics *)self addPlaces:*(void *)(*((void *)&v17 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v13);
  }
  __int16 v16 = *((_WORD *)a3 + 42);
  if ((v16 & 0x80) != 0)
  {
    self->_visitCountDevice = *((_DWORD *)a3 + 16);
    *(_WORD *)&self->_has |= 0x80u;
    __int16 v16 = *((_WORD *)a3 + 42);
    if ((v16 & 0x100) == 0)
    {
LABEL_24:
      if ((v16 & 0x20) == 0) {
        goto LABEL_25;
      }
      goto LABEL_36;
    }
  }
  else if ((*((_WORD *)a3 + 42) & 0x100) == 0)
  {
    goto LABEL_24;
  }
  self->_visitCountTotal = *((_DWORD *)a3 + 17);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v16 = *((_WORD *)a3 + 42);
  if ((v16 & 0x20) == 0)
  {
LABEL_25:
    if ((v16 & 0x40) == 0) {
      return;
    }
    goto LABEL_26;
  }
LABEL_36:
  self->_placeCountDevice = *((_DWORD *)a3 + 11);
  *(_WORD *)&self->_has |= 0x20u;
  if ((*((_WORD *)a3 + 42) & 0x40) == 0) {
    return;
  }
LABEL_26:
  self->_placeCountTotal = *((_DWORD *)a3 + 12);
  *(_WORD *)&self->_has |= 0x40u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (BOOL)trainedVisits
{
  return self->_trainedVisits;
}

- (unint64_t)intervalSinceLastAttempt
{
  return self->_intervalSinceLastAttempt;
}

- (unint64_t)latency
{
  return self->_latency;
}

- (unsigned)locationsProcessed
{
  return self->_locationsProcessed;
}

- (unint64_t)maxIntervalBetweenLocations
{
  return self->_maxIntervalBetweenLocations;
}

- (NSMutableArray)visits
{
  return self->_visits;
}

- (void)setVisits:(id)a3
{
}

- (NSMutableArray)places
{
  return self->_places;
}

- (void)setPlaces:(id)a3
{
}

- (unsigned)visitCountDevice
{
  return self->_visitCountDevice;
}

- (unsigned)visitCountTotal
{
  return self->_visitCountTotal;
}

- (unsigned)placeCountDevice
{
  return self->_placeCountDevice;
}

- (unsigned)placeCountTotal
{
  return self->_placeCountTotal;
}

@end
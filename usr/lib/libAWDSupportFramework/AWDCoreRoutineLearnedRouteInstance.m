@interface AWDCoreRoutineLearnedRouteInstance
+ (Class)locationTypeHistogramType;
+ (Class)roadClassHistogramType;
- (BOOL)hasFailureReason;
- (BOOL)hasLatitudeTruncated;
- (BOOL)hasLength;
- (BOOL)hasLongitudeTruncated;
- (BOOL)hasNumberOfFilteredLocations;
- (BOOL)hasNumberOfInputLocations;
- (BOOL)hasRecoveryTime;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)locationTypeHistograms;
- (NSMutableArray)roadClassHistograms;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)locationTypeHistogramAtIndex:(unint64_t)a3;
- (id)roadClassHistogramAtIndex:(unint64_t)a3;
- (int)failureReason;
- (int)latitudeTruncated;
- (int)length;
- (int)longitudeTruncated;
- (int)majorGapLengthAtIndex:(unint64_t)a3;
- (int)majorGapLengths;
- (int)numberOfFilteredLocations;
- (int)numberOfInputLocations;
- (int)recoveryTime;
- (unint64_t)hash;
- (unint64_t)locationTypeHistogramsCount;
- (unint64_t)majorGapLengthsCount;
- (unint64_t)roadClassHistogramsCount;
- (unint64_t)timestamp;
- (void)addLocationTypeHistogram:(id)a3;
- (void)addMajorGapLength:(int)a3;
- (void)addRoadClassHistogram:(id)a3;
- (void)clearLocationTypeHistograms;
- (void)clearMajorGapLengths;
- (void)clearRoadClassHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setFailureReason:(int)a3;
- (void)setHasFailureReason:(BOOL)a3;
- (void)setHasLatitudeTruncated:(BOOL)a3;
- (void)setHasLength:(BOOL)a3;
- (void)setHasLongitudeTruncated:(BOOL)a3;
- (void)setHasNumberOfFilteredLocations:(BOOL)a3;
- (void)setHasNumberOfInputLocations:(BOOL)a3;
- (void)setHasRecoveryTime:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLatitudeTruncated:(int)a3;
- (void)setLength:(int)a3;
- (void)setLocationTypeHistograms:(id)a3;
- (void)setLongitudeTruncated:(int)a3;
- (void)setMajorGapLengths:(int *)a3 count:(unint64_t)a4;
- (void)setNumberOfFilteredLocations:(int)a3;
- (void)setNumberOfInputLocations:(int)a3;
- (void)setRecoveryTime:(int)a3;
- (void)setRoadClassHistograms:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLearnedRouteInstance

- (void)dealloc
{
  [(AWDCoreRoutineLearnedRouteInstance *)self setRoadClassHistograms:0];
  [(AWDCoreRoutineLearnedRouteInstance *)self setLocationTypeHistograms:0];
  PBRepeatedInt32Clear();
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedRouteInstance;
  [(AWDCoreRoutineLearnedRouteInstance *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNumberOfInputLocations:(int)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_numberOfInputLocations = a3;
}

- (void)setHasNumberOfInputLocations:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasNumberOfInputLocations
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (void)setNumberOfFilteredLocations:(int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_numberOfFilteredLocations = a3;
}

- (void)setHasNumberOfFilteredLocations:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasNumberOfFilteredLocations
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setLength:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_length = a3;
}

- (void)setHasLength:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasLength
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setRecoveryTime:(int)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_recoveryTime = a3;
}

- (void)setHasRecoveryTime:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasRecoveryTime
{
  return *(unsigned char *)&self->_has >> 7;
}

- (void)setFailureReason:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_failureReason = a3;
}

- (void)setHasFailureReason:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasFailureReason
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLatitudeTruncated:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_latitudeTruncated = a3;
}

- (void)setHasLatitudeTruncated:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLatitudeTruncated
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLongitudeTruncated:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_longitudeTruncated = a3;
}

- (void)setHasLongitudeTruncated:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasLongitudeTruncated
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)clearRoadClassHistograms
{
}

- (void)addRoadClassHistogram:(id)a3
{
  roadClassHistograms = self->_roadClassHistograms;
  if (!roadClassHistograms)
  {
    roadClassHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_roadClassHistograms = roadClassHistograms;
  }

  [(NSMutableArray *)roadClassHistograms addObject:a3];
}

- (unint64_t)roadClassHistogramsCount
{
  return [(NSMutableArray *)self->_roadClassHistograms count];
}

- (id)roadClassHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_roadClassHistograms objectAtIndex:a3];
}

+ (Class)roadClassHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearLocationTypeHistograms
{
}

- (void)addLocationTypeHistogram:(id)a3
{
  locationTypeHistograms = self->_locationTypeHistograms;
  if (!locationTypeHistograms)
  {
    locationTypeHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_locationTypeHistograms = locationTypeHistograms;
  }

  [(NSMutableArray *)locationTypeHistograms addObject:a3];
}

- (unint64_t)locationTypeHistogramsCount
{
  return [(NSMutableArray *)self->_locationTypeHistograms count];
}

- (id)locationTypeHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_locationTypeHistograms objectAtIndex:a3];
}

+ (Class)locationTypeHistogramType
{
  return (Class)objc_opt_class();
}

- (unint64_t)majorGapLengthsCount
{
  return self->_majorGapLengths.count;
}

- (int)majorGapLengths
{
  return self->_majorGapLengths.list;
}

- (void)clearMajorGapLengths
{
}

- (void)addMajorGapLength:(int)a3
{
}

- (int)majorGapLengthAtIndex:(unint64_t)a3
{
  p_majorGapLengths = &self->_majorGapLengths;
  unint64_t count = self->_majorGapLengths.count;
  if (count <= a3) {
    [(id)[MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF578] stringWithFormat:@"idx (%lu) is out of range (%lu)", a3, count] raise];
  }
  return p_majorGapLengths->list[a3];
}

- (void)setMajorGapLengths:(int *)a3 count:(unint64_t)a4
{
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLearnedRouteInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLearnedRouteInstance description](&v3, sel_description), -[AWDCoreRoutineLearnedRouteInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_31;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_numberOfInputLocations] forKey:@"numberOfInputLocations"];
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_32;
  }
LABEL_31:
  [v3 setObject:[NSNumber numberWithInt:self->_numberOfFilteredLocations] forKey:@"numberOfFilteredLocations"];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_33;
  }
LABEL_32:
  [v3 setObject:[NSNumber numberWithInt:self->_length] forKey:@"length"];
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_34;
  }
LABEL_33:
  [v3 setObject:[NSNumber numberWithInt:self->_recoveryTime] forKey:@"recoveryTime"];
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_35;
  }
LABEL_34:
  [v3 setObject:[NSNumber numberWithInt:self->_failureReason] forKey:@"failureReason"];
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_35:
  [v3 setObject:[NSNumber numberWithInt:self->_latitudeTruncated] forKey:@"latitudeTruncated"];
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_9:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_longitudeTruncated] forKey:@"longitudeTruncated"];
LABEL_10:
  if ([(NSMutableArray *)self->_roadClassHistograms count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_roadClassHistograms, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    roadClassHistograms = self->_roadClassHistograms;
    uint64_t v7 = [(NSMutableArray *)roadClassHistograms countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(roadClassHistograms);
          }
          [v5 addObject:[*(id *)(*((void *)&v22 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)roadClassHistograms countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"roadClassHistogram"];
  }
  if ([(NSMutableArray *)self->_locationTypeHistograms count])
  {
    v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_locationTypeHistograms, "count")];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    locationTypeHistograms = self->_locationTypeHistograms;
    uint64_t v13 = [(NSMutableArray *)locationTypeHistograms countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(locationTypeHistograms);
          }
          [v11 addObject:[*(id *)(*((void *)&v18 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v14 = [(NSMutableArray *)locationTypeHistograms countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"locationTypeHistogram"];
  }
  [v3 setObject:PBRepeatedInt32NSArray() forKey:@"majorGapLength"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLearnedRouteInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_34:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_9:
  }
    PBDataWriterWriteInt32Field();
LABEL_10:
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  roadClassHistograms = self->_roadClassHistograms;
  uint64_t v6 = [(NSMutableArray *)roadClassHistograms countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(roadClassHistograms);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)roadClassHistograms countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v7);
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  locationTypeHistograms = self->_locationTypeHistograms;
  uint64_t v11 = [(NSMutableArray *)locationTypeHistograms countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(locationTypeHistograms);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)locationTypeHistograms countByEnumeratingWithState:&v17 objects:v25 count:16];
    }
    while (v12);
  }
  p_majorGapLengths = &self->_majorGapLengths;
  if (p_majorGapLengths->count)
  {
    unint64_t v16 = 0;
    do
    {
      PBDataWriterWriteInt32Field();
      ++v16;
    }
    while (v16 < p_majorGapLengths->count);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if (has)
  {
    *((void *)a3 + 4) = self->_timestamp;
    *((unsigned char *)a3 + 88) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_25;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 18) = self->_numberOfInputLocations;
  *((unsigned char *)a3 + 88) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_26;
  }
LABEL_25:
  *((_DWORD *)a3 + 17) = self->_numberOfFilteredLocations;
  *((unsigned char *)a3 + 88) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)a3 + 12) = self->_length;
  *((unsigned char *)a3 + 88) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 19) = self->_recoveryTime;
  *((unsigned char *)a3 + 88) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
LABEL_29:
    *((_DWORD *)a3 + 11) = self->_latitudeTruncated;
    *((unsigned char *)a3 + 88) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_28:
  *((_DWORD *)a3 + 10) = self->_failureReason;
  *((unsigned char *)a3 + 88) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_29;
  }
LABEL_8:
  if ((has & 0x10) != 0)
  {
LABEL_9:
    *((_DWORD *)a3 + 16) = self->_longitudeTruncated;
    *((unsigned char *)a3 + 88) |= 0x10u;
  }
LABEL_10:
  if ([(AWDCoreRoutineLearnedRouteInstance *)self roadClassHistogramsCount])
  {
    [a3 clearRoadClassHistograms];
    unint64_t v6 = [(AWDCoreRoutineLearnedRouteInstance *)self roadClassHistogramsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addRoadClassHistogram:-[AWDCoreRoutineLearnedRouteInstance roadClassHistogramAtIndex:](self, "roadClassHistogramAtIndex:", i)];
    }
  }
  if ([(AWDCoreRoutineLearnedRouteInstance *)self locationTypeHistogramsCount])
  {
    [a3 clearLocationTypeHistograms];
    unint64_t v9 = [(AWDCoreRoutineLearnedRouteInstance *)self locationTypeHistogramsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addLocationTypeHistogram:-[AWDCoreRoutineLearnedRouteInstance locationTypeHistogramAtIndex:](self, "locationTypeHistogramAtIndex:", j)];
    }
  }
  if ([(AWDCoreRoutineLearnedRouteInstance *)self majorGapLengthsCount])
  {
    [a3 clearMajorGapLengths];
    unint64_t v12 = [(AWDCoreRoutineLearnedRouteInstance *)self majorGapLengthsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [a3 addMajorGapLength:-[AWDCoreRoutineLearnedRouteInstance majorGapLengthAtIndex:](self, "majorGapLengthAtIndex:", k)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 32) = self->_timestamp;
    *(unsigned char *)(v5 + 88) |= 1u;
    char has = (char)self->_has;
    if ((has & 0x40) == 0)
    {
LABEL_3:
      if ((has & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x40) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 72) = self->_numberOfInputLocations;
  *(unsigned char *)(v5 + 88) |= 0x40u;
  char has = (char)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_28;
  }
LABEL_27:
  *(_DWORD *)(v5 + 68) = self->_numberOfFilteredLocations;
  *(unsigned char *)(v5 + 88) |= 0x20u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_29;
  }
LABEL_28:
  *(_DWORD *)(v5 + 48) = self->_length;
  *(unsigned char *)(v5 + 88) |= 8u;
  char has = (char)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *(_DWORD *)(v5 + 76) = self->_recoveryTime;
  *(unsigned char *)(v5 + 88) |= 0x80u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  *(_DWORD *)(v5 + 40) = self->_failureReason;
  *(unsigned char *)(v5 + 88) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_31:
  *(_DWORD *)(v5 + 44) = self->_latitudeTruncated;
  *(unsigned char *)(v5 + 88) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_9:
    *(_DWORD *)(v5 + 64) = self->_longitudeTruncated;
    *(unsigned char *)(v5 + 88) |= 0x10u;
  }
LABEL_10:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  roadClassHistograms = self->_roadClassHistograms;
  uint64_t v9 = [(NSMutableArray *)roadClassHistograms countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(roadClassHistograms);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v6 addRoadClassHistogram:v13];
      }
      uint64_t v10 = [(NSMutableArray *)roadClassHistograms countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  locationTypeHistograms = self->_locationTypeHistograms;
  uint64_t v15 = [(NSMutableArray *)locationTypeHistograms countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(locationTypeHistograms);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v21 + 1) + 8 * j) copyWithZone:a3];
        [v6 addLocationTypeHistogram:v19];
      }
      uint64_t v16 = [(NSMutableArray *)locationTypeHistograms countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
  PBRepeatedInt32Copy();
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  if (![a3 isMemberOfClass:objc_opt_class()]) {
    return 0;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 88) & 1) == 0 || self->_timestamp != *((void *)a3 + 4)) {
      return 0;
    }
  }
  else if (*((unsigned char *)a3 + 88))
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((*((unsigned char *)a3 + 88) & 0x40) == 0 || self->_numberOfInputLocations != *((_DWORD *)a3 + 18)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 88) & 0x40) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((*((unsigned char *)a3 + 88) & 0x20) == 0 || self->_numberOfFilteredLocations != *((_DWORD *)a3 + 17)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 88) & 0x20) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 88) & 8) == 0 || self->_length != *((_DWORD *)a3 + 12)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 88) & 8) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
    if ((*((unsigned char *)a3 + 88) & 0x80) == 0 || self->_recoveryTime != *((_DWORD *)a3 + 19)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 88) & 0x80) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 88) & 2) == 0 || self->_failureReason != *((_DWORD *)a3 + 10)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 88) & 2) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 88) & 4) == 0 || self->_latitudeTruncated != *((_DWORD *)a3 + 11)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 88) & 4) != 0)
  {
    return 0;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    if ((*((unsigned char *)a3 + 88) & 0x10) == 0 || self->_longitudeTruncated != *((_DWORD *)a3 + 16)) {
      return 0;
    }
  }
  else if ((*((unsigned char *)a3 + 88) & 0x10) != 0)
  {
    return 0;
  }
  roadClassHistograms = self->_roadClassHistograms;
  if ((unint64_t)roadClassHistograms | *((void *)a3 + 10)
    && !-[NSMutableArray isEqual:](roadClassHistograms, "isEqual:"))
  {
    return 0;
  }
  locationTypeHistograms = self->_locationTypeHistograms;
  if ((unint64_t)locationTypeHistograms | *((void *)a3 + 7))
  {
    if (!-[NSMutableArray isEqual:](locationTypeHistograms, "isEqual:")) {
      return 0;
    }
  }

  return PBRepeatedInt32IsEqual();
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if ((*(unsigned char *)&self->_has & 0x40) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_numberOfInputLocations;
      if ((*(unsigned char *)&self->_has & 0x20) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    unint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 0x40) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_4:
    uint64_t v5 = 2654435761 * self->_numberOfFilteredLocations;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v6 = 2654435761 * self->_length;
    if ((*(unsigned char *)&self->_has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v7 = 2654435761 * self->_recoveryTime;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_7:
    uint64_t v8 = 2654435761 * self->_failureReason;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_9;
    }
LABEL_17:
    uint64_t v10 = 0;
    goto LABEL_18;
  }
LABEL_15:
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v9 = 2654435761 * self->_latitudeTruncated;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_17;
  }
LABEL_9:
  uint64_t v10 = 2654435761 * self->_longitudeTruncated;
LABEL_18:
  uint64_t v11 = v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ [(NSMutableArray *)self->_roadClassHistograms hash];
  uint64_t v12 = [(NSMutableArray *)self->_locationTypeHistograms hash];
  return v11 ^ v12 ^ PBRepeatedInt32Hash();
}

- (void)mergeFrom:(id)a3
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 88);
  if (v5)
  {
    self->_timestamp = *((void *)a3 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 88);
    if ((v5 & 0x40) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0) {
        goto LABEL_4;
      }
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)a3 + 88) & 0x40) == 0)
  {
    goto LABEL_3;
  }
  self->_numberOfInputLocations = *((_DWORD *)a3 + 18);
  *(unsigned char *)&self->_has |= 0x40u;
  char v5 = *((unsigned char *)a3 + 88);
  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_numberOfFilteredLocations = *((_DWORD *)a3 + 17);
  *(unsigned char *)&self->_has |= 0x20u;
  char v5 = *((unsigned char *)a3 + 88);
  if ((v5 & 8) == 0)
  {
LABEL_5:
    if ((v5 & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_length = *((_DWORD *)a3 + 12);
  *(unsigned char *)&self->_has |= 8u;
  char v5 = *((unsigned char *)a3 + 88);
  if ((v5 & 0x80) == 0)
  {
LABEL_6:
    if ((v5 & 2) == 0) {
      goto LABEL_7;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_recoveryTime = *((_DWORD *)a3 + 19);
  *(unsigned char *)&self->_has |= 0x80u;
  char v5 = *((unsigned char *)a3 + 88);
  if ((v5 & 2) == 0)
  {
LABEL_7:
    if ((v5 & 4) == 0) {
      goto LABEL_8;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_failureReason = *((_DWORD *)a3 + 10);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 88);
  if ((v5 & 4) == 0)
  {
LABEL_8:
    if ((v5 & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_34:
  self->_latitudeTruncated = *((_DWORD *)a3 + 11);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 88) & 0x10) != 0)
  {
LABEL_9:
    self->_longitudeTruncated = *((_DWORD *)a3 + 16);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_10:
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 10);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDCoreRoutineLearnedRouteInstance *)self addRoadClassHistogram:*(void *)(*((void *)&v23 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 7);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v20 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AWDCoreRoutineLearnedRouteInstance *)self addLocationTypeHistogram:*(void *)(*((void *)&v19 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v13);
  }
  uint64_t v16 = [a3 majorGapLengthsCount];
  if (v16)
  {
    uint64_t v17 = v16;
    for (uint64_t k = 0; k != v17; ++k)
      -[AWDCoreRoutineLearnedRouteInstance addMajorGapLength:](self, "addMajorGapLength:", [a3 majorGapLengthAtIndex:k]);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (int)numberOfInputLocations
{
  return self->_numberOfInputLocations;
}

- (int)numberOfFilteredLocations
{
  return self->_numberOfFilteredLocations;
}

- (int)length
{
  return self->_length;
}

- (int)recoveryTime
{
  return self->_recoveryTime;
}

- (int)failureReason
{
  return self->_failureReason;
}

- (int)latitudeTruncated
{
  return self->_latitudeTruncated;
}

- (int)longitudeTruncated
{
  return self->_longitudeTruncated;
}

- (NSMutableArray)roadClassHistograms
{
  return self->_roadClassHistograms;
}

- (void)setRoadClassHistograms:(id)a3
{
}

- (NSMutableArray)locationTypeHistograms
{
  return self->_locationTypeHistograms;
}

- (void)setLocationTypeHistograms:(id)a3
{
}

@end
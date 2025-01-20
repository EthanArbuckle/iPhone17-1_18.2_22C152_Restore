@interface AWDCoreRoutineLocationAwarenessIntervalHistogram
+ (Class)anyPositiveIntervalHistogramType;
+ (Class)lessThan10mIntervalHistogramType;
+ (Class)lessThan200mIntervalHistogramType;
+ (Class)lessThan25mIntervalHistogramType;
+ (Class)lessThan55mIntervalHistogramType;
- (BOOL)hasDuration;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)anyPositiveIntervalHistograms;
- (NSMutableArray)lessThan10mIntervalHistograms;
- (NSMutableArray)lessThan200mIntervalHistograms;
- (NSMutableArray)lessThan25mIntervalHistograms;
- (NSMutableArray)lessThan55mIntervalHistograms;
- (id)anyPositiveIntervalHistogramAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)lessThan10mIntervalHistogramAtIndex:(unint64_t)a3;
- (id)lessThan200mIntervalHistogramAtIndex:(unint64_t)a3;
- (id)lessThan25mIntervalHistogramAtIndex:(unint64_t)a3;
- (id)lessThan55mIntervalHistogramAtIndex:(unint64_t)a3;
- (unint64_t)anyPositiveIntervalHistogramsCount;
- (unint64_t)duration;
- (unint64_t)hash;
- (unint64_t)lessThan10mIntervalHistogramsCount;
- (unint64_t)lessThan200mIntervalHistogramsCount;
- (unint64_t)lessThan25mIntervalHistogramsCount;
- (unint64_t)lessThan55mIntervalHistogramsCount;
- (unint64_t)timestamp;
- (void)addAnyPositiveIntervalHistogram:(id)a3;
- (void)addLessThan10mIntervalHistogram:(id)a3;
- (void)addLessThan200mIntervalHistogram:(id)a3;
- (void)addLessThan25mIntervalHistogram:(id)a3;
- (void)addLessThan55mIntervalHistogram:(id)a3;
- (void)clearAnyPositiveIntervalHistograms;
- (void)clearLessThan10mIntervalHistograms;
- (void)clearLessThan200mIntervalHistograms;
- (void)clearLessThan25mIntervalHistograms;
- (void)clearLessThan55mIntervalHistograms;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAnyPositiveIntervalHistograms:(id)a3;
- (void)setDuration:(unint64_t)a3;
- (void)setHasDuration:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setLessThan10mIntervalHistograms:(id)a3;
- (void)setLessThan200mIntervalHistograms:(id)a3;
- (void)setLessThan25mIntervalHistograms:(id)a3;
- (void)setLessThan55mIntervalHistograms:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineLocationAwarenessIntervalHistogram

- (void)dealloc
{
  [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self setLessThan10mIntervalHistograms:0];
  [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self setLessThan25mIntervalHistograms:0];
  [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self setLessThan55mIntervalHistograms:0];
  [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self setLessThan200mIntervalHistograms:0];
  [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self setAnyPositiveIntervalHistograms:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessIntervalHistogram;
  [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)&v3 dealloc];
}

- (void)setTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestamp = a3;
}

- (void)setHasTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setDuration:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_duration = a3;
}

- (void)setHasDuration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDuration
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearLessThan10mIntervalHistograms
{
}

- (void)addLessThan10mIntervalHistogram:(id)a3
{
  lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
  if (!lessThan10mIntervalHistograms)
  {
    lessThan10mIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_lessThan10mIntervalHistograms = lessThan10mIntervalHistograms;
  }

  [(NSMutableArray *)lessThan10mIntervalHistograms addObject:a3];
}

- (unint64_t)lessThan10mIntervalHistogramsCount
{
  return [(NSMutableArray *)self->_lessThan10mIntervalHistograms count];
}

- (id)lessThan10mIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_lessThan10mIntervalHistograms objectAtIndex:a3];
}

+ (Class)lessThan10mIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearLessThan25mIntervalHistograms
{
}

- (void)addLessThan25mIntervalHistogram:(id)a3
{
  lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
  if (!lessThan25mIntervalHistograms)
  {
    lessThan25mIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_lessThan25mIntervalHistograms = lessThan25mIntervalHistograms;
  }

  [(NSMutableArray *)lessThan25mIntervalHistograms addObject:a3];
}

- (unint64_t)lessThan25mIntervalHistogramsCount
{
  return [(NSMutableArray *)self->_lessThan25mIntervalHistograms count];
}

- (id)lessThan25mIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_lessThan25mIntervalHistograms objectAtIndex:a3];
}

+ (Class)lessThan25mIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearLessThan55mIntervalHistograms
{
}

- (void)addLessThan55mIntervalHistogram:(id)a3
{
  lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
  if (!lessThan55mIntervalHistograms)
  {
    lessThan55mIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_lessThan55mIntervalHistograms = lessThan55mIntervalHistograms;
  }

  [(NSMutableArray *)lessThan55mIntervalHistograms addObject:a3];
}

- (unint64_t)lessThan55mIntervalHistogramsCount
{
  return [(NSMutableArray *)self->_lessThan55mIntervalHistograms count];
}

- (id)lessThan55mIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_lessThan55mIntervalHistograms objectAtIndex:a3];
}

+ (Class)lessThan55mIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearLessThan200mIntervalHistograms
{
}

- (void)addLessThan200mIntervalHistogram:(id)a3
{
  lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
  if (!lessThan200mIntervalHistograms)
  {
    lessThan200mIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_lessThan200mIntervalHistograms = lessThan200mIntervalHistograms;
  }

  [(NSMutableArray *)lessThan200mIntervalHistograms addObject:a3];
}

- (unint64_t)lessThan200mIntervalHistogramsCount
{
  return [(NSMutableArray *)self->_lessThan200mIntervalHistograms count];
}

- (id)lessThan200mIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_lessThan200mIntervalHistograms objectAtIndex:a3];
}

+ (Class)lessThan200mIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (void)clearAnyPositiveIntervalHistograms
{
}

- (void)addAnyPositiveIntervalHistogram:(id)a3
{
  anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
  if (!anyPositiveIntervalHistograms)
  {
    anyPositiveIntervalHistograms = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_anyPositiveIntervalHistograms = anyPositiveIntervalHistograms;
  }

  [(NSMutableArray *)anyPositiveIntervalHistograms addObject:a3];
}

- (unint64_t)anyPositiveIntervalHistogramsCount
{
  return [(NSMutableArray *)self->_anyPositiveIntervalHistograms count];
}

- (id)anyPositiveIntervalHistogramAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_anyPositiveIntervalHistograms objectAtIndex:a3];
}

+ (Class)anyPositiveIntervalHistogramType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineLocationAwarenessIntervalHistogram;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineLocationAwarenessIntervalHistogram description](&v3, sel_description), -[AWDCoreRoutineLocationAwarenessIntervalHistogram dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v61 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
  }
  if (has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_duration] forKey:@"duration"];
  }
  if ([(NSMutableArray *)self->_lessThan10mIntervalHistograms count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_lessThan10mIntervalHistograms, "count")];
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
    uint64_t v7 = [(NSMutableArray *)lessThan10mIntervalHistograms countByEnumeratingWithState:&v52 objects:v60 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v53 != v9) {
            objc_enumerationMutation(lessThan10mIntervalHistograms);
          }
          [v5 addObject:[(*(id *)(*((void *)&v52 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)lessThan10mIntervalHistograms countByEnumeratingWithState:&v52 objects:v60 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"LessThan10mIntervalHistogram"];
  }
  if ([(NSMutableArray *)self->_lessThan25mIntervalHistograms count])
  {
    v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_lessThan25mIntervalHistograms, "count")];
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
    uint64_t v13 = [(NSMutableArray *)lessThan25mIntervalHistograms countByEnumeratingWithState:&v48 objects:v59 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v49 != v15) {
            objc_enumerationMutation(lessThan25mIntervalHistograms);
          }
          [v11 addObject:[(*(id *)(*((void *)&v48 + 1) + 8 * j)) dictionaryRepresentation]];
        }
        uint64_t v14 = [(NSMutableArray *)lessThan25mIntervalHistograms countByEnumeratingWithState:&v48 objects:v59 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"LessThan25mIntervalHistogram"];
  }
  if ([(NSMutableArray *)self->_lessThan55mIntervalHistograms count])
  {
    v17 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_lessThan55mIntervalHistograms, "count")];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
    uint64_t v19 = [(NSMutableArray *)lessThan55mIntervalHistograms countByEnumeratingWithState:&v44 objects:v58 count:16];
    if (v19)
    {
      uint64_t v20 = v19;
      uint64_t v21 = *(void *)v45;
      do
      {
        for (uint64_t k = 0; k != v20; ++k)
        {
          if (*(void *)v45 != v21) {
            objc_enumerationMutation(lessThan55mIntervalHistograms);
          }
          [v17 addObject:[*(id *)(*((void *)&v44 + 1) + 8 * k) dictionaryRepresentation]];
        }
        uint64_t v20 = [(NSMutableArray *)lessThan55mIntervalHistograms countByEnumeratingWithState:&v44 objects:v58 count:16];
      }
      while (v20);
    }
    [v3 setObject:v17 forKey:@"LessThan55mIntervalHistogram"];
  }
  if ([(NSMutableArray *)self->_lessThan200mIntervalHistograms count])
  {
    v23 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_lessThan200mIntervalHistograms, "count")];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
    uint64_t v25 = [(NSMutableArray *)lessThan200mIntervalHistograms countByEnumeratingWithState:&v40 objects:v57 count:16];
    if (v25)
    {
      uint64_t v26 = v25;
      uint64_t v27 = *(void *)v41;
      do
      {
        for (uint64_t m = 0; m != v26; ++m)
        {
          if (*(void *)v41 != v27) {
            objc_enumerationMutation(lessThan200mIntervalHistograms);
          }
          [v23 addObject:[(*(id *)(*((void *)&v40 + 1) + 8 * m)) dictionaryRepresentation]];
        }
        uint64_t v26 = [(NSMutableArray *)lessThan200mIntervalHistograms countByEnumeratingWithState:&v40 objects:v57 count:16];
      }
      while (v26);
    }
    [v3 setObject:v23 forKey:@"LessThan200mIntervalHistogram"];
  }
  if ([(NSMutableArray *)self->_anyPositiveIntervalHistograms count])
  {
    v29 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_anyPositiveIntervalHistograms, "count")];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
    uint64_t v31 = [(NSMutableArray *)anyPositiveIntervalHistograms countByEnumeratingWithState:&v36 objects:v56 count:16];
    if (v31)
    {
      uint64_t v32 = v31;
      uint64_t v33 = *(void *)v37;
      do
      {
        for (uint64_t n = 0; n != v32; ++n)
        {
          if (*(void *)v37 != v33) {
            objc_enumerationMutation(anyPositiveIntervalHistograms);
          }
          [v29 addObject:[*(id *)(*((void *)&v36 + 1) + 8 * n) dictionaryRepresentation]];
        }
        uint64_t v32 = [(NSMutableArray *)anyPositiveIntervalHistograms countByEnumeratingWithState:&v36 objects:v56 count:16];
      }
      while (v32);
    }
    [v3 setObject:v29 forKey:@"AnyPositiveIntervalHistogram"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineLocationAwarenessIntervalHistogramReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v55 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
  uint64_t v6 = [(NSMutableArray *)lessThan10mIntervalHistograms countByEnumeratingWithState:&v46 objects:v54 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v47 != v8) {
          objc_enumerationMutation(lessThan10mIntervalHistograms);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)lessThan10mIntervalHistograms countByEnumeratingWithState:&v46 objects:v54 count:16];
    }
    while (v7);
  }
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
  uint64_t v11 = [(NSMutableArray *)lessThan25mIntervalHistograms countByEnumeratingWithState:&v42 objects:v53 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v43;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v43 != v13) {
          objc_enumerationMutation(lessThan25mIntervalHistograms);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)lessThan25mIntervalHistograms countByEnumeratingWithState:&v42 objects:v53 count:16];
    }
    while (v12);
  }
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
  uint64_t v16 = [(NSMutableArray *)lessThan55mIntervalHistograms countByEnumeratingWithState:&v38 objects:v52 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v39;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v39 != v18) {
          objc_enumerationMutation(lessThan55mIntervalHistograms);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v17 = [(NSMutableArray *)lessThan55mIntervalHistograms countByEnumeratingWithState:&v38 objects:v52 count:16];
    }
    while (v17);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
  uint64_t v21 = [(NSMutableArray *)lessThan200mIntervalHistograms countByEnumeratingWithState:&v34 objects:v51 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v35;
    do
    {
      for (uint64_t m = 0; m != v22; ++m)
      {
        if (*(void *)v35 != v23) {
          objc_enumerationMutation(lessThan200mIntervalHistograms);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v22 = [(NSMutableArray *)lessThan200mIntervalHistograms countByEnumeratingWithState:&v34 objects:v51 count:16];
    }
    while (v22);
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
  uint64_t v26 = [(NSMutableArray *)anyPositiveIntervalHistograms countByEnumeratingWithState:&v30 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v31;
    do
    {
      for (uint64_t n = 0; n != v27; ++n)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(anyPositiveIntervalHistograms);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v27 = [(NSMutableArray *)anyPositiveIntervalHistograms countByEnumeratingWithState:&v30 objects:v50 count:16];
    }
    while (v27);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_timestamp;
    *((unsigned char *)a3 + 64) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)a3 + 1) = self->_duration;
    *((unsigned char *)a3 + 64) |= 1u;
  }
  if ([(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self lessThan10mIntervalHistogramsCount])
  {
    [a3 clearLessThan10mIntervalHistograms];
    unint64_t v6 = [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self lessThan10mIntervalHistogramsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addLessThan10mIntervalHistogram:-[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan10mIntervalHistogramAtIndex:](self, "lessThan10mIntervalHistogramAtIndex:", i)];
    }
  }
  if ([(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self lessThan25mIntervalHistogramsCount])
  {
    [a3 clearLessThan25mIntervalHistograms];
    unint64_t v9 = [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self lessThan25mIntervalHistogramsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addLessThan25mIntervalHistogram:-[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan25mIntervalHistogramAtIndex:](self, "lessThan25mIntervalHistogramAtIndex:", j)];
    }
  }
  if ([(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self lessThan55mIntervalHistogramsCount])
  {
    [a3 clearLessThan55mIntervalHistograms];
    unint64_t v12 = [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self lessThan55mIntervalHistogramsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
        [a3 addLessThan55mIntervalHistogram:[-[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan55mIntervalHistogramAtIndex:](self, "lessThan55mIntervalHistogramAtIndex:", k)];
    }
  }
  if ([(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self lessThan200mIntervalHistogramsCount])
  {
    [a3 clearLessThan200mIntervalHistograms];
    unint64_t v15 = [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self lessThan200mIntervalHistogramsCount];
    if (v15)
    {
      unint64_t v16 = v15;
      for (uint64_t m = 0; m != v16; ++m)
        [a3 addLessThan200mIntervalHistogram:-[AWDCoreRoutineLocationAwarenessIntervalHistogram lessThan200mIntervalHistogramAtIndex:](self, "lessThan200mIntervalHistogramAtIndex:", m)];
    }
  }
  if ([(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self anyPositiveIntervalHistogramsCount])
  {
    [a3 clearAnyPositiveIntervalHistograms];
    unint64_t v18 = [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self anyPositiveIntervalHistogramsCount];
    if (v18)
    {
      unint64_t v19 = v18;
      for (uint64_t n = 0; n != v19; ++n)
        [a3 addAnyPositiveIntervalHistogram:-[AWDCoreRoutineLocationAwarenessIntervalHistogram anyPositiveIntervalHistogramAtIndex:](self, "anyPositiveIntervalHistogramAtIndex:", n)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  uint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_timestamp;
    *(unsigned char *)(v5 + 64) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(void *)(v5 + 8) = self->_duration;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
  uint64_t v9 = [(NSMutableArray *)lessThan10mIntervalHistograms countByEnumeratingWithState:&v55 objects:v63 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v56;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v56 != v11) {
          objc_enumerationMutation(lessThan10mIntervalHistograms);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v55 + 1) + 8 * i) copyWithZone:a3];
        [v6 addLessThan10mIntervalHistogram:v13];
      }
      uint64_t v10 = [(NSMutableArray *)lessThan10mIntervalHistograms countByEnumeratingWithState:&v55 objects:v63 count:16];
    }
    while (v10);
  }
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
  uint64_t v15 = [(NSMutableArray *)lessThan25mIntervalHistograms countByEnumeratingWithState:&v51 objects:v62 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v52;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v52 != v17) {
          objc_enumerationMutation(lessThan25mIntervalHistograms);
        }
        unint64_t v19 = (void *)[*(id *)(*((void *)&v51 + 1) + 8 * j) copyWithZone:a3];
        [v6 addLessThan25mIntervalHistogram:v19];
      }
      uint64_t v16 = [(NSMutableArray *)lessThan25mIntervalHistograms countByEnumeratingWithState:&v51 objects:v62 count:16];
    }
    while (v16);
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
  uint64_t v21 = [(NSMutableArray *)lessThan55mIntervalHistograms countByEnumeratingWithState:&v47 objects:v61 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v48;
    do
    {
      for (uint64_t k = 0; k != v22; ++k)
      {
        if (*(void *)v48 != v23) {
          objc_enumerationMutation(lessThan55mIntervalHistograms);
        }
        uint64_t v25 = (void *)[*(id *)(*((void *)&v47 + 1) + 8 * k) copyWithZone:a3];
        [v6 addLessThan55mIntervalHistogram:v25];
      }
      uint64_t v22 = [(NSMutableArray *)lessThan55mIntervalHistograms countByEnumeratingWithState:&v47 objects:v61 count:16];
    }
    while (v22);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
  uint64_t v27 = [(NSMutableArray *)lessThan200mIntervalHistograms countByEnumeratingWithState:&v43 objects:v60 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v44;
    do
    {
      for (uint64_t m = 0; m != v28; ++m)
      {
        if (*(void *)v44 != v29) {
          objc_enumerationMutation(lessThan200mIntervalHistograms);
        }
        long long v31 = (void *)[*(id *)(*((void *)&v43 + 1) + 8 * m) copyWithZone:a3];
        [v6 addLessThan200mIntervalHistogram:v31];
      }
      uint64_t v28 = [(NSMutableArray *)lessThan200mIntervalHistograms countByEnumeratingWithState:&v43 objects:v60 count:16];
    }
    while (v28);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
  uint64_t v33 = [(NSMutableArray *)anyPositiveIntervalHistograms countByEnumeratingWithState:&v39 objects:v59 count:16];
  if (v33)
  {
    uint64_t v34 = v33;
    uint64_t v35 = *(void *)v40;
    do
    {
      for (uint64_t n = 0; n != v34; ++n)
      {
        if (*(void *)v40 != v35) {
          objc_enumerationMutation(anyPositiveIntervalHistograms);
        }
        long long v37 = (void *)[*(id *)(*((void *)&v39 + 1) + 8 * n) copyWithZone:a3];
        [v6 addAnyPositiveIntervalHistogram:v37];
      }
      uint64_t v34 = [(NSMutableArray *)anyPositiveIntervalHistograms countByEnumeratingWithState:&v39 objects:v59 count:16];
    }
    while (v34);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 64) & 2) == 0 || self->_timestamp != *((void *)a3 + 2)) {
        goto LABEL_22;
      }
    }
    else if ((*((unsigned char *)a3 + 64) & 2) != 0)
    {
LABEL_22:
      LOBYTE(v5) = 0;
      return v5;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 64) & 1) == 0 || self->_duration != *((void *)a3 + 1)) {
        goto LABEL_22;
      }
    }
    else if (*((unsigned char *)a3 + 64))
    {
      goto LABEL_22;
    }
    lessThan10mIntervalHistograms = self->_lessThan10mIntervalHistograms;
    if (!((unint64_t)lessThan10mIntervalHistograms | *((void *)a3 + 4))
      || (int v5 = -[NSMutableArray isEqual:](lessThan10mIntervalHistograms, "isEqual:")) != 0)
    {
      lessThan25mIntervalHistograms = self->_lessThan25mIntervalHistograms;
      if (!((unint64_t)lessThan25mIntervalHistograms | *((void *)a3 + 6))
        || (int v5 = -[NSMutableArray isEqual:](lessThan25mIntervalHistograms, "isEqual:")) != 0)
      {
        lessThan55mIntervalHistograms = self->_lessThan55mIntervalHistograms;
        if (!((unint64_t)lessThan55mIntervalHistograms | *((void *)a3 + 7))
          || (int v5 = -[NSMutableArray isEqual:](lessThan55mIntervalHistograms, "isEqual:")) != 0)
        {
          lessThan200mIntervalHistograms = self->_lessThan200mIntervalHistograms;
          if (!((unint64_t)lessThan200mIntervalHistograms | *((void *)a3 + 5))
            || (int v5 = -[NSMutableArray isEqual:](lessThan200mIntervalHistograms, "isEqual:")) != 0)
          {
            anyPositiveIntervalHistograms = self->_anyPositiveIntervalHistograms;
            if ((unint64_t)anyPositiveIntervalHistograms | *((void *)a3 + 3))
            {
              LOBYTE(v5) = -[NSMutableArray isEqual:](anyPositiveIntervalHistograms, "isEqual:");
            }
            else
            {
              LOBYTE(v5) = 1;
            }
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v3 = 2654435761u * self->_timestamp;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    unint64_t v4 = 0;
    goto LABEL_6;
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  unint64_t v4 = 2654435761u * self->_duration;
LABEL_6:
  uint64_t v5 = v4 ^ v3 ^ [(NSMutableArray *)self->_lessThan10mIntervalHistograms hash];
  uint64_t v6 = [(NSMutableArray *)self->_lessThan25mIntervalHistograms hash];
  uint64_t v7 = v5 ^ v6 ^ [(NSMutableArray *)self->_lessThan55mIntervalHistograms hash];
  uint64_t v8 = [(NSMutableArray *)self->_lessThan200mIntervalHistograms hash];
  return v7 ^ v8 ^ [(NSMutableArray *)self->_anyPositiveIntervalHistograms hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v56 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 64);
  if ((v5 & 2) != 0)
  {
    self->_timestamp = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 64);
  }
  if (v5)
  {
    self->_duratiouint64_t n = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 4);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v48 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self addLessThan10mIntervalHistogram:*(void *)(*((void *)&v47 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v47 objects:v55 count:16];
    }
    while (v8);
  }
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 6);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v44 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self addLessThan25mIntervalHistogram:*(void *)(*((void *)&v43 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v43 objects:v54 count:16];
    }
    while (v13);
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v16 = (void *)*((void *)a3 + 7);
  uint64_t v17 = [v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v40;
    do
    {
      for (uint64_t k = 0; k != v18; ++k)
      {
        if (*(void *)v40 != v19) {
          objc_enumerationMutation(v16);
        }
        [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self addLessThan55mIntervalHistogram:*(void *)(*((void *)&v39 + 1) + 8 * k)];
      }
      uint64_t v18 = [v16 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v18);
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v21 = (void *)*((void *)a3 + 5);
  uint64_t v22 = [v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v36;
    do
    {
      for (uint64_t m = 0; m != v23; ++m)
      {
        if (*(void *)v36 != v24) {
          objc_enumerationMutation(v21);
        }
        [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self addLessThan200mIntervalHistogram:*(void *)(*((void *)&v35 + 1) + 8 * m)];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v35 objects:v52 count:16];
    }
    while (v23);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v26 = (void *)*((void *)a3 + 3);
  uint64_t v27 = [v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    uint64_t v29 = *(void *)v32;
    do
    {
      for (uint64_t n = 0; n != v28; ++n)
      {
        if (*(void *)v32 != v29) {
          objc_enumerationMutation(v26);
        }
        [(AWDCoreRoutineLocationAwarenessIntervalHistogram *)self addAnyPositiveIntervalHistogram:*(void *)(*((void *)&v31 + 1) + 8 * n)];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v31 objects:v51 count:16];
    }
    while (v28);
  }
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (unint64_t)duration
{
  return self->_duration;
}

- (NSMutableArray)lessThan10mIntervalHistograms
{
  return self->_lessThan10mIntervalHistograms;
}

- (void)setLessThan10mIntervalHistograms:(id)a3
{
}

- (NSMutableArray)lessThan25mIntervalHistograms
{
  return self->_lessThan25mIntervalHistograms;
}

- (void)setLessThan25mIntervalHistograms:(id)a3
{
}

- (NSMutableArray)lessThan55mIntervalHistograms
{
  return self->_lessThan55mIntervalHistograms;
}

- (void)setLessThan55mIntervalHistograms:(id)a3
{
}

- (NSMutableArray)lessThan200mIntervalHistograms
{
  return self->_lessThan200mIntervalHistograms;
}

- (void)setLessThan200mIntervalHistograms:(id)a3
{
}

- (NSMutableArray)anyPositiveIntervalHistograms
{
  return self->_anyPositiveIntervalHistograms;
}

- (void)setAnyPositiveIntervalHistograms:(id)a3
{
}

@end
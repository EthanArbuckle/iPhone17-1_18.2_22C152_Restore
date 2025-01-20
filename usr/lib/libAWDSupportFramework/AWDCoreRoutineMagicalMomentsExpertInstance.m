@interface AWDCoreRoutineMagicalMomentsExpertInstance
+ (Class)addonsType;
+ (Class)instancesType;
- (BOOL)hasConfidence;
- (BOOL)hasExpertType;
- (BOOL)hasModelType;
- (BOOL)hasSampleCounts;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)addons;
- (NSMutableArray)instances;
- (id)addonsAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)instancesAtIndex:(unint64_t)a3;
- (int)confidence;
- (int)expertType;
- (int)modelType;
- (int)sampleCounts;
- (unint64_t)addonsCount;
- (unint64_t)hash;
- (unint64_t)instancesCount;
- (void)addAddons:(id)a3;
- (void)addInstances:(id)a3;
- (void)clearAddons;
- (void)clearInstances;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAddons:(id)a3;
- (void)setConfidence:(int)a3;
- (void)setExpertType:(int)a3;
- (void)setHasConfidence:(BOOL)a3;
- (void)setHasExpertType:(BOOL)a3;
- (void)setHasModelType:(BOOL)a3;
- (void)setHasSampleCounts:(BOOL)a3;
- (void)setInstances:(id)a3;
- (void)setModelType:(int)a3;
- (void)setSampleCounts:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineMagicalMomentsExpertInstance

- (void)dealloc
{
  [(AWDCoreRoutineMagicalMomentsExpertInstance *)self setInstances:0];
  [(AWDCoreRoutineMagicalMomentsExpertInstance *)self setAddons:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsExpertInstance;
  [(AWDCoreRoutineMagicalMomentsExpertInstance *)&v3 dealloc];
}

- (void)setModelType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_modelType = a3;
}

- (void)setHasModelType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasModelType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setExpertType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_expertType = a3;
}

- (void)setHasExpertType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasExpertType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setConfidence:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_confidence = a3;
}

- (void)setHasConfidence:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasConfidence
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSampleCounts:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_sampleCounts = a3;
}

- (void)setHasSampleCounts:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSampleCounts
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)clearInstances
{
}

- (void)addInstances:(id)a3
{
  instances = self->_instances;
  if (!instances)
  {
    instances = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_instances = instances;
  }

  [(NSMutableArray *)instances addObject:a3];
}

- (unint64_t)instancesCount
{
  return [(NSMutableArray *)self->_instances count];
}

- (id)instancesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_instances objectAtIndex:a3];
}

+ (Class)instancesType
{
  return (Class)objc_opt_class();
}

- (void)clearAddons
{
}

- (void)addAddons:(id)a3
{
  addons = self->_addons;
  if (!addons)
  {
    addons = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_addons = addons;
  }

  [(NSMutableArray *)addons addObject:a3];
}

- (unint64_t)addonsCount
{
  return [(NSMutableArray *)self->_addons count];
}

- (id)addonsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_addons objectAtIndex:a3];
}

+ (Class)addonsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineMagicalMomentsExpertInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineMagicalMomentsExpertInstance description](&v3, sel_description), -[AWDCoreRoutineMagicalMomentsExpertInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_modelType] forKey:@"modelType"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_27;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_expertType] forKey:@"expertType"];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_27:
  [v3 setObject:[NSNumber numberWithInt:self->_confidence] forKey:@"confidence"];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_sampleCounts] forKey:@"sampleCounts"];
LABEL_6:
  if ([(NSMutableArray *)self->_instances count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_instances, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    instances = self->_instances;
    uint64_t v7 = [(NSMutableArray *)instances countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v23 != v9) {
            objc_enumerationMutation(instances);
          }
          [v5 addObject:[(*(id *)(*((void *)&v22 + 1) + 8 * i)) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)instances countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"instances"];
  }
  if ([(NSMutableArray *)self->_addons count])
  {
    v11 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_addons, "count")];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    addons = self->_addons;
    uint64_t v13 = [(NSMutableArray *)addons countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v19;
      do
      {
        for (uint64_t j = 0; j != v14; ++j)
        {
          if (*(void *)v19 != v15) {
            objc_enumerationMutation(addons);
          }
          [v11 addObject:[*(id *)(*((void *)&v18 + 1) + 8 * j) dictionaryRepresentation]];
        }
        uint64_t v14 = [(NSMutableArray *)addons countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v14);
    }
    [v3 setObject:v11 forKey:@"addons"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineMagicalMomentsExpertInstanceReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  instances = self->_instances;
  uint64_t v6 = [(NSMutableArray *)instances countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(instances);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)instances countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  addons = self->_addons;
  uint64_t v11 = [(NSMutableArray *)addons countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; ++j)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(addons);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSMutableArray *)addons countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_modelType;
    *((unsigned char *)a3 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_17:
      *((_DWORD *)a3 + 4) = self->_confidence;
      *((unsigned char *)a3 + 40) |= 1u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        goto LABEL_6;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)a3 + 5) = self->_expertType;
  *((unsigned char *)a3 + 40) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_17;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *((_DWORD *)a3 + 9) = self->_sampleCounts;
    *((unsigned char *)a3 + 40) |= 8u;
  }
LABEL_6:
  if ([(AWDCoreRoutineMagicalMomentsExpertInstance *)self instancesCount])
  {
    [a3 clearInstances];
    unint64_t v6 = [(AWDCoreRoutineMagicalMomentsExpertInstance *)self instancesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addInstances:-[AWDCoreRoutineMagicalMomentsExpertInstance instancesAtIndex:](self, "instancesAtIndex:", i)];
    }
  }
  if ([(AWDCoreRoutineMagicalMomentsExpertInstance *)self addonsCount])
  {
    [a3 clearAddons];
    unint64_t v9 = [(AWDCoreRoutineMagicalMomentsExpertInstance *)self addonsCount];
    if (v9)
    {
      unint64_t v10 = v9;
      for (uint64_t j = 0; j != v10; ++j)
        [a3 addAddons:[[self addonsAtIndex:j]];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_modelType;
    *(unsigned char *)(v5 + 40) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 20) = self->_expertType;
  *(unsigned char *)(v5 + 40) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  *(_DWORD *)(v5 + 16) = self->_confidence;
  *(unsigned char *)(v5 + 40) |= 1u;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    *(_DWORD *)(v5 + 36) = self->_sampleCounts;
    *(unsigned char *)(v5 + 40) |= 8u;
  }
LABEL_6:
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  instances = self->_instances;
  uint64_t v9 = [(NSMutableArray *)instances countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v26 != v11) {
          objc_enumerationMutation(instances);
        }
        uint64_t v13 = (void *)[*(id *)(*((void *)&v25 + 1) + 8 * i) copyWithZone:a3];
        [v6 addInstances:v13];
      }
      uint64_t v10 = [(NSMutableArray *)instances countByEnumeratingWithState:&v25 objects:v30 count:16];
    }
    while (v10);
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  addons = self->_addons;
  uint64_t v15 = [(NSMutableArray *)addons countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v22;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v22 != v17) {
          objc_enumerationMutation(addons);
        }
        long long v19 = (void *)[*(id *)(*((void *)&v21 + 1) + 8 * j) copyWithZone:a3];
        [v6 addAddons:v19];
      }
      uint64_t v16 = [(NSMutableArray *)addons countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v16);
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_modelType != *((_DWORD *)a3 + 8)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
LABEL_26:
      LOBYTE(v5) = 0;
      return v5;
    }
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_expertType != *((_DWORD *)a3 + 5)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
      goto LABEL_26;
    }
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_confidence != *((_DWORD *)a3 + 4)) {
        goto LABEL_26;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
      goto LABEL_26;
    }
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_sampleCounts != *((_DWORD *)a3 + 9)) {
        goto LABEL_26;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 8) != 0)
    {
      goto LABEL_26;
    }
    instances = self->_instances;
    if (!((unint64_t)instances | *((void *)a3 + 3))
      || (int v5 = -[NSMutableArray isEqual:](instances, "isEqual:")) != 0)
    {
      addons = self->_addons;
      if ((unint64_t)addons | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSMutableArray isEqual:](addons, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v3 = 2654435761 * self->_modelType;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_expertType;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v5 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v6 = 0;
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v5 = 2654435761 * self->_confidence;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v6 = 2654435761 * self->_sampleCounts;
LABEL_10:
  uint64_t v7 = v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_instances hash];
  return v7 ^ [(NSMutableArray *)self->_addons hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 4) != 0)
  {
    self->_modelType = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)a3 + 40);
    if ((v5 & 2) == 0)
    {
LABEL_3:
      if ((v5 & 1) == 0) {
        goto LABEL_4;
      }
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 2) == 0)
  {
    goto LABEL_3;
  }
  self->_expertType = *((_DWORD *)a3 + 5);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)a3 + 40);
  if ((v5 & 1) == 0)
  {
LABEL_4:
    if ((v5 & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_23:
  self->_confidence = *((_DWORD *)a3 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)a3 + 40) & 8) != 0)
  {
LABEL_5:
    self->_sampleCounts = *((_DWORD *)a3 + 9);
    *(unsigned char *)&self->_has |= 8u;
  }
LABEL_6:
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 3);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v21 != v9) {
          objc_enumerationMutation(v6);
        }
        [(AWDCoreRoutineMagicalMomentsExpertInstance *)self addInstances:*(void *)(*((void *)&v20 + 1) + 8 * i)];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v8);
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v11 = (void *)*((void *)a3 + 1);
  uint64_t v12 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v17;
    do
    {
      for (uint64_t j = 0; j != v13; ++j)
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v11);
        }
        [(AWDCoreRoutineMagicalMomentsExpertInstance *)self addAddons:*(void *)(*((void *)&v16 + 1) + 8 * j)];
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v16 objects:v24 count:16];
    }
    while (v13);
  }
}

- (int)modelType
{
  return self->_modelType;
}

- (int)expertType
{
  return self->_expertType;
}

- (int)confidence
{
  return self->_confidence;
}

- (int)sampleCounts
{
  return self->_sampleCounts;
}

- (NSMutableArray)instances
{
  return self->_instances;
}

- (void)setInstances:(id)a3
{
}

- (NSMutableArray)addons
{
  return self->_addons;
}

- (void)setAddons:(id)a3
{
}

@end
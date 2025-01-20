@interface AWDCoreRoutinePersistenceMirroringAccountDevices
+ (Class)profilesType;
- (BOOL)hasTimestamp;
- (BOOL)hasTopDeviceClass;
- (BOOL)hasTotalPlaces;
- (BOOL)hasTotalTransitions;
- (BOOL)hasTotalVisits;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)profiles;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)profilesAtIndex:(unint64_t)a3;
- (int)topDeviceClass;
- (int)totalPlaces;
- (int)totalTransitions;
- (int)totalVisits;
- (unint64_t)hash;
- (unint64_t)profilesCount;
- (unint64_t)timestamp;
- (void)addProfiles:(id)a3;
- (void)clearProfiles;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setHasTopDeviceClass:(BOOL)a3;
- (void)setHasTotalPlaces:(BOOL)a3;
- (void)setHasTotalTransitions:(BOOL)a3;
- (void)setHasTotalVisits:(BOOL)a3;
- (void)setProfiles:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)setTopDeviceClass:(int)a3;
- (void)setTotalPlaces:(int)a3;
- (void)setTotalTransitions:(int)a3;
- (void)setTotalVisits:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutinePersistenceMirroringAccountDevices

- (void)dealloc
{
  [(AWDCoreRoutinePersistenceMirroringAccountDevices *)self setProfiles:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceMirroringAccountDevices;
  [(AWDCoreRoutinePersistenceMirroringAccountDevices *)&v3 dealloc];
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

- (void)clearProfiles
{
}

- (void)addProfiles:(id)a3
{
  profiles = self->_profiles;
  if (!profiles)
  {
    profiles = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_profiles = profiles;
  }

  [(NSMutableArray *)profiles addObject:a3];
}

- (unint64_t)profilesCount
{
  return [(NSMutableArray *)self->_profiles count];
}

- (id)profilesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_profiles objectAtIndex:a3];
}

+ (Class)profilesType
{
  return (Class)objc_opt_class();
}

- (void)setTopDeviceClass:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_topDeviceClass = a3;
}

- (void)setHasTopDeviceClass:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTopDeviceClass
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setTotalVisits:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_totalVisits = a3;
}

- (void)setHasTotalVisits:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasTotalVisits
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setTotalPlaces:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalPlaces = a3;
}

- (void)setHasTotalPlaces:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasTotalPlaces
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setTotalTransitions:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_totalTransitions = a3;
}

- (void)setHasTotalTransitions:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasTotalTransitions
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutinePersistenceMirroringAccountDevices;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutinePersistenceMirroringAccountDevices description](&v3, sel_description), -[AWDCoreRoutinePersistenceMirroringAccountDevices dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  if ([(NSMutableArray *)self->_profiles count])
  {
    v4 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_profiles, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    profiles = self->_profiles;
    uint64_t v6 = [(NSMutableArray *)profiles countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(profiles);
          }
          [v4 addObject:[*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v7 = [(NSMutableArray *)profiles countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }
    [v3 setObject:v4 forKey:@"profiles"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    [v3 setObject:[NSNumber numberWithInt:self->_topDeviceClass] forKey:@"topDeviceClass"];
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_14:
      if ((has & 4) == 0) {
        goto LABEL_15;
      }
LABEL_20:
      [v3 setObject:[NSNumber numberWithInt:self->_totalPlaces] forKey:@"totalPlaces"];
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return v3;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_14;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_totalVisits] forKey:@"totalVisits"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_20;
  }
LABEL_15:
  if ((has & 8) != 0) {
LABEL_16:
  }
    [v3 setObject:[NSNumber numberWithInt:self->_totalTransitions] forKey:@"totalTransitions"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutinePersistenceMirroringAccountDevicesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  profiles = self->_profiles;
  uint64_t v5 = [(NSMutableArray *)profiles countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(profiles);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v6 = [(NSMutableArray *)profiles countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_12:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_18;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_12;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_13:
    if ((has & 8) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_18:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return;
  }
LABEL_14:
  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 40) |= 1u;
  }
  if ([(AWDCoreRoutinePersistenceMirroringAccountDevices *)self profilesCount])
  {
    [a3 clearProfiles];
    unint64_t v5 = [(AWDCoreRoutinePersistenceMirroringAccountDevices *)self profilesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        [a3 addProfiles:-[AWDCoreRoutinePersistenceMirroringAccountDevices profilesAtIndex:](self, "profilesAtIndex:", i)];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 6) = self->_topDeviceClass;
    *((unsigned char *)a3 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_15;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 9) = self->_totalVisits;
  *((unsigned char *)a3 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      return;
    }
    goto LABEL_11;
  }
LABEL_15:
  *((_DWORD *)a3 + 7) = self->_totalPlaces;
  *((unsigned char *)a3 + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    return;
  }
LABEL_11:
  *((_DWORD *)a3 + 8) = self->_totalTransitions;
  *((unsigned char *)a3 + 40) |= 8u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)[objc_opt_class() allocWithZone:a3] init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  profiles = self->_profiles;
  uint64_t v8 = [(NSMutableArray *)profiles countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(profiles);
        }
        long long v12 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [(id)v6 addProfiles:v12];
      }
      uint64_t v9 = [(NSMutableArray *)profiles countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_topDeviceClass;
    *(unsigned char *)(v6 + 40) |= 2u;
    char has = (char)self->_has;
    if ((has & 0x10) == 0)
    {
LABEL_12:
      if ((has & 4) == 0) {
        goto LABEL_13;
      }
LABEL_18:
      *(_DWORD *)(v6 + 28) = self->_totalPlaces;
      *(unsigned char *)(v6 + 40) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v6;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    goto LABEL_12;
  }
  *(_DWORD *)(v6 + 36) = self->_totalVisits;
  *(unsigned char *)(v6 + 40) |= 0x10u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_18;
  }
LABEL_13:
  if ((has & 8) != 0)
  {
LABEL_14:
    *(_DWORD *)(v6 + 32) = self->_totalTransitions;
    *(unsigned char *)(v6 + 40) |= 8u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    char has = (char)self->_has;
    if (has)
    {
      if ((*((unsigned char *)a3 + 40) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_29;
      }
    }
    else if (*((unsigned char *)a3 + 40))
    {
LABEL_29:
      LOBYTE(v5) = 0;
      return v5;
    }
    profiles = self->_profiles;
    if ((unint64_t)profiles | *((void *)a3 + 2))
    {
      int v5 = -[NSMutableArray isEqual:](profiles, "isEqual:");
      if (!v5) {
        return v5;
      }
      char has = (char)self->_has;
    }
    if ((has & 2) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 2) == 0 || self->_topDeviceClass != *((_DWORD *)a3 + 6)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 2) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 0x10) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 0x10) == 0 || self->_totalVisits != *((_DWORD *)a3 + 9)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 0x10) != 0)
    {
      goto LABEL_29;
    }
    if ((has & 4) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 4) == 0 || self->_totalPlaces != *((_DWORD *)a3 + 7)) {
        goto LABEL_29;
      }
    }
    else if ((*((unsigned char *)a3 + 40) & 4) != 0)
    {
      goto LABEL_29;
    }
    LOBYTE(v5) = (*((unsigned char *)a3 + 40) & 8) == 0;
    if ((has & 8) != 0)
    {
      if ((*((unsigned char *)a3 + 40) & 8) == 0 || self->_totalTransitions != *((_DWORD *)a3 + 8)) {
        goto LABEL_29;
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    unint64_t v3 = 2654435761u * self->_timestamp;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_profiles hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v5 = 2654435761 * self->_topDeviceClass;
    if ((*(unsigned char *)&self->_has & 0x10) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_totalVisits;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_7;
      }
LABEL_11:
      uint64_t v7 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_8;
      }
LABEL_12:
      uint64_t v8 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_11;
  }
LABEL_7:
  uint64_t v7 = 2654435761 * self->_totalPlaces;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_12;
  }
LABEL_8:
  uint64_t v8 = 2654435761 * self->_totalTransitions;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  if (*((unsigned char *)a3 + 40))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 2);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        [(AWDCoreRoutinePersistenceMirroringAccountDevices *)self addProfiles:*(void *)(*((void *)&v11 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  char v10 = *((unsigned char *)a3 + 40);
  if ((v10 & 2) != 0)
  {
    self->_topDeviceClass = *((_DWORD *)a3 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v10 = *((unsigned char *)a3 + 40);
    if ((v10 & 0x10) == 0)
    {
LABEL_12:
      if ((v10 & 4) == 0) {
        goto LABEL_13;
      }
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)a3 + 40) & 0x10) == 0)
  {
    goto LABEL_12;
  }
  self->_totalVisits = *((_DWORD *)a3 + 9);
  *(unsigned char *)&self->_has |= 0x10u;
  char v10 = *((unsigned char *)a3 + 40);
  if ((v10 & 4) == 0)
  {
LABEL_13:
    if ((v10 & 8) == 0) {
      return;
    }
    goto LABEL_14;
  }
LABEL_18:
  self->_totalPlaces = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 40) & 8) == 0) {
    return;
  }
LABEL_14:
  self->_totalTransitions = *((_DWORD *)a3 + 8);
  *(unsigned char *)&self->_has |= 8u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSMutableArray)profiles
{
  return self->_profiles;
}

- (void)setProfiles:(id)a3
{
}

- (int)topDeviceClass
{
  return self->_topDeviceClass;
}

- (int)totalVisits
{
  return self->_totalVisits;
}

- (int)totalPlaces
{
  return self->_totalPlaces;
}

- (int)totalTransitions
{
  return self->_totalTransitions;
}

@end
@interface AWDCoreRoutineDeletionStats
+ (Class)groupsType;
- (BOOL)hasDeleteType;
- (BOOL)hasSyncEnabled;
- (BOOL)hasTimestamp;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)syncEnabled;
- (NSMutableArray)groups;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)groupsAtIndex:(unint64_t)a3;
- (unint64_t)groupsCount;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (unsigned)deleteType;
- (void)addGroups:(id)a3;
- (void)clearGroups;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setDeleteType:(unsigned int)a3;
- (void)setGroups:(id)a3;
- (void)setHasDeleteType:(BOOL)a3;
- (void)setHasSyncEnabled:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setSyncEnabled:(BOOL)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineDeletionStats

- (void)dealloc
{
  [(AWDCoreRoutineDeletionStats *)self setGroups:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionStats;
  [(AWDCoreRoutineDeletionStats *)&v3 dealloc];
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

- (void)setSyncEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_syncEnabled = a3;
}

- (void)setHasSyncEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSyncEnabled
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDeleteType:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_deleteType = a3;
}

- (void)setHasDeleteType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasDeleteType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearGroups
{
}

- (void)addGroups:(id)a3
{
  groups = self->_groups;
  if (!groups)
  {
    groups = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_groups = groups;
  }

  [(NSMutableArray *)groups addObject:a3];
}

- (unint64_t)groupsCount
{
  return [(NSMutableArray *)self->_groups count];
}

- (id)groupsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_groups objectAtIndex:a3];
}

+ (Class)groupsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineDeletionStats;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineDeletionStats description](&v3, sel_description), -[AWDCoreRoutineDeletionStats dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  [v3 setObject:[NSNumber numberWithBool:self->_syncEnabled] forKey:@"syncEnabled"];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    [v3 setObject:[NSNumber numberWithUnsignedInt:self->_deleteType] forKey:@"deleteType"];
LABEL_5:
  if ([(NSMutableArray *)self->_groups count])
  {
    v5 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:-[NSMutableArray count](self->_groups, "count")];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    groups = self->_groups;
    uint64_t v7 = [(NSMutableArray *)groups countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(groups);
          }
          [v5 addObject:[*(id *)(*((void *)&v12 + 1) + 8 * i) dictionaryRepresentation]];
        }
        uint64_t v8 = [(NSMutableArray *)groups countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
    [v3 setObject:v5 forKey:@"groups"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineDeletionStatsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  groups = self->_groups;
  uint64_t v6 = [(NSMutableArray *)groups countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(groups);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v7 = [(NSMutableArray *)groups countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_11:
    *((unsigned char *)a3 + 32) = self->_syncEnabled;
    *((unsigned char *)a3 + 36) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *((void *)a3 + 1) = self->_timestamp;
  *((unsigned char *)a3 + 36) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    *((_DWORD *)a3 + 4) = self->_deleteType;
    *((unsigned char *)a3 + 36) |= 2u;
  }
LABEL_5:
  if ([(AWDCoreRoutineDeletionStats *)self groupsCount])
  {
    [a3 clearGroups];
    unint64_t v6 = [(AWDCoreRoutineDeletionStats *)self groupsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        [a3 addGroups:-[AWDCoreRoutineDeletionStats groupsAtIndex:](self, "groupsAtIndex:", i)];
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = [(id)[(id)objc_opt_class() allocWithZone:a3] init];
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 36) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 32) = self->_syncEnabled;
  *(unsigned char *)(v5 + 36) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_deleteType;
    *(unsigned char *)(v5 + 36) |= 2u;
  }
LABEL_5:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  groups = self->_groups;
  uint64_t v9 = [(NSMutableArray *)groups countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(groups);
        }
        long long v13 = (void *)[*(id *)(*((void *)&v15 + 1) + 8 * i) copyWithZone:a3];
        [v6 addGroups:v13];
      }
      uint64_t v10 = [(NSMutableArray *)groups countByEnumeratingWithState:&v15 objects:v19 count:16];
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
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 36) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
      goto LABEL_22;
    }
  }
  else if (*((unsigned char *)a3 + 36))
  {
    goto LABEL_22;
  }
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    if ((*((unsigned char *)a3 + 36) & 4) != 0) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  if ((*((unsigned char *)a3 + 36) & 4) == 0) {
    goto LABEL_22;
  }
  if (self->_syncEnabled)
  {
    if (!*((unsigned char *)a3 + 32)) {
      goto LABEL_22;
    }
    goto LABEL_15;
  }
  if (*((unsigned char *)a3 + 32))
  {
LABEL_22:
    LOBYTE(v5) = 0;
    return v5;
  }
LABEL_15:
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 36) & 2) == 0 || self->_deleteType != *((_DWORD *)a3 + 4)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 2) != 0)
  {
    goto LABEL_22;
  }
  groups = self->_groups;
  if ((unint64_t)groups | *((void *)a3 + 3))
  {
    LOBYTE(v5) = -[NSMutableArray isEqual:](groups, "isEqual:");
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSMutableArray *)self->_groups hash];
  }
  unint64_t v2 = 2654435761u * self->_timestamp;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_syncEnabled;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_deleteType;
  return v3 ^ v2 ^ v4 ^ [(NSMutableArray *)self->_groups hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  char v4 = *((unsigned char *)a3 + 36);
  if (v4)
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v4 = *((unsigned char *)a3 + 36);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)a3 + 36) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_syncEnabled = *((unsigned char *)a3 + 32);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 36) & 2) != 0)
  {
LABEL_4:
    self->_deleteType = *((_DWORD *)a3 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  int v5 = (void *)*((void *)a3 + 3);
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
        [(AWDCoreRoutineDeletionStats *)self addGroups:*(void *)(*((void *)&v10 + 1) + 8 * i)];
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

- (BOOL)syncEnabled
{
  return self->_syncEnabled;
}

- (unsigned)deleteType
{
  return self->_deleteType;
}

- (NSMutableArray)groups
{
  return self->_groups;
}

- (void)setGroups:(id)a3
{
}

@end
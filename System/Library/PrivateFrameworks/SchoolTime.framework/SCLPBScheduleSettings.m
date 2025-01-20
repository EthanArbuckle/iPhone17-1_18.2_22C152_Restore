@interface SCLPBScheduleSettings
+ (Class)recurrencesType;
- (BOOL)hasIsEnabled;
- (BOOL)hasVersion;
- (BOOL)isEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)recurrences;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)recurrencesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)recurrencesCount;
- (unsigned)version;
- (void)addRecurrences:(id)a3;
- (void)clearRecurrences;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsEnabled:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setIsEnabled:(BOOL)a3;
- (void)setRecurrences:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SCLPBScheduleSettings

- (void)setVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_version = a3;
}

- (void)setHasVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_isEnabled = a3;
}

- (void)setHasIsEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearRecurrences
{
}

- (void)addRecurrences:(id)a3
{
  id v4 = a3;
  recurrences = self->_recurrences;
  id v8 = v4;
  if (!recurrences)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_recurrences;
    self->_recurrences = v6;

    id v4 = v8;
    recurrences = self->_recurrences;
  }
  [(NSMutableArray *)recurrences addObject:v4];
}

- (unint64_t)recurrencesCount
{
  return [(NSMutableArray *)self->_recurrences count];
}

- (id)recurrencesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_recurrences objectAtIndex:a3];
}

+ (Class)recurrencesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SCLPBScheduleSettings;
  id v4 = [(SCLPBScheduleSettings *)&v8 description];
  v5 = [(SCLPBScheduleSettings *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedInt:self->_version];
    [v3 setObject:v5 forKey:@"version"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_isEnabled];
    [v3 setObject:v6 forKey:@"isEnabled"];
  }
  if ([(NSMutableArray *)self->_recurrences count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_recurrences, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_recurrences;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation", (void)v15);
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"recurrences"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SCLPBScheduleSettingsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v6 = self->_recurrences;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
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
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[4] = self->_version;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 20) = self->_isEnabled;
    *((unsigned char *)v4 + 24) |= 2u;
  }
  id v10 = v4;
  if ([(SCLPBScheduleSettings *)self recurrencesCount])
  {
    [v10 clearRecurrences];
    unint64_t v6 = [(SCLPBScheduleSettings *)self recurrencesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        uint64_t v9 = [(SCLPBScheduleSettings *)self recurrencesAtIndex:i];
        [v10 addRecurrences:v9];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  char has = (char)self->_has;
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_version;
    *(unsigned char *)(v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 20) = self->_isEnabled;
    *(unsigned char *)(v5 + 24) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_recurrences;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addRecurrences:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_version != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0) {
      goto LABEL_17;
    }
LABEL_11:
    char v5 = 0;
    goto LABEL_12;
  }
  if ((*((unsigned char *)v4 + 24) & 2) == 0) {
    goto LABEL_11;
  }
  if (!self->_isEnabled)
  {
    if (!*((unsigned char *)v4 + 20)) {
      goto LABEL_17;
    }
    goto LABEL_11;
  }
  if (!*((unsigned char *)v4 + 20)) {
    goto LABEL_11;
  }
LABEL_17:
  recurrences = self->_recurrences;
  if ((unint64_t)recurrences | *((void *)v4 + 1)) {
    char v5 = -[NSMutableArray isEqual:](recurrences, "isEqual:");
  }
  else {
    char v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_version;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSMutableArray *)self->_recurrences hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_isEnabled;
  return v3 ^ v2 ^ [(NSMutableArray *)self->_recurrences hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = a3;
  char v5 = v4;
  char v6 = *((unsigned char *)v4 + 24);
  if (v6)
  {
    self->_version = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v6 = *((unsigned char *)v4 + 24);
  }
  if ((v6 & 2) != 0)
  {
    self->_isEnabled = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 1);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SCLPBScheduleSettings addRecurrences:](self, "addRecurrences:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unsigned)version
{
  return self->_version;
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (NSMutableArray)recurrences
{
  return self->_recurrences;
}

- (void)setRecurrences:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
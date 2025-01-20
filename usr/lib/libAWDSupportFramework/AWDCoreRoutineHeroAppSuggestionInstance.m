@interface AWDCoreRoutineHeroAppSuggestionInstance
- (BOOL)hasBundleId;
- (BOOL)hasInstalled;
- (BOOL)hasLat;
- (BOOL)hasLon;
- (BOOL)hasSuggestionId;
- (BOOL)hasTimestamp;
- (BOOL)installed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)bundleId;
- (NSString)suggestionId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)lat;
- (int)lon;
- (unint64_t)hash;
- (unint64_t)timestamp;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBundleId:(id)a3;
- (void)setHasInstalled:(BOOL)a3;
- (void)setHasLat:(BOOL)a3;
- (void)setHasLon:(BOOL)a3;
- (void)setHasTimestamp:(BOOL)a3;
- (void)setInstalled:(BOOL)a3;
- (void)setLat:(int)a3;
- (void)setLon:(int)a3;
- (void)setSuggestionId:(id)a3;
- (void)setTimestamp:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AWDCoreRoutineHeroAppSuggestionInstance

- (void)dealloc
{
  [(AWDCoreRoutineHeroAppSuggestionInstance *)self setSuggestionId:0];
  [(AWDCoreRoutineHeroAppSuggestionInstance *)self setBundleId:0];
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineHeroAppSuggestionInstance;
  [(AWDCoreRoutineHeroAppSuggestionInstance *)&v3 dealloc];
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

- (BOOL)hasSuggestionId
{
  return self->_suggestionId != 0;
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (void)setLat:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_lat = a3;
}

- (void)setHasLat:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasLat
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setLon:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_lon = a3;
}

- (void)setHasLon:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasLon
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setInstalled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_installed = a3;
}

- (void)setHasInstalled:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasInstalled
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)AWDCoreRoutineHeroAppSuggestionInstance;
  return (id)[NSString stringWithFormat:@"%@ %@", -[AWDCoreRoutineHeroAppSuggestionInstance description](&v3, sel_description), -[AWDCoreRoutineHeroAppSuggestionInstance dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has) {
    [v3 setObject:[NSNumber numberWithUnsignedLongLong:self->_timestamp] forKey:@"timestamp"];
  }
  suggestionId = self->_suggestionId;
  if (suggestionId) {
    [v3 setObject:suggestionId forKey:@"suggestionId"];
  }
  bundleId = self->_bundleId;
  if (bundleId) {
    [v3 setObject:bundleId forKey:@"bundleId"];
  }
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_9;
    }
LABEL_13:
    [v3 setObject:[NSNumber numberWithInt:self->_lon] forKey:@"lon"];
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      return v3;
    }
    goto LABEL_10;
  }
  [v3 setObject:[NSNumber numberWithInt:self->_lat] forKey:@"lat"];
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_13;
  }
LABEL_9:
  if ((has & 8) != 0) {
LABEL_10:
  }
    [v3 setObject:[NSNumber numberWithBool:self->_installed] forKey:@"installed"];
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return AWDCoreRoutineHeroAppSuggestionInstanceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_suggestionId) {
    PBDataWriterWriteStringField();
  }
  if (self->_bundleId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_9;
    }
LABEL_12:
    PBDataWriterWriteInt32Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return;
    }
    goto LABEL_13;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_12;
  }
LABEL_9:
  if ((has & 4) == 0) {
    return;
  }
LABEL_13:

  PBDataWriterWriteInt32Field();
}

- (void)copyTo:(id)a3
{
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_timestamp;
    *((unsigned char *)a3 + 44) |= 1u;
  }
  if (self->_suggestionId) {
    [a3 setSuggestionId:];
  }
  if (self->_bundleId) {
    [a3 setBundleId:];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)a3 + 40) = self->_installed;
    *((unsigned char *)a3 + 44) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        return;
      }
      goto LABEL_10;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 6) = self->_lat;
  *((unsigned char *)a3 + 44) |= 2u;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    return;
  }
LABEL_10:
  *((_DWORD *)a3 + 7) = self->_lon;
  *((unsigned char *)a3 + 44) |= 4u;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [[(id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  uint64_t v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_timestamp;
    *(unsigned char *)(v5 + 44) |= 1u;
  }

  *(void *)(v6 + 32) = [(NSString *)self->_suggestionId copyWithZone:a3];
  *(void *)(v6 + 16) = [(NSString *)self->_bundleId copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *(_DWORD *)(v6 + 24) = self->_lat;
    *(unsigned char *)(v6 + 44) |= 2u;
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      return (id)v6;
    }
    goto LABEL_6;
  }
  *(unsigned char *)(v6 + 40) = self->_installed;
  *(unsigned char *)(v6 + 44) |= 8u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if ((has & 4) != 0)
  {
LABEL_6:
    *(_DWORD *)(v6 + 28) = self->_lon;
    *(unsigned char *)(v6 + 44) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    if (*(unsigned char *)&self->_has)
    {
      if ((*((unsigned char *)a3 + 44) & 1) == 0 || self->_timestamp != *((void *)a3 + 1)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)a3 + 44))
    {
      goto LABEL_28;
    }
    suggestionId = self->_suggestionId;
    if (!((unint64_t)suggestionId | *((void *)a3 + 4))
      || (int v5 = -[NSString isEqual:](suggestionId, "isEqual:")) != 0)
    {
      bundleId = self->_bundleId;
      if (!((unint64_t)bundleId | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](bundleId, "isEqual:")) != 0)
      {
        if ((*(unsigned char *)&self->_has & 8) == 0)
        {
          if ((*((unsigned char *)a3 + 44) & 8) != 0) {
            goto LABEL_28;
          }
          goto LABEL_19;
        }
        if ((*((unsigned char *)a3 + 44) & 8) != 0)
        {
          if (self->_installed)
          {
            if (!*((unsigned char *)a3 + 40)) {
              goto LABEL_28;
            }
            goto LABEL_19;
          }
          if (!*((unsigned char *)a3 + 40))
          {
LABEL_19:
            if ((*(unsigned char *)&self->_has & 2) != 0)
            {
              if ((*((unsigned char *)a3 + 44) & 2) == 0 || self->_lat != *((_DWORD *)a3 + 6)) {
                goto LABEL_28;
              }
            }
            else if ((*((unsigned char *)a3 + 44) & 2) != 0)
            {
              goto LABEL_28;
            }
            LOBYTE(v5) = (*((unsigned char *)a3 + 44) & 4) == 0;
            if ((*(unsigned char *)&self->_has & 4) != 0)
            {
              if ((*((unsigned char *)a3 + 44) & 4) == 0 || self->_lon != *((_DWORD *)a3 + 7)) {
                goto LABEL_28;
              }
              LOBYTE(v5) = 1;
            }
            return v5;
          }
        }
LABEL_28:
        LOBYTE(v5) = 0;
      }
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
  NSUInteger v4 = [(NSString *)self->_suggestionId hash];
  NSUInteger v5 = [(NSString *)self->_bundleId hash];
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
  }
  uint64_t v6 = 2654435761 * self->_installed;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_lat;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_lon;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (void)mergeFrom:(id)a3
{
  if (*((unsigned char *)a3 + 44))
  {
    self->_timestamp = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)a3 + 4)) {
    -[AWDCoreRoutineHeroAppSuggestionInstance setSuggestionId:](self, "setSuggestionId:");
  }
  if (*((void *)a3 + 2)) {
    -[AWDCoreRoutineHeroAppSuggestionInstance setBundleId:](self, "setBundleId:");
  }
  char v5 = *((unsigned char *)a3 + 44);
  if ((v5 & 8) != 0)
  {
    self->_installed = *((unsigned char *)a3 + 40);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)a3 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 4) == 0) {
        return;
      }
      goto LABEL_10;
    }
  }
  else if ((*((unsigned char *)a3 + 44) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_lat = *((_DWORD *)a3 + 6);
  *(unsigned char *)&self->_has |= 2u;
  if ((*((unsigned char *)a3 + 44) & 4) == 0) {
    return;
  }
LABEL_10:
  self->_lon = *((_DWORD *)a3 + 7);
  *(unsigned char *)&self->_has |= 4u;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)suggestionId
{
  return self->_suggestionId;
}

- (void)setSuggestionId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setBundleId:(id)a3
{
}

- (int)lat
{
  return self->_lat;
}

- (int)lon
{
  return self->_lon;
}

- (BOOL)installed
{
  return self->_installed;
}

@end
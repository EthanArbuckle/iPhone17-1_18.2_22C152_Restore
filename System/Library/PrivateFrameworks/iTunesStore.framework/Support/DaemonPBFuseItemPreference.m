@interface DaemonPBFuseItemPreference
- (BOOL)hasAdamId;
- (BOOL)hasCreatedOffsetMillis;
- (BOOL)hasExternalId;
- (BOOL)hasPreferenceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)externalId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)preference;
- (int)preferenceType;
- (int64_t)adamId;
- (int64_t)createdOffsetMillis;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setAdamId:(int64_t)a3;
- (void)setCreatedOffsetMillis:(int64_t)a3;
- (void)setExternalId:(id)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setHasCreatedOffsetMillis:(BOOL)a3;
- (void)setHasPreferenceType:(BOOL)a3;
- (void)setPreference:(int)a3;
- (void)setPreferenceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation DaemonPBFuseItemPreference

- (void)setAdamId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdamId
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasExternalId
{
  return self->_externalId != 0;
}

- (void)setCreatedOffsetMillis:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_createdOffsetMillis = a3;
}

- (void)setHasCreatedOffsetMillis:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasCreatedOffsetMillis
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)preferenceType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_preferenceType;
  }
  else {
    return 0;
  }
}

- (void)setPreferenceType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_preferenceType = a3;
}

- (void)setHasPreferenceType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPreferenceType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)DaemonPBFuseItemPreference;
  char v3 = [(DaemonPBFuseItemPreference *)&v7 description];
  v4 = [(DaemonPBFuseItemPreference *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:self->_preference];
  [v3 setObject:v4 forKey:@"preference"];

  if (*(unsigned char *)&self->_has)
  {
    v5 = +[NSNumber numberWithLongLong:self->_adamId];
    [v3 setObject:v5 forKey:@"adam_id"];
  }
  externalId = self->_externalId;
  if (externalId) {
    [v3 setObject:externalId forKey:@"external_id"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v8 = +[NSNumber numberWithLongLong:self->_createdOffsetMillis];
    [v3 setObject:v8 forKey:@"created_offset_millis"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v9 = +[NSNumber numberWithInt:self->_preferenceType];
    [v3 setObject:v9 forKey:@"preference_type"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return DaemonPBFuseItemPreferenceReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_externalId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = v5;
  v5[8] = self->_preference;
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v5 + 1) = self->_adamId;
    *((unsigned char *)v5 + 40) |= 1u;
  }
  id v7 = [(NSString *)self->_externalId copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v6[2] = self->_createdOffsetMillis;
    *((unsigned char *)v6 + 40) |= 2u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *((_DWORD *)v6 + 9) = self->_preferenceType;
    *((unsigned char *)v6 + 40) |= 4u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()] || self->_preference != *((_DWORD *)v4 + 8)) {
    goto LABEL_20;
  }
  char has = (char)self->_has;
  if (has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_adamId != *((void *)v4 + 1)) {
      goto LABEL_20;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
    goto LABEL_20;
  }
  externalId = self->_externalId;
  if ((unint64_t)externalId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](externalId, "isEqual:"))
    {
LABEL_20:
      BOOL v7 = 0;
      goto LABEL_21;
    }
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_createdOffsetMillis != *((void *)v4 + 2)) {
      goto LABEL_20;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 2) != 0)
  {
    goto LABEL_20;
  }
  BOOL v7 = (*((unsigned char *)v4 + 40) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_preferenceType != *((_DWORD *)v4 + 9)) {
      goto LABEL_20;
    }
    BOOL v7 = 1;
  }
LABEL_21:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_adamId;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t preference = self->_preference;
  NSUInteger v5 = [(NSString *)self->_externalId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v6 = 2654435761 * self->_createdOffsetMillis;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v7 = 0;
    return v3 ^ v5 ^ v6 ^ v7 ^ (2654435761 * preference);
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_preferenceType;
  return v3 ^ v5 ^ v6 ^ v7 ^ (2654435761 * preference);
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t preference = *((_DWORD *)v4 + 8);
  if (*((unsigned char *)v4 + 40))
  {
    self->_adamId = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    id v6 = v4;
    -[DaemonPBFuseItemPreference setExternalId:](self, "setExternalId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 40);
  if ((v5 & 2) != 0)
  {
    self->_createdOffsetMillis = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 40);
  }
  if ((v5 & 4) != 0)
  {
    self->_preferenceType = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (int)preference
{
  return self->_preference;
}

- (void)setPreference:(int)a3
{
  self->_uint64_t preference = a3;
}

- (int64_t)adamId
{
  return self->_adamId;
}

- (NSString)externalId
{
  return self->_externalId;
}

- (void)setExternalId:(id)a3
{
}

- (int64_t)createdOffsetMillis
{
  return self->_createdOffsetMillis;
}

- (void).cxx_destruct
{
}

@end
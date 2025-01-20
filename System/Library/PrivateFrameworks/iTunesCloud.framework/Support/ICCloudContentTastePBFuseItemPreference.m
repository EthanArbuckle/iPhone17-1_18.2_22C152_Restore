@interface ICCloudContentTastePBFuseItemPreference
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation ICCloudContentTastePBFuseItemPreference

- (void).cxx_destruct
{
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_adamId;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t preference = self->_preference;
  NSUInteger v5 = [(NSString *)self->_externalId hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v7 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v8 = 0;
    return v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * preference);
  }
  uint64_t v6 = 2654435761 * self->_createdOffsetMillis;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v7 = 2654435761 * self->_preferenceType;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v8 = 2654435761 * self->_actionTimestampMillis;
  return v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * preference);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]
    || self->_preference != *((_DWORD *)v4 + 10))
  {
    goto LABEL_25;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 48);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_adamId != *((void *)v4 + 2)) {
      goto LABEL_25;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_25;
  }
  externalId = self->_externalId;
  if ((unint64_t)externalId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](externalId, "isEqual:"))
    {
LABEL_25:
      BOOL v8 = 0;
      goto LABEL_26;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 48);
  }
  if ((has & 4) != 0)
  {
    if ((v6 & 4) == 0 || self->_createdOffsetMillis != *((void *)v4 + 3)) {
      goto LABEL_25;
    }
  }
  else if ((v6 & 4) != 0)
  {
    goto LABEL_25;
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0 || self->_preferenceType != *((_DWORD *)v4 + 11)) {
      goto LABEL_25;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_25;
  }
  BOOL v8 = (v6 & 1) == 0;
  if (has)
  {
    if ((v6 & 1) == 0 || self->_actionTimestampMillis != *((void *)v4 + 1)) {
      goto LABEL_25;
    }
    BOOL v8 = 1;
  }
LABEL_26:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = v5;
  v5[10] = self->_preference;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v5 + 2) = self->_adamId;
    *((unsigned char *)v5 + 48) |= 2u;
  }
  id v7 = [(NSString *)self->_externalId copyWithZone:a3];
  BOOL v8 = (void *)v6[4];
  v6[4] = v7;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 8) == 0) {
      goto LABEL_5;
    }
LABEL_9:
    *((_DWORD *)v6 + 11) = self->_preferenceType;
    *((unsigned char *)v6 + 48) |= 8u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      return v6;
    }
    goto LABEL_6;
  }
  v6[3] = self->_createdOffsetMillis;
  *((unsigned char *)v6 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) != 0) {
    goto LABEL_9;
  }
LABEL_5:
  if (has)
  {
LABEL_6:
    v6[1] = self->_actionTimestampMillis;
    *((unsigned char *)v6 + 48) |= 1u;
  }
  return v6;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt64Field();
  }
  if (self->_externalId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  if (*(unsigned char *)&self->_has) {
LABEL_8:
  }
    PBDataWriterWriteInt64Field();
LABEL_9:
}

- (BOOL)readFrom:(id)a3
{
  return sub_10007F9D8((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  id v4 = +[NSNumber numberWithInt:self->_preference];
  [v3 setObject:v4 forKey:@"preference"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v5 = +[NSNumber numberWithLongLong:self->_adamId];
    [v3 setObject:v5 forKey:@"adam_id"];
  }
  externalId = self->_externalId;
  if (externalId) {
    [v3 setObject:externalId forKey:@"external_id"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v10 = +[NSNumber numberWithLongLong:self->_createdOffsetMillis];
    [v3 setObject:v10 forKey:@"created_offset_millis"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  v11 = +[NSNumber numberWithInt:self->_preferenceType];
  [v3 setObject:v11 forKey:@"preference_type"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    BOOL v8 = +[NSNumber numberWithLongLong:self->_actionTimestampMillis];
    [v3 setObject:v8 forKey:@"action_timestamp_millis"];
  }
LABEL_9:

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ICCloudContentTastePBFuseItemPreference;
  uint64_t v3 = [(ICCloudContentTastePBFuseItemPreference *)&v7 description];
  id v4 = [(ICCloudContentTastePBFuseItemPreference *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

@end
@interface NRPBBTMigrationOOBRead
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBBTMigrationOOBRead

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBBTMigrationOOBRead;
  v3 = [(NRPBBTMigrationOOBRead *)&v7 description];
  v4 = [(NRPBBTMigrationOOBRead *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  oobKey = self->_oobKey;
  if (oobKey) {
    [v3 setObject:oobKey forKey:@"oobKey"];
  }
  challenge = self->_challenge;
  if (challenge) {
    [v4 setObject:challenge forKey:@"challenge"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v8 = +[NSNumber numberWithInt:self->_errorCode];
    [v4 setObject:v8 forKey:@"errorCode"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_errorIsFatal];
    [v4 setObject:v9 forKey:@"errorIsFatal"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000DE75C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_oobKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_challenge)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NSData *)self->_oobKey copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSData *)self->_challenge copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_errorCode;
    *((unsigned char *)v5 + 36) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 32) = self->_errorIsFatal;
    *((unsigned char *)v5 + 36) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  oobKey = self->_oobKey;
  if ((unint64_t)oobKey | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](oobKey, "isEqual:")) {
      goto LABEL_13;
    }
  }
  challenge = self->_challenge;
  if ((unint64_t)challenge | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](challenge, "isEqual:")) {
      goto LABEL_13;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_errorCode != *((_DWORD *)v4 + 4)) {
      goto LABEL_13;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_13;
  }
  BOOL v7 = (*((unsigned char *)v4 + 36) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) == 0)
    {
LABEL_13:
      BOOL v7 = 0;
      goto LABEL_14;
    }
    if (self->_errorIsFatal)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_13;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_13;
    }
    BOOL v7 = 1;
  }
LABEL_14:

  return v7;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)[(NSData *)self->_oobKey hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_challenge hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v5 = 2654435761 * self->_errorCode;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_errorIsFatal;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_oobKey, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

@end
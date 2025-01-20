@interface ABSPBSyncObject
- (ABSPBAccountsSyncObject)accountsSyncObject;
- (ABSPBContactWrapper)contactWrapper;
- (ABSPBContainerAttributes)containerSyncObject;
- (ABSPBCountValidationObject)countValidationObject;
- (ABSPBDeleteWrapper)deleteWrapper;
- (ABSPBFavoritesSyncObject)favoritesSyncObject;
- (ABSPBSyncObject)initWithMemo:(id)a3;
- (BOOL)hasAccountsSyncObject;
- (BOOL)hasContactWrapper;
- (BOOL)hasContainerSyncObject;
- (BOOL)hasCountValidationObject;
- (BOOL)hasDeleteWrapper;
- (BOOL)hasFavoritesSyncObject;
- (BOOL)hasSendTimestamp;
- (BOOL)hasSequenceNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (double)sendTimestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)sequenceNumber;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAccountsSyncObject:(id)a3;
- (void)setContactWrapper:(id)a3;
- (void)setContainerSyncObject:(id)a3;
- (void)setCountValidationObject:(id)a3;
- (void)setDeleteWrapper:(id)a3;
- (void)setFavoritesSyncObject:(id)a3;
- (void)setHasSendTimestamp:(BOOL)a3;
- (void)setHasSequenceNumber:(BOOL)a3;
- (void)setSendTimestamp:(double)a3;
- (void)setSequenceNumber:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBSyncObject

- (BOOL)hasContactWrapper
{
  return self->_contactWrapper != 0;
}

- (BOOL)hasDeleteWrapper
{
  return self->_deleteWrapper != 0;
}

- (BOOL)hasFavoritesSyncObject
{
  return self->_favoritesSyncObject != 0;
}

- (BOOL)hasCountValidationObject
{
  return self->_countValidationObject != 0;
}

- (void)setSequenceNumber:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_sequenceNumber = a3;
}

- (void)setHasSequenceNumber:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSequenceNumber
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSendTimestamp:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_sendTimestamp = a3;
}

- (void)setHasSendTimestamp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSendTimestamp
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasAccountsSyncObject
{
  return self->_accountsSyncObject != 0;
}

- (BOOL)hasContainerSyncObject
{
  return self->_containerSyncObject != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBSyncObject;
  char v3 = [(ABSPBSyncObject *)&v7 description];
  v4 = [(ABSPBSyncObject *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  contactWrapper = self->_contactWrapper;
  if (contactWrapper)
  {
    v5 = [(ABSPBContactWrapper *)contactWrapper dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"contactWrapper"];
  }
  deleteWrapper = self->_deleteWrapper;
  if (deleteWrapper)
  {
    objc_super v7 = [(ABSPBDeleteWrapper *)deleteWrapper dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"deleteWrapper"];
  }
  favoritesSyncObject = self->_favoritesSyncObject;
  if (favoritesSyncObject)
  {
    v9 = [(ABSPBFavoritesSyncObject *)favoritesSyncObject dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"favoritesSyncObject"];
  }
  countValidationObject = self->_countValidationObject;
  if (countValidationObject)
  {
    v11 = [(ABSPBCountValidationObject *)countValidationObject dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"countValidationObject"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v13 = +[NSNumber numberWithInt:self->_sequenceNumber];
    [v3 setObject:v13 forKey:@"sequenceNumber"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v14 = +[NSNumber numberWithDouble:self->_sendTimestamp];
    [v3 setObject:v14 forKey:@"sendTimestamp"];
  }
  accountsSyncObject = self->_accountsSyncObject;
  if (accountsSyncObject)
  {
    v16 = [(ABSPBAccountsSyncObject *)accountsSyncObject dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"accountsSyncObject"];
  }
  containerSyncObject = self->_containerSyncObject;
  if (containerSyncObject)
  {
    v18 = [(ABSPBContainerAttributes *)containerSyncObject dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"containerSyncObject"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBSyncObjectReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_contactWrapper)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_deleteWrapper)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_favoritesSyncObject)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_countValidationObject)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
  }
  if (self->_accountsSyncObject)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_containerSyncObject)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_contactWrapper)
  {
    [v4 setContactWrapper:];
    id v4 = v6;
  }
  if (self->_deleteWrapper)
  {
    [v6 setDeleteWrapper:];
    id v4 = v6;
  }
  if (self->_favoritesSyncObject)
  {
    [v6 setFavoritesSyncObject:];
    id v4 = v6;
  }
  if (self->_countValidationObject)
  {
    [v6 setCountValidationObject:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 16) = self->_sequenceNumber;
    *((unsigned char *)v4 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_sendTimestamp;
    *((unsigned char *)v4 + 68) |= 1u;
  }
  if (self->_accountsSyncObject)
  {
    [v6 setAccountsSyncObject:];
    id v4 = v6;
  }
  if (self->_containerSyncObject)
  {
    [v6 setContainerSyncObject:];
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(ABSPBContactWrapper *)self->_contactWrapper copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(ABSPBDeleteWrapper *)self->_deleteWrapper copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(ABSPBFavoritesSyncObject *)self->_favoritesSyncObject copyWithZone:a3];
  v11 = (void *)v5[7];
  v5[7] = v10;

  id v12 = [(ABSPBCountValidationObject *)self->_countValidationObject copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 16) = self->_sequenceNumber;
    *((unsigned char *)v5 + 68) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v5[1] = *(void *)&self->_sendTimestamp;
    *((unsigned char *)v5 + 68) |= 1u;
  }
  id v15 = [(ABSPBAccountsSyncObject *)self->_accountsSyncObject copyWithZone:a3];
  v16 = (void *)v5[2];
  v5[2] = v15;

  id v17 = [(ABSPBContainerAttributes *)self->_containerSyncObject copyWithZone:a3];
  v18 = (void *)v5[4];
  v5[4] = v17;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  contactWrapper = self->_contactWrapper;
  if ((unint64_t)contactWrapper | *((void *)v4 + 3))
  {
    if (!-[ABSPBContactWrapper isEqual:](contactWrapper, "isEqual:")) {
      goto LABEL_24;
    }
  }
  deleteWrapper = self->_deleteWrapper;
  if ((unint64_t)deleteWrapper | *((void *)v4 + 6))
  {
    if (!-[ABSPBDeleteWrapper isEqual:](deleteWrapper, "isEqual:")) {
      goto LABEL_24;
    }
  }
  favoritesSyncObject = self->_favoritesSyncObject;
  if ((unint64_t)favoritesSyncObject | *((void *)v4 + 7))
  {
    if (!-[ABSPBFavoritesSyncObject isEqual:](favoritesSyncObject, "isEqual:")) {
      goto LABEL_24;
    }
  }
  countValidationObject = self->_countValidationObject;
  if ((unint64_t)countValidationObject | *((void *)v4 + 5))
  {
    if (!-[ABSPBCountValidationObject isEqual:](countValidationObject, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_sequenceNumber != *((_DWORD *)v4 + 16)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
LABEL_24:
    unsigned __int8 v11 = 0;
    goto LABEL_25;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_sendTimestamp != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_24;
  }
  accountsSyncObject = self->_accountsSyncObject;
  if ((unint64_t)accountsSyncObject | *((void *)v4 + 2)
    && !-[ABSPBAccountsSyncObject isEqual:](accountsSyncObject, "isEqual:"))
  {
    goto LABEL_24;
  }
  containerSyncObject = self->_containerSyncObject;
  if ((unint64_t)containerSyncObject | *((void *)v4 + 4)) {
    unsigned __int8 v11 = -[ABSPBContainerAttributes isEqual:](containerSyncObject, "isEqual:");
  }
  else {
    unsigned __int8 v11 = 1;
  }
LABEL_25:

  return v11;
}

- (unint64_t)hash
{
  unint64_t v3 = [(ABSPBContactWrapper *)self->_contactWrapper hash];
  unint64_t v4 = [(ABSPBDeleteWrapper *)self->_deleteWrapper hash];
  unint64_t v5 = [(ABSPBFavoritesSyncObject *)self->_favoritesSyncObject hash];
  unint64_t v6 = [(ABSPBCountValidationObject *)self->_countValidationObject hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v7 = 2654435761 * self->_sequenceNumber;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v12 = 0;
    goto LABEL_11;
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  double sendTimestamp = self->_sendTimestamp;
  double v9 = -sendTimestamp;
  if (sendTimestamp >= 0.0) {
    double v9 = self->_sendTimestamp;
  }
  long double v10 = floor(v9 + 0.5);
  double v11 = (v9 - v10) * 1.84467441e19;
  unint64_t v12 = 2654435761u * (unint64_t)fmod(v10, 1.84467441e19);
  if (v11 >= 0.0)
  {
    if (v11 > 0.0) {
      v12 += (unint64_t)v11;
    }
  }
  else
  {
    v12 -= (unint64_t)fabs(v11);
  }
LABEL_11:
  unint64_t v13 = v4 ^ v3 ^ v5 ^ v6;
  unint64_t v14 = v7 ^ v12 ^ [(ABSPBAccountsSyncObject *)self->_accountsSyncObject hash];
  return v13 ^ v14 ^ [(ABSPBContainerAttributes *)self->_containerSyncObject hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  contactWrapper = self->_contactWrapper;
  uint64_t v6 = *((void *)v4 + 3);
  id v18 = v4;
  if (contactWrapper)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ABSPBContactWrapper mergeFrom:](contactWrapper, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[ABSPBSyncObject setContactWrapper:](self, "setContactWrapper:");
  }
  id v4 = v18;
LABEL_7:
  deleteWrapper = self->_deleteWrapper;
  uint64_t v8 = *((void *)v4 + 6);
  if (deleteWrapper)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[ABSPBDeleteWrapper mergeFrom:](deleteWrapper, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[ABSPBSyncObject setDeleteWrapper:](self, "setDeleteWrapper:");
  }
  id v4 = v18;
LABEL_13:
  favoritesSyncObject = self->_favoritesSyncObject;
  uint64_t v10 = *((void *)v4 + 7);
  if (favoritesSyncObject)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[ABSPBFavoritesSyncObject mergeFrom:](favoritesSyncObject, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[ABSPBSyncObject setFavoritesSyncObject:](self, "setFavoritesSyncObject:");
  }
  id v4 = v18;
LABEL_19:
  countValidationObject = self->_countValidationObject;
  uint64_t v12 = *((void *)v4 + 5);
  if (countValidationObject)
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[ABSPBCountValidationObject mergeFrom:](countValidationObject, "mergeFrom:");
  }
  else
  {
    if (!v12) {
      goto LABEL_25;
    }
    -[ABSPBSyncObject setCountValidationObject:](self, "setCountValidationObject:");
  }
  id v4 = v18;
LABEL_25:
  char v13 = *((unsigned char *)v4 + 68);
  if ((v13 & 2) != 0)
  {
    self->_sequenceNumber = *((_DWORD *)v4 + 16);
    *(unsigned char *)&self->_has |= 2u;
    char v13 = *((unsigned char *)v4 + 68);
  }
  if (v13)
  {
    self->_double sendTimestamp = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  accountsSyncObject = self->_accountsSyncObject;
  uint64_t v15 = *((void *)v4 + 2);
  if (accountsSyncObject)
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[ABSPBAccountsSyncObject mergeFrom:](accountsSyncObject, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_35;
    }
    -[ABSPBSyncObject setAccountsSyncObject:](self, "setAccountsSyncObject:");
  }
  id v4 = v18;
LABEL_35:
  containerSyncObject = self->_containerSyncObject;
  uint64_t v17 = *((void *)v4 + 4);
  if (containerSyncObject)
  {
    if (v17) {
      -[ABSPBContainerAttributes mergeFrom:](containerSyncObject, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[ABSPBSyncObject setContainerSyncObject:](self, "setContainerSyncObject:");
  }

  _objc_release_x1();
}

- (ABSPBContactWrapper)contactWrapper
{
  return self->_contactWrapper;
}

- (void)setContactWrapper:(id)a3
{
}

- (ABSPBDeleteWrapper)deleteWrapper
{
  return self->_deleteWrapper;
}

- (void)setDeleteWrapper:(id)a3
{
}

- (ABSPBFavoritesSyncObject)favoritesSyncObject
{
  return self->_favoritesSyncObject;
}

- (void)setFavoritesSyncObject:(id)a3
{
}

- (ABSPBCountValidationObject)countValidationObject
{
  return self->_countValidationObject;
}

- (void)setCountValidationObject:(id)a3
{
}

- (int)sequenceNumber
{
  return self->_sequenceNumber;
}

- (double)sendTimestamp
{
  return self->_sendTimestamp;
}

- (ABSPBAccountsSyncObject)accountsSyncObject
{
  return self->_accountsSyncObject;
}

- (void)setAccountsSyncObject:(id)a3
{
}

- (ABSPBContainerAttributes)containerSyncObject
{
  return self->_containerSyncObject;
}

- (void)setContainerSyncObject:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_favoritesSyncObject, 0);
  objc_storeStrong((id *)&self->_deleteWrapper, 0);
  objc_storeStrong((id *)&self->_countValidationObject, 0);
  objc_storeStrong((id *)&self->_containerSyncObject, 0);
  objc_storeStrong((id *)&self->_contactWrapper, 0);

  objc_storeStrong((id *)&self->_accountsSyncObject, 0);
}

- (ABSPBSyncObject)initWithMemo:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)ABSPBSyncObject;
  unint64_t v5 = [(ABSPBSyncObject *)&v11 init];
  if (v5)
  {
    [(ABSPBSyncObject *)v5 setSequenceNumber:+[ABSSyncObject sequenceNumber]];
    uint64_t v6 = +[NSDate date];
    [v6 timeIntervalSinceReferenceDate];
    -[ABSPBSyncObject setSendTimestamp:](v5, "setSendTimestamp:");

    unsigned int v7 = [(ABSPBSyncObject *)v5 sequenceNumber];
    unsigned __int16 v8 = (unsigned __int16)[(ABSPBSyncObject *)v5 sequenceNumber];
    double v9 = *(NSObject **)(qword_100069D78 + 8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      unsigned int v13 = HIWORD(v7);
      __int16 v14 = 1024;
      int v15 = v8;
      __int16 v16 = 2114;
      id v17 = v4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "S_PKT_NUM: %04x_%04x (%{public}@)", buf, 0x18u);
    }
  }

  return v5;
}

@end
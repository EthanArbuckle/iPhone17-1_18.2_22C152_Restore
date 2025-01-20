@interface SecDbKeychainSerializedMetadataKey
- (BOOL)hasActualKeyclass;
- (BOOL)hasAkswrappedkey;
- (BOOL)hasBackupwrappedkey;
- (BOOL)hasBaguuid;
- (BOOL)hasKeyclass;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)akswrappedkey;
- (NSData)backupwrappedkey;
- (NSData)baguuid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)actualKeyclass;
- (int)keyclass;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActualKeyclass:(int)a3;
- (void)setAkswrappedkey:(id)a3;
- (void)setBackupwrappedkey:(id)a3;
- (void)setBaguuid:(id)a3;
- (void)setHasActualKeyclass:(BOOL)a3;
- (void)setHasKeyclass:(BOOL)a3;
- (void)setKeyclass:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SecDbKeychainSerializedMetadataKey

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baguuid, 0);
  objc_storeStrong((id *)&self->_backupwrappedkey, 0);

  objc_storeStrong((id *)&self->_akswrappedkey, 0);
}

- (void)setBackupwrappedkey:(id)a3
{
}

- (NSData)backupwrappedkey
{
  return self->_backupwrappedkey;
}

- (void)setAkswrappedkey:(id)a3
{
}

- (NSData)akswrappedkey
{
  return self->_akswrappedkey;
}

- (void)setBaguuid:(id)a3
{
}

- (NSData)baguuid
{
  return self->_baguuid;
}

- (int)actualKeyclass
{
  return self->_actualKeyclass;
}

- (int)keyclass
{
  return self->_keyclass;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 2) != 0)
  {
    self->_keyclass = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if (v5)
  {
    self->_actualKeyclass = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[SecDbKeychainSerializedMetadataKey setBaguuid:](self, "setBaguuid:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[SecDbKeychainSerializedMetadataKey setAkswrappedkey:](self, "setAkswrappedkey:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[SecDbKeychainSerializedMetadataKey setBackupwrappedkey:](self, "setBackupwrappedkey:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_keyclass;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_actualKeyclass;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ (unint64_t)[(NSData *)self->_baguuid hash];
  unint64_t v6 = (unint64_t)[(NSData *)self->_akswrappedkey hash];
  return v5 ^ v6 ^ (unint64_t)[(NSData *)self->_backupwrappedkey hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_keyclass != *((_DWORD *)v4 + 10)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
LABEL_18:
    unsigned __int8 v8 = 0;
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_actualKeyclass != *((_DWORD *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_18;
  }
  baguuid = self->_baguuid;
  if ((unint64_t)baguuid | *((void *)v4 + 4) && !-[NSData isEqual:](baguuid, "isEqual:")) {
    goto LABEL_18;
  }
  akswrappedkey = self->_akswrappedkey;
  if ((unint64_t)akswrappedkey | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](akswrappedkey, "isEqual:")) {
      goto LABEL_18;
    }
  }
  backupwrappedkey = self->_backupwrappedkey;
  if ((unint64_t)backupwrappedkey | *((void *)v4 + 3)) {
    unsigned __int8 v8 = -[NSData isEqual:](backupwrappedkey, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_19:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  unint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_keyclass;
    *((unsigned char *)v5 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_actualKeyclass;
    *((unsigned char *)v5 + 44) |= 1u;
  }
  id v8 = [(NSData *)self->_baguuid copyWithZone:a3];
  v9 = (void *)v6[4];
  v6[4] = v8;

  id v10 = [(NSData *)self->_akswrappedkey copyWithZone:a3];
  v11 = (void *)v6[2];
  v6[2] = v10;

  id v12 = [(NSData *)self->_backupwrappedkey copyWithZone:a3];
  v13 = (void *)v6[3];
  v6[3] = v12;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[10] = self->_keyclass;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_actualKeyclass;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  unint64_t v6 = v4;
  if (self->_baguuid)
  {
    [v4 setBaguuid:];
    id v4 = v6;
  }
  if (self->_akswrappedkey)
  {
    [v6 setAkswrappedkey:];
    id v4 = v6;
  }
  if (self->_backupwrappedkey)
  {
    [v6 setBackupwrappedkey:];
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_baguuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_akswrappedkey)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if (self->_backupwrappedkey)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
    while (1)
    {
      unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
      v7 |= (unint64_t)(v9 & 0x7F) << v5;
      if ((v9 & 0x80) == 0) {
        goto LABEL_11;
      }
      v5 += 7;
      BOOL v10 = v6++ >= 9;
      if (v10)
      {
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)&self->_has |= 2u;
        while (1)
        {
          unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
            break;
          }
          char v17 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0) {
            goto LABEL_39;
          }
          v13 += 7;
          BOOL v10 = v14++ >= 9;
          if (v10)
          {
            LODWORD(v15) = 0;
            goto LABEL_41;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_39:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v15) = 0;
        }
LABEL_41:
        uint64_t v26 = 40;
        goto LABEL_46;
      case 2u:
        char v19 = 0;
        unsigned int v20 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)&self->_has |= 1u;
        break;
      case 3u:
        uint64_t v23 = PBReaderReadData();
        uint64_t v24 = 32;
        goto LABEL_37;
      case 4u:
        uint64_t v23 = PBReaderReadData();
        uint64_t v24 = 16;
        goto LABEL_37;
      case 5u:
        uint64_t v23 = PBReaderReadData();
        uint64_t v24 = 24;
LABEL_37:
        v25 = *(void **)&self->PBCodable_opaque[v24];
        *(void *)&self->PBCodable_opaque[v24] = v23;

        continue;
      default:
        int v18 = PBReaderSkipValueWithTag();
        if (!v18) {
          return v18;
        }
        continue;
    }
    while (1)
    {
      unint64_t v21 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v21 == -1 || v21 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v22 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v21);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v21 + 1;
      v15 |= (unint64_t)(v22 & 0x7F) << v19;
      if ((v22 & 0x80) == 0) {
        goto LABEL_43;
      }
      v19 += 7;
      BOOL v10 = v20++ >= 9;
      if (v10)
      {
        LODWORD(v15) = 0;
        goto LABEL_45;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_43:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v15) = 0;
    }
LABEL_45:
    uint64_t v26 = 8;
LABEL_46:
    *(_DWORD *)&self->PBCodable_opaque[v26] = v15;
  }
  LOBYTE(v18) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v18;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    char v5 = +[NSNumber numberWithInt:self->_keyclass];
    [v3 setObject:v5 forKey:@"keyclass"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = +[NSNumber numberWithInt:self->_actualKeyclass];
    [v3 setObject:v6 forKey:@"actualKeyclass"];
  }
  baguuid = self->_baguuid;
  if (baguuid) {
    [v3 setObject:baguuid forKey:@"baguuid"];
  }
  akswrappedkey = self->_akswrappedkey;
  if (akswrappedkey) {
    [v3 setObject:akswrappedkey forKey:@"akswrappedkey"];
  }
  backupwrappedkey = self->_backupwrappedkey;
  if (backupwrappedkey) {
    [v3 setObject:backupwrappedkey forKey:@"backupwrappedkey"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SecDbKeychainSerializedMetadataKey;
  uint64_t v3 = [(SecDbKeychainSerializedMetadataKey *)&v7 description];
  id v4 = [(SecDbKeychainSerializedMetadataKey *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasBackupwrappedkey
{
  return self->_backupwrappedkey != 0;
}

- (BOOL)hasAkswrappedkey
{
  return self->_akswrappedkey != 0;
}

- (BOOL)hasBaguuid
{
  return self->_baguuid != 0;
}

- (BOOL)hasActualKeyclass
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasActualKeyclass:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setActualKeyclass:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_actualKeyclass = a3;
}

- (BOOL)hasKeyclass
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasKeyclass:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setKeyclass:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_keyclass = a3;
}

@end
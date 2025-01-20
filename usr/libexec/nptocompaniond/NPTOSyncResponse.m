@interface NPTOSyncResponse
- (BOOL)hasExternalPowerSourceConnected;
- (BOOL)hasHasExternalPowerSourceConnected;
- (BOOL)hasLibrary;
- (BOOL)hasStatus;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NPTOLibrary)library;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasExternalPowerSourceConnected:(BOOL)a3;
- (void)setHasHasExternalPowerSourceConnected:(BOOL)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setLibrary:(id)a3;
- (void)setStatus:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPTOSyncResponse

- (BOOL)hasLibrary
{
  return self->_library != 0;
}

- (int)status
{
  if (*(unsigned char *)&self->_has) {
    return self->_status;
  }
  else {
    return 0;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 3)
  {
    v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    v3 = off_1000936A0[a3];
  }

  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"ClientReady"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NotEnoughSpaceAvailable"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"LowPowerModeEnabled"])
  {
    int v4 = 2;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasExternalPowerSourceConnected
{
  return (*(unsigned char *)&self->_has & 2) != 0 && self->_hasExternalPowerSourceConnected;
}

- (void)setHasExternalPowerSourceConnected:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_hasExternalPowerSourceConnected = a3;
}

- (void)setHasHasExternalPowerSourceConnected:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasHasExternalPowerSourceConnected
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NPTOSyncResponse;
  char v3 = [(NPTOSyncResponse *)&v7 description];
  int v4 = [(NPTOSyncResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  library = self->_library;
  if (library)
  {
    v5 = [(NPTOLibrary *)library dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"library"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t status = self->_status;
    if (status >= 3)
    {
      v8 = +[NSString stringWithFormat:@"(unknown: %i)", self->_status];
    }
    else
    {
      v8 = off_1000936A0[status];
    }
    [v3 setObject:v8 forKey:@"status"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v9 = +[NSNumber numberWithBool:self->_hasExternalPowerSourceConnected];
    [v3 setObject:v9 forKey:@"hasExternalPowerSourceConnected"];
  }

  return v3;
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
    unint64_t v13 = v7 >> 3;
    if ((v7 >> 3) == 3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      *(unsigned char *)&self->_has |= 2u;
      while (1)
      {
        unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v18 == -1 || v18 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v19 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
        v17 |= (unint64_t)(v19 & 0x7F) << v15;
        if ((v19 & 0x80) == 0) {
          goto LABEL_40;
        }
        v15 += 7;
        BOOL v10 = v16++ >= 9;
        if (v10)
        {
          uint64_t v17 = 0;
          goto LABEL_42;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_40:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v17 = 0;
      }
LABEL_42:
      self->_hasExternalPowerSourceConnected = v17 != 0;
    }
    else if (v13 == 2)
    {
      char v20 = 0;
      unsigned int v21 = 0;
      uint64_t v22 = 0;
      *(unsigned char *)&self->_has |= 1u;
      while (1)
      {
        unint64_t v23 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v23 == -1 || v23 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v24 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v23);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
        v22 |= (unint64_t)(v24 & 0x7F) << v20;
        if ((v24 & 0x80) == 0) {
          goto LABEL_44;
        }
        v20 += 7;
        BOOL v10 = v21++ >= 9;
        if (v10)
        {
          LODWORD(v22) = 0;
          goto LABEL_46;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_44:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v22) = 0;
      }
LABEL_46:
      self->_uint64_t status = v22;
    }
    else if (v13 == 1)
    {
      v14 = objc_alloc_init(NPTOLibrary);
      objc_storeStrong((id *)&self->_library, v14);
      if (!PBReaderPlaceMark() || !NPTOLibraryReadFrom(v14, (uint64_t)a3))
      {

        LOBYTE(v25) = 0;
        return v25;
      }
      PBReaderRecallMark();
    }
    else
    {
      int v25 = PBReaderSkipValueWithTag();
      if (!v25) {
        return v25;
      }
    }
  }
  LOBYTE(v25) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v25;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_library)
  {
    PBDataWriterWriteSubmessage();
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

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_library)
  {
    id v6 = v4;
    [v4 setLibrary:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v4 + 4) = self->_status;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 20) = self->_hasExternalPowerSourceConnected;
    *((unsigned char *)v4 + 24) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(NPTOLibrary *)self->_library copyWithZone:a3];
  unint64_t v7 = (void *)v5[1];
  v5[1] = v6;

  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 4) = self->_status;
    *((unsigned char *)v5 + 24) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 20) = self->_hasExternalPowerSourceConnected;
    *((unsigned char *)v5 + 24) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  library = self->_library;
  if ((unint64_t)library | *((void *)v4 + 1))
  {
    if (!-[NPTOLibrary isEqual:](library, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_status != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_11;
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0)
    {
LABEL_11:
      BOOL v6 = 0;
      goto LABEL_12;
    }
    if (self->_hasExternalPowerSourceConnected)
    {
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_11;
      }
    }
    else if (*((unsigned char *)v4 + 20))
    {
      goto LABEL_11;
    }
    BOOL v6 = 1;
  }
LABEL_12:

  return v6;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPTOLibrary *)self->_library hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v4 = 2654435761 * self->_status;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v5 = 0;
    return v4 ^ v3 ^ v5;
  }
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v5 = 2654435761 * self->_hasExternalPowerSourceConnected;
  return v4 ^ v3 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  library = self->_library;
  uint64_t v6 = *((void *)v4 + 1);
  if (library)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[NPTOLibrary mergeFrom:](library, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v8 = v4;
    -[NPTOSyncResponse setLibrary:](self, "setLibrary:");
  }
  id v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 24);
  if (v7)
  {
    self->_uint64_t status = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 24);
  }
  if ((v7 & 2) != 0)
  {
    self->_hasExternalPowerSourceConnected = *((unsigned char *)v4 + 20);
    *(unsigned char *)&self->_has |= 2u;
  }

  _objc_release_x1();
}

- (NPTOLibrary)library
{
  return self->_library;
}

- (void)setLibrary:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
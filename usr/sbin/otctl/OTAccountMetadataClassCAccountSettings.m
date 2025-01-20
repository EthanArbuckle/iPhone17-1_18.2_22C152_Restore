@interface OTAccountMetadataClassCAccountSettings
- (BOOL)hasW;
- (BOOL)hasWebAccess;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)w;
- (BOOL)webAccess;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasW:(BOOL)a3;
- (void)setHasWebAccess:(BOOL)a3;
- (void)setW:(BOOL)a3;
- (void)setWebAccess:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation OTAccountMetadataClassCAccountSettings

- (BOOL)webAccess
{
  return self->_webAccess;
}

- (BOOL)w
{
  return self->_w;
}

- (void)mergeFrom:(id)a3
{
  v4 = (BOOL *)a3;
  BOOL v5 = v4[12];
  if (v5)
  {
    self->_w = v4[8];
    *(unsigned char *)&self->_has |= 1u;
    BOOL v5 = v4[12];
  }
  if ((v5 & 2) != 0)
  {
    self->_webAccess = v4[9];
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_w;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_webAccess;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((v4[12] & 1) == 0) {
      goto LABEL_12;
    }
    if (self->_w)
    {
      if (!v4[8]) {
        goto LABEL_12;
      }
    }
    else if (v4[8])
    {
      goto LABEL_12;
    }
  }
  else if (v4[12])
  {
    goto LABEL_12;
  }
  BOOL v5 = (v4[12] & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[12] & 2) != 0)
    {
      if (self->_webAccess)
      {
        if (!v4[9]) {
          goto LABEL_12;
        }
      }
      else if (v4[9])
      {
        goto LABEL_12;
      }
      BOOL v5 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v5 = 0;
  }
LABEL_13:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  char has = (char)self->_has;
  if (has)
  {
    *((unsigned char *)result + 8) = self->_w;
    *((unsigned char *)result + 12) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)result + 9) = self->_webAccess;
    *((unsigned char *)result + 12) |= 2u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[8] = self->_w;
    v4[12] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[9] = self->_webAccess;
    v4[12] |= 2u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (1)
    {
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
        if (v6++ >= 9)
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
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
      }
      if ((v7 >> 3) == 2) {
        break;
      }
      if ((v7 >> 3) == 1)
      {
        char v13 = 0;
        unsigned int v14 = 0;
        uint64_t v15 = 0;
        *(unsigned char *)&self->_has |= 1u;
        while (1)
        {
          unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__w;
            goto LABEL_37;
          }
          char v17 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v16);
          *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v16 + 1;
          v15 |= (unint64_t)(v17 & 0x7F) << v13;
          if ((v17 & 0x80) == 0) {
            break;
          }
          v13 += 7;
          BOOL v18 = v14++ > 8;
          if (v18)
          {
            uint64_t v15 = 0;
            v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__w;
            goto LABEL_40;
          }
        }
        v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__w;
LABEL_38:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v15 = 0;
        }
LABEL_40:
        self->PBCodable_opaque[*v19] = v15 != 0;
        goto LABEL_41;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_41:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    char v20 = 0;
    unsigned int v21 = 0;
    uint64_t v15 = 0;
    *(unsigned char *)&self->_has |= 2u;
    while (1)
    {
      unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v22 == -1 || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
      v15 |= (unint64_t)(v23 & 0x7F) << v20;
      if ((v23 & 0x80) == 0)
      {
        v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__webAccess;
        goto LABEL_38;
      }
      v20 += 7;
      BOOL v18 = v21++ > 8;
      if (v18)
      {
        uint64_t v15 = 0;
        v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__webAccess;
        goto LABEL_40;
      }
    }
    v19 = &OBJC_IVAR___OTAccountMetadataClassCAccountSettings__webAccess;
LABEL_37:
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
    goto LABEL_38;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if (has)
  {
    char v5 = +[NSNumber numberWithBool:self->_w];
    [v3 setObject:v5 forKey:@"w"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    unsigned int v6 = +[NSNumber numberWithBool:self->_webAccess];
    [v3 setObject:v6 forKey:@"webAccess"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)OTAccountMetadataClassCAccountSettings;
  uint64_t v3 = [(OTAccountMetadataClassCAccountSettings *)&v7 description];
  id v4 = [(OTAccountMetadataClassCAccountSettings *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasWebAccess
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasWebAccess:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setWebAccess:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_webAccess = a3;
}

- (BOOL)hasW
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasW:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setW:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_w = a3;
}

@end
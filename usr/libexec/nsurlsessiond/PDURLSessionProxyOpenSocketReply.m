@interface PDURLSessionProxyOpenSocketReply
- (BOOL)hasStreamErrorCode;
- (BOOL)hasStreamErrorDomain;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)streamErrorCode;
- (int)streamErrorDomain;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasStreamErrorCode:(BOOL)a3;
- (void)setHasStreamErrorDomain:(BOOL)a3;
- (void)setStreamErrorCode:(int)a3;
- (void)setStreamErrorDomain:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyOpenSocketReply

- (int)streamErrorCode
{
  return self->_streamErrorCode;
}

- (int)streamErrorDomain
{
  return self->_streamErrorDomain;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 16);
  if ((v5 & 2) != 0)
  {
    self->_streamErrorDomain = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 16);
  }
  if (v5)
  {
    self->_streamErrorCode = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_streamErrorDomain;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_streamErrorCode;
  return v3 ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 16) & 2) == 0 || self->_streamErrorDomain != *((_DWORD *)v4 + 3)) {
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 16) & 2) != 0)
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 16) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 16) & 1) == 0 || self->_streamErrorCode != *((_DWORD *)v4 + 2)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = [[[objc_opt_class() allocWithZone:a3] init];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 3) = self->_streamErrorDomain;
    *((unsigned char *)result + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)result + 2) = self->_streamErrorCode;
    *((unsigned char *)result + 16) |= 1u;
  }
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[3] = self->_streamErrorDomain;
    *((unsigned char *)v4 + 16) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[2] = self->_streamErrorCode;
    *((unsigned char *)v4 + 16) |= 1u;
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
        *(unsigned char *)&self->_has |= 2u;
        while (1)
        {
          unint64_t v16 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v16 == -1 || v16 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorDomain;
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
            LODWORD(v15) = 0;
            v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorDomain;
            goto LABEL_40;
          }
        }
        v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorDomain;
LABEL_38:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v15) = 0;
        }
LABEL_40:
        *(_DWORD *)&self->PBCodable_opaque[*v19] = v15;
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
    *(unsigned char *)&self->_has |= 1u;
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
        v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorCode;
        goto LABEL_38;
      }
      v20 += 7;
      BOOL v18 = v21++ > 8;
      if (v18)
      {
        LODWORD(v15) = 0;
        v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorCode;
        goto LABEL_40;
      }
    }
    v19 = &OBJC_IVAR___PDURLSessionProxyOpenSocketReply__streamErrorCode;
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
  if ((has & 2) != 0)
  {
    char v5 = +[NSNumber numberWithInt:self->_streamErrorDomain];
    [v3 setObject:v5 forKey:@"streamErrorDomain"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = +[NSNumber numberWithInt:self->_streamErrorCode];
    [v3 setObject:v6 forKey:@"streamErrorCode"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyOpenSocketReply;
  uint64_t v3 = [(PDURLSessionProxyOpenSocketReply *)&v7 description];
  id v4 = [(PDURLSessionProxyOpenSocketReply *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasStreamErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasStreamErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setStreamErrorCode:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_streamErrorCode = a3;
}

- (BOOL)hasStreamErrorDomain
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasStreamErrorDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setStreamErrorDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_streamErrorDomain = a3;
}

@end
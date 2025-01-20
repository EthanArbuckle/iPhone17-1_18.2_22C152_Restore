@interface PDURLSessionProxyInvalidateSession
- (BOOL)hasSession;
- (BOOL)hasShouldCancel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldCancel;
- (PDURLSessionProxySessionMessage)session;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasShouldCancel:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setShouldCancel:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyInvalidateSession

- (void).cxx_destruct
{
}

- (BOOL)shouldCancel
{
  return self->_shouldCancel;
}

- (void)setSession:(id)a3
{
}

- (PDURLSessionProxySessionMessage)session
{
  return self->_session;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  session = self->_session;
  uint64_t v6 = *((void *)v4 + 1);
  if (session)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[PDURLSessionProxySessionMessage mergeFrom:](session, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[PDURLSessionProxyInvalidateSession setSession:](self, "setSession:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 20))
  {
    self->_shouldCancel = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxySessionMessage *)self->_session hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_shouldCancel;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  session = self->_session;
  if ((unint64_t)session | *((void *)v4 + 1))
  {
    if (!-[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_shouldCancel)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(PDURLSessionProxySessionMessage *)self->_session copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 16) = self->_shouldCancel;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_session)
  {
    v5 = v4;
    [v4 setSession:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_shouldCancel;
    v4[20] |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_session)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
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
    if ((v7 >> 3) == 2)
    {
      char v14 = 0;
      unsigned int v15 = 0;
      uint64_t v16 = 0;
      *(unsigned char *)&self->_has |= 1u;
      while (1)
      {
        unint64_t v17 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v17 == -1 || v17 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v18 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v17);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v17 + 1;
        v16 |= (unint64_t)(v18 & 0x7F) << v14;
        if ((v18 & 0x80) == 0) {
          goto LABEL_32;
        }
        v14 += 7;
        BOOL v10 = v15++ >= 9;
        if (v10)
        {
          uint64_t v16 = 0;
          goto LABEL_34;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v16 = 0;
      }
LABEL_34:
      self->_shouldCancel = v16 != 0;
    }
    else if ((v7 >> 3) == 1)
    {
      v13 = objc_alloc_init(PDURLSessionProxySessionMessage);
      objc_storeStrong((id *)&self->_session, v13);
      if (!PBReaderPlaceMark() || (sub_10006494C((uint64_t)v13, (uint64_t)a3) & 1) == 0)
      {

        LOBYTE(v19) = 0;
        return v19;
      }
      PBReaderRecallMark();
    }
    else
    {
      int v19 = PBReaderSkipValueWithTag();
      if (!v19) {
        return v19;
      }
    }
  }
  LOBYTE(v19) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v19;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  session = self->_session;
  if (session)
  {
    char v5 = [(PDURLSessionProxySessionMessage *)session dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"session"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = +[NSNumber numberWithBool:self->_shouldCancel];
    [v3 setObject:v6 forKey:@"shouldCancel"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyInvalidateSession;
  unint64_t v3 = [(PDURLSessionProxyInvalidateSession *)&v7 description];
  id v4 = [(PDURLSessionProxyInvalidateSession *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasShouldCancel
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasShouldCancel:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setShouldCancel:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_shouldCancel = a3;
}

- (BOOL)hasSession
{
  return self->_session != 0;
}

@end
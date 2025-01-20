@interface PDURLSessionProxySessionBecameInvalid
- (BOOL)hasError;
- (BOOL)hasSession;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDURLSessionProxyError)error;
- (PDURLSessionProxySessionMessage)session;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setSession:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxySessionBecameInvalid

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setError:(id)a3
{
}

- (PDURLSessionProxyError)error
{
  return self->_error;
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
  v4 = a3;
  session = self->_session;
  uint64_t v6 = v4[2];
  v9 = v4;
  if (session)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDURLSessionProxySessionMessage mergeFrom:](session, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDURLSessionProxySessionBecameInvalid setSession:](self, "setSession:");
  }
  v4 = v9;
LABEL_7:
  error = self->_error;
  uint64_t v8 = v4[1];
  if (error)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDURLSessionProxyError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDURLSessionProxySessionBecameInvalid setError:](self, "setError:");
  }
  v4 = v9;
LABEL_13:
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxySessionMessage *)self->_session hash];
  return [(PDURLSessionProxyError *)self->_error hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((session = self->_session, !((unint64_t)session | v4[2]))
     || -[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:")))
  {
    error = self->_error;
    if ((unint64_t)error | v4[1]) {
      unsigned __int8 v7 = -[PDURLSessionProxyError isEqual:](error, "isEqual:");
    }
    else {
      unsigned __int8 v7 = 1;
    }
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(PDURLSessionProxySessionMessage *)self->_session copyWithZone:a3];
  unsigned __int8 v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(PDURLSessionProxyError *)self->_error copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_session)
  {
    [v4 setSession:];
    id v4 = v5;
  }
  if (self->_error)
  {
    [v5 setError:];
    id v4 = v5;
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
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
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
        v13 = objc_alloc_init(PDURLSessionProxySessionMessage);
        objc_storeStrong((id *)&self->_session, v13);
        if (!PBReaderPlaceMark() || (sub_10006494C((uint64_t)v13, (uint64_t)a3) & 1) == 0) {
          goto LABEL_28;
        }
LABEL_24:
        PBReaderRecallMark();

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v13 = objc_alloc_init(PDURLSessionProxyError);
    objc_storeStrong((id *)&self->_error, v13);
    if (!PBReaderPlaceMark() || (sub_10005DCA4((uint64_t)v13, (uint64_t)a3) & 1) == 0)
    {
LABEL_28:

      return 0;
    }
    goto LABEL_24;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
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
  error = self->_error;
  if (error)
  {
    unint64_t v7 = [(PDURLSessionProxyError *)error dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"error"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxySessionBecameInvalid;
  unint64_t v3 = [(PDURLSessionProxySessionBecameInvalid *)&v7 description];
  id v4 = [(PDURLSessionProxySessionBecameInvalid *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasSession
{
  return self->_session != 0;
}

@end
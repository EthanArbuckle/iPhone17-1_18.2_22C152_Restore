@interface PDURLSessionProxyOpenSocket
- (BOOL)hasHost;
- (BOOL)hasPort;
- (BOOL)hasSession;
- (BOOL)hasSocketUUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)host;
- (NSString)socketUUID;
- (PDURLSessionProxySessionMessage)session;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)port;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPort:(BOOL)a3;
- (void)setHost:(id)a3;
- (void)setPort:(unsigned int)a3;
- (void)setSession:(id)a3;
- (void)setSocketUUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyOpenSocket

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_socketUUID, 0);
  objc_storeStrong((id *)&self->_session, 0);

  objc_storeStrong((id *)&self->_host, 0);
}

- (unsigned)port
{
  return self->_port;
}

- (void)setHost:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setSocketUUID:(id)a3
{
}

- (NSString)socketUUID
{
  return self->_socketUUID;
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
  uint64_t v6 = *((void *)v4 + 3);
  id v7 = v4;
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
    -[PDURLSessionProxyOpenSocket setSession:](self, "setSession:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 4))
  {
    -[PDURLSessionProxyOpenSocket setSocketUUID:](self, "setSocketUUID:");
    id v4 = v7;
  }
  if (*((void *)v4 + 1))
  {
    -[PDURLSessionProxyOpenSocket setHost:](self, "setHost:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 40))
  {
    self->_port = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxySessionMessage *)self->_session hash];
  NSUInteger v4 = [(NSString *)self->_socketUUID hash];
  NSUInteger v5 = [(NSString *)self->_host hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_port;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  session = self->_session;
  if ((unint64_t)session | *((void *)v4 + 3))
  {
    if (!-[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:")) {
      goto LABEL_12;
    }
  }
  socketUUID = self->_socketUUID;
  if ((unint64_t)socketUUID | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](socketUUID, "isEqual:")) {
      goto LABEL_12;
    }
  }
  host = self->_host;
  if ((unint64_t)host | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](host, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_port == *((_DWORD *)v4 + 4))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = [[[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(PDURLSessionProxySessionMessage *)self->_session copyWithZone:a3];
  id v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_socketUUID copyWithZone:a3];
  v9 = (void *)v5[4];
  v5[4] = v8;

  id v10 = [(NSString *)self->_host copyWithZone:a3];
  v11 = (void *)v5[1];
  v5[1] = v10;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_port;
    *((unsigned char *)v5 + 40) |= 1u;
  }
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
  if (self->_socketUUID)
  {
    [v5 setSocketUUID:];
    id v4 = v5;
  }
  if (self->_host)
  {
    [v5 setHost:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_port;
    *((unsigned char *)v4 + 40) |= 1u;
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
  if (self->_socketUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_host)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
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
    switch((v7 >> 3))
    {
      case 1u:
        v13 = objc_alloc_init(PDURLSessionProxySessionMessage);
        objc_storeStrong((id *)&self->_session, v13);
        if PBReaderPlaceMark() && (sub_10006494C((uint64_t)v13, (uint64_t)a3))
        {
          PBReaderRecallMark();

          continue;
        }

        LOBYTE(v14) = 0;
        return v14;
      case 2u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 32;
        goto LABEL_25;
      case 3u:
        uint64_t v15 = PBReaderReadString();
        uint64_t v16 = 8;
LABEL_25:
        v17 = *(void **)&self->PBCodable_opaque[v16];
        *(void *)&self->PBCodable_opaque[v16] = v15;

        continue;
      case 4u:
        char v18 = 0;
        unsigned int v19 = 0;
        uint64_t v20 = 0;
        *(unsigned char *)&self->_has |= 1u;
        break;
      default:
        int v14 = PBReaderSkipValueWithTag();
        if (!v14) {
          return v14;
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
      v20 |= (unint64_t)(v22 & 0x7F) << v18;
      if ((v22 & 0x80) == 0) {
        goto LABEL_34;
      }
      v18 += 7;
      BOOL v10 = v19++ >= 9;
      if (v10)
      {
        LODWORD(v20) = 0;
        goto LABEL_36;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      LODWORD(v20) = 0;
    }
LABEL_36:
    self->_port = v20;
  }
  LOBYTE(v14) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
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
  socketUUID = self->_socketUUID;
  if (socketUUID) {
    [v3 setObject:socketUUID forKey:@"socketUUID"];
  }
  host = self->_host;
  if (host) {
    [v3 setObject:host forKey:@"host"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v8 = +[NSNumber numberWithUnsignedInt:self->_port];
    [v3 setObject:v8 forKey:@"port"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyOpenSocket;
  unint64_t v3 = [(PDURLSessionProxyOpenSocket *)&v7 description];
  id v4 = [(PDURLSessionProxyOpenSocket *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasPort
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPort:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPort:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_port = a3;
}

- (BOOL)hasHost
{
  return self->_host != 0;
}

- (BOOL)hasSocketUUID
{
  return self->_socketUUID != 0;
}

- (BOOL)hasSession
{
  return self->_session != 0;
}

@end
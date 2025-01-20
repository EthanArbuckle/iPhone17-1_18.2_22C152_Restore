@interface PDURLSessionProxyConnectedToServer
- (BOOL)hasSocketUUID;
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)socketUUID;
- (PDURLSessionProxyTaskMessage)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSocketUUID:(id)a3;
- (void)setTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyConnectedToServer

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_socketUUID, 0);
}

- (void)setSocketUUID:(id)a3
{
}

- (NSString)socketUUID
{
  return self->_socketUUID;
}

- (void)setTask:(id)a3
{
}

- (PDURLSessionProxyTaskMessage)task
{
  return self->_task;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  task = self->_task;
  uint64_t v6 = v4[2];
  v7 = v4;
  if (task)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDURLSessionProxyTaskMessage mergeFrom:](task, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[PDURLSessionProxyConnectedToServer setTask:](self, "setTask:");
  }
  v4 = v7;
LABEL_7:
  if (v4[1])
  {
    -[PDURLSessionProxyConnectedToServer setSocketUUID:](self, "setSocketUUID:");
    v4 = v7;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  return [(NSString *)self->_socketUUID hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((task = self->_task, !((unint64_t)task | v4[2]))
     || -[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")))
  {
    socketUUID = self->_socketUUID;
    if ((unint64_t)socketUUID | v4[1]) {
      unsigned __int8 v7 = -[NSString isEqual:](socketUUID, "isEqual:");
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
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  unsigned __int8 v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSString *)self->_socketUUID copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_task)
  {
    [v4 setTask:];
    id v4 = v5;
  }
  if (self->_socketUUID)
  {
    [v5 setSocketUUID:];
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_task)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_socketUUID)
  {
    PBDataWriterWriteStringField();
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
        socketUUID = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, socketUUID);
        if (!PBReaderPlaceMark() || (sub_10005AB80((uint64_t)socketUUID, (uint64_t)a3) & 1) == 0)
        {

          return 0;
        }
        PBReaderRecallMark();
        goto LABEL_23;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_25:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    PBReaderReadString();
    v14 = (NSString *)objc_claimAutoreleasedReturnValue();
    socketUUID = (PDURLSessionProxyTaskMessage *)self->_socketUUID;
    self->_socketUUID = v14;
LABEL_23:

    goto LABEL_25;
  }
  return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  task = self->_task;
  if (task)
  {
    char v5 = [(PDURLSessionProxyTaskMessage *)task dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"task"];
  }
  socketUUID = self->_socketUUID;
  if (socketUUID) {
    [v3 setObject:socketUUID forKey:@"socketUUID"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyConnectedToServer;
  unint64_t v3 = [(PDURLSessionProxyConnectedToServer *)&v7 description];
  id v4 = [(PDURLSessionProxyConnectedToServer *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasSocketUUID
{
  return self->_socketUUID != 0;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end
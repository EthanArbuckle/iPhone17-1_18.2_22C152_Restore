@interface PDURLSessionProxyWillSendRequest
- (BOOL)hasBodyStream;
- (BOOL)hasHasBodyStream;
- (BOOL)hasRequest;
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDURLSessionProxyRequest)request;
- (PDURLSessionProxyTaskMessage)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasBodyStream:(BOOL)a3;
- (void)setHasHasBodyStream:(BOOL)a3;
- (void)setRequest:(id)a3;
- (void)setTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyWillSendRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (BOOL)hasBodyStream
{
  return self->_hasBodyStream;
}

- (void)setRequest:(id)a3
{
}

- (PDURLSessionProxyRequest)request
{
  return self->_request;
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
  id v4 = a3;
  task = self->_task;
  uint64_t v6 = *((void *)v4 + 2);
  id v9 = v4;
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
    -[PDURLSessionProxyWillSendRequest setTask:](self, "setTask:");
  }
  id v4 = v9;
LABEL_7:
  request = self->_request;
  uint64_t v8 = *((void *)v4 + 1);
  if (request)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDURLSessionProxyRequest mergeFrom:](request, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDURLSessionProxyWillSendRequest setRequest:](self, "setRequest:");
  }
  id v4 = v9;
LABEL_13:
  if (*((unsigned char *)v4 + 28))
  {
    self->_hasBodyStream = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  unint64_t v4 = [(PDURLSessionProxyRequest *)self->_request hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_hasBodyStream;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  task = self->_task;
  if ((unint64_t)task | *((void *)v4 + 2))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")) {
      goto LABEL_8;
    }
  }
  request = self->_request;
  if ((unint64_t)request | *((void *)v4 + 1))
  {
    if (!-[PDURLSessionProxyRequest isEqual:](request, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v7 = (*((unsigned char *)v4 + 28) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0)
    {
LABEL_8:
      BOOL v7 = 0;
      goto LABEL_9;
    }
    if (self->_hasBodyStream)
    {
      if (!*((unsigned char *)v4 + 24)) {
        goto LABEL_8;
      }
    }
    else if (*((unsigned char *)v4 + 24))
    {
      goto LABEL_8;
    }
    BOOL v7 = 1;
  }
LABEL_9:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  BOOL v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(PDURLSessionProxyRequest *)self->_request copyWithZone:a3];
  id v9 = (void *)v5[1];
  v5[1] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 24) = self->_hasBodyStream;
    *((unsigned char *)v5 + 28) |= 1u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (self->_task)
  {
    [v4 setTask:];
    id v4 = v5;
  }
  if (self->_request)
  {
    [v5 setRequest:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_hasBodyStream;
    v4[28] |= 1u;
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
  if (self->_request)
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
    unint64_t v13 = v7 >> 3;
    if ((v7 >> 3) == 3)
    {
      char v15 = 0;
      unsigned int v16 = 0;
      uint64_t v17 = 0;
      *(unsigned char *)&self->_has |= 1u;
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
          goto LABEL_36;
        }
        v15 += 7;
        BOOL v10 = v16++ >= 9;
        if (v10)
        {
          uint64_t v17 = 0;
          goto LABEL_38;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v17 = 0;
      }
LABEL_38:
      self->_hasBodyStream = v17 != 0;
    }
    else
    {
      if (v13 == 2)
      {
        v14 = objc_alloc_init(PDURLSessionProxyRequest);
        objc_storeStrong((id *)&self->_request, v14);
        if (!PBReaderPlaceMark() || (sub_10004C0E4((uint64_t)v14, (uint64_t)a3) & 1) == 0)
        {
LABEL_41:

          LOBYTE(v20) = 0;
          return v20;
        }
      }
      else
      {
        if (v13 != 1)
        {
          int v20 = PBReaderSkipValueWithTag();
          if (!v20) {
            return v20;
          }
          continue;
        }
        v14 = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, v14);
        if (!PBReaderPlaceMark() || (sub_10005AB80((uint64_t)v14, (uint64_t)a3) & 1) == 0) {
          goto LABEL_41;
        }
      }
      PBReaderRecallMark();
    }
  }
  LOBYTE(v20) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v20;
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
  request = self->_request;
  if (request)
  {
    unint64_t v7 = [(PDURLSessionProxyRequest *)request dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"request"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v8 = +[NSNumber numberWithBool:self->_hasBodyStream];
    [v3 setObject:v8 forKey:@"hasBodyStream"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyWillSendRequest;
  unint64_t v3 = [(PDURLSessionProxyWillSendRequest *)&v7 description];
  id v4 = [(PDURLSessionProxyWillSendRequest *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasHasBodyStream
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasHasBodyStream:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setHasBodyStream:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_hasBodyStream = a3;
}

- (BOOL)hasRequest
{
  return self->_request != 0;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end
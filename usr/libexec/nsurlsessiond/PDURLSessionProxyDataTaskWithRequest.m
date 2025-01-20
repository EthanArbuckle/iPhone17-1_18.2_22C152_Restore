@interface PDURLSessionProxyDataTaskWithRequest
- (BOOL)hasCurrentRequest;
- (BOOL)hasOriginalRequest;
- (BOOL)hasTask;
- (BOOL)hasTaskSequenceNumber;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDURLSessionProxyRequest)currentRequest;
- (PDURLSessionProxyRequest)originalRequest;
- (PDURLSessionProxyTaskMessage)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)taskSequenceNumber;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCurrentRequest:(id)a3;
- (void)setHasTaskSequenceNumber:(BOOL)a3;
- (void)setOriginalRequest:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskSequenceNumber:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyDataTaskWithRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_originalRequest, 0);

  objc_storeStrong((id *)&self->_currentRequest, 0);
}

- (unint64_t)taskSequenceNumber
{
  return self->_taskSequenceNumber;
}

- (void)setCurrentRequest:(id)a3
{
}

- (PDURLSessionProxyRequest)currentRequest
{
  return self->_currentRequest;
}

- (void)setOriginalRequest:(id)a3
{
}

- (PDURLSessionProxyRequest)originalRequest
{
  return self->_originalRequest;
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
  uint64_t v6 = v4[4];
  v11 = v4;
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
    -[PDURLSessionProxyDataTaskWithRequest setTask:](self, "setTask:");
  }
  v4 = v11;
LABEL_7:
  originalRequest = self->_originalRequest;
  uint64_t v8 = v4[3];
  if (originalRequest)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDURLSessionProxyRequest mergeFrom:](originalRequest, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDURLSessionProxyDataTaskWithRequest setOriginalRequest:](self, "setOriginalRequest:");
  }
  v4 = v11;
LABEL_13:
  currentRequest = self->_currentRequest;
  uint64_t v10 = v4[2];
  if (currentRequest)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[PDURLSessionProxyRequest mergeFrom:](currentRequest, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[PDURLSessionProxyDataTaskWithRequest setCurrentRequest:](self, "setCurrentRequest:");
  }
  v4 = v11;
LABEL_19:
  if (v4[5])
  {
    self->_taskSequenceNumber = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  unint64_t v4 = [(PDURLSessionProxyRequest *)self->_originalRequest hash];
  unint64_t v5 = [(PDURLSessionProxyRequest *)self->_currentRequest hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_taskSequenceNumber;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  task = self->_task;
  if ((unint64_t)task | *((void *)v4 + 4))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")) {
      goto LABEL_12;
    }
  }
  originalRequest = self->_originalRequest;
  if ((unint64_t)originalRequest | *((void *)v4 + 3))
  {
    if (!-[PDURLSessionProxyRequest isEqual:](originalRequest, "isEqual:")) {
      goto LABEL_12;
    }
  }
  currentRequest = self->_currentRequest;
  if ((unint64_t)currentRequest | *((void *)v4 + 2))
  {
    if (!-[PDURLSessionProxyRequest isEqual:](currentRequest, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_taskSequenceNumber == *((void *)v4 + 1))
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
  unint64_t v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  v7 = (void *)v5[4];
  v5[4] = v6;

  id v8 = [(PDURLSessionProxyRequest *)self->_originalRequest copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  id v10 = [(PDURLSessionProxyRequest *)self->_currentRequest copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_taskSequenceNumber;
    *((unsigned char *)v5 + 40) |= 1u;
  }
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
  if (self->_originalRequest)
  {
    [v5 setOriginalRequest:];
    id v4 = v5;
  }
  if (self->_currentRequest)
  {
    [v5 setCurrentRequest:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_taskSequenceNumber;
    *((unsigned char *)v4 + 40) |= 1u;
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
  if (self->_originalRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_currentRequest)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
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
          v13 = objc_alloc_init(PDURLSessionProxyTaskMessage);
          objc_storeStrong((id *)&self->_task, v13);
          if PBReaderPlaceMark() && (sub_10005AB80((uint64_t)v13, (uint64_t)a3)) {
            goto LABEL_27;
          }
          goto LABEL_41;
        case 2u:
          v13 = objc_alloc_init(PDURLSessionProxyRequest);
          uint64_t v15 = 24;
          goto LABEL_25;
        case 3u:
          v13 = objc_alloc_init(PDURLSessionProxyRequest);
          uint64_t v15 = 16;
LABEL_25:
          objc_storeStrong((id *)&self->PBRequest_opaque[v15], v13);
          if (!PBReaderPlaceMark() || (sub_10004C0E4((uint64_t)v13, (uint64_t)a3) & 1) == 0)
          {
LABEL_41:

            LOBYTE(v14) = 0;
            return v14;
          }
LABEL_27:
          PBReaderRecallMark();

LABEL_39:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_40;
          break;
        case 4u:
          char v16 = 0;
          unsigned int v17 = 0;
          unint64_t v18 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            unint64_t v19 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v19 == -1 || v19 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v20 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
              v18 |= (unint64_t)(v20 & 0x7F) << v16;
              if (v20 < 0)
              {
                v16 += 7;
                BOOL v10 = v17++ >= 9;
                if (v10)
                {
                  unint64_t v18 = 0;
                  goto LABEL_38;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            unint64_t v18 = 0;
          }
LABEL_38:
          self->_taskSequenceNumber = v18;
          goto LABEL_39;
        default:
          int v14 = PBReaderSkipValueWithTag();
          if (!v14) {
            return v14;
          }
          goto LABEL_39;
      }
    }
  }
LABEL_40:
  LOBYTE(v14) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
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
  originalRequest = self->_originalRequest;
  if (originalRequest)
  {
    unint64_t v7 = [(PDURLSessionProxyRequest *)originalRequest dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"originalRequest"];
  }
  currentRequest = self->_currentRequest;
  if (currentRequest)
  {
    char v9 = [(PDURLSessionProxyRequest *)currentRequest dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"currentRequest"];
  }
  if (*(unsigned char *)&self->_has)
  {
    BOOL v10 = +[NSNumber numberWithUnsignedLongLong:self->_taskSequenceNumber];
    [v3 setObject:v10 forKey:@"taskSequenceNumber"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyDataTaskWithRequest;
  unint64_t v3 = [(PDURLSessionProxyDataTaskWithRequest *)&v7 description];
  id v4 = [(PDURLSessionProxyDataTaskWithRequest *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasTaskSequenceNumber
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTaskSequenceNumber:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTaskSequenceNumber:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_taskSequenceNumber = a3;
}

- (BOOL)hasCurrentRequest
{
  return self->_currentRequest != 0;
}

- (BOOL)hasOriginalRequest
{
  return self->_originalRequest != 0;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end
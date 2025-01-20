@interface PDURLSessionProxyWillPerformRedirection
- (BOOL)hasRequest;
- (BOOL)hasResponse;
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDURLSessionProxyRequest)request;
- (PDURLSessionProxyResponse)response;
- (PDURLSessionProxyTaskMessage)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setRequest:(id)a3;
- (void)setResponse:(id)a3;
- (void)setTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyWillPerformRedirection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);
  objc_storeStrong((id *)&self->_response, 0);

  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setResponse:(id)a3
{
}

- (PDURLSessionProxyResponse)response
{
  return self->_response;
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
  v4 = a3;
  task = self->_task;
  uint64_t v6 = v4[3];
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
    -[PDURLSessionProxyWillPerformRedirection setTask:](self, "setTask:");
  }
  v4 = v11;
LABEL_7:
  request = self->_request;
  uint64_t v8 = v4[1];
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
    -[PDURLSessionProxyWillPerformRedirection setRequest:](self, "setRequest:");
  }
  v4 = v11;
LABEL_13:
  response = self->_response;
  uint64_t v10 = v4[2];
  if (response)
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[PDURLSessionProxyResponse mergeFrom:](response, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_19;
    }
    -[PDURLSessionProxyWillPerformRedirection setResponse:](self, "setResponse:");
  }
  v4 = v11;
LABEL_19:
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  unint64_t v4 = [(PDURLSessionProxyRequest *)self->_request hash] ^ v3;
  return v4 ^ [(PDURLSessionProxyResponse *)self->_response hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((task = self->_task, !((unint64_t)task | v4[3]))
     || -[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:"))
    && ((request = self->_request, !((unint64_t)request | v4[1]))
     || -[PDURLSessionProxyRequest isEqual:](request, "isEqual:")))
  {
    response = self->_response;
    if ((unint64_t)response | v4[2]) {
      unsigned __int8 v8 = -[PDURLSessionProxyResponse isEqual:](response, "isEqual:");
    }
    else {
      unsigned __int8 v8 = 1;
    }
  }
  else
  {
    unsigned __int8 v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(PDURLSessionProxyRequest *)self->_request copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(PDURLSessionProxyResponse *)self->_response copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

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
  if (self->_request)
  {
    [v5 setRequest:];
    id v4 = v5;
  }
  if (self->_response)
  {
    [v5 setResponse:];
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
  if (self->_request)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_response)
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
      unint64_t v13 = v7 >> 3;
      if ((v7 >> 3) == 3)
      {
        v14 = objc_alloc_init(PDURLSessionProxyResponse);
        objc_storeStrong((id *)&self->_response, v14);
        if (!PBReaderPlaceMark() || (sub_100046710((uint64_t)v14, (uint64_t)a3) & 1) == 0)
        {
LABEL_32:

          return 0;
        }
        goto LABEL_28;
      }
      if (v13 == 2) {
        break;
      }
      if (v13 == 1)
      {
        v14 = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, v14);
        if (!PBReaderPlaceMark() || (sub_10005AB80((uint64_t)v14, (uint64_t)a3) & 1) == 0) {
          goto LABEL_32;
        }
LABEL_28:
        PBReaderRecallMark();

        goto LABEL_30;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_30:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v14 = objc_alloc_init(PDURLSessionProxyRequest);
    objc_storeStrong((id *)&self->_request, v14);
    if (!PBReaderPlaceMark() || (sub_10004C0E4((uint64_t)v14, (uint64_t)a3) & 1) == 0) {
      goto LABEL_32;
    }
    goto LABEL_28;
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
  request = self->_request;
  if (request)
  {
    unint64_t v7 = [(PDURLSessionProxyRequest *)request dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"request"];
  }
  response = self->_response;
  if (response)
  {
    char v9 = [(PDURLSessionProxyResponse *)response dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"response"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyWillPerformRedirection;
  unint64_t v3 = [(PDURLSessionProxyWillPerformRedirection *)&v7 description];
  id v4 = [(PDURLSessionProxyWillPerformRedirection *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasResponse
{
  return self->_response != 0;
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
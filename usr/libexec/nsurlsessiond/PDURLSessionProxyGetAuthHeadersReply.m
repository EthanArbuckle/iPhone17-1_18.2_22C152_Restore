@interface PDURLSessionProxyGetAuthHeadersReply
- (BOOL)continueLoad;
- (BOOL)hasContinueLoad;
- (BOOL)hasHeaderData;
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)headerData;
- (NSDictionary)_actualAuthHeaders;
- (PDURLSessionProxyTaskMessage)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_setActualAuthHeaders:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContinueLoad:(BOOL)a3;
- (void)setHasContinueLoad:(BOOL)a3;
- (void)setHeaderData:(id)a3;
- (void)setTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyGetAuthHeadersReply

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_headerData, 0);
}

- (BOOL)continueLoad
{
  return self->_continueLoad;
}

- (void)setHeaderData:(id)a3
{
}

- (NSData)headerData
{
  return self->_headerData;
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
  id v7 = v4;
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
    -[PDURLSessionProxyGetAuthHeadersReply setTask:](self, "setTask:");
  }
  id v4 = v7;
LABEL_7:
  if (*((void *)v4 + 1))
  {
    -[PDURLSessionProxyGetAuthHeadersReply setHeaderData:](self, "setHeaderData:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 28))
  {
    self->_continueLoad = *((unsigned char *)v4 + 24);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  unint64_t v4 = (unint64_t)[(NSData *)self->_headerData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_continueLoad;
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
  headerData = self->_headerData;
  if ((unint64_t)headerData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](headerData, "isEqual:")) {
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
    if (self->_continueLoad)
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
  uint64_t v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  BOOL v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(NSData *)self->_headerData copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 24) = self->_continueLoad;
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
  if (self->_headerData)
  {
    [v5 setHeaderData:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[24] = self->_continueLoad;
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
  if (self->_headerData)
  {
    PBDataWriterWriteDataField();
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
          goto LABEL_34;
        }
        v15 += 7;
        BOOL v10 = v16++ >= 9;
        if (v10)
        {
          uint64_t v17 = 0;
          goto LABEL_36;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_34:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        uint64_t v17 = 0;
      }
LABEL_36:
      self->_continueLoad = v17 != 0;
    }
    else if (v13 == 2)
    {
      PBReaderReadData();
      v20 = (NSData *)objc_claimAutoreleasedReturnValue();
      headerData = self->_headerData;
      self->_headerData = v20;
    }
    else if (v13 == 1)
    {
      v14 = objc_alloc_init(PDURLSessionProxyTaskMessage);
      objc_storeStrong((id *)&self->_task, v14);
      if (!PBReaderPlaceMark() || (sub_10005AB80((uint64_t)v14, (uint64_t)a3) & 1) == 0)
      {

        LOBYTE(v22) = 0;
        return v22;
      }
      PBReaderRecallMark();
    }
    else
    {
      int v22 = PBReaderSkipValueWithTag();
      if (!v22) {
        return v22;
      }
    }
  }
  LOBYTE(v22) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v22;
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
  headerData = self->_headerData;
  if (headerData) {
    [v3 setObject:headerData forKey:@"headerData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v7 = +[NSNumber numberWithBool:self->_continueLoad];
    [v3 setObject:v7 forKey:@"continueLoad"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyGetAuthHeadersReply;
  unint64_t v3 = [(PDURLSessionProxyGetAuthHeadersReply *)&v7 description];
  id v4 = [(PDURLSessionProxyGetAuthHeadersReply *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasContinueLoad
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasContinueLoad:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setContinueLoad:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_continueLoad = a3;
}

- (BOOL)hasHeaderData
{
  return self->_headerData != 0;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

- (void)_setActualAuthHeaders:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v6 = v4;
    char v5 = +[NSPropertyListSerialization dataWithPropertyList:v4 format:200 options:0 error:0];
    [(PDURLSessionProxyGetAuthHeadersReply *)self setHeaderData:v5];

    id v4 = v6;
  }
}

- (NSDictionary)_actualAuthHeaders
{
  unint64_t v3 = [(PDURLSessionProxyGetAuthHeadersReply *)self headerData];

  if (v3)
  {
    id v4 = [(PDURLSessionProxyGetAuthHeadersReply *)self headerData];
    id v10 = 0;
    char v5 = +[NSPropertyListSerialization propertyListWithData:v4 options:0 format:0 error:&v10];
    id v6 = v10;

    if (v6)
    {
      objc_super v7 = (id)qword_1000CB110;
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        id v9 = [v6 code];
        *(_DWORD *)buf = 138412546;
        id v12 = v6;
        __int16 v13 = 2048;
        id v14 = v9;
        _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Error %@ [%ld] deserializing auth headers", buf, 0x16u);
      }
    }
  }
  else
  {
    char v5 = 0;
  }

  return (NSDictionary *)v5;
}

@end
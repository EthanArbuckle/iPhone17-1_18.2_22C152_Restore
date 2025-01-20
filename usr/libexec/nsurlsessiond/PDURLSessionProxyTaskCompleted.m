@interface PDURLSessionProxyTaskCompleted
- (BOOL)hasError;
- (BOOL)hasTask;
- (BOOL)hasTaskInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)taskInfo;
- (PDURLSessionProxyError)error;
- (PDURLSessionProxyTaskMessage)task;
- (__NSCFURLSessionTaskInfo)_actualTaskInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)_setActualTaskInfo:(id)a3;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)setTask:(id)a3;
- (void)setTaskInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyTaskCompleted

- (void)_setActualTaskInfo:(id)a3
{
  id v4 = +[NSKeyedArchiver _nsurlsessionproxy_secureArchivedDataWithRootObject:a3];
  -[PDURLSessionProxyTaskCompleted setTaskInfo:](self, "setTaskInfo:");
}

- (__NSCFURLSessionTaskInfo)_actualTaskInfo
{
  uint64_t v3 = objc_opt_class();
  id v4 = [(PDURLSessionProxyTaskCompleted *)self taskInfo];
  v5 = +[NSKeyedUnarchiver _nsurlsessionproxy_secureUnarchiveObjectOfClass:v3 withData:v4];

  return (__NSCFURLSessionTaskInfo *)v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_error, 0);
}

- (void)setTaskInfo:(id)a3
{
}

- (NSData)taskInfo
{
  return self->_taskInfo;
}

- (void)setError:(id)a3
{
}

- (PDURLSessionProxyError)error
{
  return self->_error;
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
  uint64_t v6 = v4[2];
  v9 = v4;
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
    -[PDURLSessionProxyTaskCompleted setTask:](self, "setTask:");
  }
  id v4 = v9;
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
    -[PDURLSessionProxyTaskCompleted setError:](self, "setError:");
  }
  id v4 = v9;
LABEL_13:
  if (v4[3])
  {
    -[PDURLSessionProxyTaskCompleted setTaskInfo:](self, "setTaskInfo:");
    id v4 = v9;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  unint64_t v4 = [(PDURLSessionProxyError *)self->_error hash] ^ v3;
  return v4 ^ (unint64_t)[(NSData *)self->_taskInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((task = self->_task, !((unint64_t)task | v4[2]))
     || -[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:"))
    && ((error = self->_error, !((unint64_t)error | v4[1]))
     || -[PDURLSessionProxyError isEqual:](error, "isEqual:")))
  {
    taskInfo = self->_taskInfo;
    if ((unint64_t)taskInfo | v4[3]) {
      unsigned __int8 v8 = -[NSData isEqual:](taskInfo, "isEqual:");
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
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(PDURLSessionProxyError *)self->_error copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  id v10 = [(NSData *)self->_taskInfo copyWithZone:a3];
  v11 = (void *)v5[3];
  v5[3] = v10;

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
  if (self->_error)
  {
    [v5 setError:];
    id v4 = v5;
  }
  if (self->_taskInfo)
  {
    [v5 setTaskInfo:];
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
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_taskInfo)
  {
    PBDataWriterWriteDataField();
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
      if ((v7 >> 3) == 3) {
        break;
      }
      if (v13 == 2)
      {
        taskInfo = objc_alloc_init(PDURLSessionProxyError);
        objc_storeStrong((id *)&self->_error, taskInfo);
        if (!PBReaderPlaceMark() || (sub_10005DCA4((uint64_t)taskInfo, (uint64_t)a3) & 1) == 0)
        {
LABEL_31:

          return 0;
        }
LABEL_26:
        PBReaderRecallMark();
LABEL_27:

        goto LABEL_29;
      }
      if (v13 == 1)
      {
        taskInfo = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, taskInfo);
        if (!PBReaderPlaceMark() || (sub_10005AB80((uint64_t)taskInfo, (uint64_t)a3) & 1) == 0) {
          goto LABEL_31;
        }
        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_29:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    PBReaderReadData();
    v15 = (NSData *)objc_claimAutoreleasedReturnValue();
    taskInfo = (PDURLSessionProxyError *)self->_taskInfo;
    self->_taskInfo = v15;
    goto LABEL_27;
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
  error = self->_error;
  if (error)
  {
    unint64_t v7 = [(PDURLSessionProxyError *)error dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"error"];
  }
  taskInfo = self->_taskInfo;
  if (taskInfo) {
    [v3 setObject:taskInfo forKey:@"taskInfo"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyTaskCompleted;
  unint64_t v3 = [(PDURLSessionProxyTaskCompleted *)&v7 description];
  id v4 = [(PDURLSessionProxyTaskCompleted *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasTaskInfo
{
  return self->_taskInfo != 0;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end
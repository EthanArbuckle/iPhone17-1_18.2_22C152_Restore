@interface PDURLSessionProxySetTaskPriority
- (BOOL)hasPriority;
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDURLSessionProxyTaskMessage)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)priority;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasPriority:(BOOL)a3;
- (void)setPriority:(unsigned int)a3;
- (void)setTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxySetTaskPriority

- (void).cxx_destruct
{
}

- (unsigned)priority
{
  return self->_priority;
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
  if (task)
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[PDURLSessionProxyTaskMessage mergeFrom:](task, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    id v7 = v4;
    -[PDURLSessionProxySetTaskPriority setTask:](self, "setTask:");
  }
  id v4 = v7;
LABEL_7:
  if (*((unsigned char *)v4 + 24))
  {
    self->_priority = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_priority;
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
    goto LABEL_8;
  }
  task = self->_task;
  if ((unint64_t)task | *((void *)v4 + 2))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_priority == *((_DWORD *)v4 + 2))
    {
      BOOL v6 = 1;
      goto LABEL_9;
    }
LABEL_8:
    BOOL v6 = 0;
  }
LABEL_9:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  id v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 2) = self->_priority;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_task)
  {
    id v5 = v4;
    [v4 setTask:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 2) = self->_priority;
    *((unsigned char *)v4 + 24) |= 1u;
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
          LODWORD(v16) = 0;
          goto LABEL_34;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_32:
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v16) = 0;
      }
LABEL_34:
      self->_priority = v16;
    }
    else if ((v7 >> 3) == 1)
    {
      v13 = objc_alloc_init(PDURLSessionProxyTaskMessage);
      objc_storeStrong((id *)&self->_task, v13);
      if (!PBReaderPlaceMark() || (sub_10005AB80((uint64_t)v13, (uint64_t)a3) & 1) == 0)
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
  task = self->_task;
  if (task)
  {
    char v5 = [(PDURLSessionProxyTaskMessage *)task dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"task"];
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v6 = +[NSNumber numberWithUnsignedInt:self->_priority];
    [v3 setObject:v6 forKey:@"priority"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxySetTaskPriority;
  unint64_t v3 = [(PDURLSessionProxySetTaskPriority *)&v7 description];
  id v4 = [(PDURLSessionProxySetTaskPriority *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasPriority
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasPriority:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setPriority:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_priority = a3;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end
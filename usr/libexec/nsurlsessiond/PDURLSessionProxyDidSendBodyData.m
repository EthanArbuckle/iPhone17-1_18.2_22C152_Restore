@interface PDURLSessionProxyDidSendBodyData
- (BOOL)hasBytesSent;
- (BOOL)hasTask;
- (BOOL)hasTotalBytesExpectedToSend;
- (BOOL)hasTotalBytesSent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDURLSessionProxyTaskMessage)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)bytesSent;
- (unint64_t)hash;
- (unint64_t)totalBytesExpectedToSend;
- (unint64_t)totalBytesSent;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBytesSent:(unint64_t)a3;
- (void)setHasBytesSent:(BOOL)a3;
- (void)setHasTotalBytesExpectedToSend:(BOOL)a3;
- (void)setHasTotalBytesSent:(BOOL)a3;
- (void)setTask:(id)a3;
- (void)setTotalBytesExpectedToSend:(unint64_t)a3;
- (void)setTotalBytesSent:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyDidSendBodyData

- (void).cxx_destruct
{
}

- (unint64_t)totalBytesExpectedToSend
{
  return self->_totalBytesExpectedToSend;
}

- (unint64_t)totalBytesSent
{
  return self->_totalBytesSent;
}

- (unint64_t)bytesSent
{
  return self->_bytesSent;
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
  if (task)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v8 = v4;
    -[PDURLSessionProxyTaskMessage mergeFrom:](task, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v8 = v4;
    -[PDURLSessionProxyDidSendBodyData setTask:](self, "setTask:");
  }
  v4 = v8;
LABEL_7:
  char v7 = *((unsigned char *)v4 + 40);
  if (v7)
  {
    self->_bytesSent = v4[1];
    *(unsigned char *)&self->_has |= 1u;
    char v7 = *((unsigned char *)v4 + 40);
    if ((v7 & 4) == 0)
    {
LABEL_9:
      if ((v7 & 2) == 0) {
        goto LABEL_11;
      }
      goto LABEL_10;
    }
  }
  else if ((v4[5] & 4) == 0)
  {
    goto LABEL_9;
  }
  self->_totalBytesSent = v4[3];
  *(unsigned char *)&self->_has |= 4u;
  if ((v4[5] & 2) != 0)
  {
LABEL_10:
    self->_totalBytesExpectedToSend = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_11:
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    unint64_t v4 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    unint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6;
  }
  unint64_t v4 = 2654435761u * self->_bytesSent;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  unint64_t v5 = 2654435761u * self->_totalBytesSent;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  unint64_t v6 = 2654435761u * self->_totalBytesExpectedToSend;
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  task = self->_task;
  if ((unint64_t)task | *((void *)v4 + 4))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) == 0 || self->_bytesSent != *((void *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_18:
    BOOL v6 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 4) == 0 || self->_totalBytesSent != *((void *)v4 + 3)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 40) & 4) != 0)
  {
    goto LABEL_18;
  }
  BOOL v6 = (*((unsigned char *)v4 + 40) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 40) & 2) == 0 || self->_totalBytesExpectedToSend != *((void *)v4 + 2)) {
      goto LABEL_18;
    }
    BOOL v6 = 1;
  }
LABEL_19:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  char v7 = (void *)v5[4];
  v5[4] = v6;

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    v5[3] = self->_totalBytesSent;
    *((unsigned char *)v5 + 40) |= 4u;
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      return v5;
    }
    goto LABEL_4;
  }
  v5[1] = self->_bytesSent;
  *((unsigned char *)v5 + 40) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if ((has & 2) != 0)
  {
LABEL_4:
    v5[2] = self->_totalBytesExpectedToSend;
    *((unsigned char *)v5 + 40) |= 2u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_task)
  {
    id v6 = v4;
    [v4 setTask:];
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_bytesSent;
    *((unsigned char *)v4 + 40) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  *((void *)v4 + 3) = self->_totalBytesSent;
  *((unsigned char *)v4 + 40) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    *((void *)v4 + 2) = self->_totalBytesExpectedToSend;
    *((unsigned char *)v4 + 40) |= 2u;
  }
LABEL_7:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_task)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
LABEL_7:
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
        v13 = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, v13);
        if PBReaderPlaceMark() && (sub_10005AB80((uint64_t)v13, (uint64_t)a3))
        {
          PBReaderRecallMark();

          continue;
        }

        LOBYTE(v14) = 0;
        return v14;
      case 2u:
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
            goto LABEL_45;
          }
          v15 += 7;
          BOOL v10 = v16++ >= 9;
          if (v10)
          {
            uint64_t v17 = 0;
            goto LABEL_47;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_45:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v17 = 0;
        }
LABEL_47:
        uint64_t v28 = 8;
        goto LABEL_56;
      case 3u:
        char v20 = 0;
        unsigned int v21 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)&self->_has |= 4u;
        while (2)
        {
          unint64_t v22 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v22 == -1 || v22 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v23 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v22);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v22 + 1;
            v17 |= (unint64_t)(v23 & 0x7F) << v20;
            if (v23 < 0)
            {
              v20 += 7;
              BOOL v10 = v21++ >= 9;
              if (v10)
              {
                uint64_t v17 = 0;
                goto LABEL_51;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v17 = 0;
        }
LABEL_51:
        uint64_t v28 = 24;
        goto LABEL_56;
      case 4u:
        char v24 = 0;
        unsigned int v25 = 0;
        uint64_t v17 = 0;
        *(unsigned char *)&self->_has |= 2u;
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
      unint64_t v26 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v26 == -1 || v26 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v27 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v26);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v26 + 1;
      v17 |= (unint64_t)(v27 & 0x7F) << v24;
      if ((v27 & 0x80) == 0) {
        goto LABEL_53;
      }
      v24 += 7;
      BOOL v10 = v25++ >= 9;
      if (v10)
      {
        uint64_t v17 = 0;
        goto LABEL_55;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_53:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v17 = 0;
    }
LABEL_55:
    uint64_t v28 = 16;
LABEL_56:
    *(void *)&self->PBCodable_opaque[v28] = v17;
  }
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
  char has = (char)self->_has;
  if (has)
  {
    char v9 = +[NSNumber numberWithUnsignedLongLong:self->_bytesSent];
    [v3 setObject:v9 forKey:@"bytesSent"];

    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_5:
      if ((has & 2) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_5;
  }
  BOOL v10 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesSent];
  [v3 setObject:v10 forKey:@"totalBytesSent"];

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_6:
    unint64_t v7 = +[NSNumber numberWithUnsignedLongLong:self->_totalBytesExpectedToSend];
    [v3 setObject:v7 forKey:@"totalBytesExpectedToSend"];
  }
LABEL_7:

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyDidSendBodyData;
  unint64_t v3 = [(PDURLSessionProxyDidSendBodyData *)&v7 description];
  id v4 = [(PDURLSessionProxyDidSendBodyData *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasTotalBytesExpectedToSend
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTotalBytesExpectedToSend:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTotalBytesExpectedToSend:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_totalBytesExpectedToSend = a3;
}

- (BOOL)hasTotalBytesSent
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasTotalBytesSent:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setTotalBytesSent:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_totalBytesSent = a3;
}

- (BOOL)hasBytesSent
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasBytesSent:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setBytesSent:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_bytesSent = a3;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end
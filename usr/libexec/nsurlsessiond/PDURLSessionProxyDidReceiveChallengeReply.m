@interface PDURLSessionProxyDidReceiveChallengeReply
- (BOOL)hasCredential;
- (BOOL)hasDisposition;
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDURLSessionProxyCredential)credential;
- (PDURLSessionProxyTaskMessage)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)dispositionAsString:(int)a3;
- (int)StringAsDisposition:(id)a3;
- (int)disposition;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCredential:(id)a3;
- (void)setDisposition:(int)a3;
- (void)setHasDisposition:(BOOL)a3;
- (void)setTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyDidReceiveChallengeReply

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_credential, 0);
}

- (void)setCredential:(id)a3
{
}

- (PDURLSessionProxyCredential)credential
{
  return self->_credential;
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
  uint64_t v6 = *((void *)v4 + 3);
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
    -[PDURLSessionProxyDidReceiveChallengeReply setTask:](self, "setTask:");
  }
  id v4 = v9;
LABEL_7:
  if (*((unsigned char *)v4 + 32))
  {
    self->_disposition = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  credential = self->_credential;
  uint64_t v8 = *((void *)v4 + 1);
  if (credential)
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[PDURLSessionProxyCredential mergeFrom:](credential, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_15;
    }
    -[PDURLSessionProxyDidReceiveChallengeReply setCredential:](self, "setCredential:");
  }
  id v4 = v9;
LABEL_15:
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_disposition;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3 ^ [(PDURLSessionProxyCredential *)self->_credential hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  task = self->_task;
  if ((unint64_t)task | *((void *)v4 + 3))
  {
    if (!-[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")) {
      goto LABEL_11;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_disposition != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    unsigned __int8 v7 = 0;
    goto LABEL_12;
  }
  credential = self->_credential;
  if ((unint64_t)credential | *((void *)v4 + 1)) {
    unsigned __int8 v7 = -[PDURLSessionProxyCredential isEqual:](credential, "isEqual:");
  }
  else {
    unsigned __int8 v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  unsigned __int8 v7 = (void *)v5[3];
  v5[3] = v6;

  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 4) = self->_disposition;
    *((unsigned char *)v5 + 32) |= 1u;
  }
  id v8 = [(PDURLSessionProxyCredential *)self->_credential copyWithZone:a3];
  id v9 = (void *)v5[1];
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
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v4 + 4) = self->_disposition;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  if (self->_credential)
  {
    [v5 setCredential:];
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
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_credential)
  {
    PBDataWriterWriteSubmessage();
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
      v14 = objc_alloc_init(PDURLSessionProxyCredential);
      objc_storeStrong((id *)&self->_credential, v14);
      if (!PBReaderPlaceMark() || (sub_10004C878((uint64_t)v14, (uint64_t)a3) & 1) == 0)
      {
LABEL_41:

        LOBYTE(v20) = 0;
        return v20;
      }
    }
    else
    {
      if (v13 == 2)
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
            LODWORD(v17) = 0;
            goto LABEL_38;
          }
        }
        *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_36:
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v17) = 0;
        }
LABEL_38:
        self->_disposition = v17;
        continue;
      }
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
  if (*(unsigned char *)&self->_has)
  {
    uint64_t disposition = self->_disposition;
    if (disposition >= 4)
    {
      unint64_t v7 = +[NSString stringWithFormat:@"(unknown: %i)", self->_disposition];
    }
    else
    {
      unint64_t v7 = *(&off_1000B4F08 + disposition);
    }
    [v3 setObject:v7 forKey:@"disposition"];
  }
  credential = self->_credential;
  if (credential)
  {
    char v9 = [(PDURLSessionProxyCredential *)credential dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"credential"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyDidReceiveChallengeReply;
  unint64_t v3 = [(PDURLSessionProxyDidReceiveChallengeReply *)&v7 description];
  id v4 = [(PDURLSessionProxyDidReceiveChallengeReply *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasCredential
{
  return self->_credential != 0;
}

- (int)StringAsDisposition:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UseCredential"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"PerformDefaultHandling"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CancelAuthenticationChallenge"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RejectProtectionSpace"])
  {
    int v4 = 3;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)dispositionAsString:(int)a3
{
  if (a3 >= 4)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = *(&off_1000B4F08 + a3);
  }

  return v3;
}

- (BOOL)hasDisposition
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDisposition:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDisposition:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t disposition = a3;
}

- (int)disposition
{
  if (*(unsigned char *)&self->_has) {
    return self->_disposition;
  }
  else {
    return 1;
  }
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end
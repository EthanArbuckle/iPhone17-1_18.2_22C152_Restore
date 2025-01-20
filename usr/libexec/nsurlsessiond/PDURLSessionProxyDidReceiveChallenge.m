@interface PDURLSessionProxyDidReceiveChallenge
- (BOOL)hasChallenge;
- (BOOL)hasTask;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDURLSessionProxyAuthChallenge)challenge;
- (PDURLSessionProxyTaskMessage)task;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setChallenge:(id)a3;
- (void)setTask:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyDidReceiveChallenge

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_task, 0);

  objc_storeStrong((id *)&self->_challenge, 0);
}

- (void)setChallenge:(id)a3
{
}

- (PDURLSessionProxyAuthChallenge)challenge
{
  return self->_challenge;
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
    -[PDURLSessionProxyDidReceiveChallenge setTask:](self, "setTask:");
  }
  v4 = v9;
LABEL_7:
  challenge = self->_challenge;
  uint64_t v8 = v4[1];
  if (challenge)
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDURLSessionProxyAuthChallenge mergeFrom:](challenge, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_13;
    }
    -[PDURLSessionProxyDidReceiveChallenge setChallenge:](self, "setChallenge:");
  }
  v4 = v9;
LABEL_13:
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)self->_task hash];
  return [(PDURLSessionProxyAuthChallenge *)self->_challenge hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((task = self->_task, !((unint64_t)task | v4[2]))
     || -[PDURLSessionProxyTaskMessage isEqual:](task, "isEqual:")))
  {
    challenge = self->_challenge;
    if ((unint64_t)challenge | v4[1]) {
      unsigned __int8 v7 = -[PDURLSessionProxyAuthChallenge isEqual:](challenge, "isEqual:");
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
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  id v6 = [(PDURLSessionProxyTaskMessage *)self->_task copyWithZone:a3];
  unsigned __int8 v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(PDURLSessionProxyAuthChallenge *)self->_challenge copyWithZone:a3];
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
  if (self->_challenge)
  {
    [v5 setChallenge:];
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
  if (self->_challenge)
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
      if ((v7 >> 3) == 2) {
        break;
      }
      if ((v7 >> 3) == 1)
      {
        v13 = objc_alloc_init(PDURLSessionProxyTaskMessage);
        objc_storeStrong((id *)&self->_task, v13);
        if (!PBReaderPlaceMark() || (sub_10005AB80((uint64_t)v13, (uint64_t)a3) & 1) == 0) {
          goto LABEL_28;
        }
LABEL_24:
        PBReaderRecallMark();

        goto LABEL_26;
      }
      if ((PBReaderSkipValueWithTag() & 1) == 0) {
        return 0;
      }
LABEL_26:
      if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                + OBJC_IVAR___PBDataReader__length))
        return *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
    }
    v13 = objc_alloc_init(PDURLSessionProxyAuthChallenge);
    objc_storeStrong((id *)&self->_challenge, v13);
    if (!PBReaderPlaceMark() || (sub_100066158((uint64_t)v13, (uint64_t)a3) & 1) == 0)
    {
LABEL_28:

      return 0;
    }
    goto LABEL_24;
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
  challenge = self->_challenge;
  if (challenge)
  {
    unint64_t v7 = [(PDURLSessionProxyAuthChallenge *)challenge dictionaryRepresentation];
    [v3 setObject:v7 forKey:@"challenge"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyDidReceiveChallenge;
  unint64_t v3 = [(PDURLSessionProxyDidReceiveChallenge *)&v7 description];
  id v4 = [(PDURLSessionProxyDidReceiveChallenge *)self dictionaryRepresentation];
  char v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasChallenge
{
  return self->_challenge != 0;
}

- (BOOL)hasTask
{
  return self->_task != 0;
}

@end
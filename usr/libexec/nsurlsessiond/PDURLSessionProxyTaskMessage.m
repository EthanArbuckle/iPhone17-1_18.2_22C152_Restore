@interface PDURLSessionProxyTaskMessage
- (BOOL)hasSession;
- (BOOL)hasTaskIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (PDURLSessionProxySessionMessage)session;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)taskIdentifier;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTaskIdentifier:(BOOL)a3;
- (void)setSession:(id)a3;
- (void)setTaskIdentifier:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation PDURLSessionProxyTaskMessage

- (void).cxx_destruct
{
}

- (unint64_t)taskIdentifier
{
  return self->_taskIdentifier;
}

- (void)setSession:(id)a3
{
}

- (PDURLSessionProxySessionMessage)session
{
  return self->_session;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  session = self->_session;
  uint64_t v6 = v4[2];
  if (session)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[PDURLSessionProxySessionMessage mergeFrom:](session, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    -[PDURLSessionProxyTaskMessage setSession:](self, "setSession:");
  }
  v4 = v7;
LABEL_7:
  if (v4[3])
  {
    self->_taskIdentifier = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(PDURLSessionProxySessionMessage *)self->_session hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_taskIdentifier;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_8;
  }
  session = self->_session;
  if ((unint64_t)session | *((void *)v4 + 2))
  {
    if (!-[PDURLSessionProxySessionMessage isEqual:](session, "isEqual:")) {
      goto LABEL_8;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 24) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) != 0 && self->_taskIdentifier == *((void *)v4 + 1))
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
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(PDURLSessionProxySessionMessage *)self->_session copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_taskIdentifier;
    *((unsigned char *)v5 + 24) |= 1u;
  }
  return v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_session)
  {
    id v5 = v4;
    [v4 setSession:];
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_taskIdentifier;
    *((unsigned char *)v4 + 24) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_session)
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
  return sub_10005AB80((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = +[NSMutableDictionary dictionary];
  session = self->_session;
  if (session)
  {
    id v5 = [(PDURLSessionProxySessionMessage *)session dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"session"];
  }
  if (*(unsigned char *)&self->_has)
  {
    id v6 = +[NSNumber numberWithUnsignedLongLong:self->_taskIdentifier];
    [v3 setObject:v6 forKey:@"taskIdentifier"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)PDURLSessionProxyTaskMessage;
  unint64_t v3 = [(PDURLSessionProxyTaskMessage *)&v7 description];
  id v4 = [(PDURLSessionProxyTaskMessage *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (BOOL)hasTaskIdentifier
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTaskIdentifier:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTaskIdentifier:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_taskIdentifier = a3;
}

- (BOOL)hasSession
{
  return self->_session != 0;
}

@end
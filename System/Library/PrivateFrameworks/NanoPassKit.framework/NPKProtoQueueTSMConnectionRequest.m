@interface NPKProtoQueueTSMConnectionRequest
- (BOOL)hasPushTopic;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)pushTopic;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPushTopic:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoQueueTSMConnectionRequest

- (BOOL)hasPushTopic
{
  return self->_pushTopic != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoQueueTSMConnectionRequest;
  v4 = [(NPKProtoQueueTSMConnectionRequest *)&v8 description];
  v5 = [(NPKProtoQueueTSMConnectionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  pushTopic = self->_pushTopic;
  if (pushTopic) {
    [v3 setObject:pushTopic forKey:@"pushTopic"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoQueueTSMConnectionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_pushTopic) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  pushTopic = self->_pushTopic;
  if (pushTopic) {
    [a3 setPushTopic:pushTopic];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_pushTopic copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    pushTopic = self->_pushTopic;
    if ((unint64_t)pushTopic | v4[1]) {
      char v6 = -[NSString isEqual:](pushTopic, "isEqual:");
    }
    else {
      char v6 = 1;
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_pushTopic hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoQueueTSMConnectionRequest setPushTopic:](self, "setPushTopic:");
  }
}

- (NSString)pushTopic
{
  return self->_pushTopic;
}

- (void)setPushTopic:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
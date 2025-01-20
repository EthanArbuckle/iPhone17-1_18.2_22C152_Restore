@interface NTPBNetworkEventGroup
- (BOOL)hasRespondingInstance;
- (BOOL)hasVia;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)respondingInstance;
- (NSString)via;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setRespondingInstance:(id)a3;
- (void)setVia:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBNetworkEventGroup

- (void)dealloc
{
  [(NTPBNetworkEventGroup *)self setVia:0];
  [(NTPBNetworkEventGroup *)self setRespondingInstance:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkEventGroup;
  [(NTPBNetworkEventGroup *)&v3 dealloc];
}

- (BOOL)hasVia
{
  return self->_via != 0;
}

- (BOOL)hasRespondingInstance
{
  return self->_respondingInstance != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBNetworkEventGroup;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBNetworkEventGroup description](&v3, sel_description), -[NTPBNetworkEventGroup dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  via = self->_via;
  if (via) {
    [v3 setObject:via forKey:@"via"];
  }
  respondingInstance = self->_respondingInstance;
  if (respondingInstance) {
    [v4 setObject:respondingInstance forKey:@"responding_instance"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBNetworkEventGroupReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_via) {
    PBDataWriterWriteStringField();
  }
  if (self->_respondingInstance)
  {
    PBDataWriterWriteStringField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[2] = (id)[(NSString *)self->_via copyWithZone:a3];
  v5[1] = (id)[(NSString *)self->_respondingInstance copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    via = self->_via;
    if (!((unint64_t)via | *((void *)a3 + 2)) || (int v5 = -[NSString isEqual:](via, "isEqual:")) != 0)
    {
      respondingInstance = self->_respondingInstance;
      if ((unint64_t)respondingInstance | *((void *)a3 + 1))
      {
        LOBYTE(v5) = -[NSString isEqual:](respondingInstance, "isEqual:");
      }
      else
      {
        LOBYTE(v5) = 1;
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_via hash];
  return [(NSString *)self->_respondingInstance hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 2)) {
    -[NTPBNetworkEventGroup setVia:](self, "setVia:");
  }
  if (*((void *)a3 + 1))
  {
    -[NTPBNetworkEventGroup setRespondingInstance:](self, "setRespondingInstance:");
  }
}

- (NSString)via
{
  return self->_via;
}

- (void)setVia:(id)a3
{
}

- (NSString)respondingInstance
{
  return self->_respondingInstance;
}

- (void)setRespondingInstance:(id)a3
{
}

@end
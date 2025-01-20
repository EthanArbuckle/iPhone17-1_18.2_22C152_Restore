@interface ABSPBDeleteWrapper
- (BOOL)hasGuid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)guid;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGuid:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ABSPBDeleteWrapper

- (BOOL)hasGuid
{
  return self->_guid != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)ABSPBDeleteWrapper;
  v3 = [(ABSPBDeleteWrapper *)&v7 description];
  v4 = [(ABSPBDeleteWrapper *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  guid = self->_guid;
  if (guid) {
    [v3 setObject:guid forKey:@"guid"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ABSPBDeleteWrapperReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_guid) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  guid = self->_guid;
  if (guid) {
    [a3 setGuid:guid];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  id v6 = [(NSString *)self->_guid copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    guid = self->_guid;
    if ((unint64_t)guid | v4[1]) {
      unsigned __int8 v6 = -[NSString isEqual:](guid, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(NSString *)self->_guid hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[ABSPBDeleteWrapper setGuid:](self, "setGuid:");
  }
}

- (NSString)guid
{
  return self->_guid;
}

- (void)setGuid:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
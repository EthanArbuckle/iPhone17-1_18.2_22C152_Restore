@interface _MRCreateHostedEndpointResponseProtobuf
- (BOOL)hasGroupUID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)groupUID;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setGroupUID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRCreateHostedEndpointResponseProtobuf

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    groupUID = self->_groupUID;
    if ((unint64_t)groupUID | v4[1]) {
      char v6 = -[NSString isEqual:](groupUID, "isEqual:");
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

- (BOOL)hasGroupUID
{
  return self->_groupUID != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRCreateHostedEndpointResponseProtobuf;
  v4 = [(_MRCreateHostedEndpointResponseProtobuf *)&v8 description];
  v5 = [(_MRCreateHostedEndpointResponseProtobuf *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  groupUID = self->_groupUID;
  if (groupUID) {
    [v3 setObject:groupUID forKey:@"groupUID"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRCreateHostedEndpointResponseProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_groupUID) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  groupUID = self->_groupUID;
  if (groupUID) {
    [a3 setGroupUID:groupUID];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_groupUID copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (unint64_t)hash
{
  return [(NSString *)self->_groupUID hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRCreateHostedEndpointResponseProtobuf setGroupUID:](self, "setGroupUID:");
  }
}

- (NSString)groupUID
{
  return self->_groupUID;
}

- (void)setGroupUID:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
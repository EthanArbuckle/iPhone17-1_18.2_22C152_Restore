@interface _MRGroupSessionIdentityShareMessageProtobuf
- (BOOL)hasIdentity;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRUserIdentityProtobuf)identity;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentity:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionIdentityShareMessageProtobuf

- (BOOL)hasIdentity
{
  return self->_identity != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionIdentityShareMessageProtobuf;
  v4 = [(_MRGroupSessionIdentityShareMessageProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionIdentityShareMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  identity = self->_identity;
  if (identity)
  {
    v5 = [(_MRUserIdentityProtobuf *)identity dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"identity"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionIdentityShareMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_identity) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  identity = self->_identity;
  if (identity) {
    [a3 setIdentity:identity];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRUserIdentityProtobuf *)self->_identity copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    identity = self->_identity;
    if ((unint64_t)identity | v4[1]) {
      char v6 = -[_MRUserIdentityProtobuf isEqual:](identity, "isEqual:");
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
  return [(_MRUserIdentityProtobuf *)self->_identity hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  identity = self->_identity;
  uint64_t v6 = v4[1];
  if (identity)
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    identity = (_MRUserIdentityProtobuf *)-[_MRUserIdentityProtobuf mergeFrom:](identity, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    v7 = v4;
    identity = (_MRUserIdentityProtobuf *)-[_MRGroupSessionIdentityShareMessageProtobuf setIdentity:](self, "setIdentity:");
  }
  v4 = v7;
LABEL_7:

  MEMORY[0x1F41817F8](identity, v4);
}

- (_MRUserIdentityProtobuf)identity
{
  return self->_identity;
}

- (void)setIdentity:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
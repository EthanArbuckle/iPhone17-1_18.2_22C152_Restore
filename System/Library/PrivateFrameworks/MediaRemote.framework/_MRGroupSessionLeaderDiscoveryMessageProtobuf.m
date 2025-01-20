@interface _MRGroupSessionLeaderDiscoveryMessageProtobuf
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)signature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionLeaderDiscoveryMessageProtobuf

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionLeaderDiscoveryMessageProtobuf;
  v4 = [(_MRGroupSessionLeaderDiscoveryMessageProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionLeaderDiscoveryMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  signature = self->_signature;
  if (signature) {
    [v3 setObject:signature forKey:@"signature"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionLeaderDiscoveryMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_signature) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  signature = self->_signature;
  if (signature) {
    [a3 setSignature:signature];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_signature copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    signature = self->_signature;
    if ((unint64_t)signature | v4[1]) {
      char v6 = -[NSData isEqual:](signature, "isEqual:");
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
  return [(NSData *)self->_signature hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRGroupSessionLeaderDiscoveryMessageProtobuf setSignature:](self, "setSignature:");
  }
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
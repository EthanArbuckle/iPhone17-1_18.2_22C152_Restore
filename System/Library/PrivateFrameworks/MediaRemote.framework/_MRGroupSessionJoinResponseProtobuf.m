@interface _MRGroupSessionJoinResponseProtobuf
- (BOOL)hasJoinURL;
- (BOOL)hasPublicSigningKeyData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)publicSigningKeyData;
- (NSString)joinURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setJoinURL:(id)a3;
- (void)setPublicSigningKeyData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRGroupSessionJoinResponseProtobuf

- (BOOL)hasPublicSigningKeyData
{
  return self->_publicSigningKeyData != 0;
}

- (BOOL)hasJoinURL
{
  return self->_joinURL != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRGroupSessionJoinResponseProtobuf;
  v4 = [(_MRGroupSessionJoinResponseProtobuf *)&v8 description];
  v5 = [(_MRGroupSessionJoinResponseProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  publicSigningKeyData = self->_publicSigningKeyData;
  if (publicSigningKeyData) {
    [v3 setObject:publicSigningKeyData forKey:@"publicSigningKeyData"];
  }
  joinURL = self->_joinURL;
  if (joinURL) {
    [v4 setObject:joinURL forKey:@"joinURL"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRGroupSessionJoinResponseProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publicSigningKeyData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_joinURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_publicSigningKeyData)
  {
    objc_msgSend(v4, "setPublicSigningKeyData:");
    id v4 = v5;
  }
  if (self->_joinURL)
  {
    objc_msgSend(v5, "setJoinURL:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_publicSigningKeyData copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_joinURL copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((publicSigningKeyData = self->_publicSigningKeyData, !((unint64_t)publicSigningKeyData | v4[2]))
     || -[NSData isEqual:](publicSigningKeyData, "isEqual:")))
  {
    joinURL = self->_joinURL;
    if ((unint64_t)joinURL | v4[1]) {
      char v7 = -[NSString isEqual:](joinURL, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_publicSigningKeyData hash];
  return [(NSString *)self->_joinURL hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[2])
  {
    -[_MRGroupSessionJoinResponseProtobuf setPublicSigningKeyData:](self, "setPublicSigningKeyData:");
    id v4 = v5;
  }
  if (v4[1])
  {
    -[_MRGroupSessionJoinResponseProtobuf setJoinURL:](self, "setJoinURL:");
    id v4 = v5;
  }
}

- (NSData)publicSigningKeyData
{
  return self->_publicSigningKeyData;
}

- (void)setPublicSigningKeyData:(id)a3
{
}

- (NSString)joinURL
{
  return self->_joinURL;
}

- (void)setJoinURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_publicSigningKeyData, 0);

  objc_storeStrong((id *)&self->_joinURL, 0);
}

@end
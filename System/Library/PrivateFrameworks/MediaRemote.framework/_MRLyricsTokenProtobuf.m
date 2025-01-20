@interface _MRLyricsTokenProtobuf
- (BOOL)hasIdentifier;
- (BOOL)hasUserData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)userData;
- (NSString)identifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setUserData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRLyricsTokenProtobuf

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasUserData
{
  return self->_userData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRLyricsTokenProtobuf;
  v4 = [(_MRLyricsTokenProtobuf *)&v8 description];
  v5 = [(_MRLyricsTokenProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  userData = self->_userData;
  if (userData) {
    [v4 setObject:userData forKey:@"userData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRLyricsTokenProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_userData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_identifier)
  {
    objc_msgSend(v4, "setIdentifier:");
    id v4 = v5;
  }
  if (self->_userData)
  {
    objc_msgSend(v5, "setUserData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_identifier copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_userData copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((identifier = self->_identifier, !((unint64_t)identifier | v4[1]))
     || -[NSString isEqual:](identifier, "isEqual:")))
  {
    userData = self->_userData;
    if ((unint64_t)userData | v4[2]) {
      char v7 = -[NSData isEqual:](userData, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  return [(NSData *)self->_userData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4[1])
  {
    -[_MRLyricsTokenProtobuf setIdentifier:](self, "setIdentifier:");
    id v4 = v5;
  }
  if (v4[2])
  {
    -[_MRLyricsTokenProtobuf setUserData:](self, "setUserData:");
    id v4 = v5;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSData)userData
{
  return self->_userData;
}

- (void)setUserData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userData, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
@interface _MRRemoteArtworkProtobuf
- (BOOL)hasArtworkURLString;
- (BOOL)hasArtworkURLTemplateData;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)artworkURLTemplateData;
- (NSString)artworkURLString;
- (NSString)type;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setArtworkURLString:(id)a3;
- (void)setArtworkURLTemplateData:(id)a3;
- (void)setType:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRRemoteArtworkProtobuf

- (BOOL)hasType
{
  return self->_type != 0;
}

- (BOOL)hasArtworkURLString
{
  return self->_artworkURLString != 0;
}

- (BOOL)hasArtworkURLTemplateData
{
  return self->_artworkURLTemplateData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRRemoteArtworkProtobuf;
  v4 = [(_MRRemoteArtworkProtobuf *)&v8 description];
  v5 = [(_MRRemoteArtworkProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  type = self->_type;
  if (type) {
    [v3 setObject:type forKey:@"type"];
  }
  artworkURLString = self->_artworkURLString;
  if (artworkURLString) {
    [v4 setObject:artworkURLString forKey:@"artworkURLString"];
  }
  artworkURLTemplateData = self->_artworkURLTemplateData;
  if (artworkURLTemplateData) {
    [v4 setObject:artworkURLTemplateData forKey:@"artworkURLTemplateData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRRemoteArtworkProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_type)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_artworkURLString)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_artworkURLTemplateData)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_type)
  {
    objc_msgSend(v4, "setType:");
    id v4 = v5;
  }
  if (self->_artworkURLString)
  {
    objc_msgSend(v5, "setArtworkURLString:");
    id v4 = v5;
  }
  if (self->_artworkURLTemplateData)
  {
    objc_msgSend(v5, "setArtworkURLTemplateData:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_type copyWithZone:a3];
  v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_artworkURLString copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  uint64_t v10 = [(NSData *)self->_artworkURLTemplateData copyWithZone:a3];
  v11 = (void *)v5[2];
  v5[2] = v10;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((type = self->_type, !((unint64_t)type | v4[3])) || -[NSString isEqual:](type, "isEqual:"))
    && ((artworkURLString = self->_artworkURLString, !((unint64_t)artworkURLString | v4[1]))
     || -[NSString isEqual:](artworkURLString, "isEqual:")))
  {
    artworkURLTemplateData = self->_artworkURLTemplateData;
    if ((unint64_t)artworkURLTemplateData | v4[2]) {
      char v8 = -[NSData isEqual:](artworkURLTemplateData, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_type hash];
  NSUInteger v4 = [(NSString *)self->_artworkURLString hash] ^ v3;
  return v4 ^ [(NSData *)self->_artworkURLTemplateData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  if (v4[3]) {
    -[_MRRemoteArtworkProtobuf setType:](self, "setType:");
  }
  if (v4[1]) {
    -[_MRRemoteArtworkProtobuf setArtworkURLString:](self, "setArtworkURLString:");
  }
  if (v4[2]) {
    -[_MRRemoteArtworkProtobuf setArtworkURLTemplateData:](self, "setArtworkURLTemplateData:");
  }
}

- (NSString)type
{
  return self->_type;
}

- (void)setType:(id)a3
{
}

- (NSString)artworkURLString
{
  return self->_artworkURLString;
}

- (void)setArtworkURLString:(id)a3
{
}

- (NSData)artworkURLTemplateData
{
  return self->_artworkURLTemplateData;
}

- (void)setArtworkURLTemplateData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_type, 0);
  objc_storeStrong((id *)&self->_artworkURLTemplateData, 0);

  objc_storeStrong((id *)&self->_artworkURLString, 0);
}

@end
@interface _MRSetArtworkMessageProtobuf
- (BOOL)hasJpegData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jpegData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setJpegData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSetArtworkMessageProtobuf

- (BOOL)hasJpegData
{
  return self->_jpegData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSetArtworkMessageProtobuf;
  v4 = [(_MRSetArtworkMessageProtobuf *)&v8 description];
  v5 = [(_MRSetArtworkMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  jpegData = self->_jpegData;
  if (jpegData) {
    [v3 setObject:jpegData forKey:@"jpegData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSetArtworkMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_jpegData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  jpegData = self->_jpegData;
  if (jpegData) {
    [a3 setJpegData:jpegData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_jpegData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    jpegData = self->_jpegData;
    if ((unint64_t)jpegData | v4[1]) {
      char v6 = -[NSData isEqual:](jpegData, "isEqual:");
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
  return [(NSData *)self->_jpegData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRSetArtworkMessageProtobuf setJpegData:](self, "setJpegData:");
  }
}

- (NSData)jpegData
{
  return self->_jpegData;
}

- (void)setJpegData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
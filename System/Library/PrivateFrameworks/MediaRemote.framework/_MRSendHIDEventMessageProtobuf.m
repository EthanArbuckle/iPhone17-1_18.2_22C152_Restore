@interface _MRSendHIDEventMessageProtobuf
- (BOOL)hasHidEventData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)hidEventData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHidEventData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendHIDEventMessageProtobuf

- (BOOL)hasHidEventData
{
  return self->_hidEventData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendHIDEventMessageProtobuf;
  v4 = [(_MRSendHIDEventMessageProtobuf *)&v8 description];
  v5 = [(_MRSendHIDEventMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  hidEventData = self->_hidEventData;
  if (hidEventData) {
    [v3 setObject:hidEventData forKey:@"hidEventData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendHIDEventMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_hidEventData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  hidEventData = self->_hidEventData;
  if (hidEventData) {
    [a3 setHidEventData:hidEventData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_hidEventData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    hidEventData = self->_hidEventData;
    if ((unint64_t)hidEventData | v4[1]) {
      char v6 = -[NSData isEqual:](hidEventData, "isEqual:");
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
  return [(NSData *)self->_hidEventData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[_MRSendHIDEventMessageProtobuf setHidEventData:](self, "setHidEventData:");
  }
}

- (NSData)hidEventData
{
  return self->_hidEventData;
}

- (void)setHidEventData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
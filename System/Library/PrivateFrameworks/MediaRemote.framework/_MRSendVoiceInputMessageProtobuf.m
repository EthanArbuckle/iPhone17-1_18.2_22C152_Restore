@interface _MRSendVoiceInputMessageProtobuf
- (BOOL)hasDataBlock;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (_MRAudioDataBlockProtobuf)dataBlock;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDataBlock:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation _MRSendVoiceInputMessageProtobuf

- (BOOL)hasDataBlock
{
  return self->_dataBlock != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_MRSendVoiceInputMessageProtobuf;
  v4 = [(_MRSendVoiceInputMessageProtobuf *)&v8 description];
  v5 = [(_MRSendVoiceInputMessageProtobuf *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  dataBlock = self->_dataBlock;
  if (dataBlock)
  {
    v5 = [(_MRAudioDataBlockProtobuf *)dataBlock dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"dataBlock"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return _MRSendVoiceInputMessageProtobufReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_dataBlock) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  dataBlock = self->_dataBlock;
  if (dataBlock) {
    [a3 setDataBlock:dataBlock];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(_MRAudioDataBlockProtobuf *)self->_dataBlock copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    dataBlock = self->_dataBlock;
    if ((unint64_t)dataBlock | v4[1]) {
      char v6 = -[_MRAudioDataBlockProtobuf isEqual:](dataBlock, "isEqual:");
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
  return [(_MRAudioDataBlockProtobuf *)self->_dataBlock hash];
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  dataBlock = self->_dataBlock;
  uint64_t v6 = v4[1];
  if (dataBlock)
  {
    if (v6) {
      -[_MRAudioDataBlockProtobuf mergeFrom:](dataBlock, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[_MRSendVoiceInputMessageProtobuf setDataBlock:](self, "setDataBlock:");
  }

  MEMORY[0x1F41817F8]();
}

- (_MRAudioDataBlockProtobuf)dataBlock
{
  return self->_dataBlock;
}

- (void)setDataBlock:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
@interface NPKProtoCarKeyHandleRecipientMessageResponse
- (BOOL)hasResultData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)resultData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setResultData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoCarKeyHandleRecipientMessageResponse

- (BOOL)hasResultData
{
  return self->_resultData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoCarKeyHandleRecipientMessageResponse;
  v4 = [(NPKProtoCarKeyHandleRecipientMessageResponse *)&v8 description];
  v5 = [(NPKProtoCarKeyHandleRecipientMessageResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  resultData = self->_resultData;
  if (resultData) {
    [v3 setObject:resultData forKey:@"resultData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoCarKeyHandleRecipientMessageResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_resultData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  resultData = self->_resultData;
  if (resultData) {
    [a3 setResultData:resultData];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_resultData copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    resultData = self->_resultData;
    if ((unint64_t)resultData | v4[1]) {
      char v6 = -[NSData isEqual:](resultData, "isEqual:");
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
  return [(NSData *)self->_resultData hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NPKProtoCarKeyHandleRecipientMessageResponse setResultData:](self, "setResultData:");
  }
}

- (NSData)resultData
{
  return self->_resultData;
}

- (void)setResultData:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
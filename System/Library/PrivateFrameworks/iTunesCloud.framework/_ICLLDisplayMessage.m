@interface _ICLLDisplayMessage
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation _ICLLDisplayMessage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleMessage, 0);

  objc_storeStrong((id *)&self->_detailMessage, 0);
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_titleMessage hash];
  return [(NSString *)self->_detailMessage hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((titleMessage = self->_titleMessage, !((unint64_t)titleMessage | v4[2]))
     || -[NSString isEqual:](titleMessage, "isEqual:")))
  {
    detailMessage = self->_detailMessage;
    if ((unint64_t)detailMessage | v4[1]) {
      char v7 = -[NSString isEqual:](detailMessage, "isEqual:");
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

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_titleMessage copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  uint64_t v8 = [(NSString *)self->_detailMessage copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_titleMessage)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_detailMessage)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return _ICLLDisplayMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  titleMessage = self->_titleMessage;
  if (titleMessage) {
    [v3 setObject:titleMessage forKey:@"titleMessage"];
  }
  detailMessage = self->_detailMessage;
  if (detailMessage) {
    [v4 setObject:detailMessage forKey:@"detailMessage"];
  }

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)_ICLLDisplayMessage;
  id v4 = [(_ICLLDisplayMessage *)&v8 description];
  id v5 = [(_ICLLDisplayMessage *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end
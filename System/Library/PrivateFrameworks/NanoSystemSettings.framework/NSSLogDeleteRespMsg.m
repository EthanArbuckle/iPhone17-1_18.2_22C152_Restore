@interface NSSLogDeleteRespMsg
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)error;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setError:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NSSLogDeleteRespMsg

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NSSLogDeleteRespMsg;
  v4 = [(NSSLogDeleteRespMsg *)&v8 description];
  v5 = [(NSSLogDeleteRespMsg *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  error = self->_error;
  if (error) {
    [v3 setObject:error forKey:@"error"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NSSLogDeleteRespMsgReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_error) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  error = self->_error;
  if (error) {
    [a3 setError:error];
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_error copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    error = self->_error;
    if ((unint64_t)error | v4[1]) {
      char v6 = -[NSData isEqual:](error, "isEqual:");
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
  return [(NSData *)self->_error hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NSSLogDeleteRespMsg setError:](self, "setError:");
  }
}

- (NSData)error
{
  return self->_error;
}

- (void)setError:(id)a3
{
}

- (void).cxx_destruct
{
}

@end
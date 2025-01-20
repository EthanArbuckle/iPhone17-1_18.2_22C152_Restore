@interface NBPBRestoreResponse
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

@implementation NBPBRestoreResponse

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NBPBRestoreResponse;
  v3 = [(NBPBRestoreResponse *)&v7 description];
  v4 = [(NBPBRestoreResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  error = self->_error;
  if (error) {
    [v3 setObject:error forKey:@"error"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000050A0((uint64_t)self, (uint64_t)a3);
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
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_error copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
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
      unsigned __int8 v6 = -[NSData isEqual:](error, "isEqual:");
    }
    else {
      unsigned __int8 v6 = 1;
    }
  }
  else
  {
    unsigned __int8 v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return (unint64_t)[(NSData *)self->_error hash];
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NBPBRestoreResponse setError:](self, "setError:");
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
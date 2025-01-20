@interface NRPBAddTermsEventResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBAddTermsEventResponse

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBAddTermsEventResponse;
  v3 = [(NRPBAddTermsEventResponse *)&v7 description];
  v4 = [(NRPBAddTermsEventResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  error = self->_error;
  if (error)
  {
    v5 = [(NRPBNSError *)error dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"error"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10009C748((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_error) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NRPBNSError *)self->_error copyWithZone:a3];
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
      unsigned __int8 v6 = -[NRPBNSError isEqual:](error, "isEqual:");
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
  return [(NRPBNSError *)self->_error hash];
}

- (void).cxx_destruct
{
}

@end
@interface NRPBCheckTermsEventResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBCheckTermsEventResponse

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBCheckTermsEventResponse;
  v3 = [(NRPBCheckTermsEventResponse *)&v7 description];
  v4 = [(NRPBCheckTermsEventResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  if (*(unsigned char *)&self->_has)
  {
    v4 = +[NSNumber numberWithBool:self->_acknowledged];
    [v3 setObject:v4 forKey:@"acknowledged"];
  }
  error = self->_error;
  if (error)
  {
    v6 = [(NRPBNSError *)error dictionaryRepresentation];
    [v3 setObject:v6 forKey:@"error"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10008CC4C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v6 = v5;
  if (*(unsigned char *)&self->_has)
  {
    *((unsigned char *)v5 + 16) = self->_acknowledged;
    *((unsigned char *)v5 + 20) |= 1u;
  }
  id v7 = [(NRPBNSError *)self->_error copyWithZone:a3];
  v8 = (void *)v6[1];
  v6[1] = v7;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 20))
    {
      if (self->_acknowledged)
      {
        if (*((unsigned char *)v4 + 16)) {
          goto LABEL_12;
        }
      }
      else if (!*((unsigned char *)v4 + 16))
      {
        goto LABEL_12;
      }
    }
LABEL_6:
    unsigned __int8 v5 = 0;
    goto LABEL_7;
  }
  if (*((unsigned char *)v4 + 20)) {
    goto LABEL_6;
  }
LABEL_12:
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 1)) {
    unsigned __int8 v5 = -[NRPBNSError isEqual:](error, "isEqual:");
  }
  else {
    unsigned __int8 v5 = 1;
  }
LABEL_7:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_acknowledged;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(NRPBNSError *)self->_error hash] ^ v2;
}

- (void).cxx_destruct
{
}

@end
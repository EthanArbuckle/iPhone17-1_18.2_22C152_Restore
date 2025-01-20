@interface NRPBPingResponse
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBPingResponse

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBPingResponse;
  v3 = [(NRPBPingResponse *)&v7 description];
  v4 = [(NRPBPingResponse *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithDouble:self->_responseDate];
  [v3 setObject:v4 forKey:@"responseDate"];

  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000A3ED4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteDoubleField();
  if (self->_payload) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_opt_class() allocWithZone:a3];
  v5[1] = *(void *)&self->_responseDate;
  id v6 = [(NSData *)self->_payload copyWithZone:a3];
  objc_super v7 = (void *)v5[2];
  v5[2] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_responseDate == *((double *)v4 + 1))
  {
    payload = self->_payload;
    if ((unint64_t)payload | v4[2]) {
      unsigned __int8 v6 = -[NSData isEqual:](payload, "isEqual:");
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
  double responseDate = self->_responseDate;
  double v4 = -responseDate;
  if (responseDate >= 0.0) {
    double v4 = self->_responseDate;
  }
  long double v5 = floor(v4 + 0.5);
  double v6 = (v4 - v5) * 1.84467441e19;
  double v7 = fmod(v5, 1.84467441e19);
  unint64_t v8 = 2654435761u * (unint64_t)v7;
  unint64_t v9 = v8 + (unint64_t)v6;
  if (v6 <= 0.0) {
    unint64_t v9 = 2654435761u * (unint64_t)v7;
  }
  unint64_t v10 = v8 - (unint64_t)fabs(v6);
  if (v6 < 0.0) {
    unint64_t v11 = v10;
  }
  else {
    unint64_t v11 = v9;
  }
  return (unint64_t)[(NSData *)self->_payload hash] ^ v11;
}

- (void).cxx_destruct
{
}

@end
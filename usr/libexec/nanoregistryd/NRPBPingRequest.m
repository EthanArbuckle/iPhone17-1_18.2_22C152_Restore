@interface NRPBPingRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBPingRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBPingRequest;
  v3 = [(NRPBPingRequest *)&v7 description];
  v4 = [(NRPBPingRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithInt:self->_responseIDSPriority];
  [v3 setObject:v4 forKey:@"responseIDSPriority"];

  v5 = +[NSNumber numberWithDouble:self->_timeout];
  [v3 setObject:v5 forKey:@"timeout"];

  v6 = +[NSNumber numberWithInt:self->_pingType];
  [v3 setObject:v6 forKey:@"pingType"];

  payload = self->_payload;
  if (payload) {
    [v3 setObject:payload forKey:@"payload"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000EC538((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  PBDataWriterWriteDoubleField();
  PBDataWriterWriteInt32Field();
  if (self->_payload) {
    PBDataWriterWriteDataField();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [[objc_opt_class() allocWithZone:a3] init];
  v5[7] = self->_responseIDSPriority;
  *((void *)v5 + 1) = *(void *)&self->_timeout;
  v5[6] = self->_pingType;
  id v6 = [(NSData *)self->_payload copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_responseIDSPriority == *((_DWORD *)v4 + 7)
    && self->_timeout == *((double *)v4 + 1)
    && self->_pingType == *((_DWORD *)v4 + 6))
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
  uint64_t responseIDSPriority = self->_responseIDSPriority;
  double timeout = self->_timeout;
  double v5 = -timeout;
  if (timeout >= 0.0) {
    double v5 = self->_timeout;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  uint64_t v13 = (2654435761 * responseIDSPriority) ^ (2654435761 * self->_pingType);
  return v12 ^ v13 ^ (unint64_t)[(NSData *)self->_payload hash];
}

- (void).cxx_destruct
{
}

@end
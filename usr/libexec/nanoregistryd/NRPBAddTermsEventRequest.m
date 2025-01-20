@interface NRPBAddTermsEventRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)writeTo:(id)a3;
@end

@implementation NRPBAddTermsEventRequest

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NRPBAddTermsEventRequest;
  v3 = [(NRPBAddTermsEventRequest *)&v7 description];
  v4 = [(NRPBAddTermsEventRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  event = self->_event;
  if (event)
  {
    v5 = [(NRPBTermsEvent *)event dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"event"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B1BC0((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_event) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NRPBTermsEvent *)self->_event copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    event = self->_event;
    if ((unint64_t)event | v4[1]) {
      unsigned __int8 v6 = -[NRPBTermsEvent isEqual:](event, "isEqual:");
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
  return (unint64_t)[(NRPBTermsEvent *)self->_event hash];
}

- (void).cxx_destruct
{
}

@end
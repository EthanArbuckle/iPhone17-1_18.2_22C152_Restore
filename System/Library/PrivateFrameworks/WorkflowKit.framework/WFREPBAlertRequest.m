@interface WFREPBAlertRequest
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)associatedRunRequestIdentifier;
- (WFREPBAlert)alert;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAlert:(id)a3;
- (void)setAssociatedRunRequestIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBAlertRequest

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_associatedRunRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_alert, 0);
}

- (void)setAlert:(id)a3
{
}

- (WFREPBAlert)alert
{
  return self->_alert;
}

- (void)setAssociatedRunRequestIdentifier:(id)a3
{
}

- (NSString)associatedRunRequestIdentifier
{
  return self->_associatedRunRequestIdentifier;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v7 = v4;
  if (v4[2])
  {
    -[WFREPBAlertRequest setAssociatedRunRequestIdentifier:](self, "setAssociatedRunRequestIdentifier:");
    v4 = v7;
  }
  alert = self->_alert;
  uint64_t v6 = v4[1];
  if (alert)
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[WFREPBAlert mergeFrom:](alert, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_9;
    }
    -[WFREPBAlertRequest setAlert:](self, "setAlert:");
  }
  v4 = v7;
LABEL_9:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_associatedRunRequestIdentifier hash];
  return [(WFREPBAlert *)self->_alert hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier,
         !((unint64_t)associatedRunRequestIdentifier | v4[2]))
     || -[NSString isEqual:](associatedRunRequestIdentifier, "isEqual:")))
  {
    alert = self->_alert;
    if ((unint64_t)alert | v4[1]) {
      char v7 = -[WFREPBAlert isEqual:](alert, "isEqual:");
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
  uint64_t v6 = [(NSString *)self->_associatedRunRequestIdentifier copyWithZone:a3];
  char v7 = (void *)v5[2];
  v5[2] = v6;

  id v8 = [(WFREPBAlert *)self->_alert copyWithZone:a3];
  v9 = (void *)v5[1];
  v5[1] = v8;

  return v5;
}

- (void)copyTo:(id)a3
{
  associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
  id v5 = a3;
  [v5 setAssociatedRunRequestIdentifier:associatedRunRequestIdentifier];
  [v5 setAlert:self->_alert];
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_associatedRunRequestIdentifier) {
    __assert_rtn("-[WFREPBAlertRequest writeTo:]", "WFREPBAlertRequest.m", 97, "nil != self->_associatedRunRequestIdentifier");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  if (!self->_alert) {
    __assert_rtn("-[WFREPBAlertRequest writeTo:]", "WFREPBAlertRequest.m", 102, "self->_alert != nil");
  }
  PBDataWriterWriteSubmessage();
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBAlertRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  associatedRunRequestIdentifier = self->_associatedRunRequestIdentifier;
  if (associatedRunRequestIdentifier) {
    [v3 setObject:associatedRunRequestIdentifier forKey:@"associatedRunRequestIdentifier"];
  }
  alert = self->_alert;
  if (alert)
  {
    char v7 = [(WFREPBAlert *)alert dictionaryRepresentation];
    [v4 setObject:v7 forKey:@"alert"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBAlertRequest;
  id v4 = [(WFREPBAlertRequest *)&v8 description];
  id v5 = [(WFREPBAlertRequest *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

@end
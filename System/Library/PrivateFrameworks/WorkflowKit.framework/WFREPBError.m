@interface WFREPBError
- (BOOL)hasLocalizedDescription;
- (BOOL)hasLocalizedFailureReason;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)domain;
- (NSString)localizedDescription;
- (NSString)localizedFailureReason;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)code;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCode:(int64_t)a3;
- (void)setDomain:(id)a3;
- (void)setLocalizedDescription:(id)a3;
- (void)setLocalizedFailureReason:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation WFREPBError

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localizedFailureReason, 0);
  objc_storeStrong((id *)&self->_localizedDescription, 0);
  objc_storeStrong((id *)&self->_domain, 0);
}

- (void)setLocalizedFailureReason:(id)a3
{
}

- (NSString)localizedFailureReason
{
  return self->_localizedFailureReason;
}

- (void)setLocalizedDescription:(id)a3
{
}

- (NSString)localizedDescription
{
  return self->_localizedDescription;
}

- (void)setCode:(int64_t)a3
{
  self->_code = a3;
}

- (int64_t)code
{
  return self->_code;
}

- (void)setDomain:(id)a3
{
}

- (NSString)domain
{
  return self->_domain;
}

- (void)mergeFrom:(id)a3
{
  v4 = (int64_t *)a3;
  if (v4[2]) {
    -[WFREPBError setDomain:](self, "setDomain:");
  }
  self->_code = v4[1];
  if (v4[3]) {
    -[WFREPBError setLocalizedDescription:](self, "setLocalizedDescription:");
  }
  if (v4[4]) {
    -[WFREPBError setLocalizedFailureReason:](self, "setLocalizedFailureReason:");
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_domain hash];
  uint64_t v4 = 2654435761 * self->_code;
  NSUInteger v5 = v3 ^ [(NSString *)self->_localizedDescription hash];
  return v4 ^ v5 ^ [(NSString *)self->_localizedFailureReason hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((domain = self->_domain, !((unint64_t)domain | v4[2]))
     || -[NSString isEqual:](domain, "isEqual:"))
    && self->_code == v4[1]
    && ((localizedDescription = self->_localizedDescription, !((unint64_t)localizedDescription | v4[3]))
     || -[NSString isEqual:](localizedDescription, "isEqual:")))
  {
    localizedFailureReason = self->_localizedFailureReason;
    if ((unint64_t)localizedFailureReason | v4[4]) {
      char v8 = -[NSString isEqual:](localizedFailureReason, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  NSUInteger v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_domain copyWithZone:a3];
  v7 = (void *)v5[2];
  v5[2] = v6;

  v5[1] = self->_code;
  uint64_t v8 = [(NSString *)self->_localizedDescription copyWithZone:a3];
  v9 = (void *)v5[3];
  v5[3] = v8;

  uint64_t v10 = [(NSString *)self->_localizedFailureReason copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  return v5;
}

- (void)copyTo:(id)a3
{
  NSUInteger v5 = a3;
  [v5 setDomain:self->_domain];
  uint64_t v4 = v5;
  v5[1] = self->_code;
  if (self->_localizedDescription)
  {
    objc_msgSend(v5, "setLocalizedDescription:");
    uint64_t v4 = v5;
  }
  if (self->_localizedFailureReason)
  {
    objc_msgSend(v5, "setLocalizedFailureReason:");
    uint64_t v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_domain) {
    __assert_rtn("-[WFREPBError writeTo:]", "WFREPBError.m", 109, "nil != self->_domain");
  }
  id v5 = v4;
  PBDataWriterWriteStringField();
  PBDataWriterWriteInt64Field();
  if (self->_localizedDescription) {
    PBDataWriterWriteStringField();
  }
  if (self->_localizedFailureReason) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return WFREPBErrorReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  domain = self->_domain;
  if (domain) {
    [v3 setObject:domain forKey:@"domain"];
  }
  uint64_t v6 = [NSNumber numberWithLongLong:self->_code];
  [v4 setObject:v6 forKey:@"code"];

  localizedDescription = self->_localizedDescription;
  if (localizedDescription) {
    [v4 setObject:localizedDescription forKey:@"localizedDescription"];
  }
  localizedFailureReason = self->_localizedFailureReason;
  if (localizedFailureReason) {
    [v4 setObject:localizedFailureReason forKey:@"localizedFailureReason"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WFREPBError;
  id v4 = [(WFREPBError *)&v8 description];
  id v5 = [(WFREPBError *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasLocalizedFailureReason
{
  return self->_localizedFailureReason != 0;
}

- (BOOL)hasLocalizedDescription
{
  return self->_localizedDescription != 0;
}

@end
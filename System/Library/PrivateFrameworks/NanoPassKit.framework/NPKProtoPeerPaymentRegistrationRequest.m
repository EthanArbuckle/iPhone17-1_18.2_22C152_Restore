@interface NPKProtoPeerPaymentRegistrationRequest
- (BOOL)forceReRegistration;
- (BOOL)hasForceReRegistration;
- (BOOL)hasServiceURL;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)serviceURL;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setForceReRegistration:(BOOL)a3;
- (void)setHasForceReRegistration:(BOOL)a3;
- (void)setServiceURL:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoPeerPaymentRegistrationRequest

- (BOOL)hasServiceURL
{
  return self->_serviceURL != 0;
}

- (void)setForceReRegistration:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_forceReRegistration = a3;
}

- (void)setHasForceReRegistration:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasForceReRegistration
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoPeerPaymentRegistrationRequest;
  v4 = [(NPKProtoPeerPaymentRegistrationRequest *)&v8 description];
  v5 = [(NPKProtoPeerPaymentRegistrationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  serviceURL = self->_serviceURL;
  if (serviceURL) {
    [v3 setObject:serviceURL forKey:@"serviceURL"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_forceReRegistration];
    [v4 setObject:v6 forKey:@"forceReRegistration"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoPeerPaymentRegistrationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_serviceURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (self->_serviceURL)
  {
    id v5 = v4;
    objc_msgSend(v4, "setServiceURL:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_forceReRegistration;
    v4[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_serviceURL copyWithZone:a3];
  v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 16) = self->_forceReRegistration;
    *(unsigned char *)(v5 + 20) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  serviceURL = self->_serviceURL;
  if ((unint64_t)serviceURL | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](serviceURL, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_forceReRegistration)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_serviceURL hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_forceReRegistration;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (BOOL *)a3;
  if (*((void *)v4 + 1))
  {
    uint64_t v5 = v4;
    -[NPKProtoPeerPaymentRegistrationRequest setServiceURL:](self, "setServiceURL:");
    uint64_t v4 = v5;
  }
  if (v4[20])
  {
    self->_forceReRegistration = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)serviceURL
{
  return self->_serviceURL;
}

- (void)setServiceURL:(id)a3
{
}

- (BOOL)forceReRegistration
{
  return self->_forceReRegistration;
}

- (void).cxx_destruct
{
}

@end
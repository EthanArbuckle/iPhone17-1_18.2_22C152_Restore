@interface NTPBPublisherPaidDescriptionStrings
- (BOOL)hasPaywallDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NTPBPaywallDescription)paywallDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setPaywallDescription:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPublisherPaidDescriptionStrings

- (void)dealloc
{
  [(NTPBPublisherPaidDescriptionStrings *)self setPaywallDescription:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPublisherPaidDescriptionStrings;
  [(NTPBPublisherPaidDescriptionStrings *)&v3 dealloc];
}

- (BOOL)hasPaywallDescription
{
  return self->_paywallDescription != 0;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPublisherPaidDescriptionStrings;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPublisherPaidDescriptionStrings description](&v3, sel_description), -[NTPBPublisherPaidDescriptionStrings dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  paywallDescription = self->_paywallDescription;
  if (paywallDescription) {
    objc_msgSend(v3, "setObject:forKey:", -[NTPBPaywallDescription dictionaryRepresentation](paywallDescription, "dictionaryRepresentation"), @"paywallDescription");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPublisherPaidDescriptionStringsReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_paywallDescription) {
    PBDataWriterWriteSubmessage();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[1] = [(NTPBPaywallDescription *)self->_paywallDescription copyWithZone:a3];
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    paywallDescription = self->_paywallDescription;
    if ((unint64_t)paywallDescription | *((void *)a3 + 1))
    {
      LOBYTE(v5) = -[NTPBPaywallDescription isEqual:](paywallDescription, "isEqual:");
    }
    else
    {
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (unint64_t)hash
{
  return [(NTPBPaywallDescription *)self->_paywallDescription hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v3 = *((void *)a3 + 1);
  if (self->_paywallDescription)
  {
    if (v3) {
      -[NTPBPaywallDescription mergeFrom:](self->_paywallDescription, "mergeFrom:");
    }
  }
  else if (v3)
  {
    -[NTPBPublisherPaidDescriptionStrings setPaywallDescription:](self, "setPaywallDescription:");
  }
}

- (NTPBPaywallDescription)paywallDescription
{
  return self->_paywallDescription;
}

- (void)setPaywallDescription:(id)a3
{
}

@end
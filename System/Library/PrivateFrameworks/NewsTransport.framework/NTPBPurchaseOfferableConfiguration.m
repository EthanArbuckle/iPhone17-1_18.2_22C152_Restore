@interface NTPBPurchaseOfferableConfiguration
- (BOOL)allowsPublisherPadApp;
- (BOOL)allowsPublisherPhoneApp;
- (BOOL)allowsPublisherWebSite;
- (BOOL)hasAllowsPublisherPadApp;
- (BOOL)hasAllowsPublisherPhoneApp;
- (BOOL)hasAllowsPublisherWebSite;
- (BOOL)hasPreferredOffer;
- (BOOL)hasPurchaseId;
- (BOOL)isEqual:(id)a3;
- (BOOL)preferredOffer;
- (BOOL)readFrom:(id)a3;
- (NSString)purchaseId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAllowsPublisherPadApp:(BOOL)a3;
- (void)setAllowsPublisherPhoneApp:(BOOL)a3;
- (void)setAllowsPublisherWebSite:(BOOL)a3;
- (void)setHasAllowsPublisherPadApp:(BOOL)a3;
- (void)setHasAllowsPublisherPhoneApp:(BOOL)a3;
- (void)setHasAllowsPublisherWebSite:(BOOL)a3;
- (void)setHasPreferredOffer:(BOOL)a3;
- (void)setPreferredOffer:(BOOL)a3;
- (void)setPurchaseId:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBPurchaseOfferableConfiguration

- (NSString)purchaseId
{
  return self->_purchaseId;
}

- (BOOL)preferredOffer
{
  return self->_preferredOffer;
}

- (BOOL)allowsPublisherWebSite
{
  return self->_allowsPublisherWebSite;
}

- (BOOL)allowsPublisherPhoneApp
{
  return self->_allowsPublisherPhoneApp;
}

- (BOOL)allowsPublisherPadApp
{
  return self->_allowsPublisherPadApp;
}

- (void)dealloc
{
  [(NTPBPurchaseOfferableConfiguration *)self setPurchaseId:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBPurchaseOfferableConfiguration;
  [(NTPBPurchaseOfferableConfiguration *)&v3 dealloc];
}

- (BOOL)hasPurchaseId
{
  return self->_purchaseId != 0;
}

- (void)setAllowsPublisherPhoneApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_allowsPublisherPhoneApp = a3;
}

- (void)setHasAllowsPublisherPhoneApp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAllowsPublisherPhoneApp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAllowsPublisherPadApp:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_allowsPublisherPadApp = a3;
}

- (void)setHasAllowsPublisherPadApp:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAllowsPublisherPadApp
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAllowsPublisherWebSite:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_allowsPublisherWebSite = a3;
}

- (void)setHasAllowsPublisherWebSite:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAllowsPublisherWebSite
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setPreferredOffer:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_preferredOffer = a3;
}

- (void)setHasPreferredOffer:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasPreferredOffer
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBPurchaseOfferableConfiguration;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBPurchaseOfferableConfiguration description](&v3, sel_description), -[NTPBPurchaseOfferableConfiguration dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  purchaseId = self->_purchaseId;
  if (purchaseId) {
    [v3 setObject:purchaseId forKey:@"purchase_id"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_allowsPublisherPhoneApp), @"allows_publisher_phone_app");
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
LABEL_11:
      objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_allowsPublisherWebSite), @"allows_publisher_web_site");
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return v4;
      }
      goto LABEL_7;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_allowsPublisherPadApp), @"allows_publisher_pad_app");
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_11;
  }
LABEL_6:
  if ((has & 8) != 0) {
LABEL_7:
  }
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithBool:", self->_preferredOffer), @"preferred_offer");
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBPurchaseOfferableConfigurationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_purchaseId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_6;
      }
LABEL_10:
      PBDataWriterWriteBOOLField();
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteBOOLField();
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_10;
  }
LABEL_6:
  if ((has & 8) == 0) {
    return;
  }
LABEL_11:

  PBDataWriterWriteBOOLField();
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 8) = [(NSString *)self->_purchaseId copyWithZone:a3];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 17) = self->_allowsPublisherPhoneApp;
    *(unsigned char *)(v5 + 20) |= 2u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(unsigned char *)(v5 + 18) = self->_allowsPublisherWebSite;
      *(unsigned char *)(v5 + 20) |= 4u;
      if ((*(unsigned char *)&self->_has & 8) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 16) = self->_allowsPublisherPadApp;
  *(unsigned char *)(v5 + 20) |= 1u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 8) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 19) = self->_preferredOffer;
    *(unsigned char *)(v5 + 20) |= 8u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (!v5) {
    return v5;
  }
  purchaseId = self->_purchaseId;
  if ((unint64_t)purchaseId | *((void *)a3 + 1))
  {
    int v5 = -[NSString isEqual:](purchaseId, "isEqual:");
    if (!v5) {
      return v5;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)a3 + 20) & 2) == 0) {
      goto LABEL_30;
    }
    if (self->_allowsPublisherPhoneApp)
    {
      if (!*((unsigned char *)a3 + 17)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)a3 + 17))
    {
      goto LABEL_30;
    }
  }
  else if ((*((unsigned char *)a3 + 20) & 2) != 0)
  {
    goto LABEL_30;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)a3 + 20) & 1) == 0) {
      goto LABEL_30;
    }
    if (self->_allowsPublisherPadApp)
    {
      if (!*((unsigned char *)a3 + 16)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)a3 + 16))
    {
      goto LABEL_30;
    }
  }
  else if (*((unsigned char *)a3 + 20))
  {
    goto LABEL_30;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)a3 + 20) & 4) != 0)
    {
      if (self->_allowsPublisherWebSite)
      {
        if (!*((unsigned char *)a3 + 18)) {
          goto LABEL_30;
        }
        goto LABEL_28;
      }
      if (!*((unsigned char *)a3 + 18)) {
        goto LABEL_28;
      }
    }
LABEL_30:
    LOBYTE(v5) = 0;
    return v5;
  }
  if ((*((unsigned char *)a3 + 20) & 4) != 0) {
    goto LABEL_30;
  }
LABEL_28:
  LOBYTE(v5) = (*((unsigned char *)a3 + 20) & 8) == 0;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)a3 + 20) & 8) == 0) {
      goto LABEL_30;
    }
    if (self->_preferredOffer)
    {
      if (!*((unsigned char *)a3 + 19)) {
        goto LABEL_30;
      }
    }
    else if (*((unsigned char *)a3 + 19))
    {
      goto LABEL_30;
    }
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_purchaseId hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v4 = 2654435761 * self->_allowsPublisherPhoneApp;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_allowsPublisherPadApp;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v6 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v7 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v6 = 2654435761 * self->_allowsPublisherWebSite;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_preferredOffer;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 1)) {
    -[NTPBPurchaseOfferableConfiguration setPurchaseId:](self, "setPurchaseId:");
  }
  char v5 = *((unsigned char *)a3 + 20);
  if ((v5 & 2) != 0)
  {
    self->_allowsPublisherPhoneApp = *((unsigned char *)a3 + 17);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)a3 + 20);
    if ((v5 & 1) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_6;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)a3 + 20) & 1) == 0)
  {
    goto LABEL_5;
  }
  self->_allowsPublisherPadApp = *((unsigned char *)a3 + 16);
  *(unsigned char *)&self->_has |= 1u;
  char v5 = *((unsigned char *)a3 + 20);
  if ((v5 & 4) == 0)
  {
LABEL_6:
    if ((v5 & 8) == 0) {
      return;
    }
    goto LABEL_7;
  }
LABEL_11:
  self->_allowsPublisherWebSite = *((unsigned char *)a3 + 18);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)a3 + 20) & 8) == 0) {
    return;
  }
LABEL_7:
  self->_preferredOffer = *((unsigned char *)a3 + 19);
  *(unsigned char *)&self->_has |= 8u;
}

- (void)setPurchaseId:(id)a3
{
}

@end
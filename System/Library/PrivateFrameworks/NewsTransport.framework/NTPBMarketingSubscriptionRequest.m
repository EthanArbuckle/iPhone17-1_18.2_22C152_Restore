@interface NTPBMarketingSubscriptionRequest
- (BOOL)hasDeviceInfo;
- (BOOL)hasDsid;
- (BOOL)hasSubscriptionAction;
- (BOOL)hasSubscriptionType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)dsid;
- (NTPBDeviceInfo)deviceInfo;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)subscriptionAction;
- (int)subscriptionType;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setDeviceInfo:(id)a3;
- (void)setDsid:(id)a3;
- (void)setHasSubscriptionAction:(BOOL)a3;
- (void)setHasSubscriptionType:(BOOL)a3;
- (void)setSubscriptionAction:(int)a3;
- (void)setSubscriptionType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBMarketingSubscriptionRequest

- (int)subscriptionType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_subscriptionType;
  }
  else {
    return 0;
  }
}

- (void)setSubscriptionType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_subscriptionType = a3;
}

- (void)setHasSubscriptionType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSubscriptionType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)subscriptionAction
{
  if (*(unsigned char *)&self->_has) {
    return self->_subscriptionAction;
  }
  else {
    return 0;
  }
}

- (void)setSubscriptionAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_subscriptionAction = a3;
}

- (void)setHasSubscriptionAction:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSubscriptionAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasDsid
{
  return self->_dsid != 0;
}

- (BOOL)hasDeviceInfo
{
  return self->_deviceInfo != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBMarketingSubscriptionRequest;
  v4 = [(NTPBMarketingSubscriptionRequest *)&v8 description];
  v5 = [(NTPBMarketingSubscriptionRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_subscriptionType];
    [v3 setObject:v5 forKey:@"subscription_type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithInt:self->_subscriptionAction];
    [v3 setObject:v6 forKey:@"subscription_action"];
  }
  dsid = self->_dsid;
  if (dsid) {
    [v3 setObject:dsid forKey:@"dsid"];
  }
  deviceInfo = self->_deviceInfo;
  if (deviceInfo)
  {
    v9 = [(NTPBDeviceInfo *)deviceInfo dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"device_info"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBMarketingSubscriptionRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
  if (self->_dsid)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_deviceInfo)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_subscriptionType;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 24) = self->_subscriptionAction;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_dsid copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  id v10 = [(NTPBDeviceInfo *)self->_deviceInfo copyWithZone:a3];
  v11 = (void *)v6[1];
  v6[1] = v10;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_16;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_subscriptionType != *((_DWORD *)v4 + 7)) {
      goto LABEL_16;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
LABEL_16:
    char v7 = 0;
    goto LABEL_17;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_subscriptionAction != *((_DWORD *)v4 + 6)) {
      goto LABEL_16;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_16;
  }
  dsid = self->_dsid;
  if ((unint64_t)dsid | *((void *)v4 + 2) && !-[NSString isEqual:](dsid, "isEqual:")) {
    goto LABEL_16;
  }
  deviceInfo = self->_deviceInfo;
  if ((unint64_t)deviceInfo | *((void *)v4 + 1)) {
    char v7 = -[NTPBDeviceInfo isEqual:](deviceInfo, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_17:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_subscriptionType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_subscriptionAction;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_dsid hash];
  return v5 ^ [(NTPBDeviceInfo *)self->_deviceInfo hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int *)a3;
  NSUInteger v5 = v4;
  char v6 = *((unsigned char *)v4 + 32);
  if ((v6 & 2) != 0)
  {
    self->_subscriptionType = v4[7];
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 32);
  }
  if (v6)
  {
    self->_subscriptionAction = v4[6];
    *(unsigned char *)&self->_has |= 1u;
  }
  v9 = v4;
  if (*((void *)v4 + 2))
  {
    -[NTPBMarketingSubscriptionRequest setDsid:](self, "setDsid:");
    NSUInteger v5 = v9;
  }
  deviceInfo = self->_deviceInfo;
  uint64_t v8 = *((void *)v5 + 1);
  if (deviceInfo)
  {
    if (v8) {
      -[NTPBDeviceInfo mergeFrom:](deviceInfo, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[NTPBMarketingSubscriptionRequest setDeviceInfo:](self, "setDeviceInfo:");
  }

  MEMORY[0x270F9A758]();
}

- (NSString)dsid
{
  return self->_dsid;
}

- (void)setDsid:(id)a3
{
}

- (NTPBDeviceInfo)deviceInfo
{
  return self->_deviceInfo;
}

- (void)setDeviceInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dsid, 0);

  objc_storeStrong((id *)&self->_deviceInfo, 0);
}

@end
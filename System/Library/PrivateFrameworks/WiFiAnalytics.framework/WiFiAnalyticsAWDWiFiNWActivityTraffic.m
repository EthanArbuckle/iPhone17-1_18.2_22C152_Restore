@interface WiFiAnalyticsAWDWiFiNWActivityTraffic
- (BOOL)hasTraffic;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)trafficAsString:(int)a3;
- (int)StringAsTraffic:(id)a3;
- (int)traffic;
- (unint64_t)hash;
- (unint64_t)value;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTraffic:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setTraffic:(int)a3;
- (void)setValue:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation WiFiAnalyticsAWDWiFiNWActivityTraffic

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithUnsignedLongLong:self->_value];
    [v3 setObject:v5 forKey:@"value"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t traffic = self->_traffic;
    if (traffic >= 0xC)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_traffic);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_264467168[traffic];
    }
    [v3 setObject:v7 forKey:@"traffic"];
  }
  return v3;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
}

- (void)setValue:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_value = a3;
}

- (void)setTraffic:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t traffic = a3;
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)traffic
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_traffic;
  }
  else {
    return 0;
  }
}

- (void)setHasTraffic:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasTraffic
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)trafficAsString:(int)a3
{
  if (a3 >= 0xC)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    char v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    char v3 = off_264467168[a3];
  }
  return v3;
}

- (int)StringAsTraffic:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Rx"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Tx"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"TxBK"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"TxBE"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TxVO"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"TxVI"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"RxSU"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"TxSU"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"RxOFDMA"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"TxOFDMA"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"RxMUMIMO"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"TxMUMIMO"])
  {
    int v4 = 11;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)WiFiAnalyticsAWDWiFiNWActivityTraffic;
  int v4 = [(WiFiAnalyticsAWDWiFiNWActivityTraffic *)&v8 description];
  v5 = [(WiFiAnalyticsAWDWiFiNWActivityTraffic *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)readFrom:(id)a3
{
  return WiFiAnalyticsAWDWiFiNWActivityTrafficReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[1] = self->_value;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v4 + 4) = self->_traffic;
    *((unsigned char *)v4 + 20) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((void *)result + 1) = self->_value;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)result + 4) = self->_traffic;
    *((unsigned char *)result + 20) |= 2u;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_value != *((void *)v4 + 1)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
LABEL_11:
    BOOL v5 = 0;
    goto LABEL_12;
  }
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_traffic != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
    BOOL v5 = 1;
  }
LABEL_12:

  return v5;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_value;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2;
  }
  unint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_traffic;
  return v3 ^ v2;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_value = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
  }
  if ((v5 & 2) != 0)
  {
    self->_uint64_t traffic = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (unint64_t)value
{
  return self->_value;
}

@end
@interface PPM2DonationInterval
- (BOOL)hasDomain;
- (BOOL)hasInterval;
- (BOOL)hasIsFirstDonation;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFirstDonation;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)domainAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (int)StringAsDomain:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)domain;
- (int)source;
- (unint64_t)hash;
- (unsigned)interval;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDomain:(int)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasInterval:(BOOL)a3;
- (void)setHasIsFirstDonation:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setInterval:(unsigned int)a3;
- (void)setIsFirstDonation:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2DonationInterval

- (unsigned)interval
{
  return self->_interval;
}

- (BOOL)isFirstDonation
{
  return self->_isFirstDonation;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if (v5)
  {
    self->_domain = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 24);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_source = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 4u;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 8) == 0)
  {
LABEL_4:
    if ((v5 & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  self->_isFirstDonation = *((unsigned char *)v4 + 20);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_5:
    self->_interval = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_6:
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_domain;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_source;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_isFirstDonation;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_interval;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_domain != *((_DWORD *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 4) == 0 || self->_source != *((_DWORD *)v4 + 4)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 4) != 0)
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 8) != 0)
    {
      if (self->_isFirstDonation)
      {
        if (!*((unsigned char *)v4 + 20)) {
          goto LABEL_24;
        }
        goto LABEL_20;
      }
      if (!*((unsigned char *)v4 + 20)) {
        goto LABEL_20;
      }
    }
LABEL_24:
    BOOL v5 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 24) & 8) != 0) {
    goto LABEL_24;
  }
LABEL_20:
  BOOL v5 = (*((unsigned char *)v4 + 24) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_interval != *((_DWORD *)v4 + 3)) {
      goto LABEL_24;
    }
    BOOL v5 = 1;
  }
LABEL_25:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_domain;
    *((unsigned char *)result + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)result + 4) = self->_source;
  *((unsigned char *)result + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      return result;
    }
    goto LABEL_5;
  }
LABEL_9:
  *((unsigned char *)result + 20) = self->_isFirstDonation;
  *((unsigned char *)result + 24) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_5:
  *((_DWORD *)result + 3) = self->_interval;
  *((unsigned char *)result + 24) |= 2u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_domain;
    *((unsigned char *)v4 + 24) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_source;
  *((unsigned char *)v4 + 24) |= 4u;
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  *((unsigned char *)v4 + 20) = self->_isFirstDonation;
  *((unsigned char *)v4 + 24) |= 8u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_5:
    v4[3] = self->_interval;
    *((unsigned char *)v4 + 24) |= 2u;
  }
LABEL_6:
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 8) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_4:
    if ((has & 2) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteBOOLField();
  if ((*(unsigned char *)&self->_has & 2) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint32Field();
LABEL_6:
}

- (BOOL)readFrom:(id)a3
{
  return PPM2DonationIntervalReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    uint64_t domain = self->_domain;
    if (domain >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_domain);
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = off_1E65DA4A0[domain];
    }
    [v3 setObject:v6 forKey:@"domain"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t source = self->_source;
    if (source >= 0x19)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_source);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E65DA4E0[source];
    }
    [v3 setObject:v8 forKey:@"source"];

    char has = (char)self->_has;
  }
  if ((has & 8) != 0)
  {
    v9 = [NSNumber numberWithBool:self->_isFirstDonation];
    [v3 setObject:v9 forKey:@"isFirstDonation"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_interval];
    [v3 setObject:v10 forKey:@"interval"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2DonationInterval;
  id v4 = [(PPM2DonationInterval *)&v8 description];
  id v5 = [(PPM2DonationInterval *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasInterval
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasInterval:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setInterval:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_interval = a3;
}

- (BOOL)hasIsFirstDonation
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasIsFirstDonation:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setIsFirstDonation:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isFirstDonation = a3;
}

- (int)StringAsSource:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Safari"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"News"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Mail"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Messages"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CoreRoutine"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Siri"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Photos"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Health"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"Podcasts"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"Calendar"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"Parsec"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"NowPlaying"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"Notes"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"Maps"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"ContactsSource"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"Reminders"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"UnknownFirstParty"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"UnknownThirdParty"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"UnknownSource"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"Music"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"Wallet"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"Facetime"])
  {
    int v4 = 21;
  }
  else if ([v3 isEqualToString:@"Camera"])
  {
    int v4 = 22;
  }
  else if ([v3 isEqualToString:@"TVRemoteNotifications"])
  {
    int v4 = 23;
  }
  else if ([v3 isEqualToString:@"TVApp"])
  {
    int v4 = 24;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)sourceAsString:(int)a3
{
  if (a3 >= 0x19)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65DA4E0[a3];
  }
  return v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t source = a3;
}

- (int)source
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

- (int)StringAsDomain:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Topics"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"NamedEntities"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Locations"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Events"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ContactsDomain"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Connections"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"QuickTypeBroker"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"UniversalSearchSpotlightTopics"])
  {
    int v4 = 7;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)domainAsString:(int)a3
{
  if (a3 >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65DA4A0[a3];
  }
  return v3;
}

- (BOOL)hasDomain
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDomain:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t domain = a3;
}

- (int)domain
{
  if (*(unsigned char *)&self->_has) {
    return self->_domain;
  }
  else {
    return 0;
  }
}

@end
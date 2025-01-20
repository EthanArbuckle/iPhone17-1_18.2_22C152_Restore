@interface PPM2ObjectsDeleted
+ (id)options;
- (BOOL)error;
- (BOOL)hasDomain;
- (BOOL)hasDonationSource;
- (BOOL)hasError;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)domainAsString:(int)a3;
- (id)donationSourceAsString:(int)a3;
- (int)StringAsDomain:(id)a3;
- (int)StringAsDonationSource:(id)a3;
- (int)domain;
- (int)donationSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDomain:(int)a3;
- (void)setDonationSource:(int)a3;
- (void)setError:(BOOL)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasDonationSource:(BOOL)a3;
- (void)setHasError:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2ObjectsDeleted

- (BOOL)error
{
  return self->_error;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 20);
  if (v5)
  {
    self->_domain = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 20);
    if ((v5 & 4) == 0)
    {
LABEL_3:
      if ((v5 & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 20) & 4) == 0)
  {
    goto LABEL_3;
  }
  self->_error = *((unsigned char *)v4 + 16);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 20) & 2) != 0)
  {
LABEL_4:
    self->_donationSource = *((_DWORD *)v4 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
LABEL_5:
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4;
  }
  uint64_t v2 = 2654435761 * self->_domain;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_error;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_donationSource;
  return v3 ^ v2 ^ v4;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0 || self->_domain != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 20))
  {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 4) != 0)
    {
      if (self->_error)
      {
        if (!*((unsigned char *)v4 + 16)) {
          goto LABEL_19;
        }
        goto LABEL_15;
      }
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_15;
      }
    }
LABEL_19:
    BOOL v5 = 0;
    goto LABEL_20;
  }
  if ((*((unsigned char *)v4 + 20) & 4) != 0) {
    goto LABEL_19;
  }
LABEL_15:
  BOOL v5 = (*((unsigned char *)v4 + 20) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 20) & 2) == 0 || self->_donationSource != *((_DWORD *)v4 + 3)) {
      goto LABEL_19;
    }
    BOOL v5 = 1;
  }
LABEL_20:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result = (id)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)result + 2) = self->_domain;
    *((unsigned char *)result + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        return result;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)result + 16) = self->_error;
  *((unsigned char *)result + 20) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    return result;
  }
LABEL_4:
  *((_DWORD *)result + 3) = self->_donationSource;
  *((unsigned char *)result + 20) |= 2u;
  return result;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[2] = self->_domain;
    *((unsigned char *)v4 + 20) |= 1u;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  *((unsigned char *)v4 + 16) = self->_error;
  *((unsigned char *)v4 + 20) |= 4u;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    v4[3] = self->_donationSource;
    *((unsigned char *)v4 + 20) |= 2u;
  }
LABEL_5:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_5:
}

- (BOOL)readFrom:(id)a3
{
  return PPM2ObjectsDeletedReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_3;
    }
LABEL_9:
    v7 = [NSNumber numberWithBool:self->_error];
    [v3 setObject:v7 forKey:@"error"];

    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_14;
    }
LABEL_10:
    uint64_t donationSource = self->_donationSource;
    if (donationSource >= 0x19)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_donationSource);
      v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = off_1E65DAAC0[donationSource];
    }
    [v3 setObject:v9 forKey:@"donationSource"];

    goto LABEL_14;
  }
  uint64_t domain = self->_domain;
  if (domain >= 8)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_domain);
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v6 = off_1E65DAA80[domain];
  }
  [v3 setObject:v6 forKey:@"domain"];

  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_9;
  }
LABEL_3:
  if ((has & 2) != 0) {
    goto LABEL_10;
  }
LABEL_14:
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2ObjectsDeleted;
  id v4 = [(PPM2ObjectsDeleted *)&v8 description];
  BOOL v5 = [(PPM2ObjectsDeleted *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (int)StringAsDonationSource:(id)a3
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

- (id)donationSourceAsString:(int)a3
{
  if (a3 >= 0x19)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65DAAC0[a3];
  }
  return v3;
}

- (BOOL)hasDonationSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasDonationSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setDonationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t donationSource = a3;
}

- (int)donationSource
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_donationSource;
  }
  else {
    return 0;
  }
}

- (BOOL)hasError
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasError:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setError:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_error = a3;
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
    id v3 = off_1E65DAA80[a3];
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

+ (id)options
{
  if (options_once_22148 != -1) {
    dispatch_once(&options_once_22148, &__block_literal_global_22149);
  }
  uint64_t v2 = (void *)options_sOptions_22150;
  return v2;
}

void __29__PPM2ObjectsDeleted_options__block_invoke()
{
  v0 = (void *)options_sOptions_22150;
  options_sOptions_22150 = (uint64_t)&unk_1F256B168;
}

@end
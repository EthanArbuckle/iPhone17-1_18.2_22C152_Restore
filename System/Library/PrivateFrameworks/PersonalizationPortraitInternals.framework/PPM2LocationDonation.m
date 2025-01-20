@interface PPM2LocationDonation
- (BOOL)hasActiveTreatments;
- (BOOL)hasDonationSource;
- (BOOL)hasGroupId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (NSString)groupId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)donationSourceAsString:(int)a3;
- (int)StringAsDonationSource:(id)a3;
- (int)donationSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setDonationSource:(int)a3;
- (void)setGroupId:(id)a3;
- (void)setHasDonationSource:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2LocationDonation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)setGroupId:(id)a3
{
}

- (NSString)groupId
{
  return self->_groupId;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if (v4[8])
  {
    self->_donationSource = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[PPM2LocationDonation setGroupId:](self, "setGroupId:");
    v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[PPM2LocationDonation setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_donationSource;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_groupId hash] ^ v3;
  return v4 ^ [(NSString *)self->_activeTreatments hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_donationSource != *((_DWORD *)v4 + 4)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((void *)v4 + 3) && !-[NSString isEqual:](groupId, "isEqual:")) {
    goto LABEL_11;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](activeTreatments, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 16) = self->_donationSource;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v7 = [(NSString *)self->_groupId copyWithZone:a3];
  v8 = (void *)v6[3];
  v6[3] = v7;

  uint64_t v9 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v10 = (void *)v6[1];
  v6[1] = v9;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_donationSource;
    *((unsigned char *)v4 + 32) |= 1u;
  }
  uint64_t v5 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    id v4 = v5;
  }
  if (self->_activeTreatments)
  {
    objc_msgSend(v5, "setActiveTreatments:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_groupId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2LocationDonationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t donationSource = self->_donationSource;
    if (donationSource >= 0x19)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_donationSource);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E65D8398[donationSource];
    }
    [v3 setObject:v5 forKey:@"donationSource"];
  }
  groupId = self->_groupId;
  if (groupId) {
    [v3 setObject:groupId forKey:@"groupId"];
  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v3 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2LocationDonation;
  id v4 = [(PPM2LocationDonation *)&v8 description];
  id v5 = [(PPM2LocationDonation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
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
    id v3 = off_1E65D8398[a3];
  }
  return v3;
}

- (BOOL)hasDonationSource
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasDonationSource:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setDonationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t donationSource = a3;
}

- (int)donationSource
{
  if (*(unsigned char *)&self->_has) {
    return self->_donationSource;
  }
  else {
    return 0;
  }
}

@end
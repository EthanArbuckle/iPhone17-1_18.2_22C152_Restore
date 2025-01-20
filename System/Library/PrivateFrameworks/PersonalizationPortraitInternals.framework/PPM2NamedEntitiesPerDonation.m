@interface PPM2NamedEntitiesPerDonation
- (BOOL)hasActiveTreatments;
- (BOOL)hasAlgorithm;
- (BOOL)hasDonationSource;
- (BOOL)hasGroupId;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (NSString)groupId;
- (id)algorithmAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)donationSourceAsString:(int)a3;
- (int)StringAsAlgorithm:(id)a3;
- (int)StringAsDonationSource:(id)a3;
- (int)algorithm;
- (int)donationSource;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setDonationSource:(int)a3;
- (void)setGroupId:(id)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasDonationSource:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2NamedEntitiesPerDonation

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
  if ((v4[8] & 2) != 0)
  {
    self->_donationSource = v4[5];
    *(unsigned char *)&self->_has |= 2u;
  }
  v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[PPM2NamedEntitiesPerDonation setGroupId:](self, "setGroupId:");
    v4 = v5;
  }
  if (v4[8])
  {
    self->_algorithm = v4[4];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[PPM2NamedEntitiesPerDonation setActiveTreatments:](self, "setActiveTreatments:");
    v4 = v5;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v3 = 2654435761 * self->_donationSource;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_groupId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_algorithm;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5 ^ [(NSString *)self->_activeTreatments hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 32);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_donationSource != *((_DWORD *)v4 + 5)) {
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_17;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:"))
    {
LABEL_17:
      char v9 = 0;
      goto LABEL_18;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 32);
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 4)) {
      goto LABEL_17;
    }
  }
  else if (v6)
  {
    goto LABEL_17;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1)) {
    char v9 = -[NSString isEqual:](activeTreatments, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_18:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_donationSource;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  uint64_t v7 = [(NSString *)self->_groupId copyWithZone:a3];
  v8 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v7;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v6 + 16) = self->_algorithm;
    *(unsigned char *)(v6 + 32) |= 1u;
  }
  uint64_t v9 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v10 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v9;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[5] = self->_donationSource;
    *((unsigned char *)v4 + 32) |= 2u;
  }
  uint64_t v5 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[4] = self->_algorithm;
    *((unsigned char *)v4 + 32) |= 1u;
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
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_groupId)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
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
  return PPM2NamedEntitiesPerDonationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t donationSource = self->_donationSource;
    if (donationSource >= 0x19)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_donationSource);
      id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v5 = off_1E65D3DE8[donationSource];
    }
    [v3 setObject:v5 forKey:@"donationSource"];
  }
  groupId = self->_groupId;
  if (groupId) {
    [v3 setObject:groupId forKey:@"groupId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t algorithm = self->_algorithm;
    if (algorithm >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_algorithm);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = off_1E65D3EB0[algorithm];
    }
    [v3 setObject:v8 forKey:@"algorithm"];
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
  v8.super_class = (Class)PPM2NamedEntitiesPerDonation;
  id v4 = [(PPM2NamedEntitiesPerDonation *)&v8 description];
  id v5 = [(PPM2NamedEntitiesPerDonation *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
}

- (int)StringAsAlgorithm:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"LookupHint"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"CoreNLP"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"CoreRoutineImport"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"DataDetectors"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"NSUALocation"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"TrustedLocation"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"MapsInteraction"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"CustomTagger"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"EventKitImport"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"PhotosKnowledgeGraph"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"ContextKit"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"SiriDonation"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"NE2T"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"HighLevelTopicExtraction"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"ParsecDonation"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"PodcastsInteraction"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"HealthKitImport"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"NowPlayingDonation"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"ContactsImport"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"AugmentedGazetteer"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"KnowledgeGraph"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)algorithmAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D3EB0[a3];
  }
  return v3;
}

- (BOOL)hasAlgorithm
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAlgorithm:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t algorithm = a3;
}

- (int)algorithm
{
  if (*(unsigned char *)&self->_has) {
    return self->_algorithm;
  }
  else {
    return 0;
  }
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
    id v3 = off_1E65D3DE8[a3];
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

@end
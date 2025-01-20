@interface PPM2TopicItemDonation
- (BOOL)hasActiveTreatments;
- (BOOL)hasAlgorithm;
- (BOOL)hasDonationSource;
- (BOOL)hasGroupId;
- (BOOL)hasNewItem;
- (BOOL)hasRank;
- (BOOL)hasUserCreated;
- (BOOL)isEqual:(id)a3;
- (BOOL)newItem;
- (BOOL)readFrom:(id)a3;
- (BOOL)userCreated;
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
- (int64_t)rank;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setDonationSource:(int)a3;
- (void)setGroupId:(id)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasDonationSource:(BOOL)a3;
- (void)setHasNewItem:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasUserCreated:(BOOL)a3;
- (void)setNewItem:(BOOL)a3;
- (void)setRank:(int64_t)a3;
- (void)setUserCreated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2TopicItemDonation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

- (int64_t)rank
{
  return self->_rank;
}

- (BOOL)userCreated
{
  return self->_userCreated;
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (BOOL)newItem
{
  return self->_newItem;
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
  id v4 = a3;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    self->_donationSource = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v7 = v4;
  if (*((void *)v4 + 4))
  {
    -[PPM2TopicItemDonation setGroupId:](self, "setGroupId:");
    id v4 = v7;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) != 0)
  {
    self->_newItem = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 44);
  }
  if ((v5 & 2) != 0)
  {
    self->_algorithm = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    -[PPM2TopicItemDonation setActiveTreatments:](self, "setActiveTreatments:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 44);
  if ((v6 & 0x10) != 0)
  {
    self->_userCreated = *((unsigned char *)v4 + 41);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if (v6)
  {
    self->_rank = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_donationSource;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_groupId hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v5 = 2654435761 * self->_newItem;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
  }
  else
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_6:
      uint64_t v6 = 2654435761 * self->_algorithm;
      goto LABEL_9;
    }
  }
  uint64_t v6 = 0;
LABEL_9:
  NSUInteger v7 = [(NSString *)self->_activeTreatments hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v8 = 2654435761 * self->_userCreated;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v9 = 2654435761 * self->_rank;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 44);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_donationSource != *((_DWORD *)v4 + 7)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_38;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:")) {
      goto LABEL_38;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((has & 8) != 0)
  {
    if ((v6 & 8) == 0) {
      goto LABEL_38;
    }
    if (self->_newItem)
    {
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 40))
    {
      goto LABEL_38;
    }
  }
  else if ((v6 & 8) != 0)
  {
    goto LABEL_38;
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_algorithm != *((_DWORD *)v4 + 6)) {
      goto LABEL_38;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_38;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](activeTreatments, "isEqual:")) {
      goto LABEL_38;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((has & 0x10) != 0)
  {
    if ((v6 & 0x10) != 0)
    {
      if (self->_userCreated)
      {
        if (!*((unsigned char *)v4 + 41)) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_34;
      }
    }
LABEL_38:
    BOOL v9 = 0;
    goto LABEL_39;
  }
  if ((v6 & 0x10) != 0) {
    goto LABEL_38;
  }
LABEL_34:
  BOOL v9 = (v6 & 1) == 0;
  if (has)
  {
    if ((v6 & 1) == 0 || self->_rank != *((void *)v4 + 1)) {
      goto LABEL_38;
    }
    BOOL v9 = 1;
  }
LABEL_39:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_donationSource;
    *(unsigned char *)(v5 + 44) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_groupId copyWithZone:a3];
  uint64_t v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v6 + 40) = self->_newItem;
    *(unsigned char *)(v6 + 44) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_algorithm;
    *(unsigned char *)(v6 + 44) |= 2u;
  }
  uint64_t v10 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v11 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v10;

  char v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 41) = self->_userCreated;
    *(unsigned char *)(v6 + 44) |= 0x10u;
    char v12 = (char)self->_has;
  }
  if (v12)
  {
    *(void *)(v6 + 8) = self->_rank;
    *(unsigned char *)(v6 + 44) |= 1u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[7] = self->_donationSource;
    *((unsigned char *)v4 + 44) |= 4u;
  }
  uint64_t v7 = v4;
  if (self->_groupId)
  {
    objc_msgSend(v4, "setGroupId:");
    id v4 = v7;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 40) = self->_newItem;
    *((unsigned char *)v4 + 44) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[6] = self->_algorithm;
    *((unsigned char *)v4 + 44) |= 2u;
  }
  if (self->_activeTreatments)
  {
    objc_msgSend(v7, "setActiveTreatments:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((unsigned char *)v4 + 41) = self->_userCreated;
    *((unsigned char *)v4 + 44) |= 0x10u;
    char v6 = (char)self->_has;
  }
  if (v6)
  {
    *((void *)v4 + 1) = self->_rank;
    *((unsigned char *)v4 + 44) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_groupId) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_activeTreatments) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
  }
  if (v5) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2TopicItemDonationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t donationSource = self->_donationSource;
    if (donationSource >= 0x19)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_donationSource);
      char v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v5 = off_1E65D4A88[donationSource];
    }
    [v3 setObject:v5 forKey:@"donationSource"];
  }
  groupId = self->_groupId;
  if (groupId) {
    [v3 setObject:groupId forKey:@"groupId"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v8 = [NSNumber numberWithBool:self->_newItem];
    [v3 setObject:v8 forKey:@"newItem"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t algorithm = self->_algorithm;
    if (algorithm >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_algorithm);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = off_1E65D4B50[algorithm];
    }
    [v3 setObject:v10 forKey:@"algorithm"];
  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v3 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    v13 = [NSNumber numberWithBool:self->_userCreated];
    [v3 setObject:v13 forKey:@"userCreated"];

    char v12 = (char)self->_has;
  }
  if (v12)
  {
    v14 = [NSNumber numberWithLongLong:self->_rank];
    [v3 setObject:v14 forKey:@"rank"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2TopicItemDonation;
  id v4 = [(PPM2TopicItemDonation *)&v8 description];
  char v5 = [(PPM2TopicItemDonation *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasRank
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasRank:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setRank:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_rank = a3;
}

- (BOOL)hasUserCreated
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasUserCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setUserCreated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_userCreated = a3;
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
    id v3 = off_1E65D4B50[a3];
  }
  return v3;
}

- (BOOL)hasAlgorithm
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasAlgorithm:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setAlgorithm:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t algorithm = a3;
}

- (int)algorithm
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_algorithm;
  }
  else {
    return 0;
  }
}

- (BOOL)hasNewItem
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasNewItem:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setNewItem:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_newItem = a3;
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
    id v3 = off_1E65D4A88[a3];
  }
  return v3;
}

- (BOOL)hasDonationSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDonationSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setDonationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t donationSource = a3;
}

- (int)donationSource
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_donationSource;
  }
  else {
    return 0;
  }
}

@end
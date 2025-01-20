@interface PPM2NamedEntityNewItemDonation
- (BOOL)hasActiveTreatments;
- (BOOL)hasAlgorithm;
- (BOOL)hasCategory;
- (BOOL)hasDonationSource;
- (BOOL)hasDynamicCategory;
- (BOOL)hasGroupId;
- (BOOL)hasNewItem;
- (BOOL)hasRank;
- (BOOL)hasUserCreated;
- (BOOL)isEqual:(id)a3;
- (BOOL)newItem;
- (BOOL)readFrom:(id)a3;
- (BOOL)userCreated;
- (NSString)activeTreatments;
- (NSString)dynamicCategory;
- (NSString)groupId;
- (id)algorithmAsString:(int)a3;
- (id)categoryAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)donationSourceAsString:(int)a3;
- (int)StringAsAlgorithm:(id)a3;
- (int)StringAsCategory:(id)a3;
- (int)StringAsDonationSource:(id)a3;
- (int)algorithm;
- (int)category;
- (int)donationSource;
- (int64_t)rank;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setCategory:(int)a3;
- (void)setDonationSource:(int)a3;
- (void)setDynamicCategory:(id)a3;
- (void)setGroupId:(id)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasDonationSource:(BOOL)a3;
- (void)setHasNewItem:(BOOL)a3;
- (void)setHasRank:(BOOL)a3;
- (void)setHasUserCreated:(BOOL)a3;
- (void)setNewItem:(BOOL)a3;
- (void)setRank:(int64_t)a3;
- (void)setUserCreated:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2NamedEntityNewItemDonation

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_groupId, 0);
  objc_storeStrong((id *)&self->_dynamicCategory, 0);
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

- (void)setDynamicCategory:(id)a3
{
}

- (NSString)dynamicCategory
{
  return self->_dynamicCategory;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 60);
  if ((v5 & 8) != 0)
  {
    self->_donationSource = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 60);
  }
  if ((v5 & 4) != 0)
  {
    self->_category = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
  }
  id v8 = v4;
  if (*((void *)v4 + 5))
  {
    -[PPM2NamedEntityNewItemDonation setDynamicCategory:](self, "setDynamicCategory:");
    id v4 = v8;
  }
  if (*((void *)v4 + 6))
  {
    -[PPM2NamedEntityNewItemDonation setGroupId:](self, "setGroupId:");
    id v4 = v8;
  }
  char v6 = *((unsigned char *)v4 + 60);
  if ((v6 & 0x10) != 0)
  {
    self->_newItem = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 60);
  }
  if ((v6 & 2) != 0)
  {
    self->_algorithm = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 2))
  {
    -[PPM2NamedEntityNewItemDonation setActiveTreatments:](self, "setActiveTreatments:");
    id v4 = v8;
  }
  char v7 = *((unsigned char *)v4 + 60);
  if ((v7 & 0x20) != 0)
  {
    self->_userCreated = *((unsigned char *)v4 + 57);
    *(unsigned char *)&self->_has |= 0x20u;
    char v7 = *((unsigned char *)v4 + 60);
  }
  if (v7)
  {
    self->_rank = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v3 = 2654435761 * self->_donationSource;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_category;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_dynamicCategory hash];
  NSUInteger v6 = [(NSString *)self->_groupId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v7 = 2654435761 * self->_newItem;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_8;
    }
  }
  else
  {
    uint64_t v7 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_8:
      uint64_t v8 = 2654435761 * self->_algorithm;
      goto LABEL_11;
    }
  }
  uint64_t v8 = 0;
LABEL_11:
  NSUInteger v9 = [(NSString *)self->_activeTreatments hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    uint64_t v10 = 2654435761 * self->_userCreated;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_13;
    }
LABEL_15:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v11 = 2654435761 * self->_rank;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0 || self->_donationSource != *((_DWORD *)v4 + 8)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) == 0 || self->_category != *((_DWORD *)v4 + 7)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 4) != 0)
  {
    goto LABEL_44;
  }
  dynamicCategory = self->_dynamicCategory;
  if ((unint64_t)dynamicCategory | *((void *)v4 + 5)
    && !-[NSString isEqual:](dynamicCategory, "isEqual:"))
  {
    goto LABEL_44;
  }
  groupId = self->_groupId;
  if ((unint64_t)groupId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](groupId, "isEqual:")) {
      goto LABEL_44;
    }
  }
  char has = (char)self->_has;
  char v8 = *((unsigned char *)v4 + 60);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 0x10) == 0) {
      goto LABEL_44;
    }
    if (self->_newItem)
    {
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_44;
      }
    }
    else if (*((unsigned char *)v4 + 56))
    {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 0x10) != 0)
  {
    goto LABEL_44;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_algorithm != *((_DWORD *)v4 + 6)) {
      goto LABEL_44;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_44;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](activeTreatments, "isEqual:")) {
      goto LABEL_44;
    }
    char has = (char)self->_has;
    char v8 = *((unsigned char *)v4 + 60);
  }
  if ((has & 0x20) != 0)
  {
    if ((v8 & 0x20) != 0)
    {
      if (self->_userCreated)
      {
        if (!*((unsigned char *)v4 + 57)) {
          goto LABEL_44;
        }
        goto LABEL_40;
      }
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_40;
      }
    }
LABEL_44:
    BOOL v10 = 0;
    goto LABEL_45;
  }
  if ((v8 & 0x20) != 0) {
    goto LABEL_44;
  }
LABEL_40:
  BOOL v10 = (v8 & 1) == 0;
  if (has)
  {
    if ((v8 & 1) == 0 || self->_rank != *((void *)v4 + 1)) {
      goto LABEL_44;
    }
    BOOL v10 = 1;
  }
LABEL_45:

  return v10;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 32) = self->_donationSource;
    *(unsigned char *)(v5 + 60) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    *(_DWORD *)(v5 + 28) = self->_category;
    *(unsigned char *)(v5 + 60) |= 4u;
  }
  uint64_t v8 = [(NSString *)self->_dynamicCategory copyWithZone:a3];
  NSUInteger v9 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v8;

  uint64_t v10 = [(NSString *)self->_groupId copyWithZone:a3];
  uint64_t v11 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v10;

  char v12 = (char)self->_has;
  if ((v12 & 0x10) != 0)
  {
    *(unsigned char *)(v6 + 56) = self->_newItem;
    *(unsigned char *)(v6 + 60) |= 0x10u;
    char v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    *(_DWORD *)(v6 + 24) = self->_algorithm;
    *(unsigned char *)(v6 + 60) |= 2u;
  }
  uint64_t v13 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v14 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v13;

  char v15 = (char)self->_has;
  if ((v15 & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 57) = self->_userCreated;
    *(unsigned char *)(v6 + 60) |= 0x20u;
    char v15 = (char)self->_has;
  }
  if (v15)
  {
    *(void *)(v6 + 8) = self->_rank;
    *(unsigned char *)(v6 + 60) |= 1u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[8] = self->_donationSource;
    *((unsigned char *)v4 + 60) |= 8u;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    v4[7] = self->_category;
    *((unsigned char *)v4 + 60) |= 4u;
  }
  uint64_t v8 = v4;
  if (self->_dynamicCategory)
  {
    objc_msgSend(v4, "setDynamicCategory:");
    id v4 = v8;
  }
  if (self->_groupId)
  {
    objc_msgSend(v8, "setGroupId:");
    id v4 = v8;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_newItem;
    *((unsigned char *)v4 + 60) |= 0x10u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[6] = self->_algorithm;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  if (self->_activeTreatments)
  {
    objc_msgSend(v8, "setActiveTreatments:");
    id v4 = v8;
  }
  char v7 = (char)self->_has;
  if ((v7 & 0x20) != 0)
  {
    *((unsigned char *)v4 + 57) = self->_userCreated;
    *((unsigned char *)v4 + 60) |= 0x20u;
    char v7 = (char)self->_has;
  }
  if (v7)
  {
    *((void *)v4 + 1) = self->_rank;
    *((unsigned char *)v4 + 60) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_dynamicCategory) {
    PBDataWriterWriteStringField();
  }
  if (self->_groupId) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_activeTreatments) {
    PBDataWriterWriteStringField();
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    char v6 = (char)self->_has;
  }
  if (v6) {
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2NamedEntityNewItemDonationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t donationSource = self->_donationSource;
    if (donationSource >= 0x19)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_donationSource);
      char v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      char v6 = off_1E65D8548[donationSource];
    }
    [v3 setObject:v6 forKey:@"donationSource"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t category = self->_category;
    if (category >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_category);
      uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v8 = off_1E65D8610[category];
    }
    [v3 setObject:v8 forKey:@"category"];
  }
  dynamicCategory = self->_dynamicCategory;
  if (dynamicCategory) {
    [v3 setObject:dynamicCategory forKey:@"dynamicCategory"];
  }
  groupId = self->_groupId;
  if (groupId) {
    [v3 setObject:groupId forKey:@"groupId"];
  }
  char v11 = (char)self->_has;
  if ((v11 & 0x10) != 0)
  {
    char v12 = [NSNumber numberWithBool:self->_newItem];
    [v3 setObject:v12 forKey:@"newItem"];

    char v11 = (char)self->_has;
  }
  if ((v11 & 2) != 0)
  {
    uint64_t algorithm = self->_algorithm;
    if (algorithm >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_algorithm);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = off_1E65D86C0[algorithm];
    }
    [v3 setObject:v14 forKey:@"algorithm"];
  }
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v3 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  char v16 = (char)self->_has;
  if ((v16 & 0x20) != 0)
  {
    v17 = [NSNumber numberWithBool:self->_userCreated];
    [v3 setObject:v17 forKey:@"userCreated"];

    char v16 = (char)self->_has;
  }
  if (v16)
  {
    v18 = [NSNumber numberWithLongLong:self->_rank];
    [v3 setObject:v18 forKey:@"rank"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2NamedEntityNewItemDonation;
  id v4 = [(PPM2NamedEntityNewItemDonation *)&v8 description];
  char v5 = [(PPM2NamedEntityNewItemDonation *)self dictionaryRepresentation];
  char v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasUserCreated:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setUserCreated:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
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
    id v3 = off_1E65D86C0[a3];
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
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasNewItem:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setNewItem:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_newItem = a3;
}

- (BOOL)hasGroupId
{
  return self->_groupId != 0;
}

- (BOOL)hasDynamicCategory
{
  return self->_dynamicCategory != 0;
}

- (int)StringAsCategory:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"UnknownCategory"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Person"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Organization"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"Location"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"Restaurant"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"ActivityLocation"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"Media"])
  {
    int v4 = 6;
  }
  else if ([v3 isEqualToString:@"Artist"])
  {
    int v4 = 7;
  }
  else if ([v3 isEqualToString:@"StreetAddress"])
  {
    int v4 = 8;
  }
  else if ([v3 isEqualToString:@"City"])
  {
    int v4 = 9;
  }
  else if ([v3 isEqualToString:@"State"])
  {
    int v4 = 10;
  }
  else if ([v3 isEqualToString:@"Country"])
  {
    int v4 = 11;
  }
  else if ([v3 isEqualToString:@"FullAddress"])
  {
    int v4 = 12;
  }
  else if ([v3 isEqualToString:@"TouristAttraction"])
  {
    int v4 = 13;
  }
  else if ([v3 isEqualToString:@"EventTitle"])
  {
    int v4 = 14;
  }
  else if ([v3 isEqualToString:@"SportsTeam"])
  {
    int v4 = 15;
  }
  else if ([v3 isEqualToString:@"ProfessionalAthlete"])
  {
    int v4 = 16;
  }
  else if ([v3 isEqualToString:@"Musician"])
  {
    int v4 = 17;
  }
  else if ([v3 isEqualToString:@"Movie"])
  {
    int v4 = 18;
  }
  else if ([v3 isEqualToString:@"Dynamic"])
  {
    int v4 = 19;
  }
  else if ([v3 isEqualToString:@"Politician"])
  {
    int v4 = 20;
  }
  else if ([v3 isEqualToString:@"TelevisionShow"])
  {
    int v4 = 21;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)categoryAsString:(int)a3
{
  if (a3 >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D8610[a3];
  }
  return v3;
}

- (BOOL)hasCategory
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t category = a3;
}

- (int)category
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_category;
  }
  else {
    return 0;
  }
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
    id v3 = off_1E65D8548[a3];
  }
  return v3;
}

- (BOOL)hasDonationSource
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasDonationSource:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setDonationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t donationSource = a3;
}

- (int)donationSource
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_donationSource;
  }
  else {
    return 0;
  }
}

@end
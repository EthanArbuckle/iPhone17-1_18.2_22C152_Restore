@interface PPM2NamedEntitySourceLanguage
- (BOOL)hasActiveTreatments;
- (BOOL)hasAlgorithm;
- (BOOL)hasDetectedLanguage;
- (BOOL)hasDonationSource;
- (BOOL)hasLanguageCount;
- (BOOL)hasSystemLanguage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (NSString)detectedLanguage;
- (NSString)systemLanguage;
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
- (unsigned)languageCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setDetectedLanguage:(id)a3;
- (void)setDonationSource:(int)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasDonationSource:(BOOL)a3;
- (void)setHasLanguageCount:(BOOL)a3;
- (void)setLanguageCount:(unsigned int)a3;
- (void)setSystemLanguage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2NamedEntitySourceLanguage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemLanguage, 0);
  objc_storeStrong((id *)&self->_detectedLanguage, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (unsigned)languageCount
{
  return self->_languageCount;
}

- (void)setSystemLanguage:(id)a3
{
}

- (NSString)systemLanguage
{
  return self->_systemLanguage;
}

- (void)setDetectedLanguage:(id)a3
{
}

- (NSString)detectedLanguage
{
  return self->_detectedLanguage;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[PPM2NamedEntitySourceLanguage setDetectedLanguage:](self, "setDetectedLanguage:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[PPM2NamedEntitySourceLanguage setSystemLanguage:](self, "setSystemLanguage:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if ((v5 & 4) != 0)
  {
    self->_languageCount = *((_DWORD *)v4 + 9);
    *(unsigned char *)&self->_has |= 4u;
    char v5 = *((unsigned char *)v4 + 48);
    if ((v5 & 2) == 0)
    {
LABEL_7:
      if ((v5 & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) == 0)
  {
    goto LABEL_7;
  }
  self->_donationSource = *((_DWORD *)v4 + 8);
  *(unsigned char *)&self->_has |= 2u;
  if (*((unsigned char *)v4 + 48))
  {
LABEL_8:
    self->_algorithm = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
LABEL_9:
  if (*((void *)v4 + 1))
  {
    -[PPM2NamedEntitySourceLanguage setActiveTreatments:](self, "setActiveTreatments:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_detectedLanguage hash];
  NSUInteger v4 = [(NSString *)self->_systemLanguage hash];
  if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_activeTreatments hash];
  }
  uint64_t v5 = 2654435761 * self->_languageCount;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_donationSource;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v7 = 2654435761 * self->_algorithm;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_activeTreatments hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_23;
  }
  detectedLanguage = self->_detectedLanguage;
  if ((unint64_t)detectedLanguage | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](detectedLanguage, "isEqual:")) {
      goto LABEL_23;
    }
  }
  systemLanguage = self->_systemLanguage;
  if ((unint64_t)systemLanguage | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](systemLanguage, "isEqual:")) {
      goto LABEL_23;
    }
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_languageCount != *((_DWORD *)v4 + 9)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
LABEL_23:
    char v8 = 0;
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_donationSource != *((_DWORD *)v4 + 8)) {
      goto LABEL_23;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_23;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 4)) {
      goto LABEL_23;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_23;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1)) {
    char v8 = -[NSString isEqual:](activeTreatments, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_24:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_detectedLanguage copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_systemLanguage copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_3;
    }
LABEL_7:
    *(_DWORD *)(v5 + 32) = self->_donationSource;
    *(unsigned char *)(v5 + 48) |= 2u;
    if ((*(unsigned char *)&self->_has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_4;
  }
  *(_DWORD *)(v5 + 36) = self->_languageCount;
  *(unsigned char *)(v5 + 48) |= 4u;
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_7;
  }
LABEL_3:
  if (has)
  {
LABEL_4:
    *(_DWORD *)(v5 + 16) = self->_algorithm;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
LABEL_5:
  uint64_t v11 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v12 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v11;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_detectedLanguage)
  {
    objc_msgSend(v4, "setDetectedLanguage:");
    id v4 = v6;
  }
  if (self->_systemLanguage)
  {
    objc_msgSend(v6, "setSystemLanguage:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_languageCount;
    *((unsigned char *)v4 + 48) |= 4u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  *((_DWORD *)v4 + 8) = self->_donationSource;
  *((unsigned char *)v4 + 48) |= 2u;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    *((_DWORD *)v4 + 4) = self->_algorithm;
    *((unsigned char *)v4 + 48) |= 1u;
  }
LABEL_9:
  if (self->_activeTreatments)
  {
    objc_msgSend(v6, "setActiveTreatments:");
    id v4 = v6;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_detectedLanguage)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_systemLanguage)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if (*(unsigned char *)&self->_has)
  {
LABEL_8:
    PBDataWriterWriteInt32Field();
    id v4 = v6;
  }
LABEL_9:
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2NamedEntitySourceLanguageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  detectedLanguage = self->_detectedLanguage;
  if (detectedLanguage) {
    [v3 setObject:detectedLanguage forKey:@"detectedLanguage"];
  }
  systemLanguage = self->_systemLanguage;
  if (systemLanguage) {
    [v4 setObject:systemLanguage forKey:@"systemLanguage"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    uint64_t v8 = [NSNumber numberWithUnsignedInt:self->_languageCount];
    [v4 setObject:v8 forKey:@"languageCount"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 1) == 0) {
        goto LABEL_18;
      }
      goto LABEL_14;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_7;
  }
  uint64_t donationSource = self->_donationSource;
  if (donationSource >= 0x19)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_donationSource);
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = off_1E65D6FA8[donationSource];
  }
  [v4 setObject:v10 forKey:@"donationSource"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_14:
    uint64_t algorithm = self->_algorithm;
    if (algorithm >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_algorithm);
      v12 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = off_1E65D7070[algorithm];
    }
    [v4 setObject:v12 forKey:@"algorithm"];
  }
LABEL_18:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v4 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2NamedEntitySourceLanguage;
  id v4 = [(PPM2NamedEntitySourceLanguage *)&v8 description];
  uint64_t v5 = [(PPM2NamedEntitySourceLanguage *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

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
    id v3 = off_1E65D7070[a3];
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
    id v3 = off_1E65D6FA8[a3];
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

- (BOOL)hasLanguageCount
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasLanguageCount:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setLanguageCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_languageCount = a3;
}

- (BOOL)hasSystemLanguage
{
  return self->_systemLanguage != 0;
}

- (BOOL)hasDetectedLanguage
{
  return self->_detectedLanguage != 0;
}

@end
@interface PPM2TopicInitialDonation
- (BOOL)hasActiveTreatments;
- (BOOL)hasAlgorithm;
- (BOOL)hasSource;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (id)algorithmAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)sourceAsString:(int)a3;
- (int)StringAsAlgorithm:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)algorithm;
- (int)source;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setSource:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2TopicInitialDonation

- (void).cxx_destruct
{
}

- (void)setActiveTreatments:(id)a3
{
}

- (NSString)activeTreatments
{
  return self->_activeTreatments;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 24);
  if ((v5 & 2) != 0)
  {
    self->_source = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 24);
  }
  if (v5)
  {
    self->_algorithm = *((_DWORD *)v4 + 4);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    id v6 = v4;
    -[PPM2TopicInitialDonation setActiveTreatments:](self, "setActiveTreatments:");
    id v4 = v6;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v2 = 2654435761 * self->_source;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v3 = 0;
    return v3 ^ v2 ^ [(NSString *)self->_activeTreatments hash];
  }
  uint64_t v2 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_algorithm;
  return v3 ^ v2 ^ [(NSString *)self->_activeTreatments hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 24) & 2) == 0 || self->_source != *((_DWORD *)v4 + 5)) {
      goto LABEL_14;
    }
  }
  else if ((*((unsigned char *)v4 + 24) & 2) != 0)
  {
LABEL_14:
    char v6 = 0;
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 24) & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 4)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 24))
  {
    goto LABEL_14;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1)) {
    char v6 = -[NSString isEqual:](activeTreatments, "isEqual:");
  }
  else {
    char v6 = 1;
  }
LABEL_15:

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  char v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 20) = self->_source;
    *(unsigned char *)(v5 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 16) = self->_algorithm;
    *(unsigned char *)(v5 + 24) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  v9 = (void *)v6[1];
  v6[1] = v8;

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[5] = self->_source;
    *((unsigned char *)v4 + 24) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v4[4] = self->_algorithm;
    *((unsigned char *)v4 + 24) |= 1u;
  }
  if (self->_activeTreatments)
  {
    char v6 = v4;
    objc_msgSend(v4, "setActiveTreatments:");
    id v4 = v6;
  }
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
  if (self->_activeTreatments)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2TopicInitialDonationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t source = self->_source;
    if (source >= 0x19)
    {
      id v6 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_source);
    }
    else
    {
      id v6 = *(&off_1E65D8168 + source);
    }
    [v3 setObject:v6 forKey:@"source"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t algorithm = self->_algorithm;
    if (algorithm >= 0x16)
    {
      uint64_t v8 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_algorithm);
    }
    else
    {
      uint64_t v8 = *(&off_1E65D8230 + algorithm);
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
  v8.super_class = (Class)PPM2TopicInitialDonation;
  id v4 = [(PPM2TopicInitialDonation *)&v8 description];
  uint64_t v5 = [(PPM2TopicInitialDonation *)self dictionaryRepresentation];
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
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E65D8230 + a3);
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
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E65D8168 + a3);
  }
  return v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t source = a3;
}

- (int)source
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

@end
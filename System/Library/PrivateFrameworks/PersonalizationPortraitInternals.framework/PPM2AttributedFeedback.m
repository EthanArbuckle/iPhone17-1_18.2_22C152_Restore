@interface PPM2AttributedFeedback
+ (id)options;
- (BOOL)hasActiveTreatments;
- (BOOL)hasAlgorithm;
- (BOOL)hasCategory;
- (BOOL)hasClientId;
- (BOOL)hasDomain;
- (BOOL)hasDynamicCategory;
- (BOOL)hasIsRemote;
- (BOOL)hasMappingId;
- (BOOL)hasSource;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isRemote;
- (BOOL)readFrom:(id)a3;
- (NSString)activeTreatments;
- (NSString)clientId;
- (NSString)dynamicCategory;
- (NSString)mappingId;
- (id)algorithmAsString:(int)a3;
- (id)categoryAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)domainAsString:(int)a3;
- (id)sourceAsString:(int)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsAlgorithm:(id)a3;
- (int)StringAsCategory:(id)a3;
- (int)StringAsDomain:(id)a3;
- (int)StringAsSource:(id)a3;
- (int)StringAsType:(id)a3;
- (int)algorithm;
- (int)category;
- (int)domain;
- (int)source;
- (int)type;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveTreatments:(id)a3;
- (void)setAlgorithm:(int)a3;
- (void)setCategory:(int)a3;
- (void)setClientId:(id)a3;
- (void)setDomain:(int)a3;
- (void)setDynamicCategory:(id)a3;
- (void)setHasAlgorithm:(BOOL)a3;
- (void)setHasCategory:(BOOL)a3;
- (void)setHasDomain:(BOOL)a3;
- (void)setHasIsRemote:(BOOL)a3;
- (void)setHasSource:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setIsRemote:(BOOL)a3;
- (void)setMappingId:(id)a3;
- (void)setSource:(int)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PPM2AttributedFeedback

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mappingId, 0);
  objc_storeStrong((id *)&self->_dynamicCategory, 0);
  objc_storeStrong((id *)&self->_clientId, 0);
  objc_storeStrong((id *)&self->_activeTreatments, 0);
}

- (BOOL)isRemote
{
  return self->_isRemote;
}

- (void)setDynamicCategory:(id)a3
{
}

- (NSString)dynamicCategory
{
  return self->_dynamicCategory;
}

- (void)setMappingId:(id)a3
{
}

- (NSString)mappingId
{
  return self->_mappingId;
}

- (void)setClientId:(id)a3
{
}

- (NSString)clientId
{
  return self->_clientId;
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
  char v5 = *((unsigned char *)v4 + 68);
  if ((v5 & 8) != 0)
  {
    self->_source = *((_DWORD *)v4 + 14);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 68);
    if ((v5 & 1) == 0)
    {
LABEL_3:
      if ((v5 & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_algorithm = *((_DWORD *)v4 + 4);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
LABEL_4:
    self->_domain = *((_DWORD *)v4 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_5:
  id v7 = v4;
  if (*((void *)v4 + 1))
  {
    -[PPM2AttributedFeedback setActiveTreatments:](self, "setActiveTreatments:");
    id v4 = v7;
  }
  if (*((void *)v4 + 3))
  {
    -[PPM2AttributedFeedback setClientId:](self, "setClientId:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[PPM2AttributedFeedback setMappingId:](self, "setMappingId:");
    id v4 = v7;
  }
  char v6 = *((unsigned char *)v4 + 68);
  if ((v6 & 0x10) != 0)
  {
    self->_type = *((_DWORD *)v4 + 15);
    *(unsigned char *)&self->_has |= 0x10u;
    char v6 = *((unsigned char *)v4 + 68);
  }
  if ((v6 & 2) != 0)
  {
    self->_category = *((_DWORD *)v4 + 5);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 5))
  {
    -[PPM2AttributedFeedback setDynamicCategory:](self, "setDynamicCategory:");
    id v4 = v7;
  }
  if ((*((unsigned char *)v4 + 68) & 0x20) != 0)
  {
    self->_isRemote = *((unsigned char *)v4 + 64);
    *(unsigned char *)&self->_has |= 0x20u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    uint64_t v13 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v13 = 2654435761 * self->_source;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_algorithm;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_domain;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v4 = 0;
LABEL_8:
  NSUInteger v5 = [(NSString *)self->_activeTreatments hash];
  NSUInteger v6 = [(NSString *)self->_clientId hash];
  NSUInteger v7 = [(NSString *)self->_mappingId hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    uint64_t v8 = 2654435761 * self->_type;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_10;
    }
  }
  else
  {
    uint64_t v8 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_10:
      uint64_t v9 = 2654435761 * self->_category;
      goto LABEL_13;
    }
  }
  uint64_t v9 = 0;
LABEL_13:
  NSUInteger v10 = [(NSString *)self->_dynamicCategory hash];
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v11 = 2654435761 * self->_isRemote;
  }
  else {
    uint64_t v11 = 0;
  }
  return v3 ^ v13 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 8) == 0 || self->_source != *((_DWORD *)v4 + 14)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 8) != 0)
  {
    goto LABEL_38;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 68) & 1) == 0 || self->_algorithm != *((_DWORD *)v4 + 4)) {
      goto LABEL_38;
    }
  }
  else if (*((unsigned char *)v4 + 68))
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 4) == 0 || self->_domain != *((_DWORD *)v4 + 8)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 4) != 0)
  {
    goto LABEL_38;
  }
  activeTreatments = self->_activeTreatments;
  if ((unint64_t)activeTreatments | *((void *)v4 + 1)
    && !-[NSString isEqual:](activeTreatments, "isEqual:"))
  {
    goto LABEL_38;
  }
  clientId = self->_clientId;
  if ((unint64_t)clientId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](clientId, "isEqual:")) {
      goto LABEL_38;
    }
  }
  mappingId = self->_mappingId;
  if ((unint64_t)mappingId | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](mappingId, "isEqual:")) {
      goto LABEL_38;
    }
  }
  char has = (char)self->_has;
  char v9 = *((unsigned char *)v4 + 68);
  if ((has & 0x10) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 0x10) == 0 || self->_type != *((_DWORD *)v4 + 15)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 0x10) != 0)
  {
    goto LABEL_38;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 68) & 2) == 0 || self->_category != *((_DWORD *)v4 + 5)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 68) & 2) != 0)
  {
    goto LABEL_38;
  }
  dynamicCategory = self->_dynamicCategory;
  if ((unint64_t)dynamicCategory | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](dynamicCategory, "isEqual:")) {
      goto LABEL_38;
    }
    char has = (char)self->_has;
    char v9 = *((unsigned char *)v4 + 68);
  }
  BOOL v11 = (v9 & 0x20) == 0;
  if ((has & 0x20) != 0)
  {
    if ((v9 & 0x20) != 0)
    {
      if (self->_isRemote)
      {
        if (!*((unsigned char *)v4 + 64)) {
          goto LABEL_38;
        }
      }
      else if (*((unsigned char *)v4 + 64))
      {
        goto LABEL_38;
      }
      BOOL v11 = 1;
      goto LABEL_39;
    }
LABEL_38:
    BOOL v11 = 0;
  }
LABEL_39:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(_DWORD *)(v5 + 56) = self->_source;
    *(unsigned char *)(v5 + 68) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 16) = self->_algorithm;
  *(unsigned char *)(v5 + 68) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(_DWORD *)(v5 + 32) = self->_domain;
    *(unsigned char *)(v5 + 68) |= 4u;
  }
LABEL_5:
  uint64_t v8 = [(NSString *)self->_activeTreatments copyWithZone:a3];
  char v9 = *(void **)(v6 + 8);
  *(void *)(v6 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_clientId copyWithZone:a3];
  BOOL v11 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v10;

  uint64_t v12 = [(NSString *)self->_mappingId copyWithZone:a3];
  uint64_t v13 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v12;

  char v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    *(_DWORD *)(v6 + 60) = self->_type;
    *(unsigned char *)(v6 + 68) |= 0x10u;
    char v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    *(_DWORD *)(v6 + 20) = self->_category;
    *(unsigned char *)(v6 + 68) |= 2u;
  }
  uint64_t v15 = [(NSString *)self->_dynamicCategory copyWithZone:a3];
  v16 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v15;

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *(unsigned char *)(v6 + 64) = self->_isRemote;
    *(unsigned char *)(v6 + 68) |= 0x20u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[14] = self->_source;
    *((unsigned char *)v4 + 68) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  v4[4] = self->_algorithm;
  *((unsigned char *)v4 + 68) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v4[8] = self->_domain;
    *((unsigned char *)v4 + 68) |= 4u;
  }
LABEL_5:
  NSUInteger v7 = v4;
  if (self->_activeTreatments)
  {
    objc_msgSend(v4, "setActiveTreatments:");
    id v4 = v7;
  }
  if (self->_clientId)
  {
    objc_msgSend(v7, "setClientId:");
    id v4 = v7;
  }
  if (self->_mappingId)
  {
    objc_msgSend(v7, "setMappingId:");
    id v4 = v7;
  }
  char v6 = (char)self->_has;
  if ((v6 & 0x10) != 0)
  {
    v4[15] = self->_type;
    *((unsigned char *)v4 + 68) |= 0x10u;
    char v6 = (char)self->_has;
  }
  if ((v6 & 2) != 0)
  {
    v4[5] = self->_category;
    *((unsigned char *)v4 + 68) |= 2u;
  }
  if (self->_dynamicCategory)
  {
    objc_msgSend(v7, "setDynamicCategory:");
    id v4 = v7;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    *((unsigned char *)v4 + 64) = self->_isRemote;
    *((unsigned char *)v4 + 68) |= 0x20u;
  }
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteInt32Field();
LABEL_5:
  if (self->_activeTreatments) {
    PBDataWriterWriteStringField();
  }
  if (self->_clientId) {
    PBDataWriterWriteStringField();
  }
  if (self->_mappingId) {
    PBDataWriterWriteStringField();
  }
  char v5 = (char)self->_has;
  if ((v5 & 0x10) != 0)
  {
    PBDataWriterWriteInt32Field();
    char v5 = (char)self->_has;
  }
  if ((v5 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_dynamicCategory) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PPM2AttributedFeedbackReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t source = self->_source;
    if (source >= 0x19)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_source);
      id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v6 = off_1E65D54F8[source];
    }
    [v3 setObject:v6 forKey:@"source"];

    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_17;
      }
      goto LABEL_13;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  uint64_t algorithm = self->_algorithm;
  if (algorithm >= 0x16)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_algorithm);
    uint64_t v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v8 = off_1E65D55C0[algorithm];
  }
  [v3 setObject:v8 forKey:@"algorithm"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_13:
    uint64_t domain = self->_domain;
    if (domain >= 8)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_domain);
      uint64_t v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v10 = off_1E65D5670[domain];
    }
    [v3 setObject:v10 forKey:@"domain"];
  }
LABEL_17:
  activeTreatments = self->_activeTreatments;
  if (activeTreatments) {
    [v3 setObject:activeTreatments forKey:@"activeTreatments"];
  }
  clientId = self->_clientId;
  if (clientId) {
    [v3 setObject:clientId forKey:@"clientId"];
  }
  mappingId = self->_mappingId;
  if (mappingId) {
    [v3 setObject:mappingId forKey:@"mappingId"];
  }
  char v14 = (char)self->_has;
  if ((v14 & 0x10) != 0)
  {
    uint64_t type = self->_type;
    if (type >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
      v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v16 = off_1E65D56B0[type];
    }
    [v3 setObject:v16 forKey:@"type"];

    char v14 = (char)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    uint64_t category = self->_category;
    if (category >= 0x16)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_category);
      v18 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = off_1E65D56E0[category];
    }
    [v3 setObject:v18 forKey:@"category"];
  }
  dynamicCategory = self->_dynamicCategory;
  if (dynamicCategory) {
    [v3 setObject:dynamicCategory forKey:@"dynamicCategory"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v20 = [NSNumber numberWithBool:self->_isRemote];
    [v3 setObject:v20 forKey:@"isRemote"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PPM2AttributedFeedback;
  id v4 = [(PPM2AttributedFeedback *)&v8 description];
  char v5 = [(PPM2AttributedFeedback *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasIsRemote
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setHasIsRemote:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (void)setIsRemote:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isRemote = a3;
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
    id v3 = off_1E65D56E0[a3];
  }
  return v3;
}

- (BOOL)hasCategory
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCategory:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCategory:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_uint64_t category = a3;
}

- (int)category
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_category;
  }
  else {
    return 0;
  }
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Invalid"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"EngagedExplicit"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EngagedImplicit"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"RejectedExplicit"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"RejectedImplicit"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"Offered"])
  {
    int v4 = 5;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D56B0[a3];
  }
  return v3;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_uint64_t type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

- (BOOL)hasMappingId
{
  return self->_mappingId != 0;
}

- (BOOL)hasClientId
{
  return self->_clientId != 0;
}

- (BOOL)hasActiveTreatments
{
  return self->_activeTreatments != 0;
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
    id v3 = off_1E65D5670[a3];
  }
  return v3;
}

- (BOOL)hasDomain
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasDomain:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setDomain:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t domain = a3;
}

- (int)domain
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_domain;
  }
  else {
    return 0;
  }
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
    id v3 = off_1E65D55C0[a3];
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
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E65D54F8[a3];
  }
  return v3;
}

- (BOOL)hasSource
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasSource:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setSource:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t source = a3;
}

- (int)source
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_source;
  }
  else {
    return 0;
  }
}

+ (id)options
{
  if (options_once_4138 != -1) {
    dispatch_once(&options_once_4138, &__block_literal_global_4139);
  }
  v2 = (void *)options_sOptions_4140;
  return v2;
}

void __33__PPM2AttributedFeedback_options__block_invoke()
{
  v0 = (void *)options_sOptions_4140;
  options_sOptions_4140 = (uint64_t)&unk_1F256B028;
}

@end
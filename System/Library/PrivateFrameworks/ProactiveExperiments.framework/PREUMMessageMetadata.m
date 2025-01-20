@interface PREUMMessageMetadata
- (BOOL)hasAgeGroup;
- (BOOL)hasCharCount;
- (BOOL)hasHasQuestionMark;
- (BOOL)hasHostProcess;
- (BOOL)hasIsApricotDevice;
- (BOOL)hasLang;
- (BOOL)hasLocale;
- (BOOL)hasQuestionMark;
- (BOOL)isApricotDevice;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)hostProcess;
- (NSString)lang;
- (NSString)locale;
- (id)ageGroupAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsAgeGroup:(id)a3;
- (int)ageGroup;
- (unint64_t)hash;
- (unsigned)charCount;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAgeGroup:(int)a3;
- (void)setCharCount:(unsigned int)a3;
- (void)setHasAgeGroup:(BOOL)a3;
- (void)setHasCharCount:(BOOL)a3;
- (void)setHasHasQuestionMark:(BOOL)a3;
- (void)setHasIsApricotDevice:(BOOL)a3;
- (void)setHasQuestionMark:(BOOL)a3;
- (void)setHostProcess:(id)a3;
- (void)setIsApricotDevice:(BOOL)a3;
- (void)setLang:(id)a3;
- (void)setLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PREUMMessageMetadata

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_lang, 0);

  objc_storeStrong((id *)&self->_hostProcess, 0);
}

- (BOOL)hasQuestionMark
{
  return self->_hasQuestionMark;
}

- (unsigned)charCount
{
  return self->_charCount;
}

- (BOOL)isApricotDevice
{
  return self->_isApricotDevice;
}

- (void)setLang:(id)a3
{
}

- (NSString)lang
{
  return self->_lang;
}

- (void)setLocale:(id)a3
{
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setHostProcess:(id)a3
{
}

- (NSString)hostProcess
{
  return self->_hostProcess;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[PREUMMessageMetadata setHostProcess:](self, "setHostProcess:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[PREUMMessageMetadata setLocale:](self, "setLocale:");
    id v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[PREUMMessageMetadata setLang:](self, "setLang:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 8) != 0)
  {
    self->_isApricotDevice = *((unsigned char *)v4 + 41);
    *(unsigned char *)&self->_has |= 8u;
    char v5 = *((unsigned char *)v4 + 44);
    if ((v5 & 2) == 0)
    {
LABEL_9:
      if ((v5 & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) == 0)
  {
    goto LABEL_9;
  }
  self->_charCount = *((_DWORD *)v4 + 3);
  *(unsigned char *)&self->_has |= 2u;
  char v5 = *((unsigned char *)v4 + 44);
  if ((v5 & 1) == 0)
  {
LABEL_10:
    if ((v5 & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  self->_ageGroup = *((_DWORD *)v4 + 2);
  *(unsigned char *)&self->_has |= 1u;
  if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
LABEL_11:
    self->_hasQuestionMark = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_12:
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_hostProcess hash];
  NSUInteger v4 = [(NSString *)self->_locale hash];
  NSUInteger v5 = [(NSString *)self->_lang hash];
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v6 = 2654435761 * self->_isApricotDevice;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_charCount;
      if (*(unsigned char *)&self->_has) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v9 = 0;
      return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_ageGroup;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v9 = 2654435761 * self->_hasQuestionMark;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_28;
  }
  hostProcess = self->_hostProcess;
  if ((unint64_t)hostProcess | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](hostProcess, "isEqual:")) {
      goto LABEL_28;
    }
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](locale, "isEqual:")) {
      goto LABEL_28;
    }
  }
  lang = self->_lang;
  if ((unint64_t)lang | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](lang, "isEqual:")) {
      goto LABEL_28;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 8) == 0) {
      goto LABEL_28;
    }
    if (self->_isApricotDevice)
    {
      if (!*((unsigned char *)v4 + 41)) {
        goto LABEL_28;
      }
    }
    else if (*((unsigned char *)v4 + 41))
    {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 8) != 0)
  {
    goto LABEL_28;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 2) == 0 || self->_charCount != *((_DWORD *)v4 + 3)) {
      goto LABEL_28;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 2) != 0)
  {
    goto LABEL_28;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 44) & 1) == 0 || self->_ageGroup != *((_DWORD *)v4 + 2)) {
      goto LABEL_28;
    }
  }
  else if (*((unsigned char *)v4 + 44))
  {
    goto LABEL_28;
  }
  BOOL v8 = (*((unsigned char *)v4 + 44) & 4) == 0;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) != 0)
    {
      if (self->_hasQuestionMark)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_28;
        }
      }
      else if (*((unsigned char *)v4 + 40))
      {
        goto LABEL_28;
      }
      BOOL v8 = 1;
      goto LABEL_29;
    }
LABEL_28:
    BOOL v8 = 0;
  }
LABEL_29:

  return v8;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_hostProcess copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_locale copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  uint64_t v10 = [(NSString *)self->_lang copyWithZone:a3];
  v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *(unsigned char *)(v5 + 41) = self->_isApricotDevice;
    *(unsigned char *)(v5 + 44) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 1) == 0) {
        goto LABEL_4;
      }
LABEL_9:
      *(_DWORD *)(v5 + 8) = self->_ageGroup;
      *(unsigned char *)(v5 + 44) |= 1u;
      if ((*(unsigned char *)&self->_has & 4) == 0) {
        return (id)v5;
      }
      goto LABEL_5;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  *(_DWORD *)(v5 + 12) = self->_charCount;
  *(unsigned char *)(v5 + 44) |= 2u;
  char has = (char)self->_has;
  if (has) {
    goto LABEL_9;
  }
LABEL_4:
  if ((has & 4) != 0)
  {
LABEL_5:
    *(unsigned char *)(v5 + 40) = self->_hasQuestionMark;
    *(unsigned char *)(v5 + 44) |= 4u;
  }
  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_hostProcess)
  {
    objc_msgSend(v4, "setHostProcess:");
    id v4 = v6;
  }
  if (self->_locale)
  {
    objc_msgSend(v6, "setLocale:");
    id v4 = v6;
  }
  if (self->_lang)
  {
    objc_msgSend(v6, "setLang:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((unsigned char *)v4 + 41) = self->_isApricotDevice;
    *((unsigned char *)v4 + 44) |= 8u;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)v4 + 3) = self->_charCount;
  *((unsigned char *)v4 + 44) |= 2u;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  *((_DWORD *)v4 + 2) = self->_ageGroup;
  *((unsigned char *)v4 + 44) |= 1u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    *((unsigned char *)v4 + 40) = self->_hasQuestionMark;
    *((unsigned char *)v4 + 44) |= 4u;
  }
LABEL_12:
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_hostProcess)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_locale)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_lang)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  id v4 = v6;
  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  PBDataWriterWriteInt32Field();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_11:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_12:
}

- (BOOL)readFrom:(id)a3
{
  return PREUMMessageMetadataReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  hostProcess = self->_hostProcess;
  if (hostProcess) {
    [v3 setObject:hostProcess forKey:@"host_process"];
  }
  locale = self->_locale;
  if (locale) {
    [v4 setObject:locale forKey:@"locale"];
  }
  lang = self->_lang;
  if (lang) {
    [v4 setObject:lang forKey:@"lang"];
  }
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v11 = [NSNumber numberWithBool:self->_isApricotDevice];
    [v4 setObject:v11 forKey:@"is_apricot_device"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 1) == 0) {
        goto LABEL_10;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  v12 = [NSNumber numberWithUnsignedInt:self->_charCount];
  [v4 setObject:v12 forKey:@"char_count"];

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 4) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_17:
  uint64_t ageGroup = self->_ageGroup;
  if (ageGroup >= 7)
  {
    v14 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_ageGroup);
  }
  else
  {
    v14 = *(&off_1E65B1978 + ageGroup);
  }
  [v4 setObject:v14 forKey:@"age_group"];

  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v9 = [NSNumber numberWithBool:self->_hasQuestionMark];
  [v4 setObject:v9 forKey:@"has_question_mark"];

LABEL_12:

  return v4;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PREUMMessageMetadata;
  id v4 = [(PREUMMessageMetadata *)&v8 description];
  uint64_t v5 = [(PREUMMessageMetadata *)self dictionaryRepresentation];
  id v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasHasQuestionMark
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasHasQuestionMark:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setHasQuestionMark:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_hasQuestionMark = a3;
}

- (int)StringAsAgeGroup:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GROUP_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GROUP_0TO18"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GROUP_19TO30"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GROUP_31TO50"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GROUP_51TO65"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"GROUP_66TO75"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"GROUP_76UP"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)ageGroupAsString:(int)a3
{
  if (a3 >= 7)
  {
    id v3 = objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
  }
  else
  {
    id v3 = *(&off_1E65B1978 + a3);
  }

  return v3;
}

- (BOOL)hasAgeGroup
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAgeGroup:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAgeGroup:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_uint64_t ageGroup = a3;
}

- (int)ageGroup
{
  if (*(unsigned char *)&self->_has) {
    return self->_ageGroup;
  }
  else {
    return 0;
  }
}

- (BOOL)hasCharCount
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCharCount:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCharCount:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_charCount = a3;
}

- (BOOL)hasIsApricotDevice
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasIsApricotDevice:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setIsApricotDevice:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isApricotDevice = a3;
}

- (BOOL)hasLang
{
  return self->_lang != 0;
}

- (BOOL)hasLocale
{
  return self->_locale != 0;
}

- (BOOL)hasHostProcess
{
  return self->_hostProcess != 0;
}

@end
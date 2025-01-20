@interface AMPMusicCatalogContent
+ (Class)contentFeaturesType;
- (BOOL)hasAdamId;
- (BOOL)hasCanonicalId;
- (BOOL)hasContentType;
- (BOOL)hasIsExplicit;
- (BOOL)hasReleaseDate;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExplicit;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)contentFeatures;
- (id)contentFeaturesAtIndex:(unint64_t)a3;
- (id)contentTypeAsString:(int)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsContentType:(id)a3;
- (int)contentType;
- (int64_t)adamId;
- (int64_t)canonicalId;
- (int64_t)releaseDate;
- (unint64_t)contentFeaturesCount;
- (unint64_t)hash;
- (void)addContentFeatures:(id)a3;
- (void)clearContentFeatures;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAdamId:(int64_t)a3;
- (void)setCanonicalId:(int64_t)a3;
- (void)setContentFeatures:(id)a3;
- (void)setContentType:(int)a3;
- (void)setHasAdamId:(BOOL)a3;
- (void)setHasCanonicalId:(BOOL)a3;
- (void)setHasContentType:(BOOL)a3;
- (void)setHasIsExplicit:(BOOL)a3;
- (void)setHasReleaseDate:(BOOL)a3;
- (void)setIsExplicit:(BOOL)a3;
- (void)setReleaseDate:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation AMPMusicCatalogContent

- (void).cxx_destruct
{
}

- (void)setContentFeatures:(id)a3
{
}

- (NSMutableArray)contentFeatures
{
  return self->_contentFeatures;
}

- (BOOL)isExplicit
{
  return self->_isExplicit;
}

- (int64_t)releaseDate
{
  return self->_releaseDate;
}

- (int64_t)canonicalId
{
  return self->_canonicalId;
}

- (int64_t)adamId
{
  return self->_adamId;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  v5 = v4;
  char v6 = *((unsigned char *)v4 + 48);
  if ((v6 & 8) != 0)
  {
    self->_contentType = *((_DWORD *)v4 + 10);
    *(unsigned char *)&self->_has |= 8u;
    char v6 = *((unsigned char *)v4 + 48);
    if ((v6 & 1) == 0)
    {
LABEL_3:
      if ((v6 & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 1) == 0)
  {
    goto LABEL_3;
  }
  self->_adamId = *((void *)v4 + 1);
  *(unsigned char *)&self->_has |= 1u;
  char v6 = *((unsigned char *)v4 + 48);
  if ((v6 & 2) == 0)
  {
LABEL_4:
    if ((v6 & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  self->_canonicalId = *((void *)v4 + 2);
  *(unsigned char *)&self->_has |= 2u;
  char v6 = *((unsigned char *)v4 + 48);
  if ((v6 & 4) == 0)
  {
LABEL_5:
    if ((v6 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  self->_releaseDate = *((void *)v4 + 3);
  *(unsigned char *)&self->_has |= 4u;
  if ((*((unsigned char *)v4 + 48) & 0x10) != 0)
  {
LABEL_6:
    self->_isExplicit = *((unsigned char *)v4 + 44);
    *(unsigned char *)&self->_has |= 0x10u;
  }
LABEL_7:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v4 + 4);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[AMPMusicCatalogContent addContentFeatures:](self, "addContentFeatures:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    uint64_t v2 = 2654435761 * self->_contentType;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_adamId;
      if ((*(unsigned char *)&self->_has & 2) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_canonicalId;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ (unint64_t)[(NSMutableArray *)self->_contentFeatures hash];
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_releaseDate;
  if ((*(unsigned char *)&self->_has & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_isExplicit;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6 ^ (unint64_t)[(NSMutableArray *)self->_contentFeatures hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 8) == 0 || self->_contentType != *((_DWORD *)v4 + 10)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 8) != 0)
  {
    goto LABEL_26;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_adamId != *((void *)v4 + 1)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_canonicalId != *((void *)v4 + 2)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 4) == 0 || self->_releaseDate != *((void *)v4 + 3)) {
      goto LABEL_26;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 4) != 0)
  {
    goto LABEL_26;
  }
  if ((*(unsigned char *)&self->_has & 0x10) == 0)
  {
    if ((*((unsigned char *)v4 + 48) & 0x10) == 0) {
      goto LABEL_32;
    }
LABEL_26:
    unsigned __int8 v5 = 0;
    goto LABEL_27;
  }
  if ((*((unsigned char *)v4 + 48) & 0x10) == 0) {
    goto LABEL_26;
  }
  if (!self->_isExplicit)
  {
    if (!*((unsigned char *)v4 + 44)) {
      goto LABEL_32;
    }
    goto LABEL_26;
  }
  if (!*((unsigned char *)v4 + 44)) {
    goto LABEL_26;
  }
LABEL_32:
  contentFeatures = self->_contentFeatures;
  if ((unint64_t)contentFeatures | *((void *)v4 + 4)) {
    unsigned __int8 v5 = -[NSMutableArray isEqual:](contentFeatures, "isEqual:");
  }
  else {
    unsigned __int8 v5 = 1;
  }
LABEL_27:

  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 10) = self->_contentType;
    *((unsigned char *)v5 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v5 + 1) = self->_adamId;
  *((unsigned char *)v5 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  *((void *)v5 + 2) = self->_canonicalId;
  *((unsigned char *)v5 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  *((void *)v5 + 3) = self->_releaseDate;
  *((unsigned char *)v5 + 48) |= 4u;
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v5 + 44) = self->_isExplicit;
    *((unsigned char *)v5 + 48) |= 0x10u;
  }
LABEL_7:
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v8 = self->_contentFeatures;
  id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [v6 addContentFeatures:v13];
      }
      id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    v4[10] = self->_contentType;
    *((unsigned char *)v4 + 48) |= 8u;
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  *((void *)v4 + 1) = self->_adamId;
  *((unsigned char *)v4 + 48) |= 1u;
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
LABEL_17:
    *((void *)v4 + 3) = self->_releaseDate;
    *((unsigned char *)v4 + 48) |= 4u;
    if ((*(unsigned char *)&self->_has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_16:
  *((void *)v4 + 2) = self->_canonicalId;
  *((unsigned char *)v4 + 48) |= 2u;
  char has = (char)self->_has;
  if ((has & 4) != 0) {
    goto LABEL_17;
  }
LABEL_5:
  if ((has & 0x10) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 44) = self->_isExplicit;
    *((unsigned char *)v4 + 48) |= 0x10u;
  }
LABEL_7:
  id v10 = v4;
  if ([(AMPMusicCatalogContent *)self contentFeaturesCount])
  {
    [v10 clearContentFeatures];
    unint64_t v6 = [(AMPMusicCatalogContent *)self contentFeaturesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        id v9 = [(AMPMusicCatalogContent *)self contentFeaturesAtIndex:i];
        [v10 addContentFeatures:v9];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 1) == 0)
    {
LABEL_3:
      if ((has & 2) == 0) {
        goto LABEL_4;
      }
      goto LABEL_17;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 2) == 0)
  {
LABEL_4:
    if ((has & 4) == 0) {
      goto LABEL_5;
    }
    goto LABEL_18;
  }
LABEL_17:
  PBDataWriterWriteInt64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_5:
    if ((has & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_18:
  PBDataWriterWriteInt64Field();
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_contentFeatures;
  unint64_t v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000E0AF4((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  char has = (char)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t contentType = self->_contentType;
    if (contentType >= 5)
    {
      unint64_t v6 = +[NSString stringWithFormat:@"(unknown: %i)", self->_contentType];
    }
    else
    {
      unint64_t v6 = off_1001BD550[contentType];
    }
    [v3 setObject:v6 forKey:@"contentType"];

    char has = (char)self->_has;
  }
  if (has)
  {
    long long v16 = +[NSNumber numberWithLongLong:self->_adamId];
    [v3 setObject:v16 forKey:@"adamId"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_8:
      if ((has & 4) == 0) {
        goto LABEL_9;
      }
      goto LABEL_25;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_8;
  }
  long long v17 = +[NSNumber numberWithLongLong:self->_canonicalId];
  [v3 setObject:v17 forKey:@"canonicalId"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_25:
  long long v18 = +[NSNumber numberWithLongLong:self->_releaseDate];
  [v3 setObject:v18 forKey:@"releaseDate"];

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
LABEL_10:
    unint64_t v7 = +[NSNumber numberWithBool:self->_isExplicit];
    [v3 setObject:v7 forKey:@"isExplicit"];
  }
LABEL_11:
  if ([(NSMutableArray *)self->_contentFeatures count])
  {
    id v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_contentFeatures, "count"));
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    uint64_t v9 = self->_contentFeatures;
    id v10 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v9);
          }
          long long v14 = [*(id *)(*((void *)&v19 + 1) + 8 * i) dictionaryRepresentation];
          [v8 addObject:v14];
        }
        id v11 = [(NSMutableArray *)v9 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v11);
    }

    [v3 setObject:v8 forKey:@"contentFeatures"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)AMPMusicCatalogContent;
  uint64_t v3 = [(AMPMusicCatalogContent *)&v7 description];
  id v4 = [(AMPMusicCatalogContent *)self dictionaryRepresentation];
  id v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)contentFeaturesAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_contentFeatures objectAtIndex:a3];
}

- (unint64_t)contentFeaturesCount
{
  return (unint64_t)[(NSMutableArray *)self->_contentFeatures count];
}

- (void)addContentFeatures:(id)a3
{
  id v4 = a3;
  contentFeatures = self->_contentFeatures;
  id v8 = v4;
  if (!contentFeatures)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_contentFeatures;
    self->_contentFeatures = v6;

    id v4 = v8;
    contentFeatures = self->_contentFeatures;
  }
  [(NSMutableArray *)contentFeatures addObject:v4];
}

- (void)clearContentFeatures
{
}

- (BOOL)hasIsExplicit
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setHasIsExplicit:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (void)setIsExplicit:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isExplicit = a3;
}

- (BOOL)hasReleaseDate
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasReleaseDate:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setReleaseDate:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_releaseDate = a3;
}

- (BOOL)hasCanonicalId
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCanonicalId:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setCanonicalId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_canonicalId = a3;
}

- (BOOL)hasAdamId
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasAdamId:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setAdamId:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_adamId = a3;
}

- (int)StringAsContentType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Album"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"Song"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"Playlist"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"MusicVideo"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"ArtistUploadedContent"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)contentTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    id v3 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
  }
  else
  {
    id v3 = off_1001BD550[a3];
  }

  return v3;
}

- (BOOL)hasContentType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasContentType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)setContentType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_uint64_t contentType = a3;
}

- (int)contentType
{
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    return self->_contentType;
  }
  else {
    return 0;
  }
}

+ (Class)contentFeaturesType
{
  return (Class)objc_opt_class();
}

@end
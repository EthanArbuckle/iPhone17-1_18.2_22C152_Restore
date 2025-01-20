@interface UWLLiveActivityEventContent
- (BOOL)contentIsDone;
- (BOOL)hasContentBrandId;
- (BOOL)hasContentCanonicalId;
- (BOOL)hasContentExternalPlayableId;
- (BOOL)hasContentInternalLegId;
- (BOOL)hasContentIsDone;
- (BOOL)hasContentMediaLengthInMilliseconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)contentBrandId;
- (NSString)contentCanonicalId;
- (NSString)contentExternalPlayableId;
- (NSString)contentInternalLegId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)contentMediaLengthInMilliseconds;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentBrandId:(id)a3;
- (void)setContentCanonicalId:(id)a3;
- (void)setContentExternalPlayableId:(id)a3;
- (void)setContentInternalLegId:(id)a3;
- (void)setContentIsDone:(BOOL)a3;
- (void)setContentMediaLengthInMilliseconds:(int64_t)a3;
- (void)setHasContentIsDone:(BOOL)a3;
- (void)setHasContentMediaLengthInMilliseconds:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation UWLLiveActivityEventContent

- (BOOL)hasContentCanonicalId
{
  return self->_contentCanonicalId != 0;
}

- (BOOL)hasContentBrandId
{
  return self->_contentBrandId != 0;
}

- (BOOL)hasContentExternalPlayableId
{
  return self->_contentExternalPlayableId != 0;
}

- (void)setContentMediaLengthInMilliseconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_contentMediaLengthInMilliseconds = a3;
}

- (void)setHasContentMediaLengthInMilliseconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasContentMediaLengthInMilliseconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setContentIsDone:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_contentIsDone = a3;
}

- (void)setHasContentIsDone:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContentIsDone
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasContentInternalLegId
{
  return self->_contentInternalLegId != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)UWLLiveActivityEventContent;
  char v3 = [(UWLLiveActivityEventContent *)&v7 description];
  v4 = [(UWLLiveActivityEventContent *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  contentCanonicalId = self->_contentCanonicalId;
  if (contentCanonicalId) {
    [v3 setObject:contentCanonicalId forKey:@"content_canonical_id"];
  }
  contentBrandId = self->_contentBrandId;
  if (contentBrandId) {
    [v4 setObject:contentBrandId forKey:@"content_brand_id"];
  }
  contentExternalPlayableId = self->_contentExternalPlayableId;
  if (contentExternalPlayableId) {
    [v4 setObject:contentExternalPlayableId forKey:@"content_external_playable_id"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v9 = +[NSNumber numberWithLongLong:self->_contentMediaLengthInMilliseconds];
    [v4 setObject:v9 forKey:@"content_media_length_in_milliseconds"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v10 = +[NSNumber numberWithBool:self->_contentIsDone];
    [v4 setObject:v10 forKey:@"content_is_done"];
  }
  contentInternalLegId = self->_contentInternalLegId;
  if (contentInternalLegId) {
    [v4 setObject:contentInternalLegId forKey:@"content_internal_leg_id"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return UWLLiveActivityEventContentReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_contentCanonicalId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_contentBrandId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_contentExternalPlayableId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_contentInternalLegId)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_contentCanonicalId)
  {
    objc_msgSend(v4, "setContentCanonicalId:");
    id v4 = v6;
  }
  if (self->_contentBrandId)
  {
    objc_msgSend(v6, "setContentBrandId:");
    id v4 = v6;
  }
  if (self->_contentExternalPlayableId)
  {
    objc_msgSend(v6, "setContentExternalPlayableId:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_contentMediaLengthInMilliseconds;
    *((unsigned char *)v4 + 52) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v4 + 48) = self->_contentIsDone;
    *((unsigned char *)v4 + 52) |= 2u;
  }
  if (self->_contentInternalLegId)
  {
    objc_msgSend(v6, "setContentInternalLegId:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_contentCanonicalId copyWithZone:a3];
  objc_super v7 = (void *)v5[3];
  v5[3] = v6;

  id v8 = [(NSString *)self->_contentBrandId copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  id v10 = [(NSString *)self->_contentExternalPlayableId copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  char has = (char)self->_has;
  if (has)
  {
    v5[1] = self->_contentMediaLengthInMilliseconds;
    *((unsigned char *)v5 + 52) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((unsigned char *)v5 + 48) = self->_contentIsDone;
    *((unsigned char *)v5 + 52) |= 2u;
  }
  id v13 = [(NSString *)self->_contentInternalLegId copyWithZone:a3];
  v14 = (void *)v5[5];
  v5[5] = v13;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  contentCanonicalId = self->_contentCanonicalId;
  if ((unint64_t)contentCanonicalId | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](contentCanonicalId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  contentBrandId = self->_contentBrandId;
  if ((unint64_t)contentBrandId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](contentBrandId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  contentExternalPlayableId = self->_contentExternalPlayableId;
  if ((unint64_t)contentExternalPlayableId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](contentExternalPlayableId, "isEqual:")) {
      goto LABEL_17;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) == 0 || self->_contentMediaLengthInMilliseconds != *((void *)v4 + 1)) {
      goto LABEL_17;
    }
  }
  else if (*((unsigned char *)v4 + 52))
  {
    goto LABEL_17;
  }
  if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    if ((*((unsigned char *)v4 + 52) & 2) == 0) {
      goto LABEL_23;
    }
LABEL_17:
    unsigned __int8 v8 = 0;
    goto LABEL_18;
  }
  if ((*((unsigned char *)v4 + 52) & 2) == 0) {
    goto LABEL_17;
  }
  if (!self->_contentIsDone)
  {
    if (!*((unsigned char *)v4 + 48)) {
      goto LABEL_23;
    }
    goto LABEL_17;
  }
  if (!*((unsigned char *)v4 + 48)) {
    goto LABEL_17;
  }
LABEL_23:
  contentInternalLegId = self->_contentInternalLegId;
  if ((unint64_t)contentInternalLegId | *((void *)v4 + 5)) {
    unsigned __int8 v8 = -[NSString isEqual:](contentInternalLegId, "isEqual:");
  }
  else {
    unsigned __int8 v8 = 1;
  }
LABEL_18:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_contentCanonicalId hash];
  NSUInteger v4 = [(NSString *)self->_contentBrandId hash];
  NSUInteger v5 = [(NSString *)self->_contentExternalPlayableId hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_contentMediaLengthInMilliseconds;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v7 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_contentInternalLegId hash];
  }
  uint64_t v6 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v7 = 2654435761 * self->_contentIsDone;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ [(NSString *)self->_contentInternalLegId hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[UWLLiveActivityEventContent setContentCanonicalId:](self, "setContentCanonicalId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 2))
  {
    -[UWLLiveActivityEventContent setContentBrandId:](self, "setContentBrandId:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[UWLLiveActivityEventContent setContentExternalPlayableId:](self, "setContentExternalPlayableId:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 52);
  if (v5)
  {
    self->_contentMediaLengthInMilliseconds = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 52);
  }
  if ((v5 & 2) != 0)
  {
    self->_contentIsDone = *((unsigned char *)v4 + 48);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 5))
  {
    -[UWLLiveActivityEventContent setContentInternalLegId:](self, "setContentInternalLegId:");
    id v4 = v6;
  }
}

- (NSString)contentCanonicalId
{
  return self->_contentCanonicalId;
}

- (void)setContentCanonicalId:(id)a3
{
}

- (NSString)contentBrandId
{
  return self->_contentBrandId;
}

- (void)setContentBrandId:(id)a3
{
}

- (NSString)contentExternalPlayableId
{
  return self->_contentExternalPlayableId;
}

- (void)setContentExternalPlayableId:(id)a3
{
}

- (int64_t)contentMediaLengthInMilliseconds
{
  return self->_contentMediaLengthInMilliseconds;
}

- (BOOL)contentIsDone
{
  return self->_contentIsDone;
}

- (NSString)contentInternalLegId
{
  return self->_contentInternalLegId;
}

- (void)setContentInternalLegId:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentInternalLegId, 0);
  objc_storeStrong((id *)&self->_contentExternalPlayableId, 0);
  objc_storeStrong((id *)&self->_contentCanonicalId, 0);

  objc_storeStrong((id *)&self->_contentBrandId, 0);
}

@end
@interface NTPBUserIgnoreFavoritesSuggestion
- (BOOL)hasIgnoreLocation;
- (BOOL)hasIgnoredFeedId;
- (BOOL)hasIgnoredFeedType;
- (BOOL)hasSuggestionPositionWhenIgnored;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)ignoredFeedId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)ignoreLocation;
- (int)ignoredFeedType;
- (int)suggestionPositionWhenIgnored;
- (unint64_t)hash;
- (void)mergeFrom:(id)a3;
- (void)setHasIgnoreLocation:(BOOL)a3;
- (void)setHasIgnoredFeedType:(BOOL)a3;
- (void)setHasSuggestionPositionWhenIgnored:(BOOL)a3;
- (void)setIgnoreLocation:(int)a3;
- (void)setIgnoredFeedId:(id)a3;
- (void)setIgnoredFeedType:(int)a3;
- (void)setSuggestionPositionWhenIgnored:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBUserIgnoreFavoritesSuggestion

- (int)ignoredFeedType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_ignoredFeedType;
  }
  else {
    return 0;
  }
}

- (void)setIgnoredFeedType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_ignoredFeedType = a3;
}

- (void)setHasIgnoredFeedType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIgnoredFeedType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (int)ignoreLocation
{
  if (*(unsigned char *)&self->_has) {
    return self->_ignoreLocation;
  }
  else {
    return 0;
  }
}

- (void)setIgnoreLocation:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_ignoreLocation = a3;
}

- (void)setHasIgnoreLocation:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIgnoreLocation
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasIgnoredFeedId
{
  return self->_ignoredFeedId != 0;
}

- (void)setSuggestionPositionWhenIgnored:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_suggestionPositionWhenIgnored = a3;
}

- (void)setHasSuggestionPositionWhenIgnored:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSuggestionPositionWhenIgnored
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBUserIgnoreFavoritesSuggestion;
  v4 = [(NTPBUserIgnoreFavoritesSuggestion *)&v8 description];
  v5 = [(NTPBUserIgnoreFavoritesSuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v5 = [NSNumber numberWithInt:self->_ignoredFeedType];
    [v3 setObject:v5 forKey:@"ignored_feed_type"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v6 = [NSNumber numberWithInt:self->_ignoreLocation];
    [v3 setObject:v6 forKey:@"ignore_location"];
  }
  ignoredFeedId = self->_ignoredFeedId;
  if (ignoredFeedId) {
    [v3 setObject:ignoredFeedId forKey:@"ignored_feed_id"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    objc_super v8 = [NSNumber numberWithInt:self->_suggestionPositionWhenIgnored];
    [v3 setObject:v8 forKey:@"suggestion_position_when_ignored"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUserIgnoreFavoritesSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_ignoredFeedId) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(_DWORD *)(v5 + 24) = self->_ignoredFeedType;
    *(unsigned char *)(v5 + 32) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(_DWORD *)(v5 + 8) = self->_ignoreLocation;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_ignoredFeedId copyWithZone:a3];
  v9 = *(void **)(v6 + 16);
  *(void *)(v6 + 16) = v8;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v6 + 28) = self->_suggestionPositionWhenIgnored;
    *(unsigned char *)(v6 + 32) |= 4u;
  }
  return (id)v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0 || self->_ignoredFeedType != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 32) & 1) == 0 || self->_ignoreLocation != *((_DWORD *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 32))
  {
    goto LABEL_19;
  }
  ignoredFeedId = self->_ignoredFeedId;
  if ((unint64_t)ignoredFeedId | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](ignoredFeedId, "isEqual:"))
    {
LABEL_19:
      BOOL v7 = 0;
      goto LABEL_20;
    }
    char has = (char)self->_has;
  }
  BOOL v7 = (*((unsigned char *)v4 + 32) & 4) == 0;
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 4) == 0 || self->_suggestionPositionWhenIgnored != *((_DWORD *)v4 + 7)) {
      goto LABEL_19;
    }
    BOOL v7 = 1;
  }
LABEL_20:

  return v7;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_ignoredFeedType;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if (*(unsigned char *)&self->_has)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_ignoreLocation;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  NSUInteger v5 = [(NSString *)self->_ignoredFeedId hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_suggestionPositionWhenIgnored;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  char v5 = *((unsigned char *)v4 + 32);
  if ((v5 & 2) != 0)
  {
    self->_ignoredFeedType = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 2u;
    char v5 = *((unsigned char *)v4 + 32);
  }
  if (v5)
  {
    self->_ignoreLocation = *((_DWORD *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 2))
  {
    id v6 = v4;
    -[NTPBUserIgnoreFavoritesSuggestion setIgnoredFeedId:](self, "setIgnoredFeedId:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 32) & 4) != 0)
  {
    self->_suggestionPositionWhenIgnored = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (NSString)ignoredFeedId
{
  return self->_ignoredFeedId;
}

- (void)setIgnoredFeedId:(id)a3
{
}

- (int)suggestionPositionWhenIgnored
{
  return self->_suggestionPositionWhenIgnored;
}

- (void).cxx_destruct
{
}

@end
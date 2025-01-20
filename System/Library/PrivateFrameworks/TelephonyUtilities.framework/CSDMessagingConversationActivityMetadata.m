@interface CSDMessagingConversationActivityMetadata
- (BOOL)hasFallbackURL;
- (BOOL)hasImage;
- (BOOL)hasLifetimePolicy;
- (BOOL)hasPreferredBroadcastingAttributes;
- (BOOL)hasSceneAssociationBehavior;
- (BOOL)hasSubtitle;
- (BOOL)hasSupportsActivityPreviews;
- (BOOL)hasSupportsContinuationOnTV;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)supportsActivityPreviews;
- (BOOL)supportsContinuationOnTV;
- (CSDMessagingConversationActivitySceneAssociationBehavior)sceneAssociationBehavior;
- (NSData)image;
- (NSString)fallbackURL;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)lifetimePolicy;
- (unsigned)preferredBroadcastingAttributes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setFallbackURL:(id)a3;
- (void)setHasLifetimePolicy:(BOOL)a3;
- (void)setHasPreferredBroadcastingAttributes:(BOOL)a3;
- (void)setHasSupportsActivityPreviews:(BOOL)a3;
- (void)setHasSupportsContinuationOnTV:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setLifetimePolicy:(unsigned int)a3;
- (void)setPreferredBroadcastingAttributes:(unsigned int)a3;
- (void)setSceneAssociationBehavior:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSupportsActivityPreviews:(BOOL)a3;
- (void)setSupportsContinuationOnTV:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation CSDMessagingConversationActivityMetadata

- (BOOL)hasFallbackURL
{
  return self->_fallbackURL != 0;
}

- (void)setSupportsContinuationOnTV:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_supportsContinuationOnTV = a3;
}

- (void)setHasSupportsContinuationOnTV:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasSupportsContinuationOnTV
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasImage
{
  return self->_image != 0;
}

- (void)setPreferredBroadcastingAttributes:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_preferredBroadcastingAttributes = a3;
}

- (void)setHasPreferredBroadcastingAttributes:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasPreferredBroadcastingAttributes
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasSceneAssociationBehavior
{
  return self->_sceneAssociationBehavior != 0;
}

- (void)setSupportsActivityPreviews:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_supportsActivityPreviews = a3;
}

- (void)setHasSupportsActivityPreviews:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSupportsActivityPreviews
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setLifetimePolicy:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_lifetimePolicy = a3;
}

- (void)setHasLifetimePolicy:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLifetimePolicy
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)CSDMessagingConversationActivityMetadata;
  char v3 = [(CSDMessagingConversationActivityMetadata *)&v7 description];
  v4 = [(CSDMessagingConversationActivityMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  char v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  fallbackURL = self->_fallbackURL;
  if (fallbackURL) {
    [v3 setObject:fallbackURL forKey:@"fallbackURL"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v6 = +[NSNumber numberWithBool:self->_supportsContinuationOnTV];
    [v4 setObject:v6 forKey:@"supportsContinuationOnTV"];
  }
  title = self->_title;
  if (title) {
    [v4 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v4 setObject:subtitle forKey:@"subtitle"];
  }
  image = self->_image;
  if (image) {
    [v4 setObject:image forKey:@"image"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v10 = +[NSNumber numberWithUnsignedInt:self->_preferredBroadcastingAttributes];
    [v4 setObject:v10 forKey:@"preferredBroadcastingAttributes"];
  }
  sceneAssociationBehavior = self->_sceneAssociationBehavior;
  if (sceneAssociationBehavior)
  {
    v12 = [(CSDMessagingConversationActivitySceneAssociationBehavior *)sceneAssociationBehavior dictionaryRepresentation];
    [v4 setObject:v12 forKey:@"sceneAssociationBehavior"];
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v14 = +[NSNumber numberWithBool:self->_supportsActivityPreviews];
    [v4 setObject:v14 forKey:@"supportsActivityPreviews"];

    char has = (char)self->_has;
  }
  if (has)
  {
    v15 = +[NSNumber numberWithUnsignedInt:self->_lifetimePolicy];
    [v4 setObject:v15 forKey:@"lifetimePolicy"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_1001754C4((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_fallbackURL)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_image)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
  if (self->_sceneAssociationBehavior)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if (has)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_fallbackURL)
  {
    objc_msgSend(v4, "setFallbackURL:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v4 + 57) = self->_supportsContinuationOnTV;
    *((unsigned char *)v4 + 60) |= 8u;
  }
  if (self->_title)
  {
    objc_msgSend(v6, "setTitle:");
    id v4 = v6;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v6, "setSubtitle:");
    id v4 = v6;
  }
  if (self->_image)
  {
    objc_msgSend(v6, "setImage:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v4 + 7) = self->_preferredBroadcastingAttributes;
    *((unsigned char *)v4 + 60) |= 2u;
  }
  if (self->_sceneAssociationBehavior)
  {
    objc_msgSend(v6, "setSceneAssociationBehavior:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v4 + 56) = self->_supportsActivityPreviews;
    *((unsigned char *)v4 + 60) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 6) = self->_lifetimePolicy;
    *((unsigned char *)v4 + 60) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_fallbackURL copyWithZone:a3];
  objc_super v7 = (void *)v5[1];
  v5[1] = v6;

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    *((unsigned char *)v5 + 57) = self->_supportsContinuationOnTV;
    *((unsigned char *)v5 + 60) |= 8u;
  }
  id v8 = [(NSString *)self->_title copyWithZone:a3];
  v9 = (void *)v5[6];
  v5[6] = v8;

  id v10 = [(NSString *)self->_subtitle copyWithZone:a3];
  v11 = (void *)v5[5];
  v5[5] = v10;

  id v12 = [(NSData *)self->_image copyWithZone:a3];
  v13 = (void *)v5[2];
  v5[2] = v12;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((_DWORD *)v5 + 7) = self->_preferredBroadcastingAttributes;
    *((unsigned char *)v5 + 60) |= 2u;
  }
  id v14 = [(CSDMessagingConversationActivitySceneAssociationBehavior *)self->_sceneAssociationBehavior copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    *((unsigned char *)v5 + 56) = self->_supportsActivityPreviews;
    *((unsigned char *)v5 + 60) |= 4u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v5 + 6) = self->_lifetimePolicy;
    *((unsigned char *)v5 + 60) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_38;
  }
  fallbackURL = self->_fallbackURL;
  if ((unint64_t)fallbackURL | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](fallbackURL, "isEqual:")) {
      goto LABEL_38;
    }
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 8) == 0) {
      goto LABEL_38;
    }
    if (self->_supportsContinuationOnTV)
    {
      if (!*((unsigned char *)v4 + 57)) {
        goto LABEL_38;
      }
    }
    else if (*((unsigned char *)v4 + 57))
    {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    goto LABEL_38;
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 6) && !-[NSString isEqual:](title, "isEqual:")) {
    goto LABEL_38;
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_38;
    }
  }
  image = self->_image;
  if ((unint64_t)image | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](image, "isEqual:")) {
      goto LABEL_38;
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 2) == 0 || self->_preferredBroadcastingAttributes != *((_DWORD *)v4 + 7)) {
      goto LABEL_38;
    }
  }
  else if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    goto LABEL_38;
  }
  sceneAssociationBehavior = self->_sceneAssociationBehavior;
  if ((unint64_t)sceneAssociationBehavior | *((void *)v4 + 4))
  {
    if (!-[CSDMessagingConversationActivitySceneAssociationBehavior isEqual:](sceneAssociationBehavior, "isEqual:")) {
      goto LABEL_38;
    }
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 60) & 4) != 0)
    {
      if (self->_supportsActivityPreviews)
      {
        if (!*((unsigned char *)v4 + 56)) {
          goto LABEL_38;
        }
        goto LABEL_34;
      }
      if (!*((unsigned char *)v4 + 56)) {
        goto LABEL_34;
      }
    }
LABEL_38:
    BOOL v11 = 0;
    goto LABEL_39;
  }
  if ((*((unsigned char *)v4 + 60) & 4) != 0) {
    goto LABEL_38;
  }
LABEL_34:
  BOOL v11 = (*((unsigned char *)v4 + 60) & 1) == 0;
  if (has)
  {
    if ((*((unsigned char *)v4 + 60) & 1) == 0 || self->_lifetimePolicy != *((_DWORD *)v4 + 6)) {
      goto LABEL_38;
    }
    BOOL v11 = 1;
  }
LABEL_39:

  return v11;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_fallbackURL hash];
  if ((*(unsigned char *)&self->_has & 8) != 0) {
    uint64_t v4 = 2654435761 * self->_supportsContinuationOnTV;
  }
  else {
    uint64_t v4 = 0;
  }
  NSUInteger v5 = [(NSString *)self->_title hash];
  NSUInteger v6 = [(NSString *)self->_subtitle hash];
  unint64_t v7 = (unint64_t)[(NSData *)self->_image hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v8 = 2654435761 * self->_preferredBroadcastingAttributes;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = [(CSDMessagingConversationActivitySceneAssociationBehavior *)self->_sceneAssociationBehavior hash];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    uint64_t v10 = 2654435761 * self->_supportsActivityPreviews;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_9;
    }
LABEL_11:
    uint64_t v11 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
  }
  uint64_t v10 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v11 = 2654435761 * self->_lifetimePolicy;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (*((void *)v4 + 1))
  {
    -[CSDMessagingConversationActivityMetadata setFallbackURL:](self, "setFallbackURL:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 60) & 8) != 0)
  {
    self->_supportsContinuationOnTV = *((unsigned char *)v4 + 57);
    *(unsigned char *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 6))
  {
    -[CSDMessagingConversationActivityMetadata setTitle:](self, "setTitle:");
    id v4 = v8;
  }
  if (*((void *)v4 + 5))
  {
    -[CSDMessagingConversationActivityMetadata setSubtitle:](self, "setSubtitle:");
    id v4 = v8;
  }
  if (*((void *)v4 + 2))
  {
    -[CSDMessagingConversationActivityMetadata setImage:](self, "setImage:");
    id v4 = v8;
  }
  if ((*((unsigned char *)v4 + 60) & 2) != 0)
  {
    self->_preferredBroadcastingAttributes = *((_DWORD *)v4 + 7);
    *(unsigned char *)&self->_has |= 2u;
  }
  sceneAssociationBehavior = self->_sceneAssociationBehavior;
  uint64_t v6 = *((void *)v4 + 4);
  if (sceneAssociationBehavior)
  {
    if (!v6) {
      goto LABEL_19;
    }
    -[CSDMessagingConversationActivitySceneAssociationBehavior mergeFrom:](sceneAssociationBehavior, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_19;
    }
    -[CSDMessagingConversationActivityMetadata setSceneAssociationBehavior:](self, "setSceneAssociationBehavior:");
  }
  id v4 = v8;
LABEL_19:
  char v7 = *((unsigned char *)v4 + 60);
  if ((v7 & 4) != 0)
  {
    self->_supportsActivityPreviews = *((unsigned char *)v4 + 56);
    *(unsigned char *)&self->_has |= 4u;
    char v7 = *((unsigned char *)v4 + 60);
  }
  if (v7)
  {
    self->_lifetimePolicy = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)fallbackURL
{
  return self->_fallbackURL;
}

- (void)setFallbackURL:(id)a3
{
}

- (BOOL)supportsContinuationOnTV
{
  return self->_supportsContinuationOnTV;
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSData)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (unsigned)preferredBroadcastingAttributes
{
  return self->_preferredBroadcastingAttributes;
}

- (CSDMessagingConversationActivitySceneAssociationBehavior)sceneAssociationBehavior
{
  return self->_sceneAssociationBehavior;
}

- (void)setSceneAssociationBehavior:(id)a3
{
}

- (BOOL)supportsActivityPreviews
{
  return self->_supportsActivityPreviews;
}

- (unsigned)lifetimePolicy
{
  return self->_lifetimePolicy;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_sceneAssociationBehavior, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_fallbackURL, 0);
}

@end
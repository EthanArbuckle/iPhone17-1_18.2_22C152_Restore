@interface PKProtobufCommonSharingMessage
- (BOOL)hasActionURL;
- (BOOL)hasButtonTitle;
- (BOOL)hasDataString;
- (BOOL)hasMessageData;
- (BOOL)hasMessageType;
- (BOOL)hasPassThumbnailImage;
- (BOOL)hasPhoneInvitation;
- (BOOL)hasStatus;
- (BOOL)hasSubtitle;
- (BOOL)hasThumbnailImage;
- (BOOL)hasTitle;
- (BOOL)hasTopLeftTitle;
- (BOOL)hasTopRightTitle;
- (BOOL)hasUniqueIdentifier;
- (BOOL)hasWatchInvitation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)messageData;
- (NSData)passThumbnailImage;
- (NSData)thumbnailImage;
- (NSString)actionURL;
- (NSString)buttonTitle;
- (NSString)dataString;
- (NSString)messageType;
- (NSString)phoneInvitation;
- (NSString)subtitle;
- (NSString)title;
- (NSString)topLeftTitle;
- (NSString)topRightTitle;
- (NSString)uniqueIdentifier;
- (NSString)watchInvitation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)statusAsString:(int)a3;
- (int)StringAsStatus:(id)a3;
- (int)status;
- (unint64_t)hash;
- (unsigned)version;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActionURL:(id)a3;
- (void)setButtonTitle:(id)a3;
- (void)setDataString:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setMessageData:(id)a3;
- (void)setMessageType:(id)a3;
- (void)setPassThumbnailImage:(id)a3;
- (void)setPhoneInvitation:(id)a3;
- (void)setStatus:(int)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setTopLeftTitle:(id)a3;
- (void)setTopRightTitle:(id)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWatchInvitation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufCommonSharingMessage

- (BOOL)hasPhoneInvitation
{
  return self->_phoneInvitation != 0;
}

- (int)status
{
  if (*(unsigned char *)&self->_has) {
    return self->_status;
  }
  else {
    return 5;
  }
}

- (void)setStatus:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_status = a3;
}

- (void)setHasStatus:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasStatus
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)statusAsString:(int)a3
{
  if (a3 >= 7)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E56F4CF8[a3];
  }
  return v3;
}

- (int)StringAsStatus:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"PENDING"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"ACCEPTED"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"EXPIRED"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"REVOKED"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"CANCELLED"])
  {
    int v4 = 4;
  }
  else if ([v3 isEqualToString:@"UNKNOWN"])
  {
    int v4 = 5;
  }
  else if ([v3 isEqualToString:@"NOTSUPPORTED"])
  {
    int v4 = 6;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (BOOL)hasDataString
{
  return self->_dataString != 0;
}

- (BOOL)hasWatchInvitation
{
  return self->_watchInvitation != 0;
}

- (BOOL)hasUniqueIdentifier
{
  return self->_uniqueIdentifier != 0;
}

- (BOOL)hasPassThumbnailImage
{
  return self->_passThumbnailImage != 0;
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasTopLeftTitle
{
  return self->_topLeftTitle != 0;
}

- (BOOL)hasTopRightTitle
{
  return self->_topRightTitle != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasThumbnailImage
{
  return self->_thumbnailImage != 0;
}

- (BOOL)hasActionURL
{
  return self->_actionURL != 0;
}

- (BOOL)hasButtonTitle
{
  return self->_buttonTitle != 0;
}

- (BOOL)hasMessageType
{
  return self->_messageType != 0;
}

- (BOOL)hasMessageData
{
  return self->_messageData != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufCommonSharingMessage;
  int v4 = [(PKProtobufCommonSharingMessage *)&v8 description];
  v5 = [(PKProtobufCommonSharingMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  int v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  phoneInvitation = self->_phoneInvitation;
  if (phoneInvitation) {
    [v3 setObject:phoneInvitation forKey:@"phoneInvitation"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t status = self->_status;
    if (status >= 7)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E56F4CF8[status];
    }
    [v3 setObject:v7 forKey:@"status"];
  }
  dataString = self->_dataString;
  if (dataString) {
    [v3 setObject:dataString forKey:@"dataString"];
  }
  watchInvitation = self->_watchInvitation;
  if (watchInvitation) {
    [v3 setObject:watchInvitation forKey:@"watchInvitation"];
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if (uniqueIdentifier) {
    [v3 setObject:uniqueIdentifier forKey:@"uniqueIdentifier"];
  }
  passThumbnailImage = self->_passThumbnailImage;
  if (passThumbnailImage) {
    [v3 setObject:passThumbnailImage forKey:@"passThumbnailImage"];
  }
  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  topLeftTitle = self->_topLeftTitle;
  if (topLeftTitle) {
    [v3 setObject:topLeftTitle forKey:@"topLeftTitle"];
  }
  topRightTitle = self->_topRightTitle;
  if (topRightTitle) {
    [v3 setObject:topRightTitle forKey:@"topRightTitle"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v3 setObject:subtitle forKey:@"subtitle"];
  }
  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage) {
    [v3 setObject:thumbnailImage forKey:@"thumbnailImage"];
  }
  actionURL = self->_actionURL;
  if (actionURL) {
    [v3 setObject:actionURL forKey:@"actionURL"];
  }
  buttonTitle = self->_buttonTitle;
  if (buttonTitle) {
    [v3 setObject:buttonTitle forKey:@"buttonTitle"];
  }
  messageType = self->_messageType;
  if (messageType) {
    [v3 setObject:messageType forKey:@"messageType"];
  }
  messageData = self->_messageData;
  if (messageData) {
    [v3 setObject:messageData forKey:@"messageData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufCommonSharingMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_phoneInvitation) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  int v4 = v5;
  if (self->_dataString)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_watchInvitation)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_uniqueIdentifier)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_passThumbnailImage)
  {
    PBDataWriterWriteDataField();
    int v4 = v5;
  }
  if (self->_title)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_topLeftTitle)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_topRightTitle)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_subtitle)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_thumbnailImage)
  {
    PBDataWriterWriteDataField();
    int v4 = v5;
  }
  if (self->_actionURL)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_buttonTitle)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_messageType)
  {
    PBDataWriterWriteStringField();
    int v4 = v5;
  }
  if (self->_messageData)
  {
    PBDataWriterWriteDataField();
    int v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  v4[30] = self->_version;
  id v5 = v4;
  if (self->_phoneInvitation)
  {
    objc_msgSend(v4, "setPhoneInvitation:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[16] = self->_status;
    *((unsigned char *)v4 + 136) |= 1u;
  }
  if (self->_dataString)
  {
    objc_msgSend(v5, "setDataString:");
    int v4 = v5;
  }
  if (self->_watchInvitation)
  {
    objc_msgSend(v5, "setWatchInvitation:");
    int v4 = v5;
  }
  if (self->_uniqueIdentifier)
  {
    objc_msgSend(v5, "setUniqueIdentifier:");
    int v4 = v5;
  }
  if (self->_passThumbnailImage)
  {
    objc_msgSend(v5, "setPassThumbnailImage:");
    int v4 = v5;
  }
  if (self->_title)
  {
    objc_msgSend(v5, "setTitle:");
    int v4 = v5;
  }
  if (self->_topLeftTitle)
  {
    objc_msgSend(v5, "setTopLeftTitle:");
    int v4 = v5;
  }
  if (self->_topRightTitle)
  {
    objc_msgSend(v5, "setTopRightTitle:");
    int v4 = v5;
  }
  if (self->_subtitle)
  {
    objc_msgSend(v5, "setSubtitle:");
    int v4 = v5;
  }
  if (self->_thumbnailImage)
  {
    objc_msgSend(v5, "setThumbnailImage:");
    int v4 = v5;
  }
  if (self->_actionURL)
  {
    objc_msgSend(v5, "setActionURL:");
    int v4 = v5;
  }
  if (self->_buttonTitle)
  {
    objc_msgSend(v5, "setButtonTitle:");
    int v4 = v5;
  }
  if (self->_messageType)
  {
    objc_msgSend(v5, "setMessageType:");
    int v4 = v5;
  }
  if (self->_messageData)
  {
    objc_msgSend(v5, "setMessageData:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 120) = self->_version;
  uint64_t v6 = [(NSString *)self->_phoneInvitation copyWithZone:a3];
  v7 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 64) = self->_status;
    *(unsigned char *)(v5 + 136) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_dataString copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSString *)self->_watchInvitation copyWithZone:a3];
  v11 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v10;

  uint64_t v12 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v12;

  uint64_t v14 = [(NSData *)self->_passThumbnailImage copyWithZone:a3];
  v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  uint64_t v16 = [(NSString *)self->_title copyWithZone:a3];
  v17 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v16;

  uint64_t v18 = [(NSString *)self->_topLeftTitle copyWithZone:a3];
  v19 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v18;

  uint64_t v20 = [(NSString *)self->_topRightTitle copyWithZone:a3];
  v21 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v20;

  uint64_t v22 = [(NSString *)self->_subtitle copyWithZone:a3];
  v23 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v22;

  uint64_t v24 = [(NSData *)self->_thumbnailImage copyWithZone:a3];
  v25 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v24;

  uint64_t v26 = [(NSString *)self->_actionURL copyWithZone:a3];
  v27 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v26;

  uint64_t v28 = [(NSString *)self->_buttonTitle copyWithZone:a3];
  v29 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v28;

  uint64_t v30 = [(NSString *)self->_messageType copyWithZone:a3];
  v31 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v30;

  uint64_t v32 = [(NSData *)self->_messageData copyWithZone:a3];
  v33 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v32;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if (self->_version != *((_DWORD *)v4 + 30)) {
    goto LABEL_36;
  }
  phoneInvitation = self->_phoneInvitation;
  if ((unint64_t)phoneInvitation | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](phoneInvitation, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 136) & 1) == 0 || self->_status != *((_DWORD *)v4 + 16)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 136))
  {
LABEL_36:
    char v19 = 0;
    goto LABEL_37;
  }
  dataString = self->_dataString;
  if ((unint64_t)dataString | *((void *)v4 + 3) && !-[NSString isEqual:](dataString, "isEqual:")) {
    goto LABEL_36;
  }
  watchInvitation = self->_watchInvitation;
  if ((unint64_t)watchInvitation | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](watchInvitation, "isEqual:")) {
      goto LABEL_36;
    }
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_36;
    }
  }
  passThumbnailImage = self->_passThumbnailImage;
  if ((unint64_t)passThumbnailImage | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](passThumbnailImage, "isEqual:")) {
      goto LABEL_36;
    }
  }
  title = self->_title;
  if ((unint64_t)title | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](title, "isEqual:")) {
      goto LABEL_36;
    }
  }
  topLeftTitle = self->_topLeftTitle;
  if ((unint64_t)topLeftTitle | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](topLeftTitle, "isEqual:")) {
      goto LABEL_36;
    }
  }
  topRightTitle = self->_topRightTitle;
  if ((unint64_t)topRightTitle | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](topRightTitle, "isEqual:")) {
      goto LABEL_36;
    }
  }
  subtitle = self->_subtitle;
  if ((unint64_t)subtitle | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](subtitle, "isEqual:")) {
      goto LABEL_36;
    }
  }
  thumbnailImage = self->_thumbnailImage;
  if ((unint64_t)thumbnailImage | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](thumbnailImage, "isEqual:")) {
      goto LABEL_36;
    }
  }
  actionURL = self->_actionURL;
  if ((unint64_t)actionURL | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](actionURL, "isEqual:")) {
      goto LABEL_36;
    }
  }
  buttonTitle = self->_buttonTitle;
  if ((unint64_t)buttonTitle | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](buttonTitle, "isEqual:")) {
      goto LABEL_36;
    }
  }
  messageType = self->_messageType;
  if ((unint64_t)messageType | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](messageType, "isEqual:")) {
      goto LABEL_36;
    }
  }
  messageData = self->_messageData;
  if ((unint64_t)messageData | *((void *)v4 + 4)) {
    char v19 = -[NSData isEqual:](messageData, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_37:

  return v19;
}

- (unint64_t)hash
{
  unsigned int version = self->_version;
  NSUInteger v4 = [(NSString *)self->_phoneInvitation hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_status;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = v4 ^ v5 ^ [(NSString *)self->_dataString hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_watchInvitation hash] ^ (2654435761 * version);
  NSUInteger v8 = [(NSString *)self->_uniqueIdentifier hash];
  uint64_t v9 = v8 ^ [(NSData *)self->_passThumbnailImage hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_title hash];
  NSUInteger v11 = v10 ^ [(NSString *)self->_topLeftTitle hash];
  NSUInteger v12 = v7 ^ v11 ^ [(NSString *)self->_topRightTitle hash];
  NSUInteger v13 = [(NSString *)self->_subtitle hash];
  uint64_t v14 = v13 ^ [(NSData *)self->_thumbnailImage hash];
  NSUInteger v15 = v14 ^ [(NSString *)self->_actionURL hash];
  NSUInteger v16 = v15 ^ [(NSString *)self->_buttonTitle hash];
  NSUInteger v17 = v16 ^ [(NSString *)self->_messageType hash];
  return v12 ^ v17 ^ [(NSData *)self->_messageData hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  self->_unsigned int version = v4[30];
  uint64_t v5 = v4;
  if (*((void *)v4 + 7))
  {
    -[PKProtobufCommonSharingMessage setPhoneInvitation:](self, "setPhoneInvitation:");
    NSUInteger v4 = v5;
  }
  if (v4[34])
  {
    self->_uint64_t status = v4[16];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 3))
  {
    -[PKProtobufCommonSharingMessage setDataString:](self, "setDataString:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 16))
  {
    -[PKProtobufCommonSharingMessage setWatchInvitation:](self, "setWatchInvitation:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 14))
  {
    -[PKProtobufCommonSharingMessage setUniqueIdentifier:](self, "setUniqueIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 6))
  {
    -[PKProtobufCommonSharingMessage setPassThumbnailImage:](self, "setPassThumbnailImage:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 11))
  {
    -[PKProtobufCommonSharingMessage setTitle:](self, "setTitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 12))
  {
    -[PKProtobufCommonSharingMessage setTopLeftTitle:](self, "setTopLeftTitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 13))
  {
    -[PKProtobufCommonSharingMessage setTopRightTitle:](self, "setTopRightTitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 9))
  {
    -[PKProtobufCommonSharingMessage setSubtitle:](self, "setSubtitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 10))
  {
    -[PKProtobufCommonSharingMessage setThumbnailImage:](self, "setThumbnailImage:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 1))
  {
    -[PKProtobufCommonSharingMessage setActionURL:](self, "setActionURL:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[PKProtobufCommonSharingMessage setButtonTitle:](self, "setButtonTitle:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[PKProtobufCommonSharingMessage setMessageType:](self, "setMessageType:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 4))
  {
    -[PKProtobufCommonSharingMessage setMessageData:](self, "setMessageData:");
    NSUInteger v4 = v5;
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_unsigned int version = a3;
}

- (NSString)phoneInvitation
{
  return self->_phoneInvitation;
}

- (void)setPhoneInvitation:(id)a3
{
}

- (NSString)dataString
{
  return self->_dataString;
}

- (void)setDataString:(id)a3
{
}

- (NSString)watchInvitation
{
  return self->_watchInvitation;
}

- (void)setWatchInvitation:(id)a3
{
}

- (NSString)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (void)setUniqueIdentifier:(id)a3
{
}

- (NSData)passThumbnailImage
{
  return self->_passThumbnailImage;
}

- (void)setPassThumbnailImage:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)topLeftTitle
{
  return self->_topLeftTitle;
}

- (void)setTopLeftTitle:(id)a3
{
}

- (NSString)topRightTitle
{
  return self->_topRightTitle;
}

- (void)setTopRightTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSData)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
}

- (NSString)actionURL
{
  return self->_actionURL;
}

- (void)setActionURL:(id)a3
{
}

- (NSString)buttonTitle
{
  return self->_buttonTitle;
}

- (void)setButtonTitle:(id)a3
{
}

- (NSString)messageType
{
  return self->_messageType;
}

- (void)setMessageType:(id)a3
{
}

- (NSData)messageData
{
  return self->_messageData;
}

- (void)setMessageData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchInvitation, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_topRightTitle, 0);
  objc_storeStrong((id *)&self->_topLeftTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_phoneInvitation, 0);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_messageType, 0);
  objc_storeStrong((id *)&self->_messageData, 0);
  objc_storeStrong((id *)&self->_dataString, 0);
  objc_storeStrong((id *)&self->_buttonTitle, 0);
  objc_storeStrong((id *)&self->_actionURL, 0);
}

@end
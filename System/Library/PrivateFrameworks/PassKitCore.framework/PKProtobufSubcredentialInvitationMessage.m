@interface PKProtobufSubcredentialInvitationMessage
- (BOOL)hasDataString;
- (BOOL)hasPassThumbnailImage;
- (BOOL)hasPhoneInvitation;
- (BOOL)hasStatus;
- (BOOL)hasUniqueIdentifier;
- (BOOL)hasWatchInvitation;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)passThumbnailImage;
- (NSString)dataString;
- (NSString)phoneInvitation;
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
- (void)setDataString:(id)a3;
- (void)setHasStatus:(BOOL)a3;
- (void)setPassThumbnailImage:(id)a3;
- (void)setPhoneInvitation:(id)a3;
- (void)setStatus:(int)a3;
- (void)setUniqueIdentifier:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)setWatchInvitation:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufSubcredentialInvitationMessage

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
  if (a3 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E56E4528[a3];
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

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufSubcredentialInvitationMessage;
  int v4 = [(PKProtobufSubcredentialInvitationMessage *)&v8 description];
  v5 = [(PKProtobufSubcredentialInvitationMessage *)self dictionaryRepresentation];
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
    if (status >= 6)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_status);
      v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = off_1E56E4528[status];
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
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufSubcredentialInvitationMessageReadFrom((uint64_t)self, (uint64_t)a3);
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
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  v4[12] = self->_version;
  id v5 = v4;
  if (self->_phoneInvitation)
  {
    objc_msgSend(v4, "setPhoneInvitation:");
    int v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[8] = self->_status;
    *((unsigned char *)v4 + 64) |= 1u;
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 48) = self->_version;
  uint64_t v6 = [(NSString *)self->_phoneInvitation copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 32) = self->_status;
    *(unsigned char *)(v5 + 64) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_dataString copyWithZone:a3];
  v9 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v8;

  uint64_t v10 = [(NSString *)self->_watchInvitation copyWithZone:a3];
  v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_uniqueIdentifier copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  uint64_t v14 = [(NSData *)self->_passThumbnailImage copyWithZone:a3];
  v15 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v14;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  if (self->_version != *((_DWORD *)v4 + 12)) {
    goto LABEL_18;
  }
  phoneInvitation = self->_phoneInvitation;
  if ((unint64_t)phoneInvitation | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](phoneInvitation, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_status != *((_DWORD *)v4 + 8)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
LABEL_18:
    char v10 = 0;
    goto LABEL_19;
  }
  dataString = self->_dataString;
  if ((unint64_t)dataString | *((void *)v4 + 1) && !-[NSString isEqual:](dataString, "isEqual:")) {
    goto LABEL_18;
  }
  watchInvitation = self->_watchInvitation;
  if ((unint64_t)watchInvitation | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](watchInvitation, "isEqual:")) {
      goto LABEL_18;
    }
  }
  uniqueIdentifier = self->_uniqueIdentifier;
  if ((unint64_t)uniqueIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](uniqueIdentifier, "isEqual:")) {
      goto LABEL_18;
    }
  }
  passThumbnailImage = self->_passThumbnailImage;
  if ((unint64_t)passThumbnailImage | *((void *)v4 + 2)) {
    char v10 = -[NSData isEqual:](passThumbnailImage, "isEqual:");
  }
  else {
    char v10 = 1;
  }
LABEL_19:

  return v10;
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
  uint64_t v6 = 2654435761 * version;
  NSUInteger v7 = v4 ^ v5 ^ [(NSString *)self->_dataString hash];
  NSUInteger v8 = v7 ^ [(NSString *)self->_watchInvitation hash] ^ v6;
  NSUInteger v9 = [(NSString *)self->_uniqueIdentifier hash];
  return v8 ^ v9 ^ [(NSData *)self->_passThumbnailImage hash];
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  self->_unsigned int version = v4[12];
  uint64_t v5 = v4;
  if (*((void *)v4 + 3))
  {
    -[PKProtobufSubcredentialInvitationMessage setPhoneInvitation:](self, "setPhoneInvitation:");
    NSUInteger v4 = v5;
  }
  if (v4[16])
  {
    self->_uint64_t status = v4[8];
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 1))
  {
    -[PKProtobufSubcredentialInvitationMessage setDataString:](self, "setDataString:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 7))
  {
    -[PKProtobufSubcredentialInvitationMessage setWatchInvitation:](self, "setWatchInvitation:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 5))
  {
    -[PKProtobufSubcredentialInvitationMessage setUniqueIdentifier:](self, "setUniqueIdentifier:");
    NSUInteger v4 = v5;
  }
  if (*((void *)v4 + 2))
  {
    -[PKProtobufSubcredentialInvitationMessage setPassThumbnailImage:](self, "setPassThumbnailImage:");
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchInvitation, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_phoneInvitation, 0);
  objc_storeStrong((id *)&self->_passThumbnailImage, 0);
  objc_storeStrong((id *)&self->_dataString, 0);
}

@end
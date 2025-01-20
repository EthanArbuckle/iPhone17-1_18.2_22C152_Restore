@interface PKProtobufRelaySharingMessage
+ (Class)mailboxURLsType;
- (BOOL)hasCarKeyReaderIdentifier;
- (BOOL)hasLocalData;
- (BOOL)hasProvisioningCredentialHash;
- (BOOL)hasStatus;
- (BOOL)hasSubtitle;
- (BOOL)hasThumbnailImage;
- (BOOL)hasTitle;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)localData;
- (NSData)thumbnailImage;
- (NSMutableArray)mailboxURLs;
- (NSString)carKeyReaderIdentifier;
- (NSString)provisioningCredentialHash;
- (NSString)status;
- (NSString)subtitle;
- (NSString)title;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)mailboxURLsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)mailboxURLsCount;
- (unsigned)version;
- (void)addMailboxURLs:(id)a3;
- (void)clearMailboxURLs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCarKeyReaderIdentifier:(id)a3;
- (void)setLocalData:(id)a3;
- (void)setMailboxURLs:(id)a3;
- (void)setProvisioningCredentialHash:(id)a3;
- (void)setStatus:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setTitle:(id)a3;
- (void)setVersion:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufRelaySharingMessage

- (BOOL)hasTitle
{
  return self->_title != 0;
}

- (BOOL)hasSubtitle
{
  return self->_subtitle != 0;
}

- (BOOL)hasThumbnailImage
{
  return self->_thumbnailImage != 0;
}

- (BOOL)hasStatus
{
  return self->_status != 0;
}

- (void)clearMailboxURLs
{
}

- (void)addMailboxURLs:(id)a3
{
  id v4 = a3;
  mailboxURLs = self->_mailboxURLs;
  id v8 = v4;
  if (!mailboxURLs)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_mailboxURLs;
    self->_mailboxURLs = v6;

    id v4 = v8;
    mailboxURLs = self->_mailboxURLs;
  }
  [(NSMutableArray *)mailboxURLs addObject:v4];
}

- (unint64_t)mailboxURLsCount
{
  return [(NSMutableArray *)self->_mailboxURLs count];
}

- (id)mailboxURLsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_mailboxURLs objectAtIndex:a3];
}

+ (Class)mailboxURLsType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasLocalData
{
  return self->_localData != 0;
}

- (BOOL)hasProvisioningCredentialHash
{
  return self->_provisioningCredentialHash != 0;
}

- (BOOL)hasCarKeyReaderIdentifier
{
  return self->_carKeyReaderIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufRelaySharingMessage;
  id v4 = [(PKProtobufRelaySharingMessage *)&v8 description];
  v5 = [(PKProtobufRelaySharingMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [NSNumber numberWithUnsignedInt:self->_version];
  [v3 setObject:v4 forKey:@"version"];

  title = self->_title;
  if (title) {
    [v3 setObject:title forKey:@"title"];
  }
  subtitle = self->_subtitle;
  if (subtitle) {
    [v3 setObject:subtitle forKey:@"subtitle"];
  }
  thumbnailImage = self->_thumbnailImage;
  if (thumbnailImage) {
    [v3 setObject:thumbnailImage forKey:@"thumbnailImage"];
  }
  status = self->_status;
  if (status) {
    [v3 setObject:status forKey:@"status"];
  }
  mailboxURLs = self->_mailboxURLs;
  if (mailboxURLs) {
    [v3 setObject:mailboxURLs forKey:@"mailboxURLs"];
  }
  localData = self->_localData;
  if (localData) {
    [v3 setObject:localData forKey:@"localData"];
  }
  provisioningCredentialHash = self->_provisioningCredentialHash;
  if (provisioningCredentialHash) {
    [v3 setObject:provisioningCredentialHash forKey:@"provisioningCredentialHash"];
  }
  carKeyReaderIdentifier = self->_carKeyReaderIdentifier;
  if (carKeyReaderIdentifier) {
    [v3 setObject:carKeyReaderIdentifier forKey:@"carKeyReaderIdentifier"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufRelaySharingMessageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  PBDataWriterWriteUint32Field();
  if (self->_title) {
    PBDataWriterWriteStringField();
  }
  if (self->_subtitle) {
    PBDataWriterWriteStringField();
  }
  if (self->_thumbnailImage) {
    PBDataWriterWriteDataField();
  }
  if (self->_status) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_mailboxURLs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteStringField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (self->_localData) {
    PBDataWriterWriteDataField();
  }
  if (self->_provisioningCredentialHash) {
    PBDataWriterWriteStringField();
  }
  if (self->_carKeyReaderIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v9 = a3;
  v9[18] = self->_version;
  if (self->_title) {
    objc_msgSend(v9, "setTitle:");
  }
  if (self->_subtitle) {
    objc_msgSend(v9, "setSubtitle:");
  }
  if (self->_thumbnailImage) {
    objc_msgSend(v9, "setThumbnailImage:");
  }
  if (self->_status) {
    objc_msgSend(v9, "setStatus:");
  }
  if ([(PKProtobufRelaySharingMessage *)self mailboxURLsCount])
  {
    [v9 clearMailboxURLs];
    unint64_t v4 = [(PKProtobufRelaySharingMessage *)self mailboxURLsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(PKProtobufRelaySharingMessage *)self mailboxURLsAtIndex:i];
        [v9 addMailboxURLs:v7];
      }
    }
  }
  if (self->_localData) {
    objc_msgSend(v9, "setLocalData:");
  }
  uint64_t v8 = v9;
  if (self->_provisioningCredentialHash)
  {
    objc_msgSend(v9, "setProvisioningCredentialHash:");
    uint64_t v8 = v9;
  }
  if (self->_carKeyReaderIdentifier)
  {
    objc_msgSend(v9, "setCarKeyReaderIdentifier:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 72) = self->_version;
  uint64_t v6 = [(NSString *)self->_title copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_subtitle copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v8;

  uint64_t v10 = [(NSData *)self->_thumbnailImage copyWithZone:a3];
  long long v11 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v10;

  uint64_t v12 = [(NSString *)self->_status copyWithZone:a3];
  long long v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v14 = self->_mailboxURLs;
  uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v28;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v14);
        }
        v19 = objc_msgSend(*(id *)(*((void *)&v27 + 1) + 8 * v18), "copyWithZone:", a3, (void)v27);
        [(id)v5 addMailboxURLs:v19];

        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v16);
  }

  uint64_t v20 = [(NSData *)self->_localData copyWithZone:a3];
  v21 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v20;

  uint64_t v22 = [(NSString *)self->_provisioningCredentialHash copyWithZone:a3];
  v23 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v22;

  uint64_t v24 = [(NSString *)self->_carKeyReaderIdentifier copyWithZone:a3];
  v25 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v24;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_version == *((_DWORD *)v4 + 18)
    && ((title = self->_title, !((unint64_t)title | v4[8]))
     || -[NSString isEqual:](title, "isEqual:"))
    && ((subtitle = self->_subtitle, !((unint64_t)subtitle | v4[6]))
     || -[NSString isEqual:](subtitle, "isEqual:"))
    && ((thumbnailImage = self->_thumbnailImage, !((unint64_t)thumbnailImage | v4[7]))
     || -[NSData isEqual:](thumbnailImage, "isEqual:"))
    && ((status = self->_status, !((unint64_t)status | v4[5]))
     || -[NSString isEqual:](status, "isEqual:"))
    && ((mailboxURLs = self->_mailboxURLs, !((unint64_t)mailboxURLs | v4[3]))
     || -[NSMutableArray isEqual:](mailboxURLs, "isEqual:"))
    && ((localData = self->_localData, !((unint64_t)localData | v4[2]))
     || -[NSData isEqual:](localData, "isEqual:"))
    && ((provisioningCredentialHash = self->_provisioningCredentialHash,
         !((unint64_t)provisioningCredentialHash | v4[4]))
     || -[NSString isEqual:](provisioningCredentialHash, "isEqual:")))
  {
    carKeyReaderIdentifier = self->_carKeyReaderIdentifier;
    if ((unint64_t)carKeyReaderIdentifier | v4[1]) {
      char v13 = -[NSString isEqual:](carKeyReaderIdentifier, "isEqual:");
    }
    else {
      char v13 = 1;
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_version;
  NSUInteger v4 = [(NSString *)self->_title hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_subtitle hash];
  uint64_t v6 = v5 ^ [(NSData *)self->_thumbnailImage hash];
  NSUInteger v7 = v6 ^ [(NSString *)self->_status hash] ^ v3;
  uint64_t v8 = [(NSMutableArray *)self->_mailboxURLs hash];
  uint64_t v9 = v8 ^ [(NSData *)self->_localData hash];
  NSUInteger v10 = v9 ^ [(NSString *)self->_provisioningCredentialHash hash];
  return v7 ^ v10 ^ [(NSString *)self->_carKeyReaderIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  self->_version = *((_DWORD *)v4 + 18);
  if (*((void *)v4 + 8)) {
    -[PKProtobufRelaySharingMessage setTitle:](self, "setTitle:");
  }
  if (*((void *)v4 + 6)) {
    -[PKProtobufRelaySharingMessage setSubtitle:](self, "setSubtitle:");
  }
  if (*((void *)v4 + 7)) {
    -[PKProtobufRelaySharingMessage setThumbnailImage:](self, "setThumbnailImage:");
  }
  if (*((void *)v4 + 5)) {
    -[PKProtobufRelaySharingMessage setStatus:](self, "setStatus:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 3);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        -[PKProtobufRelaySharingMessage addMailboxURLs:](self, "addMailboxURLs:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((void *)v4 + 2)) {
    -[PKProtobufRelaySharingMessage setLocalData:](self, "setLocalData:");
  }
  if (*((void *)v4 + 4)) {
    -[PKProtobufRelaySharingMessage setProvisioningCredentialHash:](self, "setProvisioningCredentialHash:");
  }
  if (*((void *)v4 + 1)) {
    -[PKProtobufRelaySharingMessage setCarKeyReaderIdentifier:](self, "setCarKeyReaderIdentifier:");
  }
}

- (unsigned)version
{
  return self->_version;
}

- (void)setVersion:(unsigned int)a3
{
  self->_version = a3;
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

- (NSData)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
}

- (NSString)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSMutableArray)mailboxURLs
{
  return self->_mailboxURLs;
}

- (void)setMailboxURLs:(id)a3
{
}

- (NSData)localData
{
  return self->_localData;
}

- (void)setLocalData:(id)a3
{
}

- (NSString)provisioningCredentialHash
{
  return self->_provisioningCredentialHash;
}

- (void)setProvisioningCredentialHash:(id)a3
{
}

- (NSString)carKeyReaderIdentifier
{
  return self->_carKeyReaderIdentifier;
}

- (void)setCarKeyReaderIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_thumbnailImage, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_provisioningCredentialHash, 0);
  objc_storeStrong((id *)&self->_mailboxURLs, 0);
  objc_storeStrong((id *)&self->_localData, 0);
  objc_storeStrong((id *)&self->_carKeyReaderIdentifier, 0);
}

@end
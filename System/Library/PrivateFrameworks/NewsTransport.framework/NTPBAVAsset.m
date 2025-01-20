@interface NTPBAVAsset
+ (Class)contentKeyIdentifiersType;
- (BOOL)hasBookmark;
- (BOOL)hasIdentifier;
- (BOOL)hasRemoteURL;
- (BOOL)hasSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)bookmark;
- (NSMutableArray)contentKeyIdentifiers;
- (NSString)identifier;
- (NSString)remoteURL;
- (id)contentKeyIdentifiersAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)contentKeyIdentifiersCount;
- (unint64_t)hash;
- (unint64_t)size;
- (void)addContentKeyIdentifiers:(id)a3;
- (void)clearContentKeyIdentifiers;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBookmark:(id)a3;
- (void)setContentKeyIdentifiers:(id)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setIdentifier:(id)a3;
- (void)setRemoteURL:(id)a3;
- (void)setSize:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBAVAsset

- (void)dealloc
{
  [(NTPBAVAsset *)self setIdentifier:0];
  [(NTPBAVAsset *)self setRemoteURL:0];
  [(NTPBAVAsset *)self setBookmark:0];
  [(NTPBAVAsset *)self setContentKeyIdentifiers:0];
  v3.receiver = self;
  v3.super_class = (Class)NTPBAVAsset;
  [(NTPBAVAsset *)&v3 dealloc];
}

- (BOOL)hasIdentifier
{
  return self->_identifier != 0;
}

- (BOOL)hasRemoteURL
{
  return self->_remoteURL != 0;
}

- (BOOL)hasBookmark
{
  return self->_bookmark != 0;
}

- (void)setSize:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearContentKeyIdentifiers
{
}

- (void)addContentKeyIdentifiers:(id)a3
{
  contentKeyIdentifiers = self->_contentKeyIdentifiers;
  if (!contentKeyIdentifiers)
  {
    contentKeyIdentifiers = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    self->_contentKeyIdentifiers = contentKeyIdentifiers;
  }

  [(NSMutableArray *)contentKeyIdentifiers addObject:a3];
}

- (unint64_t)contentKeyIdentifiersCount
{
  return [(NSMutableArray *)self->_contentKeyIdentifiers count];
}

- (id)contentKeyIdentifiersAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_contentKeyIdentifiers objectAtIndex:a3];
}

+ (Class)contentKeyIdentifiersType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)NTPBAVAsset;
  return (id)[NSString stringWithFormat:@"%@ %@", -[NTPBAVAsset description](&v3, sel_description), -[NTPBAVAsset dictionaryRepresentation](self, "dictionaryRepresentation")];
}

- (id)dictionaryRepresentation
{
  objc_super v3 = (void *)[MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  identifier = self->_identifier;
  if (identifier) {
    [v3 setObject:identifier forKey:@"identifier"];
  }
  remoteURL = self->_remoteURL;
  if (remoteURL) {
    [v4 setObject:remoteURL forKey:@"remote_URL"];
  }
  bookmark = self->_bookmark;
  if (bookmark) {
    [v4 setObject:bookmark forKey:@"bookmark"];
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", self->_size), @"size");
  }
  contentKeyIdentifiers = self->_contentKeyIdentifiers;
  if (contentKeyIdentifiers) {
    [v4 setObject:contentKeyIdentifiers forKey:@"content_key_identifiers"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBAVAssetReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  if (self->_identifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_remoteURL) {
    PBDataWriterWriteStringField();
  }
  if (self->_bookmark) {
    PBDataWriterWriteDataField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  contentKeyIdentifiers = self->_contentKeyIdentifiers;
  uint64_t v5 = [(NSMutableArray *)contentKeyIdentifiers countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(contentKeyIdentifiers);
        }
        PBDataWriterWriteStringField();
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [(NSMutableArray *)contentKeyIdentifiers countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  *(void *)(v5 + 32) = [(NSString *)self->_identifier copyWithZone:a3];
  *(void *)(v5 + 40) = [(NSString *)self->_remoteURL copyWithZone:a3];

  *(void *)(v5 + 16) = [(NSData *)self->_bookmark copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_size;
    *(unsigned char *)(v5 + 48) |= 1u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  contentKeyIdentifiers = self->_contentKeyIdentifiers;
  uint64_t v7 = [(NSMutableArray *)contentKeyIdentifiers countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(contentKeyIdentifiers);
        }
        long long v11 = (void *)[*(id *)(*((void *)&v13 + 1) + 8 * v10) copyWithZone:a3];
        [(id)v5 addContentKeyIdentifiers:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)contentKeyIdentifiers countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    identifier = self->_identifier;
    if (!((unint64_t)identifier | *((void *)a3 + 4))
      || (int v5 = -[NSString isEqual:](identifier, "isEqual:")) != 0)
    {
      remoteURL = self->_remoteURL;
      if (!((unint64_t)remoteURL | *((void *)a3 + 5))
        || (int v5 = -[NSString isEqual:](remoteURL, "isEqual:")) != 0)
      {
        bookmark = self->_bookmark;
        if (!((unint64_t)bookmark | *((void *)a3 + 2)) || (int v5 = -[NSData isEqual:](bookmark, "isEqual:")) != 0)
        {
          if (*(unsigned char *)&self->_has)
          {
            if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_size != *((void *)a3 + 1)) {
              goto LABEL_15;
            }
          }
          else if (*((unsigned char *)a3 + 48))
          {
LABEL_15:
            LOBYTE(v5) = 0;
            return v5;
          }
          contentKeyIdentifiers = self->_contentKeyIdentifiers;
          if ((unint64_t)contentKeyIdentifiers | *((void *)a3 + 3))
          {
            LOBYTE(v5) = -[NSMutableArray isEqual:](contentKeyIdentifiers, "isEqual:");
          }
          else
          {
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_identifier hash];
  NSUInteger v4 = [(NSString *)self->_remoteURL hash];
  uint64_t v5 = [(NSData *)self->_bookmark hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_size;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ [(NSMutableArray *)self->_contentKeyIdentifiers hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  if (*((void *)a3 + 4)) {
    -[NTPBAVAsset setIdentifier:](self, "setIdentifier:");
  }
  if (*((void *)a3 + 5)) {
    -[NTPBAVAsset setRemoteURL:](self, "setRemoteURL:");
  }
  if (*((void *)a3 + 2)) {
    -[NTPBAVAsset setBookmark:](self, "setBookmark:");
  }
  if (*((unsigned char *)a3 + 48))
  {
    self->_size = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  uint64_t v5 = (void *)*((void *)a3 + 3);
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
        [(NTPBAVAsset *)self addContentKeyIdentifiers:*(void *)(*((void *)&v10 + 1) + 8 * i)];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)remoteURL
{
  return self->_remoteURL;
}

- (void)setRemoteURL:(id)a3
{
}

- (NSData)bookmark
{
  return self->_bookmark;
}

- (void)setBookmark:(id)a3
{
}

- (unint64_t)size
{
  return self->_size;
}

- (NSMutableArray)contentKeyIdentifiers
{
  return self->_contentKeyIdentifiers;
}

- (void)setContentKeyIdentifiers:(id)a3
{
}

@end
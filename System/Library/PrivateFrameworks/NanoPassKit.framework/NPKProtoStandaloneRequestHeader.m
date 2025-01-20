@interface NPKProtoStandaloneRequestHeader
+ (Class)cachedHeroImagesType;
- (BOOL)hasSessionIdentifier;
- (BOOL)hasStepIdentifier;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)cachedHeroImages;
- (NSString)sessionIdentifier;
- (NSString)stepIdentifier;
- (id)cachedHeroImagesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)protocolVersionAsString:(int)a3;
- (int)StringAsProtocolVersion:(id)a3;
- (int)protocolVersion;
- (unint64_t)cachedHeroImagesCount;
- (unint64_t)hash;
- (void)addCachedHeroImages:(id)a3;
- (void)clearCachedHeroImages;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCachedHeroImages:(id)a3;
- (void)setProtocolVersion:(int)a3;
- (void)setSessionIdentifier:(id)a3;
- (void)setStepIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandaloneRequestHeader

- (id)protocolVersionAsString:(int)a3
{
  if (a3 == 1)
  {
    v4 = @"Version1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int)StringAsProtocolVersion:(id)a3
{
  return 1;
}

- (BOOL)hasSessionIdentifier
{
  return self->_sessionIdentifier != 0;
}

- (BOOL)hasStepIdentifier
{
  return self->_stepIdentifier != 0;
}

- (void)clearCachedHeroImages
{
}

- (void)addCachedHeroImages:(id)a3
{
  id v4 = a3;
  cachedHeroImages = self->_cachedHeroImages;
  id v8 = v4;
  if (!cachedHeroImages)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_cachedHeroImages;
    self->_cachedHeroImages = v6;

    id v4 = v8;
    cachedHeroImages = self->_cachedHeroImages;
  }
  [(NSMutableArray *)cachedHeroImages addObject:v4];
}

- (unint64_t)cachedHeroImagesCount
{
  return [(NSMutableArray *)self->_cachedHeroImages count];
}

- (id)cachedHeroImagesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_cachedHeroImages objectAtIndex:a3];
}

+ (Class)cachedHeroImagesType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneRequestHeader;
  id v4 = [(NPKProtoStandaloneRequestHeader *)&v8 description];
  v5 = [(NPKProtoStandaloneRequestHeader *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  uint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (self->_protocolVersion == 1)
  {
    id v4 = @"Version1";
  }
  else
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_protocolVersion);
    id v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  [v3 setObject:v4 forKey:@"protocolVersion"];

  sessionIdentifier = self->_sessionIdentifier;
  if (sessionIdentifier) {
    [v3 setObject:sessionIdentifier forKey:@"sessionIdentifier"];
  }
  stepIdentifier = self->_stepIdentifier;
  if (stepIdentifier) {
    [v3 setObject:stepIdentifier forKey:@"stepIdentifier"];
  }
  if ([(NSMutableArray *)self->_cachedHeroImages count])
  {
    v7 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_cachedHeroImages, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    objc_super v8 = self->_cachedHeroImages;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v15 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [v3 setObject:v7 forKey:@"cachedHeroImages"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneRequestHeaderReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_sessionIdentifier) {
    PBDataWriterWriteStringField();
  }
  if (self->_stepIdentifier) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_cachedHeroImages;
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
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  v8[4] = self->_protocolVersion;
  if (self->_sessionIdentifier) {
    objc_msgSend(v8, "setSessionIdentifier:");
  }
  if (self->_stepIdentifier) {
    objc_msgSend(v8, "setStepIdentifier:");
  }
  if ([(NPKProtoStandaloneRequestHeader *)self cachedHeroImagesCount])
  {
    [v8 clearCachedHeroImages];
    unint64_t v4 = [(NPKProtoStandaloneRequestHeader *)self cachedHeroImagesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoStandaloneRequestHeader *)self cachedHeroImagesAtIndex:i];
        [v8 addCachedHeroImages:v7];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 16) = self->_protocolVersion;
  uint64_t v6 = [(NSString *)self->_sessionIdentifier copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  uint64_t v8 = [(NSString *)self->_stepIdentifier copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_cachedHeroImages;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v14), "copyWithZone:", a3, (void)v17);
        [(id)v5 addCachedHeroImages:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_protocolVersion == *((_DWORD *)v4 + 4)
    && ((sessionIdentifier = self->_sessionIdentifier, !((unint64_t)sessionIdentifier | v4[3]))
     || -[NSString isEqual:](sessionIdentifier, "isEqual:"))
    && ((stepIdentifier = self->_stepIdentifier, !((unint64_t)stepIdentifier | v4[4]))
     || -[NSString isEqual:](stepIdentifier, "isEqual:")))
  {
    cachedHeroImages = self->_cachedHeroImages;
    if ((unint64_t)cachedHeroImages | v4[1]) {
      char v8 = -[NSMutableArray isEqual:](cachedHeroImages, "isEqual:");
    }
    else {
      char v8 = 1;
    }
  }
  else
  {
    char v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_protocolVersion;
  NSUInteger v4 = [(NSString *)self->_sessionIdentifier hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_stepIdentifier hash];
  return v5 ^ [(NSMutableArray *)self->_cachedHeroImages hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  self->_protocolVersion = *((_DWORD *)v4 + 4);
  if (*((void *)v4 + 3)) {
    -[NPKProtoStandaloneRequestHeader setSessionIdentifier:](self, "setSessionIdentifier:");
  }
  if (*((void *)v4 + 4)) {
    -[NPKProtoStandaloneRequestHeader setStepIdentifier:](self, "setStepIdentifier:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 1);
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
        -[NPKProtoStandaloneRequestHeader addCachedHeroImages:](self, "addCachedHeroImages:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (int)protocolVersion
{
  return self->_protocolVersion;
}

- (void)setProtocolVersion:(int)a3
{
  self->_protocolVersion = a3;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (void)setSessionIdentifier:(id)a3
{
}

- (NSString)stepIdentifier
{
  return self->_stepIdentifier;
}

- (void)setStepIdentifier:(id)a3
{
}

- (NSMutableArray)cachedHeroImages
{
  return self->_cachedHeroImages;
}

- (void)setCachedHeroImages:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepIdentifier, 0);
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_cachedHeroImages, 0);
}

@end
@interface NTPBUrlMappingMiss
+ (Class)pathsType;
- (BOOL)hasHost;
- (BOOL)hasUrl;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)paths;
- (NSString)host;
- (NSString)url;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)pathsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)pathsCount;
- (void)addPaths:(id)a3;
- (void)clearPaths;
- (void)mergeFrom:(id)a3;
- (void)setHost:(id)a3;
- (void)setPaths:(id)a3;
- (void)setUrl:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NTPBUrlMappingMiss

- (BOOL)hasUrl
{
  return self->_url != 0;
}

- (BOOL)hasHost
{
  return self->_host != 0;
}

- (void)clearPaths
{
}

- (void)addPaths:(id)a3
{
  id v4 = a3;
  paths = self->_paths;
  id v8 = v4;
  if (!paths)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_paths;
    self->_paths = v6;

    id v4 = v8;
    paths = self->_paths;
  }
  [(NSMutableArray *)paths addObject:v4];
}

- (unint64_t)pathsCount
{
  return [(NSMutableArray *)self->_paths count];
}

- (id)pathsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_paths objectAtIndex:a3];
}

+ (Class)pathsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NTPBUrlMappingMiss;
  id v4 = [(NTPBUrlMappingMiss *)&v8 description];
  v5 = [(NTPBUrlMappingMiss *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  url = self->_url;
  if (url) {
    [v3 setObject:url forKey:@"url"];
  }
  host = self->_host;
  if (host) {
    [v4 setObject:host forKey:@"host"];
  }
  paths = self->_paths;
  if (paths) {
    [v4 setObject:paths forKey:@"paths"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NTPBUrlMappingMissReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (self->_url) {
    PBDataWriterWriteStringField();
  }
  if (self->_host) {
    PBDataWriterWriteStringField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_paths;
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
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_url copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  uint64_t v8 = [(NSString *)self->_host copyWithZone:a3];
  uint64_t v9 = (void *)v5[1];
  v5[1] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v10 = self->_paths;
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
        [v5 addPaths:v15];

        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((url = self->_url, !((unint64_t)url | v4[3])) || -[NSString isEqual:](url, "isEqual:"))
    && ((host = self->_host, !((unint64_t)host | v4[1])) || -[NSString isEqual:](host, "isEqual:")))
  {
    paths = self->_paths;
    if ((unint64_t)paths | v4[2]) {
      char v8 = -[NSMutableArray isEqual:](paths, "isEqual:");
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
  NSUInteger v3 = [(NSString *)self->_url hash];
  NSUInteger v4 = [(NSString *)self->_host hash] ^ v3;
  return v4 ^ [(NSMutableArray *)self->_paths hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*((void *)v4 + 3)) {
    -[NTPBUrlMappingMiss setUrl:](self, "setUrl:");
  }
  if (*((void *)v4 + 1)) {
    -[NTPBUrlMappingMiss setHost:](self, "setHost:");
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v5 = *((id *)v4 + 2);
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
        -[NTPBUrlMappingMiss addPaths:](self, "addPaths:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (NSString)url
{
  return self->_url;
}

- (void)setUrl:(id)a3
{
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSMutableArray)paths
{
  return self->_paths;
}

- (void)setPaths:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_paths, 0);

  objc_storeStrong((id *)&self->_host, 0);
}

@end
@interface NPKProtoReserveStorageForAppletTypesRequest
+ (Class)appletTypesType;
- (BOOL)hasMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)metadata;
- (NSMutableArray)appletTypes;
- (id)appletTypesAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)appletTypesCount;
- (unint64_t)hash;
- (void)addAppletTypes:(id)a3;
- (void)clearAppletTypes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAppletTypes:(id)a3;
- (void)setMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoReserveStorageForAppletTypesRequest

- (void)clearAppletTypes
{
}

- (void)addAppletTypes:(id)a3
{
  id v4 = a3;
  appletTypes = self->_appletTypes;
  id v8 = v4;
  if (!appletTypes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_appletTypes;
    self->_appletTypes = v6;

    id v4 = v8;
    appletTypes = self->_appletTypes;
  }
  [(NSMutableArray *)appletTypes addObject:v4];
}

- (unint64_t)appletTypesCount
{
  return [(NSMutableArray *)self->_appletTypes count];
}

- (id)appletTypesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_appletTypes objectAtIndex:a3];
}

+ (Class)appletTypesType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasMetadata
{
  return self->_metadata != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoReserveStorageForAppletTypesRequest;
  id v4 = [(NPKProtoReserveStorageForAppletTypesRequest *)&v8 description];
  v5 = [(NPKProtoReserveStorageForAppletTypesRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  appletTypes = self->_appletTypes;
  if (appletTypes) {
    [v3 setObject:appletTypes forKey:@"appletTypes"];
  }
  metadata = self->_metadata;
  if (metadata) {
    [v4 setObject:metadata forKey:@"metadata"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoReserveStorageForAppletTypesRequestReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_appletTypes;
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

  if (self->_metadata) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v8 = a3;
  if ([(NPKProtoReserveStorageForAppletTypesRequest *)self appletTypesCount])
  {
    [v8 clearAppletTypes];
    unint64_t v4 = [(NPKProtoReserveStorageForAppletTypesRequest *)self appletTypesCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoReserveStorageForAppletTypesRequest *)self appletTypesAtIndex:i];
        [v8 addAppletTypes:v7];
      }
    }
  }
  if (self->_metadata) {
    objc_msgSend(v8, "setMetadata:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = self->_appletTypes;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v10), "copyWithZone:", a3, (void)v15);
        [v5 addAppletTypes:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_metadata copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((appletTypes = self->_appletTypes, !((unint64_t)appletTypes | v4[1]))
     || -[NSMutableArray isEqual:](appletTypes, "isEqual:")))
  {
    metadata = self->_metadata;
    if ((unint64_t)metadata | v4[2]) {
      char v7 = -[NSData isEqual:](metadata, "isEqual:");
    }
    else {
      char v7 = 1;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_appletTypes hash];
  return [(NSData *)self->_metadata hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  unint64_t v4 = (id *)a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = v4[1];
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
        -[NPKProtoReserveStorageForAppletTypesRequest addAppletTypes:](self, "addAppletTypes:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[NPKProtoReserveStorageForAppletTypesRequest setMetadata:](self, "setMetadata:");
  }
}

- (NSMutableArray)appletTypes
{
  return self->_appletTypes;
}

- (void)setAppletTypes:(id)a3
{
}

- (NSData)metadata
{
  return self->_metadata;
}

- (void)setMetadata:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_appletTypes, 0);
}

@end
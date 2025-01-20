@interface VGChargingNetworksStorage
+ (Class)networksType;
- (BOOL)hasUsesPreferredNetworksForRouting;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)usesPreferredNetworksForRouting;
- (NSMutableArray)networks;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)networksAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)networksCount;
- (void)addNetworks:(id)a3;
- (void)clearNetworks;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasUsesPreferredNetworksForRouting:(BOOL)a3;
- (void)setNetworks:(id)a3;
- (void)setUsesPreferredNetworksForRouting:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation VGChargingNetworksStorage

- (void)clearNetworks
{
}

- (void)addNetworks:(id)a3
{
  id v4 = a3;
  networks = self->_networks;
  id v8 = v4;
  if (!networks)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_networks;
    self->_networks = v6;

    id v4 = v8;
    networks = self->_networks;
  }
  [(NSMutableArray *)networks addObject:v4];
}

- (unint64_t)networksCount
{
  return [(NSMutableArray *)self->_networks count];
}

- (id)networksAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_networks objectAtIndex:a3];
}

+ (Class)networksType
{
  return (Class)objc_opt_class();
}

- (void)setUsesPreferredNetworksForRouting:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_usesPreferredNetworksForRouting = a3;
}

- (void)setHasUsesPreferredNetworksForRouting:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUsesPreferredNetworksForRouting
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)VGChargingNetworksStorage;
  id v4 = [(VGChargingNetworksStorage *)&v8 description];
  v5 = [(VGChargingNetworksStorage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSMutableArray *)self->_networks count])
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_networks, "count"));
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    v5 = self->_networks;
    uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v14 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "dictionaryRepresentation", (void)v13);
          [v4 addObject:v10];
        }
        uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKey:@"networks"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v11 = [NSNumber numberWithBool:self->_usesPreferredNetworksForRouting];
    [v3 setObject:v11 forKey:@"usesPreferredNetworksForRouting"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return VGChargingNetworksStorageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_networks;
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

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
}

- (void)copyTo:(id)a3
{
  uint64_t v8 = a3;
  if ([(VGChargingNetworksStorage *)self networksCount])
  {
    [v8 clearNetworks];
    unint64_t v4 = [(VGChargingNetworksStorage *)self networksCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(VGChargingNetworksStorage *)self networksAtIndex:i];
        [v8 addNetworks:v7];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[16] = self->_usesPreferredNetworksForRouting;
    v8[20] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_networks;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "copyWithZone:", a3, (void)v13);
        [v5 addNetworks:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  if (*(unsigned char *)&self->_has)
  {
    v5[16] = self->_usesPreferredNetworksForRouting;
    v5[20] |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_6;
  }
  networks = self->_networks;
  if ((unint64_t)networks | *((void *)v4 + 1))
  {
    if (!-[NSMutableArray isEqual:](networks, "isEqual:")) {
      goto LABEL_6;
    }
  }
  BOOL v6 = (*((unsigned char *)v4 + 20) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 20) & 1) == 0)
    {
LABEL_6:
      BOOL v6 = 0;
      goto LABEL_7;
    }
    if (self->_usesPreferredNetworksForRouting)
    {
      if (!*((unsigned char *)v4 + 16)) {
        goto LABEL_6;
      }
    }
    else if (*((unsigned char *)v4 + 16))
    {
      goto LABEL_6;
    }
    BOOL v6 = 1;
  }
LABEL_7:

  return v6;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSMutableArray *)self->_networks hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_usesPreferredNetworksForRouting;
  }
  else {
    uint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = *((id *)v4 + 1);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
        -[VGChargingNetworksStorage addNetworks:](self, "addNetworks:", *(void *)(*((void *)&v10 + 1) + 8 * v9++), (void)v10);
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 20))
  {
    self->_usesPreferredNetworksForRouting = *((unsigned char *)v4 + 16);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSMutableArray)networks
{
  return self->_networks;
}

- (void)setNetworks:(id)a3
{
}

- (BOOL)usesPreferredNetworksForRouting
{
  return self->_usesPreferredNetworksForRouting;
}

- (void).cxx_destruct
{
}

@end
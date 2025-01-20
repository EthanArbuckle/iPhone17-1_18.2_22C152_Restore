@interface PeoplePredictionDataMLSEVirtualFeatureStore
+ (Class)featureVectorType;
- (BOOL)hasDeviceIdentifier;
- (BOOL)hasFeatureVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)featureVectors;
- (NSString)deviceIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)featureVectorAtIndex:(unint64_t)a3;
- (unint64_t)featureVectorsCount;
- (unint64_t)hash;
- (unsigned)featureVersion;
- (void)addFeatureVector:(id)a3;
- (void)clearFeatureVectors;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceIdentifier:(id)a3;
- (void)setFeatureVectors:(id)a3;
- (void)setFeatureVersion:(unsigned int)a3;
- (void)setHasFeatureVersion:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PeoplePredictionDataMLSEVirtualFeatureStore

- (void)setFeatureVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_featureVersion = a3;
}

- (void)setHasFeatureVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasFeatureVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)clearFeatureVectors
{
}

- (void)addFeatureVector:(id)a3
{
  id v4 = a3;
  featureVectors = self->_featureVectors;
  id v8 = v4;
  if (!featureVectors)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_featureVectors;
    self->_featureVectors = v6;

    id v4 = v8;
    featureVectors = self->_featureVectors;
  }
  [(NSMutableArray *)featureVectors addObject:v4];
}

- (unint64_t)featureVectorsCount
{
  return [(NSMutableArray *)self->_featureVectors count];
}

- (id)featureVectorAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_featureVectors objectAtIndex:a3];
}

+ (Class)featureVectorType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasDeviceIdentifier
{
  return self->_deviceIdentifier != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PeoplePredictionDataMLSEVirtualFeatureStore;
  id v4 = [(PeoplePredictionDataMLSEVirtualFeatureStore *)&v8 description];
  v5 = [(PeoplePredictionDataMLSEVirtualFeatureStore *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if (*(unsigned char *)&self->_has)
  {
    id v4 = [NSNumber numberWithUnsignedInt:self->_featureVersion];
    [v3 setObject:v4 forKey:@"featureVersion"];
  }
  if ([(NSMutableArray *)self->_featureVectors count])
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", -[NSMutableArray count](self->_featureVectors, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = self->_featureVectors;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          v11 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation", (void)v14);
          [v5 addObject:v11];
        }
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    [v3 setObject:v5 forKey:@"featureVector"];
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier) {
    [v3 setObject:deviceIdentifier forKey:@"deviceIdentifier"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return PeoplePredictionDataMLSEVirtualFeatureStoreReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_featureVectors;
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

  if (self->_deviceIdentifier) {
    PBDataWriterWriteStringField();
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if (*(unsigned char *)&self->_has)
  {
    v4[6] = self->_featureVersion;
    *((unsigned char *)v4 + 28) |= 1u;
  }
  id v9 = v4;
  if ([(PeoplePredictionDataMLSEVirtualFeatureStore *)self featureVectorsCount])
  {
    [v9 clearFeatureVectors];
    unint64_t v5 = [(PeoplePredictionDataMLSEVirtualFeatureStore *)self featureVectorsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PeoplePredictionDataMLSEVirtualFeatureStore *)self featureVectorAtIndex:i];
        [v9 addFeatureVector:v8];
      }
    }
  }
  if (self->_deviceIdentifier) {
    objc_msgSend(v9, "setDeviceIdentifier:");
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = (void *)v5;
  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_featureVersion;
    *(unsigned char *)(v5 + 28) |= 1u;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = self->_featureVectors;
  uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v11), "copyWithZone:", a3, (void)v16);
        [v6 addFeatureVector:v12];

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }

  uint64_t v13 = [(NSString *)self->_deviceIdentifier copyWithZone:a3];
  long long v14 = (void *)v6[1];
  v6[1] = v13;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_11;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 28) & 1) == 0 || self->_featureVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_11;
    }
  }
  else if (*((unsigned char *)v4 + 28))
  {
LABEL_11:
    char v7 = 0;
    goto LABEL_12;
  }
  featureVectors = self->_featureVectors;
  if ((unint64_t)featureVectors | *((void *)v4 + 2)
    && !-[NSMutableArray isEqual:](featureVectors, "isEqual:"))
  {
    goto LABEL_11;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((void *)v4 + 1)) {
    char v7 = -[NSString isEqual:](deviceIdentifier, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_12:

  return v7;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_featureVersion;
  }
  else {
    uint64_t v3 = 0;
  }
  uint64_t v4 = [(NSMutableArray *)self->_featureVectors hash] ^ v3;
  return v4 ^ [(NSString *)self->_deviceIdentifier hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  uint64_t v5 = v4;
  if (*((unsigned char *)v4 + 28))
  {
    self->_featureVersion = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v6 = *((id *)v4 + 2);
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        -[PeoplePredictionDataMLSEVirtualFeatureStore addFeatureVector:](self, "addFeatureVector:", *(void *)(*((void *)&v11 + 1) + 8 * i), (void)v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if (v5[1]) {
    -[PeoplePredictionDataMLSEVirtualFeatureStore setDeviceIdentifier:](self, "setDeviceIdentifier:");
  }
}

- (unsigned)featureVersion
{
  return self->_featureVersion;
}

- (NSMutableArray)featureVectors
{
  return self->_featureVectors;
}

- (void)setFeatureVectors:(id)a3
{
}

- (NSString)deviceIdentifier
{
  return self->_deviceIdentifier;
}

- (void)setDeviceIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_featureVectors, 0);

  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
}

@end
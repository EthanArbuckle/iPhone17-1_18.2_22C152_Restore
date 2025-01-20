@interface PKProtobufPaymentDeviceRequest
+ (Class)knownManifestHashesType;
- (BOOL)hasDeviceName;
- (BOOL)hasProtocolVersion;
- (BOOL)hasShouldAdvertise;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)shouldAdvertise;
- (Class)responseClass;
- (NSMutableArray)knownManifestHashes;
- (NSString)deviceName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)knownManifestHashesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)knownManifestHashesCount;
- (unsigned)protocolVersion;
- (unsigned)requestTypeCode;
- (void)addKnownManifestHashes:(id)a3;
- (void)clearKnownManifestHashes;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHasProtocolVersion:(BOOL)a3;
- (void)setHasShouldAdvertise:(BOOL)a3;
- (void)setKnownManifestHashes:(id)a3;
- (void)setProtocolVersion:(unsigned int)a3;
- (void)setShouldAdvertise:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation PKProtobufPaymentDeviceRequest

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (void)setShouldAdvertise:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_shouldAdvertise = a3;
}

- (void)setHasShouldAdvertise:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShouldAdvertise
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearKnownManifestHashes
{
}

- (void)addKnownManifestHashes:(id)a3
{
  id v4 = a3;
  knownManifestHashes = self->_knownManifestHashes;
  id v8 = v4;
  if (!knownManifestHashes)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_knownManifestHashes;
    self->_knownManifestHashes = v6;

    id v4 = v8;
    knownManifestHashes = self->_knownManifestHashes;
  }
  [(NSMutableArray *)knownManifestHashes addObject:v4];
}

- (unint64_t)knownManifestHashesCount
{
  return [(NSMutableArray *)self->_knownManifestHashes count];
}

- (id)knownManifestHashesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_knownManifestHashes objectAtIndex:a3];
}

+ (Class)knownManifestHashesType
{
  return (Class)objc_opt_class();
}

- (void)setProtocolVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_protocolVersion = a3;
}

- (void)setHasProtocolVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasProtocolVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)PKProtobufPaymentDeviceRequest;
  id v4 = [(PKProtobufPaymentDeviceRequest *)&v8 description];
  v5 = [(PKProtobufPaymentDeviceRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_shouldAdvertise];
    [v4 setObject:v6 forKey:@"shouldAdvertise"];
  }
  knownManifestHashes = self->_knownManifestHashes;
  if (knownManifestHashes) {
    [v4 setObject:knownManifestHashes forKey:@"knownManifestHashes"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithUnsignedInt:self->_protocolVersion];
    [v4 setObject:v8 forKey:@"protocolVersion"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return PKProtobufPaymentDeviceRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v5 = self->_knownManifestHashes;
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
        PBDataWriterWriteDataField();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
}

- (unsigned)requestTypeCode
{
  return 1;
}

- (Class)responseClass
{
  return (Class)objc_opt_class();
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  uint64_t v9 = v4;
  if (self->_deviceName)
  {
    objc_msgSend(v4, "setDeviceName:");
    id v4 = v9;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[28] = self->_shouldAdvertise;
    v4[32] |= 2u;
  }
  if ([(PKProtobufPaymentDeviceRequest *)self knownManifestHashesCount])
  {
    [v9 clearKnownManifestHashes];
    unint64_t v5 = [(PKProtobufPaymentDeviceRequest *)self knownManifestHashesCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
      {
        uint64_t v8 = [(PKProtobufPaymentDeviceRequest *)self knownManifestHashesAtIndex:i];
        [v9 addKnownManifestHashes:v8];
      }
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v9 + 6) = self->_protocolVersion;
    v9[32] |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_deviceName copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v6;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(unsigned char *)(v5 + 28) = self->_shouldAdvertise;
    *(unsigned char *)(v5 + 32) |= 2u;
  }
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = self->_knownManifestHashes;
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
        long long v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "copyWithZone:", a3, (void)v15);
        [(id)v5 addKnownManifestHashes:v13];
      }
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v10);
  }

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 24) = self->_protocolVersion;
    *(unsigned char *)(v5 + 32) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  deviceName = self->_deviceName;
  if ((unint64_t)deviceName | *((void *)v4 + 1))
  {
    if (!-[NSString isEqual:](deviceName, "isEqual:")) {
      goto LABEL_19;
    }
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 32);
  if ((has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 32) & 2) == 0) {
      goto LABEL_19;
    }
    if (self->_shouldAdvertise)
    {
      if (!*((unsigned char *)v4 + 28)) {
        goto LABEL_19;
      }
    }
    else if (*((unsigned char *)v4 + 28))
    {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    goto LABEL_19;
  }
  knownManifestHashes = self->_knownManifestHashes;
  if (!((unint64_t)knownManifestHashes | *((void *)v4 + 2))) {
    goto LABEL_15;
  }
  if (!-[NSMutableArray isEqual:](knownManifestHashes, "isEqual:"))
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  char has = (char)self->_has;
  char v7 = *((unsigned char *)v4 + 32);
LABEL_15:
  BOOL v9 = (v7 & 1) == 0;
  if (has)
  {
    if ((v7 & 1) == 0 || self->_protocolVersion != *((_DWORD *)v4 + 6)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceName hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v4 = 2654435761 * self->_shouldAdvertise;
  }
  else {
    uint64_t v4 = 0;
  }
  uint64_t v5 = [(NSMutableArray *)self->_knownManifestHashes hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_protocolVersion;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[PKProtobufPaymentDeviceRequest setDeviceName:](self, "setDeviceName:");
  }
  if ((*((unsigned char *)v4 + 32) & 2) != 0)
  {
    self->_shouldAdvertise = *((unsigned char *)v4 + 28);
    *(unsigned char *)&self->_has |= 2u;
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
        -[PKProtobufPaymentDeviceRequest addKnownManifestHashes:](self, "addKnownManifestHashes:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (*((unsigned char *)v4 + 32))
  {
    self->_protocolVersion = *((_DWORD *)v4 + 6);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (BOOL)shouldAdvertise
{
  return self->_shouldAdvertise;
}

- (NSMutableArray)knownManifestHashes
{
  return self->_knownManifestHashes;
}

- (void)setKnownManifestHashes:(id)a3
{
}

- (unsigned)protocolVersion
{
  return self->_protocolVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownManifestHashes, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
}

@end
@interface NGMPBDevicePreKey
- (BOOL)hasDhKey;
- (BOOL)hasTetraPrivateKey;
- (BOOL)hasTetraRegistrationData;
- (BOOL)hasTetraVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NGMPBP256Key)dhKey;
- (NSData)prekeySignature;
- (NSData)tetraPrivateKey;
- (NSData)tetraRegistrationData;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unsigned)tetraVersion;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDhKey:(id)a3;
- (void)setHasTetraVersion:(BOOL)a3;
- (void)setPrekeySignature:(id)a3;
- (void)setTetraPrivateKey:(id)a3;
- (void)setTetraRegistrationData:(id)a3;
- (void)setTetraVersion:(unsigned int)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NGMPBDevicePreKey

- (BOOL)hasDhKey
{
  return self->_dhKey != 0;
}

- (BOOL)hasTetraPrivateKey
{
  return self->_tetraPrivateKey != 0;
}

- (BOOL)hasTetraRegistrationData
{
  return self->_tetraRegistrationData != 0;
}

- (void)setTetraVersion:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_tetraVersion = a3;
}

- (void)setHasTetraVersion:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTetraVersion
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NGMPBDevicePreKey;
  v4 = [(NGMPBDevicePreKey *)&v8 description];
  v5 = [(NGMPBDevicePreKey *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  dhKey = self->_dhKey;
  if (dhKey)
  {
    v5 = [(NGMPBP256Key *)dhKey dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"dhKey"];
  }
  v6 = [NSNumber numberWithDouble:self->_timestamp];
  [v3 setObject:v6 forKey:@"timestamp"];

  prekeySignature = self->_prekeySignature;
  if (prekeySignature) {
    [v3 setObject:prekeySignature forKey:@"prekeySignature"];
  }
  tetraPrivateKey = self->_tetraPrivateKey;
  if (tetraPrivateKey) {
    [v3 setObject:tetraPrivateKey forKey:@"tetraPrivateKey"];
  }
  tetraRegistrationData = self->_tetraRegistrationData;
  if (tetraRegistrationData) {
    [v3 setObject:tetraRegistrationData forKey:@"tetraRegistrationData"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = [NSNumber numberWithUnsignedInt:self->_tetraVersion];
    [v3 setObject:v10 forKey:@"tetraVersion"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBDevicePreKeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  if (self->_dhKey) {
    PBDataWriterWriteSubmessage();
  }
  PBDataWriterWriteDoubleField();
  if (!self->_prekeySignature) {
    -[NGMPBDevicePreKey writeTo:]();
  }
  PBDataWriterWriteDataField();
  if (self->_tetraPrivateKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_tetraRegistrationData) {
    PBDataWriterWriteDataField();
  }
  v4 = v5;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint32Field();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = (double *)a3;
  id v5 = v4;
  if (self->_dhKey)
  {
    objc_msgSend(v4, "setDhKey:");
    v4 = v5;
  }
  v4[1] = self->_timestamp;
  [v4 setPrekeySignature:self->_prekeySignature];
  if (self->_tetraPrivateKey) {
    objc_msgSend(v5, "setTetraPrivateKey:");
  }
  if (self->_tetraRegistrationData) {
    objc_msgSend(v5, "setTetraRegistrationData:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((_DWORD *)v5 + 12) = self->_tetraVersion;
    *((unsigned char *)v5 + 52) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NGMPBP256Key *)self->_dhKey copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  *(double *)(v5 + 8) = self->_timestamp;
  uint64_t v8 = [(NSData *)self->_prekeySignature copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  uint64_t v10 = [(NSData *)self->_tetraPrivateKey copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSData *)self->_tetraRegistrationData copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  if (*(unsigned char *)&self->_has)
  {
    *(_DWORD *)(v5 + 48) = self->_tetraVersion;
    *(unsigned char *)(v5 + 52) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  dhKey = self->_dhKey;
  if ((unint64_t)dhKey | *((void *)v4 + 2))
  {
    if (!-[NGMPBP256Key isEqual:](dhKey, "isEqual:")) {
      goto LABEL_15;
    }
  }
  if (self->_timestamp != *((double *)v4 + 1)) {
    goto LABEL_15;
  }
  prekeySignature = self->_prekeySignature;
  if ((unint64_t)prekeySignature | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](prekeySignature, "isEqual:")) {
      goto LABEL_15;
    }
  }
  tetraPrivateKey = self->_tetraPrivateKey;
  if ((unint64_t)tetraPrivateKey | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](tetraPrivateKey, "isEqual:")) {
      goto LABEL_15;
    }
  }
  tetraRegistrationData = self->_tetraRegistrationData;
  if ((unint64_t)tetraRegistrationData | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](tetraRegistrationData, "isEqual:")) {
      goto LABEL_15;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 52) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 52) & 1) != 0 && self->_tetraVersion == *((_DWORD *)v4 + 12))
    {
      BOOL v9 = 1;
      goto LABEL_16;
    }
LABEL_15:
    BOOL v9 = 0;
  }
LABEL_16:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NGMPBP256Key *)self->_dhKey hash];
  double timestamp = self->_timestamp;
  double v5 = -timestamp;
  if (timestamp >= 0.0) {
    double v5 = self->_timestamp;
  }
  long double v6 = floor(v5 + 0.5);
  double v7 = (v5 - v6) * 1.84467441e19;
  double v8 = fmod(v6, 1.84467441e19);
  unint64_t v9 = 2654435761u * (unint64_t)v8;
  unint64_t v10 = v9 + (unint64_t)v7;
  if (v7 <= 0.0) {
    unint64_t v10 = 2654435761u * (unint64_t)v8;
  }
  unint64_t v11 = v9 - (unint64_t)fabs(v7);
  if (v7 < 0.0) {
    unint64_t v12 = v11;
  }
  else {
    unint64_t v12 = v10;
  }
  uint64_t v13 = [(NSData *)self->_prekeySignature hash];
  uint64_t v14 = [(NSData *)self->_tetraPrivateKey hash];
  uint64_t v15 = [(NSData *)self->_tetraRegistrationData hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v16 = 2654435761 * self->_tetraVersion;
  }
  else {
    uint64_t v16 = 0;
  }
  return v12 ^ v3 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  dhKey = self->_dhKey;
  uint64_t v6 = *((void *)v4 + 2);
  id v7 = v4;
  if (dhKey)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NGMPBP256Key mergeFrom:](dhKey, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NGMPBDevicePreKey setDhKey:](self, "setDhKey:");
  }
  id v4 = v7;
LABEL_7:
  self->_double timestamp = *((double *)v4 + 1);
  if (*((void *)v4 + 3))
  {
    -[NGMPBDevicePreKey setPrekeySignature:](self, "setPrekeySignature:");
    id v4 = v7;
  }
  if (*((void *)v4 + 4))
  {
    -[NGMPBDevicePreKey setTetraPrivateKey:](self, "setTetraPrivateKey:");
    id v4 = v7;
  }
  if (*((void *)v4 + 5))
  {
    -[NGMPBDevicePreKey setTetraRegistrationData:](self, "setTetraRegistrationData:");
    id v4 = v7;
  }
  if (*((unsigned char *)v4 + 52))
  {
    self->_tetraVersion = *((_DWORD *)v4 + 12);
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x270F9A758]();
}

- (NGMPBP256Key)dhKey
{
  return self->_dhKey;
}

- (void)setDhKey:(id)a3
{
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_double timestamp = a3;
}

- (NSData)prekeySignature
{
  return self->_prekeySignature;
}

- (void)setPrekeySignature:(id)a3
{
}

- (NSData)tetraPrivateKey
{
  return self->_tetraPrivateKey;
}

- (void)setTetraPrivateKey:(id)a3
{
}

- (NSData)tetraRegistrationData
{
  return self->_tetraRegistrationData;
}

- (void)setTetraRegistrationData:(id)a3
{
}

- (unsigned)tetraVersion
{
  return self->_tetraVersion;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tetraRegistrationData, 0);
  objc_storeStrong((id *)&self->_tetraPrivateKey, 0);
  objc_storeStrong((id *)&self->_prekeySignature, 0);
  objc_storeStrong((id *)&self->_dhKey, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBDevicePreKey writeTo:]", "NGMPBDevicePreKey.m", 173, "nil != self->_prekeySignature");
}

@end
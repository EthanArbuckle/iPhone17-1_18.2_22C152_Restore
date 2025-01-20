@interface NGMPBPublicDevicePrekey
- (BOOL)hasTetraPreKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)prekey;
- (NSData)prekeySignature;
- (NSData)tetraPreKey;
- (double)timestamp;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPrekey:(id)a3;
- (void)setPrekeySignature:(id)a3;
- (void)setTetraPreKey:(id)a3;
- (void)setTimestamp:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation NGMPBPublicDevicePrekey

- (BOOL)hasTetraPreKey
{
  return self->_tetraPreKey != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NGMPBPublicDevicePrekey;
  v4 = [(NGMPBPublicDevicePrekey *)&v8 description];
  v5 = [(NGMPBPublicDevicePrekey *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  prekey = self->_prekey;
  if (prekey) {
    [v3 setObject:prekey forKey:@"prekey"];
  }
  prekeySignature = self->_prekeySignature;
  if (prekeySignature) {
    [v4 setObject:prekeySignature forKey:@"prekeySignature"];
  }
  v7 = [NSNumber numberWithDouble:self->_timestamp];
  [v4 setObject:v7 forKey:@"timestamp"];

  tetraPreKey = self->_tetraPreKey;
  if (tetraPreKey) {
    [v4 setObject:tetraPreKey forKey:@"tetraPreKey"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBPublicDevicePrekeyReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_prekey) {
    -[NGMPBPublicDevicePrekey writeTo:]();
  }
  PBDataWriterWriteDataField();
  if (!self->_prekeySignature) {
    -[NGMPBPublicDevicePrekey writeTo:]();
  }
  PBDataWriterWriteDataField();
  PBDataWriterWriteDoubleField();
  if (self->_tetraPreKey) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  v5 = (double *)a3;
  [v5 setPrekey:self->_prekey];
  [v5 setPrekeySignature:self->_prekeySignature];
  id v4 = v5;
  v5[1] = self->_timestamp;
  if (self->_tetraPreKey)
  {
    objc_msgSend(v5, "setTetraPreKey:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_prekey copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSData *)self->_prekeySignature copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  *(double *)(v5 + 8) = self->_timestamp;
  uint64_t v10 = [(NSData *)self->_tetraPreKey copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((prekey = self->_prekey, !((unint64_t)prekey | v4[2]))
     || -[NSData isEqual:](prekey, "isEqual:"))
    && ((prekeySignature = self->_prekeySignature, !((unint64_t)prekeySignature | v4[3]))
     || -[NSData isEqual:](prekeySignature, "isEqual:"))
    && self->_timestamp == *((double *)v4 + 1))
  {
    tetraPreKey = self->_tetraPreKey;
    if ((unint64_t)tetraPreKey | v4[4]) {
      char v8 = -[NSData isEqual:](tetraPreKey, "isEqual:");
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
  uint64_t v3 = [(NSData *)self->_prekey hash];
  uint64_t v4 = [(NSData *)self->_prekeySignature hash];
  double timestamp = self->_timestamp;
  double v6 = -timestamp;
  if (timestamp >= 0.0) {
    double v6 = self->_timestamp;
  }
  long double v7 = floor(v6 + 0.5);
  double v8 = (v6 - v7) * 1.84467441e19;
  double v9 = fmod(v7, 1.84467441e19);
  unint64_t v10 = 2654435761u * (unint64_t)v9;
  unint64_t v11 = v10 + (unint64_t)v8;
  if (v8 <= 0.0) {
    unint64_t v11 = 2654435761u * (unint64_t)v9;
  }
  unint64_t v12 = v10 - (unint64_t)fabs(v8);
  if (v8 < 0.0) {
    unint64_t v13 = v12;
  }
  else {
    unint64_t v13 = v11;
  }
  return v4 ^ v3 ^ v13 ^ [(NSData *)self->_tetraPreKey hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 2)) {
    -[NGMPBPublicDevicePrekey setPrekey:](self, "setPrekey:");
  }
  if (*((void *)v4 + 3)) {
    -[NGMPBPublicDevicePrekey setPrekeySignature:](self, "setPrekeySignature:");
  }
  self->_double timestamp = *((double *)v4 + 1);
  if (*((void *)v4 + 4)) {
    -[NGMPBPublicDevicePrekey setTetraPreKey:](self, "setTetraPreKey:");
  }
}

- (NSData)prekey
{
  return self->_prekey;
}

- (void)setPrekey:(id)a3
{
}

- (NSData)prekeySignature
{
  return self->_prekeySignature;
}

- (void)setPrekeySignature:(id)a3
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

- (NSData)tetraPreKey
{
  return self->_tetraPreKey;
}

- (void)setTetraPreKey:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tetraPreKey, 0);
  objc_storeStrong((id *)&self->_prekeySignature, 0);
  objc_storeStrong((id *)&self->_prekey, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NGMPBPublicDevicePrekey writeTo:]", "NGMPBPublicDevicePrekey.m", 105, "nil != self->_prekey");
}

- (void)writeTo:.cold.2()
{
  __assert_rtn("-[NGMPBPublicDevicePrekey writeTo:]", "NGMPBPublicDevicePrekey.m", 110, "nil != self->_prekeySignature");
}

@end
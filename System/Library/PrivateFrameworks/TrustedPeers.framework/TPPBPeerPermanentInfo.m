@interface TPPBPeerPermanentInfo
- (BOOL)hasCreationTime;
- (BOOL)hasEncryptionPubKey;
- (BOOL)hasEpoch;
- (BOOL)hasMachineId;
- (BOOL)hasModelId;
- (BOOL)hasSigningPubKey;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionPubKey;
- (NSData)signingPubKey;
- (NSString)machineId;
- (NSString)modelId;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)creationTime;
- (unint64_t)epoch;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCreationTime:(unint64_t)a3;
- (void)setEncryptionPubKey:(id)a3;
- (void)setEpoch:(unint64_t)a3;
- (void)setHasCreationTime:(BOOL)a3;
- (void)setHasEpoch:(BOOL)a3;
- (void)setMachineId:(id)a3;
- (void)setModelId:(id)a3;
- (void)setSigningPubKey:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TPPBPeerPermanentInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signingPubKey, 0);
  objc_storeStrong((id *)&self->_modelId, 0);
  objc_storeStrong((id *)&self->_machineId, 0);
  objc_storeStrong((id *)&self->_encryptionPubKey, 0);
}

- (unint64_t)creationTime
{
  return self->_creationTime;
}

- (void)setModelId:(id)a3
{
}

- (NSString)modelId
{
  return self->_modelId;
}

- (void)setMachineId:(id)a3
{
}

- (NSString)machineId
{
  return self->_machineId;
}

- (void)setEncryptionPubKey:(id)a3
{
}

- (NSData)encryptionPubKey
{
  return self->_encryptionPubKey;
}

- (void)setSigningPubKey:(id)a3
{
}

- (NSData)signingPubKey
{
  return self->_signingPubKey;
}

- (unint64_t)epoch
{
  return self->_epoch;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  if ((v4[7] & 2) != 0)
  {
    self->_epoch = v4[2];
    *(unsigned char *)&self->_has |= 2u;
  }
  v5 = v4;
  if (v4[6])
  {
    -[TPPBPeerPermanentInfo setSigningPubKey:](self, "setSigningPubKey:");
    v4 = v5;
  }
  if (v4[3])
  {
    -[TPPBPeerPermanentInfo setEncryptionPubKey:](self, "setEncryptionPubKey:");
    v4 = v5;
  }
  if (v4[4])
  {
    -[TPPBPeerPermanentInfo setMachineId:](self, "setMachineId:");
    v4 = v5;
  }
  if (v4[5])
  {
    -[TPPBPeerPermanentInfo setModelId:](self, "setModelId:");
    v4 = v5;
  }
  if (v4[7])
  {
    self->_creationTime = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v3 = 2654435761u * self->_epoch;
  }
  else {
    unint64_t v3 = 0;
  }
  uint64_t v4 = [(NSData *)self->_signingPubKey hash];
  uint64_t v5 = [(NSData *)self->_encryptionPubKey hash];
  NSUInteger v6 = [(NSString *)self->_machineId hash];
  NSUInteger v7 = [(NSString *)self->_modelId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v8 = 2654435761u * self->_creationTime;
  }
  else {
    unint64_t v8 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 56) & 2) == 0 || self->_epoch != *((void *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if ((*((unsigned char *)v4 + 56) & 2) != 0)
  {
LABEL_19:
    BOOL v9 = 0;
    goto LABEL_20;
  }
  signingPubKey = self->_signingPubKey;
  if ((unint64_t)signingPubKey | *((void *)v4 + 6)
    && !-[NSData isEqual:](signingPubKey, "isEqual:"))
  {
    goto LABEL_19;
  }
  encryptionPubKey = self->_encryptionPubKey;
  if ((unint64_t)encryptionPubKey | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](encryptionPubKey, "isEqual:")) {
      goto LABEL_19;
    }
  }
  machineId = self->_machineId;
  if ((unint64_t)machineId | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](machineId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  modelId = self->_modelId;
  if ((unint64_t)modelId | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](modelId, "isEqual:")) {
      goto LABEL_19;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 56) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 56) & 1) == 0 || self->_creationTime != *((void *)v4 + 1)) {
      goto LABEL_19;
    }
    BOOL v9 = 1;
  }
LABEL_20:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_epoch;
    *(unsigned char *)(v5 + 56) |= 2u;
  }
  uint64_t v7 = [(NSData *)self->_signingPubKey copyWithZone:a3];
  unint64_t v8 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v7;

  uint64_t v9 = [(NSData *)self->_encryptionPubKey copyWithZone:a3];
  v10 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v9;

  uint64_t v11 = [(NSString *)self->_machineId copyWithZone:a3];
  v12 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v11;

  uint64_t v13 = [(NSString *)self->_modelId copyWithZone:a3];
  v14 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v13;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_creationTime;
    *(unsigned char *)(v6 + 56) |= 1u;
  }
  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v4[2] = self->_epoch;
    *((unsigned char *)v4 + 56) |= 2u;
  }
  uint64_t v5 = v4;
  if (self->_signingPubKey)
  {
    objc_msgSend(v4, "setSigningPubKey:");
    id v4 = v5;
  }
  if (self->_encryptionPubKey)
  {
    objc_msgSend(v5, "setEncryptionPubKey:");
    id v4 = v5;
  }
  if (self->_machineId)
  {
    objc_msgSend(v5, "setMachineId:");
    id v4 = v5;
  }
  if (self->_modelId)
  {
    objc_msgSend(v5, "setModelId:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    v4[1] = self->_creationTime;
    *((unsigned char *)v4 + 56) |= 1u;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  if (self->_signingPubKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_encryptionPubKey) {
    PBDataWriterWriteDataField();
  }
  if (self->_machineId) {
    PBDataWriterWriteStringField();
  }
  if (self->_modelId) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return TPPBPeerPermanentInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithUnsignedLongLong:self->_epoch];
    [v3 setObject:v4 forKey:@"epoch"];
  }
  signingPubKey = self->_signingPubKey;
  if (signingPubKey) {
    [v3 setObject:signingPubKey forKey:@"signing_pub_key"];
  }
  encryptionPubKey = self->_encryptionPubKey;
  if (encryptionPubKey) {
    [v3 setObject:encryptionPubKey forKey:@"encryption_pub_key"];
  }
  machineId = self->_machineId;
  if (machineId) {
    [v3 setObject:machineId forKey:@"machine_id"];
  }
  modelId = self->_modelId;
  if (modelId) {
    [v3 setObject:modelId forKey:@"model_id"];
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v9 = [NSNumber numberWithUnsignedLongLong:self->_creationTime];
    [v3 setObject:v9 forKey:@"creation_time"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TPPBPeerPermanentInfo;
  id v4 = [(TPPBPeerPermanentInfo *)&v8 description];
  uint64_t v5 = [(TPPBPeerPermanentInfo *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCreationTime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCreationTime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setCreationTime:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_creationTime = a3;
}

- (BOOL)hasModelId
{
  return self->_modelId != 0;
}

- (BOOL)hasMachineId
{
  return self->_machineId != 0;
}

- (BOOL)hasEncryptionPubKey
{
  return self->_encryptionPubKey != 0;
}

- (BOOL)hasSigningPubKey
{
  return self->_signingPubKey != 0;
}

- (BOOL)hasEpoch
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasEpoch:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setEpoch:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_epoch = a3;
}

@end
@interface NGMPBOuterMessage
- (BOOL)hasEncryptedPayload;
- (BOOL)hasEphemeralPubKey;
- (BOOL)hasKeyValidator;
- (BOOL)hasSignature;
- (BOOL)hasTetraMessage;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptedPayload;
- (NSData)ephemeralPubKey;
- (NSData)keyValidator;
- (NSData)signature;
- (NSData)tetraMessage;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setEncryptedPayload:(id)a3;
- (void)setEphemeralPubKey:(id)a3;
- (void)setKeyValidator:(id)a3;
- (void)setSignature:(id)a3;
- (void)setTetraMessage:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NGMPBOuterMessage

- (BOOL)hasEncryptedPayload
{
  return self->_encryptedPayload != 0;
}

- (BOOL)hasEphemeralPubKey
{
  return self->_ephemeralPubKey != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (BOOL)hasTetraMessage
{
  return self->_tetraMessage != 0;
}

- (BOOL)hasKeyValidator
{
  return self->_keyValidator != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NGMPBOuterMessage;
  v4 = [(NGMPBOuterMessage *)&v8 description];
  v5 = [(NGMPBOuterMessage *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  encryptedPayload = self->_encryptedPayload;
  if (encryptedPayload) {
    [v3 setObject:encryptedPayload forKey:@"encryptedPayload"];
  }
  ephemeralPubKey = self->_ephemeralPubKey;
  if (ephemeralPubKey) {
    [v4 setObject:ephemeralPubKey forKey:@"ephemeralPubKey"];
  }
  signature = self->_signature;
  if (signature) {
    [v4 setObject:signature forKey:@"signature"];
  }
  tetraMessage = self->_tetraMessage;
  if (tetraMessage) {
    [v4 setObject:tetraMessage forKey:@"tetraMessage"];
  }
  keyValidator = self->_keyValidator;
  if (keyValidator) {
    [v4 setObject:keyValidator forKey:@"keyValidator"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NGMPBOuterMessageReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptedPayload)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_ephemeralPubKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_tetraMessage)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
  if (self->_keyValidator)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_encryptedPayload)
  {
    objc_msgSend(v4, "setEncryptedPayload:");
    id v4 = v5;
  }
  if (self->_ephemeralPubKey)
  {
    objc_msgSend(v5, "setEphemeralPubKey:");
    id v4 = v5;
  }
  if (self->_signature)
  {
    objc_msgSend(v5, "setSignature:");
    id v4 = v5;
  }
  if (self->_tetraMessage)
  {
    objc_msgSend(v5, "setTetraMessage:");
    id v4 = v5;
  }
  if (self->_keyValidator)
  {
    objc_msgSend(v5, "setKeyValidator:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_encryptedPayload copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_ephemeralPubKey copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSData *)self->_signature copyWithZone:a3];
  v11 = (void *)v5[4];
  v5[4] = v10;

  uint64_t v12 = [(NSData *)self->_tetraMessage copyWithZone:a3];
  v13 = (void *)v5[5];
  v5[5] = v12;

  uint64_t v14 = [(NSData *)self->_keyValidator copyWithZone:a3];
  v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((encryptedPayload = self->_encryptedPayload, !((unint64_t)encryptedPayload | v4[1]))
     || -[NSData isEqual:](encryptedPayload, "isEqual:"))
    && ((ephemeralPubKey = self->_ephemeralPubKey, !((unint64_t)ephemeralPubKey | v4[2]))
     || -[NSData isEqual:](ephemeralPubKey, "isEqual:"))
    && ((signature = self->_signature, !((unint64_t)signature | v4[4]))
     || -[NSData isEqual:](signature, "isEqual:"))
    && ((tetraMessage = self->_tetraMessage, !((unint64_t)tetraMessage | v4[5]))
     || -[NSData isEqual:](tetraMessage, "isEqual:")))
  {
    keyValidator = self->_keyValidator;
    if ((unint64_t)keyValidator | v4[3]) {
      char v10 = -[NSData isEqual:](keyValidator, "isEqual:");
    }
    else {
      char v10 = 1;
    }
  }
  else
  {
    char v10 = 0;
  }

  return v10;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSData *)self->_encryptedPayload hash];
  uint64_t v4 = [(NSData *)self->_ephemeralPubKey hash] ^ v3;
  uint64_t v5 = [(NSData *)self->_signature hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSData *)self->_tetraMessage hash];
  return v6 ^ [(NSData *)self->_keyValidator hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  if (v4[1]) {
    -[NGMPBOuterMessage setEncryptedPayload:](self, "setEncryptedPayload:");
  }
  if (v4[2]) {
    -[NGMPBOuterMessage setEphemeralPubKey:](self, "setEphemeralPubKey:");
  }
  if (v4[4]) {
    -[NGMPBOuterMessage setSignature:](self, "setSignature:");
  }
  if (v4[5]) {
    -[NGMPBOuterMessage setTetraMessage:](self, "setTetraMessage:");
  }
  if (v4[3]) {
    -[NGMPBOuterMessage setKeyValidator:](self, "setKeyValidator:");
  }
}

- (NSData)encryptedPayload
{
  return self->_encryptedPayload;
}

- (void)setEncryptedPayload:(id)a3
{
}

- (NSData)ephemeralPubKey
{
  return self->_ephemeralPubKey;
}

- (void)setEphemeralPubKey:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (NSData)tetraMessage
{
  return self->_tetraMessage;
}

- (void)setTetraMessage:(id)a3
{
}

- (NSData)keyValidator
{
  return self->_keyValidator;
}

- (void)setKeyValidator:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tetraMessage, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_keyValidator, 0);
  objc_storeStrong((id *)&self->_ephemeralPubKey, 0);
  objc_storeStrong((id *)&self->_encryptedPayload, 0);
}

@end
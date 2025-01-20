@interface SignedParticipantPayload
- (BOOL)hasPayload;
- (BOOL)hasSignature;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (DecryptedParticipantPayload)payload;
- (NSData)signature;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setPayload:(id)a3;
- (void)setSignature:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SignedParticipantPayload

- (BOOL)hasPayload
{
  return self->_payload != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SignedParticipantPayload;
  v4 = [(SignedParticipantPayload *)&v8 description];
  v5 = [(SignedParticipantPayload *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  payload = self->_payload;
  if (payload)
  {
    v5 = [(DecryptedParticipantPayload *)payload dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"payload"];
  }
  signature = self->_signature;
  if (signature) {
    [v3 setObject:signature forKey:@"signature"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return SignedParticipantPayloadReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_payload)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_payload)
  {
    objc_msgSend(v4, "setPayload:");
    id v4 = v5;
  }
  if (self->_signature)
  {
    objc_msgSend(v5, "setSignature:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(DecryptedParticipantPayload *)self->_payload copyWithZone:a3];
  v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSData *)self->_signature copyWithZone:a3];
  v9 = (void *)v5[2];
  v5[2] = v8;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((payload = self->_payload, !((unint64_t)payload | v4[1]))
     || -[DecryptedParticipantPayload isEqual:](payload, "isEqual:")))
  {
    signature = self->_signature;
    if ((unint64_t)signature | v4[2]) {
      char v7 = -[NSData isEqual:](signature, "isEqual:");
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
  unint64_t v3 = [(DecryptedParticipantPayload *)self->_payload hash];
  return [(NSData *)self->_signature hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  payload = self->_payload;
  uint64_t v6 = v4[1];
  char v7 = v4;
  if (payload)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[DecryptedParticipantPayload mergeFrom:](payload, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[SignedParticipantPayload setPayload:](self, "setPayload:");
  }
  id v4 = v7;
LABEL_7:
  if (v4[2]) {
    -[SignedParticipantPayload setSignature:](self, "setSignature:");
  }
  MEMORY[0x270F9A758]();
}

- (DecryptedParticipantPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_payload, 0);
}

@end
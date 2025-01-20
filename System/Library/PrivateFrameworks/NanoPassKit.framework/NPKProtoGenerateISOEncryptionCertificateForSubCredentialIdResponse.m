@interface NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse
+ (Class)attestationType;
- (BOOL)hasAuthorization;
- (BOOL)hasErrorData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)authorization;
- (NSData)errorData;
- (NSMutableArray)attestations;
- (id)attestationAtIndex:(unint64_t)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)attestationsCount;
- (unint64_t)hash;
- (void)addAttestation:(id)a3;
- (void)clearAttestations;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttestations:(id)a3;
- (void)setAuthorization:(id)a3;
- (void)setErrorData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse

- (void)clearAttestations
{
}

- (void)addAttestation:(id)a3
{
  id v4 = a3;
  attestations = self->_attestations;
  id v8 = v4;
  if (!attestations)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    v7 = self->_attestations;
    self->_attestations = v6;

    id v4 = v8;
    attestations = self->_attestations;
  }
  [(NSMutableArray *)attestations addObject:v4];
}

- (unint64_t)attestationsCount
{
  return [(NSMutableArray *)self->_attestations count];
}

- (id)attestationAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_attestations objectAtIndex:a3];
}

+ (Class)attestationType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasAuthorization
{
  return self->_authorization != 0;
}

- (BOOL)hasErrorData
{
  return self->_errorData != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse;
  id v4 = [(NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse *)&v8 description];
  v5 = [(NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  attestations = self->_attestations;
  if (attestations) {
    [v3 setObject:attestations forKey:@"attestation"];
  }
  authorization = self->_authorization;
  if (authorization) {
    [v4 setObject:authorization forKey:@"authorization"];
  }
  errorData = self->_errorData;
  if (errorData) {
    [v4 setObject:errorData forKey:@"errorData"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponseReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  id v4 = a3;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  v5 = self->_attestations;
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

  if (self->_authorization) {
    PBDataWriterWriteDataField();
  }
  if (self->_errorData) {
    PBDataWriterWriteDataField();
  }
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if ([(NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse *)self attestationsCount])
  {
    [v9 clearAttestations];
    unint64_t v4 = [(NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse *)self attestationsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse *)self attestationAtIndex:i];
        [v9 addAttestation:v7];
      }
    }
  }
  if (self->_authorization) {
    objc_msgSend(v9, "setAuthorization:");
  }
  uint64_t v8 = v9;
  if (self->_errorData)
  {
    objc_msgSend(v9, "setErrorData:");
    uint64_t v8 = v9;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x263EF8340];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = self->_attestations;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * v10), "copyWithZone:", a3, (void)v17);
        [v5 addAttestation:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  uint64_t v12 = [(NSData *)self->_authorization copyWithZone:a3];
  long long v13 = (void *)v5[2];
  v5[2] = v12;

  uint64_t v14 = [(NSData *)self->_errorData copyWithZone:a3];
  uint64_t v15 = (void *)v5[3];
  v5[3] = v14;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((attestations = self->_attestations, !((unint64_t)attestations | v4[1]))
     || -[NSMutableArray isEqual:](attestations, "isEqual:"))
    && ((authorization = self->_authorization, !((unint64_t)authorization | v4[2]))
     || -[NSData isEqual:](authorization, "isEqual:")))
  {
    errorData = self->_errorData;
    if ((unint64_t)errorData | v4[3]) {
      char v8 = -[NSData isEqual:](errorData, "isEqual:");
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
  uint64_t v3 = [(NSMutableArray *)self->_attestations hash];
  uint64_t v4 = [(NSData *)self->_authorization hash] ^ v3;
  return v4 ^ [(NSData *)self->_errorData hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  uint64_t v4 = (id *)a3;
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
        -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse addAttestation:](self, "addAttestation:", *(void *)(*((void *)&v10 + 1) + 8 * i), (void)v10);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if (v4[2]) {
    -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse setAuthorization:](self, "setAuthorization:");
  }
  if (v4[3]) {
    -[NPKProtoGenerateISOEncryptionCertificateForSubCredentialIdResponse setErrorData:](self, "setErrorData:");
  }
}

- (NSMutableArray)attestations
{
  return self->_attestations;
}

- (void)setAttestations:(id)a3
{
}

- (NSData)authorization
{
  return self->_authorization;
}

- (void)setAuthorization:(id)a3
{
}

- (NSData)errorData
{
  return self->_errorData;
}

- (void)setErrorData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorData, 0);
  objc_storeStrong((id *)&self->_authorization, 0);
  objc_storeStrong((id *)&self->_attestations, 0);
}

@end
@interface NPKIDVRemoteDeviceProtoProvisionCredentialRequest
- (BOOL)hasAttestationsData;
- (BOOL)hasCredentialIdentifier;
- (BOOL)hasMetadataData;
- (BOOL)hasSupplementalData;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)attestationsData;
- (NSData)metadataData;
- (NSData)supplementalData;
- (NSString)credentialIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)credentialTypeAsString:(int)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)StringAsCredentialType:(id)a3;
- (int)credentialType;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAttestationsData:(id)a3;
- (void)setCredentialIdentifier:(id)a3;
- (void)setCredentialType:(int)a3;
- (void)setMetadataData:(id)a3;
- (void)setSupplementalData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKIDVRemoteDeviceProtoProvisionCredentialRequest

- (id)credentialTypeAsString:(int)a3
{
  if (a3)
  {
    if (a3 == 1)
    {
      v4 = @"Identity";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v4 = @"Unknown";
  }
  return v4;
}

- (int)StringAsCredentialType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"Unknown"]) {
    int v4 = 0;
  }
  else {
    int v4 = [v3 isEqualToString:@"Identity"];
  }

  return v4;
}

- (BOOL)hasMetadataData
{
  return self->_metadataData != 0;
}

- (BOOL)hasCredentialIdentifier
{
  return self->_credentialIdentifier != 0;
}

- (BOOL)hasAttestationsData
{
  return self->_attestationsData != 0;
}

- (BOOL)hasSupplementalData
{
  return self->_supplementalData != 0;
}

- (id)description
{
  id v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKIDVRemoteDeviceProtoProvisionCredentialRequest;
  int v4 = [(NPKIDVRemoteDeviceProtoProvisionCredentialRequest *)&v8 description];
  v5 = [(NPKIDVRemoteDeviceProtoProvisionCredentialRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  id v3 = [MEMORY[0x263EFF9A0] dictionary];
  int credentialType = self->_credentialType;
  if (credentialType)
  {
    if (credentialType == 1)
    {
      v5 = @"Identity";
    }
    else
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_credentialType);
      v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v5 = @"Unknown";
  }
  [v3 setObject:v5 forKey:@"credentialType"];

  metadataData = self->_metadataData;
  if (metadataData) {
    [v3 setObject:metadataData forKey:@"metadataData"];
  }
  credentialIdentifier = self->_credentialIdentifier;
  if (credentialIdentifier) {
    [v3 setObject:credentialIdentifier forKey:@"credentialIdentifier"];
  }
  attestationsData = self->_attestationsData;
  if (attestationsData) {
    [v3 setObject:attestationsData forKey:@"attestationsData"];
  }
  supplementalData = self->_supplementalData;
  if (supplementalData) {
    [v3 setObject:supplementalData forKey:@"supplementalData"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKIDVRemoteDeviceProtoProvisionCredentialRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_metadataData) {
    PBDataWriterWriteDataField();
  }
  if (self->_credentialIdentifier) {
    PBDataWriterWriteStringField();
  }
  int v4 = v5;
  if (self->_attestationsData)
  {
    PBDataWriterWriteDataField();
    int v4 = v5;
  }
  if (self->_supplementalData)
  {
    PBDataWriterWriteDataField();
    int v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  int v4 = a3;
  v4[6] = self->_credentialType;
  id v5 = v4;
  if (self->_metadataData)
  {
    objc_msgSend(v4, "setMetadataData:");
    int v4 = v5;
  }
  if (self->_credentialIdentifier)
  {
    objc_msgSend(v5, "setCredentialIdentifier:");
    int v4 = v5;
  }
  if (self->_attestationsData)
  {
    objc_msgSend(v5, "setAttestationsData:");
    int v4 = v5;
  }
  if (self->_supplementalData)
  {
    objc_msgSend(v5, "setSupplementalData:");
    int v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 24) = self->_credentialType;
  uint64_t v6 = [(NSData *)self->_metadataData copyWithZone:a3];
  v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSString *)self->_credentialIdentifier copyWithZone:a3];
  v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSData *)self->_attestationsData copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  uint64_t v12 = [(NSData *)self->_supplementalData copyWithZone:a3];
  v13 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  int v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && self->_credentialType == *((_DWORD *)v4 + 6)
    && ((metadataData = self->_metadataData, !((unint64_t)metadataData | v4[4]))
     || -[NSData isEqual:](metadataData, "isEqual:"))
    && ((credentialIdentifier = self->_credentialIdentifier, !((unint64_t)credentialIdentifier | v4[2]))
     || -[NSString isEqual:](credentialIdentifier, "isEqual:"))
    && ((attestationsData = self->_attestationsData, !((unint64_t)attestationsData | v4[1]))
     || -[NSData isEqual:](attestationsData, "isEqual:")))
  {
    supplementalData = self->_supplementalData;
    if ((unint64_t)supplementalData | v4[5]) {
      char v9 = -[NSData isEqual:](supplementalData, "isEqual:");
    }
    else {
      char v9 = 1;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_credentialType;
  uint64_t v4 = [(NSData *)self->_metadataData hash];
  NSUInteger v5 = v4 ^ [(NSString *)self->_credentialIdentifier hash];
  uint64_t v6 = v5 ^ [(NSData *)self->_attestationsData hash];
  return v6 ^ [(NSData *)self->_supplementalData hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  self->_int credentialType = v4[6];
  NSUInteger v5 = v4;
  if (*((void *)v4 + 4)) {
    -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setMetadataData:](self, "setMetadataData:");
  }
  if (v5[2]) {
    -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setCredentialIdentifier:](self, "setCredentialIdentifier:");
  }
  if (v5[1]) {
    -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setAttestationsData:](self, "setAttestationsData:");
  }
  if (v5[5]) {
    -[NPKIDVRemoteDeviceProtoProvisionCredentialRequest setSupplementalData:](self, "setSupplementalData:");
  }
}

- (int)credentialType
{
  return self->_credentialType;
}

- (void)setCredentialType:(int)a3
{
  self->_int credentialType = a3;
}

- (NSData)metadataData
{
  return self->_metadataData;
}

- (void)setMetadataData:(id)a3
{
}

- (NSString)credentialIdentifier
{
  return self->_credentialIdentifier;
}

- (void)setCredentialIdentifier:(id)a3
{
}

- (NSData)attestationsData
{
  return self->_attestationsData;
}

- (void)setAttestationsData:(id)a3
{
}

- (NSData)supplementalData
{
  return self->_supplementalData;
}

- (void)setSupplementalData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementalData, 0);
  objc_storeStrong((id *)&self->_metadataData, 0);
  objc_storeStrong((id *)&self->_credentialIdentifier, 0);
  objc_storeStrong((id *)&self->_attestationsData, 0);
}

@end
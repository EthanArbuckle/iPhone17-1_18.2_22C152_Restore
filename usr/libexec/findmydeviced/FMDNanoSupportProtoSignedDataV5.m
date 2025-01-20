@interface FMDNanoSupportProtoSignedDataV5
- (BOOL)errorOccurred;
- (BOOL)hasBaaAttestation;
- (BOOL)hasBaaError;
- (BOOL)hasBaaSignature;
- (BOOL)hasFinalRequestJsonData;
- (BOOL)hasRefKeyAttestation;
- (BOOL)hasRefKeyError;
- (BOOL)hasRefKeySignature;
- (BOOL)hasSignatureError;
- (BOOL)hasSignedData;
- (BOOL)hasSkAuth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)baaAttestation;
- (NSData)baaSignature;
- (NSData)finalRequestJsonData;
- (NSData)refKeyAttestation;
- (NSData)refKeySignature;
- (NSData)signedData;
- (NSData)skAuth;
- (NSString)baaError;
- (NSString)refKeyError;
- (NSString)signatureError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBaaAttestation:(id)a3;
- (void)setBaaError:(id)a3;
- (void)setBaaSignature:(id)a3;
- (void)setErrorOccurred:(BOOL)a3;
- (void)setFinalRequestJsonData:(id)a3;
- (void)setRefKeyAttestation:(id)a3;
- (void)setRefKeyError:(id)a3;
- (void)setRefKeySignature:(id)a3;
- (void)setSignatureError:(id)a3;
- (void)setSignedData:(id)a3;
- (void)setSkAuth:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FMDNanoSupportProtoSignedDataV5

- (BOOL)hasSignedData
{
  return self->_signedData != 0;
}

- (BOOL)hasSkAuth
{
  return self->_skAuth != 0;
}

- (BOOL)hasRefKeySignature
{
  return self->_refKeySignature != 0;
}

- (BOOL)hasRefKeyAttestation
{
  return self->_refKeyAttestation != 0;
}

- (BOOL)hasBaaSignature
{
  return self->_baaSignature != 0;
}

- (BOOL)hasBaaAttestation
{
  return self->_baaAttestation != 0;
}

- (BOOL)hasFinalRequestJsonData
{
  return self->_finalRequestJsonData != 0;
}

- (BOOL)hasRefKeyError
{
  return self->_refKeyError != 0;
}

- (BOOL)hasSignatureError
{
  return self->_signatureError != 0;
}

- (BOOL)hasBaaError
{
  return self->_baaError != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)FMDNanoSupportProtoSignedDataV5;
  v3 = [(FMDNanoSupportProtoSignedDataV5 *)&v7 description];
  v4 = [(FMDNanoSupportProtoSignedDataV5 *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  v4 = +[NSNumber numberWithBool:self->_errorOccurred];
  [v3 setObject:v4 forKey:@"error_occurred"];

  signedData = self->_signedData;
  if (signedData) {
    [v3 setObject:signedData forKey:@"signed_data"];
  }
  skAuth = self->_skAuth;
  if (skAuth) {
    [v3 setObject:skAuth forKey:@"sk_auth"];
  }
  refKeySignature = self->_refKeySignature;
  if (refKeySignature) {
    [v3 setObject:refKeySignature forKey:@"ref_key_signature"];
  }
  refKeyAttestation = self->_refKeyAttestation;
  if (refKeyAttestation) {
    [v3 setObject:refKeyAttestation forKey:@"ref_key_attestation"];
  }
  baaSignature = self->_baaSignature;
  if (baaSignature) {
    [v3 setObject:baaSignature forKey:@"baa_signature"];
  }
  baaAttestation = self->_baaAttestation;
  if (baaAttestation) {
    [v3 setObject:baaAttestation forKey:@"baa_attestation"];
  }
  finalRequestJsonData = self->_finalRequestJsonData;
  if (finalRequestJsonData) {
    [v3 setObject:finalRequestJsonData forKey:@"final_request_json_data"];
  }
  refKeyError = self->_refKeyError;
  if (refKeyError) {
    [v3 setObject:refKeyError forKey:@"ref_key_error"];
  }
  signatureError = self->_signatureError;
  if (signatureError) {
    [v3 setObject:signatureError forKey:@"signature_error"];
  }
  baaError = self->_baaError;
  if (baaError) {
    [v3 setObject:baaError forKey:@"baa_error"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoSignedDataV5ReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  PBDataWriterWriteBOOLField();
  if (self->_signedData) {
    PBDataWriterWriteDataField();
  }
  if (self->_skAuth) {
    PBDataWriterWriteDataField();
  }
  v4 = v5;
  if (self->_refKeySignature)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_refKeyAttestation)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_baaSignature)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_baaAttestation)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_finalRequestJsonData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_refKeyError)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_signatureError)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
  if (self->_baaError)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[88] = self->_errorOccurred;
  id v5 = v4;
  if (self->_signedData)
  {
    [v4 setSignedData:];
    v4 = v5;
  }
  if (self->_skAuth)
  {
    [v5 setSkAuth:];
    v4 = v5;
  }
  if (self->_refKeySignature)
  {
    [v5 setRefKeySignature:];
    v4 = v5;
  }
  if (self->_refKeyAttestation)
  {
    [v5 setRefKeyAttestation:];
    v4 = v5;
  }
  if (self->_baaSignature)
  {
    [v5 setBaaSignature:];
    v4 = v5;
  }
  if (self->_baaAttestation)
  {
    [v5 setBaaAttestation:];
    v4 = v5;
  }
  if (self->_finalRequestJsonData)
  {
    [v5 setFinalRequestJsonData:];
    v4 = v5;
  }
  if (self->_refKeyError)
  {
    [v5 setRefKeyError:];
    v4 = v5;
  }
  if (self->_signatureError)
  {
    [v5 setSignatureError:];
    v4 = v5;
  }
  if (self->_baaError)
  {
    [v5 setBaaError:];
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[[objc_opt_class() allocWithZone:a3] init];
  v5[88] = self->_errorOccurred;
  id v6 = [(NSData *)self->_signedData copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 9);
  *((void *)v5 + 9) = v6;

  id v8 = [(NSData *)self->_skAuth copyWithZone:a3];
  v9 = (void *)*((void *)v5 + 10);
  *((void *)v5 + 10) = v8;

  id v10 = [(NSData *)self->_refKeySignature copyWithZone:a3];
  v11 = (void *)*((void *)v5 + 7);
  *((void *)v5 + 7) = v10;

  id v12 = [(NSData *)self->_refKeyAttestation copyWithZone:a3];
  v13 = (void *)*((void *)v5 + 5);
  *((void *)v5 + 5) = v12;

  id v14 = [(NSData *)self->_baaSignature copyWithZone:a3];
  v15 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v14;

  id v16 = [(NSData *)self->_baaAttestation copyWithZone:a3];
  v17 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v16;

  id v18 = [(NSData *)self->_finalRequestJsonData copyWithZone:a3];
  v19 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v18;

  id v20 = [(NSString *)self->_refKeyError copyWithZone:a3];
  v21 = (void *)*((void *)v5 + 6);
  *((void *)v5 + 6) = v20;

  id v22 = [(NSString *)self->_signatureError copyWithZone:a3];
  v23 = (void *)*((void *)v5 + 8);
  *((void *)v5 + 8) = v22;

  id v24 = [(NSString *)self->_baaError copyWithZone:a3];
  v25 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v24;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_26;
  }
  if (self->_errorOccurred)
  {
    if (!*((unsigned char *)v4 + 88)) {
      goto LABEL_26;
    }
  }
  else if (*((unsigned char *)v4 + 88))
  {
LABEL_26:
    unsigned __int8 v15 = 0;
    goto LABEL_27;
  }
  signedData = self->_signedData;
  if ((unint64_t)signedData | *((void *)v4 + 9) && !-[NSData isEqual:](signedData, "isEqual:")) {
    goto LABEL_26;
  }
  skAuth = self->_skAuth;
  if ((unint64_t)skAuth | *((void *)v4 + 10))
  {
    if (!-[NSData isEqual:](skAuth, "isEqual:")) {
      goto LABEL_26;
    }
  }
  refKeySignature = self->_refKeySignature;
  if ((unint64_t)refKeySignature | *((void *)v4 + 7))
  {
    if (!-[NSData isEqual:](refKeySignature, "isEqual:")) {
      goto LABEL_26;
    }
  }
  refKeyAttestation = self->_refKeyAttestation;
  if ((unint64_t)refKeyAttestation | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](refKeyAttestation, "isEqual:")) {
      goto LABEL_26;
    }
  }
  baaSignature = self->_baaSignature;
  if ((unint64_t)baaSignature | *((void *)v4 + 3))
  {
    if (!-[NSData isEqual:](baaSignature, "isEqual:")) {
      goto LABEL_26;
    }
  }
  baaAttestation = self->_baaAttestation;
  if ((unint64_t)baaAttestation | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](baaAttestation, "isEqual:")) {
      goto LABEL_26;
    }
  }
  finalRequestJsonData = self->_finalRequestJsonData;
  if ((unint64_t)finalRequestJsonData | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](finalRequestJsonData, "isEqual:")) {
      goto LABEL_26;
    }
  }
  refKeyError = self->_refKeyError;
  if ((unint64_t)refKeyError | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](refKeyError, "isEqual:")) {
      goto LABEL_26;
    }
  }
  signatureError = self->_signatureError;
  if ((unint64_t)signatureError | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](signatureError, "isEqual:")) {
      goto LABEL_26;
    }
  }
  baaError = self->_baaError;
  if ((unint64_t)baaError | *((void *)v4 + 2)) {
    unsigned __int8 v15 = -[NSString isEqual:](baaError, "isEqual:");
  }
  else {
    unsigned __int8 v15 = 1;
  }
LABEL_27:

  return v15;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_errorOccurred;
  unint64_t v4 = (unint64_t)[(NSData *)self->_signedData hash];
  unint64_t v5 = v4 ^ (unint64_t)[(NSData *)self->_skAuth hash];
  unint64_t v6 = v5 ^ (unint64_t)[(NSData *)self->_refKeySignature hash];
  unint64_t v7 = v6 ^ (unint64_t)[(NSData *)self->_refKeyAttestation hash] ^ v3;
  unint64_t v8 = (unint64_t)[(NSData *)self->_baaSignature hash];
  unint64_t v9 = v8 ^ (unint64_t)[(NSData *)self->_baaAttestation hash];
  unint64_t v10 = v9 ^ (unint64_t)[(NSData *)self->_finalRequestJsonData hash];
  unint64_t v11 = v10 ^ [(NSString *)self->_refKeyError hash];
  unint64_t v12 = v7 ^ v11 ^ [(NSString *)self->_signatureError hash];
  return v12 ^ [(NSString *)self->_baaError hash];
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_errorOccurred = v4[88];
  unint64_t v5 = v4;
  if (*((void *)v4 + 9)) {
    -[FMDNanoSupportProtoSignedDataV5 setSignedData:](self, "setSignedData:");
  }
  if (v5[10]) {
    -[FMDNanoSupportProtoSignedDataV5 setSkAuth:](self, "setSkAuth:");
  }
  if (v5[7]) {
    -[FMDNanoSupportProtoSignedDataV5 setRefKeySignature:](self, "setRefKeySignature:");
  }
  if (v5[5]) {
    -[FMDNanoSupportProtoSignedDataV5 setRefKeyAttestation:](self, "setRefKeyAttestation:");
  }
  if (v5[3]) {
    -[FMDNanoSupportProtoSignedDataV5 setBaaSignature:](self, "setBaaSignature:");
  }
  if (v5[1]) {
    -[FMDNanoSupportProtoSignedDataV5 setBaaAttestation:](self, "setBaaAttestation:");
  }
  if (v5[4]) {
    -[FMDNanoSupportProtoSignedDataV5 setFinalRequestJsonData:](self, "setFinalRequestJsonData:");
  }
  if (v5[6]) {
    -[FMDNanoSupportProtoSignedDataV5 setRefKeyError:](self, "setRefKeyError:");
  }
  if (v5[8]) {
    -[FMDNanoSupportProtoSignedDataV5 setSignatureError:](self, "setSignatureError:");
  }
  if (v5[2]) {
    -[FMDNanoSupportProtoSignedDataV5 setBaaError:](self, "setBaaError:");
  }
}

- (BOOL)errorOccurred
{
  return self->_errorOccurred;
}

- (void)setErrorOccurred:(BOOL)a3
{
  self->_errorOccurred = a3;
}

- (NSData)signedData
{
  return self->_signedData;
}

- (void)setSignedData:(id)a3
{
}

- (NSData)skAuth
{
  return self->_skAuth;
}

- (void)setSkAuth:(id)a3
{
}

- (NSData)refKeySignature
{
  return self->_refKeySignature;
}

- (void)setRefKeySignature:(id)a3
{
}

- (NSData)refKeyAttestation
{
  return self->_refKeyAttestation;
}

- (void)setRefKeyAttestation:(id)a3
{
}

- (NSData)baaSignature
{
  return self->_baaSignature;
}

- (void)setBaaSignature:(id)a3
{
}

- (NSData)baaAttestation
{
  return self->_baaAttestation;
}

- (void)setBaaAttestation:(id)a3
{
}

- (NSData)finalRequestJsonData
{
  return self->_finalRequestJsonData;
}

- (void)setFinalRequestJsonData:(id)a3
{
}

- (NSString)refKeyError
{
  return self->_refKeyError;
}

- (void)setRefKeyError:(id)a3
{
}

- (NSString)signatureError
{
  return self->_signatureError;
}

- (void)setSignatureError:(id)a3
{
}

- (NSString)baaError
{
  return self->_baaError;
}

- (void)setBaaError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skAuth, 0);
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_signatureError, 0);
  objc_storeStrong((id *)&self->_refKeySignature, 0);
  objc_storeStrong((id *)&self->_refKeyError, 0);
  objc_storeStrong((id *)&self->_refKeyAttestation, 0);
  objc_storeStrong((id *)&self->_finalRequestJsonData, 0);
  objc_storeStrong((id *)&self->_baaSignature, 0);
  objc_storeStrong((id *)&self->_baaError, 0);

  objc_storeStrong((id *)&self->_baaAttestation, 0);
}

@end
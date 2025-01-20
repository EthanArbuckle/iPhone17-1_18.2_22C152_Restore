@interface FMDNanoSupportProtoSignedDataV3
- (BOOL)errorOccurred;
- (BOOL)hasFinalRequestJsonData;
- (BOOL)hasSignatureError;
- (BOOL)hasSignedData;
- (BOOL)hasSkAuth;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)finalRequestJsonData;
- (NSData)signedData;
- (NSData)skAuth;
- (NSString)signatureError;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorOccurred:(BOOL)a3;
- (void)setFinalRequestJsonData:(id)a3;
- (void)setSignatureError:(id)a3;
- (void)setSignedData:(id)a3;
- (void)setSkAuth:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FMDNanoSupportProtoSignedDataV3

- (BOOL)hasSignedData
{
  return self->_signedData != 0;
}

- (BOOL)hasSkAuth
{
  return self->_skAuth != 0;
}

- (BOOL)hasFinalRequestJsonData
{
  return self->_finalRequestJsonData != 0;
}

- (BOOL)hasSignatureError
{
  return self->_signatureError != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)FMDNanoSupportProtoSignedDataV3;
  v3 = [(FMDNanoSupportProtoSignedDataV3 *)&v7 description];
  v4 = [(FMDNanoSupportProtoSignedDataV3 *)self dictionaryRepresentation];
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
  finalRequestJsonData = self->_finalRequestJsonData;
  if (finalRequestJsonData) {
    [v3 setObject:finalRequestJsonData forKey:@"final_request_json_data"];
  }
  signatureError = self->_signatureError;
  if (signatureError) {
    [v3 setObject:signatureError forKey:@"signature_error"];
  }

  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return FMDNanoSupportProtoSignedDataV3ReadFrom((uint64_t)self, (uint64_t)a3);
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
  if (self->_finalRequestJsonData)
  {
    PBDataWriterWriteDataField();
    v4 = v5;
  }
  if (self->_signatureError)
  {
    PBDataWriterWriteStringField();
    v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  v4 = a3;
  v4[40] = self->_errorOccurred;
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
  if (self->_finalRequestJsonData)
  {
    [v5 setFinalRequestJsonData:];
    v4 = v5;
  }
  if (self->_signatureError)
  {
    [v5 setSignatureError:];
    v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = [[objc_opt_class() allocWithZone:a3] init];
  v5[40] = self->_errorOccurred;
  id v6 = [(NSData *)self->_signedData copyWithZone:a3];
  objc_super v7 = (void *)*((void *)v5 + 3);
  *((void *)v5 + 3) = v6;

  id v8 = [(NSData *)self->_skAuth copyWithZone:a3];
  v9 = (void *)*((void *)v5 + 4);
  *((void *)v5 + 4) = v8;

  id v10 = [(NSData *)self->_finalRequestJsonData copyWithZone:a3];
  v11 = (void *)*((void *)v5 + 1);
  *((void *)v5 + 1) = v10;

  id v12 = [(NSString *)self->_signatureError copyWithZone:a3];
  v13 = (void *)*((void *)v5 + 2);
  *((void *)v5 + 2) = v12;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_14;
  }
  if (self->_errorOccurred)
  {
    if (!*((unsigned char *)v4 + 40)) {
      goto LABEL_14;
    }
  }
  else if (*((unsigned char *)v4 + 40))
  {
LABEL_14:
    unsigned __int8 v9 = 0;
    goto LABEL_15;
  }
  signedData = self->_signedData;
  if ((unint64_t)signedData | *((void *)v4 + 3) && !-[NSData isEqual:](signedData, "isEqual:")) {
    goto LABEL_14;
  }
  skAuth = self->_skAuth;
  if ((unint64_t)skAuth | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](skAuth, "isEqual:")) {
      goto LABEL_14;
    }
  }
  finalRequestJsonData = self->_finalRequestJsonData;
  if ((unint64_t)finalRequestJsonData | *((void *)v4 + 1))
  {
    if (!-[NSData isEqual:](finalRequestJsonData, "isEqual:")) {
      goto LABEL_14;
    }
  }
  signatureError = self->_signatureError;
  if ((unint64_t)signatureError | *((void *)v4 + 2)) {
    unsigned __int8 v9 = -[NSString isEqual:](signatureError, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_15:

  return v9;
}

- (unint64_t)hash
{
  uint64_t v3 = 2654435761 * self->_errorOccurred;
  unint64_t v4 = (unint64_t)[(NSData *)self->_signedData hash];
  unint64_t v5 = v4 ^ (unint64_t)[(NSData *)self->_skAuth hash];
  unint64_t v6 = v5 ^ (unint64_t)[(NSData *)self->_finalRequestJsonData hash];
  return v6 ^ [(NSString *)self->_signatureError hash] ^ v3;
}

- (void)mergeFrom:(id)a3
{
  unint64_t v4 = a3;
  self->_errorOccurred = v4[40];
  unint64_t v5 = v4;
  if (*((void *)v4 + 3)) {
    -[FMDNanoSupportProtoSignedDataV3 setSignedData:](self, "setSignedData:");
  }
  if (v5[4]) {
    -[FMDNanoSupportProtoSignedDataV3 setSkAuth:](self, "setSkAuth:");
  }
  if (v5[1]) {
    -[FMDNanoSupportProtoSignedDataV3 setFinalRequestJsonData:](self, "setFinalRequestJsonData:");
  }
  if (v5[2]) {
    -[FMDNanoSupportProtoSignedDataV3 setSignatureError:](self, "setSignatureError:");
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

- (NSData)finalRequestJsonData
{
  return self->_finalRequestJsonData;
}

- (void)setFinalRequestJsonData:(id)a3
{
}

- (NSString)signatureError
{
  return self->_signatureError;
}

- (void)setSignatureError:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_skAuth, 0);
  objc_storeStrong((id *)&self->_signedData, 0);
  objc_storeStrong((id *)&self->_signatureError, 0);

  objc_storeStrong((id *)&self->_finalRequestJsonData, 0);
}

@end
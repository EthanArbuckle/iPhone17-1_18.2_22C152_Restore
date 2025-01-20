@interface NPKProtoStandaloneInitializationRequest
- (BOOL)hasPassImageSize;
- (BOOL)hasPassThumbnailImageSize;
- (BOOL)hasUseSimulatedFlowController;
- (BOOL)hasUserLanguageCode;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)useSimulatedFlowController;
- (NPKProtoStandaloneImageSize)passImageSize;
- (NPKProtoStandaloneImageSize)passThumbnailImageSize;
- (NPKProtoStandaloneRequestHeader)requestHeader;
- (NSString)userLanguageCode;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasUseSimulatedFlowController:(BOOL)a3;
- (void)setPassImageSize:(id)a3;
- (void)setPassThumbnailImageSize:(id)a3;
- (void)setRequestHeader:(id)a3;
- (void)setUseSimulatedFlowController:(BOOL)a3;
- (void)setUserLanguageCode:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NPKProtoStandaloneInitializationRequest

- (void)setUseSimulatedFlowController:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_useSimulatedFlowController = a3;
}

- (void)setHasUseSimulatedFlowController:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasUseSimulatedFlowController
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasUserLanguageCode
{
  return self->_userLanguageCode != 0;
}

- (BOOL)hasPassImageSize
{
  return self->_passImageSize != 0;
}

- (BOOL)hasPassThumbnailImageSize
{
  return self->_passThumbnailImageSize != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)NPKProtoStandaloneInitializationRequest;
  v4 = [(NPKProtoStandaloneInitializationRequest *)&v8 description];
  v5 = [(NPKProtoStandaloneInitializationRequest *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  requestHeader = self->_requestHeader;
  if (requestHeader)
  {
    v5 = [(NPKProtoStandaloneRequestHeader *)requestHeader dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"requestHeader"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v6 = [NSNumber numberWithBool:self->_useSimulatedFlowController];
    [v3 setObject:v6 forKey:@"useSimulatedFlowController"];
  }
  userLanguageCode = self->_userLanguageCode;
  if (userLanguageCode) {
    [v3 setObject:userLanguageCode forKey:@"userLanguageCode"];
  }
  passImageSize = self->_passImageSize;
  if (passImageSize)
  {
    v9 = [(NPKProtoStandaloneImageSize *)passImageSize dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"passImageSize"];
  }
  passThumbnailImageSize = self->_passThumbnailImageSize;
  if (passThumbnailImageSize)
  {
    v11 = [(NPKProtoStandaloneImageSize *)passThumbnailImageSize dictionaryRepresentation];
    [v3 setObject:v11 forKey:@"passThumbnailImageSize"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return NPKProtoStandaloneInitializationRequestReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_requestHeader) {
    -[NPKProtoStandaloneInitializationRequest writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteSubmessage();
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  if (self->_userLanguageCode) {
    PBDataWriterWriteStringField();
  }
  v5 = v6;
  if (self->_passImageSize)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
  if (self->_passThumbnailImageSize)
  {
    PBDataWriterWriteSubmessage();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  v5 = a3;
  [v5 setRequestHeader:self->_requestHeader];
  id v4 = v5;
  if (*(unsigned char *)&self->_has)
  {
    v5[40] = self->_useSimulatedFlowController;
    v5[44] |= 1u;
  }
  if (self->_userLanguageCode)
  {
    objc_msgSend(v5, "setUserLanguageCode:");
    id v4 = v5;
  }
  if (self->_passImageSize)
  {
    objc_msgSend(v5, "setPassImageSize:");
    id v4 = v5;
  }
  if (self->_passThumbnailImageSize)
  {
    objc_msgSend(v5, "setPassThumbnailImageSize:");
    id v4 = v5;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NPKProtoStandaloneRequestHeader *)self->_requestHeader copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  if (*(unsigned char *)&self->_has)
  {
    *(unsigned char *)(v5 + 40) = self->_useSimulatedFlowController;
    *(unsigned char *)(v5 + 44) |= 1u;
  }
  uint64_t v8 = [(NSString *)self->_userLanguageCode copyWithZone:a3];
  v9 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v8;

  id v10 = [(NPKProtoStandaloneImageSize *)self->_passImageSize copyWithZone:a3];
  v11 = *(void **)(v5 + 8);
  *(void *)(v5 + 8) = v10;

  id v12 = [(NPKProtoStandaloneImageSize *)self->_passThumbnailImageSize copyWithZone:a3];
  v13 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v12;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  requestHeader = self->_requestHeader;
  if ((unint64_t)requestHeader | *((void *)v4 + 3))
  {
    if (!-[NPKProtoStandaloneRequestHeader isEqual:](requestHeader, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if (*((unsigned char *)v4 + 44))
    {
      if (self->_useSimulatedFlowController)
      {
        if (!*((unsigned char *)v4 + 40)) {
          goto LABEL_18;
        }
        goto LABEL_12;
      }
      if (!*((unsigned char *)v4 + 40)) {
        goto LABEL_12;
      }
    }
LABEL_18:
    char v9 = 0;
    goto LABEL_19;
  }
  if (*((unsigned char *)v4 + 44)) {
    goto LABEL_18;
  }
LABEL_12:
  userLanguageCode = self->_userLanguageCode;
  if ((unint64_t)userLanguageCode | *((void *)v4 + 4)
    && !-[NSString isEqual:](userLanguageCode, "isEqual:"))
  {
    goto LABEL_18;
  }
  passImageSize = self->_passImageSize;
  if ((unint64_t)passImageSize | *((void *)v4 + 1))
  {
    if (!-[NPKProtoStandaloneImageSize isEqual:](passImageSize, "isEqual:")) {
      goto LABEL_18;
    }
  }
  passThumbnailImageSize = self->_passThumbnailImageSize;
  if ((unint64_t)passThumbnailImageSize | *((void *)v4 + 2)) {
    char v9 = -[NPKProtoStandaloneImageSize isEqual:](passThumbnailImageSize, "isEqual:");
  }
  else {
    char v9 = 1;
  }
LABEL_19:

  return v9;
}

- (unint64_t)hash
{
  unint64_t v3 = [(NPKProtoStandaloneRequestHeader *)self->_requestHeader hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v4 = 2654435761 * self->_useSimulatedFlowController;
  }
  else {
    uint64_t v4 = 0;
  }
  unint64_t v5 = v4 ^ v3;
  NSUInteger v6 = [(NSString *)self->_userLanguageCode hash];
  unint64_t v7 = v5 ^ v6 ^ [(NPKProtoStandaloneImageSize *)self->_passImageSize hash];
  return v7 ^ [(NPKProtoStandaloneImageSize *)self->_passThumbnailImageSize hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  requestHeader = self->_requestHeader;
  uint64_t v6 = *((void *)v4 + 3);
  id v11 = v4;
  if (requestHeader)
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandaloneRequestHeader mergeFrom:](requestHeader, "mergeFrom:");
  }
  else
  {
    if (!v6) {
      goto LABEL_7;
    }
    -[NPKProtoStandaloneInitializationRequest setRequestHeader:](self, "setRequestHeader:");
  }
  id v4 = v11;
LABEL_7:
  if (*((unsigned char *)v4 + 44))
  {
    self->_useSimulatedFlowController = *((unsigned char *)v4 + 40);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[NPKProtoStandaloneInitializationRequest setUserLanguageCode:](self, "setUserLanguageCode:");
    id v4 = v11;
  }
  passImageSize = self->_passImageSize;
  uint64_t v8 = *((void *)v4 + 1);
  if (passImageSize)
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[NPKProtoStandaloneImageSize mergeFrom:](passImageSize, "mergeFrom:");
  }
  else
  {
    if (!v8) {
      goto LABEL_17;
    }
    -[NPKProtoStandaloneInitializationRequest setPassImageSize:](self, "setPassImageSize:");
  }
  id v4 = v11;
LABEL_17:
  passThumbnailImageSize = self->_passThumbnailImageSize;
  uint64_t v10 = *((void *)v4 + 2);
  if (passThumbnailImageSize)
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[NPKProtoStandaloneImageSize mergeFrom:](passThumbnailImageSize, "mergeFrom:");
  }
  else
  {
    if (!v10) {
      goto LABEL_23;
    }
    -[NPKProtoStandaloneInitializationRequest setPassThumbnailImageSize:](self, "setPassThumbnailImageSize:");
  }
  id v4 = v11;
LABEL_23:
}

- (NPKProtoStandaloneRequestHeader)requestHeader
{
  return self->_requestHeader;
}

- (void)setRequestHeader:(id)a3
{
}

- (BOOL)useSimulatedFlowController
{
  return self->_useSimulatedFlowController;
}

- (NSString)userLanguageCode
{
  return self->_userLanguageCode;
}

- (void)setUserLanguageCode:(id)a3
{
}

- (NPKProtoStandaloneImageSize)passImageSize
{
  return self->_passImageSize;
}

- (void)setPassImageSize:(id)a3
{
}

- (NPKProtoStandaloneImageSize)passThumbnailImageSize
{
  return self->_passThumbnailImageSize;
}

- (void)setPassThumbnailImageSize:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userLanguageCode, 0);
  objc_storeStrong((id *)&self->_requestHeader, 0);
  objc_storeStrong((id *)&self->_passThumbnailImageSize, 0);
  objc_storeStrong((id *)&self->_passImageSize, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[NPKProtoStandaloneInitializationRequest writeTo:]", "NPKProtoStandaloneInitializationRequest.m", 180, "self->_requestHeader != nil");
}

@end
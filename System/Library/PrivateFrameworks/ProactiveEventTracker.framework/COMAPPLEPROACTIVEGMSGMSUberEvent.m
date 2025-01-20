@interface COMAPPLEPROACTIVEGMSGMSUberEvent
- (BOOL)hasAssetEvent;
- (BOOL)hasBootSessionUUID;
- (BOOL)hasCatalogResourceIdentifier;
- (BOOL)hasClientRequestIdentifier;
- (BOOL)hasClientSessionIdentifier;
- (BOOL)hasError;
- (BOOL)hasEventType;
- (BOOL)hasGenerativeFunctionEvent;
- (BOOL)hasInferenceEvent;
- (BOOL)hasInferenceProviderIdentifier;
- (BOOL)hasModelManagerRequestIdentifier;
- (BOOL)hasModelManagerSessionIdentifier;
- (BOOL)hasPrewarmEvent;
- (BOOL)hasTestKey;
- (BOOL)hasThreadQualityOfService;
- (BOOL)hasUseCaseIdentifier;
- (BOOL)hasVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (COMAPPLEPROACTIVEGMSGMSAssetEvent)assetEvent;
- (COMAPPLEPROACTIVEGMSGMSError)error;
- (COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent)generativeFunctionEvent;
- (COMAPPLEPROACTIVEGMSGMSInferenceEvent)inferenceEvent;
- (COMAPPLEPROACTIVEGMSGMSPrewarmEvent)prewarmEvent;
- (NSString)bootSessionUUID;
- (NSString)catalogResourceIdentifier;
- (NSString)clientRequestIdentifier;
- (NSString)clientSessionIdentifier;
- (NSString)inferenceProviderIdentifier;
- (NSString)modelManagerRequestIdentifier;
- (NSString)modelManagerSessionIdentifier;
- (NSString)testKey;
- (NSString)useCaseIdentifier;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)eventTypeAsString:(int)a3;
- (int)StringAsEventType:(id)a3;
- (int)eventType;
- (int64_t)threadQualityOfService;
- (int64_t)version;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setAssetEvent:(id)a3;
- (void)setBootSessionUUID:(id)a3;
- (void)setCatalogResourceIdentifier:(id)a3;
- (void)setClientRequestIdentifier:(id)a3;
- (void)setClientSessionIdentifier:(id)a3;
- (void)setError:(id)a3;
- (void)setEventType:(int)a3;
- (void)setGenerativeFunctionEvent:(id)a3;
- (void)setHasEventType:(BOOL)a3;
- (void)setHasThreadQualityOfService:(BOOL)a3;
- (void)setHasVersion:(BOOL)a3;
- (void)setInferenceEvent:(id)a3;
- (void)setInferenceProviderIdentifier:(id)a3;
- (void)setModelManagerRequestIdentifier:(id)a3;
- (void)setModelManagerSessionIdentifier:(id)a3;
- (void)setPrewarmEvent:(id)a3;
- (void)setTestKey:(id)a3;
- (void)setThreadQualityOfService:(int64_t)a3;
- (void)setUseCaseIdentifier:(id)a3;
- (void)setVersion:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation COMAPPLEPROACTIVEGMSGMSUberEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_useCaseIdentifier, 0);
  objc_storeStrong((id *)&self->_testKey, 0);
  objc_storeStrong((id *)&self->_prewarmEvent, 0);
  objc_storeStrong((id *)&self->_modelManagerSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_modelManagerRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_inferenceProviderIdentifier, 0);
  objc_storeStrong((id *)&self->_inferenceEvent, 0);
  objc_storeStrong((id *)&self->_generativeFunctionEvent, 0);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_clientSessionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientRequestIdentifier, 0);
  objc_storeStrong((id *)&self->_catalogResourceIdentifier, 0);
  objc_storeStrong((id *)&self->_bootSessionUUID, 0);

  objc_storeStrong((id *)&self->_assetEvent, 0);
}

- (void)setError:(id)a3
{
}

- (COMAPPLEPROACTIVEGMSGMSError)error
{
  return self->_error;
}

- (void)setPrewarmEvent:(id)a3
{
}

- (COMAPPLEPROACTIVEGMSGMSPrewarmEvent)prewarmEvent
{
  return self->_prewarmEvent;
}

- (void)setGenerativeFunctionEvent:(id)a3
{
}

- (COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent)generativeFunctionEvent
{
  return self->_generativeFunctionEvent;
}

- (void)setAssetEvent:(id)a3
{
}

- (COMAPPLEPROACTIVEGMSGMSAssetEvent)assetEvent
{
  return self->_assetEvent;
}

- (void)setInferenceEvent:(id)a3
{
}

- (COMAPPLEPROACTIVEGMSGMSInferenceEvent)inferenceEvent
{
  return self->_inferenceEvent;
}

- (int64_t)threadQualityOfService
{
  return self->_threadQualityOfService;
}

- (void)setClientSessionIdentifier:(id)a3
{
}

- (NSString)clientSessionIdentifier
{
  return self->_clientSessionIdentifier;
}

- (void)setClientRequestIdentifier:(id)a3
{
}

- (NSString)clientRequestIdentifier
{
  return self->_clientRequestIdentifier;
}

- (void)setCatalogResourceIdentifier:(id)a3
{
}

- (NSString)catalogResourceIdentifier
{
  return self->_catalogResourceIdentifier;
}

- (void)setUseCaseIdentifier:(id)a3
{
}

- (NSString)useCaseIdentifier
{
  return self->_useCaseIdentifier;
}

- (void)setInferenceProviderIdentifier:(id)a3
{
}

- (NSString)inferenceProviderIdentifier
{
  return self->_inferenceProviderIdentifier;
}

- (void)setModelManagerSessionIdentifier:(id)a3
{
}

- (NSString)modelManagerSessionIdentifier
{
  return self->_modelManagerSessionIdentifier;
}

- (void)setModelManagerRequestIdentifier:(id)a3
{
}

- (NSString)modelManagerRequestIdentifier
{
  return self->_modelManagerRequestIdentifier;
}

- (void)setBootSessionUUID:(id)a3
{
}

- (NSString)bootSessionUUID
{
  return self->_bootSessionUUID;
}

- (void)setTestKey:(id)a3
{
}

- (NSString)testKey
{
  return self->_testKey;
}

- (int64_t)version
{
  return self->_version;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  v5 = v4;
  if ((v4[36] & 4) != 0)
  {
    self->_eventType = v4[18];
    *(unsigned char *)&self->_has |= 4u;
  }
  v16 = v4;
  if (*((void *)v4 + 4))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setBootSessionUUID:](self, "setBootSessionUUID:");
    v5 = v16;
  }
  if (*((void *)v5 + 13))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setModelManagerRequestIdentifier:](self, "setModelManagerRequestIdentifier:");
    v5 = v16;
  }
  if (*((void *)v5 + 14))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setModelManagerSessionIdentifier:](self, "setModelManagerSessionIdentifier:");
    v5 = v16;
  }
  if (*((void *)v5 + 12))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setInferenceProviderIdentifier:](self, "setInferenceProviderIdentifier:");
    v5 = v16;
  }
  if (*((void *)v5 + 17))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setUseCaseIdentifier:](self, "setUseCaseIdentifier:");
    v5 = v16;
  }
  if (*((void *)v5 + 5))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setCatalogResourceIdentifier:](self, "setCatalogResourceIdentifier:");
    v5 = v16;
  }
  inferenceEvent = self->_inferenceEvent;
  uint64_t v7 = *((void *)v5 + 11);
  if (inferenceEvent)
  {
    if (!v7) {
      goto LABEL_21;
    }
    -[COMAPPLEPROACTIVEGMSGMSInferenceEvent mergeFrom:](inferenceEvent, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_21;
    }
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setInferenceEvent:](self, "setInferenceEvent:");
  }
  v5 = v16;
LABEL_21:
  if ((v5[36] & 2) != 0)
  {
    self->_version = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v5 + 16))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setTestKey:](self, "setTestKey:");
    v5 = v16;
  }
  assetEvent = self->_assetEvent;
  uint64_t v9 = *((void *)v5 + 3);
  if (assetEvent)
  {
    if (!v9) {
      goto LABEL_31;
    }
    -[COMAPPLEPROACTIVEGMSGMSAssetEvent mergeFrom:](assetEvent, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_31;
    }
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setAssetEvent:](self, "setAssetEvent:");
  }
  v5 = v16;
LABEL_31:
  generativeFunctionEvent = self->_generativeFunctionEvent;
  uint64_t v11 = *((void *)v5 + 10);
  if (generativeFunctionEvent)
  {
    if (!v11) {
      goto LABEL_37;
    }
    -[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent mergeFrom:](generativeFunctionEvent, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_37;
    }
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setGenerativeFunctionEvent:](self, "setGenerativeFunctionEvent:");
  }
  v5 = v16;
LABEL_37:
  if (*((void *)v5 + 6))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setClientRequestIdentifier:](self, "setClientRequestIdentifier:");
    v5 = v16;
  }
  if (*((void *)v5 + 7))
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setClientSessionIdentifier:](self, "setClientSessionIdentifier:");
    v5 = v16;
  }
  if (v5[36])
  {
    self->_threadQualityOfService = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  error = self->_error;
  uint64_t v13 = *((void *)v5 + 8);
  if (error)
  {
    if (!v13) {
      goto LABEL_49;
    }
    -[COMAPPLEPROACTIVEGMSGMSError mergeFrom:](error, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_49;
    }
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setError:](self, "setError:");
  }
  v5 = v16;
LABEL_49:
  prewarmEvent = self->_prewarmEvent;
  uint64_t v15 = *((void *)v5 + 15);
  if (prewarmEvent)
  {
    if (v15) {
      -[COMAPPLEPROACTIVEGMSGMSPrewarmEvent mergeFrom:](prewarmEvent, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[COMAPPLEPROACTIVEGMSGMSUberEvent setPrewarmEvent:](self, "setPrewarmEvent:");
  }

  MEMORY[0x1F41817F8]();
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v19 = 2654435761 * self->_eventType;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v18 = [(NSString *)self->_bootSessionUUID hash];
  NSUInteger v17 = [(NSString *)self->_modelManagerRequestIdentifier hash];
  NSUInteger v16 = [(NSString *)self->_modelManagerSessionIdentifier hash];
  NSUInteger v15 = [(NSString *)self->_inferenceProviderIdentifier hash];
  NSUInteger v14 = [(NSString *)self->_useCaseIdentifier hash];
  NSUInteger v3 = [(NSString *)self->_catalogResourceIdentifier hash];
  unint64_t v4 = [(COMAPPLEPROACTIVEGMSGMSInferenceEvent *)self->_inferenceEvent hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v5 = 2654435761 * self->_version;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_testKey hash];
  unint64_t v7 = [(COMAPPLEPROACTIVEGMSGMSAssetEvent *)self->_assetEvent hash];
  unint64_t v8 = [(COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent *)self->_generativeFunctionEvent hash];
  NSUInteger v9 = [(NSString *)self->_clientRequestIdentifier hash];
  NSUInteger v10 = [(NSString *)self->_clientSessionIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v11 = 2654435761 * self->_threadQualityOfService;
  }
  else {
    uint64_t v11 = 0;
  }
  unint64_t v12 = v18 ^ v19 ^ v17 ^ v16 ^ v15 ^ v14 ^ v3 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ [(COMAPPLEPROACTIVEGMSGMSError *)self->_error hash];
  return v12 ^ [(COMAPPLEPROACTIVEGMSGMSPrewarmEvent *)self->_prewarmEvent hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_45;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 4) == 0 || self->_eventType != *((_DWORD *)v4 + 18)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 4) != 0)
  {
LABEL_45:
    char v19 = 0;
    goto LABEL_46;
  }
  bootSessionUUID = self->_bootSessionUUID;
  if ((unint64_t)bootSessionUUID | *((void *)v4 + 4)
    && !-[NSString isEqual:](bootSessionUUID, "isEqual:"))
  {
    goto LABEL_45;
  }
  modelManagerRequestIdentifier = self->_modelManagerRequestIdentifier;
  if ((unint64_t)modelManagerRequestIdentifier | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](modelManagerRequestIdentifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  modelManagerSessionIdentifier = self->_modelManagerSessionIdentifier;
  if ((unint64_t)modelManagerSessionIdentifier | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](modelManagerSessionIdentifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  inferenceProviderIdentifier = self->_inferenceProviderIdentifier;
  if ((unint64_t)inferenceProviderIdentifier | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](inferenceProviderIdentifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  useCaseIdentifier = self->_useCaseIdentifier;
  if ((unint64_t)useCaseIdentifier | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](useCaseIdentifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  catalogResourceIdentifier = self->_catalogResourceIdentifier;
  if ((unint64_t)catalogResourceIdentifier | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](catalogResourceIdentifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  inferenceEvent = self->_inferenceEvent;
  if ((unint64_t)inferenceEvent | *((void *)v4 + 11))
  {
    if (!-[COMAPPLEPROACTIVEGMSGMSInferenceEvent isEqual:](inferenceEvent, "isEqual:")) {
      goto LABEL_45;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 144) & 2) == 0 || self->_version != *((void *)v4 + 2)) {
      goto LABEL_45;
    }
  }
  else if ((*((unsigned char *)v4 + 144) & 2) != 0)
  {
    goto LABEL_45;
  }
  testKey = self->_testKey;
  if ((unint64_t)testKey | *((void *)v4 + 16) && !-[NSString isEqual:](testKey, "isEqual:")) {
    goto LABEL_45;
  }
  assetEvent = self->_assetEvent;
  if ((unint64_t)assetEvent | *((void *)v4 + 3))
  {
    if (!-[COMAPPLEPROACTIVEGMSGMSAssetEvent isEqual:](assetEvent, "isEqual:")) {
      goto LABEL_45;
    }
  }
  generativeFunctionEvent = self->_generativeFunctionEvent;
  if ((unint64_t)generativeFunctionEvent | *((void *)v4 + 10))
  {
    if (!-[COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent isEqual:](generativeFunctionEvent, "isEqual:")) {
      goto LABEL_45;
    }
  }
  clientRequestIdentifier = self->_clientRequestIdentifier;
  if ((unint64_t)clientRequestIdentifier | *((void *)v4 + 6))
  {
    if (!-[NSString isEqual:](clientRequestIdentifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  clientSessionIdentifier = self->_clientSessionIdentifier;
  if ((unint64_t)clientSessionIdentifier | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](clientSessionIdentifier, "isEqual:")) {
      goto LABEL_45;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 144) & 1) == 0 || self->_threadQualityOfService != *((void *)v4 + 1)) {
      goto LABEL_45;
    }
  }
  else if (*((unsigned char *)v4 + 144))
  {
    goto LABEL_45;
  }
  error = self->_error;
  if ((unint64_t)error | *((void *)v4 + 8) && !-[COMAPPLEPROACTIVEGMSGMSError isEqual:](error, "isEqual:")) {
    goto LABEL_45;
  }
  prewarmEvent = self->_prewarmEvent;
  if ((unint64_t)prewarmEvent | *((void *)v4 + 15)) {
    char v19 = -[COMAPPLEPROACTIVEGMSGMSPrewarmEvent isEqual:](prewarmEvent, "isEqual:");
  }
  else {
    char v19 = 1;
  }
LABEL_46:

  return v19;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_eventType;
    *(unsigned char *)(v5 + 144) |= 4u;
  }
  uint64_t v7 = [(NSString *)self->_bootSessionUUID copyWithZone:a3];
  unint64_t v8 = *(void **)(v6 + 32);
  *(void *)(v6 + 32) = v7;

  uint64_t v9 = [(NSString *)self->_modelManagerRequestIdentifier copyWithZone:a3];
  NSUInteger v10 = *(void **)(v6 + 104);
  *(void *)(v6 + 104) = v9;

  uint64_t v11 = [(NSString *)self->_modelManagerSessionIdentifier copyWithZone:a3];
  unint64_t v12 = *(void **)(v6 + 112);
  *(void *)(v6 + 112) = v11;

  uint64_t v13 = [(NSString *)self->_inferenceProviderIdentifier copyWithZone:a3];
  NSUInteger v14 = *(void **)(v6 + 96);
  *(void *)(v6 + 96) = v13;

  uint64_t v15 = [(NSString *)self->_useCaseIdentifier copyWithZone:a3];
  NSUInteger v16 = *(void **)(v6 + 136);
  *(void *)(v6 + 136) = v15;

  uint64_t v17 = [(NSString *)self->_catalogResourceIdentifier copyWithZone:a3];
  NSUInteger v18 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v17;

  id v19 = [(COMAPPLEPROACTIVEGMSGMSInferenceEvent *)self->_inferenceEvent copyWithZone:a3];
  v20 = *(void **)(v6 + 88);
  *(void *)(v6 + 88) = v19;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v6 + 16) = self->_version;
    *(unsigned char *)(v6 + 144) |= 2u;
  }
  uint64_t v21 = [(NSString *)self->_testKey copyWithZone:a3];
  v22 = *(void **)(v6 + 128);
  *(void *)(v6 + 128) = v21;

  id v23 = [(COMAPPLEPROACTIVEGMSGMSAssetEvent *)self->_assetEvent copyWithZone:a3];
  v24 = *(void **)(v6 + 24);
  *(void *)(v6 + 24) = v23;

  id v25 = [(COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent *)self->_generativeFunctionEvent copyWithZone:a3];
  v26 = *(void **)(v6 + 80);
  *(void *)(v6 + 80) = v25;

  uint64_t v27 = [(NSString *)self->_clientRequestIdentifier copyWithZone:a3];
  v28 = *(void **)(v6 + 48);
  *(void *)(v6 + 48) = v27;

  uint64_t v29 = [(NSString *)self->_clientSessionIdentifier copyWithZone:a3];
  v30 = *(void **)(v6 + 56);
  *(void *)(v6 + 56) = v29;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v6 + 8) = self->_threadQualityOfService;
    *(unsigned char *)(v6 + 144) |= 1u;
  }
  id v31 = [(COMAPPLEPROACTIVEGMSGMSError *)self->_error copyWithZone:a3];
  v32 = *(void **)(v6 + 64);
  *(void *)(v6 + 64) = v31;

  id v33 = [(COMAPPLEPROACTIVEGMSGMSPrewarmEvent *)self->_prewarmEvent copyWithZone:a3];
  v34 = *(void **)(v6 + 120);
  *(void *)(v6 + 120) = v33;

  return (id)v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[18] = self->_eventType;
    *((unsigned char *)v4 + 144) |= 4u;
  }
  uint64_t v5 = v4;
  if (self->_bootSessionUUID)
  {
    objc_msgSend(v4, "setBootSessionUUID:");
    id v4 = v5;
  }
  if (self->_modelManagerRequestIdentifier)
  {
    objc_msgSend(v5, "setModelManagerRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_modelManagerSessionIdentifier)
  {
    objc_msgSend(v5, "setModelManagerSessionIdentifier:");
    id v4 = v5;
  }
  if (self->_inferenceProviderIdentifier)
  {
    objc_msgSend(v5, "setInferenceProviderIdentifier:");
    id v4 = v5;
  }
  if (self->_useCaseIdentifier)
  {
    objc_msgSend(v5, "setUseCaseIdentifier:");
    id v4 = v5;
  }
  if (self->_catalogResourceIdentifier)
  {
    objc_msgSend(v5, "setCatalogResourceIdentifier:");
    id v4 = v5;
  }
  if (self->_inferenceEvent)
  {
    objc_msgSend(v5, "setInferenceEvent:");
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_version;
    *((unsigned char *)v4 + 144) |= 2u;
  }
  if (self->_testKey)
  {
    objc_msgSend(v5, "setTestKey:");
    id v4 = v5;
  }
  if (self->_assetEvent)
  {
    objc_msgSend(v5, "setAssetEvent:");
    id v4 = v5;
  }
  if (self->_generativeFunctionEvent)
  {
    objc_msgSend(v5, "setGenerativeFunctionEvent:");
    id v4 = v5;
  }
  if (self->_clientRequestIdentifier)
  {
    objc_msgSend(v5, "setClientRequestIdentifier:");
    id v4 = v5;
  }
  if (self->_clientSessionIdentifier)
  {
    objc_msgSend(v5, "setClientSessionIdentifier:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_threadQualityOfService;
    *((unsigned char *)v4 + 144) |= 1u;
  }
  if (self->_error)
  {
    objc_msgSend(v5, "setError:");
    id v4 = v5;
  }
  if (self->_prewarmEvent)
  {
    objc_msgSend(v5, "setPrewarmEvent:");
    id v4 = v5;
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v5;
  }
  if (self->_bootSessionUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_modelManagerRequestIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_modelManagerSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_inferenceProviderIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_useCaseIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_catalogResourceIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_inferenceEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_testKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_assetEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_generativeFunctionEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_clientRequestIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_clientSessionIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v5;
  }
  if (self->_error)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (self->_prewarmEvent)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
}

- (BOOL)readFrom:(id)a3
{
  return COMAPPLEPROACTIVEGMSGMSUberEventReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  NSUInteger v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    id v4 = [NSNumber numberWithLongLong:self->_version];
    [v3 setObject:v4 forKey:@"version"];
  }
  testKey = self->_testKey;
  if (testKey) {
    [v3 setObject:testKey forKey:@"testKey"];
  }
  bootSessionUUID = self->_bootSessionUUID;
  if (bootSessionUUID) {
    [v3 setObject:bootSessionUUID forKey:@"bootSessionUUID"];
  }
  modelManagerRequestIdentifier = self->_modelManagerRequestIdentifier;
  if (modelManagerRequestIdentifier) {
    [v3 setObject:modelManagerRequestIdentifier forKey:@"modelManagerRequestIdentifier"];
  }
  modelManagerSessionIdentifier = self->_modelManagerSessionIdentifier;
  if (modelManagerSessionIdentifier) {
    [v3 setObject:modelManagerSessionIdentifier forKey:@"modelManagerSessionIdentifier"];
  }
  inferenceProviderIdentifier = self->_inferenceProviderIdentifier;
  if (inferenceProviderIdentifier) {
    [v3 setObject:inferenceProviderIdentifier forKey:@"inferenceProviderIdentifier"];
  }
  useCaseIdentifier = self->_useCaseIdentifier;
  if (useCaseIdentifier) {
    [v3 setObject:useCaseIdentifier forKey:@"useCaseIdentifier"];
  }
  catalogResourceIdentifier = self->_catalogResourceIdentifier;
  if (catalogResourceIdentifier) {
    [v3 setObject:catalogResourceIdentifier forKey:@"catalogResourceIdentifier"];
  }
  clientRequestIdentifier = self->_clientRequestIdentifier;
  if (clientRequestIdentifier) {
    [v3 setObject:clientRequestIdentifier forKey:@"clientRequestIdentifier"];
  }
  clientSessionIdentifier = self->_clientSessionIdentifier;
  if (clientSessionIdentifier) {
    [v3 setObject:clientSessionIdentifier forKey:@"clientSessionIdentifier"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t v15 = [NSNumber numberWithLongLong:self->_threadQualityOfService];
    [v3 setObject:v15 forKey:@"threadQualityOfService"];

    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    uint64_t eventType = self->_eventType;
    if (eventType >= 5)
    {
      objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_eventType);
      uint64_t v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      uint64_t v17 = off_1E56C4438[eventType];
    }
    [v3 setObject:v17 forKey:@"eventType"];
  }
  inferenceEvent = self->_inferenceEvent;
  if (inferenceEvent)
  {
    id v19 = [(COMAPPLEPROACTIVEGMSGMSInferenceEvent *)inferenceEvent dictionaryRepresentation];
    [v3 setObject:v19 forKey:@"inferenceEvent"];
  }
  assetEvent = self->_assetEvent;
  if (assetEvent)
  {
    uint64_t v21 = [(COMAPPLEPROACTIVEGMSGMSAssetEvent *)assetEvent dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"assetEvent"];
  }
  generativeFunctionEvent = self->_generativeFunctionEvent;
  if (generativeFunctionEvent)
  {
    id v23 = [(COMAPPLEPROACTIVEGMSGMSGenerativeFunctionEvent *)generativeFunctionEvent dictionaryRepresentation];
    [v3 setObject:v23 forKey:@"generativeFunctionEvent"];
  }
  prewarmEvent = self->_prewarmEvent;
  if (prewarmEvent)
  {
    id v25 = [(COMAPPLEPROACTIVEGMSGMSPrewarmEvent *)prewarmEvent dictionaryRepresentation];
    [v3 setObject:v25 forKey:@"prewarmEvent"];
  }
  error = self->_error;
  if (error)
  {
    uint64_t v27 = [(COMAPPLEPROACTIVEGMSGMSError *)error dictionaryRepresentation];
    [v3 setObject:v27 forKey:@"error"];
  }

  return v3;
}

- (id)description
{
  NSUInteger v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)COMAPPLEPROACTIVEGMSGMSUberEvent;
  id v4 = [(COMAPPLEPROACTIVEGMSGMSUberEvent *)&v8 description];
  id v5 = [(COMAPPLEPROACTIVEGMSGMSUberEvent *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (BOOL)hasPrewarmEvent
{
  return self->_prewarmEvent != 0;
}

- (BOOL)hasGenerativeFunctionEvent
{
  return self->_generativeFunctionEvent != 0;
}

- (BOOL)hasAssetEvent
{
  return self->_assetEvent != 0;
}

- (BOOL)hasInferenceEvent
{
  return self->_inferenceEvent != 0;
}

- (int)StringAsEventType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"GMS_EVENT_TYPE_UNKNOWN"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"GMS_EVENT_TYPE_INFERENCE_EVENT"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"GMS_EVENT_TYPE_ASSET_EVENT"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"GMS_EVENT_TYPE_GENERATIVE_FUNCTION_EVENT"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"GMS_EVENT_TYPE_PREWARM_EVENT"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)eventTypeAsString:(int)a3
{
  if (a3 >= 5)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    id v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v3 = off_1E56C4438[a3];
  }

  return v3;
}

- (BOOL)hasEventType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasEventType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setEventType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_uint64_t eventType = a3;
}

- (int)eventType
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_eventType;
  }
  else {
    return 0;
  }
}

- (BOOL)hasThreadQualityOfService
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasThreadQualityOfService:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setThreadQualityOfService:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_threadQualityOfService = a3;
}

- (BOOL)hasClientSessionIdentifier
{
  return self->_clientSessionIdentifier != 0;
}

- (BOOL)hasClientRequestIdentifier
{
  return self->_clientRequestIdentifier != 0;
}

- (BOOL)hasCatalogResourceIdentifier
{
  return self->_catalogResourceIdentifier != 0;
}

- (BOOL)hasUseCaseIdentifier
{
  return self->_useCaseIdentifier != 0;
}

- (BOOL)hasInferenceProviderIdentifier
{
  return self->_inferenceProviderIdentifier != 0;
}

- (BOOL)hasModelManagerSessionIdentifier
{
  return self->_modelManagerSessionIdentifier != 0;
}

- (BOOL)hasModelManagerRequestIdentifier
{
  return self->_modelManagerRequestIdentifier != 0;
}

- (BOOL)hasBootSessionUUID
{
  return self->_bootSessionUUID != 0;
}

- (BOOL)hasTestKey
{
  return self->_testKey != 0;
}

- (BOOL)hasVersion
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasVersion:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setVersion:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_version = a3;
}

@end
@interface POMMESSchemaPOMMESClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasCacheInvalidationContext;
- (BOOL)hasCacheLookupContext;
- (BOOL)hasCacheMaintenanceContext;
- (BOOL)hasCacheStoringContext;
- (BOOL)hasEventMetadata;
- (BOOL)hasOnDeviceIndexSearchContext;
- (BOOL)hasPegasusKitRequestContext;
- (BOOL)hasPegasusRequestContext;
- (BOOL)hasPerformanceReported;
- (BOOL)hasPommesPegasusRequestGeoAppResolutionReported;
- (BOOL)hasPommesRequestContext;
- (BOOL)hasPommesSearchRequestClassifierExecuted;
- (BOOL)hasPommesServiceClassifierScoreReported;
- (BOOL)hasProfileResolutionRequestContext;
- (BOOL)hasResourceDownloadContext;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POMMESSchemaPOMMESCacheInvalidationContext)cacheInvalidationContext;
- (POMMESSchemaPOMMESCacheLookupContext)cacheLookupContext;
- (POMMESSchemaPOMMESCacheMaintenanceContext)cacheMaintenanceContext;
- (POMMESSchemaPOMMESCacheStoringContext)cacheStoringContext;
- (POMMESSchemaPOMMESClientEvent)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESClientEvent)initWithJSON:(id)a3;
- (POMMESSchemaPOMMESClientEventMetadata)eventMetadata;
- (POMMESSchemaPOMMESDebugPerformanceReported)performanceReported;
- (POMMESSchemaPOMMESOnDeviceIndexSearchContext)onDeviceIndexSearchContext;
- (POMMESSchemaPOMMESPegasusKitPegasusRequestContext)pegasusKitRequestContext;
- (POMMESSchemaPOMMESPegasusRequestContext)pegasusRequestContext;
- (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported)pommesPegasusRequestGeoAppResolutionReported;
- (POMMESSchemaPOMMESProfileSliceResolutionRequestContext)profileResolutionRequestContext;
- (POMMESSchemaPOMMESRequestContext)pommesRequestContext;
- (POMMESSchemaPOMMESResourceDownloadContext)resourceDownloadContext;
- (POMMESSchemaPOMMESSearchRequestClassifierExecuted)pommesSearchRequestClassifierExecuted;
- (POMMESSchemaPOMMESServiceClassifierScoreReported)pommesServiceClassifierScoreReported;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)clockIsolationLevel;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteCacheInvalidationContext;
- (void)deleteCacheLookupContext;
- (void)deleteCacheMaintenanceContext;
- (void)deleteCacheStoringContext;
- (void)deleteEventMetadata;
- (void)deleteOnDeviceIndexSearchContext;
- (void)deletePegasusKitRequestContext;
- (void)deletePegasusRequestContext;
- (void)deletePerformanceReported;
- (void)deletePommesPegasusRequestGeoAppResolutionReported;
- (void)deletePommesRequestContext;
- (void)deletePommesSearchRequestClassifierExecuted;
- (void)deletePommesServiceClassifierScoreReported;
- (void)deleteProfileResolutionRequestContext;
- (void)deleteResourceDownloadContext;
- (void)setCacheInvalidationContext:(id)a3;
- (void)setCacheLookupContext:(id)a3;
- (void)setCacheMaintenanceContext:(id)a3;
- (void)setCacheStoringContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setHasCacheInvalidationContext:(BOOL)a3;
- (void)setHasCacheLookupContext:(BOOL)a3;
- (void)setHasCacheMaintenanceContext:(BOOL)a3;
- (void)setHasCacheStoringContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasOnDeviceIndexSearchContext:(BOOL)a3;
- (void)setHasPegasusKitRequestContext:(BOOL)a3;
- (void)setHasPegasusRequestContext:(BOOL)a3;
- (void)setHasPerformanceReported:(BOOL)a3;
- (void)setHasPommesPegasusRequestGeoAppResolutionReported:(BOOL)a3;
- (void)setHasPommesRequestContext:(BOOL)a3;
- (void)setHasPommesSearchRequestClassifierExecuted:(BOOL)a3;
- (void)setHasPommesServiceClassifierScoreReported:(BOOL)a3;
- (void)setHasProfileResolutionRequestContext:(BOOL)a3;
- (void)setHasResourceDownloadContext:(BOOL)a3;
- (void)setOnDeviceIndexSearchContext:(id)a3;
- (void)setPegasusKitRequestContext:(id)a3;
- (void)setPegasusRequestContext:(id)a3;
- (void)setPerformanceReported:(id)a3;
- (void)setPommesPegasusRequestGeoAppResolutionReported:(id)a3;
- (void)setPommesRequestContext:(id)a3;
- (void)setPommesSearchRequestClassifierExecuted:(id)a3;
- (void)setPommesServiceClassifierScoreReported:(id)a3;
- (void)setProfileResolutionRequestContext:(id)a3;
- (void)setResourceDownloadContext:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESClientEvent

- (int)componentName
{
  v3 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
  v4 = [v3 pommesId];

  if (!v4) {
    goto LABEL_5;
  }
  uint64_t v5 = [v4 value];
  if (!v5) {
    goto LABEL_5;
  }
  v6 = (void *)v5;
  v7 = [v4 value];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    int v9 = 21;
  }
  else
  {
LABEL_5:
    v10 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (!v11) {
      goto LABEL_9;
    }
    uint64_t v12 = [v11 value];
    if (!v12) {
      goto LABEL_9;
    }
    v13 = (void *)v12;
    v14 = [v11 value];
    uint64_t v15 = [v14 length];

    if (v15)
    {
      int v9 = 1;
      v4 = v11;
    }
    else
    {
LABEL_9:
      v16 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
      v4 = [v16 subRequestId];

      if (!v4) {
        goto LABEL_13;
      }
      uint64_t v17 = [v4 value];
      if (!v17) {
        goto LABEL_13;
      }
      v18 = (void *)v17;
      v19 = [v4 value];
      uint64_t v20 = [v19 length];

      if (v20)
      {
        int v9 = 43;
      }
      else
      {
LABEL_13:
        v21 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
        v22 = [v21 searchToolId];

        if (v22)
        {
          uint64_t v23 = [v22 value];
          if (v23)
          {
            v24 = (void *)v23;
            v25 = [v22 value];
            uint64_t v26 = [v25 length];

            if (v26) {
              int v9 = 55;
            }
            else {
              int v9 = 0;
            }
          }
          else
          {
            int v9 = 0;
          }
          v4 = v22;
        }
        else
        {
          int v9 = 0;
          v4 = 0;
        }
      }
    }
  }

  return v9;
}

- (id)getComponentId
{
  v3 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
  v4 = [v3 pommesId];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_15;
      }
    }
  }
  int v9 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    uint64_t v11 = [v10 value];
    if (v11)
    {
      uint64_t v12 = (void *)v11;
      v13 = [v10 value];
      uint64_t v14 = [v13 length];

      if (v14)
      {
        v4 = v10;
LABEL_15:
        id v22 = v4;
        v21 = v22;
        goto LABEL_17;
      }
    }
  }
  uint64_t v15 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
  v4 = [v15 subRequestId];

  if (v4)
  {
    uint64_t v16 = [v4 value];
    if (v16)
    {
      uint64_t v17 = (void *)v16;
      v18 = [v4 value];
      uint64_t v19 = [v18 length];

      if (v19) {
        goto LABEL_15;
      }
    }
  }
  uint64_t v20 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
  v21 = [v20 searchToolId];

  if (v21)
  {
    id v22 = [v21 value];
    if (!v22) {
      goto LABEL_17;
    }
    uint64_t v23 = [v21 value];
    uint64_t v24 = [v23 length];

    if (v24)
    {
      v4 = v21;
      goto LABEL_15;
    }
  }
  id v22 = 0;
LABEL_17:

  return v22;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v52.receiver = self;
  v52.super_class = (Class)POMMESSchemaPOMMESClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v52 applySensitiveConditionsPolicy:v4];
  v6 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(POMMESSchemaPOMMESClientEvent *)self deleteEventMetadata];
  }
  int v9 = [(POMMESSchemaPOMMESClientEvent *)self pegasusRequestContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(POMMESSchemaPOMMESClientEvent *)self deletePegasusRequestContext];
  }
  uint64_t v12 = [(POMMESSchemaPOMMESClientEvent *)self onDeviceIndexSearchContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(POMMESSchemaPOMMESClientEvent *)self deleteOnDeviceIndexSearchContext];
  }
  uint64_t v15 = [(POMMESSchemaPOMMESClientEvent *)self pommesServiceClassifierScoreReported];
  uint64_t v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(POMMESSchemaPOMMESClientEvent *)self deletePommesServiceClassifierScoreReported];
  }
  v18 = [(POMMESSchemaPOMMESClientEvent *)self pommesRequestContext];
  uint64_t v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(POMMESSchemaPOMMESClientEvent *)self deletePommesRequestContext];
  }
  v21 = [(POMMESSchemaPOMMESClientEvent *)self performanceReported];
  id v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(POMMESSchemaPOMMESClientEvent *)self deletePerformanceReported];
  }
  uint64_t v24 = [(POMMESSchemaPOMMESClientEvent *)self profileResolutionRequestContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(POMMESSchemaPOMMESClientEvent *)self deleteProfileResolutionRequestContext];
  }
  v27 = [(POMMESSchemaPOMMESClientEvent *)self pegasusKitRequestContext];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(POMMESSchemaPOMMESClientEvent *)self deletePegasusKitRequestContext];
  }
  v30 = [(POMMESSchemaPOMMESClientEvent *)self resourceDownloadContext];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(POMMESSchemaPOMMESClientEvent *)self deleteResourceDownloadContext];
  }
  v33 = [(POMMESSchemaPOMMESClientEvent *)self cacheLookupContext];
  v34 = [v33 applySensitiveConditionsPolicy:v4];
  int v35 = [v34 suppressMessage];

  if (v35) {
    [(POMMESSchemaPOMMESClientEvent *)self deleteCacheLookupContext];
  }
  v36 = [(POMMESSchemaPOMMESClientEvent *)self cacheStoringContext];
  v37 = [v36 applySensitiveConditionsPolicy:v4];
  int v38 = [v37 suppressMessage];

  if (v38) {
    [(POMMESSchemaPOMMESClientEvent *)self deleteCacheStoringContext];
  }
  v39 = [(POMMESSchemaPOMMESClientEvent *)self cacheInvalidationContext];
  v40 = [v39 applySensitiveConditionsPolicy:v4];
  int v41 = [v40 suppressMessage];

  if (v41) {
    [(POMMESSchemaPOMMESClientEvent *)self deleteCacheInvalidationContext];
  }
  v42 = [(POMMESSchemaPOMMESClientEvent *)self cacheMaintenanceContext];
  v43 = [v42 applySensitiveConditionsPolicy:v4];
  int v44 = [v43 suppressMessage];

  if (v44) {
    [(POMMESSchemaPOMMESClientEvent *)self deleteCacheMaintenanceContext];
  }
  v45 = [(POMMESSchemaPOMMESClientEvent *)self pommesPegasusRequestGeoAppResolutionReported];
  v46 = [v45 applySensitiveConditionsPolicy:v4];
  int v47 = [v46 suppressMessage];

  if (v47) {
    [(POMMESSchemaPOMMESClientEvent *)self deletePommesPegasusRequestGeoAppResolutionReported];
  }
  v48 = [(POMMESSchemaPOMMESClientEvent *)self pommesSearchRequestClassifierExecuted];
  v49 = [v48 applySensitiveConditionsPolicy:v4];
  int v50 = [v49 suppressMessage];

  if (v50) {
    [(POMMESSchemaPOMMESClientEvent *)self deletePommesSearchRequestClassifierExecuted];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (SISchemaInstrumentationMessage)innerEvent
{
  unint64_t v3 = [(POMMESSchemaPOMMESClientEvent *)self whichEvent_Type];
  if (v3 - 101 > 0xD) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EABA68[v3 - 101]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 101 > 0xD) {
    return 0;
  }
  else {
    return off_1E5EABAD8[a3 - 101];
  }
}

- (int)clockIsolationLevel
{
  if ([(POMMESSchemaPOMMESClientEvent *)self whichEvent_Type] == 112) {
    return 2;
  }
  else {
    return 1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pommesSearchRequestClassifierExecuted, 0);
  objc_storeStrong((id *)&self->_pommesPegasusRequestGeoAppResolutionReported, 0);
  objc_storeStrong((id *)&self->_cacheMaintenanceContext, 0);
  objc_storeStrong((id *)&self->_cacheInvalidationContext, 0);
  objc_storeStrong((id *)&self->_cacheStoringContext, 0);
  objc_storeStrong((id *)&self->_cacheLookupContext, 0);
  objc_storeStrong((id *)&self->_resourceDownloadContext, 0);
  objc_storeStrong((id *)&self->_pegasusKitRequestContext, 0);
  objc_storeStrong((id *)&self->_profileResolutionRequestContext, 0);
  objc_storeStrong((id *)&self->_performanceReported, 0);
  objc_storeStrong((id *)&self->_pommesRequestContext, 0);
  objc_storeStrong((id *)&self->_pommesServiceClassifierScoreReported, 0);
  objc_storeStrong((id *)&self->_onDeviceIndexSearchContext, 0);
  objc_storeStrong((id *)&self->_pegasusRequestContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasPommesSearchRequestClassifierExecuted:(BOOL)a3
{
  self->_hasPommesSearchRequestClassifierExecuted = a3;
}

- (BOOL)hasPommesSearchRequestClassifierExecuted
{
  return self->_hasPommesSearchRequestClassifierExecuted;
}

- (void)setHasPommesPegasusRequestGeoAppResolutionReported:(BOOL)a3
{
  self->_hasPommesPegasusRequestGeoAppResolutionReported = a3;
}

- (BOOL)hasPommesPegasusRequestGeoAppResolutionReported
{
  return self->_hasPommesPegasusRequestGeoAppResolutionReported;
}

- (void)setHasCacheMaintenanceContext:(BOOL)a3
{
  self->_hasCacheMaintenanceContext = a3;
}

- (BOOL)hasCacheMaintenanceContext
{
  return self->_hasCacheMaintenanceContext;
}

- (void)setHasCacheInvalidationContext:(BOOL)a3
{
  self->_hasCacheInvalidationContext = a3;
}

- (BOOL)hasCacheInvalidationContext
{
  return self->_hasCacheInvalidationContext;
}

- (void)setHasCacheStoringContext:(BOOL)a3
{
  self->_hasCacheStoringContext = a3;
}

- (BOOL)hasCacheStoringContext
{
  return self->_hasCacheStoringContext;
}

- (void)setHasCacheLookupContext:(BOOL)a3
{
  self->_hasCacheLookupContext = a3;
}

- (BOOL)hasCacheLookupContext
{
  return self->_hasCacheLookupContext;
}

- (void)setHasResourceDownloadContext:(BOOL)a3
{
  self->_hasResourceDownloadContext = a3;
}

- (BOOL)hasResourceDownloadContext
{
  return self->_hasResourceDownloadContext;
}

- (void)setHasPegasusKitRequestContext:(BOOL)a3
{
  self->_hasPegasusKitRequestContext = a3;
}

- (BOOL)hasPegasusKitRequestContext
{
  return self->_hasPegasusKitRequestContext;
}

- (void)setHasProfileResolutionRequestContext:(BOOL)a3
{
  self->_hasProfileResolutionRequestContext = a3;
}

- (BOOL)hasProfileResolutionRequestContext
{
  return self->_hasProfileResolutionRequestContext;
}

- (void)setHasPerformanceReported:(BOOL)a3
{
  self->_hasPerformanceReported = a3;
}

- (BOOL)hasPerformanceReported
{
  return self->_hasPerformanceReported;
}

- (void)setHasPommesRequestContext:(BOOL)a3
{
  self->_hasPommesRequestContext = a3;
}

- (BOOL)hasPommesRequestContext
{
  return self->_hasPommesRequestContext;
}

- (void)setHasPommesServiceClassifierScoreReported:(BOOL)a3
{
  self->_hasPommesServiceClassifierScoreReported = a3;
}

- (BOOL)hasPommesServiceClassifierScoreReported
{
  return self->_hasPommesServiceClassifierScoreReported;
}

- (void)setHasOnDeviceIndexSearchContext:(BOOL)a3
{
  self->_hasOnDeviceIndexSearchContext = a3;
}

- (BOOL)hasOnDeviceIndexSearchContext
{
  return self->_hasOnDeviceIndexSearchContext;
}

- (void)setHasPegasusRequestContext:(BOOL)a3
{
  self->_hasPegasusRequestContext = a3;
}

- (BOOL)hasPegasusRequestContext
{
  return self->_hasPegasusRequestContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (POMMESSchemaPOMMESClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (POMMESSchemaPOMMESClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v47.receiver = self;
  v47.super_class = (Class)POMMESSchemaPOMMESClientEvent;
  uint64_t v5 = [(POMMESSchemaPOMMESClientEvent *)&v47 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[POMMESSchemaPOMMESClientEventMetadata alloc] initWithDictionary:v6];
      [(POMMESSchemaPOMMESClientEvent *)v5 setEventMetadata:v7];
    }
    uint64_t v8 = [v4 objectForKeyedSubscript:@"pegasusRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [[POMMESSchemaPOMMESPegasusRequestContext alloc] initWithDictionary:v8];
      [(POMMESSchemaPOMMESClientEvent *)v5 setPegasusRequestContext:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"onDeviceIndexSearchContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[POMMESSchemaPOMMESOnDeviceIndexSearchContext alloc] initWithDictionary:v10];
      [(POMMESSchemaPOMMESClientEvent *)v5 setOnDeviceIndexSearchContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"pommesServiceClassifierScoreReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[POMMESSchemaPOMMESServiceClassifierScoreReported alloc] initWithDictionary:v12];
      [(POMMESSchemaPOMMESClientEvent *)v5 setPommesServiceClassifierScoreReported:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"pommesRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v15 = [[POMMESSchemaPOMMESRequestContext alloc] initWithDictionary:v14];
      [(POMMESSchemaPOMMESClientEvent *)v5 setPommesRequestContext:v15];
    }
    uint64_t v16 = [v4 objectForKeyedSubscript:@"performanceReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[POMMESSchemaPOMMESDebugPerformanceReported alloc] initWithDictionary:v16];
      [(POMMESSchemaPOMMESClientEvent *)v5 setPerformanceReported:v17];
    }
    uint64_t v18 = [v4 objectForKeyedSubscript:@"profileResolutionRequestContext"];
    objc_opt_class();
    v46 = (void *)v18;
    if (objc_opt_isKindOfClass())
    {
      uint64_t v19 = [[POMMESSchemaPOMMESProfileSliceResolutionRequestContext alloc] initWithDictionary:v18];
      [(POMMESSchemaPOMMESClientEvent *)v5 setProfileResolutionRequestContext:v19];
    }
    v45 = (void *)v6;
    uint64_t v20 = [v4 objectForKeyedSubscript:@"pegasusKitRequestContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[POMMESSchemaPOMMESPegasusKitPegasusRequestContext alloc] initWithDictionary:v20];
      [(POMMESSchemaPOMMESClientEvent *)v5 setPegasusKitRequestContext:v21];
    }
    v40 = (void *)v20;
    int v44 = (void *)v8;
    uint64_t v22 = [v4 objectForKeyedSubscript:@"resourceDownloadContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[POMMESSchemaPOMMESResourceDownloadContext alloc] initWithDictionary:v22];
      [(POMMESSchemaPOMMESClientEvent *)v5 setResourceDownloadContext:v23];
    }
    v43 = (void *)v10;
    uint64_t v24 = [v4 objectForKeyedSubscript:@"cacheLookupContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = [[POMMESSchemaPOMMESCacheLookupContext alloc] initWithDictionary:v24];
      [(POMMESSchemaPOMMESClientEvent *)v5 setCacheLookupContext:v25];
    }
    v42 = (void *)v12;
    int v26 = [v4 objectForKeyedSubscript:@"cacheStoringContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v27 = [[POMMESSchemaPOMMESCacheStoringContext alloc] initWithDictionary:v26];
      [(POMMESSchemaPOMMESClientEvent *)v5 setCacheStoringContext:v27];
    }
    int v41 = (void *)v14;
    v28 = objc_msgSend(v4, "objectForKeyedSubscript:", @"cacheInvalidationContext", v22);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v29 = [[POMMESSchemaPOMMESCacheInvalidationContext alloc] initWithDictionary:v28];
      [(POMMESSchemaPOMMESClientEvent *)v5 setCacheInvalidationContext:v29];
    }
    v30 = (void *)v16;
    v31 = [v4 objectForKeyedSubscript:@"cacheMaintenanceContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v32 = [[POMMESSchemaPOMMESCacheMaintenanceContext alloc] initWithDictionary:v31];
      [(POMMESSchemaPOMMESClientEvent *)v5 setCacheMaintenanceContext:v32];
    }
    v33 = [v4 objectForKeyedSubscript:@"pommesPegasusRequestGeoAppResolutionReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v34 = [[POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported alloc] initWithDictionary:v33];
      [(POMMESSchemaPOMMESClientEvent *)v5 setPommesPegasusRequestGeoAppResolutionReported:v34];
    }
    int v35 = [v4 objectForKeyedSubscript:@"pommesSearchRequestClassifierExecuted"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v36 = [[POMMESSchemaPOMMESSearchRequestClassifierExecuted alloc] initWithDictionary:v35];
      [(POMMESSchemaPOMMESClientEvent *)v5 setPommesSearchRequestClassifierExecuted:v36];
    }
    v37 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESClientEvent *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_cacheInvalidationContext)
  {
    id v4 = [(POMMESSchemaPOMMESClientEvent *)self cacheInvalidationContext];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"cacheInvalidationContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"cacheInvalidationContext"];
    }
  }
  if (self->_cacheLookupContext)
  {
    uint64_t v7 = [(POMMESSchemaPOMMESClientEvent *)self cacheLookupContext];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"cacheLookupContext"];
    }
    else
    {
      int v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"cacheLookupContext"];
    }
  }
  if (self->_cacheMaintenanceContext)
  {
    uint64_t v10 = [(POMMESSchemaPOMMESClientEvent *)self cacheMaintenanceContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"cacheMaintenanceContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"cacheMaintenanceContext"];
    }
  }
  if (self->_cacheStoringContext)
  {
    v13 = [(POMMESSchemaPOMMESClientEvent *)self cacheStoringContext];
    uint64_t v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"cacheStoringContext"];
    }
    else
    {
      uint64_t v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"cacheStoringContext"];
    }
  }
  if (self->_eventMetadata)
  {
    uint64_t v16 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      uint64_t v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_onDeviceIndexSearchContext)
  {
    uint64_t v19 = [(POMMESSchemaPOMMESClientEvent *)self onDeviceIndexSearchContext];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"onDeviceIndexSearchContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"onDeviceIndexSearchContext"];
    }
  }
  if (self->_pegasusKitRequestContext)
  {
    uint64_t v22 = [(POMMESSchemaPOMMESClientEvent *)self pegasusKitRequestContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"pegasusKitRequestContext"];
    }
    else
    {
      uint64_t v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"pegasusKitRequestContext"];
    }
  }
  if (self->_pegasusRequestContext)
  {
    v25 = [(POMMESSchemaPOMMESClientEvent *)self pegasusRequestContext];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"pegasusRequestContext"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"pegasusRequestContext"];
    }
  }
  if (self->_performanceReported)
  {
    v28 = [(POMMESSchemaPOMMESClientEvent *)self performanceReported];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"performanceReported"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"performanceReported"];
    }
  }
  if (self->_pommesPegasusRequestGeoAppResolutionReported)
  {
    v31 = [(POMMESSchemaPOMMESClientEvent *)self pommesPegasusRequestGeoAppResolutionReported];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"pommesPegasusRequestGeoAppResolutionReported"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"pommesPegasusRequestGeoAppResolutionReported"];
    }
  }
  if (self->_pommesRequestContext)
  {
    v34 = [(POMMESSchemaPOMMESClientEvent *)self pommesRequestContext];
    int v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"pommesRequestContext"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"pommesRequestContext"];
    }
  }
  if (self->_pommesSearchRequestClassifierExecuted)
  {
    v37 = [(POMMESSchemaPOMMESClientEvent *)self pommesSearchRequestClassifierExecuted];
    int v38 = [v37 dictionaryRepresentation];
    if (v38)
    {
      [v3 setObject:v38 forKeyedSubscript:@"pommesSearchRequestClassifierExecuted"];
    }
    else
    {
      v39 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v39 forKeyedSubscript:@"pommesSearchRequestClassifierExecuted"];
    }
  }
  if (self->_pommesServiceClassifierScoreReported)
  {
    v40 = [(POMMESSchemaPOMMESClientEvent *)self pommesServiceClassifierScoreReported];
    int v41 = [v40 dictionaryRepresentation];
    if (v41)
    {
      [v3 setObject:v41 forKeyedSubscript:@"pommesServiceClassifierScoreReported"];
    }
    else
    {
      v42 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v42 forKeyedSubscript:@"pommesServiceClassifierScoreReported"];
    }
  }
  if (self->_profileResolutionRequestContext)
  {
    v43 = [(POMMESSchemaPOMMESClientEvent *)self profileResolutionRequestContext];
    int v44 = [v43 dictionaryRepresentation];
    if (v44)
    {
      [v3 setObject:v44 forKeyedSubscript:@"profileResolutionRequestContext"];
    }
    else
    {
      v45 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v45 forKeyedSubscript:@"profileResolutionRequestContext"];
    }
  }
  if (self->_resourceDownloadContext)
  {
    v46 = [(POMMESSchemaPOMMESClientEvent *)self resourceDownloadContext];
    objc_super v47 = [v46 dictionaryRepresentation];
    if (v47)
    {
      [v3 setObject:v47 forKeyedSubscript:@"resourceDownloadContext"];
    }
    else
    {
      v48 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v48 forKeyedSubscript:@"resourceDownloadContext"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(POMMESSchemaPOMMESClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(POMMESSchemaPOMMESPegasusRequestContext *)self->_pegasusRequestContext hash] ^ v3;
  unint64_t v5 = [(POMMESSchemaPOMMESOnDeviceIndexSearchContext *)self->_onDeviceIndexSearchContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(POMMESSchemaPOMMESServiceClassifierScoreReported *)self->_pommesServiceClassifierScoreReported hash];
  unint64_t v7 = [(POMMESSchemaPOMMESRequestContext *)self->_pommesRequestContext hash];
  unint64_t v8 = v7 ^ [(POMMESSchemaPOMMESDebugPerformanceReported *)self->_performanceReported hash];
  unint64_t v9 = v6 ^ v8 ^ [(POMMESSchemaPOMMESProfileSliceResolutionRequestContext *)self->_profileResolutionRequestContext hash];
  unint64_t v10 = [(POMMESSchemaPOMMESPegasusKitPegasusRequestContext *)self->_pegasusKitRequestContext hash];
  unint64_t v11 = v10 ^ [(POMMESSchemaPOMMESResourceDownloadContext *)self->_resourceDownloadContext hash];
  unint64_t v12 = v11 ^ [(POMMESSchemaPOMMESCacheLookupContext *)self->_cacheLookupContext hash];
  unint64_t v13 = v9 ^ v12 ^ [(POMMESSchemaPOMMESCacheStoringContext *)self->_cacheStoringContext hash];
  unint64_t v14 = [(POMMESSchemaPOMMESCacheInvalidationContext *)self->_cacheInvalidationContext hash];
  unint64_t v15 = v14 ^ [(POMMESSchemaPOMMESCacheMaintenanceContext *)self->_cacheMaintenanceContext hash];
  unint64_t v16 = v15 ^ [(POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *)self->_pommesPegasusRequestGeoAppResolutionReported hash];
  return v13 ^ v16 ^ [(POMMESSchemaPOMMESSearchRequestClassifierExecuted *)self->_pommesSearchRequestClassifierExecuted hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_78;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_78;
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v8 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    unint64_t v10 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
    unint64_t v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self pegasusRequestContext];
  unint64_t v7 = [v4 pegasusRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v13 = [(POMMESSchemaPOMMESClientEvent *)self pegasusRequestContext];
  if (v13)
  {
    unint64_t v14 = (void *)v13;
    unint64_t v15 = [(POMMESSchemaPOMMESClientEvent *)self pegasusRequestContext];
    unint64_t v16 = [v4 pegasusRequestContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self onDeviceIndexSearchContext];
  unint64_t v7 = [v4 onDeviceIndexSearchContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v18 = [(POMMESSchemaPOMMESClientEvent *)self onDeviceIndexSearchContext];
  if (v18)
  {
    uint64_t v19 = (void *)v18;
    uint64_t v20 = [(POMMESSchemaPOMMESClientEvent *)self onDeviceIndexSearchContext];
    v21 = [v4 onDeviceIndexSearchContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self pommesServiceClassifierScoreReported];
  unint64_t v7 = [v4 pommesServiceClassifierScoreReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v23 = [(POMMESSchemaPOMMESClientEvent *)self pommesServiceClassifierScoreReported];
  if (v23)
  {
    uint64_t v24 = (void *)v23;
    v25 = [(POMMESSchemaPOMMESClientEvent *)self pommesServiceClassifierScoreReported];
    int v26 = [v4 pommesServiceClassifierScoreReported];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self pommesRequestContext];
  unint64_t v7 = [v4 pommesRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v28 = [(POMMESSchemaPOMMESClientEvent *)self pommesRequestContext];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(POMMESSchemaPOMMESClientEvent *)self pommesRequestContext];
    v31 = [v4 pommesRequestContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self performanceReported];
  unint64_t v7 = [v4 performanceReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v33 = [(POMMESSchemaPOMMESClientEvent *)self performanceReported];
  if (v33)
  {
    v34 = (void *)v33;
    int v35 = [(POMMESSchemaPOMMESClientEvent *)self performanceReported];
    v36 = [v4 performanceReported];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self profileResolutionRequestContext];
  unint64_t v7 = [v4 profileResolutionRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v38 = [(POMMESSchemaPOMMESClientEvent *)self profileResolutionRequestContext];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(POMMESSchemaPOMMESClientEvent *)self profileResolutionRequestContext];
    int v41 = [v4 profileResolutionRequestContext];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self pegasusKitRequestContext];
  unint64_t v7 = [v4 pegasusKitRequestContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v43 = [(POMMESSchemaPOMMESClientEvent *)self pegasusKitRequestContext];
  if (v43)
  {
    int v44 = (void *)v43;
    v45 = [(POMMESSchemaPOMMESClientEvent *)self pegasusKitRequestContext];
    v46 = [v4 pegasusKitRequestContext];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self resourceDownloadContext];
  unint64_t v7 = [v4 resourceDownloadContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v48 = [(POMMESSchemaPOMMESClientEvent *)self resourceDownloadContext];
  if (v48)
  {
    v49 = (void *)v48;
    int v50 = [(POMMESSchemaPOMMESClientEvent *)self resourceDownloadContext];
    v51 = [v4 resourceDownloadContext];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self cacheLookupContext];
  unint64_t v7 = [v4 cacheLookupContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v53 = [(POMMESSchemaPOMMESClientEvent *)self cacheLookupContext];
  if (v53)
  {
    v54 = (void *)v53;
    v55 = [(POMMESSchemaPOMMESClientEvent *)self cacheLookupContext];
    v56 = [v4 cacheLookupContext];
    int v57 = [v55 isEqual:v56];

    if (!v57) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self cacheStoringContext];
  unint64_t v7 = [v4 cacheStoringContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v58 = [(POMMESSchemaPOMMESClientEvent *)self cacheStoringContext];
  if (v58)
  {
    v59 = (void *)v58;
    v60 = [(POMMESSchemaPOMMESClientEvent *)self cacheStoringContext];
    v61 = [v4 cacheStoringContext];
    int v62 = [v60 isEqual:v61];

    if (!v62) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self cacheInvalidationContext];
  unint64_t v7 = [v4 cacheInvalidationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v63 = [(POMMESSchemaPOMMESClientEvent *)self cacheInvalidationContext];
  if (v63)
  {
    v64 = (void *)v63;
    v65 = [(POMMESSchemaPOMMESClientEvent *)self cacheInvalidationContext];
    v66 = [v4 cacheInvalidationContext];
    int v67 = [v65 isEqual:v66];

    if (!v67) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self cacheMaintenanceContext];
  unint64_t v7 = [v4 cacheMaintenanceContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v68 = [(POMMESSchemaPOMMESClientEvent *)self cacheMaintenanceContext];
  if (v68)
  {
    v69 = (void *)v68;
    v70 = [(POMMESSchemaPOMMESClientEvent *)self cacheMaintenanceContext];
    v71 = [v4 cacheMaintenanceContext];
    int v72 = [v70 isEqual:v71];

    if (!v72) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self pommesPegasusRequestGeoAppResolutionReported];
  unint64_t v7 = [v4 pommesPegasusRequestGeoAppResolutionReported];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_77;
  }
  uint64_t v73 = [(POMMESSchemaPOMMESClientEvent *)self pommesPegasusRequestGeoAppResolutionReported];
  if (v73)
  {
    v74 = (void *)v73;
    v75 = [(POMMESSchemaPOMMESClientEvent *)self pommesPegasusRequestGeoAppResolutionReported];
    v76 = [v4 pommesPegasusRequestGeoAppResolutionReported];
    int v77 = [v75 isEqual:v76];

    if (!v77) {
      goto LABEL_78;
    }
  }
  else
  {
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self pommesSearchRequestClassifierExecuted];
  unint64_t v7 = [v4 pommesSearchRequestClassifierExecuted];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v78 = [(POMMESSchemaPOMMESClientEvent *)self pommesSearchRequestClassifierExecuted];
    if (!v78)
    {

LABEL_81:
      BOOL v83 = 1;
      goto LABEL_79;
    }
    v79 = (void *)v78;
    v80 = [(POMMESSchemaPOMMESClientEvent *)self pommesSearchRequestClassifierExecuted];
    v81 = [v4 pommesSearchRequestClassifierExecuted];
    char v82 = [v80 isEqual:v81];

    if (v82) {
      goto LABEL_81;
    }
  }
  else
  {
LABEL_77:
  }
LABEL_78:
  BOOL v83 = 0;
LABEL_79:

  return v83;
}

- (void)writeTo:(id)a3
{
  id v34 = a3;
  id v4 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(POMMESSchemaPOMMESClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(POMMESSchemaPOMMESClientEvent *)self pegasusRequestContext];

  if (v6)
  {
    unint64_t v7 = [(POMMESSchemaPOMMESClientEvent *)self pegasusRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(POMMESSchemaPOMMESClientEvent *)self onDeviceIndexSearchContext];

  if (v8)
  {
    unint64_t v9 = [(POMMESSchemaPOMMESClientEvent *)self onDeviceIndexSearchContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(POMMESSchemaPOMMESClientEvent *)self pommesServiceClassifierScoreReported];

  if (v10)
  {
    unint64_t v11 = [(POMMESSchemaPOMMESClientEvent *)self pommesServiceClassifierScoreReported];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(POMMESSchemaPOMMESClientEvent *)self pommesRequestContext];

  if (v12)
  {
    uint64_t v13 = [(POMMESSchemaPOMMESClientEvent *)self pommesRequestContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v14 = [(POMMESSchemaPOMMESClientEvent *)self performanceReported];

  if (v14)
  {
    unint64_t v15 = [(POMMESSchemaPOMMESClientEvent *)self performanceReported];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v16 = [(POMMESSchemaPOMMESClientEvent *)self profileResolutionRequestContext];

  if (v16)
  {
    int v17 = [(POMMESSchemaPOMMESClientEvent *)self profileResolutionRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(POMMESSchemaPOMMESClientEvent *)self pegasusKitRequestContext];

  if (v18)
  {
    uint64_t v19 = [(POMMESSchemaPOMMESClientEvent *)self pegasusKitRequestContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v20 = [(POMMESSchemaPOMMESClientEvent *)self resourceDownloadContext];

  if (v20)
  {
    v21 = [(POMMESSchemaPOMMESClientEvent *)self resourceDownloadContext];
    PBDataWriterWriteSubmessage();
  }
  int v22 = [(POMMESSchemaPOMMESClientEvent *)self cacheLookupContext];

  if (v22)
  {
    uint64_t v23 = [(POMMESSchemaPOMMESClientEvent *)self cacheLookupContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v24 = [(POMMESSchemaPOMMESClientEvent *)self cacheStoringContext];

  if (v24)
  {
    v25 = [(POMMESSchemaPOMMESClientEvent *)self cacheStoringContext];
    PBDataWriterWriteSubmessage();
  }
  int v26 = [(POMMESSchemaPOMMESClientEvent *)self cacheInvalidationContext];

  if (v26)
  {
    int v27 = [(POMMESSchemaPOMMESClientEvent *)self cacheInvalidationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v28 = [(POMMESSchemaPOMMESClientEvent *)self cacheMaintenanceContext];

  if (v28)
  {
    int v29 = [(POMMESSchemaPOMMESClientEvent *)self cacheMaintenanceContext];
    PBDataWriterWriteSubmessage();
  }
  v30 = [(POMMESSchemaPOMMESClientEvent *)self pommesPegasusRequestGeoAppResolutionReported];

  if (v30)
  {
    v31 = [(POMMESSchemaPOMMESClientEvent *)self pommesPegasusRequestGeoAppResolutionReported];
    PBDataWriterWriteSubmessage();
  }
  int v32 = [(POMMESSchemaPOMMESClientEvent *)self pommesSearchRequestClassifierExecuted];

  if (v32)
  {
    uint64_t v33 = [(POMMESSchemaPOMMESClientEvent *)self pommesSearchRequestClassifierExecuted];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deletePommesSearchRequestClassifierExecuted
{
  if (self->_whichEvent_Type == 114)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pommesSearchRequestClassifierExecuted = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESSearchRequestClassifierExecuted)pommesSearchRequestClassifierExecuted
{
  if (self->_whichEvent_Type == 114) {
    v2 = self->_pommesSearchRequestClassifierExecuted;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPommesSearchRequestClassifierExecuted:(id)a3
{
  id v4 = (POMMESSchemaPOMMESSearchRequestClassifierExecuted *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  unint64_t v18 = 114;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = v4;
}

- (void)deletePommesPegasusRequestGeoAppResolutionReported
{
  if (self->_whichEvent_Type == 113)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pommesPegasusRequestGeoAppResolutionReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported)pommesPegasusRequestGeoAppResolutionReported
{
  if (self->_whichEvent_Type == 113) {
    v2 = self->_pommesPegasusRequestGeoAppResolutionReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPommesPegasusRequestGeoAppResolutionReported:(id)a3
{
  id v4 = (POMMESSchemaPOMMESPegasusRequestGeoAppResolutionReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 113;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = v4;
}

- (void)deleteCacheMaintenanceContext
{
  if (self->_whichEvent_Type == 112)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_cacheMaintenanceContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESCacheMaintenanceContext)cacheMaintenanceContext
{
  if (self->_whichEvent_Type == 112) {
    v2 = self->_cacheMaintenanceContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCacheMaintenanceContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESCacheMaintenanceContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 112;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = v4;
}

- (void)deleteCacheInvalidationContext
{
  if (self->_whichEvent_Type == 111)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_cacheInvalidationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESCacheInvalidationContext)cacheInvalidationContext
{
  if (self->_whichEvent_Type == 111) {
    v2 = self->_cacheInvalidationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCacheInvalidationContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESCacheInvalidationContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 111;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = v4;
}

- (void)deleteCacheStoringContext
{
  if (self->_whichEvent_Type == 110)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_cacheStoringContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESCacheStoringContext)cacheStoringContext
{
  if (self->_whichEvent_Type == 110) {
    v2 = self->_cacheStoringContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCacheStoringContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESCacheStoringContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 110;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = v4;
}

- (void)deleteCacheLookupContext
{
  if (self->_whichEvent_Type == 109)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_cacheLookupContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESCacheLookupContext)cacheLookupContext
{
  if (self->_whichEvent_Type == 109) {
    v2 = self->_cacheLookupContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCacheLookupContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESCacheLookupContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 109;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = v4;
}

- (void)deleteResourceDownloadContext
{
  if (self->_whichEvent_Type == 108)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_resourceDownloadContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESResourceDownloadContext)resourceDownloadContext
{
  if (self->_whichEvent_Type == 108) {
    v2 = self->_resourceDownloadContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setResourceDownloadContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESResourceDownloadContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 108;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = v4;
}

- (void)deletePegasusKitRequestContext
{
  if (self->_whichEvent_Type == 107)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusKitRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESPegasusKitPegasusRequestContext)pegasusKitRequestContext
{
  if (self->_whichEvent_Type == 107) {
    v2 = self->_pegasusKitRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusKitRequestContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESPegasusKitPegasusRequestContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 107;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = v4;
}

- (void)deleteProfileResolutionRequestContext
{
  if (self->_whichEvent_Type == 106)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_profileResolutionRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESProfileSliceResolutionRequestContext)profileResolutionRequestContext
{
  if (self->_whichEvent_Type == 106) {
    v2 = self->_profileResolutionRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setProfileResolutionRequestContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESProfileSliceResolutionRequestContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 106;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = v4;
}

- (void)deletePerformanceReported
{
  if (self->_whichEvent_Type == 105)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_performanceReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESDebugPerformanceReported)performanceReported
{
  if (self->_whichEvent_Type == 105) {
    v2 = self->_performanceReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPerformanceReported:(id)a3
{
  id v4 = (POMMESSchemaPOMMESDebugPerformanceReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 105;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  performanceReported = self->_performanceReported;
  self->_performanceReported = v4;
}

- (void)deletePommesRequestContext
{
  if (self->_whichEvent_Type == 104)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pommesRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESRequestContext)pommesRequestContext
{
  if (self->_whichEvent_Type == 104) {
    v2 = self->_pommesRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPommesRequestContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESRequestContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 104;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = v4;
}

- (void)deletePommesServiceClassifierScoreReported
{
  if (self->_whichEvent_Type == 103)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pommesServiceClassifierScoreReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESServiceClassifierScoreReported)pommesServiceClassifierScoreReported
{
  if (self->_whichEvent_Type == 103) {
    v2 = self->_pommesServiceClassifierScoreReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPommesServiceClassifierScoreReported:(id)a3
{
  id v4 = (POMMESSchemaPOMMESServiceClassifierScoreReported *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 103;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = v4;
}

- (void)deleteOnDeviceIndexSearchContext
{
  if (self->_whichEvent_Type == 102)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_onDeviceIndexSearchContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESOnDeviceIndexSearchContext)onDeviceIndexSearchContext
{
  if (self->_whichEvent_Type == 102) {
    v2 = self->_onDeviceIndexSearchContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setOnDeviceIndexSearchContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESOnDeviceIndexSearchContext *)a3;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 102;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = v4;
}

- (void)deletePegasusRequestContext
{
  if (self->_whichEvent_Type == 101)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_pegasusRequestContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (POMMESSchemaPOMMESPegasusRequestContext)pegasusRequestContext
{
  if (self->_whichEvent_Type == 101) {
    v2 = self->_pegasusRequestContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setPegasusRequestContext:(id)a3
{
  id v4 = (POMMESSchemaPOMMESPegasusRequestContext *)a3;
  onDeviceIndexSearchContext = self->_onDeviceIndexSearchContext;
  self->_onDeviceIndexSearchContext = 0;

  pommesServiceClassifierScoreReported = self->_pommesServiceClassifierScoreReported;
  self->_pommesServiceClassifierScoreReported = 0;

  pommesRequestContext = self->_pommesRequestContext;
  self->_pommesRequestContext = 0;

  performanceReported = self->_performanceReported;
  self->_performanceReported = 0;

  profileResolutionRequestContext = self->_profileResolutionRequestContext;
  self->_profileResolutionRequestContext = 0;

  pegasusKitRequestContext = self->_pegasusKitRequestContext;
  self->_pegasusKitRequestContext = 0;

  resourceDownloadContext = self->_resourceDownloadContext;
  self->_resourceDownloadContext = 0;

  cacheLookupContext = self->_cacheLookupContext;
  self->_cacheLookupContext = 0;

  cacheStoringContext = self->_cacheStoringContext;
  self->_cacheStoringContext = 0;

  cacheInvalidationContext = self->_cacheInvalidationContext;
  self->_cacheInvalidationContext = 0;

  cacheMaintenanceContext = self->_cacheMaintenanceContext;
  self->_cacheMaintenanceContext = 0;

  pommesPegasusRequestGeoAppResolutionReported = self->_pommesPegasusRequestGeoAppResolutionReported;
  self->_pommesPegasusRequestGeoAppResolutionReported = 0;

  pommesSearchRequestClassifierExecuted = self->_pommesSearchRequestClassifierExecuted;
  self->_pommesSearchRequestClassifierExecuted = 0;

  unint64_t v18 = 101;
  if (!v4) {
    unint64_t v18 = 0;
  }
  self->_unint64_t whichEvent_Type = v18;
  pegasusRequestContext = self->_pegasusRequestContext;
  self->_pegasusRequestContext = v4;
}

- (void)deleteEventMetadata
{
}

- (BOOL)hasEventMetadata
{
  return self->_eventMetadata != 0;
}

- (id)qualifiedMessageName
{
  unint64_t v2 = [(POMMESSchemaPOMMESClientEvent *)self whichEvent_Type];
  if (v2 - 101 > 0xD) {
    return @"com.apple.aiml.siri.pommes.POMMESClientEvent";
  }
  else {
    return off_1E5EB4230[v2 - 101];
  }
}

- (int)getAnyEventType
{
  return 42;
}

@end
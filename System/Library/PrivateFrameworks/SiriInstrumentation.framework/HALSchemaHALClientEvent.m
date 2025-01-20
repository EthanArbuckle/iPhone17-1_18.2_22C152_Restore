@interface HALSchemaHALClientEvent
+ (id)getInnerTypeStringByTag:(unint64_t)a3;
+ (int)joinability;
- (BOOL)hasCompanionDeviceCommunicationContext;
- (BOOL)hasCompanionDeviceDiscoveryContext;
- (BOOL)hasContextCollectorFetchContext;
- (BOOL)hasCrossDeviceCommandContext;
- (BOOL)hasEventMetadata;
- (BOOL)hasForceFetchContext;
- (BOOL)hasLocalFetchContext;
- (BOOL)hasNearbyPersonalDevicesReported;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (HALSchemaHALClientEvent)initWithDictionary:(id)a3;
- (HALSchemaHALClientEvent)initWithJSON:(id)a3;
- (HALSchemaHALClientEventMetadata)eventMetadata;
- (HALSchemaHALCompanionDeviceCommunicationContext)companionDeviceCommunicationContext;
- (HALSchemaHALCompanionDeviceDiscoveryContext)companionDeviceDiscoveryContext;
- (HALSchemaHALContextCollectorFetchContext)contextCollectorFetchContext;
- (HALSchemaHALCrossDeviceCommandExecutionContext)crossDeviceCommandContext;
- (HALSchemaHALForceFetchContext)forceFetchContext;
- (HALSchemaHALLocalFetchContext)localFetchContext;
- (HALSchemaHALNearbyPersonalDevicesReported)nearbyPersonalDevicesReported;
- (NSData)jsonData;
- (SISchemaInstrumentationMessage)innerEvent;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)getComponentId;
- (id)qualifiedMessageName;
- (id)suppressMessageUnderConditions;
- (int)componentName;
- (int)getAnyEventType;
- (unint64_t)hash;
- (unint64_t)whichEvent_Type;
- (void)deleteCompanionDeviceCommunicationContext;
- (void)deleteCompanionDeviceDiscoveryContext;
- (void)deleteContextCollectorFetchContext;
- (void)deleteCrossDeviceCommandContext;
- (void)deleteEventMetadata;
- (void)deleteForceFetchContext;
- (void)deleteLocalFetchContext;
- (void)deleteNearbyPersonalDevicesReported;
- (void)setCompanionDeviceCommunicationContext:(id)a3;
- (void)setCompanionDeviceDiscoveryContext:(id)a3;
- (void)setContextCollectorFetchContext:(id)a3;
- (void)setCrossDeviceCommandContext:(id)a3;
- (void)setEventMetadata:(id)a3;
- (void)setForceFetchContext:(id)a3;
- (void)setHasCompanionDeviceCommunicationContext:(BOOL)a3;
- (void)setHasCompanionDeviceDiscoveryContext:(BOOL)a3;
- (void)setHasContextCollectorFetchContext:(BOOL)a3;
- (void)setHasCrossDeviceCommandContext:(BOOL)a3;
- (void)setHasEventMetadata:(BOOL)a3;
- (void)setHasForceFetchContext:(BOOL)a3;
- (void)setHasLocalFetchContext:(BOOL)a3;
- (void)setHasNearbyPersonalDevicesReported:(BOOL)a3;
- (void)setLocalFetchContext:(id)a3;
- (void)setNearbyPersonalDevicesReported:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation HALSchemaHALClientEvent

- (int)componentName
{
  v3 = [(HALSchemaHALClientEvent *)self eventMetadata];
  v4 = [v3 halId];

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
    int v9 = 17;
  }
  else
  {
LABEL_5:
    v10 = [(HALSchemaHALClientEvent *)self eventMetadata];
    v11 = [v10 requestId];

    if (v11)
    {
      uint64_t v12 = [v11 value];
      if (v12)
      {
        v13 = (void *)v12;
        v14 = [v11 value];
        int v9 = [v14 length] != 0;
      }
      else
      {
        int v9 = 0;
      }
      v4 = v11;
    }
    else
    {
      int v9 = 0;
      v4 = 0;
    }
  }

  return v9;
}

- (id)getComponentId
{
  v3 = [(HALSchemaHALClientEvent *)self eventMetadata];
  v4 = [v3 halId];

  if (v4)
  {
    uint64_t v5 = [v4 value];
    if (v5)
    {
      v6 = (void *)v5;
      v7 = [v4 value];
      uint64_t v8 = [v7 length];

      if (v8) {
        goto LABEL_8;
      }
    }
  }
  int v9 = [(HALSchemaHALClientEvent *)self eventMetadata];
  v10 = [v9 requestId];

  if (v10)
  {
    id v11 = [v10 value];
    if (!v11) {
      goto LABEL_10;
    }
    uint64_t v12 = [v10 value];
    uint64_t v13 = [v12 length];

    if (v13)
    {
      v4 = v10;
LABEL_8:
      id v11 = v4;
      v10 = v11;
      goto LABEL_10;
    }
  }
  id v11 = 0;
LABEL_10:

  return v11;
}

+ (int)joinability
{
  return 2;
}

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)HALSchemaHALClientEvent;
  uint64_t v5 = [(SISchemaInstrumentationMessage *)&v31 applySensitiveConditionsPolicy:v4];
  v6 = [(HALSchemaHALClientEvent *)self eventMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(HALSchemaHALClientEvent *)self deleteEventMetadata];
  }
  int v9 = [(HALSchemaHALClientEvent *)self crossDeviceCommandContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(HALSchemaHALClientEvent *)self deleteCrossDeviceCommandContext];
  }
  uint64_t v12 = [(HALSchemaHALClientEvent *)self localFetchContext];
  uint64_t v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(HALSchemaHALClientEvent *)self deleteLocalFetchContext];
  }
  v15 = [(HALSchemaHALClientEvent *)self contextCollectorFetchContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(HALSchemaHALClientEvent *)self deleteContextCollectorFetchContext];
  }
  v18 = [(HALSchemaHALClientEvent *)self forceFetchContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(HALSchemaHALClientEvent *)self deleteForceFetchContext];
  }
  v21 = [(HALSchemaHALClientEvent *)self companionDeviceDiscoveryContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(HALSchemaHALClientEvent *)self deleteCompanionDeviceDiscoveryContext];
  }
  v24 = [(HALSchemaHALClientEvent *)self companionDeviceCommunicationContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(HALSchemaHALClientEvent *)self deleteCompanionDeviceCommunicationContext];
  }
  v27 = [(HALSchemaHALClientEvent *)self nearbyPersonalDevicesReported];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(HALSchemaHALClientEvent *)self deleteNearbyPersonalDevicesReported];
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
  unint64_t v3 = [(HALSchemaHALClientEvent *)self whichEvent_Type];
  if (v3 - 2 > 6) {
    id v4 = 0;
  }
  else {
    id v4 = *(id *)((char *)&self->super.super.super.super.isa + *off_1E5EAA6D8[v3 - 2]);
  }
  return (SISchemaInstrumentationMessage *)v4;
}

+ (id)getInnerTypeStringByTag:(unint64_t)a3
{
  if (a3 - 2 > 6) {
    return 0;
  }
  else {
    return off_1E5EAA710[a3 - 2];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nearbyPersonalDevicesReported, 0);
  objc_storeStrong((id *)&self->_companionDeviceCommunicationContext, 0);
  objc_storeStrong((id *)&self->_companionDeviceDiscoveryContext, 0);
  objc_storeStrong((id *)&self->_forceFetchContext, 0);
  objc_storeStrong((id *)&self->_contextCollectorFetchContext, 0);
  objc_storeStrong((id *)&self->_localFetchContext, 0);
  objc_storeStrong((id *)&self->_crossDeviceCommandContext, 0);
  objc_storeStrong((id *)&self->_eventMetadata, 0);
}

- (void)setHasNearbyPersonalDevicesReported:(BOOL)a3
{
  self->_hasNearbyPersonalDevicesReported = a3;
}

- (BOOL)hasNearbyPersonalDevicesReported
{
  return self->_hasNearbyPersonalDevicesReported;
}

- (void)setHasCompanionDeviceCommunicationContext:(BOOL)a3
{
  self->_hasCompanionDeviceCommunicationContext = a3;
}

- (BOOL)hasCompanionDeviceCommunicationContext
{
  return self->_hasCompanionDeviceCommunicationContext;
}

- (void)setHasCompanionDeviceDiscoveryContext:(BOOL)a3
{
  self->_hasCompanionDeviceDiscoveryContext = a3;
}

- (BOOL)hasCompanionDeviceDiscoveryContext
{
  return self->_hasCompanionDeviceDiscoveryContext;
}

- (void)setHasForceFetchContext:(BOOL)a3
{
  self->_hasForceFetchContext = a3;
}

- (BOOL)hasForceFetchContext
{
  return self->_hasForceFetchContext;
}

- (void)setHasContextCollectorFetchContext:(BOOL)a3
{
  self->_hasContextCollectorFetchContext = a3;
}

- (BOOL)hasContextCollectorFetchContext
{
  return self->_hasContextCollectorFetchContext;
}

- (void)setHasLocalFetchContext:(BOOL)a3
{
  self->_hasLocalFetchContext = a3;
}

- (BOOL)hasLocalFetchContext
{
  return self->_hasLocalFetchContext;
}

- (void)setHasCrossDeviceCommandContext:(BOOL)a3
{
  self->_hasCrossDeviceCommandContext = a3;
}

- (BOOL)hasCrossDeviceCommandContext
{
  return self->_hasCrossDeviceCommandContext;
}

- (void)setHasEventMetadata:(BOOL)a3
{
  self->_hasEventMetadata = a3;
}

- (void)setEventMetadata:(id)a3
{
}

- (HALSchemaHALClientEventMetadata)eventMetadata
{
  return self->_eventMetadata;
}

- (unint64_t)whichEvent_Type
{
  return self->_whichEvent_Type;
}

- (HALSchemaHALClientEvent)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)HALSchemaHALClientEvent;
  uint64_t v5 = [(HALSchemaHALClientEvent *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"eventMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[HALSchemaHALClientEventMetadata alloc] initWithDictionary:v6];
      [(HALSchemaHALClientEvent *)v5 setEventMetadata:v7];
    }
    v24 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"crossDeviceCommandContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v9 = [[HALSchemaHALCrossDeviceCommandExecutionContext alloc] initWithDictionary:v8];
      [(HALSchemaHALClientEvent *)v5 setCrossDeviceCommandContext:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"localFetchContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[HALSchemaHALLocalFetchContext alloc] initWithDictionary:v10];
      [(HALSchemaHALClientEvent *)v5 setLocalFetchContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"contextCollectorFetchContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v13 = [[HALSchemaHALContextCollectorFetchContext alloc] initWithDictionary:v12];
      [(HALSchemaHALClientEvent *)v5 setContextCollectorFetchContext:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"forceFetchContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[HALSchemaHALForceFetchContext alloc] initWithDictionary:v14];
      [(HALSchemaHALClientEvent *)v5 setForceFetchContext:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"companionDeviceDiscoveryContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[HALSchemaHALCompanionDeviceDiscoveryContext alloc] initWithDictionary:v16];
      [(HALSchemaHALClientEvent *)v5 setCompanionDeviceDiscoveryContext:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"companionDeviceCommunicationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[HALSchemaHALCompanionDeviceCommunicationContext alloc] initWithDictionary:v18];
      [(HALSchemaHALClientEvent *)v5 setCompanionDeviceCommunicationContext:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"nearbyPersonalDevicesReported"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[HALSchemaHALNearbyPersonalDevicesReported alloc] initWithDictionary:v20];
      [(HALSchemaHALClientEvent *)v5 setNearbyPersonalDevicesReported:v21];
    }
    v22 = v5;
  }
  return v5;
}

- (HALSchemaHALClientEvent)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v5 = 0;
  }
  else
  {
    self = [(HALSchemaHALClientEvent *)self initWithDictionary:v4];
    uint64_t v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HALSchemaHALClientEvent *)self dictionaryRepresentation];
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
  if (self->_companionDeviceCommunicationContext)
  {
    id v4 = [(HALSchemaHALClientEvent *)self companionDeviceCommunicationContext];
    uint64_t v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"companionDeviceCommunicationContext"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"companionDeviceCommunicationContext"];
    }
  }
  if (self->_companionDeviceDiscoveryContext)
  {
    uint64_t v7 = [(HALSchemaHALClientEvent *)self companionDeviceDiscoveryContext];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"companionDeviceDiscoveryContext"];
    }
    else
    {
      int v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"companionDeviceDiscoveryContext"];
    }
  }
  if (self->_contextCollectorFetchContext)
  {
    v10 = [(HALSchemaHALClientEvent *)self contextCollectorFetchContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"contextCollectorFetchContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"contextCollectorFetchContext"];
    }
  }
  if (self->_crossDeviceCommandContext)
  {
    uint64_t v13 = [(HALSchemaHALClientEvent *)self crossDeviceCommandContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"crossDeviceCommandContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"crossDeviceCommandContext"];
    }
  }
  if (self->_eventMetadata)
  {
    v16 = [(HALSchemaHALClientEvent *)self eventMetadata];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"eventMetadata"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"eventMetadata"];
    }
  }
  if (self->_forceFetchContext)
  {
    v19 = [(HALSchemaHALClientEvent *)self forceFetchContext];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"forceFetchContext"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"forceFetchContext"];
    }
  }
  if (self->_localFetchContext)
  {
    v22 = [(HALSchemaHALClientEvent *)self localFetchContext];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"localFetchContext"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"localFetchContext"];
    }
  }
  if (self->_nearbyPersonalDevicesReported)
  {
    objc_super v25 = [(HALSchemaHALClientEvent *)self nearbyPersonalDevicesReported];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"nearbyPersonalDevicesReported"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"nearbyPersonalDevicesReported"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(HALSchemaHALClientEventMetadata *)self->_eventMetadata hash];
  unint64_t v4 = [(HALSchemaHALCrossDeviceCommandExecutionContext *)self->_crossDeviceCommandContext hash] ^ v3;
  unint64_t v5 = [(HALSchemaHALLocalFetchContext *)self->_localFetchContext hash];
  unint64_t v6 = v4 ^ v5 ^ [(HALSchemaHALContextCollectorFetchContext *)self->_contextCollectorFetchContext hash];
  unint64_t v7 = [(HALSchemaHALForceFetchContext *)self->_forceFetchContext hash];
  unint64_t v8 = v7 ^ [(HALSchemaHALCompanionDeviceDiscoveryContext *)self->_companionDeviceDiscoveryContext hash];
  unint64_t v9 = v6 ^ v8 ^ [(HALSchemaHALCompanionDeviceCommunicationContext *)self->_companionDeviceCommunicationContext hash];
  return v9 ^ [(HALSchemaHALNearbyPersonalDevicesReported *)self->_nearbyPersonalDevicesReported hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_43;
  }
  unint64_t whichEvent_Type = self->_whichEvent_Type;
  if (whichEvent_Type != objc_msgSend(v4, "whichEvent_Type")) {
    goto LABEL_43;
  }
  unint64_t v6 = [(HALSchemaHALClientEvent *)self eventMetadata];
  unint64_t v7 = [v4 eventMetadata];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v8 = [(HALSchemaHALClientEvent *)self eventMetadata];
  if (v8)
  {
    unint64_t v9 = (void *)v8;
    v10 = [(HALSchemaHALClientEvent *)self eventMetadata];
    int v11 = [v4 eventMetadata];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(HALSchemaHALClientEvent *)self crossDeviceCommandContext];
  unint64_t v7 = [v4 crossDeviceCommandContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v13 = [(HALSchemaHALClientEvent *)self crossDeviceCommandContext];
  if (v13)
  {
    int v14 = (void *)v13;
    v15 = [(HALSchemaHALClientEvent *)self crossDeviceCommandContext];
    v16 = [v4 crossDeviceCommandContext];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(HALSchemaHALClientEvent *)self localFetchContext];
  unint64_t v7 = [v4 localFetchContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v18 = [(HALSchemaHALClientEvent *)self localFetchContext];
  if (v18)
  {
    v19 = (void *)v18;
    int v20 = [(HALSchemaHALClientEvent *)self localFetchContext];
    v21 = [v4 localFetchContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(HALSchemaHALClientEvent *)self contextCollectorFetchContext];
  unint64_t v7 = [v4 contextCollectorFetchContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v23 = [(HALSchemaHALClientEvent *)self contextCollectorFetchContext];
  if (v23)
  {
    v24 = (void *)v23;
    objc_super v25 = [(HALSchemaHALClientEvent *)self contextCollectorFetchContext];
    int v26 = [v4 contextCollectorFetchContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(HALSchemaHALClientEvent *)self forceFetchContext];
  unint64_t v7 = [v4 forceFetchContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v28 = [(HALSchemaHALClientEvent *)self forceFetchContext];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(HALSchemaHALClientEvent *)self forceFetchContext];
    objc_super v31 = [v4 forceFetchContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(HALSchemaHALClientEvent *)self companionDeviceDiscoveryContext];
  unint64_t v7 = [v4 companionDeviceDiscoveryContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v33 = [(HALSchemaHALClientEvent *)self companionDeviceDiscoveryContext];
  if (v33)
  {
    v34 = (void *)v33;
    v35 = [(HALSchemaHALClientEvent *)self companionDeviceDiscoveryContext];
    v36 = [v4 companionDeviceDiscoveryContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(HALSchemaHALClientEvent *)self companionDeviceCommunicationContext];
  unint64_t v7 = [v4 companionDeviceCommunicationContext];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_42;
  }
  uint64_t v38 = [(HALSchemaHALClientEvent *)self companionDeviceCommunicationContext];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(HALSchemaHALClientEvent *)self companionDeviceCommunicationContext];
    v41 = [v4 companionDeviceCommunicationContext];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_43;
    }
  }
  else
  {
  }
  unint64_t v6 = [(HALSchemaHALClientEvent *)self nearbyPersonalDevicesReported];
  unint64_t v7 = [v4 nearbyPersonalDevicesReported];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v43 = [(HALSchemaHALClientEvent *)self nearbyPersonalDevicesReported];
    if (!v43)
    {

LABEL_46:
      BOOL v48 = 1;
      goto LABEL_44;
    }
    v44 = (void *)v43;
    v45 = [(HALSchemaHALClientEvent *)self nearbyPersonalDevicesReported];
    v46 = [v4 nearbyPersonalDevicesReported];
    char v47 = [v45 isEqual:v46];

    if (v47) {
      goto LABEL_46;
    }
  }
  else
  {
LABEL_42:
  }
LABEL_43:
  BOOL v48 = 0;
LABEL_44:

  return v48;
}

- (void)writeTo:(id)a3
{
  id v20 = a3;
  id v4 = [(HALSchemaHALClientEvent *)self eventMetadata];

  if (v4)
  {
    unint64_t v5 = [(HALSchemaHALClientEvent *)self eventMetadata];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(HALSchemaHALClientEvent *)self crossDeviceCommandContext];

  if (v6)
  {
    unint64_t v7 = [(HALSchemaHALClientEvent *)self crossDeviceCommandContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(HALSchemaHALClientEvent *)self localFetchContext];

  if (v8)
  {
    unint64_t v9 = [(HALSchemaHALClientEvent *)self localFetchContext];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(HALSchemaHALClientEvent *)self contextCollectorFetchContext];

  if (v10)
  {
    int v11 = [(HALSchemaHALClientEvent *)self contextCollectorFetchContext];
    PBDataWriterWriteSubmessage();
  }
  int v12 = [(HALSchemaHALClientEvent *)self forceFetchContext];

  if (v12)
  {
    uint64_t v13 = [(HALSchemaHALClientEvent *)self forceFetchContext];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(HALSchemaHALClientEvent *)self companionDeviceDiscoveryContext];

  if (v14)
  {
    v15 = [(HALSchemaHALClientEvent *)self companionDeviceDiscoveryContext];
    PBDataWriterWriteSubmessage();
  }
  v16 = [(HALSchemaHALClientEvent *)self companionDeviceCommunicationContext];

  if (v16)
  {
    int v17 = [(HALSchemaHALClientEvent *)self companionDeviceCommunicationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v18 = [(HALSchemaHALClientEvent *)self nearbyPersonalDevicesReported];

  if (v18)
  {
    v19 = [(HALSchemaHALClientEvent *)self nearbyPersonalDevicesReported];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return HALSchemaHALClientEventReadFrom(self, (uint64_t)a3);
}

- (void)deleteNearbyPersonalDevicesReported
{
  if (self->_whichEvent_Type == 8)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_nearbyPersonalDevicesReported = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HALSchemaHALNearbyPersonalDevicesReported)nearbyPersonalDevicesReported
{
  if (self->_whichEvent_Type == 8) {
    v2 = self->_nearbyPersonalDevicesReported;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setNearbyPersonalDevicesReported:(id)a3
{
  id v4 = (HALSchemaHALNearbyPersonalDevicesReported *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  self->_unint64_t whichEvent_Type = 8 * (v4 != 0);
  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = v4;
}

- (void)deleteCompanionDeviceCommunicationContext
{
  if (self->_whichEvent_Type == 7)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_companionDeviceCommunicationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HALSchemaHALCompanionDeviceCommunicationContext)companionDeviceCommunicationContext
{
  if (self->_whichEvent_Type == 7) {
    v2 = self->_companionDeviceCommunicationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCompanionDeviceCommunicationContext:(id)a3
{
  id v4 = (HALSchemaHALCompanionDeviceCommunicationContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  unint64_t v11 = 7;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = v4;
}

- (void)deleteCompanionDeviceDiscoveryContext
{
  if (self->_whichEvent_Type == 6)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_companionDeviceDiscoveryContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HALSchemaHALCompanionDeviceDiscoveryContext)companionDeviceDiscoveryContext
{
  if (self->_whichEvent_Type == 6) {
    v2 = self->_companionDeviceDiscoveryContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCompanionDeviceDiscoveryContext:(id)a3
{
  id v4 = (HALSchemaHALCompanionDeviceDiscoveryContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  unint64_t v11 = 6;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = v4;
}

- (void)deleteForceFetchContext
{
  if (self->_whichEvent_Type == 5)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_forceFetchContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HALSchemaHALForceFetchContext)forceFetchContext
{
  if (self->_whichEvent_Type == 5) {
    v2 = self->_forceFetchContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setForceFetchContext:(id)a3
{
  id v4 = (HALSchemaHALForceFetchContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  unint64_t v11 = 5;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = v4;
}

- (void)deleteContextCollectorFetchContext
{
  if (self->_whichEvent_Type == 4)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_contextCollectorFetchContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HALSchemaHALContextCollectorFetchContext)contextCollectorFetchContext
{
  if (self->_whichEvent_Type == 4) {
    v2 = self->_contextCollectorFetchContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setContextCollectorFetchContext:(id)a3
{
  id v4 = (HALSchemaHALContextCollectorFetchContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  self->_unint64_t whichEvent_Type = 4 * (v4 != 0);
  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = v4;
}

- (void)deleteLocalFetchContext
{
  if (self->_whichEvent_Type == 3)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_localFetchContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HALSchemaHALLocalFetchContext)localFetchContext
{
  if (self->_whichEvent_Type == 3) {
    v2 = self->_localFetchContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLocalFetchContext:(id)a3
{
  id v4 = (HALSchemaHALLocalFetchContext *)a3;
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  unint64_t v11 = 3;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichEvent_Type = v11;
  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = v4;
}

- (void)deleteCrossDeviceCommandContext
{
  if (self->_whichEvent_Type == 2)
  {
    self->_unint64_t whichEvent_Type = 0;
    self->_crossDeviceCommandContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (HALSchemaHALCrossDeviceCommandExecutionContext)crossDeviceCommandContext
{
  if (self->_whichEvent_Type == 2) {
    v2 = self->_crossDeviceCommandContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCrossDeviceCommandContext:(id)a3
{
  id v4 = (HALSchemaHALCrossDeviceCommandExecutionContext *)a3;
  localFetchContext = self->_localFetchContext;
  self->_localFetchContext = 0;

  contextCollectorFetchContext = self->_contextCollectorFetchContext;
  self->_contextCollectorFetchContext = 0;

  forceFetchContext = self->_forceFetchContext;
  self->_forceFetchContext = 0;

  companionDeviceDiscoveryContext = self->_companionDeviceDiscoveryContext;
  self->_companionDeviceDiscoveryContext = 0;

  companionDeviceCommunicationContext = self->_companionDeviceCommunicationContext;
  self->_companionDeviceCommunicationContext = 0;

  nearbyPersonalDevicesReported = self->_nearbyPersonalDevicesReported;
  self->_nearbyPersonalDevicesReported = 0;

  self->_unint64_t whichEvent_Type = 2 * (v4 != 0);
  crossDeviceCommandContext = self->_crossDeviceCommandContext;
  self->_crossDeviceCommandContext = v4;
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
  unint64_t v2 = [(HALSchemaHALClientEvent *)self whichEvent_Type];
  if (v2 - 2 > 6) {
    return @"com.apple.aiml.siri.hal.HALClientEvent";
  }
  else {
    return off_1E5EB0650[v2 - 2];
  }
}

- (int)getAnyEventType
{
  return 31;
}

@end
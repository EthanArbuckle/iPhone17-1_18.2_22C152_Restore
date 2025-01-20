@interface HomeKitSchemaHKAccessoryOperationReported
- (BOOL)hasAccessoryCategory;
- (BOOL)hasCommunicationProtocol;
- (BOOL)hasConsecutiveFailureCount;
- (BOOL)hasFinalErrorCode;
- (BOOL)hasFinalErrorDomain;
- (BOOL)hasOperationType;
- (BOOL)hasResidentFirstDuration;
- (BOOL)hasResidentFirstErrorCode;
- (BOOL)hasResidentFirstErrorDomain;
- (BOOL)hasSharedMetricsId;
- (BOOL)hasTotalDuration;
- (BOOL)hasTransportType;
- (BOOL)hasWasCached;
- (BOOL)hasWasLocal;
- (BOOL)hasWasRapportSlow;
- (BOOL)hasWasRemoteAccessAllowed;
- (BOOL)hasWasResidentFirstEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasCached;
- (BOOL)wasLocal;
- (BOOL)wasRapportSlow;
- (BOOL)wasRemoteAccessAllowed;
- (BOOL)wasResidentFirstEnabled;
- (HomeKitSchemaHKAccessoryOperationReported)initWithDictionary:(id)a3;
- (HomeKitSchemaHKAccessoryOperationReported)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)accessoryCategory;
- (NSString)finalErrorDomain;
- (NSString)residentFirstErrorDomain;
- (SISchemaUUID)sharedMetricsId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)communicationProtocol;
- (int)operationType;
- (int)transportType;
- (unint64_t)hash;
- (unsigned)consecutiveFailureCount;
- (unsigned)finalErrorCode;
- (unsigned)residentFirstDuration;
- (unsigned)residentFirstErrorCode;
- (unsigned)totalDuration;
- (void)deleteAccessoryCategory;
- (void)deleteCommunicationProtocol;
- (void)deleteConsecutiveFailureCount;
- (void)deleteFinalErrorCode;
- (void)deleteFinalErrorDomain;
- (void)deleteOperationType;
- (void)deleteResidentFirstDuration;
- (void)deleteResidentFirstErrorCode;
- (void)deleteResidentFirstErrorDomain;
- (void)deleteSharedMetricsId;
- (void)deleteTotalDuration;
- (void)deleteTransportType;
- (void)deleteWasCached;
- (void)deleteWasLocal;
- (void)deleteWasRapportSlow;
- (void)deleteWasRemoteAccessAllowed;
- (void)deleteWasResidentFirstEnabled;
- (void)setAccessoryCategory:(id)a3;
- (void)setCommunicationProtocol:(int)a3;
- (void)setConsecutiveFailureCount:(unsigned int)a3;
- (void)setFinalErrorCode:(unsigned int)a3;
- (void)setFinalErrorDomain:(id)a3;
- (void)setHasAccessoryCategory:(BOOL)a3;
- (void)setHasCommunicationProtocol:(BOOL)a3;
- (void)setHasConsecutiveFailureCount:(BOOL)a3;
- (void)setHasFinalErrorCode:(BOOL)a3;
- (void)setHasFinalErrorDomain:(BOOL)a3;
- (void)setHasOperationType:(BOOL)a3;
- (void)setHasResidentFirstDuration:(BOOL)a3;
- (void)setHasResidentFirstErrorCode:(BOOL)a3;
- (void)setHasResidentFirstErrorDomain:(BOOL)a3;
- (void)setHasSharedMetricsId:(BOOL)a3;
- (void)setHasTotalDuration:(BOOL)a3;
- (void)setHasTransportType:(BOOL)a3;
- (void)setHasWasCached:(BOOL)a3;
- (void)setHasWasLocal:(BOOL)a3;
- (void)setHasWasRapportSlow:(BOOL)a3;
- (void)setHasWasRemoteAccessAllowed:(BOOL)a3;
- (void)setHasWasResidentFirstEnabled:(BOOL)a3;
- (void)setOperationType:(int)a3;
- (void)setResidentFirstDuration:(unsigned int)a3;
- (void)setResidentFirstErrorCode:(unsigned int)a3;
- (void)setResidentFirstErrorDomain:(id)a3;
- (void)setSharedMetricsId:(id)a3;
- (void)setTotalDuration:(unsigned int)a3;
- (void)setTransportType:(int)a3;
- (void)setWasCached:(BOOL)a3;
- (void)setWasLocal:(BOOL)a3;
- (void)setWasRapportSlow:(BOOL)a3;
- (void)setWasRemoteAccessAllowed:(BOOL)a3;
- (void)setWasResidentFirstEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation HomeKitSchemaHKAccessoryOperationReported

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)HomeKitSchemaHKAccessoryOperationReported;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(HomeKitSchemaHKAccessoryOperationReported *)self sharedMetricsId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(HomeKitSchemaHKAccessoryOperationReported *)self deleteSharedMetricsId];
  }
  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_finalErrorDomain, 0);
  objc_storeStrong((id *)&self->_residentFirstErrorDomain, 0);
  objc_storeStrong((id *)&self->_accessoryCategory, 0);
  objc_storeStrong((id *)&self->_sharedMetricsId, 0);
}

- (void)setHasFinalErrorDomain:(BOOL)a3
{
  self->_hasAccessoryCategory = a3;
}

- (void)setHasResidentFirstErrorDomain:(BOOL)a3
{
  self->_hasSharedMetricsId = a3;
}

- (void)setHasAccessoryCategory:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasSharedMetricsId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (unsigned)consecutiveFailureCount
{
  return self->_consecutiveFailureCount;
}

- (unsigned)finalErrorCode
{
  return self->_finalErrorCode;
}

- (void)setFinalErrorDomain:(id)a3
{
}

- (NSString)finalErrorDomain
{
  return self->_finalErrorDomain;
}

- (unsigned)totalDuration
{
  return self->_totalDuration;
}

- (unsigned)residentFirstErrorCode
{
  return self->_residentFirstErrorCode;
}

- (void)setResidentFirstErrorDomain:(id)a3
{
}

- (NSString)residentFirstErrorDomain
{
  return self->_residentFirstErrorDomain;
}

- (unsigned)residentFirstDuration
{
  return self->_residentFirstDuration;
}

- (BOOL)wasRapportSlow
{
  return self->_wasRapportSlow;
}

- (BOOL)wasResidentFirstEnabled
{
  return self->_wasResidentFirstEnabled;
}

- (BOOL)wasRemoteAccessAllowed
{
  return self->_wasRemoteAccessAllowed;
}

- (BOOL)wasLocal
{
  return self->_wasLocal;
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (int)operationType
{
  return self->_operationType;
}

- (int)transportType
{
  return self->_transportType;
}

- (int)communicationProtocol
{
  return self->_communicationProtocol;
}

- (void)setAccessoryCategory:(id)a3
{
}

- (NSString)accessoryCategory
{
  return self->_accessoryCategory;
}

- (void)setSharedMetricsId:(id)a3
{
}

- (SISchemaUUID)sharedMetricsId
{
  return self->_sharedMetricsId;
}

- (HomeKitSchemaHKAccessoryOperationReported)initWithDictionary:(id)a3
{
  id v4 = a3;
  v38.receiver = self;
  v38.super_class = (Class)HomeKitSchemaHKAccessoryOperationReported;
  v5 = [(HomeKitSchemaHKAccessoryOperationReported *)&v38 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"sharedMetricsId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(HomeKitSchemaHKAccessoryOperationReported *)v5 setSharedMetricsId:v7];
    }
    v36 = (void *)v6;
    v8 = [v4 objectForKeyedSubscript:@"accessoryCategory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(HomeKitSchemaHKAccessoryOperationReported *)v5 setAccessoryCategory:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"communicationProtocol"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setCommunicationProtocol:](v5, "setCommunicationProtocol:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"transportType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setTransportType:](v5, "setTransportType:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"operationType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setOperationType:](v5, "setOperationType:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"wasCached"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setWasCached:](v5, "setWasCached:", [v13 BOOLValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"wasLocal"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setWasLocal:](v5, "setWasLocal:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"wasRemoteAccessAllowed"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setWasRemoteAccessAllowed:](v5, "setWasRemoteAccessAllowed:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"wasResidentFirstEnabled"];
    objc_opt_class();
    v37 = v16;
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setWasResidentFirstEnabled:](v5, "setWasResidentFirstEnabled:", [v16 BOOLValue]);
    }
    v34 = v11;
    v35 = v10;
    v17 = [v4 objectForKeyedSubscript:@"wasRapportSlow"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setWasRapportSlow:](v5, "setWasRapportSlow:", [v17 BOOLValue]);
    }
    v33 = v12;
    v18 = objc_msgSend(v4, "objectForKeyedSubscript:", @"residentFirstDuration", v17);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setResidentFirstDuration:](v5, "setResidentFirstDuration:", [v18 unsignedIntValue]);
    }
    v32 = v13;
    v19 = [v4 objectForKeyedSubscript:@"residentFirstErrorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = (void *)[v19 copy];
      [(HomeKitSchemaHKAccessoryOperationReported *)v5 setResidentFirstErrorDomain:v20];
    }
    v31 = v14;
    v21 = [v4 objectForKeyedSubscript:@"residentFirstErrorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setResidentFirstErrorCode:](v5, "setResidentFirstErrorCode:", [v21 unsignedIntValue]);
    }
    v30 = v15;
    v22 = [v4 objectForKeyedSubscript:@"totalDuration"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setTotalDuration:](v5, "setTotalDuration:", [v22 unsignedIntValue]);
    }
    v23 = [v4 objectForKeyedSubscript:@"finalErrorDomain"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v24 = (void *)[v23 copy];
      [(HomeKitSchemaHKAccessoryOperationReported *)v5 setFinalErrorDomain:v24];
    }
    v25 = [v4 objectForKeyedSubscript:@"finalErrorCode"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setFinalErrorCode:](v5, "setFinalErrorCode:", [v25 unsignedIntValue]);
    }
    v26 = [v4 objectForKeyedSubscript:@"consecutiveFailureCount"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[HomeKitSchemaHKAccessoryOperationReported setConsecutiveFailureCount:](v5, "setConsecutiveFailureCount:", [v26 unsignedIntValue]);
    }
    v27 = v5;
  }
  return v5;
}

- (HomeKitSchemaHKAccessoryOperationReported)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(HomeKitSchemaHKAccessoryOperationReported *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(HomeKitSchemaHKAccessoryOperationReported *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_accessoryCategory)
  {
    id v4 = [(HomeKitSchemaHKAccessoryOperationReported *)self accessoryCategory];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"accessoryCategory"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    int v7 = [(HomeKitSchemaHKAccessoryOperationReported *)self communicationProtocol];
    v8 = @"HKACCESSORYCOMMUNICATIONPROTOCOL_UNKNOWN";
    if (v7 == 1) {
      v8 = @"HKACCESSORYCOMMUNICATIONPROTOCOL_HAP";
    }
    if (v7 == 2) {
      objc_super v9 = @"HKACCESSORYCOMMUNICATIONPROTOCOL_MATTER";
    }
    else {
      objc_super v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"communicationProtocol"];
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x1000) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported consecutiveFailureCount](self, "consecutiveFailureCount"));
    [v3 setObject:v10 forKeyedSubscript:@"consecutiveFailureCount"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x800) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported finalErrorCode](self, "finalErrorCode"));
    [v3 setObject:v11 forKeyedSubscript:@"finalErrorCode"];
  }
  if (self->_finalErrorDomain)
  {
    v12 = [(HomeKitSchemaHKAccessoryOperationReported *)self finalErrorDomain];
    v13 = (void *)[v12 copy];
    [v3 setObject:v13 forKeyedSubscript:@"finalErrorDomain"];
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 4) != 0)
  {
    int v20 = [(HomeKitSchemaHKAccessoryOperationReported *)self operationType];
    v21 = @"HKACCESSORYOPERATIONTYPE_UNKNOWN";
    if (v20 == 1) {
      v21 = @"HKACCESSORYOPERATIONTYPE_READ";
    }
    if (v20 == 2) {
      v22 = @"HKACCESSORYOPERATIONTYPE_WRITE";
    }
    else {
      v22 = v21;
    }
    [v3 setObject:v22 forKeyedSubscript:@"operationType"];
    __int16 v14 = (__int16)self->_has;
    if ((v14 & 0x100) == 0)
    {
LABEL_18:
      if ((v14 & 0x200) == 0) {
        goto LABEL_20;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_18;
  }
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported residentFirstDuration](self, "residentFirstDuration"));
  [v3 setObject:v23 forKeyedSubscript:@"residentFirstDuration"];

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_19:
    v15 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported residentFirstErrorCode](self, "residentFirstErrorCode"));
    [v3 setObject:v15 forKeyedSubscript:@"residentFirstErrorCode"];
  }
LABEL_20:
  if (self->_residentFirstErrorDomain)
  {
    v16 = [(HomeKitSchemaHKAccessoryOperationReported *)self residentFirstErrorDomain];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"residentFirstErrorDomain"];
  }
  if (self->_sharedMetricsId)
  {
    v18 = [(HomeKitSchemaHKAccessoryOperationReported *)self sharedMetricsId];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"sharedMetricsId"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"sharedMetricsId"];
    }
  }
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x400) != 0)
  {
    v28 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[HomeKitSchemaHKAccessoryOperationReported totalDuration](self, "totalDuration"));
    [v3 setObject:v28 forKeyedSubscript:@"totalDuration"];

    __int16 v25 = (__int16)self->_has;
    if ((v25 & 2) == 0)
    {
LABEL_37:
      if ((v25 & 8) == 0) {
        goto LABEL_38;
      }
      goto LABEL_51;
    }
  }
  else if ((v25 & 2) == 0)
  {
    goto LABEL_37;
  }
  unsigned int v29 = [(HomeKitSchemaHKAccessoryOperationReported *)self transportType] - 1;
  if (v29 > 3) {
    v30 = @"HKTRANSPORTTYPE_UNKNOWN";
  }
  else {
    v30 = off_1E5EBB9B0[v29];
  }
  [v3 setObject:v30 forKeyedSubscript:@"transportType"];
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 8) == 0)
  {
LABEL_38:
    if ((v25 & 0x10) == 0) {
      goto LABEL_39;
    }
    goto LABEL_52;
  }
LABEL_51:
  v31 = objc_msgSend(NSNumber, "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasCached](self, "wasCached"));
  [v3 setObject:v31 forKeyedSubscript:@"wasCached"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x10) == 0)
  {
LABEL_39:
    if ((v25 & 0x80) == 0) {
      goto LABEL_40;
    }
    goto LABEL_53;
  }
LABEL_52:
  v32 = objc_msgSend(NSNumber, "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasLocal](self, "wasLocal"));
  [v3 setObject:v32 forKeyedSubscript:@"wasLocal"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x80) == 0)
  {
LABEL_40:
    if ((v25 & 0x20) == 0) {
      goto LABEL_41;
    }
    goto LABEL_54;
  }
LABEL_53:
  v33 = objc_msgSend(NSNumber, "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasRapportSlow](self, "wasRapportSlow"));
  [v3 setObject:v33 forKeyedSubscript:@"wasRapportSlow"];

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x20) == 0)
  {
LABEL_41:
    if ((v25 & 0x40) == 0) {
      goto LABEL_43;
    }
    goto LABEL_42;
  }
LABEL_54:
  v34 = objc_msgSend(NSNumber, "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasRemoteAccessAllowed](self, "wasRemoteAccessAllowed"));
  [v3 setObject:v34 forKeyedSubscript:@"wasRemoteAccessAllowed"];

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
LABEL_42:
    v26 = objc_msgSend(NSNumber, "numberWithBool:", -[HomeKitSchemaHKAccessoryOperationReported wasResidentFirstEnabled](self, "wasResidentFirstEnabled"));
    [v3 setObject:v26 forKeyedSubscript:@"wasResidentFirstEnabled"];
  }
LABEL_43:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v21 = [(SISchemaUUID *)self->_sharedMetricsId hash];
  NSUInteger v20 = [(NSString *)self->_accessoryCategory hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    uint64_t v19 = 2654435761 * self->_communicationProtocol;
    if ((has & 2) != 0)
    {
LABEL_3:
      uint64_t v18 = 2654435761 * self->_transportType;
      if ((has & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_13;
    }
  }
  else
  {
    uint64_t v19 = 0;
    if ((has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v18 = 0;
  if ((has & 4) != 0)
  {
LABEL_4:
    uint64_t v17 = 2654435761 * self->_operationType;
    if ((has & 8) != 0) {
      goto LABEL_5;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v17 = 0;
  if ((has & 8) != 0)
  {
LABEL_5:
    uint64_t v16 = 2654435761 * self->_wasCached;
    if ((has & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v16 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_6:
    uint64_t v15 = 2654435761 * self->_wasLocal;
    if ((has & 0x20) != 0) {
      goto LABEL_7;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v15 = 0;
  if ((has & 0x20) != 0)
  {
LABEL_7:
    uint64_t v4 = 2654435761 * self->_wasRemoteAccessAllowed;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v4 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v5 = 2654435761 * self->_wasResidentFirstEnabled;
    if ((has & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_18:
    uint64_t v6 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_10;
    }
    goto LABEL_19;
  }
LABEL_17:
  uint64_t v5 = 0;
  if ((has & 0x80) == 0) {
    goto LABEL_18;
  }
LABEL_9:
  uint64_t v6 = 2654435761 * self->_wasRapportSlow;
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
LABEL_10:
    uint64_t v7 = 2654435761 * self->_residentFirstDuration;
    goto LABEL_20;
  }
LABEL_19:
  uint64_t v7 = 0;
LABEL_20:
  NSUInteger v8 = [(NSString *)self->_residentFirstErrorDomain hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    uint64_t v9 = 2654435761 * self->_residentFirstErrorCode;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0)
    {
LABEL_22:
      uint64_t v10 = 2654435761 * self->_totalDuration;
      goto LABEL_25;
    }
  }
  uint64_t v10 = 0;
LABEL_25:
  NSUInteger v11 = [(NSString *)self->_finalErrorDomain hash];
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    uint64_t v12 = 2654435761 * self->_finalErrorCode;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_27;
    }
LABEL_29:
    uint64_t v13 = 0;
    return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
  }
  uint64_t v12 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_29;
  }
LABEL_27:
  uint64_t v13 = 2654435761 * self->_consecutiveFailureCount;
  return v20 ^ v21 ^ v19 ^ v18 ^ v17 ^ v16 ^ v15 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_64;
  }
  uint64_t v5 = [(HomeKitSchemaHKAccessoryOperationReported *)self sharedMetricsId];
  uint64_t v6 = [v4 sharedMetricsId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v7 = [(HomeKitSchemaHKAccessoryOperationReported *)self sharedMetricsId];
  if (v7)
  {
    NSUInteger v8 = (void *)v7;
    uint64_t v9 = [(HomeKitSchemaHKAccessoryOperationReported *)self sharedMetricsId];
    uint64_t v10 = [v4 sharedMetricsId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  uint64_t v5 = [(HomeKitSchemaHKAccessoryOperationReported *)self accessoryCategory];
  uint64_t v6 = [v4 accessoryCategory];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v12 = [(HomeKitSchemaHKAccessoryOperationReported *)self accessoryCategory];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    __int16 v14 = [(HomeKitSchemaHKAccessoryOperationReported *)self accessoryCategory];
    uint64_t v15 = [v4 accessoryCategory];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  $FB7EF78150722EACBFCB12EF103CB204 has = self->_has;
  unsigned int v18 = v4[40];
  if ((*(unsigned char *)&has & 1) != (v18 & 1)) {
    goto LABEL_64;
  }
  if (*(unsigned char *)&has)
  {
    int communicationProtocol = self->_communicationProtocol;
    if (communicationProtocol != [v4 communicationProtocol]) {
      goto LABEL_64;
    }
    $FB7EF78150722EACBFCB12EF103CB204 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v20 = (*(unsigned int *)&has >> 1) & 1;
  if (v20 != ((v18 >> 1) & 1)) {
    goto LABEL_64;
  }
  if (v20)
  {
    int transportType = self->_transportType;
    if (transportType != [v4 transportType]) {
      goto LABEL_64;
    }
    $FB7EF78150722EACBFCB12EF103CB204 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v22 = (*(unsigned int *)&has >> 2) & 1;
  if (v22 != ((v18 >> 2) & 1)) {
    goto LABEL_64;
  }
  if (v22)
  {
    int operationType = self->_operationType;
    if (operationType != [v4 operationType]) {
      goto LABEL_64;
    }
    $FB7EF78150722EACBFCB12EF103CB204 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v24 = (*(unsigned int *)&has >> 3) & 1;
  if (v24 != ((v18 >> 3) & 1)) {
    goto LABEL_64;
  }
  if (v24)
  {
    int wasCached = self->_wasCached;
    if (wasCached != [v4 wasCached]) {
      goto LABEL_64;
    }
    $FB7EF78150722EACBFCB12EF103CB204 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v26 = (*(unsigned int *)&has >> 4) & 1;
  if (v26 != ((v18 >> 4) & 1)) {
    goto LABEL_64;
  }
  if (v26)
  {
    int wasLocal = self->_wasLocal;
    if (wasLocal != [v4 wasLocal]) {
      goto LABEL_64;
    }
    $FB7EF78150722EACBFCB12EF103CB204 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v28 = (*(unsigned int *)&has >> 5) & 1;
  if (v28 != ((v18 >> 5) & 1)) {
    goto LABEL_64;
  }
  if (v28)
  {
    int wasRemoteAccessAllowed = self->_wasRemoteAccessAllowed;
    if (wasRemoteAccessAllowed != [v4 wasRemoteAccessAllowed]) {
      goto LABEL_64;
    }
    $FB7EF78150722EACBFCB12EF103CB204 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v30 = (*(unsigned int *)&has >> 6) & 1;
  if (v30 != ((v18 >> 6) & 1)) {
    goto LABEL_64;
  }
  if (v30)
  {
    int wasResidentFirstEnabled = self->_wasResidentFirstEnabled;
    if (wasResidentFirstEnabled != [v4 wasResidentFirstEnabled]) {
      goto LABEL_64;
    }
    $FB7EF78150722EACBFCB12EF103CB204 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v32 = (*(unsigned int *)&has >> 7) & 1;
  if (v32 != ((v18 >> 7) & 1)) {
    goto LABEL_64;
  }
  if (v32)
  {
    int wasRapportSlow = self->_wasRapportSlow;
    if (wasRapportSlow != [v4 wasRapportSlow]) {
      goto LABEL_64;
    }
    $FB7EF78150722EACBFCB12EF103CB204 has = self->_has;
    unsigned int v18 = v4[40];
  }
  int v34 = (*(unsigned int *)&has >> 8) & 1;
  if (v34 != ((v18 >> 8) & 1)) {
    goto LABEL_64;
  }
  if (v34)
  {
    unsigned int residentFirstDuration = self->_residentFirstDuration;
    if (residentFirstDuration != [v4 residentFirstDuration]) {
      goto LABEL_64;
    }
  }
  uint64_t v5 = [(HomeKitSchemaHKAccessoryOperationReported *)self residentFirstErrorDomain];
  uint64_t v6 = [v4 residentFirstErrorDomain];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_63;
  }
  uint64_t v36 = [(HomeKitSchemaHKAccessoryOperationReported *)self residentFirstErrorDomain];
  if (v36)
  {
    v37 = (void *)v36;
    objc_super v38 = [(HomeKitSchemaHKAccessoryOperationReported *)self residentFirstErrorDomain];
    v39 = [v4 residentFirstErrorDomain];
    int v40 = [v38 isEqual:v39];

    if (!v40) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  $FB7EF78150722EACBFCB12EF103CB204 v41 = self->_has;
  int v42 = (*(unsigned int *)&v41 >> 9) & 1;
  unsigned int v43 = v4[40];
  if (v42 != ((v43 >> 9) & 1)) {
    goto LABEL_64;
  }
  if (v42)
  {
    unsigned int residentFirstErrorCode = self->_residentFirstErrorCode;
    if (residentFirstErrorCode != [v4 residentFirstErrorCode]) {
      goto LABEL_64;
    }
    $FB7EF78150722EACBFCB12EF103CB204 v41 = self->_has;
    unsigned int v43 = v4[40];
  }
  int v45 = (*(unsigned int *)&v41 >> 10) & 1;
  if (v45 != ((v43 >> 10) & 1)) {
    goto LABEL_64;
  }
  if (v45)
  {
    unsigned int totalDuration = self->_totalDuration;
    if (totalDuration != [v4 totalDuration]) {
      goto LABEL_64;
    }
  }
  uint64_t v5 = [(HomeKitSchemaHKAccessoryOperationReported *)self finalErrorDomain];
  uint64_t v6 = [v4 finalErrorDomain];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_63:

    goto LABEL_64;
  }
  uint64_t v47 = [(HomeKitSchemaHKAccessoryOperationReported *)self finalErrorDomain];
  if (v47)
  {
    v48 = (void *)v47;
    v49 = [(HomeKitSchemaHKAccessoryOperationReported *)self finalErrorDomain];
    v50 = [v4 finalErrorDomain];
    int v51 = [v49 isEqual:v50];

    if (!v51) {
      goto LABEL_64;
    }
  }
  else
  {
  }
  $FB7EF78150722EACBFCB12EF103CB204 v54 = self->_has;
  int v55 = (*(unsigned int *)&v54 >> 11) & 1;
  unsigned int v56 = v4[40];
  if (v55 == ((v56 >> 11) & 1))
  {
    if (v55)
    {
      unsigned int finalErrorCode = self->_finalErrorCode;
      if (finalErrorCode != [v4 finalErrorCode]) {
        goto LABEL_64;
      }
      $FB7EF78150722EACBFCB12EF103CB204 v54 = self->_has;
      unsigned int v56 = v4[40];
    }
    int v58 = (*(unsigned int *)&v54 >> 12) & 1;
    if (v58 == ((v56 >> 12) & 1))
    {
      if (!v58
        || (unsigned int consecutiveFailureCount = self->_consecutiveFailureCount,
            consecutiveFailureCount == [v4 consecutiveFailureCount]))
      {
        BOOL v52 = 1;
        goto LABEL_65;
      }
    }
  }
LABEL_64:
  BOOL v52 = 0;
LABEL_65:

  return v52;
}

- (void)writeTo:(id)a3
{
  id v13 = a3;
  uint64_t v4 = [(HomeKitSchemaHKAccessoryOperationReported *)self sharedMetricsId];

  if (v4)
  {
    uint64_t v5 = [(HomeKitSchemaHKAccessoryOperationReported *)self sharedMetricsId];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v6 = [(HomeKitSchemaHKAccessoryOperationReported *)self accessoryCategory];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    __int16 has = (__int16)self->_has;
    if ((has & 2) == 0)
    {
LABEL_7:
      if ((has & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_32;
    }
  }
  else if ((has & 2) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 4) == 0)
  {
LABEL_8:
    if ((has & 8) == 0) {
      goto LABEL_9;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_9:
    if ((has & 0x10) == 0) {
      goto LABEL_10;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_10:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_35;
  }
LABEL_34:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) == 0)
  {
LABEL_11:
    if ((has & 0x40) == 0) {
      goto LABEL_12;
    }
    goto LABEL_36;
  }
LABEL_35:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_12:
    if ((has & 0x80) == 0) {
      goto LABEL_13;
    }
    goto LABEL_37;
  }
LABEL_36:
  PBDataWriterWriteBOOLField();
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_13:
    if ((has & 0x100) == 0) {
      goto LABEL_15;
    }
    goto LABEL_14;
  }
LABEL_37:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
LABEL_14:
  }
    PBDataWriterWriteUint32Field();
LABEL_15:
  NSUInteger v8 = [(HomeKitSchemaHKAccessoryOperationReported *)self residentFirstErrorDomain];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x200) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 0x400) != 0) {
    PBDataWriterWriteUint32Field();
  }
  uint64_t v10 = [(HomeKitSchemaHKAccessoryOperationReported *)self finalErrorDomain];

  if (v10) {
    PBDataWriterWriteStringField();
  }
  __int16 v11 = (__int16)self->_has;
  uint64_t v12 = v13;
  if ((v11 & 0x800) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v12 = v13;
    __int16 v11 = (__int16)self->_has;
  }
  if ((v11 & 0x1000) != 0)
  {
    PBDataWriterWriteUint32Field();
    uint64_t v12 = v13;
  }
}

- (BOOL)readFrom:(id)a3
{
  return HomeKitSchemaHKAccessoryOperationReportedReadFrom(self, (uint64_t)a3);
}

- (void)deleteConsecutiveFailureCount
{
  *(_WORD *)&self->_has &= ~0x1000u;
}

- (void)setHasConsecutiveFailureCount:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasConsecutiveFailureCount
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setConsecutiveFailureCount:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_unsigned int consecutiveFailureCount = a3;
}

- (void)deleteFinalErrorCode
{
  *(_WORD *)&self->_has &= ~0x800u;
}

- (void)setHasFinalErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasFinalErrorCode
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setFinalErrorCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_unsigned int finalErrorCode = a3;
}

- (void)deleteFinalErrorDomain
{
}

- (BOOL)hasFinalErrorDomain
{
  return self->_finalErrorDomain != 0;
}

- (void)deleteTotalDuration
{
  *(_WORD *)&self->_has &= ~0x400u;
}

- (void)setHasTotalDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasTotalDuration
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setTotalDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_unsigned int totalDuration = a3;
}

- (void)deleteResidentFirstErrorCode
{
  *(_WORD *)&self->_has &= ~0x200u;
}

- (void)setHasResidentFirstErrorCode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasResidentFirstErrorCode
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setResidentFirstErrorCode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_unsigned int residentFirstErrorCode = a3;
}

- (void)deleteResidentFirstErrorDomain
{
}

- (BOOL)hasResidentFirstErrorDomain
{
  return self->_residentFirstErrorDomain != 0;
}

- (void)deleteResidentFirstDuration
{
  *(_WORD *)&self->_has &= ~0x100u;
}

- (void)setHasResidentFirstDuration:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasResidentFirstDuration
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setResidentFirstDuration:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_unsigned int residentFirstDuration = a3;
}

- (void)deleteWasRapportSlow
{
  *(_WORD *)&self->_has &= ~0x80u;
}

- (void)setHasWasRapportSlow:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasWasRapportSlow
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setWasRapportSlow:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_int wasRapportSlow = a3;
}

- (void)deleteWasResidentFirstEnabled
{
  *(_WORD *)&self->_has &= ~0x40u;
}

- (void)setHasWasResidentFirstEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasWasResidentFirstEnabled
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setWasResidentFirstEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_int wasResidentFirstEnabled = a3;
}

- (void)deleteWasRemoteAccessAllowed
{
  *(_WORD *)&self->_has &= ~0x20u;
}

- (void)setHasWasRemoteAccessAllowed:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasWasRemoteAccessAllowed
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setWasRemoteAccessAllowed:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_int wasRemoteAccessAllowed = a3;
}

- (void)deleteWasLocal
{
  *(_WORD *)&self->_has &= ~0x10u;
}

- (void)setHasWasLocal:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasWasLocal
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setWasLocal:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_int wasLocal = a3;
}

- (void)deleteWasCached
{
  *(_WORD *)&self->_has &= ~8u;
}

- (void)setHasWasCached:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasWasCached
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setWasCached:(BOOL)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_int wasCached = a3;
}

- (void)deleteOperationType
{
  *(_WORD *)&self->_has &= ~4u;
}

- (void)setHasOperationType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasOperationType
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setOperationType:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_int operationType = a3;
}

- (void)deleteTransportType
{
  *(_WORD *)&self->_has &= ~2u;
}

- (void)setHasTransportType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasTransportType
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (void)setTransportType:(int)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_int transportType = a3;
}

- (void)deleteCommunicationProtocol
{
  *(_WORD *)&self->_has &= ~1u;
}

- (void)setHasCommunicationProtocol:(BOOL)a3
{
  *(_WORD *)&self->___int16 has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasCommunicationProtocol
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setCommunicationProtocol:(int)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_int communicationProtocol = a3;
}

- (void)deleteAccessoryCategory
{
}

- (BOOL)hasAccessoryCategory
{
  return self->_accessoryCategory != 0;
}

- (void)deleteSharedMetricsId
{
}

- (BOOL)hasSharedMetricsId
{
  return self->_sharedMetricsId != 0;
}

@end
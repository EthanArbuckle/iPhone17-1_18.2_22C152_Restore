@interface AppTelemetryInvestigation
- (AppTelemetryFPFSMigrationInvestigation)fpfsMigrationInvestigation;
- (AppTelemetryItemStatsInvestigation)itemStatsInvestigation;
- (AppTelemetryQBSInvestigation)qbsInvestigation;
- (AppTelemetryQBSPerformance)qbsPerformance;
- (AppTelemetryStuckStatus)stuckStatus;
- (BOOL)hasErrorCode;
- (BOOL)hasErrorDescription;
- (BOOL)hasErrorDomain;
- (BOOL)hasEventGroupUUID;
- (BOOL)hasEventTimestamp;
- (BOOL)hasForegroundClients;
- (BOOL)hasFpfsMigrationInvestigation;
- (BOOL)hasHasForegroundClients;
- (BOOL)hasIsEnhancedDrivePrivacyEnabled;
- (BOOL)hasIsPCSChained;
- (BOOL)hasItemID;
- (BOOL)hasItemStatsInvestigation;
- (BOOL)hasLastStep;
- (BOOL)hasMigrationUUID;
- (BOOL)hasNonDiscretionary;
- (BOOL)hasOperationType;
- (BOOL)hasQbsInvestigation;
- (BOOL)hasQbsPerformance;
- (BOOL)hasReason;
- (BOOL)hasSharedZone;
- (BOOL)hasStuckStatus;
- (BOOL)hasUnderlyingErrorCode;
- (BOOL)hasUnderlyingErrorDomain;
- (BOOL)hasZoneName;
- (BOOL)isEnhancedDrivePrivacyEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPCSChained;
- (BOOL)nonDiscretionary;
- (BOOL)readFrom:(id)a3;
- (BOOL)sharedZone;
- (NSData)zoneName;
- (NSString)errorDescription;
- (NSString)errorDomain;
- (NSString)eventGroupUUID;
- (NSString)itemID;
- (NSString)lastStep;
- (NSString)migrationUUID;
- (NSString)operationType;
- (NSString)reason;
- (NSString)underlyingErrorDomain;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)errorCode;
- (int64_t)underlyingErrorCode;
- (unint64_t)eventTimestamp;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setErrorCode:(int64_t)a3;
- (void)setErrorDescription:(id)a3;
- (void)setErrorDomain:(id)a3;
- (void)setEventGroupUUID:(id)a3;
- (void)setEventTimestamp:(unint64_t)a3;
- (void)setFpfsMigrationInvestigation:(id)a3;
- (void)setHasErrorCode:(BOOL)a3;
- (void)setHasEventTimestamp:(BOOL)a3;
- (void)setHasForegroundClients:(BOOL)a3;
- (void)setHasHasForegroundClients:(BOOL)a3;
- (void)setHasIsEnhancedDrivePrivacyEnabled:(BOOL)a3;
- (void)setHasIsPCSChained:(BOOL)a3;
- (void)setHasNonDiscretionary:(BOOL)a3;
- (void)setHasSharedZone:(BOOL)a3;
- (void)setHasUnderlyingErrorCode:(BOOL)a3;
- (void)setIsEnhancedDrivePrivacyEnabled:(BOOL)a3;
- (void)setIsPCSChained:(BOOL)a3;
- (void)setItemID:(id)a3;
- (void)setItemStatsInvestigation:(id)a3;
- (void)setLastStep:(id)a3;
- (void)setMigrationUUID:(id)a3;
- (void)setNonDiscretionary:(BOOL)a3;
- (void)setOperationType:(id)a3;
- (void)setQbsInvestigation:(id)a3;
- (void)setQbsPerformance:(id)a3;
- (void)setReason:(id)a3;
- (void)setSharedZone:(BOOL)a3;
- (void)setStuckStatus:(id)a3;
- (void)setUnderlyingErrorCode:(int64_t)a3;
- (void)setUnderlyingErrorDomain:(id)a3;
- (void)setZoneName:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation AppTelemetryInvestigation

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)AppTelemetryInvestigation;
  v4 = [(AppTelemetryInvestigation *)&v8 description];
  v5 = [(AppTelemetryInvestigation *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  v4 = v3;
  zoneName = self->_zoneName;
  if (zoneName) {
    [v3 setObject:zoneName forKey:@"zoneName"];
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_sharedZone];
    [v4 setObject:v6 forKey:@"sharedZone"];
  }
  errorDomain = self->_errorDomain;
  if (errorDomain) {
    [v4 setObject:errorDomain forKey:@"errorDomain"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_errorCode];
    [v4 setObject:v8 forKey:@"errorCode"];
  }
  errorDescription = self->_errorDescription;
  if (errorDescription) {
    [v4 setObject:errorDescription forKey:@"errorDescription"];
  }
  lastStep = self->_lastStep;
  if (lastStep) {
    [v4 setObject:lastStep forKey:@"lastStep"];
  }
  itemID = self->_itemID;
  if (itemID) {
    [v4 setObject:itemID forKey:@"itemID"];
  }
  reason = self->_reason;
  if (reason) {
    [v4 setObject:reason forKey:@"reason"];
  }
  operationType = self->_operationType;
  if (operationType) {
    [v4 setObject:operationType forKey:@"operationType"];
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    v33 = [NSNumber numberWithBool:self->_nonDiscretionary];
    [v4 setObject:v33 forKey:@"nonDiscretionary"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_21:
      if ((has & 0x20) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_21;
  }
  v34 = [NSNumber numberWithBool:self->_hasForegroundClients];
  [v4 setObject:v34 forKey:@"hasForegroundClients"];

  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_22:
    v15 = [NSNumber numberWithBool:self->_isPCSChained];
    [v4 setObject:v15 forKey:@"isPCSChained"];
  }
LABEL_23:
  eventGroupUUID = self->_eventGroupUUID;
  if (eventGroupUUID) {
    [v4 setObject:eventGroupUUID forKey:@"eventGroupUUID"];
  }
  migrationUUID = self->_migrationUUID;
  if (migrationUUID) {
    [v4 setObject:migrationUUID forKey:@"migrationUUID"];
  }
  qbsInvestigation = self->_qbsInvestigation;
  if (qbsInvestigation)
  {
    v19 = [(AppTelemetryQBSInvestigation *)qbsInvestigation dictionaryRepresentation];
    [v4 setObject:v19 forKey:@"qbsInvestigation"];
  }
  qbsPerformance = self->_qbsPerformance;
  if (qbsPerformance)
  {
    v21 = [(AppTelemetryQBSPerformance *)qbsPerformance dictionaryRepresentation];
    [v4 setObject:v21 forKey:@"qbsPerformance"];
  }
  fpfsMigrationInvestigation = self->_fpfsMigrationInvestigation;
  if (fpfsMigrationInvestigation)
  {
    v23 = [(AppTelemetryFPFSMigrationInvestigation *)fpfsMigrationInvestigation dictionaryRepresentation];
    [v4 setObject:v23 forKey:@"fpfsMigrationInvestigation"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v24 = [NSNumber numberWithUnsignedLongLong:self->_eventTimestamp];
    [v4 setObject:v24 forKey:@"eventTimestamp"];
  }
  itemStatsInvestigation = self->_itemStatsInvestigation;
  if (itemStatsInvestigation)
  {
    v26 = [(AppTelemetryItemStatsInvestigation *)itemStatsInvestigation dictionaryRepresentation];
    [v4 setObject:v26 forKey:@"itemStatsInvestigation"];
  }
  stuckStatus = self->_stuckStatus;
  if (stuckStatus)
  {
    v28 = [(AppTelemetryStuckStatus *)stuckStatus dictionaryRepresentation];
    [v4 setObject:v28 forKey:@"stuckStatus"];
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    v29 = [NSNumber numberWithBool:self->_isEnhancedDrivePrivacyEnabled];
    [v4 setObject:v29 forKey:@"isEnhancedDrivePrivacyEnabled"];
  }
  underlyingErrorDomain = self->_underlyingErrorDomain;
  if (underlyingErrorDomain) {
    [v4 setObject:underlyingErrorDomain forKey:@"underlyingErrorDomain"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v31 = [NSNumber numberWithLongLong:self->_underlyingErrorCode];
    [v4 setObject:v31 forKey:@"underlyingErrorCode"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return AppTelemetryInvestigationReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_zoneName)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_errorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_errorDescription)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_lastStep)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_itemID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_reason)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_operationType)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_21:
      if ((has & 0x20) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v6;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_22:
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
LABEL_23:
  if (self->_eventGroupUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_migrationUUID)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_qbsInvestigation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_qbsPerformance)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_fpfsMigrationInvestigation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v6;
  }
  if (self->_itemStatsInvestigation)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if (self->_stuckStatus)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_underlyingErrorDomain)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_zoneName)
  {
    objc_msgSend(v4, "setZoneName:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *((unsigned char *)v4 + 156) = self->_sharedZone;
    *((unsigned char *)v4 + 160) |= 0x80u;
  }
  if (self->_errorDomain)
  {
    objc_msgSend(v6, "setErrorDomain:");
    id v4 = v6;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_errorCode;
    *((unsigned char *)v4 + 160) |= 1u;
  }
  if (self->_errorDescription)
  {
    objc_msgSend(v6, "setErrorDescription:");
    id v4 = v6;
  }
  if (self->_lastStep)
  {
    objc_msgSend(v6, "setLastStep:");
    id v4 = v6;
  }
  if (self->_itemID)
  {
    objc_msgSend(v6, "setItemID:");
    id v4 = v6;
  }
  if (self->_reason)
  {
    objc_msgSend(v6, "setReason:");
    id v4 = v6;
  }
  if (self->_operationType)
  {
    objc_msgSend(v6, "setOperationType:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *((unsigned char *)v4 + 155) = self->_nonDiscretionary;
    *((unsigned char *)v4 + 160) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_21:
      if ((has & 0x20) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_21;
  }
  *((unsigned char *)v4 + 152) = self->_hasForegroundClients;
  *((unsigned char *)v4 + 160) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_22:
    *((unsigned char *)v4 + 154) = self->_isPCSChained;
    *((unsigned char *)v4 + 160) |= 0x20u;
  }
LABEL_23:
  if (self->_eventGroupUUID)
  {
    objc_msgSend(v6, "setEventGroupUUID:");
    id v4 = v6;
  }
  if (self->_migrationUUID)
  {
    objc_msgSend(v6, "setMigrationUUID:");
    id v4 = v6;
  }
  if (self->_qbsInvestigation)
  {
    objc_msgSend(v6, "setQbsInvestigation:");
    id v4 = v6;
  }
  if (self->_qbsPerformance)
  {
    objc_msgSend(v6, "setQbsPerformance:");
    id v4 = v6;
  }
  if (self->_fpfsMigrationInvestigation)
  {
    objc_msgSend(v6, "setFpfsMigrationInvestigation:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_eventTimestamp;
    *((unsigned char *)v4 + 160) |= 2u;
  }
  if (self->_itemStatsInvestigation)
  {
    objc_msgSend(v6, "setItemStatsInvestigation:");
    id v4 = v6;
  }
  if (self->_stuckStatus)
  {
    objc_msgSend(v6, "setStuckStatus:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *((unsigned char *)v4 + 153) = self->_isEnhancedDrivePrivacyEnabled;
    *((unsigned char *)v4 + 160) |= 0x10u;
  }
  if (self->_underlyingErrorDomain)
  {
    objc_msgSend(v6, "setUnderlyingErrorDomain:");
    id v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((void *)v4 + 3) = self->_underlyingErrorCode;
    *((unsigned char *)v4 + 160) |= 4u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSData *)self->_zoneName copyWithZone:a3];
  v7 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v6;

  if ((*(unsigned char *)&self->_has & 0x80000000) != 0)
  {
    *(unsigned char *)(v5 + 156) = self->_sharedZone;
    *(unsigned char *)(v5 + 160) |= 0x80u;
  }
  uint64_t v8 = [(NSString *)self->_errorDomain copyWithZone:a3];
  v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_errorCode;
    *(unsigned char *)(v5 + 160) |= 1u;
  }
  uint64_t v10 = [(NSString *)self->_errorDescription copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  uint64_t v12 = [(NSString *)self->_lastStep copyWithZone:a3];
  v13 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v12;

  uint64_t v14 = [(NSString *)self->_itemID copyWithZone:a3];
  v15 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v14;

  uint64_t v16 = [(NSString *)self->_reason copyWithZone:a3];
  v17 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v16;

  uint64_t v18 = [(NSString *)self->_operationType copyWithZone:a3];
  v19 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v18;

  char has = (char)self->_has;
  if ((has & 0x40) != 0)
  {
    *(unsigned char *)(v5 + 155) = self->_nonDiscretionary;
    *(unsigned char *)(v5 + 160) |= 0x40u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_7:
      if ((has & 0x20) == 0) {
        goto LABEL_9;
      }
      goto LABEL_8;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_7;
  }
  *(unsigned char *)(v5 + 152) = self->_hasForegroundClients;
  *(unsigned char *)(v5 + 160) |= 8u;
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
LABEL_8:
    *(unsigned char *)(v5 + 154) = self->_isPCSChained;
    *(unsigned char *)(v5 + 160) |= 0x20u;
  }
LABEL_9:
  uint64_t v21 = [(NSString *)self->_eventGroupUUID copyWithZone:a3];
  v22 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v21;

  uint64_t v23 = [(NSString *)self->_migrationUUID copyWithZone:a3];
  v24 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v23;

  id v25 = [(AppTelemetryQBSInvestigation *)self->_qbsInvestigation copyWithZone:a3];
  v26 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v25;

  id v27 = [(AppTelemetryQBSPerformance *)self->_qbsPerformance copyWithZone:a3];
  v28 = *(void **)(v5 + 112);
  *(void *)(v5 + 112) = v27;

  id v29 = [(AppTelemetryFPFSMigrationInvestigation *)self->_fpfsMigrationInvestigation copyWithZone:a3];
  v30 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v29;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_eventTimestamp;
    *(unsigned char *)(v5 + 160) |= 2u;
  }
  id v31 = [(AppTelemetryItemStatsInvestigation *)self->_itemStatsInvestigation copyWithZone:a3];
  v32 = *(void **)(v5 + 72);
  *(void *)(v5 + 72) = v31;

  id v33 = [(AppTelemetryStuckStatus *)self->_stuckStatus copyWithZone:a3];
  v34 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v33;

  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    *(unsigned char *)(v5 + 153) = self->_isEnhancedDrivePrivacyEnabled;
    *(unsigned char *)(v5 + 160) |= 0x10u;
  }
  uint64_t v35 = [(NSString *)self->_underlyingErrorDomain copyWithZone:a3];
  v36 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v35;

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *(void *)(v5 + 24) = self->_underlyingErrorCode;
    *(unsigned char *)(v5 + 160) |= 4u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (char *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_33;
  }
  zoneName = self->_zoneName;
  if ((unint64_t)zoneName | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](zoneName, "isEqual:")) {
      goto LABEL_33;
    }
  }
  $FFDB406E3412A5DC1D44508339CF5839 has = self->_has;
  int v7 = v4[160];
  if ((*(_DWORD *)&has & 0x80000000) != 0)
  {
    if ((v7 & 0x80000000) == 0) {
      goto LABEL_33;
    }
    if (self->_sharedZone)
    {
      if (!v4[156]) {
        goto LABEL_33;
      }
    }
    else if (v4[156])
    {
      goto LABEL_33;
    }
  }
  else if (v7 < 0)
  {
    goto LABEL_33;
  }
  errorDomain = self->_errorDomain;
  if ((unint64_t)errorDomain | *((void *)v4 + 5))
  {
    if (!-[NSString isEqual:](errorDomain, "isEqual:")) {
      goto LABEL_33;
    }
    *(unsigned char *)&$FFDB406E3412A5DC1D44508339CF5839 has = self->_has;
  }
  if (*(unsigned char *)&has)
  {
    if ((v4[160] & 1) == 0 || self->_errorCode != *((void *)v4 + 1)) {
      goto LABEL_33;
    }
  }
  else if (v4[160])
  {
    goto LABEL_33;
  }
  errorDescription = self->_errorDescription;
  if ((unint64_t)errorDescription | *((void *)v4 + 4)
    && !-[NSString isEqual:](errorDescription, "isEqual:"))
  {
    goto LABEL_33;
  }
  lastStep = self->_lastStep;
  if ((unint64_t)lastStep | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](lastStep, "isEqual:")) {
      goto LABEL_33;
    }
  }
  itemID = self->_itemID;
  if ((unint64_t)itemID | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](itemID, "isEqual:")) {
      goto LABEL_33;
    }
  }
  reason = self->_reason;
  if ((unint64_t)reason | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](reason, "isEqual:")) {
      goto LABEL_33;
    }
  }
  operationType = self->_operationType;
  if ((unint64_t)operationType | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](operationType, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    if ((v4[160] & 0x40) == 0) {
      goto LABEL_33;
    }
    if (self->_nonDiscretionary)
    {
      if (!v4[155]) {
        goto LABEL_33;
      }
    }
    else if (v4[155])
    {
      goto LABEL_33;
    }
  }
  else if ((v4[160] & 0x40) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((v4[160] & 8) == 0) {
      goto LABEL_33;
    }
    if (self->_hasForegroundClients)
    {
      if (!v4[152]) {
        goto LABEL_33;
      }
    }
    else if (v4[152])
    {
      goto LABEL_33;
    }
  }
  else if ((v4[160] & 8) != 0)
  {
    goto LABEL_33;
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    if ((v4[160] & 0x20) == 0) {
      goto LABEL_33;
    }
    if (self->_isPCSChained)
    {
      if (!v4[154]) {
        goto LABEL_33;
      }
    }
    else if (v4[154])
    {
      goto LABEL_33;
    }
  }
  else if ((v4[160] & 0x20) != 0)
  {
    goto LABEL_33;
  }
  eventGroupUUID = self->_eventGroupUUID;
  if ((unint64_t)eventGroupUUID | *((void *)v4 + 6)
    && !-[NSString isEqual:](eventGroupUUID, "isEqual:"))
  {
    goto LABEL_33;
  }
  migrationUUID = self->_migrationUUID;
  if ((unint64_t)migrationUUID | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](migrationUUID, "isEqual:")) {
      goto LABEL_33;
    }
  }
  qbsInvestigation = self->_qbsInvestigation;
  if ((unint64_t)qbsInvestigation | *((void *)v4 + 13))
  {
    if (!-[AppTelemetryQBSInvestigation isEqual:](qbsInvestigation, "isEqual:")) {
      goto LABEL_33;
    }
  }
  qbsPerformance = self->_qbsPerformance;
  if ((unint64_t)qbsPerformance | *((void *)v4 + 14))
  {
    if (!-[AppTelemetryQBSPerformance isEqual:](qbsPerformance, "isEqual:")) {
      goto LABEL_33;
    }
  }
  fpfsMigrationInvestigation = self->_fpfsMigrationInvestigation;
  if ((unint64_t)fpfsMigrationInvestigation | *((void *)v4 + 7))
  {
    if (!-[AppTelemetryFPFSMigrationInvestigation isEqual:](fpfsMigrationInvestigation, "isEqual:")) {
      goto LABEL_33;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((v4[160] & 2) == 0 || self->_eventTimestamp != *((void *)v4 + 2)) {
      goto LABEL_33;
    }
  }
  else if ((v4[160] & 2) != 0)
  {
    goto LABEL_33;
  }
  itemStatsInvestigation = self->_itemStatsInvestigation;
  if ((unint64_t)itemStatsInvestigation | *((void *)v4 + 9)
    && !-[AppTelemetryItemStatsInvestigation isEqual:](itemStatsInvestigation, "isEqual:"))
  {
    goto LABEL_33;
  }
  stuckStatus = self->_stuckStatus;
  if ((unint64_t)stuckStatus | *((void *)v4 + 16))
  {
    if (!-[AppTelemetryStuckStatus isEqual:](stuckStatus, "isEqual:")) {
      goto LABEL_33;
    }
  }
  char v23 = (char)self->_has;
  if ((v23 & 0x10) != 0)
  {
    if ((v4[160] & 0x10) == 0) {
      goto LABEL_33;
    }
    if (self->_isEnhancedDrivePrivacyEnabled)
    {
      if (!v4[153]) {
        goto LABEL_33;
      }
    }
    else if (v4[153])
    {
      goto LABEL_33;
    }
  }
  else if ((v4[160] & 0x10) != 0)
  {
    goto LABEL_33;
  }
  underlyingErrorDomain = self->_underlyingErrorDomain;
  if ((unint64_t)underlyingErrorDomain | *((void *)v4 + 17))
  {
    if (!-[NSString isEqual:](underlyingErrorDomain, "isEqual:")) {
      goto LABEL_33;
    }
    char v23 = (char)self->_has;
  }
  if ((v23 & 4) == 0)
  {
    BOOL v14 = (v4[160] & 4) == 0;
    goto LABEL_34;
  }
  if ((v4[160] & 4) != 0 && self->_underlyingErrorCode == *((void *)v4 + 3))
  {
    BOOL v14 = 1;
    goto LABEL_34;
  }
LABEL_33:
  BOOL v14 = 0;
LABEL_34:

  return v14;
}

- (unint64_t)hash
{
  uint64_t v30 = [(NSData *)self->_zoneName hash];
  if ((*(unsigned char *)&self->_has & 0x80000000) != 0) {
    uint64_t v3 = 2654435761 * self->_sharedZone;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v29 = [(NSString *)self->_errorDomain hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v20 = 2654435761 * self->_errorCode;
  }
  else {
    uint64_t v20 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_errorDescription hash];
  NSUInteger v5 = [(NSString *)self->_lastStep hash];
  NSUInteger v6 = [(NSString *)self->_itemID hash];
  NSUInteger v7 = [(NSString *)self->_reason hash];
  NSUInteger v8 = [(NSString *)self->_operationType hash];
  if ((*(unsigned char *)&self->_has & 0x40) != 0)
  {
    uint64_t v9 = 2654435761 * self->_nonDiscretionary;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v9 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0)
    {
LABEL_9:
      uint64_t v10 = 2654435761 * self->_hasForegroundClients;
      goto LABEL_12;
    }
  }
  uint64_t v10 = 0;
LABEL_12:
  uint64_t v27 = v9;
  NSUInteger v28 = v8;
  uint64_t v26 = v10;
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
    uint64_t v19 = 2654435761 * self->_isPCSChained;
  }
  else {
    uint64_t v19 = 0;
  }
  NSUInteger v11 = [(NSString *)self->_eventGroupUUID hash];
  NSUInteger v12 = [(NSString *)self->_migrationUUID hash];
  unint64_t v25 = [(AppTelemetryQBSInvestigation *)self->_qbsInvestigation hash];
  unint64_t v24 = [(AppTelemetryQBSPerformance *)self->_qbsPerformance hash];
  unint64_t v23 = [(AppTelemetryFPFSMigrationInvestigation *)self->_fpfsMigrationInvestigation hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v18 = 2654435761u * self->_eventTimestamp;
  }
  else {
    unint64_t v18 = 0;
  }
  unint64_t v13 = [(AppTelemetryItemStatsInvestigation *)self->_itemStatsInvestigation hash];
  unint64_t v21 = [(AppTelemetryStuckStatus *)self->_stuckStatus hash];
  unint64_t v22 = v13;
  if ((*(unsigned char *)&self->_has & 0x10) != 0) {
    uint64_t v14 = 2654435761 * self->_isEnhancedDrivePrivacyEnabled;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_underlyingErrorDomain hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v16 = 2654435761 * self->_underlyingErrorCode;
  }
  else {
    uint64_t v16 = 0;
  }
  return v3 ^ v30 ^ v29 ^ v20 ^ v4 ^ v5 ^ v6 ^ v7 ^ v28 ^ v27 ^ v26 ^ v19 ^ v11 ^ v12 ^ v25 ^ v24 ^ v23 ^ v18 ^ v22 ^ v21 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = (char *)a3;
  uint64_t v16 = v4;
  if (*((void *)v4 + 18))
  {
    -[AppTelemetryInvestigation setZoneName:](self, "setZoneName:");
    NSUInteger v4 = v16;
  }
  if (v4[160] < 0)
  {
    self->_sharedZone = v4[156];
    *(unsigned char *)&self->_has |= 0x80u;
  }
  if (*((void *)v4 + 5))
  {
    -[AppTelemetryInvestigation setErrorDomain:](self, "setErrorDomain:");
    NSUInteger v4 = v16;
  }
  if (v4[160])
  {
    self->_errorCode = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  if (*((void *)v4 + 4))
  {
    -[AppTelemetryInvestigation setErrorDescription:](self, "setErrorDescription:");
    NSUInteger v4 = v16;
  }
  if (*((void *)v4 + 10))
  {
    -[AppTelemetryInvestigation setLastStep:](self, "setLastStep:");
    NSUInteger v4 = v16;
  }
  if (*((void *)v4 + 8))
  {
    -[AppTelemetryInvestigation setItemID:](self, "setItemID:");
    NSUInteger v4 = v16;
  }
  if (*((void *)v4 + 15))
  {
    -[AppTelemetryInvestigation setReason:](self, "setReason:");
    NSUInteger v4 = v16;
  }
  if (*((void *)v4 + 12))
  {
    -[AppTelemetryInvestigation setOperationType:](self, "setOperationType:");
    NSUInteger v4 = v16;
  }
  char v5 = v4[160];
  if ((v5 & 0x40) != 0)
  {
    self->_nonDiscretionary = v4[155];
    *(unsigned char *)&self->_has |= 0x40u;
    char v5 = v4[160];
    if ((v5 & 8) == 0)
    {
LABEL_21:
      if ((v5 & 0x20) == 0) {
        goto LABEL_23;
      }
      goto LABEL_22;
    }
  }
  else if ((v4[160] & 8) == 0)
  {
    goto LABEL_21;
  }
  self->_hasForegroundClients = v4[152];
  *(unsigned char *)&self->_has |= 8u;
  if ((v4[160] & 0x20) != 0)
  {
LABEL_22:
    self->_isPCSChained = v4[154];
    *(unsigned char *)&self->_has |= 0x20u;
  }
LABEL_23:
  if (*((void *)v4 + 6))
  {
    -[AppTelemetryInvestigation setEventGroupUUID:](self, "setEventGroupUUID:");
    NSUInteger v4 = v16;
  }
  if (*((void *)v4 + 11))
  {
    -[AppTelemetryInvestigation setMigrationUUID:](self, "setMigrationUUID:");
    NSUInteger v4 = v16;
  }
  qbsInvestigation = self->_qbsInvestigation;
  uint64_t v7 = *((void *)v4 + 13);
  if (qbsInvestigation)
  {
    if (!v7) {
      goto LABEL_36;
    }
    -[AppTelemetryQBSInvestigation mergeFrom:](qbsInvestigation, "mergeFrom:");
  }
  else
  {
    if (!v7) {
      goto LABEL_36;
    }
    -[AppTelemetryInvestigation setQbsInvestigation:](self, "setQbsInvestigation:");
  }
  NSUInteger v4 = v16;
LABEL_36:
  qbsPerformance = self->_qbsPerformance;
  uint64_t v9 = *((void *)v4 + 14);
  if (qbsPerformance)
  {
    if (!v9) {
      goto LABEL_42;
    }
    -[AppTelemetryQBSPerformance mergeFrom:](qbsPerformance, "mergeFrom:");
  }
  else
  {
    if (!v9) {
      goto LABEL_42;
    }
    -[AppTelemetryInvestigation setQbsPerformance:](self, "setQbsPerformance:");
  }
  NSUInteger v4 = v16;
LABEL_42:
  fpfsMigrationInvestigation = self->_fpfsMigrationInvestigation;
  uint64_t v11 = *((void *)v4 + 7);
  if (fpfsMigrationInvestigation)
  {
    if (!v11) {
      goto LABEL_48;
    }
    -[AppTelemetryFPFSMigrationInvestigation mergeFrom:](fpfsMigrationInvestigation, "mergeFrom:");
  }
  else
  {
    if (!v11) {
      goto LABEL_48;
    }
    -[AppTelemetryInvestigation setFpfsMigrationInvestigation:](self, "setFpfsMigrationInvestigation:");
  }
  NSUInteger v4 = v16;
LABEL_48:
  if ((v4[160] & 2) != 0)
  {
    self->_eventTimestamp = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  itemStatsInvestigation = self->_itemStatsInvestigation;
  uint64_t v13 = *((void *)v4 + 9);
  if (itemStatsInvestigation)
  {
    if (!v13) {
      goto LABEL_56;
    }
    -[AppTelemetryItemStatsInvestigation mergeFrom:](itemStatsInvestigation, "mergeFrom:");
  }
  else
  {
    if (!v13) {
      goto LABEL_56;
    }
    -[AppTelemetryInvestigation setItemStatsInvestigation:](self, "setItemStatsInvestigation:");
  }
  NSUInteger v4 = v16;
LABEL_56:
  stuckStatus = self->_stuckStatus;
  uint64_t v15 = *((void *)v4 + 16);
  if (stuckStatus)
  {
    if (!v15) {
      goto LABEL_62;
    }
    -[AppTelemetryStuckStatus mergeFrom:](stuckStatus, "mergeFrom:");
  }
  else
  {
    if (!v15) {
      goto LABEL_62;
    }
    -[AppTelemetryInvestigation setStuckStatus:](self, "setStuckStatus:");
  }
  NSUInteger v4 = v16;
LABEL_62:
  if ((v4[160] & 0x10) != 0)
  {
    self->_isEnhancedDrivePrivacyEnabled = v4[153];
    *(unsigned char *)&self->_has |= 0x10u;
  }
  if (*((void *)v4 + 17))
  {
    -[AppTelemetryInvestigation setUnderlyingErrorDomain:](self, "setUnderlyingErrorDomain:");
    NSUInteger v4 = v16;
  }
  if ((v4[160] & 4) != 0)
  {
    self->_underlyingErrorCode = *((void *)v4 + 3);
    *(unsigned char *)&self->_has |= 4u;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_underlyingErrorDomain, 0);
  objc_storeStrong((id *)&self->_stuckStatus, 0);
  objc_storeStrong((id *)&self->_reason, 0);
  objc_storeStrong((id *)&self->_qbsPerformance, 0);
  objc_storeStrong((id *)&self->_qbsInvestigation, 0);
  objc_storeStrong((id *)&self->_operationType, 0);
  objc_storeStrong((id *)&self->_migrationUUID, 0);
  objc_storeStrong((id *)&self->_lastStep, 0);
  objc_storeStrong((id *)&self->_itemStatsInvestigation, 0);
  objc_storeStrong((id *)&self->_itemID, 0);
  objc_storeStrong((id *)&self->_fpfsMigrationInvestigation, 0);
  objc_storeStrong((id *)&self->_eventGroupUUID, 0);
  objc_storeStrong((id *)&self->_errorDomain, 0);
  objc_storeStrong((id *)&self->_errorDescription, 0);
}

- (BOOL)hasZoneName
{
  return self->_zoneName != 0;
}

- (NSData)zoneName
{
  return self->_zoneName;
}

- (void)setZoneName:(id)a3
{
}

- (BOOL)sharedZone
{
  return self->_sharedZone;
}

- (void)setSharedZone:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x80u;
  self->_sharedZone = a3;
}

- (void)setHasSharedZone:(BOOL)a3
{
  if (a3) {
    char v3 = 0x80;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$FFDB406E3412A5DC1D44508339CF5839 has = v3 & 0x80 | *(unsigned char *)&self->_has & 0x7F;
}

- (BOOL)hasSharedZone
{
  return *(unsigned char *)&self->_has >> 7;
}

- (BOOL)hasErrorDomain
{
  return self->_errorDomain != 0;
}

- (NSString)errorDomain
{
  return self->_errorDomain;
}

- (void)setErrorDomain:(id)a3
{
}

- (int64_t)errorCode
{
  return self->_errorCode;
}

- (void)setErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_errorCode = a3;
}

- (void)setHasErrorCode:(BOOL)a3
{
  *(unsigned char *)&self->_$FFDB406E3412A5DC1D44508339CF5839 has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasErrorCode
{
  return *(unsigned char *)&self->_has & 1;
}

- (BOOL)hasErrorDescription
{
  return self->_errorDescription != 0;
}

- (NSString)errorDescription
{
  return self->_errorDescription;
}

- (void)setErrorDescription:(id)a3
{
}

- (BOOL)hasLastStep
{
  return self->_lastStep != 0;
}

- (NSString)lastStep
{
  return self->_lastStep;
}

- (void)setLastStep:(id)a3
{
}

- (BOOL)hasItemID
{
  return self->_itemID != 0;
}

- (NSString)itemID
{
  return self->_itemID;
}

- (void)setItemID:(id)a3
{
}

- (BOOL)hasReason
{
  return self->_reason != 0;
}

- (NSString)reason
{
  return self->_reason;
}

- (void)setReason:(id)a3
{
}

- (BOOL)hasOperationType
{
  return self->_operationType != 0;
}

- (NSString)operationType
{
  return self->_operationType;
}

- (void)setOperationType:(id)a3
{
}

- (BOOL)nonDiscretionary
{
  return self->_nonDiscretionary;
}

- (void)setNonDiscretionary:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x40u;
  self->_nonDiscretionary = a3;
}

- (void)setHasNonDiscretionary:(BOOL)a3
{
  if (a3) {
    char v3 = 64;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$FFDB406E3412A5DC1D44508339CF5839 has = *(unsigned char *)&self->_has & 0xBF | v3;
}

- (BOOL)hasNonDiscretionary
{
  return (*(unsigned char *)&self->_has >> 6) & 1;
}

- (BOOL)hasForegroundClients
{
  return self->_hasForegroundClients;
}

- (void)setHasForegroundClients:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_hasForegroundClients = a3;
}

- (void)setHasHasForegroundClients:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$FFDB406E3412A5DC1D44508339CF5839 has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasHasForegroundClients
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (BOOL)isPCSChained
{
  return self->_isPCSChained;
}

- (void)setIsPCSChained:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_isPCSChained = a3;
}

- (void)setHasIsPCSChained:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$FFDB406E3412A5DC1D44508339CF5839 has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasIsPCSChained
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (BOOL)hasEventGroupUUID
{
  return self->_eventGroupUUID != 0;
}

- (NSString)eventGroupUUID
{
  return self->_eventGroupUUID;
}

- (void)setEventGroupUUID:(id)a3
{
}

- (BOOL)hasMigrationUUID
{
  return self->_migrationUUID != 0;
}

- (NSString)migrationUUID
{
  return self->_migrationUUID;
}

- (void)setMigrationUUID:(id)a3
{
}

- (BOOL)hasQbsInvestigation
{
  return self->_qbsInvestigation != 0;
}

- (AppTelemetryQBSInvestigation)qbsInvestigation
{
  return self->_qbsInvestigation;
}

- (void)setQbsInvestigation:(id)a3
{
}

- (BOOL)hasQbsPerformance
{
  return self->_qbsPerformance != 0;
}

- (AppTelemetryQBSPerformance)qbsPerformance
{
  return self->_qbsPerformance;
}

- (void)setQbsPerformance:(id)a3
{
}

- (BOOL)hasFpfsMigrationInvestigation
{
  return self->_fpfsMigrationInvestigation != 0;
}

- (AppTelemetryFPFSMigrationInvestigation)fpfsMigrationInvestigation
{
  return self->_fpfsMigrationInvestigation;
}

- (void)setFpfsMigrationInvestigation:(id)a3
{
}

- (unint64_t)eventTimestamp
{
  return self->_eventTimestamp;
}

- (void)setEventTimestamp:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_eventTimestamp = a3;
}

- (void)setHasEventTimestamp:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$FFDB406E3412A5DC1D44508339CF5839 has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasEventTimestamp
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasItemStatsInvestigation
{
  return self->_itemStatsInvestigation != 0;
}

- (AppTelemetryItemStatsInvestigation)itemStatsInvestigation
{
  return self->_itemStatsInvestigation;
}

- (void)setItemStatsInvestigation:(id)a3
{
}

- (BOOL)hasStuckStatus
{
  return self->_stuckStatus != 0;
}

- (AppTelemetryStuckStatus)stuckStatus
{
  return self->_stuckStatus;
}

- (void)setStuckStatus:(id)a3
{
}

- (BOOL)isEnhancedDrivePrivacyEnabled
{
  return self->_isEnhancedDrivePrivacyEnabled;
}

- (void)setIsEnhancedDrivePrivacyEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_isEnhancedDrivePrivacyEnabled = a3;
}

- (void)setHasIsEnhancedDrivePrivacyEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$FFDB406E3412A5DC1D44508339CF5839 has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasIsEnhancedDrivePrivacyEnabled
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (BOOL)hasUnderlyingErrorDomain
{
  return self->_underlyingErrorDomain != 0;
}

- (NSString)underlyingErrorDomain
{
  return self->_underlyingErrorDomain;
}

- (void)setUnderlyingErrorDomain:(id)a3
{
}

- (int64_t)underlyingErrorCode
{
  return self->_underlyingErrorCode;
}

- (void)setUnderlyingErrorCode:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_underlyingErrorCode = a3;
}

- (void)setHasUnderlyingErrorCode:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$FFDB406E3412A5DC1D44508339CF5839 has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasUnderlyingErrorCode
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

@end
@interface FCCKPRequestOperationHeader
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)setApplicationBundle:(uint64_t)a1;
- (void)setApplicationContainer:(uint64_t)a1;
- (void)setDeviceHardwareVersion:(uint64_t)a1;
- (void)setDeviceLibraryName:(uint64_t)a1;
- (void)setDeviceLibraryVersion:(uint64_t)a1;
- (void)setDeviceSoftwareVersion:(uint64_t)a1;
- (void)setLocale:(uint64_t)a1;
- (void)setOperationGroupName:(uint64_t)a1;
- (void)writeTo:(id)a3;
@end

@implementation FCCKPRequestOperationHeader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIDContainerID, 0);
  objc_storeStrong((id *)&self->_operationGroupName, 0);
  objc_storeStrong((id *)&self->_mmcsProtocolVersion, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_deviceSoftwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceLibraryVersion, 0);
  objc_storeStrong((id *)&self->_deviceLibraryName, 0);
  objc_storeStrong((id *)&self->_deviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceHardwareVersion, 0);
  objc_storeStrong((id *)&self->_deviceHardwareID, 0);
  objc_storeStrong((id *)&self->_deviceFlowControlKey, 0);
  objc_storeStrong((id *)&self->_deviceAssignedName, 0);
  objc_storeStrong((id *)&self->_clientChangeToken, 0);
  objc_storeStrong((id *)&self->_applicationVersion, 0);
  objc_storeStrong((id *)&self->_applicationContainer, 0);
  objc_storeStrong((id *)&self->_applicationBundle, 0);
}

- (void)setLocale:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 176), a2);
  }
}

- (void)setDeviceSoftwareVersion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 160), a2);
  }
}

- (void)setDeviceLibraryVersion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 152), a2);
  }
}

- (void)setDeviceLibraryName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 144), a2);
  }
}

- (void)setDeviceHardwareVersion:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 128), a2);
  }
}

- (void)setApplicationContainer:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 64), a2);
  }
}

- (void)setApplicationBundle:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 56), a2);
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v8 = v4;
  if (self->_applicationContainer)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_applicationBundle)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_applicationVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
  }
  if (self->_deviceIdentifier)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (self->_deviceSoftwareVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_deviceHardwareVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_deviceLibraryName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_deviceLibraryVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_deviceFlowControlKey)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 4) == 0)
    {
LABEL_25:
      if ((v6 & 0x80) == 0) {
        goto LABEL_26;
      }
      goto LABEL_57;
    }
  }
  else if ((v6 & 4) == 0)
  {
    goto LABEL_25;
  }
  PBDataWriterWriteUint64Field();
  id v4 = v8;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x80) == 0)
  {
LABEL_26:
    if ((v6 & 8) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_57:
  PBDataWriterWriteFloatField();
  id v4 = v8;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_27:
    PBDataWriterWriteUint64Field();
    id v4 = v8;
  }
LABEL_28:
  if (self->_locale)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v8;
  }
  if (self->_mmcsProtocolVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_clientChangeToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v8;
  }
  if (self->_deviceAssignedName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if (self->_deviceHardwareID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_userIDContainerID)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v8;
  }
  if (self->_operationGroupName)
  {
    PBDataWriterWriteStringField();
    id v4 = v8;
  }
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v8;
    __int16 v7 = (__int16)self->_has;
  }
  if ((v7 & 0x400) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v8;
  }
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)FCCKPRequestOperationHeader;
  id v4 = [(FCCKPRequestOperationHeader *)&v8 description];
  v5 = [(FCCKPRequestOperationHeader *)self dictionaryRepresentation];
  __int16 v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v5 = v3;
  applicationContainer = self->_applicationContainer;
  if (applicationContainer) {
    [v3 setObject:applicationContainer forKey:@"applicationContainer"];
  }
  applicationBundle = self->_applicationBundle;
  if (applicationBundle) {
    [v5 setObject:applicationBundle forKey:@"applicationBundle"];
  }
  applicationVersion = self->_applicationVersion;
  if (applicationVersion) {
    [v5 setObject:applicationVersion forKey:@"applicationVersion"];
  }
  __int16 has = (__int16)self->_has;
  if (has)
  {
    v10 = [NSNumber numberWithUnsignedLongLong:self->_applicationConfigVersion];
    [v5 setObject:v10 forKey:@"applicationConfigVersion"];

    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    v11 = [NSNumber numberWithUnsignedLongLong:self->_globalConfigVersion];
    [v5 setObject:v11 forKey:@"globalConfigVersion"];
  }
  deviceIdentifier = self->_deviceIdentifier;
  if (deviceIdentifier)
  {
    v13 = [(FCCKPIdentifier *)deviceIdentifier dictionaryRepresentation];
    [v5 setObject:v13 forKey:@"deviceIdentifier"];
  }
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  if (deviceSoftwareVersion) {
    [v5 setObject:deviceSoftwareVersion forKey:@"deviceSoftwareVersion"];
  }
  deviceHardwareVersion = self->_deviceHardwareVersion;
  if (deviceHardwareVersion) {
    [v5 setObject:deviceHardwareVersion forKey:@"deviceHardwareVersion"];
  }
  deviceLibraryName = self->_deviceLibraryName;
  if (deviceLibraryName) {
    [v5 setObject:deviceLibraryName forKey:@"deviceLibraryName"];
  }
  deviceLibraryVersion = self->_deviceLibraryVersion;
  if (deviceLibraryVersion) {
    [v5 setObject:deviceLibraryVersion forKey:@"deviceLibraryVersion"];
  }
  deviceFlowControlKey = self->_deviceFlowControlKey;
  if (deviceFlowControlKey) {
    [v5 setObject:deviceFlowControlKey forKey:@"deviceFlowControlKey"];
  }
  __int16 v19 = (__int16)self->_has;
  if ((v19 & 2) != 0)
  {
    v36 = [NSNumber numberWithUnsignedLongLong:self->_deviceFlowControlBudget];
    [v5 setObject:v36 forKey:@"deviceFlowControlBudget"];

    __int16 v19 = (__int16)self->_has;
    if ((v19 & 4) == 0)
    {
LABEL_25:
      if ((v19 & 0x80) == 0) {
        goto LABEL_26;
      }
      goto LABEL_57;
    }
  }
  else if ((v19 & 4) == 0)
  {
    goto LABEL_25;
  }
  v37 = [NSNumber numberWithUnsignedLongLong:self->_deviceFlowControlBudgetCap];
  [v5 setObject:v37 forKey:@"deviceFlowControlBudgetCap"];

  __int16 v19 = (__int16)self->_has;
  if ((v19 & 0x80) == 0)
  {
LABEL_26:
    if ((v19 & 8) == 0) {
      goto LABEL_28;
    }
    goto LABEL_27;
  }
LABEL_57:
  *(float *)&double v4 = self->_deviceFlowControlRegeneration;
  v38 = [NSNumber numberWithFloat:v4];
  [v5 setObject:v38 forKey:@"deviceFlowControlRegeneration"];

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_27:
    v20 = [NSNumber numberWithUnsignedLongLong:self->_deviceProtocolVersion];
    [v5 setObject:v20 forKey:@"deviceProtocolVersion"];
  }
LABEL_28:
  locale = self->_locale;
  if (locale)
  {
    v22 = [(FCCKPLocale *)locale dictionaryRepresentation];
    [v5 setObject:v22 forKey:@"locale"];
  }
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  if (mmcsProtocolVersion) {
    [v5 setObject:mmcsProtocolVersion forKey:@"mmcsProtocolVersion"];
  }
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    v24 = [NSNumber numberWithInt:self->_applicationContainerEnvironment];
    [v5 setObject:v24 forKey:@"applicationContainerEnvironment"];
  }
  clientChangeToken = self->_clientChangeToken;
  if (clientChangeToken) {
    [v5 setObject:clientChangeToken forKey:@"clientChangeToken"];
  }
  deviceAssignedName = self->_deviceAssignedName;
  if (deviceAssignedName) {
    [v5 setObject:deviceAssignedName forKey:@"deviceAssignedName"];
  }
  deviceHardwareID = self->_deviceHardwareID;
  if (deviceHardwareID) {
    [v5 setObject:deviceHardwareID forKey:@"deviceHardwareID"];
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    v28 = [NSNumber numberWithInt:self->_targetDatabase];
    [v5 setObject:v28 forKey:@"targetDatabase"];
  }
  userIDContainerID = self->_userIDContainerID;
  if (userIDContainerID) {
    [v5 setObject:userIDContainerID forKey:@"userIDContainerID"];
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    v30 = [NSNumber numberWithInt:self->_isolationLevel];
    [v5 setObject:v30 forKey:@"isolationLevel"];
  }
  operationGroupName = self->_operationGroupName;
  if (operationGroupName) {
    [v5 setObject:operationGroupName forKey:@"operationGroupName"];
  }
  __int16 v32 = (__int16)self->_has;
  if ((v32 & 0x20) != 0)
  {
    v33 = [NSNumber numberWithUnsignedLongLong:self->_operationGroupQuantity];
    [v5 setObject:v33 forKey:@"operationGroupQuantity"];

    __int16 v32 = (__int16)self->_has;
  }
  if ((v32 & 0x400) != 0)
  {
    v34 = [NSNumber numberWithBool:self->_deviceSoftwareIsAppleInternal];
    [v5 setObject:v34 forKey:@"deviceSoftwareIsAppleInternal"];
  }
  return v5;
}

- (BOOL)readFrom:(id)a3
{
  return FCCKPRequestOperationHeaderReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_applicationContainer copyWithZone:a3];
  __int16 v7 = *(void **)(v5 + 64);
  *(void *)(v5 + 64) = v6;

  uint64_t v8 = [(NSString *)self->_applicationBundle copyWithZone:a3];
  v9 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v8;

  uint64_t v10 = [(NSString *)self->_applicationVersion copyWithZone:a3];
  v11 = *(void **)(v5 + 80);
  *(void *)(v5 + 80) = v10;

  __int16 has = (__int16)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_applicationConfigVersion;
    *(_WORD *)(v5 + 220) |= 1u;
    __int16 has = (__int16)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    *(void *)(v5 + 40) = self->_globalConfigVersion;
    *(_WORD *)(v5 + 220) |= 0x10u;
  }
  id v13 = [(FCCKPIdentifier *)self->_deviceIdentifier copyWithZone:a3];
  v14 = *(void **)(v5 + 136);
  *(void *)(v5 + 136) = v13;

  uint64_t v15 = [(NSString *)self->_deviceSoftwareVersion copyWithZone:a3];
  v16 = *(void **)(v5 + 160);
  *(void *)(v5 + 160) = v15;

  uint64_t v17 = [(NSString *)self->_deviceHardwareVersion copyWithZone:a3];
  v18 = *(void **)(v5 + 128);
  *(void *)(v5 + 128) = v17;

  uint64_t v19 = [(NSString *)self->_deviceLibraryName copyWithZone:a3];
  v20 = *(void **)(v5 + 144);
  *(void *)(v5 + 144) = v19;

  uint64_t v21 = [(NSString *)self->_deviceLibraryVersion copyWithZone:a3];
  v22 = *(void **)(v5 + 152);
  *(void *)(v5 + 152) = v21;

  uint64_t v23 = [(NSString *)self->_deviceFlowControlKey copyWithZone:a3];
  v24 = *(void **)(v5 + 104);
  *(void *)(v5 + 104) = v23;

  __int16 v25 = (__int16)self->_has;
  if ((v25 & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_deviceFlowControlBudget;
    *(_WORD *)(v5 + 220) |= 2u;
    __int16 v25 = (__int16)self->_has;
    if ((v25 & 4) == 0)
    {
LABEL_7:
      if ((v25 & 0x80) == 0) {
        goto LABEL_8;
      }
      goto LABEL_23;
    }
  }
  else if ((v25 & 4) == 0)
  {
    goto LABEL_7;
  }
  *(void *)(v5 + 24) = self->_deviceFlowControlBudgetCap;
  *(_WORD *)(v5 + 220) |= 4u;
  __int16 v25 = (__int16)self->_has;
  if ((v25 & 0x80) == 0)
  {
LABEL_8:
    if ((v25 & 8) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_23:
  *(float *)(v5 + 112) = self->_deviceFlowControlRegeneration;
  *(_WORD *)(v5 + 220) |= 0x80u;
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
LABEL_9:
    *(void *)(v5 + 32) = self->_deviceProtocolVersion;
    *(_WORD *)(v5 + 220) |= 8u;
  }
LABEL_10:
  id v26 = [(FCCKPLocale *)self->_locale copyWithZone:a3];
  v27 = *(void **)(v5 + 176);
  *(void *)(v5 + 176) = v26;

  uint64_t v28 = [(NSString *)self->_mmcsProtocolVersion copyWithZone:a3];
  v29 = *(void **)(v5 + 184);
  *(void *)(v5 + 184) = v28;

  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    *(_DWORD *)(v5 + 72) = self->_applicationContainerEnvironment;
    *(_WORD *)(v5 + 220) |= 0x40u;
  }
  uint64_t v30 = [(NSData *)self->_clientChangeToken copyWithZone:a3];
  v31 = *(void **)(v5 + 88);
  *(void *)(v5 + 88) = v30;

  uint64_t v32 = [(NSString *)self->_deviceAssignedName copyWithZone:a3];
  v33 = *(void **)(v5 + 96);
  *(void *)(v5 + 96) = v32;

  uint64_t v34 = [(NSString *)self->_deviceHardwareID copyWithZone:a3];
  v35 = *(void **)(v5 + 120);
  *(void *)(v5 + 120) = v34;

  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    *(_DWORD *)(v5 + 200) = self->_targetDatabase;
    *(_WORD *)(v5 + 220) |= 0x200u;
  }
  uint64_t v36 = [(NSString *)self->_userIDContainerID copyWithZone:a3];
  v37 = *(void **)(v5 + 208);
  *(void *)(v5 + 208) = v36;

  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    *(_DWORD *)(v5 + 168) = self->_isolationLevel;
    *(_WORD *)(v5 + 220) |= 0x100u;
  }
  uint64_t v38 = [(NSString *)self->_operationGroupName copyWithZone:a3];
  v39 = *(void **)(v5 + 192);
  *(void *)(v5 + 192) = v38;

  __int16 v40 = (__int16)self->_has;
  if ((v40 & 0x20) != 0)
  {
    *(void *)(v5 + 48) = self->_operationGroupQuantity;
    *(_WORD *)(v5 + 220) |= 0x20u;
    __int16 v40 = (__int16)self->_has;
  }
  if ((v40 & 0x400) != 0)
  {
    *(unsigned char *)(v5 + 216) = self->_deviceSoftwareIsAppleInternal;
    *(_WORD *)(v5 + 220) |= 0x400u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_89;
  }
  applicationContainer = self->_applicationContainer;
  if ((unint64_t)applicationContainer | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](applicationContainer, "isEqual:")) {
      goto LABEL_89;
    }
  }
  applicationBundle = self->_applicationBundle;
  if ((unint64_t)applicationBundle | *((void *)v4 + 7))
  {
    if (!-[NSString isEqual:](applicationBundle, "isEqual:")) {
      goto LABEL_89;
    }
  }
  applicationVersion = self->_applicationVersion;
  if ((unint64_t)applicationVersion | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](applicationVersion, "isEqual:")) {
      goto LABEL_89;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v9 = *((_WORD *)v4 + 110);
  if (has)
  {
    if ((v9 & 1) == 0 || self->_applicationConfigVersion != *((void *)v4 + 1)) {
      goto LABEL_89;
    }
  }
  else if (v9)
  {
    goto LABEL_89;
  }
  if ((has & 0x10) != 0)
  {
    if ((v9 & 0x10) == 0 || self->_globalConfigVersion != *((void *)v4 + 5)) {
      goto LABEL_89;
    }
  }
  else if ((v9 & 0x10) != 0)
  {
    goto LABEL_89;
  }
  deviceIdentifier = self->_deviceIdentifier;
  if ((unint64_t)deviceIdentifier | *((void *)v4 + 17)
    && !-[FCCKPIdentifier isEqual:](deviceIdentifier, "isEqual:"))
  {
    goto LABEL_89;
  }
  deviceSoftwareVersion = self->_deviceSoftwareVersion;
  if ((unint64_t)deviceSoftwareVersion | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](deviceSoftwareVersion, "isEqual:")) {
      goto LABEL_89;
    }
  }
  deviceHardwareVersion = self->_deviceHardwareVersion;
  if ((unint64_t)deviceHardwareVersion | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](deviceHardwareVersion, "isEqual:")) {
      goto LABEL_89;
    }
  }
  deviceLibraryName = self->_deviceLibraryName;
  if ((unint64_t)deviceLibraryName | *((void *)v4 + 18))
  {
    if (!-[NSString isEqual:](deviceLibraryName, "isEqual:")) {
      goto LABEL_89;
    }
  }
  deviceLibraryVersion = self->_deviceLibraryVersion;
  if ((unint64_t)deviceLibraryVersion | *((void *)v4 + 19))
  {
    if (!-[NSString isEqual:](deviceLibraryVersion, "isEqual:")) {
      goto LABEL_89;
    }
  }
  deviceFlowControlKey = self->_deviceFlowControlKey;
  if ((unint64_t)deviceFlowControlKey | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](deviceFlowControlKey, "isEqual:")) {
      goto LABEL_89;
    }
  }
  __int16 v16 = (__int16)self->_has;
  __int16 v17 = *((_WORD *)v4 + 110);
  if ((v16 & 2) != 0)
  {
    if ((v17 & 2) == 0 || self->_deviceFlowControlBudget != *((void *)v4 + 2)) {
      goto LABEL_89;
    }
  }
  else if ((v17 & 2) != 0)
  {
    goto LABEL_89;
  }
  if ((v16 & 4) != 0)
  {
    if ((v17 & 4) == 0 || self->_deviceFlowControlBudgetCap != *((void *)v4 + 3)) {
      goto LABEL_89;
    }
  }
  else if ((v17 & 4) != 0)
  {
    goto LABEL_89;
  }
  if ((v16 & 0x80) != 0)
  {
    if ((v17 & 0x80) == 0 || self->_deviceFlowControlRegeneration != *((float *)v4 + 28)) {
      goto LABEL_89;
    }
  }
  else if ((v17 & 0x80) != 0)
  {
    goto LABEL_89;
  }
  if ((v16 & 8) != 0)
  {
    if ((v17 & 8) == 0 || self->_deviceProtocolVersion != *((void *)v4 + 4)) {
      goto LABEL_89;
    }
  }
  else if ((v17 & 8) != 0)
  {
    goto LABEL_89;
  }
  locale = self->_locale;
  if ((unint64_t)locale | *((void *)v4 + 22) && !-[FCCKPLocale isEqual:](locale, "isEqual:")) {
    goto LABEL_89;
  }
  mmcsProtocolVersion = self->_mmcsProtocolVersion;
  if ((unint64_t)mmcsProtocolVersion | *((void *)v4 + 23))
  {
    if (!-[NSString isEqual:](mmcsProtocolVersion, "isEqual:")) {
      goto LABEL_89;
    }
  }
  __int16 v20 = *((_WORD *)v4 + 110);
  if ((*(_WORD *)&self->_has & 0x40) != 0)
  {
    if ((v20 & 0x40) == 0 || self->_applicationContainerEnvironment != *((_DWORD *)v4 + 18)) {
      goto LABEL_89;
    }
  }
  else if ((v20 & 0x40) != 0)
  {
    goto LABEL_89;
  }
  clientChangeToken = self->_clientChangeToken;
  if ((unint64_t)clientChangeToken | *((void *)v4 + 11)
    && !-[NSData isEqual:](clientChangeToken, "isEqual:"))
  {
    goto LABEL_89;
  }
  deviceAssignedName = self->_deviceAssignedName;
  if ((unint64_t)deviceAssignedName | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](deviceAssignedName, "isEqual:")) {
      goto LABEL_89;
    }
  }
  deviceHardwareID = self->_deviceHardwareID;
  if ((unint64_t)deviceHardwareID | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](deviceHardwareID, "isEqual:")) {
      goto LABEL_89;
    }
  }
  __int16 v24 = (__int16)self->_has;
  __int16 v25 = *((_WORD *)v4 + 110);
  if ((v24 & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 110) & 0x200) == 0 || self->_targetDatabase != *((_DWORD *)v4 + 50)) {
      goto LABEL_89;
    }
  }
  else if ((*((_WORD *)v4 + 110) & 0x200) != 0)
  {
    goto LABEL_89;
  }
  userIDContainerID = self->_userIDContainerID;
  if ((unint64_t)userIDContainerID | *((void *)v4 + 26))
  {
    if (!-[NSString isEqual:](userIDContainerID, "isEqual:")) {
      goto LABEL_89;
    }
    __int16 v24 = (__int16)self->_has;
    __int16 v25 = *((_WORD *)v4 + 110);
  }
  if ((v24 & 0x100) != 0)
  {
    if ((v25 & 0x100) == 0 || self->_isolationLevel != *((_DWORD *)v4 + 42)) {
      goto LABEL_89;
    }
  }
  else if ((v25 & 0x100) != 0)
  {
    goto LABEL_89;
  }
  operationGroupName = self->_operationGroupName;
  if ((unint64_t)operationGroupName | *((void *)v4 + 24))
  {
    if (!-[NSString isEqual:](operationGroupName, "isEqual:")) {
      goto LABEL_89;
    }
    __int16 v24 = (__int16)self->_has;
    __int16 v25 = *((_WORD *)v4 + 110);
  }
  if ((v24 & 0x20) != 0)
  {
    if ((v25 & 0x20) == 0 || self->_operationGroupQuantity != *((void *)v4 + 6)) {
      goto LABEL_89;
    }
  }
  else if ((v25 & 0x20) != 0)
  {
    goto LABEL_89;
  }
  if ((v24 & 0x400) != 0)
  {
    if ((v25 & 0x400) != 0)
    {
      if (self->_deviceSoftwareIsAppleInternal)
      {
        if (!*((unsigned char *)v4 + 216)) {
          goto LABEL_89;
        }
      }
      else if (*((unsigned char *)v4 + 216))
      {
        goto LABEL_89;
      }
      BOOL v28 = 1;
      goto LABEL_90;
    }
LABEL_89:
    BOOL v28 = 0;
    goto LABEL_90;
  }
  BOOL v28 = (v25 & 0x400) == 0;
LABEL_90:

  return v28;
}

- (unint64_t)hash
{
  NSUInteger v38 = [(NSString *)self->_applicationContainer hash];
  NSUInteger v37 = [(NSString *)self->_applicationBundle hash];
  NSUInteger v36 = [(NSString *)self->_applicationVersion hash];
  __int16 has = (__int16)self->_has;
  if (has)
  {
    unint64_t v35 = 2654435761u * self->_applicationConfigVersion;
    if ((has & 0x10) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    unint64_t v35 = 0;
    if ((has & 0x10) != 0)
    {
LABEL_3:
      unint64_t v34 = 2654435761u * self->_globalConfigVersion;
      goto LABEL_6;
    }
  }
  unint64_t v34 = 0;
LABEL_6:
  unint64_t v33 = [(FCCKPIdentifier *)self->_deviceIdentifier hash];
  NSUInteger v32 = [(NSString *)self->_deviceSoftwareVersion hash];
  NSUInteger v31 = [(NSString *)self->_deviceHardwareVersion hash];
  NSUInteger v30 = [(NSString *)self->_deviceLibraryName hash];
  NSUInteger v29 = [(NSString *)self->_deviceLibraryVersion hash];
  NSUInteger v28 = [(NSString *)self->_deviceFlowControlKey hash];
  __int16 v4 = (__int16)self->_has;
  if ((v4 & 2) == 0)
  {
    unint64_t v27 = 0;
    if ((v4 & 4) != 0) {
      goto LABEL_8;
    }
LABEL_14:
    unint64_t v26 = 0;
    if ((v4 & 0x80) != 0) {
      goto LABEL_9;
    }
LABEL_15:
    unint64_t v9 = 0;
    goto LABEL_18;
  }
  unint64_t v27 = 2654435761u * self->_deviceFlowControlBudget;
  if ((v4 & 4) == 0) {
    goto LABEL_14;
  }
LABEL_8:
  unint64_t v26 = 2654435761u * self->_deviceFlowControlBudgetCap;
  if ((v4 & 0x80) == 0) {
    goto LABEL_15;
  }
LABEL_9:
  float deviceFlowControlRegeneration = self->_deviceFlowControlRegeneration;
  float v6 = -deviceFlowControlRegeneration;
  if (deviceFlowControlRegeneration >= 0.0) {
    float v6 = self->_deviceFlowControlRegeneration;
  }
  float v7 = floorf(v6 + 0.5);
  float v8 = (float)(v6 - v7) * 1.8447e19;
  unint64_t v9 = 2654435761u * (unint64_t)fmodf(v7, 1.8447e19);
  if (v8 >= 0.0)
  {
    if (v8 > 0.0) {
      v9 += (unint64_t)v8;
    }
  }
  else
  {
    v9 -= (unint64_t)fabsf(v8);
  }
LABEL_18:
  unint64_t v25 = v9;
  if ((v4 & 8) != 0) {
    unint64_t v24 = 2654435761u * self->_deviceProtocolVersion;
  }
  else {
    unint64_t v24 = 0;
  }
  unint64_t v23 = [(FCCKPLocale *)self->_locale hash];
  NSUInteger v21 = [(NSString *)self->_mmcsProtocolVersion hash];
  if ((*(_WORD *)&self->_has & 0x40) != 0) {
    uint64_t v10 = 2654435761 * self->_applicationContainerEnvironment;
  }
  else {
    uint64_t v10 = 0;
  }
  uint64_t v11 = [(NSData *)self->_clientChangeToken hash];
  NSUInteger v12 = [(NSString *)self->_deviceAssignedName hash];
  NSUInteger v13 = [(NSString *)self->_deviceHardwareID hash];
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
    uint64_t v14 = 2654435761 * self->_targetDatabase;
  }
  else {
    uint64_t v14 = 0;
  }
  NSUInteger v15 = [(NSString *)self->_userIDContainerID hash];
  if ((*(_WORD *)&self->_has & 0x100) != 0) {
    uint64_t v16 = 2654435761 * self->_isolationLevel;
  }
  else {
    uint64_t v16 = 0;
  }
  NSUInteger v17 = [(NSString *)self->_operationGroupName hash];
  if ((*(_WORD *)&self->_has & 0x20) != 0)
  {
    unint64_t v18 = 2654435761u * self->_operationGroupQuantity;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_32;
    }
LABEL_34:
    uint64_t v19 = 0;
    return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
  }
  unint64_t v18 = 0;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_34;
  }
LABEL_32:
  uint64_t v19 = 2654435761 * self->_deviceSoftwareIsAppleInternal;
  return v37 ^ v38 ^ v36 ^ v35 ^ v34 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v10 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v17 ^ v18 ^ v19;
}

- (void)setOperationGroupName:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 192), a2);
  }
}

@end
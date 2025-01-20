@interface NBPBBackupMetadata
- (BOOL)diagnosticsOptInEnabled;
- (BOOL)hasActiveWatchFaceFileContents;
- (BOOL)hasBackingColor;
- (BOOL)hasBackupType;
- (BOOL)hasBcmWindowMaterial;
- (BOOL)hasBottomEnclosureMaterial;
- (BOOL)hasCoverGlassColor;
- (BOOL)hasDeviceCSN;
- (BOOL)hasDeviceColor;
- (BOOL)hasDeviceEnclosureColor;
- (BOOL)hasDiagnosticsOptInEnabled;
- (BOOL)hasFcmMaterial;
- (BOOL)hasHousingColor;
- (BOOL)hasLastModificationDate;
- (BOOL)hasLocationOptInEnabled;
- (BOOL)hasMarketingVersion;
- (BOOL)hasName;
- (BOOL)hasProductName;
- (BOOL)hasProductType;
- (BOOL)hasSizeInBytes;
- (BOOL)hasSystemBuildVersion;
- (BOOL)hasSystemVersion;
- (BOOL)hasTopEnclosureMaterial;
- (BOOL)hasUuid;
- (BOOL)hasWatchFace;
- (BOOL)hasWatchFaceColor;
- (BOOL)hasWatchFaceData;
- (BOOL)isEqual:(id)a3;
- (BOOL)locationOptInEnabled;
- (BOOL)readFrom:(id)a3;
- (NSData)activeWatchFaceFileContents;
- (NSData)uuid;
- (NSData)watchFaceData;
- (NSString)deviceCSN;
- (NSString)deviceColor;
- (NSString)deviceEnclosureColor;
- (NSString)marketingVersion;
- (NSString)name;
- (NSString)productName;
- (NSString)productType;
- (NSString)systemBuildVersion;
- (NSString)systemVersion;
- (NSString)watchFace;
- (NSString)watchFaceColor;
- (double)lastModificationDate;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)backingColor;
- (int)backupType;
- (int)bcmWindowMaterial;
- (int)bottomEnclosureMaterial;
- (int)coverGlassColor;
- (int)fcmMaterial;
- (int)housingColor;
- (int)topEnclosureMaterial;
- (int64_t)sizeInBytes;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setActiveWatchFaceFileContents:(id)a3;
- (void)setBackingColor:(int)a3;
- (void)setBackupType:(int)a3;
- (void)setBcmWindowMaterial:(int)a3;
- (void)setBottomEnclosureMaterial:(int)a3;
- (void)setCoverGlassColor:(int)a3;
- (void)setDeviceCSN:(id)a3;
- (void)setDeviceColor:(id)a3;
- (void)setDeviceEnclosureColor:(id)a3;
- (void)setDiagnosticsOptInEnabled:(BOOL)a3;
- (void)setFcmMaterial:(int)a3;
- (void)setHasBackingColor:(BOOL)a3;
- (void)setHasBackupType:(BOOL)a3;
- (void)setHasBcmWindowMaterial:(BOOL)a3;
- (void)setHasBottomEnclosureMaterial:(BOOL)a3;
- (void)setHasCoverGlassColor:(BOOL)a3;
- (void)setHasDiagnosticsOptInEnabled:(BOOL)a3;
- (void)setHasFcmMaterial:(BOOL)a3;
- (void)setHasHousingColor:(BOOL)a3;
- (void)setHasLastModificationDate:(BOOL)a3;
- (void)setHasLocationOptInEnabled:(BOOL)a3;
- (void)setHasSizeInBytes:(BOOL)a3;
- (void)setHasTopEnclosureMaterial:(BOOL)a3;
- (void)setHousingColor:(int)a3;
- (void)setLastModificationDate:(double)a3;
- (void)setLocationOptInEnabled:(BOOL)a3;
- (void)setMarketingVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setProductName:(id)a3;
- (void)setProductType:(id)a3;
- (void)setSizeInBytes:(int64_t)a3;
- (void)setSystemBuildVersion:(id)a3;
- (void)setSystemVersion:(id)a3;
- (void)setTopEnclosureMaterial:(int)a3;
- (void)setUuid:(id)a3;
- (void)setWatchFace:(id)a3;
- (void)setWatchFaceColor:(id)a3;
- (void)setWatchFaceData:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation NBPBBackupMetadata

- (BOOL)hasUuid
{
  return self->_uuid != 0;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (BOOL)hasProductType
{
  return self->_productType != 0;
}

- (BOOL)hasProductName
{
  return self->_productName != 0;
}

- (BOOL)hasSystemVersion
{
  return self->_systemVersion != 0;
}

- (BOOL)hasSystemBuildVersion
{
  return self->_systemBuildVersion != 0;
}

- (BOOL)hasMarketingVersion
{
  return self->_marketingVersion != 0;
}

- (BOOL)hasDeviceColor
{
  return self->_deviceColor != 0;
}

- (BOOL)hasDeviceEnclosureColor
{
  return self->_deviceEnclosureColor != 0;
}

- (void)setBottomEnclosureMaterial:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_bottomEnclosureMaterial = a3;
}

- (void)setHasBottomEnclosureMaterial:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasBottomEnclosureMaterial
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setTopEnclosureMaterial:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_topEnclosureMaterial = a3;
}

- (void)setHasTopEnclosureMaterial:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasTopEnclosureMaterial
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setFcmMaterial:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_fcmMaterial = a3;
}

- (void)setHasFcmMaterial:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasFcmMaterial
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setBcmWindowMaterial:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_bcmWindowMaterial = a3;
}

- (void)setHasBcmWindowMaterial:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasBcmWindowMaterial
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setCoverGlassColor:(int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_coverGlassColor = a3;
}

- (void)setHasCoverGlassColor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasCoverGlassColor
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setHousingColor:(int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_housingColor = a3;
}

- (void)setHasHousingColor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasHousingColor
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setBackingColor:(int)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_backingColor = a3;
}

- (void)setHasBackingColor:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasBackingColor
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (BOOL)hasWatchFace
{
  return self->_watchFace != 0;
}

- (BOOL)hasWatchFaceColor
{
  return self->_watchFaceColor != 0;
}

- (void)setLocationOptInEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_locationOptInEnabled = a3;
}

- (void)setHasLocationOptInEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasLocationOptInEnabled
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setDiagnosticsOptInEnabled:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_diagnosticsOptInEnabled = a3;
}

- (void)setHasDiagnosticsOptInEnabled:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasDiagnosticsOptInEnabled
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setLastModificationDate:(double)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_lastModificationDate = a3;
}

- (void)setHasLastModificationDate:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasLastModificationDate
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setSizeInBytes:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_sizeInBytes = a3;
}

- (void)setHasSizeInBytes:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasSizeInBytes
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasActiveWatchFaceFileContents
{
  return self->_activeWatchFaceFileContents != 0;
}

- (void)setBackupType:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_backupType = a3;
}

- (void)setHasBackupType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBackupType
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (BOOL)hasDeviceCSN
{
  return self->_deviceCSN != 0;
}

- (BOOL)hasWatchFaceData
{
  return self->_watchFaceData != 0;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)NBPBBackupMetadata;
  __int16 v3 = [(NBPBBackupMetadata *)&v7 description];
  v4 = [(NBPBBackupMetadata *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  uuid = self->_uuid;
  if (uuid) {
    [v3 setObject:uuid forKey:@"uuid"];
  }
  name = self->_name;
  if (name) {
    [v4 setObject:name forKey:@"name"];
  }
  productType = self->_productType;
  if (productType) {
    [v4 setObject:productType forKey:@"productType"];
  }
  productName = self->_productName;
  if (productName) {
    [v4 setObject:productName forKey:@"productName"];
  }
  systemVersion = self->_systemVersion;
  if (systemVersion) {
    [v4 setObject:systemVersion forKey:@"systemVersion"];
  }
  systemBuildVersion = self->_systemBuildVersion;
  if (systemBuildVersion) {
    [v4 setObject:systemBuildVersion forKey:@"systemBuildVersion"];
  }
  marketingVersion = self->_marketingVersion;
  if (marketingVersion) {
    [v4 setObject:marketingVersion forKey:@"marketingVersion"];
  }
  deviceColor = self->_deviceColor;
  if (deviceColor) {
    [v4 setObject:deviceColor forKey:@"deviceColor"];
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if (deviceEnclosureColor) {
    [v4 setObject:deviceEnclosureColor forKey:@"deviceEnclosureColor"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    v25 = +[NSNumber numberWithInt:self->_bottomEnclosureMaterial];
    [v4 setObject:v25 forKey:@"bottomEnclosureMaterial"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_21:
      if ((has & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_21;
  }
  v26 = +[NSNumber numberWithInt:self->_topEnclosureMaterial];
  [v4 setObject:v26 forKey:@"topEnclosureMaterial"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_22:
    if ((has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  v27 = +[NSNumber numberWithInt:self->_fcmMaterial];
  [v4 setObject:v27 forKey:@"fcmMaterial"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_23:
    if ((has & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  v28 = +[NSNumber numberWithInt:self->_bcmWindowMaterial];
  [v4 setObject:v28 forKey:@"bcmWindowMaterial"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_24:
    if ((has & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  v29 = +[NSNumber numberWithInt:self->_coverGlassColor];
  [v4 setObject:v29 forKey:@"coverGlassColor"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_25:
    if ((has & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_52:
  v30 = +[NSNumber numberWithInt:self->_housingColor];
  [v4 setObject:v30 forKey:@"housingColor"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_26:
    v15 = +[NSNumber numberWithInt:self->_backingColor];
    [v4 setObject:v15 forKey:@"backingColor"];
  }
LABEL_27:
  watchFace = self->_watchFace;
  if (watchFace) {
    [v4 setObject:watchFace forKey:@"watchFace"];
  }
  watchFaceColor = self->_watchFaceColor;
  if (watchFaceColor) {
    [v4 setObject:watchFaceColor forKey:@"watchFaceColor"];
  }
  __int16 v18 = (__int16)self->_has;
  if ((v18 & 0x800) != 0)
  {
    v31 = +[NSNumber numberWithBool:self->_locationOptInEnabled];
    [v4 setObject:v31 forKey:@"locationOptInEnabled"];

    __int16 v18 = (__int16)self->_has;
    if ((v18 & 0x400) == 0)
    {
LABEL_33:
      if ((v18 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_33;
  }
  v32 = +[NSNumber numberWithBool:self->_diagnosticsOptInEnabled];
  [v4 setObject:v32 forKey:@"diagnosticsOptInEnabled"];

  __int16 v18 = (__int16)self->_has;
  if ((v18 & 1) == 0)
  {
LABEL_34:
    if ((v18 & 2) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_56:
  v33 = +[NSNumber numberWithDouble:self->_lastModificationDate];
  [v4 setObject:v33 forKey:@"lastModificationDate"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_35:
    v19 = +[NSNumber numberWithLongLong:self->_sizeInBytes];
    [v4 setObject:v19 forKey:@"sizeInBytes"];
  }
LABEL_36:
  activeWatchFaceFileContents = self->_activeWatchFaceFileContents;
  if (activeWatchFaceFileContents) {
    [v4 setObject:activeWatchFaceFileContents forKey:@"activeWatchFaceFileContents"];
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    v21 = +[NSNumber numberWithInt:self->_backupType];
    [v4 setObject:v21 forKey:@"backupType"];
  }
  deviceCSN = self->_deviceCSN;
  if (deviceCSN) {
    [v4 setObject:deviceCSN forKey:@"deviceCSN"];
  }
  watchFaceData = self->_watchFaceData;
  if (watchFaceData) {
    [v4 setObject:watchFaceData forKey:@"watchFaceData"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10001A65C((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_uuid)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_productType)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_productName)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_systemVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_systemBuildVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_marketingVersion)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_deviceColor)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_deviceEnclosureColor)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_21:
      if ((has & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_21;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_22:
    if ((has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_23:
    if ((has & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_24:
    if ((has & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_25:
    if ((has & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_52:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_26:
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
LABEL_27:
  if (self->_watchFace)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_watchFaceColor)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_33:
      if ((v6 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_33;
  }
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_34:
    if ((v6 & 2) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_56:
  PBDataWriterWriteDoubleField();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_35:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_36:
  if (self->_activeWatchFaceFileContents)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
  }
  if (self->_deviceCSN)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_watchFaceData)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_uuid)
  {
    objc_msgSend(v4, "setUuid:");
    id v4 = v7;
  }
  if (self->_name)
  {
    objc_msgSend(v7, "setName:");
    id v4 = v7;
  }
  if (self->_productType)
  {
    objc_msgSend(v7, "setProductType:");
    id v4 = v7;
  }
  if (self->_productName)
  {
    objc_msgSend(v7, "setProductName:");
    id v4 = v7;
  }
  if (self->_systemVersion)
  {
    objc_msgSend(v7, "setSystemVersion:");
    id v4 = v7;
  }
  if (self->_systemBuildVersion)
  {
    objc_msgSend(v7, "setSystemBuildVersion:");
    id v4 = v7;
  }
  if (self->_marketingVersion)
  {
    objc_msgSend(v7, "setMarketingVersion:");
    id v4 = v7;
  }
  if (self->_deviceColor)
  {
    objc_msgSend(v7, "setDeviceColor:");
    id v4 = v7;
  }
  if (self->_deviceEnclosureColor)
  {
    objc_msgSend(v7, "setDeviceEnclosureColor:");
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v4 + 11) = self->_bottomEnclosureMaterial;
    *((_WORD *)v4 + 90) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_21:
      if ((has & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_49;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_21;
  }
  *((_DWORD *)v4 + 34) = self->_topEnclosureMaterial;
  *((_WORD *)v4 + 90) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_22:
    if ((has & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  *((_DWORD *)v4 + 20) = self->_fcmMaterial;
  *((_WORD *)v4 + 90) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_23:
    if ((has & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  *((_DWORD *)v4 + 10) = self->_bcmWindowMaterial;
  *((_WORD *)v4 + 90) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_24:
    if ((has & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  *((_DWORD *)v4 + 12) = self->_coverGlassColor;
  *((_WORD *)v4 + 90) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_25:
    if ((has & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_52:
  *((_DWORD *)v4 + 21) = self->_housingColor;
  *((_WORD *)v4 + 90) |= 0x100u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_26:
    *((_DWORD *)v4 + 8) = self->_backingColor;
    *((_WORD *)v4 + 90) |= 4u;
  }
LABEL_27:
  if (self->_watchFace)
  {
    objc_msgSend(v7, "setWatchFace:");
    id v4 = v7;
  }
  if (self->_watchFaceColor)
  {
    objc_msgSend(v7, "setWatchFaceColor:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x800) != 0)
  {
    *((unsigned char *)v4 + 177) = self->_locationOptInEnabled;
    *((_WORD *)v4 + 90) |= 0x800u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x400) == 0)
    {
LABEL_33:
      if ((v6 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_56;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_33;
  }
  *((unsigned char *)v4 + 176) = self->_diagnosticsOptInEnabled;
  *((_WORD *)v4 + 90) |= 0x400u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 1) == 0)
  {
LABEL_34:
    if ((v6 & 2) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_56:
  *((void *)v4 + 1) = *(void *)&self->_lastModificationDate;
  *((_WORD *)v4 + 90) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_35:
    *((void *)v4 + 2) = self->_sizeInBytes;
    *((_WORD *)v4 + 90) |= 2u;
  }
LABEL_36:
  if (self->_activeWatchFaceFileContents)
  {
    objc_msgSend(v7, "setActiveWatchFaceFileContents:");
    id v4 = v7;
  }
  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v4 + 9) = self->_backupType;
    *((_WORD *)v4 + 90) |= 8u;
  }
  if (self->_deviceCSN)
  {
    objc_msgSend(v7, "setDeviceCSN:");
    id v4 = v7;
  }
  if (self->_watchFaceData)
  {
    objc_msgSend(v7, "setWatchFaceData:");
    id v4 = v7;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSData *)self->_uuid copyWithZone:a3];
  id v7 = (void *)v5[18];
  v5[18] = v6;

  id v8 = [(NSString *)self->_name copyWithZone:a3];
  v9 = (void *)v5[12];
  v5[12] = v8;

  id v10 = [(NSString *)self->_productType copyWithZone:a3];
  v11 = (void *)v5[14];
  v5[14] = v10;

  id v12 = [(NSString *)self->_productName copyWithZone:a3];
  v13 = (void *)v5[13];
  v5[13] = v12;

  id v14 = [(NSString *)self->_systemVersion copyWithZone:a3];
  v15 = (void *)v5[16];
  v5[16] = v14;

  id v16 = [(NSString *)self->_systemBuildVersion copyWithZone:a3];
  v17 = (void *)v5[15];
  v5[15] = v16;

  id v18 = [(NSString *)self->_marketingVersion copyWithZone:a3];
  v19 = (void *)v5[11];
  v5[11] = v18;

  id v20 = [(NSString *)self->_deviceColor copyWithZone:a3];
  v21 = (void *)v5[8];
  v5[8] = v20;

  id v22 = [(NSString *)self->_deviceEnclosureColor copyWithZone:a3];
  v23 = (void *)v5[9];
  v5[9] = v22;

  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    *((_DWORD *)v5 + 11) = self->_bottomEnclosureMaterial;
    *((_WORD *)v5 + 90) |= 0x20u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x80) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 34) = self->_topEnclosureMaterial;
  *((_WORD *)v5 + 90) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_4:
    if ((has & 0x10) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 20) = self->_fcmMaterial;
  *((_WORD *)v5 + 90) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_5:
    if ((has & 0x40) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  *((_DWORD *)v5 + 10) = self->_bcmWindowMaterial;
  *((_WORD *)v5 + 90) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_6:
    if ((has & 0x100) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 12) = self->_coverGlassColor;
  *((_WORD *)v5 + 90) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_7:
    if ((has & 4) == 0) {
      goto LABEL_9;
    }
    goto LABEL_8;
  }
LABEL_22:
  *((_DWORD *)v5 + 21) = self->_housingColor;
  *((_WORD *)v5 + 90) |= 0x100u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_8:
    *((_DWORD *)v5 + 8) = self->_backingColor;
    *((_WORD *)v5 + 90) |= 4u;
  }
LABEL_9:
  id v25 = [(NSString *)self->_watchFace copyWithZone:a3];
  v26 = (void *)v5[19];
  v5[19] = v25;

  id v27 = [(NSString *)self->_watchFaceColor copyWithZone:a3];
  v28 = (void *)v5[20];
  v5[20] = v27;

  __int16 v29 = (__int16)self->_has;
  if ((v29 & 0x800) != 0)
  {
    *((unsigned char *)v5 + 177) = self->_locationOptInEnabled;
    *((_WORD *)v5 + 90) |= 0x800u;
    __int16 v29 = (__int16)self->_has;
    if ((v29 & 0x400) == 0)
    {
LABEL_11:
      if ((v29 & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x400) == 0)
  {
    goto LABEL_11;
  }
  *((unsigned char *)v5 + 176) = self->_diagnosticsOptInEnabled;
  *((_WORD *)v5 + 90) |= 0x400u;
  __int16 v29 = (__int16)self->_has;
  if ((v29 & 1) == 0)
  {
LABEL_12:
    if ((v29 & 2) == 0) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
LABEL_26:
  v5[1] = *(void *)&self->_lastModificationDate;
  *((_WORD *)v5 + 90) |= 1u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_13:
    v5[2] = self->_sizeInBytes;
    *((_WORD *)v5 + 90) |= 2u;
  }
LABEL_14:
  id v30 = [(NSData *)self->_activeWatchFaceFileContents copyWithZone:a3];
  v31 = (void *)v5[3];
  v5[3] = v30;

  if ((*(_WORD *)&self->_has & 8) != 0)
  {
    *((_DWORD *)v5 + 9) = self->_backupType;
    *((_WORD *)v5 + 90) |= 8u;
  }
  id v32 = [(NSString *)self->_deviceCSN copyWithZone:a3];
  v33 = (void *)v5[7];
  v5[7] = v32;

  id v34 = [(NSData *)self->_watchFaceData copyWithZone:a3];
  v35 = (void *)v5[21];
  v5[21] = v34;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_97;
  }
  uuid = self->_uuid;
  if ((unint64_t)uuid | *((void *)v4 + 18))
  {
    if (!-[NSData isEqual:](uuid, "isEqual:")) {
      goto LABEL_97;
    }
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 12))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_97;
    }
  }
  productType = self->_productType;
  if ((unint64_t)productType | *((void *)v4 + 14))
  {
    if (!-[NSString isEqual:](productType, "isEqual:")) {
      goto LABEL_97;
    }
  }
  productName = self->_productName;
  if ((unint64_t)productName | *((void *)v4 + 13))
  {
    if (!-[NSString isEqual:](productName, "isEqual:")) {
      goto LABEL_97;
    }
  }
  systemVersion = self->_systemVersion;
  if ((unint64_t)systemVersion | *((void *)v4 + 16))
  {
    if (!-[NSString isEqual:](systemVersion, "isEqual:")) {
      goto LABEL_97;
    }
  }
  systemBuildVersion = self->_systemBuildVersion;
  if ((unint64_t)systemBuildVersion | *((void *)v4 + 15))
  {
    if (!-[NSString isEqual:](systemBuildVersion, "isEqual:")) {
      goto LABEL_97;
    }
  }
  marketingVersion = self->_marketingVersion;
  if ((unint64_t)marketingVersion | *((void *)v4 + 11))
  {
    if (!-[NSString isEqual:](marketingVersion, "isEqual:")) {
      goto LABEL_97;
    }
  }
  deviceColor = self->_deviceColor;
  if ((unint64_t)deviceColor | *((void *)v4 + 8))
  {
    if (!-[NSString isEqual:](deviceColor, "isEqual:")) {
      goto LABEL_97;
    }
  }
  deviceEnclosureColor = self->_deviceEnclosureColor;
  if ((unint64_t)deviceEnclosureColor | *((void *)v4 + 9))
  {
    if (!-[NSString isEqual:](deviceEnclosureColor, "isEqual:")) {
      goto LABEL_97;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v15 = *((_WORD *)v4 + 90);
  if ((has & 0x20) != 0)
  {
    if ((v15 & 0x20) == 0 || self->_bottomEnclosureMaterial != *((_DWORD *)v4 + 11)) {
      goto LABEL_97;
    }
  }
  else if ((v15 & 0x20) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x200) == 0 || self->_topEnclosureMaterial != *((_DWORD *)v4 + 34)) {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x200) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 0x80) != 0)
  {
    if ((v15 & 0x80) == 0 || self->_fcmMaterial != *((_DWORD *)v4 + 20)) {
      goto LABEL_97;
    }
  }
  else if ((v15 & 0x80) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 0x10) != 0)
  {
    if ((v15 & 0x10) == 0 || self->_bcmWindowMaterial != *((_DWORD *)v4 + 10)) {
      goto LABEL_97;
    }
  }
  else if ((v15 & 0x10) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 0x40) != 0)
  {
    if ((v15 & 0x40) == 0 || self->_coverGlassColor != *((_DWORD *)v4 + 12)) {
      goto LABEL_97;
    }
  }
  else if ((v15 & 0x40) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x100) == 0 || self->_housingColor != *((_DWORD *)v4 + 21)) {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x100) != 0)
  {
    goto LABEL_97;
  }
  if ((has & 4) != 0)
  {
    if ((v15 & 4) == 0 || self->_backingColor != *((_DWORD *)v4 + 8)) {
      goto LABEL_97;
    }
  }
  else if ((v15 & 4) != 0)
  {
    goto LABEL_97;
  }
  watchFace = self->_watchFace;
  if ((unint64_t)watchFace | *((void *)v4 + 19) && !-[NSString isEqual:](watchFace, "isEqual:")) {
    goto LABEL_97;
  }
  watchFaceColor = self->_watchFaceColor;
  if ((unint64_t)watchFaceColor | *((void *)v4 + 20))
  {
    if (!-[NSString isEqual:](watchFaceColor, "isEqual:")) {
      goto LABEL_97;
    }
  }
  __int16 v18 = (__int16)self->_has;
  __int16 v19 = *((_WORD *)v4 + 90);
  if ((v18 & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x800) == 0) {
      goto LABEL_97;
    }
    if (self->_locationOptInEnabled)
    {
      if (!*((unsigned char *)v4 + 177)) {
        goto LABEL_97;
      }
    }
    else if (*((unsigned char *)v4 + 177))
    {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x800) != 0)
  {
    goto LABEL_97;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 90) & 0x400) == 0) {
      goto LABEL_97;
    }
    if (self->_diagnosticsOptInEnabled)
    {
      if (!*((unsigned char *)v4 + 176)) {
        goto LABEL_97;
      }
    }
    else if (*((unsigned char *)v4 + 176))
    {
      goto LABEL_97;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x400) != 0)
  {
    goto LABEL_97;
  }
  if (v18)
  {
    if ((v19 & 1) == 0 || self->_lastModificationDate != *((double *)v4 + 1)) {
      goto LABEL_97;
    }
  }
  else if (v19)
  {
    goto LABEL_97;
  }
  if ((v18 & 2) != 0)
  {
    if ((v19 & 2) == 0 || self->_sizeInBytes != *((void *)v4 + 2)) {
      goto LABEL_97;
    }
  }
  else if ((v19 & 2) != 0)
  {
    goto LABEL_97;
  }
  activeWatchFaceFileContents = self->_activeWatchFaceFileContents;
  if ((unint64_t)activeWatchFaceFileContents | *((void *)v4 + 3))
  {
    if (-[NSData isEqual:](activeWatchFaceFileContents, "isEqual:"))
    {
      __int16 v18 = (__int16)self->_has;
      goto LABEL_88;
    }
LABEL_97:
    unsigned __int8 v24 = 0;
    goto LABEL_98;
  }
LABEL_88:
  __int16 v21 = *((_WORD *)v4 + 90);
  if ((v18 & 8) != 0)
  {
    if ((v21 & 8) == 0 || self->_backupType != *((_DWORD *)v4 + 9)) {
      goto LABEL_97;
    }
  }
  else if ((v21 & 8) != 0)
  {
    goto LABEL_97;
  }
  deviceCSN = self->_deviceCSN;
  if ((unint64_t)deviceCSN | *((void *)v4 + 7) && !-[NSString isEqual:](deviceCSN, "isEqual:")) {
    goto LABEL_97;
  }
  watchFaceData = self->_watchFaceData;
  if ((unint64_t)watchFaceData | *((void *)v4 + 21)) {
    unsigned __int8 v24 = -[NSData isEqual:](watchFaceData, "isEqual:");
  }
  else {
    unsigned __int8 v24 = 1;
  }
LABEL_98:

  return v24;
}

- (unint64_t)hash
{
  unint64_t v35 = (unint64_t)[(NSData *)self->_uuid hash];
  NSUInteger v34 = [(NSString *)self->_name hash];
  NSUInteger v33 = [(NSString *)self->_productType hash];
  NSUInteger v32 = [(NSString *)self->_productName hash];
  NSUInteger v31 = [(NSString *)self->_systemVersion hash];
  NSUInteger v30 = [(NSString *)self->_systemBuildVersion hash];
  NSUInteger v29 = [(NSString *)self->_marketingVersion hash];
  NSUInteger v28 = [(NSString *)self->_deviceColor hash];
  NSUInteger v27 = [(NSString *)self->_deviceEnclosureColor hash];
  __int16 has = (__int16)self->_has;
  if ((has & 0x20) != 0)
  {
    uint64_t v26 = 2654435761 * self->_bottomEnclosureMaterial;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v25 = 2654435761 * self->_topEnclosureMaterial;
      if ((has & 0x80) != 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else
  {
    uint64_t v26 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v25 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_4:
    uint64_t v24 = 2654435761 * self->_fcmMaterial;
    if ((has & 0x10) != 0) {
      goto LABEL_5;
    }
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v24 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_5:
    uint64_t v23 = 2654435761 * self->_bcmWindowMaterial;
    if ((has & 0x40) != 0) {
      goto LABEL_6;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v23 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_6:
    uint64_t v22 = 2654435761 * self->_coverGlassColor;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_7;
    }
LABEL_14:
    uint64_t v21 = 0;
    if ((has & 4) != 0) {
      goto LABEL_8;
    }
    goto LABEL_15;
  }
LABEL_13:
  uint64_t v22 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_14;
  }
LABEL_7:
  uint64_t v21 = 2654435761 * self->_housingColor;
  if ((has & 4) != 0)
  {
LABEL_8:
    uint64_t v4 = 2654435761 * self->_backingColor;
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v4 = 0;
LABEL_16:
  NSUInteger v5 = [(NSString *)self->_watchFace hash];
  NSUInteger v6 = [(NSString *)self->_watchFaceColor hash];
  __int16 v7 = (__int16)self->_has;
  if ((v7 & 0x800) == 0)
  {
    uint64_t v8 = 0;
    if ((*(_WORD *)&self->_has & 0x400) != 0) {
      goto LABEL_18;
    }
LABEL_24:
    uint64_t v9 = 0;
    if (v7) {
      goto LABEL_19;
    }
LABEL_25:
    unint64_t v14 = 0;
    goto LABEL_28;
  }
  uint64_t v8 = 2654435761 * self->_locationOptInEnabled;
  if ((*(_WORD *)&self->_has & 0x400) == 0) {
    goto LABEL_24;
  }
LABEL_18:
  uint64_t v9 = 2654435761 * self->_diagnosticsOptInEnabled;
  if ((v7 & 1) == 0) {
    goto LABEL_25;
  }
LABEL_19:
  double lastModificationDate = self->_lastModificationDate;
  double v11 = -lastModificationDate;
  if (lastModificationDate >= 0.0) {
    double v11 = self->_lastModificationDate;
  }
  long double v12 = floor(v11 + 0.5);
  double v13 = (v11 - v12) * 1.84467441e19;
  unint64_t v14 = 2654435761u * (unint64_t)fmod(v12, 1.84467441e19);
  if (v13 >= 0.0)
  {
    if (v13 > 0.0) {
      v14 += (unint64_t)v13;
    }
  }
  else
  {
    v14 -= (unint64_t)fabs(v13);
  }
LABEL_28:
  if ((v7 & 2) != 0) {
    uint64_t v15 = 2654435761 * self->_sizeInBytes;
  }
  else {
    uint64_t v15 = 0;
  }
  unint64_t v16 = (unint64_t)[(NSData *)self->_activeWatchFaceFileContents hash];
  if ((*(_WORD *)&self->_has & 8) != 0) {
    uint64_t v17 = 2654435761 * self->_backupType;
  }
  else {
    uint64_t v17 = 0;
  }
  NSUInteger v18 = v34 ^ v35 ^ v33 ^ v32 ^ v31 ^ v30 ^ v29 ^ v28 ^ v27 ^ v26 ^ v25 ^ v24 ^ v23 ^ v22 ^ v21 ^ v4 ^ v5 ^ v6 ^ v8 ^ v9;
  unint64_t v19 = v14 ^ v15 ^ v16 ^ v17 ^ [(NSString *)self->_deviceCSN hash];
  return v18 ^ v19 ^ (unint64_t)[(NSData *)self->_watchFaceData hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 18))
  {
    -[NBPBBackupMetadata setUuid:](self, "setUuid:");
    id v4 = v7;
  }
  if (*((void *)v4 + 12))
  {
    -[NBPBBackupMetadata setName:](self, "setName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 14))
  {
    -[NBPBBackupMetadata setProductType:](self, "setProductType:");
    id v4 = v7;
  }
  if (*((void *)v4 + 13))
  {
    -[NBPBBackupMetadata setProductName:](self, "setProductName:");
    id v4 = v7;
  }
  if (*((void *)v4 + 16))
  {
    -[NBPBBackupMetadata setSystemVersion:](self, "setSystemVersion:");
    id v4 = v7;
  }
  if (*((void *)v4 + 15))
  {
    -[NBPBBackupMetadata setSystemBuildVersion:](self, "setSystemBuildVersion:");
    id v4 = v7;
  }
  if (*((void *)v4 + 11))
  {
    -[NBPBBackupMetadata setMarketingVersion:](self, "setMarketingVersion:");
    id v4 = v7;
  }
  if (*((void *)v4 + 8))
  {
    -[NBPBBackupMetadata setDeviceColor:](self, "setDeviceColor:");
    id v4 = v7;
  }
  if (*((void *)v4 + 9))
  {
    -[NBPBBackupMetadata setDeviceEnclosureColor:](self, "setDeviceEnclosureColor:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 90);
  if ((v5 & 0x20) != 0)
  {
    self->_bottomEnclosureMaterial = *((_DWORD *)v4 + 11);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v5 = *((_WORD *)v4 + 90);
    if ((v5 & 0x200) == 0)
    {
LABEL_21:
      if ((v5 & 0x80) == 0) {
        goto LABEL_22;
      }
      goto LABEL_49;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x200) == 0)
  {
    goto LABEL_21;
  }
  self->_topEnclosureMaterial = *((_DWORD *)v4 + 34);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 90);
  if ((v5 & 0x80) == 0)
  {
LABEL_22:
    if ((v5 & 0x10) == 0) {
      goto LABEL_23;
    }
    goto LABEL_50;
  }
LABEL_49:
  self->_fcmMaterial = *((_DWORD *)v4 + 20);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 90);
  if ((v5 & 0x10) == 0)
  {
LABEL_23:
    if ((v5 & 0x40) == 0) {
      goto LABEL_24;
    }
    goto LABEL_51;
  }
LABEL_50:
  self->_bcmWindowMaterial = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)v4 + 90);
  if ((v5 & 0x40) == 0)
  {
LABEL_24:
    if ((v5 & 0x100) == 0) {
      goto LABEL_25;
    }
    goto LABEL_52;
  }
LABEL_51:
  self->_coverGlassColor = *((_DWORD *)v4 + 12);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)v4 + 90);
  if ((v5 & 0x100) == 0)
  {
LABEL_25:
    if ((v5 & 4) == 0) {
      goto LABEL_27;
    }
    goto LABEL_26;
  }
LABEL_52:
  self->_housingColor = *((_DWORD *)v4 + 21);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 90) & 4) != 0)
  {
LABEL_26:
    self->_backingColor = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_27:
  if (*((void *)v4 + 19))
  {
    -[NBPBBackupMetadata setWatchFace:](self, "setWatchFace:");
    id v4 = v7;
  }
  if (*((void *)v4 + 20))
  {
    -[NBPBBackupMetadata setWatchFaceColor:](self, "setWatchFaceColor:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 90);
  if ((v6 & 0x800) != 0)
  {
    self->_locationOptInEnabled = *((unsigned char *)v4 + 177);
    *(_WORD *)&self->_has |= 0x800u;
    __int16 v6 = *((_WORD *)v4 + 90);
    if ((v6 & 0x400) == 0)
    {
LABEL_33:
      if ((v6 & 1) == 0) {
        goto LABEL_34;
      }
      goto LABEL_56;
    }
  }
  else if ((*((_WORD *)v4 + 90) & 0x400) == 0)
  {
    goto LABEL_33;
  }
  self->_diagnosticsOptInEnabled = *((unsigned char *)v4 + 176);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v6 = *((_WORD *)v4 + 90);
  if ((v6 & 1) == 0)
  {
LABEL_34:
    if ((v6 & 2) == 0) {
      goto LABEL_36;
    }
    goto LABEL_35;
  }
LABEL_56:
  self->_double lastModificationDate = *((double *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)v4 + 90) & 2) != 0)
  {
LABEL_35:
    self->_sizeInBytes = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_36:
  if (*((void *)v4 + 3))
  {
    -[NBPBBackupMetadata setActiveWatchFaceFileContents:](self, "setActiveWatchFaceFileContents:");
    id v4 = v7;
  }
  if ((*((_WORD *)v4 + 90) & 8) != 0)
  {
    self->_backupType = *((_DWORD *)v4 + 9);
    *(_WORD *)&self->_has |= 8u;
  }
  if (*((void *)v4 + 7))
  {
    -[NBPBBackupMetadata setDeviceCSN:](self, "setDeviceCSN:");
    id v4 = v7;
  }
  if (*((void *)v4 + 21))
  {
    -[NBPBBackupMetadata setWatchFaceData:](self, "setWatchFaceData:");
    id v4 = v7;
  }
}

- (NSData)uuid
{
  return self->_uuid;
}

- (void)setUuid:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (NSString)productType
{
  return self->_productType;
}

- (void)setProductType:(id)a3
{
}

- (NSString)productName
{
  return self->_productName;
}

- (void)setProductName:(id)a3
{
}

- (NSString)systemVersion
{
  return self->_systemVersion;
}

- (void)setSystemVersion:(id)a3
{
}

- (NSString)systemBuildVersion
{
  return self->_systemBuildVersion;
}

- (void)setSystemBuildVersion:(id)a3
{
}

- (NSString)marketingVersion
{
  return self->_marketingVersion;
}

- (void)setMarketingVersion:(id)a3
{
}

- (NSString)deviceColor
{
  return self->_deviceColor;
}

- (void)setDeviceColor:(id)a3
{
}

- (NSString)deviceEnclosureColor
{
  return self->_deviceEnclosureColor;
}

- (void)setDeviceEnclosureColor:(id)a3
{
}

- (int)bottomEnclosureMaterial
{
  return self->_bottomEnclosureMaterial;
}

- (int)topEnclosureMaterial
{
  return self->_topEnclosureMaterial;
}

- (int)fcmMaterial
{
  return self->_fcmMaterial;
}

- (int)bcmWindowMaterial
{
  return self->_bcmWindowMaterial;
}

- (int)coverGlassColor
{
  return self->_coverGlassColor;
}

- (int)housingColor
{
  return self->_housingColor;
}

- (int)backingColor
{
  return self->_backingColor;
}

- (NSString)watchFace
{
  return self->_watchFace;
}

- (void)setWatchFace:(id)a3
{
}

- (NSString)watchFaceColor
{
  return self->_watchFaceColor;
}

- (void)setWatchFaceColor:(id)a3
{
}

- (BOOL)locationOptInEnabled
{
  return self->_locationOptInEnabled;
}

- (BOOL)diagnosticsOptInEnabled
{
  return self->_diagnosticsOptInEnabled;
}

- (double)lastModificationDate
{
  return self->_lastModificationDate;
}

- (int64_t)sizeInBytes
{
  return self->_sizeInBytes;
}

- (NSData)activeWatchFaceFileContents
{
  return self->_activeWatchFaceFileContents;
}

- (void)setActiveWatchFaceFileContents:(id)a3
{
}

- (int)backupType
{
  return self->_backupType;
}

- (NSString)deviceCSN
{
  return self->_deviceCSN;
}

- (void)setDeviceCSN:(id)a3
{
}

- (NSData)watchFaceData
{
  return self->_watchFaceData;
}

- (void)setWatchFaceData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_watchFaceData, 0);
  objc_storeStrong((id *)&self->_watchFaceColor, 0);
  objc_storeStrong((id *)&self->_watchFace, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
  objc_storeStrong((id *)&self->_systemVersion, 0);
  objc_storeStrong((id *)&self->_systemBuildVersion, 0);
  objc_storeStrong((id *)&self->_productType, 0);
  objc_storeStrong((id *)&self->_productName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_marketingVersion, 0);
  objc_storeStrong((id *)&self->_deviceEnclosureColor, 0);
  objc_storeStrong((id *)&self->_deviceColor, 0);
  objc_storeStrong((id *)&self->_deviceCSN, 0);

  objc_storeStrong((id *)&self->_activeWatchFaceFileContents, 0);
}

@end
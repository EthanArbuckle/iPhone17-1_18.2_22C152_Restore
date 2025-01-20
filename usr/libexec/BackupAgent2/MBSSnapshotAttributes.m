@interface MBSSnapshotAttributes
- (BOOL)hasBackupReason;
- (BOOL)hasBackupType;
- (BOOL)hasBuildVersion;
- (BOOL)hasDeviceName;
- (BOOL)hasKeybagID;
- (BOOL)hasKeybagUUID;
- (BOOL)hasProductVersion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)keybagUUID;
- (NSString)buildVersion;
- (NSString)deviceName;
- (NSString)productVersion;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)backupReason;
- (int)backupType;
- (unint64_t)hash;
- (unsigned)keybagID;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setBackupReason:(int)a3;
- (void)setBackupType:(int)a3;
- (void)setBuildVersion:(id)a3;
- (void)setDeviceName:(id)a3;
- (void)setHasBackupReason:(BOOL)a3;
- (void)setHasBackupType:(BOOL)a3;
- (void)setHasKeybagID:(BOOL)a3;
- (void)setKeybagID:(unsigned int)a3;
- (void)setKeybagUUID:(id)a3;
- (void)setProductVersion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSSnapshotAttributes

- (void)dealloc
{
  [(MBSSnapshotAttributes *)self setDeviceName:0];
  [(MBSSnapshotAttributes *)self setProductVersion:0];
  [(MBSSnapshotAttributes *)self setBuildVersion:0];
  [(MBSSnapshotAttributes *)self setKeybagUUID:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSSnapshotAttributes;
  [(MBSSnapshotAttributes *)&v3 dealloc];
}

- (BOOL)hasDeviceName
{
  return self->_deviceName != 0;
}

- (BOOL)hasProductVersion
{
  return self->_productVersion != 0;
}

- (BOOL)hasBuildVersion
{
  return self->_buildVersion != 0;
}

- (void)setKeybagID:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_keybagID = a3;
}

- (void)setHasKeybagID:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasKeybagID
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasKeybagUUID
{
  return self->_keybagUUID != 0;
}

- (int)backupReason
{
  if (*(unsigned char *)&self->_has) {
    return self->_backupReason;
  }
  else {
    return 0;
  }
}

- (void)setBackupReason:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_backupReason = a3;
}

- (void)setHasBackupReason:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasBackupReason
{
  return *(unsigned char *)&self->_has & 1;
}

- (int)backupType
{
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    return self->_backupType;
  }
  else {
    return 0;
  }
}

- (void)setBackupType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_backupType = a3;
}

- (void)setHasBackupType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasBackupType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSSnapshotAttributes;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSSnapshotAttributes *)&v3 description], [(MBSSnapshotAttributes *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  deviceName = self->_deviceName;
  if (deviceName) {
    [v3 setObject:deviceName forKey:@"deviceName"];
  }
  productVersion = self->_productVersion;
  if (productVersion) {
    [v4 setObject:productVersion forKey:@"productVersion"];
  }
  buildVersion = self->_buildVersion;
  if (buildVersion) {
    [v4 setObject:buildVersion forKey:@"buildVersion"];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    [v4 setObject:[+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_keybagID)] forKey:@"keybagID"];
  }
  keybagUUID = self->_keybagUUID;
  if (keybagUUID) {
    [v4 setObject:keybagUUID forKey:@"keybagUUID"];
  }
  char has = (char)self->_has;
  if (has)
  {
    uint64_t backupReason = self->_backupReason;
    if (backupReason >= 3) {
      v11 = +[NSString stringWithFormat:@"(unknown: %i)", self->_backupReason];
    }
    else {
      v11 = off_1000F1400[backupReason];
    }
    [v4 setObject:v11 forKey:@"backupReason"];
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    uint64_t backupType = self->_backupType;
    if (backupType >= 3) {
      v13 = +[NSString stringWithFormat:@"(unknown: %i)", self->_backupType];
    }
    else {
      v13 = off_1000F1418[backupType];
    }
    [v4 setObject:v13 forKey:@"backupType"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return sub_10000F690((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if (self->_deviceName) {
    PBDataWriterWriteStringField();
  }
  if (self->_productVersion) {
    PBDataWriterWriteStringField();
  }
  if (self->_buildVersion) {
    PBDataWriterWriteStringField();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_keybagUUID) {
    PBDataWriterWriteDataField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt32Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_deviceName) {
    [a3 setDeviceName:];
  }
  if (self->_productVersion) {
    [a3 setProductVersion:];
  }
  if (self->_buildVersion) {
    [a3 setBuildVersion:];
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)a3 + 8) = self->_keybagID;
    *((unsigned char *)a3 + 56) |= 4u;
  }
  if (self->_keybagUUID) {
    [a3 setKeybagUUID:];
  }
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)a3 + 2) = self->_backupReason;
    *((unsigned char *)a3 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)a3 + 3) = self->_backupType;
    *((unsigned char *)a3 + 56) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];

  v5[3] = [(NSString *)self->_deviceName copyWithZone:a3];
  v5[6] = [(NSString *)self->_productVersion copyWithZone:a3];

  v5[2] = [(NSString *)self->_buildVersion copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_keybagID;
    *((unsigned char *)v5 + 56) |= 4u;
  }

  v5[5] = [(NSData *)self->_keybagUUID copyWithZone:a3];
  char has = (char)self->_has;
  if (has)
  {
    *((_DWORD *)v5 + 2) = self->_backupReason;
    *((unsigned char *)v5 + 56) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((_DWORD *)v5 + 3) = self->_backupType;
    *((unsigned char *)v5 + 56) |= 2u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    deviceName = self->_deviceName;
    if (!((unint64_t)deviceName | *((void *)a3 + 3))
      || (unsigned int v5 = -[NSString isEqual:](deviceName, "isEqual:")) != 0)
    {
      productVersion = self->_productVersion;
      if (!((unint64_t)productVersion | *((void *)a3 + 6))
        || (unsigned int v5 = -[NSString isEqual:](productVersion, "isEqual:")) != 0)
      {
        buildVersion = self->_buildVersion;
        if (!((unint64_t)buildVersion | *((void *)a3 + 2))
          || (unsigned int v5 = -[NSString isEqual:](buildVersion, "isEqual:")) != 0)
        {
          char has = (char)self->_has;
          if ((has & 4) != 0)
          {
            if ((*((unsigned char *)a3 + 56) & 4) == 0 || self->_keybagID != *((_DWORD *)a3 + 8)) {
              goto LABEL_25;
            }
          }
          else if ((*((unsigned char *)a3 + 56) & 4) != 0)
          {
LABEL_25:
            LOBYTE(v5) = 0;
            return v5;
          }
          keybagUUID = self->_keybagUUID;
          if ((unint64_t)keybagUUID | *((void *)a3 + 5))
          {
            unsigned int v5 = -[NSData isEqual:](keybagUUID, "isEqual:");
            if (!v5) {
              return v5;
            }
            char has = (char)self->_has;
          }
          if (has)
          {
            if ((*((unsigned char *)a3 + 56) & 1) == 0 || self->_backupReason != *((_DWORD *)a3 + 2)) {
              goto LABEL_25;
            }
          }
          else if (*((unsigned char *)a3 + 56))
          {
            goto LABEL_25;
          }
          LOBYTE(v5) = (*((unsigned char *)a3 + 56) & 2) == 0;
          if ((has & 2) != 0)
          {
            if ((*((unsigned char *)a3 + 56) & 2) == 0 || self->_backupType != *((_DWORD *)a3 + 3)) {
              goto LABEL_25;
            }
            LOBYTE(v5) = 1;
          }
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceName hash];
  NSUInteger v4 = [(NSString *)self->_productVersion hash];
  NSUInteger v5 = [(NSString *)self->_buildVersion hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_keybagID;
  }
  else {
    uint64_t v6 = 0;
  }
  unint64_t v7 = (unint64_t)[(NSData *)self->_keybagUUID hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v8 = 2654435761 * self->_backupReason;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_6;
    }
LABEL_8:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v8 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  uint64_t v9 = 2654435761 * self->_backupType;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 3)) {
    -[MBSSnapshotAttributes setDeviceName:](self, "setDeviceName:");
  }
  if (*((void *)a3 + 6)) {
    -[MBSSnapshotAttributes setProductVersion:](self, "setProductVersion:");
  }
  if (*((void *)a3 + 2)) {
    -[MBSSnapshotAttributes setBuildVersion:](self, "setBuildVersion:");
  }
  if ((*((unsigned char *)a3 + 56) & 4) != 0)
  {
    self->_keybagID = *((_DWORD *)a3 + 8);
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)a3 + 5)) {
    -[MBSSnapshotAttributes setKeybagUUID:](self, "setKeybagUUID:");
  }
  char v5 = *((unsigned char *)a3 + 56);
  if (v5)
  {
    self->_uint64_t backupReason = *((_DWORD *)a3 + 2);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)a3 + 56);
  }
  if ((v5 & 2) != 0)
  {
    self->_uint64_t backupType = *((_DWORD *)a3 + 3);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (void)setDeviceName:(id)a3
{
}

- (NSString)productVersion
{
  return self->_productVersion;
}

- (void)setProductVersion:(id)a3
{
}

- (NSString)buildVersion
{
  return self->_buildVersion;
}

- (void)setBuildVersion:(id)a3
{
}

- (unsigned)keybagID
{
  return self->_keybagID;
}

- (NSData)keybagUUID
{
  return self->_keybagUUID;
}

- (void)setKeybagUUID:(id)a3
{
}

@end
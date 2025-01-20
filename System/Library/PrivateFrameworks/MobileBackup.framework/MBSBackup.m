@interface MBSBackup
+ (id)backup;
- (BOOL)canRestoreSystemFiles;
- (BOOL)hasAttributes;
- (BOOL)hasBackupUDID;
- (BOOL)hasKeysLastModified;
- (BOOL)hasQuotaUsed;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MBSBackupAttributes)attributes;
- (NSData)backupUDID;
- (NSMutableArray)snapshots;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)snapshotAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)keysLastModified;
- (unint64_t)quotaUsed;
- (unint64_t)snapshotsCount;
- (void)addSnapshot:(id)a3;
- (void)clearSnapshots;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)mergeFrom:(id)a3;
- (void)setAttributes:(id)a3;
- (void)setBackupUDID:(id)a3;
- (void)setHasKeysLastModified:(BOOL)a3;
- (void)setHasQuotaUsed:(BOOL)a3;
- (void)setKeysLastModified:(unint64_t)a3;
- (void)setQuotaUsed:(unint64_t)a3;
- (void)setSnapshots:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSBackup

- (void)dealloc
{
  [(MBSBackup *)self setBackupUDID:0];
  [(MBSBackup *)self setSnapshots:0];
  [(MBSBackup *)self setAttributes:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSBackup;
  [(MBSBackup *)&v3 dealloc];
}

- (BOOL)hasBackupUDID
{
  return self->_backupUDID != 0;
}

- (void)setQuotaUsed:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_quotaUsed = a3;
}

- (void)setHasQuotaUsed:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasQuotaUsed
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)clearSnapshots
{
}

- (void)addSnapshot:(id)a3
{
  snapshots = self->_snapshots;
  if (!snapshots)
  {
    snapshots = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_snapshots = snapshots;
  }
  [(NSMutableArray *)snapshots addObject:a3];
}

- (unint64_t)snapshotsCount
{
  return (unint64_t)[(NSMutableArray *)self->_snapshots count];
}

- (id)snapshotAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_snapshots objectAtIndex:a3];
}

- (BOOL)hasAttributes
{
  return self->_attributes != 0;
}

- (void)setKeysLastModified:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_keysLastModified = a3;
}

- (void)setHasKeysLastModified:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKeysLastModified
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSBackup;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSBackup *)&v3 description], [(MBSBackup *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  backupUDID = self->_backupUDID;
  if (backupUDID) {
    [v3 setObject:backupUDID forKey:@"backupUDID"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_quotaUsed), @"quotaUsed");
  }
  if ([(NSMutableArray *)self->_snapshots count])
  {
    id v6 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_snapshots, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    snapshots = self->_snapshots;
    id v8 = [(NSMutableArray *)snapshots countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v15;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(snapshots);
          }
          objc_msgSend(v6, "addObject:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        id v9 = [(NSMutableArray *)snapshots countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v9);
    }
    [v4 setObject:v6 forKey:@"snapshot"];
  }
  attributes = self->_attributes;
  if (attributes) {
    objc_msgSend(v4, "setObject:forKey:", -[MBSBackupAttributes dictionaryRepresentation](attributes, "dictionaryRepresentation"), @"attributes");
  }
  if (*(unsigned char *)&self->_has) {
    objc_msgSend(v4, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_keysLastModified), @"keysLastModified");
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                           + OBJC_IVAR___PBDataReader__length))
  {
    while (!*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error))
    {
      char v5 = 0;
      unsigned int v6 = 0;
      uint64_t v7 = 0;
      while (1)
      {
        unint64_t v8 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
        if (v8 == -1 || v8 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
          break;
        }
        char v9 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v8);
        *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v8 + 1;
        v7 |= (unint64_t)(v9 & 0x7F) << v5;
        if ((v9 & 0x80) == 0) {
          goto LABEL_11;
        }
        v5 += 7;
        BOOL v10 = v6++ >= 9;
        if (v10)
        {
          LODWORD(v7) = 0;
          int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
          goto LABEL_13;
        }
      }
      *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
      int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
      if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
        LODWORD(v7) = 0;
      }
LABEL_13:
      if (v11 || (v7 & 7) == 4) {
        break;
      }
      switch((unsigned __int16)(v7 >> 3))
      {
        case 1u:
          Data = (void *)PBReaderReadData();

          self->_backupUDID = (NSData *)Data;
          goto LABEL_50;
        case 2u:
          char v15 = 0;
          unsigned int v16 = 0;
          uint64_t v17 = 0;
          *(unsigned char *)&self->_has |= 2u;
          while (2)
          {
            unint64_t v18 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v18 == -1 || v18 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v19 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v18);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v18 + 1;
              v17 |= (unint64_t)(v19 & 0x7F) << v15;
              if (v19 < 0)
              {
                v15 += 7;
                BOOL v10 = v16++ >= 9;
                if (v10)
                {
                  uint64_t v17 = 0;
                  goto LABEL_44;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v17 = 0;
          }
LABEL_44:
          uint64_t v26 = 16;
          goto LABEL_49;
        case 3u:
          v20 = objc_alloc_init(MBSSnapshot);
          [(MBSBackup *)self addSnapshot:v20];

          if (!PBReaderPlaceMark() || (MBSSnapshotReadFrom((uint64_t)v20, (uint64_t)a3) & 1) == 0) {
            goto LABEL_52;
          }
          goto LABEL_33;
        case 4u:
          v21 = objc_alloc_init(MBSBackupAttributes);

          self->_attributes = v21;
          if (!PBReaderPlaceMark() || !MBSBackupAttributesReadFrom((uint64_t)v21, (uint64_t)a3))
          {
LABEL_52:
            LOBYTE(v14) = 0;
            return v14;
          }
LABEL_33:
          PBReaderRecallMark();
LABEL_50:
          if (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) >= *(void *)((char *)a3
                                                                                    + OBJC_IVAR___PBDataReader__length))
            goto LABEL_51;
          break;
        case 5u:
          char v22 = 0;
          unsigned int v23 = 0;
          uint64_t v17 = 0;
          *(unsigned char *)&self->_has |= 1u;
          while (2)
          {
            unint64_t v24 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
            if (v24 == -1 || v24 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
            {
              *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
            }
            else
            {
              char v25 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v24);
              *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v24 + 1;
              v17 |= (unint64_t)(v25 & 0x7F) << v22;
              if (v25 < 0)
              {
                v22 += 7;
                BOOL v10 = v23++ >= 9;
                if (v10)
                {
                  uint64_t v17 = 0;
                  goto LABEL_48;
                }
                continue;
              }
            }
            break;
          }
          if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
            uint64_t v17 = 0;
          }
LABEL_48:
          uint64_t v26 = 8;
LABEL_49:
          *(void *)&self->PBCodable_opaque[v26] = v17;
          goto LABEL_50;
        default:
          int v14 = PBReaderSkipValueWithTag();
          if (!v14) {
            return v14;
          }
          goto LABEL_50;
      }
    }
  }
LABEL_51:
  LOBYTE(v14) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v14;
}

- (void)writeTo:(id)a3
{
  if (self->_backupUDID) {
    PBDataWriterWriteDataField();
  }
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
  long long v11 = 0u;
  long long v12 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  snapshots = self->_snapshots;
  char v5 = (char *)[(NSMutableArray *)snapshots countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v5)
  {
    unsigned int v6 = v5;
    uint64_t v7 = *(void *)v10;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(void *)v10 != v7) {
          objc_enumerationMutation(snapshots);
        }
        PBDataWriterWriteSubmessage();
      }
      unsigned int v6 = (char *)[(NSMutableArray *)snapshots countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v6);
  }
  if (self->_attributes) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if (self->_backupUDID) {
    objc_msgSend(a3, "setBackupUDID:");
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)a3 + 2) = self->_quotaUsed;
    *((unsigned char *)a3 + 48) |= 2u;
  }
  if ([(MBSBackup *)self snapshotsCount])
  {
    [a3 clearSnapshots];
    unint64_t v5 = [(MBSBackup *)self snapshotsCount];
    if (v5)
    {
      unint64_t v6 = v5;
      for (uint64_t i = 0; i != v6; ++i)
        objc_msgSend(a3, "addSnapshot:", -[MBSBackup snapshotAtIndex:](self, "snapshotAtIndex:", i));
    }
  }
  if (self->_attributes) {
    objc_msgSend(a3, "setAttributes:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)a3 + 1) = self->_keysLastModified;
    *((unsigned char *)a3 + 48) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");

  v5[4] = [(NSData *)self->_backupUDID copyWithZone:a3];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v5[2] = self->_quotaUsed;
    *((unsigned char *)v5 + 48) |= 2u;
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  snapshots = self->_snapshots;
  id v7 = [(NSMutableArray *)snapshots countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(snapshots);
        }
        id v11 = [*(id *)(*((void *)&v13 + 1) + 8 * i) copyWithZone:a3];
        [v5 addSnapshot:v11];
      }
      id v8 = [(NSMutableArray *)snapshots countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v5[3] = [(MBSBackupAttributes *)self->_attributes copyWithZone:a3];
  if (*(unsigned char *)&self->_has)
  {
    v5[1] = self->_keysLastModified;
    *((unsigned char *)v5 + 48) |= 1u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    backupUDID = self->_backupUDID;
    if (!((unint64_t)backupUDID | *((void *)a3 + 4))
      || (unsigned int v5 = -[NSData isEqual:](backupUDID, "isEqual:")) != 0)
    {
      if ((*(unsigned char *)&self->_has & 2) != 0)
      {
        if ((*((unsigned char *)a3 + 48) & 2) == 0 || self->_quotaUsed != *((void *)a3 + 2)) {
          goto LABEL_17;
        }
      }
      else if ((*((unsigned char *)a3 + 48) & 2) != 0)
      {
LABEL_17:
        LOBYTE(v5) = 0;
        return v5;
      }
      snapshots = self->_snapshots;
      if (!((unint64_t)snapshots | *((void *)a3 + 5))
        || (unsigned int v5 = -[NSMutableArray isEqual:](snapshots, "isEqual:")) != 0)
      {
        attributes = self->_attributes;
        if (!((unint64_t)attributes | *((void *)a3 + 3))
          || (unsigned int v5 = -[MBSBackupAttributes isEqual:](attributes, "isEqual:")) != 0)
        {
          LOBYTE(v5) = (*((unsigned char *)a3 + 48) & 1) == 0;
          if (*(unsigned char *)&self->_has)
          {
            if ((*((unsigned char *)a3 + 48) & 1) == 0 || self->_keysLastModified != *((void *)a3 + 1)) {
              goto LABEL_17;
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
  unint64_t v3 = (unint64_t)[(NSData *)self->_backupUDID hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    unint64_t v4 = 2654435761u * self->_quotaUsed;
  }
  else {
    unint64_t v4 = 0;
  }
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_snapshots hash];
  unint64_t v6 = [(MBSBackupAttributes *)self->_attributes hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v7 = 2654435761u * self->_keysLastModified;
  }
  else {
    unint64_t v7 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v7;
}

- (void)mergeFrom:(id)a3
{
  if (*((void *)a3 + 4)) {
    -[MBSBackup setBackupUDID:](self, "setBackupUDID:");
  }
  if ((*((unsigned char *)a3 + 48) & 2) != 0)
  {
    self->_quotaUsed = *((void *)a3 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  unint64_t v5 = (void *)*((void *)a3 + 5);
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        [(MBSBackup *)self addSnapshot:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
  attributes = self->_attributes;
  uint64_t v11 = *((void *)a3 + 3);
  if (attributes)
  {
    if (v11) {
      -[MBSBackupAttributes mergeFrom:](attributes, "mergeFrom:");
    }
  }
  else if (v11)
  {
    -[MBSBackup setAttributes:](self, "setAttributes:");
  }
  if (*((unsigned char *)a3 + 48))
  {
    self->_keysLastModified = *((void *)a3 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSData)backupUDID
{
  return self->_backupUDID;
}

- (void)setBackupUDID:(id)a3
{
}

- (unint64_t)quotaUsed
{
  return self->_quotaUsed;
}

- (NSMutableArray)snapshots
{
  return self->_snapshots;
}

- (void)setSnapshots:(id)a3
{
}

- (MBSBackupAttributes)attributes
{
  return self->_attributes;
}

- (void)setAttributes:(id)a3
{
}

- (unint64_t)keysLastModified
{
  return self->_keysLastModified;
}

+ (id)backup
{
  v2 = objc_alloc_init(MBSBackup);
  return v2;
}

- (BOOL)canRestoreSystemFiles
{
  unint64_t v3 = MBDeviceClass();
  unint64_t v4 = [(MBSBackup *)self attributes];
  unint64_t v5 = [v4 deviceClass];
  char v6 = MBSCanRestoreSystemFilesBetweenProductClasses(v3, v5);

  return v6;
}

@end
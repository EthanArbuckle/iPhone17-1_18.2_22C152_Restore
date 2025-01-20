@interface MBSFileAttributes
- (BOOL)hasBirth;
- (BOOL)hasDecryptedSize;
- (BOOL)hasEncryptionKey;
- (BOOL)hasEncryptionKeyVersion;
- (BOOL)hasGroupID;
- (BOOL)hasInodeNumber;
- (BOOL)hasKeybagID;
- (BOOL)hasLastModified;
- (BOOL)hasLastStatusChange;
- (BOOL)hasMode;
- (BOOL)hasProtectionClass;
- (BOOL)hasTarget;
- (BOOL)hasUserID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (BOOL)verifyWithFile:(id)a3 error:(id *)a4;
- (NSData)encryptionKey;
- (NSMutableArray)extendedAttributes;
- (NSString)target;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)extendedAttributeAtIndex:(unint64_t)a3;
- (unint64_t)birth;
- (unint64_t)decryptedSize;
- (unint64_t)extendedAttributesCount;
- (unint64_t)hash;
- (unint64_t)inodeNumber;
- (unint64_t)lastModified;
- (unint64_t)lastStatusChange;
- (unsigned)encryptionKeyVersion;
- (unsigned)groupID;
- (unsigned)keybagID;
- (unsigned)mode;
- (unsigned)protectionClass;
- (unsigned)userID;
- (void)addExtendedAttribute:(id)a3;
- (void)addExtendedAttributesDictionary:(id)a3;
- (void)clearExtendedAttributes;
- (void)copyTo:(id)a3;
- (void)dealloc;
- (void)getNode:(id *)a3;
- (void)mergeFrom:(id)a3;
- (void)setBirth:(unint64_t)a3;
- (void)setDecryptedSize:(unint64_t)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setEncryptionKeyVersion:(unsigned int)a3;
- (void)setExtendedAttributes:(id)a3;
- (void)setGroupID:(unsigned int)a3;
- (void)setHasBirth:(BOOL)a3;
- (void)setHasDecryptedSize:(BOOL)a3;
- (void)setHasEncryptionKeyVersion:(BOOL)a3;
- (void)setHasGroupID:(BOOL)a3;
- (void)setHasInodeNumber:(BOOL)a3;
- (void)setHasKeybagID:(BOOL)a3;
- (void)setHasLastModified:(BOOL)a3;
- (void)setHasLastStatusChange:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasProtectionClass:(BOOL)a3;
- (void)setHasUserID:(BOOL)a3;
- (void)setInodeNumber:(unint64_t)a3;
- (void)setKeybagID:(unsigned int)a3;
- (void)setLastModified:(unint64_t)a3;
- (void)setLastStatusChange:(unint64_t)a3;
- (void)setMode:(unsigned int)a3;
- (void)setProtectionClass:(unsigned int)a3;
- (void)setStat:(stat *)a3;
- (void)setTarget:(id)a3;
- (void)setUserID:(unsigned int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBSFileAttributes

- (void)dealloc
{
  [(MBSFileAttributes *)self setTarget:0];
  [(MBSFileAttributes *)self setEncryptionKey:0];
  [(MBSFileAttributes *)self setExtendedAttributes:0];
  v3.receiver = self;
  v3.super_class = (Class)MBSFileAttributes;
  [(MBSFileAttributes *)&v3 dealloc];
}

- (void)setKeybagID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_keybagID = a3;
}

- (void)setHasKeybagID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasKeybagID
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (BOOL)hasTarget
{
  return self->_target != 0;
}

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

- (void)setInodeNumber:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_inodeNumber = a3;
}

- (void)setHasInodeNumber:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasInodeNumber
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (void)setMode:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x100u;
  self->_mode = a3;
}

- (void)setHasMode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFEFF | v3;
}

- (BOOL)hasMode
{
  return HIBYTE(*(_WORD *)&self->_has) & 1;
}

- (void)setUserID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_userID = a3;
}

- (void)setHasUserID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasUserID
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setGroupID:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_groupID = a3;
}

- (void)setHasGroupID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasGroupID
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setLastModified:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_lastModified = a3;
}

- (void)setHasLastModified:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasLastModified
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setLastStatusChange:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_lastStatusChange = a3;
}

- (void)setHasLastStatusChange:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasLastStatusChange
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setBirth:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_birth = a3;
}

- (void)setHasBirth:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasBirth
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setProtectionClass:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_protectionClass = a3;
}

- (void)setHasProtectionClass:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasProtectionClass
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)clearExtendedAttributes
{
}

- (void)addExtendedAttribute:(id)a3
{
  extendedAttributes = self->_extendedAttributes;
  if (!extendedAttributes)
  {
    extendedAttributes = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    self->_extendedAttributes = extendedAttributes;
  }
  [(NSMutableArray *)extendedAttributes addObject:a3];
}

- (unint64_t)extendedAttributesCount
{
  return (unint64_t)[(NSMutableArray *)self->_extendedAttributes count];
}

- (id)extendedAttributeAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_extendedAttributes objectAtIndex:a3];
}

- (void)setEncryptionKeyVersion:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_encryptionKeyVersion = a3;
}

- (void)setHasEncryptionKeyVersion:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasEncryptionKeyVersion
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setDecryptedSize:(unint64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_decryptedSize = a3;
}

- (void)setHasDecryptedSize:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasDecryptedSize
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (id)description
{
  v3.receiver = self;
  v3.super_class = (Class)MBSFileAttributes;
  return +[NSString stringWithFormat:@"%@ %@", [(MBSFileAttributes *)&v3 description], [(MBSFileAttributes *)self dictionaryRepresentation]];
}

- (id)dictionaryRepresentation
{
  id v3 = +[NSMutableDictionary dictionary];
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_keybagID), @"keybagID");
  }
  target = self->_target;
  if (target) {
    [v3 setObject:target forKey:@"target"];
  }
  encryptionKey = self->_encryptionKey;
  if (encryptionKey) {
    [v3 setObject:encryptionKey forKey:@"encryptionKey"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_inodeNumber), @"inodeNumber");
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_9:
      if ((has & 0x400) == 0) {
        goto LABEL_10;
      }
      goto LABEL_32;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_9;
  }
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_mode), @"mode");
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_33;
  }
LABEL_32:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_userID), @"userID");
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_34;
  }
LABEL_33:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_groupID), @"groupID");
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_35;
  }
LABEL_34:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_lastModified), @"lastModified");
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_36;
  }
LABEL_35:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_lastStatusChange), @"lastStatusChange");
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_36:
  objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_birth), @"birth");
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_15:
  }
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_protectionClass), @"protectionClass");
LABEL_16:
  if ([(NSMutableArray *)self->_extendedAttributes count])
  {
    id v7 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](self->_extendedAttributes, "count"));
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    extendedAttributes = self->_extendedAttributes;
    id v9 = [(NSMutableArray *)extendedAttributes countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(extendedAttributes);
          }
          objc_msgSend(v7, "addObject:", objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "dictionaryRepresentation"));
        }
        id v10 = [(NSMutableArray *)extendedAttributes countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
    [v3 setObject:v7 forKey:@"extendedAttribute"];
  }
  __int16 v13 = (__int16)self->_has;
  if ((v13 & 0x20) != 0)
  {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", self->_encryptionKeyVersion), @"encryptionKeyVersion");
    __int16 v13 = (__int16)self->_has;
  }
  if ((v13 & 2) != 0) {
    objc_msgSend(v3, "setObject:forKey:", +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", self->_decryptedSize), @"decryptedSize");
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return MBSFileAttributesReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    PBDataWriterWriteUint32Field();
  }
  if (self->_target) {
    PBDataWriterWriteStringField();
  }
  if (self->_encryptionKey) {
    PBDataWriterWriteDataField();
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    PBDataWriterWriteUint64Field();
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_9:
      if ((has & 0x400) == 0) {
        goto LABEL_10;
      }
      goto LABEL_30;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteUint32Field();
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  PBDataWriterWriteUint64Field();
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_14:
    if ((has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_34:
  PBDataWriterWriteUint64Field();
  if ((*(_WORD *)&self->_has & 0x200) != 0) {
LABEL_15:
  }
    PBDataWriterWriteUint32Field();
LABEL_16:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  extendedAttributes = self->_extendedAttributes;
  v6 = (char *)[(NSMutableArray *)extendedAttributes countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(extendedAttributes);
        }
        PBDataWriterWriteSubmessage();
      }
      id v7 = (char *)[(NSMutableArray *)extendedAttributes countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
  __int16 v10 = (__int16)self->_has;
  if ((v10 & 0x20) != 0)
  {
    PBDataWriterWriteUint32Field();
    __int16 v10 = (__int16)self->_has;
  }
  if ((v10 & 2) != 0) {
    PBDataWriterWriteUint64Field();
  }
}

- (void)copyTo:(id)a3
{
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)a3 + 19) = self->_keybagID;
    *((_WORD *)a3 + 50) |= 0x80u;
  }
  if (self->_target) {
    objc_msgSend(a3, "setTarget:");
  }
  if (self->_encryptionKey) {
    objc_msgSend(a3, "setEncryptionKey:");
  }
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    *((void *)a3 + 3) = self->_inodeNumber;
    *((_WORD *)a3 + 50) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_9:
      if ((has & 0x400) == 0) {
        goto LABEL_10;
      }
      goto LABEL_27;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_9;
  }
  *((_DWORD *)a3 + 20) = self->_mode;
  *((_WORD *)a3 + 50) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_10:
    if ((has & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)a3 + 24) = self->_userID;
  *((_WORD *)a3 + 50) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_11:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_29;
  }
LABEL_28:
  *((_DWORD *)a3 + 18) = self->_groupID;
  *((_WORD *)a3 + 50) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_12:
    if ((has & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((void *)a3 + 4) = self->_lastModified;
  *((_WORD *)a3 + 50) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_13:
    if ((has & 1) == 0) {
      goto LABEL_14;
    }
LABEL_31:
    *((void *)a3 + 1) = self->_birth;
    *((_WORD *)a3 + 50) |= 1u;
    if ((*(_WORD *)&self->_has & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_30:
  *((void *)a3 + 5) = self->_lastStatusChange;
  *((_WORD *)a3 + 50) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if (has) {
    goto LABEL_31;
  }
LABEL_14:
  if ((has & 0x200) != 0)
  {
LABEL_15:
    *((_DWORD *)a3 + 21) = self->_protectionClass;
    *((_WORD *)a3 + 50) |= 0x200u;
  }
LABEL_16:
  if ([(MBSFileAttributes *)self extendedAttributesCount])
  {
    [a3 clearExtendedAttributes];
    unint64_t v6 = [(MBSFileAttributes *)self extendedAttributesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
        objc_msgSend(a3, "addExtendedAttribute:", -[MBSFileAttributes extendedAttributeAtIndex:](self, "extendedAttributeAtIndex:", i));
    }
  }
  __int16 v9 = (__int16)self->_has;
  if ((v9 & 0x20) != 0)
  {
    *((_DWORD *)a3 + 14) = self->_encryptionKeyVersion;
    *((_WORD *)a3 + 50) |= 0x20u;
    __int16 v9 = (__int16)self->_has;
  }
  if ((v9 & 2) != 0)
  {
    *((void *)a3 + 2) = self->_decryptedSize;
    *((_WORD *)a3 + 50) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (id *)objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  unint64_t v6 = v5;
  if ((*(_WORD *)&self->_has & 0x80) != 0)
  {
    *((_DWORD *)v5 + 19) = self->_keybagID;
    *((_WORD *)v5 + 50) |= 0x80u;
  }

  v6[11] = [(NSString *)self->_target copyWithZone:a3];
  v6[6] = [(NSData *)self->_encryptionKey copyWithZone:a3];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    v6[3] = self->_inodeNumber;
    *((_WORD *)v6 + 50) |= 4u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x100) == 0)
    {
LABEL_5:
      if ((has & 0x400) == 0) {
        goto LABEL_6;
      }
      goto LABEL_26;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x100) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v6 + 20) = self->_mode;
  *((_WORD *)v6 + 50) |= 0x100u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 0x40) == 0) {
      goto LABEL_7;
    }
    goto LABEL_27;
  }
LABEL_26:
  *((_DWORD *)v6 + 24) = self->_userID;
  *((_WORD *)v6 + 50) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x40) == 0)
  {
LABEL_7:
    if ((has & 8) == 0) {
      goto LABEL_8;
    }
    goto LABEL_28;
  }
LABEL_27:
  *((_DWORD *)v6 + 18) = self->_groupID;
  *((_WORD *)v6 + 50) |= 0x40u;
  __int16 has = (__int16)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_29;
  }
LABEL_28:
  v6[4] = self->_lastModified;
  *((_WORD *)v6 + 50) |= 8u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 1) == 0) {
      goto LABEL_10;
    }
    goto LABEL_30;
  }
LABEL_29:
  v6[5] = self->_lastStatusChange;
  *((_WORD *)v6 + 50) |= 0x10u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_10:
    if ((has & 0x200) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_30:
  v6[1] = self->_birth;
  *((_WORD *)v6 + 50) |= 1u;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_11:
    *((_DWORD *)v6 + 21) = self->_protectionClass;
    *((_WORD *)v6 + 50) |= 0x200u;
  }
LABEL_12:
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  extendedAttributes = self->_extendedAttributes;
  id v9 = [(NSMutableArray *)extendedAttributes countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(extendedAttributes);
        }
        id v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) copyWithZone:a3];
        [v6 addExtendedAttribute:v13];
      }
      id v10 = [(NSMutableArray *)extendedAttributes countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
  __int16 v14 = (__int16)self->_has;
  if ((v14 & 0x20) != 0)
  {
    *((_DWORD *)v6 + 14) = self->_encryptionKeyVersion;
    *((_WORD *)v6 + 50) |= 0x20u;
    __int16 v14 = (__int16)self->_has;
  }
  if ((v14 & 2) != 0)
  {
    v6[2] = self->_decryptedSize;
    *((_WORD *)v6 + 50) |= 2u;
  }
  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unsigned int v5 = [a3 isMemberOfClass:objc_opt_class()];
  if (v5)
  {
    __int16 v6 = *((_WORD *)a3 + 50);
    if ((*(_WORD *)&self->_has & 0x80) != 0)
    {
      if ((v6 & 0x80) == 0 || self->_keybagID != *((_DWORD *)a3 + 19)) {
        goto LABEL_63;
      }
    }
    else if ((v6 & 0x80) != 0)
    {
LABEL_63:
      LOBYTE(v5) = 0;
      return v5;
    }
    target = self->_target;
    if (!((unint64_t)target | *((void *)a3 + 11))
      || (unsigned int v5 = -[NSString isEqual:](target, "isEqual:")) != 0)
    {
      encryptionKey = self->_encryptionKey;
      if (!((unint64_t)encryptionKey | *((void *)a3 + 6))
        || (unsigned int v5 = -[NSData isEqual:](encryptionKey, "isEqual:")) != 0)
      {
        __int16 has = (__int16)self->_has;
        __int16 v10 = *((_WORD *)a3 + 50);
        if ((has & 4) != 0)
        {
          if ((v10 & 4) == 0 || self->_inodeNumber != *((void *)a3 + 3)) {
            goto LABEL_63;
          }
        }
        else if ((v10 & 4) != 0)
        {
          goto LABEL_63;
        }
        if ((*(_WORD *)&self->_has & 0x100) != 0)
        {
          if ((*((_WORD *)a3 + 50) & 0x100) == 0 || self->_mode != *((_DWORD *)a3 + 20)) {
            goto LABEL_63;
          }
        }
        else if ((*((_WORD *)a3 + 50) & 0x100) != 0)
        {
          goto LABEL_63;
        }
        if ((*(_WORD *)&self->_has & 0x400) != 0)
        {
          if ((*((_WORD *)a3 + 50) & 0x400) == 0 || self->_userID != *((_DWORD *)a3 + 24)) {
            goto LABEL_63;
          }
        }
        else if ((*((_WORD *)a3 + 50) & 0x400) != 0)
        {
          goto LABEL_63;
        }
        if ((has & 0x40) != 0)
        {
          if ((v10 & 0x40) == 0 || self->_groupID != *((_DWORD *)a3 + 18)) {
            goto LABEL_63;
          }
        }
        else if ((v10 & 0x40) != 0)
        {
          goto LABEL_63;
        }
        if ((has & 8) != 0)
        {
          if ((v10 & 8) == 0 || self->_lastModified != *((void *)a3 + 4)) {
            goto LABEL_63;
          }
        }
        else if ((v10 & 8) != 0)
        {
          goto LABEL_63;
        }
        if ((has & 0x10) != 0)
        {
          if ((v10 & 0x10) == 0 || self->_lastStatusChange != *((void *)a3 + 5)) {
            goto LABEL_63;
          }
        }
        else if ((v10 & 0x10) != 0)
        {
          goto LABEL_63;
        }
        if (has)
        {
          if ((v10 & 1) == 0 || self->_birth != *((void *)a3 + 1)) {
            goto LABEL_63;
          }
        }
        else if (v10)
        {
          goto LABEL_63;
        }
        if ((*(_WORD *)&self->_has & 0x200) != 0)
        {
          if ((*((_WORD *)a3 + 50) & 0x200) == 0 || self->_protectionClass != *((_DWORD *)a3 + 21)) {
            goto LABEL_63;
          }
        }
        else if ((*((_WORD *)a3 + 50) & 0x200) != 0)
        {
          goto LABEL_63;
        }
        extendedAttributes = self->_extendedAttributes;
        if ((unint64_t)extendedAttributes | *((void *)a3 + 8))
        {
          unsigned int v5 = -[NSMutableArray isEqual:](extendedAttributes, "isEqual:");
          if (!v5) {
            return v5;
          }
          __int16 has = (__int16)self->_has;
          __int16 v10 = *((_WORD *)a3 + 50);
        }
        if ((has & 0x20) != 0)
        {
          if ((v10 & 0x20) == 0 || self->_encryptionKeyVersion != *((_DWORD *)a3 + 14)) {
            goto LABEL_63;
          }
        }
        else if ((v10 & 0x20) != 0)
        {
          goto LABEL_63;
        }
        LOBYTE(v5) = (v10 & 2) == 0;
        if ((has & 2) != 0)
        {
          if ((v10 & 2) == 0 || self->_decryptedSize != *((void *)a3 + 2)) {
            goto LABEL_63;
          }
          LOBYTE(v5) = 1;
        }
      }
    }
  }
  return v5;
}

- (unint64_t)hash
{
  if ((*(_WORD *)&self->_has & 0x80) != 0) {
    uint64_t v20 = 2654435761 * self->_keybagID;
  }
  else {
    uint64_t v20 = 0;
  }
  NSUInteger v19 = [(NSString *)self->_target hash];
  unint64_t v18 = (unint64_t)[(NSData *)self->_encryptionKey hash];
  __int16 has = (__int16)self->_has;
  if ((has & 4) != 0)
  {
    unint64_t v16 = 2654435761u * self->_inodeNumber;
    if ((*(_WORD *)&self->_has & 0x100) != 0)
    {
LABEL_6:
      uint64_t v4 = 2654435761 * self->_mode;
      if ((*(_WORD *)&self->_has & 0x400) != 0) {
        goto LABEL_7;
      }
      goto LABEL_15;
    }
  }
  else
  {
    unint64_t v16 = 0;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_7:
    uint64_t v5 = 2654435761 * self->_userID;
    if ((has & 0x40) != 0) {
      goto LABEL_8;
    }
    goto LABEL_16;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((has & 0x40) != 0)
  {
LABEL_8:
    uint64_t v6 = 2654435761 * self->_groupID;
    if ((has & 8) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  uint64_t v6 = 0;
  if ((has & 8) != 0)
  {
LABEL_9:
    unint64_t v7 = 2654435761u * self->_lastModified;
    if ((has & 0x10) != 0) {
      goto LABEL_10;
    }
    goto LABEL_18;
  }
LABEL_17:
  unint64_t v7 = 0;
  if ((has & 0x10) != 0)
  {
LABEL_10:
    unint64_t v8 = 2654435761u * self->_lastStatusChange;
    if (has) {
      goto LABEL_11;
    }
LABEL_19:
    unint64_t v9 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_12;
    }
    goto LABEL_20;
  }
LABEL_18:
  unint64_t v8 = 0;
  if ((has & 1) == 0) {
    goto LABEL_19;
  }
LABEL_11:
  unint64_t v9 = 2654435761u * self->_birth;
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
LABEL_12:
    uint64_t v10 = 2654435761 * self->_protectionClass;
    goto LABEL_21;
  }
LABEL_20:
  uint64_t v10 = 0;
LABEL_21:
  unint64_t v11 = (unint64_t)[(NSMutableArray *)self->_extendedAttributes hash];
  __int16 v12 = (__int16)self->_has;
  if ((v12 & 0x20) != 0)
  {
    uint64_t v13 = 2654435761 * self->_encryptionKeyVersion;
    if ((v12 & 2) != 0) {
      goto LABEL_23;
    }
LABEL_25:
    unint64_t v14 = 0;
    return v19 ^ v20 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
  }
  uint64_t v13 = 0;
  if ((v12 & 2) == 0) {
    goto LABEL_25;
  }
LABEL_23:
  unint64_t v14 = 2654435761u * self->_decryptedSize;
  return v19 ^ v20 ^ v18 ^ v17 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v13 ^ v14;
}

- (void)mergeFrom:(id)a3
{
  if ((*((_WORD *)a3 + 50) & 0x80) != 0)
  {
    self->_keybagID = *((_DWORD *)a3 + 19);
    *(_WORD *)&self->_has |= 0x80u;
  }
  if (*((void *)a3 + 11)) {
    -[MBSFileAttributes setTarget:](self, "setTarget:");
  }
  if (*((void *)a3 + 6)) {
    -[MBSFileAttributes setEncryptionKey:](self, "setEncryptionKey:");
  }
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 4) != 0)
  {
    self->_inodeNumber = *((void *)a3 + 3);
    *(_WORD *)&self->_has |= 4u;
    __int16 v5 = *((_WORD *)a3 + 50);
    if ((v5 & 0x100) == 0)
    {
LABEL_9:
      if ((v5 & 0x400) == 0) {
        goto LABEL_10;
      }
      goto LABEL_30;
    }
  }
  else if ((*((_WORD *)a3 + 50) & 0x100) == 0)
  {
    goto LABEL_9;
  }
  self->_mode = *((_DWORD *)a3 + 20);
  *(_WORD *)&self->_has |= 0x100u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x400) == 0)
  {
LABEL_10:
    if ((v5 & 0x40) == 0) {
      goto LABEL_11;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_userID = *((_DWORD *)a3 + 24);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x40) == 0)
  {
LABEL_11:
    if ((v5 & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_groupID = *((_DWORD *)a3 + 18);
  *(_WORD *)&self->_has |= 0x40u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 8) == 0)
  {
LABEL_12:
    if ((v5 & 0x10) == 0) {
      goto LABEL_13;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_lastModified = *((void *)a3 + 4);
  *(_WORD *)&self->_has |= 8u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 0x10) == 0)
  {
LABEL_13:
    if ((v5 & 1) == 0) {
      goto LABEL_14;
    }
    goto LABEL_34;
  }
LABEL_33:
  self->_lastStatusChange = *((void *)a3 + 5);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v5 = *((_WORD *)a3 + 50);
  if ((v5 & 1) == 0)
  {
LABEL_14:
    if ((v5 & 0x200) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_34:
  self->_birth = *((void *)a3 + 1);
  *(_WORD *)&self->_has |= 1u;
  if ((*((_WORD *)a3 + 50) & 0x200) != 0)
  {
LABEL_15:
    self->_protectionClass = *((_DWORD *)a3 + 21);
    *(_WORD *)&self->_has |= 0x200u;
  }
LABEL_16:
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v6 = (void *)*((void *)a3 + 8);
  id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v9) {
          objc_enumerationMutation(v6);
        }
        [(MBSFileAttributes *)self addExtendedAttribute:*(void *)(*((void *)&v12 + 1) + 8 * i)];
      }
      id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v8);
  }
  __int16 v11 = *((_WORD *)a3 + 50);
  if ((v11 & 0x20) != 0)
  {
    self->_encryptionKeyVersion = *((_DWORD *)a3 + 14);
    *(_WORD *)&self->_has |= 0x20u;
    __int16 v11 = *((_WORD *)a3 + 50);
  }
  if ((v11 & 2) != 0)
  {
    self->_decryptedSize = *((void *)a3 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
}

- (unsigned)keybagID
{
  return self->_keybagID;
}

- (NSString)target
{
  return self->_target;
}

- (void)setTarget:(id)a3
{
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (unint64_t)inodeNumber
{
  return self->_inodeNumber;
}

- (unsigned)mode
{
  return self->_mode;
}

- (unsigned)userID
{
  return self->_userID;
}

- (unsigned)groupID
{
  return self->_groupID;
}

- (unint64_t)lastModified
{
  return self->_lastModified;
}

- (unint64_t)lastStatusChange
{
  return self->_lastStatusChange;
}

- (unint64_t)birth
{
  return self->_birth;
}

- (unsigned)protectionClass
{
  return self->_protectionClass;
}

- (NSMutableArray)extendedAttributes
{
  return self->_extendedAttributes;
}

- (void)setExtendedAttributes:(id)a3
{
}

- (unsigned)encryptionKeyVersion
{
  return self->_encryptionKeyVersion;
}

- (unint64_t)decryptedSize
{
  return self->_decryptedSize;
}

- (void)setStat:(stat *)a3
{
  [(MBSFileAttributes *)self setInodeNumber:a3->st_ino];
  [(MBSFileAttributes *)self setMode:a3->st_mode];
  [(MBSFileAttributes *)self setUserID:a3->st_uid];
  [(MBSFileAttributes *)self setGroupID:a3->st_gid];
  [(MBSFileAttributes *)self setLastModified:a3->st_mtimespec.tv_sec];
  [(MBSFileAttributes *)self setLastStatusChange:a3->st_ctimespec.tv_sec];
  __darwin_time_t tv_sec = a3->st_birthtimespec.tv_sec;
  [(MBSFileAttributes *)self setBirth:tv_sec];
}

- (void)getNode:(id *)a3
{
  WORD2(a3->var10) = (unsigned __int16)[(MBSFileAttributes *)self mode];
  a3->var1 = [(MBSFileAttributes *)self userID];
  a3->var2 = [(MBSFileAttributes *)self groupID];
  a3->var4 = [(MBSFileAttributes *)self birth];
  a3->var5 = [(MBSFileAttributes *)self lastModified];
  a3->var6 = [(MBSFileAttributes *)self lastStatusChange];
  BYTE6(a3->var10) = [(MBSFileAttributes *)self protectionClass];
  a3->var8 = [(MBSFileAttributes *)self inodeNumber];
}

- (void)addExtendedAttributesDictionary:(id)a3
{
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        uint64_t v10 = [v4 objectForKeyedSubscript:v9];
        __int16 v11 = objc_alloc_init(MBSFileExtendedAttribute);
        [(MBSFileExtendedAttribute *)v11 setName:v9];
        [(MBSFileExtendedAttribute *)v11 setValue:v10];
        [(MBSFileAttributes *)self addExtendedAttribute:v11];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }
}

- (BOOL)verifyWithFile:(id)a3 error:(id *)a4
{
  if ([(MBSFileAttributes *)self hasInodeNumber])
  {
    if ([(MBSFileAttributes *)self hasMode])
    {
      if (([(MBSFileAttributes *)self mode] & 0xF000) == 0x8000
        || ([(MBSFileAttributes *)self mode] & 0xF000) == 0x4000
        || ([(MBSFileAttributes *)self mode] & 0xF000) == 0xA000)
      {
        if (([(MBSFileAttributes *)self mode] & 0xF000) == 0xA000
          && ![(MBSFileAttributes *)self hasTarget])
        {
          CFStringRef v11 = @"FileAttributes.target missing for symlink";
        }
        else if (([(MBSFileAttributes *)self mode] & 0xF000) == 0xA000 {
               && ([(MBSFileAttributes *)self target],
        }
                   id v6 = objc_claimAutoreleasedReturnValue(),
                   id v7 = [v6 length],
                   v6,
                   !v7))
        {
          CFStringRef v11 = @"FileAttributes.target empty for symlink";
        }
        else if ([(MBSFileAttributes *)self hasUserID])
        {
          if ([(MBSFileAttributes *)self hasGroupID])
          {
            if ([(MBSFileAttributes *)self hasLastModified])
            {
              if ([(MBSFileAttributes *)self hasLastStatusChange])
              {
                if ([(MBSFileAttributes *)self hasBirth])
                {
                  if ([(MBSFileAttributes *)self hasKeybagID]
                    && [(MBSFileAttributes *)self keybagID] < 2)
                  {
                    CFStringRef v11 = @"FileAttributes.keybagID invalid";
                  }
                  else if ([(MBSFileAttributes *)self hasEncryptionKey] {
                         && ([(MBSFileAttributes *)self encryptionKey],
                  }
                             id v8 = objc_claimAutoreleasedReturnValue(),
                             id v9 = [v8 length],
                             v8,
                             !v9))
                  {
                    CFStringRef v11 = @"FileAttributes.encryptionKey empty";
                  }
                  else if ([(MBSFileAttributes *)self hasKeybagID] {
                         && ![(MBSFileAttributes *)self hasEncryptionKey])
                  }
                  {
                    CFStringRef v11 = @"FileAttributes.keybagID without FileAttributes.encryptionKey";
                  }
                  else if ([(MBSFileAttributes *)self hasEncryptionKey] {
                         && ![(MBSFileAttributes *)self hasKeybagID])
                  }
                  {
                    CFStringRef v11 = @"FileAttributes.encryptionKey without FileAttributes.keybagID";
                  }
                  else if ([(MBSFileAttributes *)self hasEncryptionKeyVersion] {
                         && [(MBSFileAttributes *)self encryptionKeyVersion]
                  }
                         && [(MBSFileAttributes *)self encryptionKeyVersion] != 1
                         && [(MBSFileAttributes *)self encryptionKeyVersion] != 2)
                  {
                    CFStringRef v11 = @"FileAttributes.encryptionKeyVersion invalid";
                  }
                  else
                  {
                    if (![(MBSFileAttributes *)self hasEncryptionKeyVersion]
                      || [(MBSFileAttributes *)self encryptionKeyVersion] != 2
                      || [(MBSFileAttributes *)self hasDecryptedSize])
                    {
                      return 1;
                    }
                    CFStringRef v11 = @"FileAttributes.decryptedSize missing";
                  }
                }
                else
                {
                  CFStringRef v11 = @"FileAttributes.birth missing";
                }
              }
              else
              {
                CFStringRef v11 = @"FileAttributes.lastStatusChange missing";
              }
            }
            else
            {
              CFStringRef v11 = @"FileAttributes.lastModified missing";
            }
          }
          else
          {
            CFStringRef v11 = @"FileAttributes.groupID missing";
          }
        }
        else
        {
          CFStringRef v11 = @"FileAttributes.userID missing";
        }
      }
      else
      {
        CFStringRef v11 = @"FileAttributes.mode file type invalid";
      }
    }
    else
    {
      CFStringRef v11 = @"FileAttributes.mode missing";
    }
  }
  else
  {
    CFStringRef v11 = @"FileAttributes.inodeNumber missing";
  }
  if (!a4) {
    return 0;
  }
  id v12 = +[MBError errorWithCode:205, @"%@", v11 format];
  BOOL result = 0;
  *a4 = v12;
  return result;
}

@end
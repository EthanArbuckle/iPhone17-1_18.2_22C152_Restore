@interface MBCKFileAttributesArchive
- (BOOL)hasBirth;
- (BOOL)hasContentCompressionMethod;
- (BOOL)hasContentEncodingMethod;
- (BOOL)hasEncryptionKey;
- (BOOL)hasFlags;
- (BOOL)hasGroupID;
- (BOOL)hasIsMMCSEncryptedOnly;
- (BOOL)hasLinkTarget;
- (BOOL)hasMode;
- (BOOL)hasModified;
- (BOOL)hasRelativePath;
- (BOOL)hasSha256Signature;
- (BOOL)hasSize;
- (BOOL)hasSizeBeforeCopy;
- (BOOL)hasSourceDeviceInode;
- (BOOL)hasStatusChanged;
- (BOOL)hasUserID;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMMCSEncryptedOnly;
- (BOOL)readFrom:(id)a3;
- (NSData)encryptionKey;
- (NSData)sha256Signature;
- (NSString)linkTarget;
- (NSString)relativePath;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int)birth;
- (int)contentCompressionMethod;
- (int)contentEncodingMethod;
- (int)groupID;
- (int)mode;
- (int)modified;
- (int)statusChanged;
- (int)userID;
- (int64_t)size;
- (int64_t)sizeBeforeCopy;
- (int64_t)sourceDeviceInode;
- (unint64_t)hash;
- (unsigned)flags;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setBirth:(int)a3;
- (void)setContentCompressionMethod:(int)a3;
- (void)setContentEncodingMethod:(int)a3;
- (void)setEncryptionKey:(id)a3;
- (void)setFlags:(unsigned int)a3;
- (void)setGroupID:(int)a3;
- (void)setHasBirth:(BOOL)a3;
- (void)setHasContentCompressionMethod:(BOOL)a3;
- (void)setHasContentEncodingMethod:(BOOL)a3;
- (void)setHasFlags:(BOOL)a3;
- (void)setHasGroupID:(BOOL)a3;
- (void)setHasIsMMCSEncryptedOnly:(BOOL)a3;
- (void)setHasMode:(BOOL)a3;
- (void)setHasModified:(BOOL)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setHasSizeBeforeCopy:(BOOL)a3;
- (void)setHasSourceDeviceInode:(BOOL)a3;
- (void)setHasStatusChanged:(BOOL)a3;
- (void)setHasUserID:(BOOL)a3;
- (void)setIsMMCSEncryptedOnly:(BOOL)a3;
- (void)setLinkTarget:(id)a3;
- (void)setMode:(int)a3;
- (void)setModified:(int)a3;
- (void)setRelativePath:(id)a3;
- (void)setSha256Signature:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setSizeBeforeCopy:(int64_t)a3;
- (void)setSourceDeviceInode:(int64_t)a3;
- (void)setStatusChanged:(int)a3;
- (void)setUserID:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation MBCKFileAttributesArchive

- (BOOL)hasRelativePath
{
  return self->_relativePath != 0;
}

- (void)setBirth:(int)a3
{
  *(_WORD *)&self->_has |= 8u;
  self->_birth = a3;
}

- (void)setHasBirth:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFF7 | v3;
}

- (BOOL)hasBirth
{
  return (*(_WORD *)&self->_has >> 3) & 1;
}

- (void)setModified:(int)a3
{
  *(_WORD *)&self->_has |= 0x200u;
  self->_modified = a3;
}

- (void)setHasModified:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFDFF | v3;
}

- (BOOL)hasModified
{
  return (*(_WORD *)&self->_has >> 9) & 1;
}

- (void)setStatusChanged:(int)a3
{
  *(_WORD *)&self->_has |= 0x400u;
  self->_statusChanged = a3;
}

- (void)setHasStatusChanged:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFBFF | v3;
}

- (BOOL)hasStatusChanged
{
  return (*(_WORD *)&self->_has >> 10) & 1;
}

- (void)setSize:(int64_t)a3
{
  *(_WORD *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFE | a3;
}

- (BOOL)hasSize
{
  return *(_WORD *)&self->_has & 1;
}

- (void)setGroupID:(int)a3
{
  *(_WORD *)&self->_has |= 0x80u;
  self->_groupID = a3;
}

- (void)setHasGroupID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFF7F | v3;
}

- (BOOL)hasGroupID
{
  return (*(_WORD *)&self->_has >> 7) & 1;
}

- (void)setUserID:(int)a3
{
  *(_WORD *)&self->_has |= 0x800u;
  self->_userID = a3;
}

- (void)setHasUserID:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2048;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xF7FF | v3;
}

- (BOOL)hasUserID
{
  return (*(_WORD *)&self->_has >> 11) & 1;
}

- (void)setMode:(int)a3
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

- (void)setSizeBeforeCopy:(int64_t)a3
{
  *(_WORD *)&self->_has |= 2u;
  self->_sizeBeforeCopy = a3;
}

- (void)setHasSizeBeforeCopy:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFD | v3;
}

- (BOOL)hasSizeBeforeCopy
{
  return (*(_WORD *)&self->_has >> 1) & 1;
}

- (BOOL)hasLinkTarget
{
  return self->_linkTarget != 0;
}

- (BOOL)hasEncryptionKey
{
  return self->_encryptionKey != 0;
}

- (BOOL)hasSha256Signature
{
  return self->_sha256Signature != 0;
}

- (void)setFlags:(unsigned int)a3
{
  *(_WORD *)&self->_has |= 0x40u;
  self->_flags = a3;
}

- (void)setHasFlags:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFBF | v3;
}

- (BOOL)hasFlags
{
  return (*(_WORD *)&self->_has >> 6) & 1;
}

- (void)setContentEncodingMethod:(int)a3
{
  *(_WORD *)&self->_has |= 0x20u;
  self->_contentEncodingMethod = a3;
}

- (void)setHasContentEncodingMethod:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFDF | v3;
}

- (BOOL)hasContentEncodingMethod
{
  return (*(_WORD *)&self->_has >> 5) & 1;
}

- (void)setContentCompressionMethod:(int)a3
{
  *(_WORD *)&self->_has |= 0x10u;
  self->_contentCompressionMethod = a3;
}

- (void)setHasContentCompressionMethod:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFEF | v3;
}

- (BOOL)hasContentCompressionMethod
{
  return (*(_WORD *)&self->_has >> 4) & 1;
}

- (void)setIsMMCSEncryptedOnly:(BOOL)a3
{
  *(_WORD *)&self->_has |= 0x1000u;
  self->_isMMCSEncryptedOnly = a3;
}

- (void)setHasIsMMCSEncryptedOnly:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4096;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xEFFF | v3;
}

- (BOOL)hasIsMMCSEncryptedOnly
{
  return (*(_WORD *)&self->_has >> 12) & 1;
}

- (void)setSourceDeviceInode:(int64_t)a3
{
  *(_WORD *)&self->_has |= 4u;
  self->_sourceDeviceInode = a3;
}

- (void)setHasSourceDeviceInode:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->_has = *(_WORD *)&self->_has & 0xFFFB | v3;
}

- (BOOL)hasSourceDeviceInode
{
  return (*(_WORD *)&self->_has >> 2) & 1;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)MBCKFileAttributesArchive;
  __int16 v3 = [(MBCKFileAttributesArchive *)&v7 description];
  v4 = [(MBCKFileAttributesArchive *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  __int16 v3 = +[NSMutableDictionary dictionary];
  v4 = v3;
  relativePath = self->_relativePath;
  if (relativePath) {
    [v3 setObject:relativePath forKey:@"relativePath"];
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    v14 = +[NSNumber numberWithInt:self->_birth];
    [v4 setObject:v14 forKey:@"birth"];

    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 0x400) == 0) {
        goto LABEL_6;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  v15 = +[NSNumber numberWithInt:self->_modified];
  [v4 setObject:v15 forKey:@"modified"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  v16 = +[NSNumber numberWithInt:self->_statusChanged];
  [v4 setObject:v16 forKey:@"statusChanged"];

  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  v17 = +[NSNumber numberWithLongLong:self->_size];
  [v4 setObject:v17 forKey:@"size"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  v18 = +[NSNumber numberWithInt:self->_groupID];
  [v4 setObject:v18 forKey:@"groupID"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  v19 = +[NSNumber numberWithInt:self->_userID];
  [v4 setObject:v19 forKey:@"userID"];

  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_33:
  v20 = +[NSNumber numberWithInt:self->_mode];
  [v4 setObject:v20 forKey:@"mode"];

  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_11:
    objc_super v7 = +[NSNumber numberWithLongLong:self->_sizeBeforeCopy];
    [v4 setObject:v7 forKey:@"sizeBeforeCopy"];
  }
LABEL_12:
  linkTarget = self->_linkTarget;
  if (linkTarget) {
    [v4 setObject:linkTarget forKey:@"linkTarget"];
  }
  encryptionKey = self->_encryptionKey;
  if (encryptionKey) {
    [v4 setObject:encryptionKey forKey:@"encryptionKey"];
  }
  sha256Signature = self->_sha256Signature;
  if (sha256Signature) {
    [v4 setObject:sha256Signature forKey:@"sha256Signature"];
  }
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    v21 = +[NSNumber numberWithUnsignedInt:self->_flags];
    [v4 setObject:v21 forKey:@"flags"];

    __int16 v11 = (__int16)self->_has;
    if ((v11 & 0x20) == 0)
    {
LABEL_20:
      if ((v11 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_37;
    }
  }
  else if ((v11 & 0x20) == 0)
  {
    goto LABEL_20;
  }
  v22 = +[NSNumber numberWithInt:self->_contentEncodingMethod];
  [v4 setObject:v22 forKey:@"contentEncodingMethod"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x10) == 0)
  {
LABEL_21:
    if ((v11 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  v23 = +[NSNumber numberWithInt:self->_contentCompressionMethod];
  [v4 setObject:v23 forKey:@"contentCompressionMethod"];

  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x1000) == 0)
  {
LABEL_22:
    if ((v11 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_38:
  v24 = +[NSNumber numberWithBool:self->_isMMCSEncryptedOnly];
  [v4 setObject:v24 forKey:@"isMMCSEncryptedOnly"];

  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_23:
    v12 = +[NSNumber numberWithLongLong:self->_sourceDeviceInode];
    [v4 setObject:v12 forKey:@"sourceDeviceInode"];
  }
LABEL_24:
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  while (*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) < *(void *)((char *)a3
                                                                              + OBJC_IVAR___PBDataReader__length))
  {
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      break;
    }
    char v5 = 0;
    unsigned int v6 = 0;
    unint64_t v7 = 0;
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
        unint64_t v7 = 0;
        int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
        goto LABEL_13;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_11:
    int v11 = *((unsigned __int8 *)a3 + OBJC_IVAR___PBDataReader__error);
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      unint64_t v7 = 0;
    }
LABEL_13:
    if (v11 || (v7 & 7) == 4) {
      break;
    }
    switch((v7 >> 3))
    {
      case 1u:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 80;
        goto LABEL_80;
      case 3u:
        char v16 = 0;
        unsigned int v17 = 0;
        uint64_t v18 = 0;
        *(_WORD *)&self->_has |= 8u;
        while (2)
        {
          unint64_t v19 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v19 == -1 || v19 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v20 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v19);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v19 + 1;
            v18 |= (unint64_t)(v20 & 0x7F) << v16;
            if (v20 < 0)
            {
              v16 += 7;
              BOOL v10 = v17++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_119;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_119:
        uint64_t v72 = 32;
        goto LABEL_160;
      case 4u:
        char v21 = 0;
        unsigned int v22 = 0;
        uint64_t v18 = 0;
        *(_WORD *)&self->_has |= 0x200u;
        while (2)
        {
          unint64_t v23 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v23 == -1 || v23 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v24 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v23);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v23 + 1;
            v18 |= (unint64_t)(v24 & 0x7F) << v21;
            if (v24 < 0)
            {
              v21 += 7;
              BOOL v10 = v22++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_123;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_123:
        uint64_t v72 = 76;
        goto LABEL_160;
      case 5u:
        char v25 = 0;
        unsigned int v26 = 0;
        uint64_t v18 = 0;
        *(_WORD *)&self->_has |= 0x400u;
        while (2)
        {
          unint64_t v27 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v27 == -1 || v27 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v28 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v27);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v27 + 1;
            v18 |= (unint64_t)(v28 & 0x7F) << v25;
            if (v28 < 0)
            {
              v25 += 7;
              BOOL v10 = v26++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_127;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_127:
        uint64_t v72 = 96;
        goto LABEL_160;
      case 6u:
        char v29 = 0;
        unsigned int v30 = 0;
        uint64_t v31 = 0;
        *(_WORD *)&self->_has |= 1u;
        while (2)
        {
          unint64_t v32 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v32 == -1 || v32 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v33 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v32);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v32 + 1;
            v31 |= (unint64_t)(v33 & 0x7F) << v29;
            if (v33 < 0)
            {
              v29 += 7;
              BOOL v10 = v30++ >= 9;
              if (v10)
              {
                uint64_t v31 = 0;
                goto LABEL_131;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v31 = 0;
        }
LABEL_131:
        uint64_t v73 = 8;
        goto LABEL_169;
      case 7u:
        char v34 = 0;
        unsigned int v35 = 0;
        uint64_t v18 = 0;
        *(_WORD *)&self->_has |= 0x80u;
        while (2)
        {
          unint64_t v36 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v36 == -1 || v36 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v37 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v36);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v36 + 1;
            v18 |= (unint64_t)(v37 & 0x7F) << v34;
            if (v37 < 0)
            {
              v34 += 7;
              BOOL v10 = v35++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_135;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_135:
        uint64_t v72 = 60;
        goto LABEL_160;
      case 8u:
        char v38 = 0;
        unsigned int v39 = 0;
        uint64_t v18 = 0;
        *(_WORD *)&self->_has |= 0x800u;
        while (2)
        {
          unint64_t v40 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v40 == -1 || v40 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v41 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v40);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v40 + 1;
            v18 |= (unint64_t)(v41 & 0x7F) << v38;
            if (v41 < 0)
            {
              v38 += 7;
              BOOL v10 = v39++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_139;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_139:
        uint64_t v72 = 100;
        goto LABEL_160;
      case 9u:
        char v42 = 0;
        unsigned int v43 = 0;
        uint64_t v18 = 0;
        *(_WORD *)&self->_has |= 0x100u;
        while (2)
        {
          unint64_t v44 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v44 == -1 || v44 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v45 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v44);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v44 + 1;
            v18 |= (unint64_t)(v45 & 0x7F) << v42;
            if (v45 < 0)
            {
              v42 += 7;
              BOOL v10 = v43++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_143;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_143:
        uint64_t v72 = 72;
        goto LABEL_160;
      case 0xAu:
        char v46 = 0;
        unsigned int v47 = 0;
        uint64_t v31 = 0;
        *(_WORD *)&self->_has |= 2u;
        while (2)
        {
          unint64_t v48 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v48 == -1 || v48 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v49 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v48);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v48 + 1;
            v31 |= (unint64_t)(v49 & 0x7F) << v46;
            if (v49 < 0)
            {
              v46 += 7;
              BOOL v10 = v47++ >= 9;
              if (v10)
              {
                uint64_t v31 = 0;
                goto LABEL_147;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v31 = 0;
        }
LABEL_147:
        uint64_t v73 = 16;
        goto LABEL_169;
      case 0xBu:
        uint64_t v13 = PBReaderReadString();
        uint64_t v14 = 64;
        goto LABEL_80;
      case 0xCu:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 48;
        goto LABEL_80;
      case 0xDu:
        uint64_t v13 = PBReaderReadData();
        uint64_t v14 = 88;
LABEL_80:
        v50 = *(void **)&self->PBCodable_opaque[v14];
        *(void *)&self->PBCodable_opaque[v14] = v13;

        continue;
      case 0xFu:
        char v51 = 0;
        unsigned int v52 = 0;
        uint64_t v18 = 0;
        *(_WORD *)&self->_has |= 0x40u;
        while (2)
        {
          unint64_t v53 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v53 == -1 || v53 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v54 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v53);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v53 + 1;
            v18 |= (unint64_t)(v54 & 0x7F) << v51;
            if (v54 < 0)
            {
              v51 += 7;
              BOOL v10 = v52++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_151;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_151:
        uint64_t v72 = 56;
        goto LABEL_160;
      case 0x10u:
        char v55 = 0;
        unsigned int v56 = 0;
        uint64_t v18 = 0;
        *(_WORD *)&self->_has |= 0x20u;
        while (2)
        {
          unint64_t v57 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v57 == -1 || v57 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v58 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v57);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v57 + 1;
            v18 |= (unint64_t)(v58 & 0x7F) << v55;
            if (v58 < 0)
            {
              v55 += 7;
              BOOL v10 = v56++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_155;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_155:
        uint64_t v72 = 40;
        goto LABEL_160;
      case 0x11u:
        char v59 = 0;
        unsigned int v60 = 0;
        uint64_t v18 = 0;
        *(_WORD *)&self->_has |= 0x10u;
        while (2)
        {
          unint64_t v61 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v61 == -1 || v61 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v62 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v61);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v61 + 1;
            v18 |= (unint64_t)(v62 & 0x7F) << v59;
            if (v62 < 0)
            {
              v59 += 7;
              BOOL v10 = v60++ >= 9;
              if (v10)
              {
                LODWORD(v18) = 0;
                goto LABEL_159;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          LODWORD(v18) = 0;
        }
LABEL_159:
        uint64_t v72 = 36;
LABEL_160:
        *(_DWORD *)&self->PBCodable_opaque[v72] = v18;
        continue;
      case 0x12u:
        char v63 = 0;
        unsigned int v64 = 0;
        uint64_t v65 = 0;
        *(_WORD *)&self->_has |= 0x1000u;
        while (2)
        {
          unint64_t v66 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
          if (v66 == -1 || v66 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length))
          {
            *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
          }
          else
          {
            char v67 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v66);
            *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v66 + 1;
            v65 |= (unint64_t)(v67 & 0x7F) << v63;
            if (v67 < 0)
            {
              v63 += 7;
              BOOL v10 = v64++ >= 9;
              if (v10)
              {
                uint64_t v65 = 0;
                goto LABEL_164;
              }
              continue;
            }
          }
          break;
        }
        if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
          uint64_t v65 = 0;
        }
LABEL_164:
        self->_isMMCSEncryptedOnly = v65 != 0;
        continue;
      case 0x13u:
        char v68 = 0;
        unsigned int v69 = 0;
        uint64_t v31 = 0;
        *(_WORD *)&self->_has |= 4u;
        break;
      default:
        int v15 = PBReaderSkipValueWithTag();
        if (!v15) {
          return v15;
        }
        continue;
    }
    while (1)
    {
      unint64_t v70 = *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos);
      if (v70 == -1 || v70 >= *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__length)) {
        break;
      }
      char v71 = *(unsigned char *)(*(void *)((char *)a3 + OBJC_IVAR___PBDataReader__bytes) + v70);
      *(void *)((char *)a3 + OBJC_IVAR___PBDataReader__pos) = v70 + 1;
      v31 |= (unint64_t)(v71 & 0x7F) << v68;
      if ((v71 & 0x80) == 0) {
        goto LABEL_166;
      }
      v68 += 7;
      BOOL v10 = v69++ >= 9;
      if (v10)
      {
        uint64_t v31 = 0;
        goto LABEL_168;
      }
    }
    *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) = 1;
LABEL_166:
    if (*((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error)) {
      uint64_t v31 = 0;
    }
LABEL_168:
    uint64_t v73 = 24;
LABEL_169:
    *(void *)&self->PBCodable_opaque[v73] = v31;
  }
  LOBYTE(v15) = *((unsigned char *)a3 + OBJC_IVAR___PBDataReader__error) == 0;
  return v15;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_relativePath)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteInt32Field();
    id v4 = v7;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 0x400) == 0) {
        goto LABEL_6;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  PBDataWriterWriteInt64Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_33:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_11:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_12:
  if (self->_linkTarget)
  {
    PBDataWriterWriteStringField();
    id v4 = v7;
  }
  if (self->_encryptionKey)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  if (self->_sha256Signature)
  {
    PBDataWriterWriteDataField();
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    PBDataWriterWriteUint32Field();
    id v4 = v7;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_20:
      if ((v6 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_20;
  }
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  PBDataWriterWriteInt32Field();
  id v4 = v7;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_22:
    if ((v6 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_38:
  PBDataWriterWriteBOOLField();
  id v4 = v7;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_23:
    PBDataWriterWriteInt64Field();
    id v4 = v7;
  }
LABEL_24:
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (self->_relativePath)
  {
    objc_msgSend(v4, "setRelativePath:");
    id v4 = v7;
  }
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v4 + 8) = self->_birth;
    *((_WORD *)v4 + 54) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_5:
      if ((has & 0x400) == 0) {
        goto LABEL_6;
      }
      goto LABEL_29;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_5;
  }
  *((_DWORD *)v4 + 19) = self->_modified;
  *((_WORD *)v4 + 54) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_6:
    if ((has & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  *((_DWORD *)v4 + 24) = self->_statusChanged;
  *((_WORD *)v4 + 54) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_7:
    if ((has & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  *((void *)v4 + 1) = self->_size;
  *((_WORD *)v4 + 54) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_8:
    if ((has & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  *((_DWORD *)v4 + 15) = self->_groupID;
  *((_WORD *)v4 + 54) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_9:
    if ((has & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  *((_DWORD *)v4 + 25) = self->_userID;
  *((_WORD *)v4 + 54) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_10:
    if ((has & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_33:
  *((_DWORD *)v4 + 18) = self->_mode;
  *((_WORD *)v4 + 54) |= 0x100u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_11:
    *((void *)v4 + 2) = self->_sizeBeforeCopy;
    *((_WORD *)v4 + 54) |= 2u;
  }
LABEL_12:
  if (self->_linkTarget)
  {
    objc_msgSend(v7, "setLinkTarget:");
    id v4 = v7;
  }
  if (self->_encryptionKey)
  {
    objc_msgSend(v7, "setEncryptionKey:");
    id v4 = v7;
  }
  if (self->_sha256Signature)
  {
    objc_msgSend(v7, "setSha256Signature:");
    id v4 = v7;
  }
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x40) != 0)
  {
    *((_DWORD *)v4 + 14) = self->_flags;
    *((_WORD *)v4 + 54) |= 0x40u;
    __int16 v6 = (__int16)self->_has;
    if ((v6 & 0x20) == 0)
    {
LABEL_20:
      if ((v6 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_20;
  }
  *((_DWORD *)v4 + 10) = self->_contentEncodingMethod;
  *((_WORD *)v4 + 54) |= 0x20u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  *((_DWORD *)v4 + 9) = self->_contentCompressionMethod;
  *((_WORD *)v4 + 54) |= 0x10u;
  __int16 v6 = (__int16)self->_has;
  if ((v6 & 0x1000) == 0)
  {
LABEL_22:
    if ((v6 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_38:
  *((unsigned char *)v4 + 104) = self->_isMMCSEncryptedOnly;
  *((_WORD *)v4 + 54) |= 0x1000u;
  if ((*(_WORD *)&self->_has & 4) != 0)
  {
LABEL_23:
    *((void *)v4 + 3) = self->_sourceDeviceInode;
    *((_WORD *)v4 + 54) |= 4u;
  }
LABEL_24:
}

- (id)copyWithZone:(_NSZone *)a3
{
  char v5 = objc_msgSend(objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(NSString *)self->_relativePath copyWithZone:a3];
  id v7 = (void *)v5[10];
  v5[10] = v6;

  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    *((_DWORD *)v5 + 8) = self->_birth;
    *((_WORD *)v5 + 54) |= 8u;
    __int16 has = (__int16)self->_has;
    if ((has & 0x200) == 0)
    {
LABEL_3:
      if ((has & 0x400) == 0) {
        goto LABEL_4;
      }
      goto LABEL_19;
    }
  }
  else if ((*(_WORD *)&self->_has & 0x200) == 0)
  {
    goto LABEL_3;
  }
  *((_DWORD *)v5 + 19) = self->_modified;
  *((_WORD *)v5 + 54) |= 0x200u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x400) == 0)
  {
LABEL_4:
    if ((has & 1) == 0) {
      goto LABEL_5;
    }
    goto LABEL_20;
  }
LABEL_19:
  *((_DWORD *)v5 + 24) = self->_statusChanged;
  *((_WORD *)v5 + 54) |= 0x400u;
  __int16 has = (__int16)self->_has;
  if ((has & 1) == 0)
  {
LABEL_5:
    if ((has & 0x80) == 0) {
      goto LABEL_6;
    }
    goto LABEL_21;
  }
LABEL_20:
  v5[1] = self->_size;
  *((_WORD *)v5 + 54) |= 1u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x80) == 0)
  {
LABEL_6:
    if ((has & 0x800) == 0) {
      goto LABEL_7;
    }
    goto LABEL_22;
  }
LABEL_21:
  *((_DWORD *)v5 + 15) = self->_groupID;
  *((_WORD *)v5 + 54) |= 0x80u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x800) == 0)
  {
LABEL_7:
    if ((has & 0x100) == 0) {
      goto LABEL_8;
    }
    goto LABEL_23;
  }
LABEL_22:
  *((_DWORD *)v5 + 25) = self->_userID;
  *((_WORD *)v5 + 54) |= 0x800u;
  __int16 has = (__int16)self->_has;
  if ((has & 0x100) == 0)
  {
LABEL_8:
    if ((has & 2) == 0) {
      goto LABEL_10;
    }
    goto LABEL_9;
  }
LABEL_23:
  *((_DWORD *)v5 + 18) = self->_mode;
  *((_WORD *)v5 + 54) |= 0x100u;
  if ((*(_WORD *)&self->_has & 2) != 0)
  {
LABEL_9:
    v5[2] = self->_sizeBeforeCopy;
    *((_WORD *)v5 + 54) |= 2u;
  }
LABEL_10:
  id v9 = [(NSString *)self->_linkTarget copyWithZone:a3];
  BOOL v10 = (void *)v5[8];
  v5[8] = v9;

  id v11 = [(NSData *)self->_encryptionKey copyWithZone:a3];
  v12 = (void *)v5[6];
  v5[6] = v11;

  id v13 = [(NSData *)self->_sha256Signature copyWithZone:a3];
  uint64_t v14 = (void *)v5[11];
  v5[11] = v13;

  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x40) != 0)
  {
    *((_DWORD *)v5 + 14) = self->_flags;
    *((_WORD *)v5 + 54) |= 0x40u;
    __int16 v15 = (__int16)self->_has;
    if ((v15 & 0x20) == 0)
    {
LABEL_12:
      if ((v15 & 0x10) == 0) {
        goto LABEL_13;
      }
      goto LABEL_27;
    }
  }
  else if ((v15 & 0x20) == 0)
  {
    goto LABEL_12;
  }
  *((_DWORD *)v5 + 10) = self->_contentEncodingMethod;
  *((_WORD *)v5 + 54) |= 0x20u;
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x10) == 0)
  {
LABEL_13:
    if ((v15 & 0x1000) == 0) {
      goto LABEL_14;
    }
LABEL_28:
    *((unsigned char *)v5 + 104) = self->_isMMCSEncryptedOnly;
    *((_WORD *)v5 + 54) |= 0x1000u;
    if ((*(_WORD *)&self->_has & 4) == 0) {
      return v5;
    }
    goto LABEL_15;
  }
LABEL_27:
  *((_DWORD *)v5 + 9) = self->_contentCompressionMethod;
  *((_WORD *)v5 + 54) |= 0x10u;
  __int16 v15 = (__int16)self->_has;
  if ((v15 & 0x1000) != 0) {
    goto LABEL_28;
  }
LABEL_14:
  if ((v15 & 4) != 0)
  {
LABEL_15:
    v5[3] = self->_sourceDeviceInode;
    *((_WORD *)v5 + 54) |= 4u;
  }
  return v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_78;
  }
  relativePath = self->_relativePath;
  if ((unint64_t)relativePath | *((void *)v4 + 10))
  {
    if (!-[NSString isEqual:](relativePath, "isEqual:")) {
      goto LABEL_78;
    }
  }
  __int16 has = (__int16)self->_has;
  __int16 v7 = *((_WORD *)v4 + 54);
  if ((has & 8) != 0)
  {
    if ((v7 & 8) == 0 || self->_birth != *((_DWORD *)v4 + 8)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 8) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x200) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x200) == 0 || self->_modified != *((_DWORD *)v4 + 19)) {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x200) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x400) == 0 || self->_statusChanged != *((_DWORD *)v4 + 24)) {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x400) != 0)
  {
    goto LABEL_78;
  }
  if (has)
  {
    if ((v7 & 1) == 0 || self->_size != *((void *)v4 + 1)) {
      goto LABEL_78;
    }
  }
  else if (v7)
  {
    goto LABEL_78;
  }
  if ((has & 0x80) != 0)
  {
    if ((v7 & 0x80) == 0 || self->_groupID != *((_DWORD *)v4 + 15)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 0x80) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x800) == 0 || self->_userID != *((_DWORD *)v4 + 25)) {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x800) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x100) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x100) == 0 || self->_mode != *((_DWORD *)v4 + 18)) {
      goto LABEL_78;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x100) != 0)
  {
    goto LABEL_78;
  }
  if ((has & 2) != 0)
  {
    if ((v7 & 2) == 0 || self->_sizeBeforeCopy != *((void *)v4 + 2)) {
      goto LABEL_78;
    }
  }
  else if ((v7 & 2) != 0)
  {
    goto LABEL_78;
  }
  linkTarget = self->_linkTarget;
  if ((unint64_t)linkTarget | *((void *)v4 + 8) && !-[NSString isEqual:](linkTarget, "isEqual:")) {
    goto LABEL_78;
  }
  encryptionKey = self->_encryptionKey;
  if ((unint64_t)encryptionKey | *((void *)v4 + 6))
  {
    if (!-[NSData isEqual:](encryptionKey, "isEqual:")) {
      goto LABEL_78;
    }
  }
  sha256Signature = self->_sha256Signature;
  if ((unint64_t)sha256Signature | *((void *)v4 + 11))
  {
    if (!-[NSData isEqual:](sha256Signature, "isEqual:")) {
      goto LABEL_78;
    }
  }
  __int16 v11 = (__int16)self->_has;
  __int16 v12 = *((_WORD *)v4 + 54);
  if ((v11 & 0x40) != 0)
  {
    if ((v12 & 0x40) == 0 || self->_flags != *((_DWORD *)v4 + 14)) {
      goto LABEL_78;
    }
  }
  else if ((v12 & 0x40) != 0)
  {
    goto LABEL_78;
  }
  if ((v11 & 0x20) != 0)
  {
    if ((v12 & 0x20) == 0 || self->_contentEncodingMethod != *((_DWORD *)v4 + 10)) {
      goto LABEL_78;
    }
  }
  else if ((v12 & 0x20) != 0)
  {
    goto LABEL_78;
  }
  if ((v11 & 0x10) != 0)
  {
    if ((v12 & 0x10) == 0 || self->_contentCompressionMethod != *((_DWORD *)v4 + 9)) {
      goto LABEL_78;
    }
  }
  else if ((v12 & 0x10) != 0)
  {
    goto LABEL_78;
  }
  if ((*(_WORD *)&self->_has & 0x1000) != 0)
  {
    if ((*((_WORD *)v4 + 54) & 0x1000) != 0)
    {
      if (self->_isMMCSEncryptedOnly)
      {
        if (!*((unsigned char *)v4 + 104)) {
          goto LABEL_78;
        }
        goto LABEL_73;
      }
      if (!*((unsigned char *)v4 + 104)) {
        goto LABEL_73;
      }
    }
LABEL_78:
    BOOL v13 = 0;
    goto LABEL_79;
  }
  if ((*((_WORD *)v4 + 54) & 0x1000) != 0) {
    goto LABEL_78;
  }
LABEL_73:
  if ((v11 & 4) != 0)
  {
    if ((v12 & 4) == 0 || self->_sourceDeviceInode != *((void *)v4 + 3)) {
      goto LABEL_78;
    }
    BOOL v13 = 1;
  }
  else
  {
    BOOL v13 = (v12 & 4) == 0;
  }
LABEL_79:

  return v13;
}

- (unint64_t)hash
{
  NSUInteger v22 = [(NSString *)self->_relativePath hash];
  __int16 has = (__int16)self->_has;
  if ((has & 8) != 0)
  {
    uint64_t v21 = 2654435761 * self->_birth;
    if ((*(_WORD *)&self->_has & 0x200) != 0)
    {
LABEL_3:
      uint64_t v20 = 2654435761 * self->_modified;
      if ((*(_WORD *)&self->_has & 0x400) != 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else
  {
    uint64_t v21 = 0;
    if ((*(_WORD *)&self->_has & 0x200) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v20 = 0;
  if ((*(_WORD *)&self->_has & 0x400) != 0)
  {
LABEL_4:
    uint64_t v19 = 2654435761 * self->_statusChanged;
    if (has) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  uint64_t v19 = 0;
  if (has)
  {
LABEL_5:
    uint64_t v18 = 2654435761 * self->_size;
    if ((has & 0x80) != 0) {
      goto LABEL_6;
    }
    goto LABEL_14;
  }
LABEL_13:
  uint64_t v18 = 0;
  if ((has & 0x80) != 0)
  {
LABEL_6:
    uint64_t v4 = 2654435761 * self->_groupID;
    if ((*(_WORD *)&self->_has & 0x800) != 0) {
      goto LABEL_7;
    }
    goto LABEL_15;
  }
LABEL_14:
  uint64_t v4 = 0;
  if ((*(_WORD *)&self->_has & 0x800) != 0)
  {
LABEL_7:
    uint64_t v5 = 2654435761 * self->_userID;
    if ((*(_WORD *)&self->_has & 0x100) != 0) {
      goto LABEL_8;
    }
LABEL_16:
    uint64_t v6 = 0;
    if ((has & 2) != 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_15:
  uint64_t v5 = 0;
  if ((*(_WORD *)&self->_has & 0x100) == 0) {
    goto LABEL_16;
  }
LABEL_8:
  uint64_t v6 = 2654435761 * self->_mode;
  if ((has & 2) != 0)
  {
LABEL_9:
    uint64_t v7 = 2654435761 * self->_sizeBeforeCopy;
    goto LABEL_18;
  }
LABEL_17:
  uint64_t v7 = 0;
LABEL_18:
  NSUInteger v8 = [(NSString *)self->_linkTarget hash];
  unint64_t v9 = (unint64_t)[(NSData *)self->_encryptionKey hash];
  unint64_t v10 = (unint64_t)[(NSData *)self->_sha256Signature hash];
  __int16 v11 = (__int16)self->_has;
  if ((v11 & 0x40) != 0)
  {
    uint64_t v12 = 2654435761 * self->_flags;
    if ((v11 & 0x20) != 0)
    {
LABEL_20:
      uint64_t v13 = 2654435761 * self->_contentEncodingMethod;
      if ((v11 & 0x10) != 0) {
        goto LABEL_21;
      }
      goto LABEL_26;
    }
  }
  else
  {
    uint64_t v12 = 0;
    if ((v11 & 0x20) != 0) {
      goto LABEL_20;
    }
  }
  uint64_t v13 = 0;
  if ((v11 & 0x10) != 0)
  {
LABEL_21:
    uint64_t v14 = 2654435761 * self->_contentCompressionMethod;
    if ((*(_WORD *)&self->_has & 0x1000) != 0) {
      goto LABEL_22;
    }
LABEL_27:
    uint64_t v15 = 0;
    if ((v11 & 4) != 0) {
      goto LABEL_23;
    }
LABEL_28:
    uint64_t v16 = 0;
    return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
  }
LABEL_26:
  uint64_t v14 = 0;
  if ((*(_WORD *)&self->_has & 0x1000) == 0) {
    goto LABEL_27;
  }
LABEL_22:
  uint64_t v15 = 2654435761 * self->_isMMCSEncryptedOnly;
  if ((v11 & 4) == 0) {
    goto LABEL_28;
  }
LABEL_23:
  uint64_t v16 = 2654435761 * self->_sourceDeviceInode;
  return v21 ^ v22 ^ v20 ^ v19 ^ v18 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v7 = v4;
  if (*((void *)v4 + 10))
  {
    -[MBCKFileAttributesArchive setRelativePath:](self, "setRelativePath:");
    id v4 = v7;
  }
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 8) != 0)
  {
    self->_birth = *((_DWORD *)v4 + 8);
    *(_WORD *)&self->_has |= 8u;
    __int16 v5 = *((_WORD *)v4 + 54);
    if ((v5 & 0x200) == 0)
    {
LABEL_5:
      if ((v5 & 0x400) == 0) {
        goto LABEL_6;
      }
      goto LABEL_29;
    }
  }
  else if ((*((_WORD *)v4 + 54) & 0x200) == 0)
  {
    goto LABEL_5;
  }
  self->_modified = *((_DWORD *)v4 + 19);
  *(_WORD *)&self->_has |= 0x200u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x400) == 0)
  {
LABEL_6:
    if ((v5 & 1) == 0) {
      goto LABEL_7;
    }
    goto LABEL_30;
  }
LABEL_29:
  self->_statusChanged = *((_DWORD *)v4 + 24);
  *(_WORD *)&self->_has |= 0x400u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 1) == 0)
  {
LABEL_7:
    if ((v5 & 0x80) == 0) {
      goto LABEL_8;
    }
    goto LABEL_31;
  }
LABEL_30:
  self->_size = *((void *)v4 + 1);
  *(_WORD *)&self->_has |= 1u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x80) == 0)
  {
LABEL_8:
    if ((v5 & 0x800) == 0) {
      goto LABEL_9;
    }
    goto LABEL_32;
  }
LABEL_31:
  self->_groupID = *((_DWORD *)v4 + 15);
  *(_WORD *)&self->_has |= 0x80u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x800) == 0)
  {
LABEL_9:
    if ((v5 & 0x100) == 0) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
LABEL_32:
  self->_userID = *((_DWORD *)v4 + 25);
  *(_WORD *)&self->_has |= 0x800u;
  __int16 v5 = *((_WORD *)v4 + 54);
  if ((v5 & 0x100) == 0)
  {
LABEL_10:
    if ((v5 & 2) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_33:
  self->_mode = *((_DWORD *)v4 + 18);
  *(_WORD *)&self->_has |= 0x100u;
  if ((*((_WORD *)v4 + 54) & 2) != 0)
  {
LABEL_11:
    self->_sizeBeforeCopy = *((void *)v4 + 2);
    *(_WORD *)&self->_has |= 2u;
  }
LABEL_12:
  if (*((void *)v4 + 8))
  {
    -[MBCKFileAttributesArchive setLinkTarget:](self, "setLinkTarget:");
    id v4 = v7;
  }
  if (*((void *)v4 + 6))
  {
    -[MBCKFileAttributesArchive setEncryptionKey:](self, "setEncryptionKey:");
    id v4 = v7;
  }
  if (*((void *)v4 + 11))
  {
    -[MBCKFileAttributesArchive setSha256Signature:](self, "setSha256Signature:");
    id v4 = v7;
  }
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x40) != 0)
  {
    self->_flags = *((_DWORD *)v4 + 14);
    *(_WORD *)&self->_has |= 0x40u;
    __int16 v6 = *((_WORD *)v4 + 54);
    if ((v6 & 0x20) == 0)
    {
LABEL_20:
      if ((v6 & 0x10) == 0) {
        goto LABEL_21;
      }
      goto LABEL_37;
    }
  }
  else if ((v6 & 0x20) == 0)
  {
    goto LABEL_20;
  }
  self->_contentEncodingMethod = *((_DWORD *)v4 + 10);
  *(_WORD *)&self->_has |= 0x20u;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x10) == 0)
  {
LABEL_21:
    if ((v6 & 0x1000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_38;
  }
LABEL_37:
  self->_contentCompressionMethod = *((_DWORD *)v4 + 9);
  *(_WORD *)&self->_has |= 0x10u;
  __int16 v6 = *((_WORD *)v4 + 54);
  if ((v6 & 0x1000) == 0)
  {
LABEL_22:
    if ((v6 & 4) == 0) {
      goto LABEL_24;
    }
    goto LABEL_23;
  }
LABEL_38:
  self->_isMMCSEncryptedOnly = *((unsigned char *)v4 + 104);
  *(_WORD *)&self->_has |= 0x1000u;
  if ((*((_WORD *)v4 + 54) & 4) != 0)
  {
LABEL_23:
    self->_sourceDeviceInode = *((void *)v4 + 3);
    *(_WORD *)&self->_has |= 4u;
  }
LABEL_24:
}

- (NSString)relativePath
{
  return self->_relativePath;
}

- (void)setRelativePath:(id)a3
{
}

- (int)birth
{
  return self->_birth;
}

- (int)modified
{
  return self->_modified;
}

- (int)statusChanged
{
  return self->_statusChanged;
}

- (int64_t)size
{
  return self->_size;
}

- (int)groupID
{
  return self->_groupID;
}

- (int)userID
{
  return self->_userID;
}

- (int)mode
{
  return self->_mode;
}

- (int64_t)sizeBeforeCopy
{
  return self->_sizeBeforeCopy;
}

- (NSString)linkTarget
{
  return self->_linkTarget;
}

- (void)setLinkTarget:(id)a3
{
}

- (NSData)encryptionKey
{
  return self->_encryptionKey;
}

- (void)setEncryptionKey:(id)a3
{
}

- (NSData)sha256Signature
{
  return self->_sha256Signature;
}

- (void)setSha256Signature:(id)a3
{
}

- (unsigned)flags
{
  return self->_flags;
}

- (int)contentEncodingMethod
{
  return self->_contentEncodingMethod;
}

- (int)contentCompressionMethod
{
  return self->_contentCompressionMethod;
}

- (BOOL)isMMCSEncryptedOnly
{
  return self->_isMMCSEncryptedOnly;
}

- (int64_t)sourceDeviceInode
{
  return self->_sourceDeviceInode;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sha256Signature, 0);
  objc_storeStrong((id *)&self->_relativePath, 0);
  objc_storeStrong((id *)&self->_linkTarget, 0);
  objc_storeStrong((id *)&self->_encryptionKey, 0);
}

@end
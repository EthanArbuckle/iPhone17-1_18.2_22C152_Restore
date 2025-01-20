@interface BRFieldPkgItem
- (BOOL)hasIsExecutable;
- (BOOL)hasIsWritable;
- (BOOL)hasMtime;
- (BOOL)hasPath;
- (BOOL)hasQuarantineInfo;
- (BOOL)hasSignature;
- (BOOL)hasSymlinkContent;
- (BOOL)hasXattrIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)isExecutable;
- (BOOL)isWritable;
- (BOOL)readFrom:(id)a3;
- (BRFieldPkgItem)initWithPkgItem:(id)a3;
- (NSData)quarantineInfo;
- (NSData)signature;
- (NSString)path;
- (NSString)symlinkContent;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (int64_t)mtime;
- (int64_t)xattrIndex;
- (unint64_t)hash;
- (void)clear;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasIsExecutable:(BOOL)a3;
- (void)setHasIsWritable:(BOOL)a3;
- (void)setHasMtime:(BOOL)a3;
- (void)setHasXattrIndex:(BOOL)a3;
- (void)setIsExecutable:(BOOL)a3;
- (void)setIsWritable:(BOOL)a3;
- (void)setMtime:(int64_t)a3;
- (void)setPath:(id)a3;
- (void)setQuarantineInfo:(id)a3;
- (void)setSignature:(id)a3;
- (void)setSymlinkContent:(id)a3;
- (void)setType:(int)a3;
- (void)setXattrIndex:(int64_t)a3;
- (void)updateWithPkgItem:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRFieldPkgItem

- (id)typeAsString:(int)a3
{
  if ((a3 - 1) >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", *(void *)&a3);
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_2650804C0[a3 - 1];
  }
  return v3;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"DIRECTORY"])
  {
    int v4 = 1;
  }
  else if ([v3 isEqualToString:@"FILE"])
  {
    int v4 = 2;
  }
  else if ([v3 isEqualToString:@"SYMLINK"])
  {
    int v4 = 3;
  }
  else if ([v3 isEqualToString:@"TOMBSTONE"])
  {
    int v4 = 4;
  }
  else
  {
    int v4 = 1;
  }

  return v4;
}

- (BOOL)hasPath
{
  return self->_path != 0;
}

- (void)setMtime:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_mtime = a3;
}

- (void)setHasMtime:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMtime
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsWritable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_isWritable = a3;
}

- (void)setHasIsWritable:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsWritable
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsExecutable:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_isExecutable = a3;
}

- (void)setHasIsExecutable:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsExecutable
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (BOOL)hasSymlinkContent
{
  return self->_symlinkContent != 0;
}

- (BOOL)hasQuarantineInfo
{
  return self->_quarantineInfo != 0;
}

- (BOOL)hasSignature
{
  return self->_signature != 0;
}

- (void)setXattrIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_xattrIndex = a3;
}

- (void)setHasXattrIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasXattrIndex
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldPkgItem;
  int v4 = [(BRFieldPkgItem *)&v8 description];
  v5 = [(BRFieldPkgItem *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  unsigned int v4 = self->_type - 1;
  if (v4 >= 4)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"(unknown: %i)", self->_type);
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = off_2650804C0[v4];
  }
  [v3 setObject:v5 forKey:@"type"];

  path = self->_path;
  if (path) {
    [v3 setObject:path forKey:@"path"];
  }
  char has = (char)self->_has;
  if (has)
  {
    v14 = [NSNumber numberWithLongLong:self->_mtime];
    [v3 setObject:v14 forKey:@"mtime"];

    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_8:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_8;
  }
  v15 = [NSNumber numberWithBool:self->_isWritable];
  [v3 setObject:v15 forKey:@"isWritable"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_9:
    objc_super v8 = [NSNumber numberWithBool:self->_isExecutable];
    [v3 setObject:v8 forKey:@"isExecutable"];
  }
LABEL_10:
  symlinkContent = self->_symlinkContent;
  if (symlinkContent) {
    [v3 setObject:symlinkContent forKey:@"symlinkContent"];
  }
  quarantineInfo = self->_quarantineInfo;
  if (quarantineInfo) {
    [v3 setObject:quarantineInfo forKey:@"quarantineInfo"];
  }
  signature = self->_signature;
  if (signature) {
    [v3 setObject:signature forKey:@"signature"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = [NSNumber numberWithLongLong:self->_xattrIndex];
    [v3 setObject:v12 forKey:@"xattrIndex"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldPkgItemReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  PBDataWriterWriteInt32Field();
  if (self->_path) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt64Field();
    char has = (char)self->_has;
  }
  v5 = v6;
  if ((has & 8) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v6;
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    PBDataWriterWriteBOOLField();
    v5 = v6;
  }
  if (self->_symlinkContent)
  {
    PBDataWriterWriteStringField();
    v5 = v6;
  }
  if (self->_quarantineInfo)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if (self->_signature)
  {
    PBDataWriterWriteDataField();
    v5 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  unsigned int v4 = a3;
  v4[14] = self->_type;
  id v6 = v4;
  if (self->_path)
  {
    objc_msgSend(v4, "setPath:");
    unsigned int v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = self->_mtime;
    *((unsigned char *)v4 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_5:
      if ((has & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_5;
  }
  *((unsigned char *)v4 + 61) = self->_isWritable;
  *((unsigned char *)v4 + 64) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_6:
    *((unsigned char *)v4 + 60) = self->_isExecutable;
    *((unsigned char *)v4 + 64) |= 4u;
  }
LABEL_7:
  if (self->_symlinkContent)
  {
    objc_msgSend(v6, "setSymlinkContent:");
    unsigned int v4 = v6;
  }
  if (self->_quarantineInfo)
  {
    objc_msgSend(v6, "setQuarantineInfo:");
    unsigned int v4 = v6;
  }
  if (self->_signature)
  {
    objc_msgSend(v6, "setSignature:");
    unsigned int v4 = v6;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_xattrIndex;
    *((unsigned char *)v4 + 64) |= 2u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  *(_DWORD *)(v5 + 56) = self->_type;
  uint64_t v6 = [(NSString *)self->_path copyWithZone:a3];
  v7 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(void *)(v5 + 8) = self->_mtime;
    *(unsigned char *)(v5 + 64) |= 1u;
    char has = (char)self->_has;
    if ((has & 8) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 8) == 0)
  {
    goto LABEL_3;
  }
  *(unsigned char *)(v5 + 61) = self->_isWritable;
  *(unsigned char *)(v5 + 64) |= 8u;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    *(unsigned char *)(v5 + 60) = self->_isExecutable;
    *(unsigned char *)(v5 + 64) |= 4u;
  }
LABEL_5:
  uint64_t v9 = [(NSString *)self->_symlinkContent copyWithZone:a3];
  v10 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v9;

  uint64_t v11 = [(NSData *)self->_quarantineInfo copyWithZone:a3];
  v12 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v11;

  uint64_t v13 = [(NSData *)self->_signature copyWithZone:a3];
  v14 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v13;

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_xattrIndex;
    *(unsigned char *)(v5 + 64) |= 2u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_36;
  }
  if (self->_type != *((_DWORD *)v4 + 14)) {
    goto LABEL_36;
  }
  path = self->_path;
  if ((unint64_t)path | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](path, "isEqual:")) {
      goto LABEL_36;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 64) & 1) == 0 || self->_mtime != *((void *)v4 + 1)) {
      goto LABEL_36;
    }
  }
  else if (*((unsigned char *)v4 + 64))
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 8) == 0) {
      goto LABEL_36;
    }
    if (self->_isWritable)
    {
      if (!*((unsigned char *)v4 + 61)) {
        goto LABEL_36;
      }
    }
    else if (*((unsigned char *)v4 + 61))
    {
      goto LABEL_36;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) != 0)
  {
    goto LABEL_36;
  }
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 4) != 0)
    {
      if (self->_isExecutable)
      {
        if (!*((unsigned char *)v4 + 60)) {
          goto LABEL_36;
        }
        goto LABEL_26;
      }
      if (!*((unsigned char *)v4 + 60)) {
        goto LABEL_26;
      }
    }
LABEL_36:
    BOOL v9 = 0;
    goto LABEL_37;
  }
  if ((*((unsigned char *)v4 + 64) & 4) != 0) {
    goto LABEL_36;
  }
LABEL_26:
  symlinkContent = self->_symlinkContent;
  if ((unint64_t)symlinkContent | *((void *)v4 + 6)
    && !-[NSString isEqual:](symlinkContent, "isEqual:"))
  {
    goto LABEL_36;
  }
  quarantineInfo = self->_quarantineInfo;
  if ((unint64_t)quarantineInfo | *((void *)v4 + 4))
  {
    if (!-[NSData isEqual:](quarantineInfo, "isEqual:")) {
      goto LABEL_36;
    }
  }
  signature = self->_signature;
  if ((unint64_t)signature | *((void *)v4 + 5))
  {
    if (!-[NSData isEqual:](signature, "isEqual:")) {
      goto LABEL_36;
    }
  }
  BOOL v9 = (*((unsigned char *)v4 + 64) & 2) == 0;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 64) & 2) == 0 || self->_xattrIndex != *((void *)v4 + 2)) {
      goto LABEL_36;
    }
    BOOL v9 = 1;
  }
LABEL_37:

  return v9;
}

- (unint64_t)hash
{
  uint64_t type = self->_type;
  NSUInteger v4 = [(NSString *)self->_path hash];
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v5 = 0;
    if ((*(unsigned char *)&self->_has & 8) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
    goto LABEL_7;
  }
  uint64_t v5 = 2654435761 * self->_mtime;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v6 = 2654435761 * self->_isWritable;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    uint64_t v7 = 2654435761 * self->_isExecutable;
    goto LABEL_8;
  }
LABEL_7:
  uint64_t v7 = 0;
LABEL_8:
  NSUInteger v8 = [(NSString *)self->_symlinkContent hash];
  uint64_t v9 = [(NSData *)self->_quarantineInfo hash];
  uint64_t v10 = [(NSData *)self->_signature hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v11 = 2654435761 * self->_xattrIndex;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ (2654435761 * type) ^ v9 ^ v10 ^ v11;
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  self->_uint64_t type = *((_DWORD *)v4 + 14);
  id v6 = v4;
  if (*((void *)v4 + 3))
  {
    -[BRFieldPkgItem setPath:](self, "setPath:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 64);
  if (v5)
  {
    self->_mtime = *((void *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 64);
    if ((v5 & 8) == 0)
    {
LABEL_5:
      if ((v5 & 4) == 0) {
        goto LABEL_7;
      }
      goto LABEL_6;
    }
  }
  else if ((*((unsigned char *)v4 + 64) & 8) == 0)
  {
    goto LABEL_5;
  }
  self->_isWritable = *((unsigned char *)v4 + 61);
  *(unsigned char *)&self->_has |= 8u;
  if ((*((unsigned char *)v4 + 64) & 4) != 0)
  {
LABEL_6:
    self->_isExecutable = *((unsigned char *)v4 + 60);
    *(unsigned char *)&self->_has |= 4u;
  }
LABEL_7:
  if (*((void *)v4 + 6))
  {
    -[BRFieldPkgItem setSymlinkContent:](self, "setSymlinkContent:");
    id v4 = v6;
  }
  if (*((void *)v4 + 4))
  {
    -[BRFieldPkgItem setQuarantineInfo:](self, "setQuarantineInfo:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[BRFieldPkgItem setSignature:](self, "setSignature:");
    id v4 = v6;
  }
  if ((*((unsigned char *)v4 + 64) & 2) != 0)
  {
    self->_xattrIndex = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_uint64_t type = a3;
}

- (NSString)path
{
  return self->_path;
}

- (void)setPath:(id)a3
{
}

- (int64_t)mtime
{
  return self->_mtime;
}

- (BOOL)isWritable
{
  return self->_isWritable;
}

- (BOOL)isExecutable
{
  return self->_isExecutable;
}

- (NSString)symlinkContent
{
  return self->_symlinkContent;
}

- (void)setSymlinkContent:(id)a3
{
}

- (NSData)quarantineInfo
{
  return self->_quarantineInfo;
}

- (void)setQuarantineInfo:(id)a3
{
}

- (NSData)signature
{
  return self->_signature;
}

- (void)setSignature:(id)a3
{
}

- (int64_t)xattrIndex
{
  return self->_xattrIndex;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_symlinkContent, 0);
  objc_storeStrong((id *)&self->_signature, 0);
  objc_storeStrong((id *)&self->_quarantineInfo, 0);
  objc_storeStrong((id *)&self->_path, 0);
}

- (BRFieldPkgItem)initWithPkgItem:(id)a3
{
  id v4 = a3;
  char v5 = [(BRFieldPkgItem *)self init];
  id v6 = v5;
  if (v5) {
    [(BRFieldPkgItem *)v5 updateWithPkgItem:v4];
  }

  return v6;
}

- (void)updateWithPkgItem:(id)a3
{
  id v9 = a3;
  -[BRFieldPkgItem setType:](self, "setType:", [v9 type]);
  id v4 = [v9 pathInPackage];
  [(BRFieldPkgItem *)self setPath:v4];

  char v5 = [v9 quarantineInfo];
  [(BRFieldPkgItem *)self setQuarantineInfo:v5];

  -[BRFieldPkgItem setMtime:](self, "setMtime:", [v9 mtime]);
  if ([v9 isSymLink])
  {
    id v6 = [v9 symlinkContent];
    [(BRFieldPkgItem *)self setSymlinkContent:v6];
  }
  else
  {
    int v7 = [v9 isFile];
    NSUInteger v8 = v9;
    if (!v7) {
      goto LABEL_10;
    }
    if ([v9 mode]) {
      [(BRFieldPkgItem *)self setIsWritable:1];
    }
    if (([v9 mode] & 2) != 0) {
      [(BRFieldPkgItem *)self setIsExecutable:1];
    }
    id v6 = [v9 contentSignature];
    [(BRFieldPkgItem *)self setSignature:v6];
  }

  NSUInteger v8 = v9;
LABEL_10:
}

- (void)clear
{
  [(BRFieldPkgItem *)self setType:0];
  [(BRFieldPkgItem *)self setPath:0];
  [(BRFieldPkgItem *)self setHasMtime:0];
  [(BRFieldPkgItem *)self setHasIsExecutable:0];
  [(BRFieldPkgItem *)self setHasIsWritable:0];
  [(BRFieldPkgItem *)self setSignature:0];
  [(BRFieldPkgItem *)self setSymlinkContent:0];
  [(BRFieldPkgItem *)self setQuarantineInfo:0];
  [(BRFieldPkgItem *)self setHasXattrIndex:0];
}

@end
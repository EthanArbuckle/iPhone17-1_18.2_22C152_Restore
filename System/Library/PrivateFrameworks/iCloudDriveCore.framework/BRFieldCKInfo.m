@interface BRFieldCKInfo
+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4;
+ (id)newFromSqliteValue:(sqlite3_value *)a3;
- (BOOL)hasDeletionChangeToken;
- (BOOL)hasEtag;
- (BOOL)hasEtagBeforeCrossZoneMove;
- (BOOL)hasKnownToServer;
- (BOOL)hasWasCached;
- (BOOL)isEqual:(id)a3;
- (BOOL)knownToServer;
- (BOOL)readFrom:(id)a3;
- (BOOL)wasCached;
- (BRFieldCKInfo)initWithRecord:(id)a3;
- (NSData)deletionChangeToken;
- (NSString)description;
- (NSString)etag;
- (NSString)etagBeforeCrossZoneMove;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (void)clearCrossZoneMoveEtag;
- (void)copyTo:(id)a3;
- (void)markCrossZoneMoved;
- (void)mergeFrom:(id)a3;
- (void)revertEtagsForOldZoneTombstone;
- (void)setCKInfoFieldsInRecord:(id)a3 includeCZMEtag:(BOOL)a4;
- (void)setDeletionChangeToken:(id)a3;
- (void)setEtag:(id)a3;
- (void)setEtagBeforeCrossZoneMove:(id)a3;
- (void)setHasKnownToServer:(BOOL)a3;
- (void)setHasWasCached:(BOOL)a3;
- (void)setKnownToServer:(BOOL)a3;
- (void)setWasCached:(BOOL)a3;
- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4;
- (void)writeTo:(id)a3;
@end

@implementation BRFieldCKInfo

- (void)setKnownToServer:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_knownToServer = a3;
}

- (void)setHasKnownToServer:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasKnownToServer
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setWasCached:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_wasCached = a3;
}

- (void)setHasWasCached:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasWasCached
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasEtag
{
  return self->_etag != 0;
}

- (BOOL)hasEtagBeforeCrossZoneMove
{
  return self->_etagBeforeCrossZoneMove != 0;
}

- (BOOL)hasDeletionChangeToken
{
  return self->_deletionChangeToken != 0;
}

- (NSString)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldCKInfo;
  v4 = [(BRFieldCKInfo *)&v8 description];
  v5 = [(BRFieldCKInfo *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x263EFF9A0] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = [NSNumber numberWithBool:self->_knownToServer];
    [v3 setObject:v5 forKey:@"knownToServer"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v6 = [NSNumber numberWithBool:self->_wasCached];
    [v3 setObject:v6 forKey:@"wasCached"];
  }
  etag = self->_etag;
  if (etag) {
    [v3 setObject:etag forKey:@"etag"];
  }
  etagBeforeCrossZoneMove = self->_etagBeforeCrossZoneMove;
  if (etagBeforeCrossZoneMove) {
    [v3 setObject:etagBeforeCrossZoneMove forKey:@"etagBeforeCrossZoneMove"];
  }
  deletionChangeToken = self->_deletionChangeToken;
  if (deletionChangeToken) {
    [v3 setObject:deletionChangeToken forKey:@"deletionChangeToken"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldCKInfoReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  id v6 = v4;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
  if (self->_etag)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_etagBeforeCrossZoneMove)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_deletionChangeToken)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    v4[32] = self->_knownToServer;
    v4[36] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v4[33] = self->_wasCached;
    v4[36] |= 2u;
  }
  id v6 = v4;
  if (self->_etag)
  {
    objc_msgSend(v4, "setEtag:");
    id v4 = v6;
  }
  if (self->_etagBeforeCrossZoneMove)
  {
    objc_msgSend(v6, "setEtagBeforeCrossZoneMove:");
    id v4 = v6;
  }
  if (self->_deletionChangeToken)
  {
    objc_msgSend(v6, "setDeletionChangeToken:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = (unsigned char *)objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = v5;
  char has = (char)self->_has;
  if (has)
  {
    v5[32] = self->_knownToServer;
    v5[36] |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    v5[33] = self->_wasCached;
    v5[36] |= 2u;
  }
  uint64_t v8 = [(NSString *)self->_etag copyWithZone:a3];
  v9 = (void *)v6[2];
  v6[2] = v8;

  uint64_t v10 = [(NSString *)self->_etagBeforeCrossZoneMove copyWithZone:a3];
  v11 = (void *)v6[3];
  v6[3] = v10;

  uint64_t v12 = [(NSData *)self->_deletionChangeToken copyWithZone:a3];
  v13 = (void *)v6[1];
  v6[1] = v12;

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0) {
      goto LABEL_24;
    }
    if (self->_knownToServer)
    {
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_24;
      }
    }
    else if (*((unsigned char *)v4 + 32))
    {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_24;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_wasCached)
      {
        if (!*((unsigned char *)v4 + 33)) {
          goto LABEL_24;
        }
        goto LABEL_18;
      }
      if (!*((unsigned char *)v4 + 33)) {
        goto LABEL_18;
      }
    }
LABEL_24:
    char v8 = 0;
    goto LABEL_25;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_24;
  }
LABEL_18:
  etag = self->_etag;
  if ((unint64_t)etag | *((void *)v4 + 2) && !-[NSString isEqual:](etag, "isEqual:")) {
    goto LABEL_24;
  }
  etagBeforeCrossZoneMove = self->_etagBeforeCrossZoneMove;
  if ((unint64_t)etagBeforeCrossZoneMove | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](etagBeforeCrossZoneMove, "isEqual:")) {
      goto LABEL_24;
    }
  }
  deletionChangeToken = self->_deletionChangeToken;
  if ((unint64_t)deletionChangeToken | *((void *)v4 + 1)) {
    char v8 = -[NSData isEqual:](deletionChangeToken, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_25:

  return v8;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_knownToServer;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v4 = 0;
    goto LABEL_6;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v4 = 2654435761 * self->_wasCached;
LABEL_6:
  NSUInteger v5 = v4 ^ v3 ^ [(NSString *)self->_etag hash];
  NSUInteger v6 = [(NSString *)self->_etagBeforeCrossZoneMove hash];
  return v5 ^ v6 ^ [(NSData *)self->_deletionChangeToken hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = a3;
  char v5 = v4[36];
  if (v5)
  {
    self->_knownToServer = v4[32];
    *(unsigned char *)&self->_has |= 1u;
    char v5 = v4[36];
  }
  if ((v5 & 2) != 0)
  {
    self->_wasCached = v4[33];
    *(unsigned char *)&self->_has |= 2u;
  }
  NSUInteger v6 = v4;
  if (*((void *)v4 + 2))
  {
    -[BRFieldCKInfo setEtag:](self, "setEtag:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 3))
  {
    -[BRFieldCKInfo setEtagBeforeCrossZoneMove:](self, "setEtagBeforeCrossZoneMove:");
    uint64_t v4 = v6;
  }
  if (*((void *)v4 + 1))
  {
    -[BRFieldCKInfo setDeletionChangeToken:](self, "setDeletionChangeToken:");
    uint64_t v4 = v6;
  }
}

- (BOOL)knownToServer
{
  return self->_knownToServer;
}

- (BOOL)wasCached
{
  return self->_wasCached;
}

- (NSString)etag
{
  return self->_etag;
}

- (void)setEtag:(id)a3
{
}

- (NSString)etagBeforeCrossZoneMove
{
  return self->_etagBeforeCrossZoneMove;
}

- (void)setEtagBeforeCrossZoneMove:(id)a3
{
}

- (NSData)deletionChangeToken
{
  return self->_deletionChangeToken;
}

- (void)setDeletionChangeToken:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_etagBeforeCrossZoneMove, 0);
  objc_storeStrong((id *)&self->_etag, 0);
  objc_storeStrong((id *)&self->_deletionChangeToken, 0);
}

- (BRFieldCKInfo)initWithRecord:(id)a3
{
  id v4 = a3;
  char v5 = [(BRFieldCKInfo *)self init];
  if (v5)
  {
    NSUInteger v6 = [v4 etag];
    [(BRFieldCKInfo *)v5 setEtag:v6];

    -[BRFieldCKInfo setKnownToServer:](v5, "setKnownToServer:", [v4 isKnownToServer]);
    -[BRFieldCKInfo setWasCached:](v5, "setWasCached:", [v4 wasCached]);
  }

  return v5;
}

- (void)markCrossZoneMoved
{
  uint64_t v3 = [(BRFieldCKInfo *)self etag];
  [(BRFieldCKInfo *)self setEtagBeforeCrossZoneMove:v3];

  [(BRFieldCKInfo *)self setEtag:0];
}

- (void)revertEtagsForOldZoneTombstone
{
  uint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    [(BRFieldCKInfo(BRCItemAdditions) *)self revertEtagsForOldZoneTombstone];
  }

  char v5 = [(BRFieldCKInfo *)self etagBeforeCrossZoneMove];
  [(BRFieldCKInfo *)self setEtag:v5];

  [(BRFieldCKInfo *)self setEtagBeforeCrossZoneMove:0];
}

- (void)clearCrossZoneMoveEtag
{
}

- (void)setCKInfoFieldsInRecord:(id)a3 includeCZMEtag:(BOOL)a4
{
  BOOL v4 = a4;
  id v12 = a3;
  NSUInteger v6 = [(BRFieldCKInfo *)self etag];
  [v12 setEtag:v6];

  objc_msgSend(v12, "setKnownToServer:", -[BRFieldCKInfo knownToServer](self, "knownToServer"));
  objc_msgSend(v12, "setWasCached:", -[BRFieldCKInfo wasCached](self, "wasCached"));
  v7 = [(BRFieldCKInfo *)self etagBeforeCrossZoneMove];

  if (v7 && v4)
  {
    char v8 = [v12 pluginFields];
    if (v8)
    {
      v9 = [v12 pluginFields];
      uint64_t v10 = (void *)[v9 mutableCopy];
    }
    else
    {
      uint64_t v10 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithCapacity:3];
    }

    v11 = [(BRFieldCKInfo *)self etagBeforeCrossZoneMove];
    [v10 setObject:v11 forKeyedSubscript:@"br_etagInPreviousZone"];

    [v12 setPluginFields:v10];
  }
}

- (void)sqliteBind:(sqlite3_stmt *)a3 index:(int)a4
{
  id v6 = [(BRFieldCKInfo *)self data];
  sqlite3_bind_blob(a3, a4, (const void *)[v6 bytes], objc_msgSend(v6, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

+ (id)newFromSqliteValue:(sqlite3_value *)a3
{
  if (sqlite3_value_type(a3) != 4) {
    return 0;
  }
  char v5 = sqlite3_value_blob(a3);
  id v6 = (void *)[objc_alloc(MEMORY[0x263EFF8F8]) initWithBytesNoCopy:v5 length:sqlite3_value_bytes(a3) freeWhenDone:0];
  v7 = (void *)[objc_alloc((Class)a1) initWithData:v6];

  return v7;
}

+ (id)newFromSqliteStatement:(sqlite3_stmt *)a3 atIndex:(int)a4
{
  if (sqlite3_column_type(a3, a4) != 4) {
    return 0;
  }
  v7 = sqlite3_column_blob(a3, a4);
  char v8 = objc_msgSend(objc_alloc(MEMORY[0x263EFF8F8]), "initWithBytesNoCopy:length:freeWhenDone:", v7, sqlite3_column_bytes(a3, a4), 0);
  v9 = (void *)[objc_alloc((Class)a1) initWithData:v8];

  return v9;
}

@end
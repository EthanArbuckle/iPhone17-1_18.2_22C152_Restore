@interface BRFieldContentSignature
+ (unint64_t)localEditCounterFromVersionIdentifier:(id)a3;
- (BOOL)containsLocalEdits;
- (BOOL)contentDiffersWithSignature:(id)a3;
- (BOOL)hasContentSignature;
- (BOOL)hasOldVersionIdentifier;
- (BOOL)hasOnlyLocalEditsOnTopOfSignature:(id)a3;
- (BOOL)hasPopulatedVersionAndSignature;
- (BOOL)hasSize;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEquivalentToSignature:(id)a3;
- (BOOL)isPackage;
- (BOOL)isPendingSignature;
- (BOOL)readFrom:(id)a3;
- (BRFieldContentSignature)initWithLocalVersion:(id)a3;
- (BRFieldContentSignature)initWithLoserEtag:(id)a3;
- (NSData)contentSignature;
- (NSString)description;
- (NSString)oldVersionIdentifier;
- (NSString)versionIdentifier;
- (id)_initWithVersionIdentifier:(id)a3 size:(int64_t)a4 contentSignature:(id)a5;
- (id)_initWithVersionIdentifier:(id)a3 size:(int64_t)a4 oldVersionIdentifier:(id)a5 contentSignature:(id)a6;
- (id)_oldVersionEtag;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryRepresentation;
- (id)equivalentVersions;
- (id)etag;
- (int64_t)size;
- (unint64_t)_localEditCounter;
- (unint64_t)_oldVersionLocalEditCounter;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setContentSignature:(id)a3;
- (void)setHasSize:(BOOL)a3;
- (void)setOldVersionIdentifier:(id)a3;
- (void)setSize:(int64_t)a3;
- (void)setVersionIdentifier:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation BRFieldContentSignature

- (BOOL)contentDiffersWithSignature:(id)a3
{
  id v4 = a3;
  if ([(BRFieldContentSignature *)self isEquivalentToSignature:v4])
  {
    char v5 = 0;
  }
  else if ([(BRFieldContentSignature *)self hasContentSignature] {
         && [v4 hasContentSignature])
  }
  {
    v6 = [(BRFieldContentSignature *)self contentSignature];
    v7 = [v4 contentSignature];
    char v8 = [v6 isEqualToData:v7];

    char v5 = v8 ^ 1;
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (BOOL)hasOnlyLocalEditsOnTopOfSignature:(id)a3
{
  id v6 = a3;
  v7 = [(BRFieldContentSignature *)self etag];
  char v8 = [v6 etag];
  if (v7 == v8
    || ([(BRFieldContentSignature *)self etag],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v6 etag],
        id v4 = objc_claimAutoreleasedReturnValue(),
        [v3 isEqualToString:v4]))
  {
    unint64_t v9 = [(BRFieldContentSignature *)self _localEditCounter];
    unint64_t v10 = [v6 _localEditCounter];
    if (v7 == v8)
    {
    }
    else
    {
    }
    if (v9 > v10)
    {
      BOOL v11 = 1;
      goto LABEL_17;
    }
  }
  else
  {
  }
  if ([(BRFieldContentSignature *)self hasOldVersionIdentifier])
  {
    v12 = [(BRFieldContentSignature *)self _oldVersionEtag];
    v13 = [v6 etag];
    if (v12 == v13
      || ([(BRFieldContentSignature *)self _oldVersionEtag],
          v3 = objc_claimAutoreleasedReturnValue(),
          [v6 etag],
          id v4 = objc_claimAutoreleasedReturnValue(),
          [v3 isEqualToString:v4]))
    {
      unint64_t v14 = [(BRFieldContentSignature *)self _oldVersionLocalEditCounter];
      BOOL v11 = v14 > [v6 _localEditCounter];
      if (v12 == v13)
      {
LABEL_16:

        goto LABEL_17;
      }
    }
    else
    {
      BOOL v11 = 0;
    }

    goto LABEL_16;
  }
  BOOL v11 = 0;
LABEL_17:

  return v11;
}

+ (unint64_t)localEditCounterFromVersionIdentifier:(id)a3
{
  v3 = [a3 componentsSeparatedByString:@";"];
  if ((unint64_t)[v3 count] >= 2)
  {
    char v5 = [v3 objectAtIndex:1];
    unint64_t v4 = [v5 longLongValue];
  }
  else
  {
    unint64_t v4 = 0;
  }

  return v4;
}

- (BOOL)containsLocalEdits
{
  return [(BRFieldContentSignature *)self _localEditCounter] != 0;
}

- (unint64_t)_localEditCounter
{
  v3 = objc_opt_class();
  versionIdentifier = self->_versionIdentifier;
  return [v3 localEditCounterFromVersionIdentifier:versionIdentifier];
}

- (unint64_t)_oldVersionLocalEditCounter
{
  v3 = objc_opt_class();
  oldVersionIdentifier = self->_oldVersionIdentifier;
  return [v3 localEditCounterFromVersionIdentifier:oldVersionIdentifier];
}

- (id)etag
{
  return etagFromVersionIdentifier(self->_versionIdentifier);
}

- (id)_oldVersionEtag
{
  return etagFromVersionIdentifier(self->_oldVersionIdentifier);
}

- (BOOL)isPendingSignature
{
  if ([(NSString *)self->_versionIdentifier length])
  {
    v3 = [(BRFieldContentSignature *)self etag];
    if (v3 || [(BRFieldContentSignature *)self hasOldVersionIdentifier]) {
      LOBYTE(v4) = 0;
    }
    else {
      BOOL v4 = ![(BRFieldContentSignature *)self hasContentSignature];
    }
  }
  else if ([(BRFieldContentSignature *)self hasOldVersionIdentifier])
  {
    LOBYTE(v4) = 0;
  }
  else
  {
    return ![(BRFieldContentSignature *)self hasContentSignature];
  }
  return v4;
}

- (BOOL)hasPopulatedVersionAndSignature
{
  if ([(NSString *)self->_versionIdentifier length]
    || (BOOL v3 = [(BRFieldContentSignature *)self hasOldVersionIdentifier]))
  {
    LOBYTE(v3) = [(BRFieldContentSignature *)self hasContentSignature];
  }
  return v3;
}

- (BOOL)isEquivalentToSignature:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = a3;
  if (!areSignaturesEquivalent(self, v4)) {
    goto LABEL_12;
  }
  if (![(BRFieldContentSignature *)self hasContentSignature]
    || ![v4 hasContentSignature])
  {
    goto LABEL_7;
  }
  char v5 = [(BRFieldContentSignature *)self contentSignature];
  if ((objc_msgSend(v5, "brc_signatureIsPackage") & 1) == 0) {
    goto LABEL_11;
  }
  id v6 = [v4 contentSignature];
  int v7 = objc_msgSend(v6, "brc_signatureIsPackage");

  if (!v7)
  {
LABEL_12:
    BOOL v11 = 0;
    goto LABEL_13;
  }
  char v8 = [(BRFieldContentSignature *)self contentSignature];
  unint64_t v9 = [v4 contentSignature];
  char v10 = [v8 isEqualToData:v9];

  if ((v10 & 1) == 0)
  {
    char v5 = brc_bread_crumbs();
    v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
    {
      int v14 = 138412802;
      v15 = self;
      __int16 v16 = 2112;
      id v17 = v4;
      __int16 v18 = 2112;
      v19 = v5;
      _os_log_fault_impl(&dword_23FA42000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Signatures are equivalent but content is different %@ vs %@%@", (uint8_t *)&v14, 0x20u);
    }

LABEL_11:
    goto LABEL_12;
  }
LABEL_7:
  BOOL v11 = 1;
LABEL_13:

  return v11;
}

- (BRFieldContentSignature)initWithLocalVersion:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)BRFieldContentSignature;
  char v5 = [(BRFieldContentSignature *)&v19 init];
  if (v5)
  {
    id v6 = [v4 oldVersionIdentifier];
    [(BRFieldContentSignature *)v5 setOldVersionIdentifier:v6];

    int v7 = [v4 contentSignature];
    if (objc_msgSend(v7, "brc_signatureIsPendingPlaceHolder"))
    {
      [(BRFieldContentSignature *)v5 setContentSignature:0];
    }
    else
    {
      char v8 = [v4 contentSignature];
      [(BRFieldContentSignature *)v5 setContentSignature:v8];
    }
    unint64_t v9 = [v4 ckInfo];
    char v10 = [v9 etag];
    uint64_t v11 = [v4 localChangeCount];
    v12 = v10;
    v13 = v12;
    int v14 = &stru_26F3822F0;
    if (v12) {
      int v14 = v12;
    }
    v15 = v14;
    __int16 v16 = v15;
    if (v11)
    {
      uint64_t v17 = [(__CFString *)v15 stringByAppendingFormat:@";%llu", v11];

      __int16 v16 = (void *)v17;
    }

    [(BRFieldContentSignature *)v5 setVersionIdentifier:v16];
    -[BRFieldContentSignature setSize:](v5, "setSize:", [v4 size]);
  }

  return v5;
}

- (BRFieldContentSignature)initWithLoserEtag:(id)a3
{
  id v4 = (__CFString *)a3;
  v9.receiver = self;
  v9.super_class = (Class)BRFieldContentSignature;
  char v5 = [(BRFieldContentSignature *)&v9 init];
  if (v5)
  {
    id v6 = &stru_26F3822F0;
    if (v4) {
      id v6 = v4;
    }
    int v7 = v6;
    [(BRFieldContentSignature *)v5 setVersionIdentifier:v7];
  }
  return v5;
}

- (BOOL)isPackage
{
  BOOL v3 = [(BRFieldContentSignature *)self hasContentSignature];
  if (v3)
  {
    id v4 = [(BRFieldContentSignature *)self contentSignature];
    char v5 = objc_msgSend(v4, "brc_signatureIsPackage");

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (id)_initWithVersionIdentifier:(id)a3 size:(int64_t)a4 contentSignature:(id)a5
{
  return [(BRFieldContentSignature *)self _initWithVersionIdentifier:a3 size:a4 oldVersionIdentifier:0 contentSignature:a5];
}

- (id)_initWithVersionIdentifier:(id)a3 size:(int64_t)a4 oldVersionIdentifier:(id)a5 contentSignature:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  v17.receiver = self;
  v17.super_class = (Class)BRFieldContentSignature;
  v13 = [(BRFieldContentSignature *)&v17 init];
  int v14 = v13;
  if (v13)
  {
    [(BRFieldContentSignature *)v13 setOldVersionIdentifier:v11];
    [(BRFieldContentSignature *)v14 setVersionIdentifier:v10];
    [(BRFieldContentSignature *)v14 setSize:a4];
    if (objc_msgSend(v12, "brc_signatureIsPendingPlaceHolder")) {
      id v15 = 0;
    }
    else {
      id v15 = v12;
    }
    [(BRFieldContentSignature *)v14 setContentSignature:v15];
  }

  return v14;
}

- (id)equivalentVersions
{
  BOOL v3 = [(BRFieldContentSignature *)self contentSignature];

  if (v3)
  {
    BOOL v3 = (void *)[objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:4];
    id v4 = objc_opt_class();
    char v5 = [(BRFieldContentSignature *)self versionIdentifier];
    if ([v4 localEditCounterFromVersionIdentifier:v5])
    {
      uint64_t v6 = [(BRFieldContentSignature *)self oldVersionIdentifier];
      if (!v6)
      {

LABEL_19:
        v35 = [BRFieldContentSignature alloc];
        v36 = [(BRFieldContentSignature *)self versionIdentifier];
        id v27 = [(BRFieldContentSignature *)v35 _initWithVersionIdentifier:v36 size:[(BRFieldContentSignature *)self size] contentSignature:0];

        v37 = [BRFieldContentSignature alloc];
        v38 = [(BRFieldContentSignature *)self versionIdentifier];
        id v32 = [(BRFieldContentSignature *)v37 _initWithVersionIdentifier:v38 size:[(BRFieldContentSignature *)self size] oldVersionIdentifier:&stru_26F3822F0 contentSignature:0];

        if (![(BRFieldContentSignature *)self isEqual:v27])
        {
          v39 = [v27 data];
          [v3 addObject:v39];
        }
        if (![(BRFieldContentSignature *)self isEqual:v32])
        {
          v40 = [v32 data];
          [v3 addObject:v40];
        }
        v41 = [BRFieldContentSignature alloc];
        v42 = [(BRFieldContentSignature *)self versionIdentifier];
        int64_t v43 = [(BRFieldContentSignature *)self size];
        v44 = [(BRFieldContentSignature *)self contentSignature];
        id v34 = [(BRFieldContentSignature *)v41 _initWithVersionIdentifier:v42 size:v43 contentSignature:v44];

        v45 = [BRFieldContentSignature alloc];
        v46 = [(BRFieldContentSignature *)self versionIdentifier];
        int64_t v47 = [(BRFieldContentSignature *)self size];
        v48 = [(BRFieldContentSignature *)self contentSignature];
        id v49 = [(BRFieldContentSignature *)v45 _initWithVersionIdentifier:v46 size:v47 oldVersionIdentifier:&stru_26F3822F0 contentSignature:v48];

LABEL_31:
        if (![(BRFieldContentSignature *)self isEqual:v34])
        {
          v62 = [v34 data];
          [v3 addObject:v62];
        }
        if (![(BRFieldContentSignature *)self isEqual:v49])
        {
          v63 = [v49 data];
          [v3 addObject:v63];
        }
        goto LABEL_36;
      }
      int v7 = (void *)v6;
      char v8 = [(BRFieldContentSignature *)self oldVersionIdentifier];
      uint64_t v9 = [v8 length];

      if (!v9) {
        goto LABEL_19;
      }
    }
    else
    {
    }
    id v10 = [(BRFieldContentSignature *)self oldVersionIdentifier];
    uint64_t v11 = [v10 length];

    if (v11)
    {
      id v12 = objc_opt_class();
      v13 = [(BRFieldContentSignature *)self oldVersionIdentifier];
      uint64_t v14 = [v12 localEditCounterFromVersionIdentifier:v13];

      if (v14)
      {
        id v15 = [BRFieldContentSignature alloc];
        __int16 v16 = [(BRFieldContentSignature *)self oldVersionIdentifier];
        id v17 = [(BRFieldContentSignature *)v15 _initWithVersionIdentifier:v16 size:[(BRFieldContentSignature *)self size] contentSignature:0];

        __int16 v18 = [BRFieldContentSignature alloc];
        objc_super v19 = [(BRFieldContentSignature *)self oldVersionIdentifier];
        id v20 = [(BRFieldContentSignature *)v18 _initWithVersionIdentifier:v19 size:[(BRFieldContentSignature *)self size] oldVersionIdentifier:&stru_26F3822F0 contentSignature:0];

        if (![(BRFieldContentSignature *)self isEqual:v17])
        {
          v21 = [v17 data];
          [v3 addObject:v21];
        }
        if (![(BRFieldContentSignature *)self isEqual:v20])
        {
          v22 = [v20 data];
          [v3 addObject:v22];
        }
      }
      v23 = [BRFieldContentSignature alloc];
      v24 = [(BRFieldContentSignature *)self oldVersionIdentifier];
      int64_t v25 = [(BRFieldContentSignature *)self size];
      v26 = [(BRFieldContentSignature *)self contentSignature];
      id v27 = [(BRFieldContentSignature *)v23 _initWithVersionIdentifier:v24 size:v25 contentSignature:v26];

      v28 = [BRFieldContentSignature alloc];
      v29 = [(BRFieldContentSignature *)self oldVersionIdentifier];
      int64_t v30 = [(BRFieldContentSignature *)self size];
      v31 = [(BRFieldContentSignature *)self contentSignature];
      id v32 = [(BRFieldContentSignature *)v28 _initWithVersionIdentifier:v29 size:v30 oldVersionIdentifier:&stru_26F3822F0 contentSignature:v31];

      if (![(BRFieldContentSignature *)self isEqual:v27])
      {
        v33 = [v27 data];
        [v3 addObject:v33];
      }
      if ([(BRFieldContentSignature *)self isEqual:v32]) {
        goto LABEL_37;
      }
      id v34 = [v32 data];
      [v3 addObject:v34];
LABEL_36:

LABEL_37:
      goto LABEL_38;
    }
    uint64_t v50 = [(BRFieldContentSignature *)self oldVersionIdentifier];
    if (!v50
      || (v51 = (void *)v50,
          [(BRFieldContentSignature *)self oldVersionIdentifier],
          v52 = objc_claimAutoreleasedReturnValue(),
          uint64_t v53 = [v52 length],
          v52,
          v51,
          !v53))
    {
      id v27 = [[BRFieldContentSignature alloc] _initWithVersionIdentifier:&stru_26F3822F0 size:[(BRFieldContentSignature *)self size] contentSignature:0];
      id v32 = [[BRFieldContentSignature alloc] _initWithVersionIdentifier:&stru_26F3822F0 size:[(BRFieldContentSignature *)self size] oldVersionIdentifier:&stru_26F3822F0 contentSignature:0];
      if (![(BRFieldContentSignature *)self isEqual:v27])
      {
        v54 = [v27 data];
        [v3 addObject:v54];
      }
      if (![(BRFieldContentSignature *)self isEqual:v32])
      {
        v55 = [v32 data];
        [v3 addObject:v55];
      }
      v56 = [BRFieldContentSignature alloc];
      int64_t v57 = [(BRFieldContentSignature *)self size];
      v58 = [(BRFieldContentSignature *)self contentSignature];
      id v34 = [(BRFieldContentSignature *)v56 _initWithVersionIdentifier:&stru_26F3822F0 size:v57 contentSignature:v58];

      v59 = [BRFieldContentSignature alloc];
      int64_t v60 = [(BRFieldContentSignature *)self size];
      v61 = [(BRFieldContentSignature *)self contentSignature];
      id v49 = [(BRFieldContentSignature *)v59 _initWithVersionIdentifier:&stru_26F3822F0 size:v60 oldVersionIdentifier:&stru_26F3822F0 contentSignature:v61];

      goto LABEL_31;
    }
  }
LABEL_38:
  return v3;
}

- (BOOL)hasContentSignature
{
  return self->_contentSignature != 0;
}

- (BOOL)hasOldVersionIdentifier
{
  return self->_oldVersionIdentifier != 0;
}

- (void)setSize:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_size = a3;
}

- (void)setHasSize:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSize
{
  return *(unsigned char *)&self->_has & 1;
}

- (NSString)description
{
  BOOL v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)BRFieldContentSignature;
  id v4 = [(BRFieldContentSignature *)&v8 description];
  char v5 = [(BRFieldContentSignature *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return (NSString *)v6;
}

- (id)dictionaryRepresentation
{
  BOOL v3 = [MEMORY[0x263EFF9A0] dictionary];
  id v4 = v3;
  versionIdentifier = self->_versionIdentifier;
  if (versionIdentifier) {
    [v3 setObject:versionIdentifier forKey:@"versionIdentifier"];
  }
  contentSignature = self->_contentSignature;
  if (contentSignature) {
    [v4 setObject:contentSignature forKey:@"contentSignature"];
  }
  oldVersionIdentifier = self->_oldVersionIdentifier;
  if (oldVersionIdentifier) {
    [v4 setObject:oldVersionIdentifier forKey:@"oldVersionIdentifier"];
  }
  if (*(unsigned char *)&self->_has)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_size];
    [v4 setObject:v8 forKey:@"size"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return BRFieldContentSignatureReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (!self->_versionIdentifier) {
    -[BRFieldContentSignature writeTo:]();
  }
  id v6 = v4;
  PBDataWriterWriteStringField();
  if (self->_contentSignature) {
    PBDataWriterWriteDataField();
  }
  if (self->_oldVersionIdentifier) {
    PBDataWriterWriteStringField();
  }
  char v5 = v6;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt64Field();
    char v5 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  [v4 setVersionIdentifier:self->_versionIdentifier];
  if (self->_contentSignature) {
    objc_msgSend(v4, "setContentSignature:");
  }
  if (self->_oldVersionIdentifier) {
    objc_msgSend(v4, "setOldVersionIdentifier:");
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_size;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_versionIdentifier copyWithZone:a3];
  int v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSData *)self->_contentSignature copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v8;

  uint64_t v10 = [(NSString *)self->_oldVersionIdentifier copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_size;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  versionIdentifier = self->_versionIdentifier;
  if ((unint64_t)versionIdentifier | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](versionIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  contentSignature = self->_contentSignature;
  if ((unint64_t)contentSignature | *((void *)v4 + 2))
  {
    if (!-[NSData isEqual:](contentSignature, "isEqual:")) {
      goto LABEL_12;
    }
  }
  oldVersionIdentifier = self->_oldVersionIdentifier;
  if ((unint64_t)oldVersionIdentifier | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](oldVersionIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_size == *((void *)v4 + 1))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_versionIdentifier hash];
  uint64_t v4 = [(NSData *)self->_contentSignature hash];
  NSUInteger v5 = [(NSString *)self->_oldVersionIdentifier hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v6 = 2654435761 * self->_size;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v4 = (int64_t *)a3;
  NSUInteger v5 = v4;
  if (v4[4])
  {
    -[BRFieldContentSignature setVersionIdentifier:](self, "setVersionIdentifier:");
    uint64_t v4 = v5;
  }
  if (v4[2])
  {
    -[BRFieldContentSignature setContentSignature:](self, "setContentSignature:");
    uint64_t v4 = v5;
  }
  if (v4[3])
  {
    -[BRFieldContentSignature setOldVersionIdentifier:](self, "setOldVersionIdentifier:");
    uint64_t v4 = v5;
  }
  if (v4[5])
  {
    self->_size = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
}

- (NSString)versionIdentifier
{
  return self->_versionIdentifier;
}

- (void)setVersionIdentifier:(id)a3
{
}

- (NSData)contentSignature
{
  return self->_contentSignature;
}

- (void)setContentSignature:(id)a3
{
}

- (NSString)oldVersionIdentifier
{
  return self->_oldVersionIdentifier;
}

- (void)setOldVersionIdentifier:(id)a3
{
}

- (int64_t)size
{
  return self->_size;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_versionIdentifier, 0);
  objc_storeStrong((id *)&self->_oldVersionIdentifier, 0);
  objc_storeStrong((id *)&self->_contentSignature, 0);
}

- (void)writeTo:.cold.1()
{
  __assert_rtn("-[BRFieldContentSignature writeTo:]", "BRFieldContentSignature.m", 126, "nil != self->_versionIdentifier");
}

@end
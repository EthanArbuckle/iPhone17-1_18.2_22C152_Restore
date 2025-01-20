@interface UAFSchemaUAFAsset
- (BOOL)hasAssetDownloadSizeInBytes;
- (BOOL)hasAssetLocale;
- (BOOL)hasAssetName;
- (BOOL)hasAssetPath;
- (BOOL)hasAssetSizeOnDisk;
- (BOOL)hasAssetSource;
- (BOOL)hasAssetSpecifier;
- (BOOL)hasAssetUnarchivedSizeInBytes;
- (BOOL)hasAssetVersion;
- (BOOL)hasIsAssetPathValid;
- (BOOL)isAssetPathValid;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)assetName;
- (NSString)assetPath;
- (NSString)assetSpecifier;
- (NSString)assetVersion;
- (UAFSchemaUAFAsset)initWithDictionary:(id)a3;
- (UAFSchemaUAFAsset)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)assetLocale;
- (int)assetSource;
- (unint64_t)assetDownloadSizeInBytes;
- (unint64_t)assetUnarchivedSizeInBytes;
- (unint64_t)hash;
- (unsigned)assetSizeOnDisk;
- (void)deleteAssetDownloadSizeInBytes;
- (void)deleteAssetLocale;
- (void)deleteAssetName;
- (void)deleteAssetPath;
- (void)deleteAssetSizeOnDisk;
- (void)deleteAssetSource;
- (void)deleteAssetSpecifier;
- (void)deleteAssetUnarchivedSizeInBytes;
- (void)deleteAssetVersion;
- (void)deleteIsAssetPathValid;
- (void)setAssetDownloadSizeInBytes:(unint64_t)a3;
- (void)setAssetLocale:(int)a3;
- (void)setAssetName:(id)a3;
- (void)setAssetPath:(id)a3;
- (void)setAssetSizeOnDisk:(unsigned int)a3;
- (void)setAssetSource:(int)a3;
- (void)setAssetSpecifier:(id)a3;
- (void)setAssetUnarchivedSizeInBytes:(unint64_t)a3;
- (void)setAssetVersion:(id)a3;
- (void)setHasAssetDownloadSizeInBytes:(BOOL)a3;
- (void)setHasAssetLocale:(BOOL)a3;
- (void)setHasAssetName:(BOOL)a3;
- (void)setHasAssetPath:(BOOL)a3;
- (void)setHasAssetSizeOnDisk:(BOOL)a3;
- (void)setHasAssetSource:(BOOL)a3;
- (void)setHasAssetSpecifier:(BOOL)a3;
- (void)setHasAssetUnarchivedSizeInBytes:(BOOL)a3;
- (void)setHasAssetVersion:(BOOL)a3;
- (void)setHasIsAssetPathValid:(BOOL)a3;
- (void)setIsAssetPathValid:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation UAFSchemaUAFAsset

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetPath, 0);
  objc_storeStrong((id *)&self->_assetVersion, 0);
  objc_storeStrong((id *)&self->_assetSpecifier, 0);
  objc_storeStrong((id *)&self->_assetName, 0);
}

- (void)setHasAssetPath:(BOOL)a3
{
  self->_hasAssetName = a3;
}

- (void)setHasAssetVersion:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAssetSpecifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasAssetName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)assetUnarchivedSizeInBytes
{
  return self->_assetUnarchivedSizeInBytes;
}

- (unint64_t)assetDownloadSizeInBytes
{
  return self->_assetDownloadSizeInBytes;
}

- (void)setAssetPath:(id)a3
{
}

- (NSString)assetPath
{
  return self->_assetPath;
}

- (BOOL)isAssetPathValid
{
  return self->_isAssetPathValid;
}

- (unsigned)assetSizeOnDisk
{
  return self->_assetSizeOnDisk;
}

- (int)assetSource
{
  return self->_assetSource;
}

- (int)assetLocale
{
  return self->_assetLocale;
}

- (void)setAssetVersion:(id)a3
{
}

- (NSString)assetVersion
{
  return self->_assetVersion;
}

- (void)setAssetSpecifier:(id)a3
{
}

- (NSString)assetSpecifier
{
  return self->_assetSpecifier;
}

- (void)setAssetName:(id)a3
{
}

- (NSString)assetName
{
  return self->_assetName;
}

- (UAFSchemaUAFAsset)initWithDictionary:(id)a3
{
  id v4 = a3;
  v24.receiver = self;
  v24.super_class = (Class)UAFSchemaUAFAsset;
  v5 = [(UAFSchemaUAFAsset *)&v24 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"assetName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(UAFSchemaUAFAsset *)v5 setAssetName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"assetSpecifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(UAFSchemaUAFAsset *)v5 setAssetSpecifier:v9];
    }
    v22 = v8;
    v23 = v6;
    v10 = [v4 objectForKeyedSubscript:@"assetVersion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(UAFSchemaUAFAsset *)v5 setAssetVersion:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"assetLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFAsset setAssetLocale:](v5, "setAssetLocale:", [v12 intValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"assetSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFAsset setAssetSource:](v5, "setAssetSource:", [v13 intValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"assetSizeOnDisk"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFAsset setAssetSizeOnDisk:](v5, "setAssetSizeOnDisk:", [v14 unsignedIntValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"isAssetPathValid"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFAsset setIsAssetPathValid:](v5, "setIsAssetPathValid:", [v15 BOOLValue]);
    }
    v16 = [v4 objectForKeyedSubscript:@"assetPath"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v17 = (void *)[v16 copy];
      [(UAFSchemaUAFAsset *)v5 setAssetPath:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"assetDownloadSizeInBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFAsset setAssetDownloadSizeInBytes:](v5, "setAssetDownloadSizeInBytes:", [v18 unsignedLongLongValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"assetUnarchivedSizeInBytes"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[UAFSchemaUAFAsset setAssetUnarchivedSizeInBytes:](v5, "setAssetUnarchivedSizeInBytes:", [v19 unsignedLongLongValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (UAFSchemaUAFAsset)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(UAFSchemaUAFAsset *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(UAFSchemaUAFAsset *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 0x10) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[UAFSchemaUAFAsset assetDownloadSizeInBytes](self, "assetDownloadSizeInBytes"));
    [v3 setObject:v5 forKeyedSubscript:@"assetDownloadSizeInBytes"];

    char has = (char)self->_has;
  }
  if (has)
  {
    unsigned int v6 = [(UAFSchemaUAFAsset *)self assetLocale] - 1;
    if (v6 > 0x3D) {
      uint64_t v7 = @"LOCALE_UNKNOWN_LOCALE";
    }
    else {
      uint64_t v7 = off_1E5EBBE98[v6];
    }
    [v3 setObject:v7 forKeyedSubscript:@"assetLocale"];
  }
  if (self->_assetName)
  {
    v8 = [(UAFSchemaUAFAsset *)self assetName];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"assetName"];
  }
  if (self->_assetPath)
  {
    v10 = [(UAFSchemaUAFAsset *)self assetPath];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"assetPath"];
  }
  char v12 = (char)self->_has;
  if ((v12 & 4) != 0)
  {
    v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[UAFSchemaUAFAsset assetSizeOnDisk](self, "assetSizeOnDisk"));
    [v3 setObject:v13 forKeyedSubscript:@"assetSizeOnDisk"];

    char v12 = (char)self->_has;
  }
  if ((v12 & 2) != 0)
  {
    unsigned int v14 = [(UAFSchemaUAFAsset *)self assetSource] - 1;
    if (v14 > 3) {
      v15 = @"UAFASSETSOURCE_UNKNOWN";
    }
    else {
      v15 = off_1E5EBC088[v14];
    }
    [v3 setObject:v15 forKeyedSubscript:@"assetSource"];
  }
  if (self->_assetSpecifier)
  {
    v16 = [(UAFSchemaUAFAsset *)self assetSpecifier];
    v17 = (void *)[v16 copy];
    [v3 setObject:v17 forKeyedSubscript:@"assetSpecifier"];
  }
  if ((*(unsigned char *)&self->_has & 0x20) != 0)
  {
    v18 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[UAFSchemaUAFAsset assetUnarchivedSizeInBytes](self, "assetUnarchivedSizeInBytes"));
    [v3 setObject:v18 forKeyedSubscript:@"assetUnarchivedSizeInBytes"];
  }
  if (self->_assetVersion)
  {
    v19 = [(UAFSchemaUAFAsset *)self assetVersion];
    v20 = (void *)[v19 copy];
    [v3 setObject:v20 forKeyedSubscript:@"assetVersion"];
  }
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    v21 = objc_msgSend(NSNumber, "numberWithBool:", -[UAFSchemaUAFAsset isAssetPathValid](self, "isAssetPathValid"));
    [v3 setObject:v21 forKeyedSubscript:@"isAssetPathValid"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_assetName hash];
  NSUInteger v4 = [(NSString *)self->_assetSpecifier hash];
  NSUInteger v5 = [(NSString *)self->_assetVersion hash];
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v6 = 2654435761 * self->_assetLocale;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v7 = 2654435761 * self->_assetSource;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v8 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v6 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v7 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v8 = 2654435761 * self->_assetSizeOnDisk;
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    uint64_t v9 = 2654435761 * self->_isAssetPathValid;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v9 = 0;
LABEL_10:
  NSUInteger v10 = [(NSString *)self->_assetPath hash];
  if ((*(unsigned char *)&self->_has & 0x10) != 0)
  {
    unint64_t v11 = 2654435761u * self->_assetDownloadSizeInBytes;
    if ((*(unsigned char *)&self->_has & 0x20) != 0) {
      goto LABEL_12;
    }
LABEL_14:
    unint64_t v12 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
  }
  unint64_t v11 = 0;
  if ((*(unsigned char *)&self->_has & 0x20) == 0) {
    goto LABEL_14;
  }
LABEL_12:
  unint64_t v12 = 2654435761u * self->_assetUnarchivedSizeInBytes;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_37;
  }
  NSUInteger v5 = [(UAFSchemaUAFAsset *)self assetName];
  uint64_t v6 = [v4 assetName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v7 = [(UAFSchemaUAFAsset *)self assetName];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(UAFSchemaUAFAsset *)self assetName];
    NSUInteger v10 = [v4 assetName];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(UAFSchemaUAFAsset *)self assetSpecifier];
  uint64_t v6 = [v4 assetSpecifier];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v12 = [(UAFSchemaUAFAsset *)self assetSpecifier];
  if (v12)
  {
    v13 = (void *)v12;
    unsigned int v14 = [(UAFSchemaUAFAsset *)self assetSpecifier];
    v15 = [v4 assetSpecifier];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  NSUInteger v5 = [(UAFSchemaUAFAsset *)self assetVersion];
  uint64_t v6 = [v4 assetVersion];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_36;
  }
  uint64_t v17 = [(UAFSchemaUAFAsset *)self assetVersion];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(UAFSchemaUAFAsset *)self assetVersion];
    v20 = [v4 assetVersion];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  $079AA5609C6C4560B57F927AEF0D77E6 has = self->_has;
  unsigned int v23 = v4[72];
  if ((*(unsigned char *)&has & 1) != (v23 & 1)) {
    goto LABEL_37;
  }
  if (*(unsigned char *)&has)
  {
    int assetLocale = self->_assetLocale;
    if (assetLocale != [v4 assetLocale]) {
      goto LABEL_37;
    }
    $079AA5609C6C4560B57F927AEF0D77E6 has = self->_has;
    unsigned int v23 = v4[72];
  }
  int v25 = (*(unsigned int *)&has >> 1) & 1;
  if (v25 != ((v23 >> 1) & 1)) {
    goto LABEL_37;
  }
  if (v25)
  {
    int assetSource = self->_assetSource;
    if (assetSource != [v4 assetSource]) {
      goto LABEL_37;
    }
    $079AA5609C6C4560B57F927AEF0D77E6 has = self->_has;
    unsigned int v23 = v4[72];
  }
  int v27 = (*(unsigned int *)&has >> 2) & 1;
  if (v27 != ((v23 >> 2) & 1)) {
    goto LABEL_37;
  }
  if (v27)
  {
    unsigned int assetSizeOnDisk = self->_assetSizeOnDisk;
    if (assetSizeOnDisk != [v4 assetSizeOnDisk]) {
      goto LABEL_37;
    }
    $079AA5609C6C4560B57F927AEF0D77E6 has = self->_has;
    unsigned int v23 = v4[72];
  }
  int v29 = (*(unsigned int *)&has >> 3) & 1;
  if (v29 != ((v23 >> 3) & 1)) {
    goto LABEL_37;
  }
  if (v29)
  {
    int isAssetPathValid = self->_isAssetPathValid;
    if (isAssetPathValid != [v4 isAssetPathValid]) {
      goto LABEL_37;
    }
  }
  NSUInteger v5 = [(UAFSchemaUAFAsset *)self assetPath];
  uint64_t v6 = [v4 assetPath];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_36:

    goto LABEL_37;
  }
  uint64_t v31 = [(UAFSchemaUAFAsset *)self assetPath];
  if (v31)
  {
    v32 = (void *)v31;
    v33 = [(UAFSchemaUAFAsset *)self assetPath];
    v34 = [v4 assetPath];
    int v35 = [v33 isEqual:v34];

    if (!v35) {
      goto LABEL_37;
    }
  }
  else
  {
  }
  $079AA5609C6C4560B57F927AEF0D77E6 v38 = self->_has;
  int v39 = (*(unsigned int *)&v38 >> 4) & 1;
  unsigned int v40 = v4[72];
  if (v39 == ((v40 >> 4) & 1))
  {
    if (v39)
    {
      unint64_t assetDownloadSizeInBytes = self->_assetDownloadSizeInBytes;
      if (assetDownloadSizeInBytes != [v4 assetDownloadSizeInBytes]) {
        goto LABEL_37;
      }
      $079AA5609C6C4560B57F927AEF0D77E6 v38 = self->_has;
      unsigned int v40 = v4[72];
    }
    int v42 = (*(unsigned int *)&v38 >> 5) & 1;
    if (v42 == ((v40 >> 5) & 1))
    {
      if (!v42
        || (unint64_t assetUnarchivedSizeInBytes = self->_assetUnarchivedSizeInBytes,
            assetUnarchivedSizeInBytes == [v4 assetUnarchivedSizeInBytes]))
      {
        BOOL v36 = 1;
        goto LABEL_38;
      }
    }
  }
LABEL_37:
  BOOL v36 = 0;
LABEL_38:

  return v36;
}

- (void)writeTo:(id)a3
{
  id v11 = a3;
  NSUInteger v4 = [(UAFSchemaUAFAsset *)self assetName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  NSUInteger v5 = [(UAFSchemaUAFAsset *)self assetSpecifier];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  uint64_t v6 = [(UAFSchemaUAFAsset *)self assetVersion];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_9:
      if ((has & 4) == 0) {
        goto LABEL_10;
      }
      goto LABEL_23;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_9;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_10:
    if ((has & 8) == 0) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
LABEL_23:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_11:
  }
    PBDataWriterWriteBOOLField();
LABEL_12:
  uint64_t v8 = [(UAFSchemaUAFAsset *)self assetPath];

  if (v8) {
    PBDataWriterWriteStringField();
  }
  char v9 = (char)self->_has;
  NSUInteger v10 = v11;
  if ((v9 & 0x10) != 0)
  {
    PBDataWriterWriteUint64Field();
    NSUInteger v10 = v11;
    char v9 = (char)self->_has;
  }
  if ((v9 & 0x20) != 0)
  {
    PBDataWriterWriteUint64Field();
    NSUInteger v10 = v11;
  }
}

- (BOOL)readFrom:(id)a3
{
  return UAFSchemaUAFAssetReadFrom(self, (uint64_t)a3);
}

- (void)deleteAssetUnarchivedSizeInBytes
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasAssetUnarchivedSizeInBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasAssetUnarchivedSizeInBytes
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setAssetUnarchivedSizeInBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unint64_t assetUnarchivedSizeInBytes = a3;
}

- (void)deleteAssetDownloadSizeInBytes
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasAssetDownloadSizeInBytes:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasAssetDownloadSizeInBytes
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setAssetDownloadSizeInBytes:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unint64_t assetDownloadSizeInBytes = a3;
}

- (void)deleteAssetPath
{
}

- (BOOL)hasAssetPath
{
  return self->_assetPath != 0;
}

- (void)deleteIsAssetPathValid
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasIsAssetPathValid:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasIsAssetPathValid
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setIsAssetPathValid:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int isAssetPathValid = a3;
}

- (void)deleteAssetSizeOnDisk
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAssetSizeOnDisk:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAssetSizeOnDisk
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAssetSizeOnDisk:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_unsigned int assetSizeOnDisk = a3;
}

- (void)deleteAssetSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasAssetSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasAssetSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setAssetSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int assetSource = a3;
}

- (void)deleteAssetLocale
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAssetLocale:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAssetLocale
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAssetLocale:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int assetLocale = a3;
}

- (void)deleteAssetVersion
{
}

- (BOOL)hasAssetVersion
{
  return self->_assetVersion != 0;
}

- (void)deleteAssetSpecifier
{
}

- (BOOL)hasAssetSpecifier
{
  return self->_assetSpecifier != 0;
}

- (void)deleteAssetName
{
}

- (BOOL)hasAssetName
{
  return self->_assetName != 0;
}

@end
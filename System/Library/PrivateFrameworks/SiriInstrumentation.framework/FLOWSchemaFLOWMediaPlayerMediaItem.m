@interface FLOWSchemaFLOWMediaPlayerMediaItem
- (BOOL)hasArtist;
- (BOOL)hasEntityId;
- (BOOL)hasIsAlternative;
- (BOOL)hasIsNlsContainerResult;
- (BOOL)hasIsNlsResult;
- (BOOL)hasMediaType;
- (BOOL)hasTitle;
- (BOOL)isAlternative;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNlsContainerResult;
- (BOOL)isNlsResult;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWMediaPlayerMediaItem)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWMediaPlayerMediaItem)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)artist;
- (NSString)entityId;
- (NSString)title;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mediaType;
- (unint64_t)hash;
- (void)deleteArtist;
- (void)deleteEntityId;
- (void)deleteIsAlternative;
- (void)deleteIsNlsContainerResult;
- (void)deleteIsNlsResult;
- (void)deleteMediaType;
- (void)deleteTitle;
- (void)setArtist:(id)a3;
- (void)setEntityId:(id)a3;
- (void)setHasArtist:(BOOL)a3;
- (void)setHasEntityId:(BOOL)a3;
- (void)setHasIsAlternative:(BOOL)a3;
- (void)setHasIsNlsContainerResult:(BOOL)a3;
- (void)setHasIsNlsResult:(BOOL)a3;
- (void)setHasMediaType:(BOOL)a3;
- (void)setHasTitle:(BOOL)a3;
- (void)setIsAlternative:(BOOL)a3;
- (void)setIsNlsContainerResult:(BOOL)a3;
- (void)setIsNlsResult:(BOOL)a3;
- (void)setMediaType:(int)a3;
- (void)setTitle:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWMediaPlayerMediaItem

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)FLOWSchemaFLOWMediaPlayerMediaItem;
  v5 = [(SISchemaInstrumentationMessage *)&v7 applySensitiveConditionsPolicy:v4];
  if ([v4 isConditionSet:2])
  {
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteTitle];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteArtist];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteEntityId];
  }
  if ([v4 isConditionSet:4])
  {
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteTitle];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteArtist];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteEntityId];
  }
  if ([v4 isConditionSet:5])
  {
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteTitle];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteArtist];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteEntityId];
  }
  if ([v4 isConditionSet:6])
  {
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteTitle];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteArtist];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteEntityId];
  }
  if ([v4 isConditionSet:7])
  {
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteTitle];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteArtist];
    [(FLOWSchemaFLOWMediaPlayerMediaItem *)self deleteEntityId];
  }

  return v5;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_entityId, 0);
  objc_storeStrong((id *)&self->_artist, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

- (void)setHasEntityId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasArtist:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasTitle:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (BOOL)isNlsContainerResult
{
  return self->_isNlsContainerResult;
}

- (BOOL)isNlsResult
{
  return self->_isNlsResult;
}

- (BOOL)isAlternative
{
  return self->_isAlternative;
}

- (void)setEntityId:(id)a3
{
}

- (NSString)entityId
{
  return self->_entityId;
}

- (int)mediaType
{
  return self->_mediaType;
}

- (void)setArtist:(id)a3
{
}

- (NSString)artist
{
  return self->_artist;
}

- (void)setTitle:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (FLOWSchemaFLOWMediaPlayerMediaItem)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)FLOWSchemaFLOWMediaPlayerMediaItem;
  v5 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"title"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v7 = (void *)[v6 copy];
      [(FLOWSchemaFLOWMediaPlayerMediaItem *)v5 setTitle:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"artist"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(FLOWSchemaFLOWMediaPlayerMediaItem *)v5 setArtist:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"mediaType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerMediaItem setMediaType:](v5, "setMediaType:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"entityId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = (void *)[v11 copy];
      [(FLOWSchemaFLOWMediaPlayerMediaItem *)v5 setEntityId:v12];
    }
    v13 = [v4 objectForKeyedSubscript:@"isAlternative"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerMediaItem setIsAlternative:](v5, "setIsAlternative:", [v13 BOOLValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"isNlsResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerMediaItem setIsNlsResult:](v5, "setIsNlsResult:", [v14 BOOLValue]);
    }
    v15 = [v4 objectForKeyedSubscript:@"isNlsContainerResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMediaPlayerMediaItem setIsNlsContainerResult:](v5, "setIsNlsContainerResult:", [v15 BOOLValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWMediaPlayerMediaItem)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self dictionaryRepresentation];
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
  if (self->_artist)
  {
    id v4 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self artist];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"artist"];
  }
  if (self->_entityId)
  {
    v6 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self entityId];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"entityId"];
  }
  char v8 = *(&self->_isNlsContainerResult + 1);
  if ((v8 & 2) != 0)
  {
    v9 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerMediaItem isAlternative](self, "isAlternative"));
    [v3 setObject:v9 forKeyedSubscript:@"isAlternative"];

    char v8 = *(&self->_isNlsContainerResult + 1);
    if ((v8 & 8) == 0)
    {
LABEL_7:
      if ((v8 & 4) == 0) {
        goto LABEL_8;
      }
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isNlsContainerResult + 1) & 8) == 0)
  {
    goto LABEL_7;
  }
  v10 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerMediaItem isNlsContainerResult](self, "isNlsContainerResult"));
  [v3 setObject:v10 forKeyedSubscript:@"isNlsContainerResult"];

  char v8 = *(&self->_isNlsContainerResult + 1);
  if ((v8 & 4) == 0)
  {
LABEL_8:
    if ((v8 & 1) == 0) {
      goto LABEL_17;
    }
    goto LABEL_13;
  }
LABEL_12:
  v11 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMediaPlayerMediaItem isNlsResult](self, "isNlsResult"));
  [v3 setObject:v11 forKeyedSubscript:@"isNlsResult"];

  if (!*(&self->_isNlsContainerResult + 1)) {
    goto LABEL_17;
  }
LABEL_13:
  unsigned int v12 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self mediaType] - 1;
  if (v12 > 0x1B) {
    v13 = @"FLOWMEDIATYPE_UNKNOWN";
  }
  else {
    v13 = off_1E5EBAC18[v12];
  }
  [v3 setObject:v13 forKeyedSubscript:@"mediaType"];
LABEL_17:
  if (self->_title)
  {
    v14 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self title];
    v15 = (void *)[v14 copy];
    [v3 setObject:v15 forKeyedSubscript:@"title"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_title hash];
  NSUInteger v4 = [(NSString *)self->_artist hash];
  if (*(&self->_isNlsContainerResult + 1)) {
    uint64_t v5 = 2654435761 * self->_mediaType;
  }
  else {
    uint64_t v5 = 0;
  }
  NSUInteger v6 = [(NSString *)self->_entityId hash];
  if ((*(&self->_isNlsContainerResult + 1) & 2) == 0)
  {
    uint64_t v7 = 0;
    if ((*(&self->_isNlsContainerResult + 1) & 4) != 0) {
      goto LABEL_6;
    }
LABEL_9:
    uint64_t v8 = 0;
    if ((*(&self->_isNlsContainerResult + 1) & 8) != 0) {
      goto LABEL_7;
    }
LABEL_10:
    uint64_t v9 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
  }
  uint64_t v7 = 2654435761 * self->_isAlternative;
  if ((*(&self->_isNlsContainerResult + 1) & 4) == 0) {
    goto LABEL_9;
  }
LABEL_6:
  uint64_t v8 = 2654435761 * self->_isNlsResult;
  if ((*(&self->_isNlsContainerResult + 1) & 8) == 0) {
    goto LABEL_10;
  }
LABEL_7:
  uint64_t v9 = 2654435761 * self->_isNlsContainerResult;
  return v4 ^ v3 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self title];
  NSUInteger v6 = [v4 title];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self title];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self title];
    v10 = [v4 title];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self artist];
  NSUInteger v6 = [v4 artist];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self artist];
  if (v12)
  {
    v13 = (void *)v12;
    v14 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self artist];
    v15 = [v4 artist];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if (*(&self->_isNlsContainerResult + 1) != (v4[43] & 1)) {
    goto LABEL_20;
  }
  if (*(&self->_isNlsContainerResult + 1))
  {
    int mediaType = self->_mediaType;
    if (mediaType != [v4 mediaType]) {
      goto LABEL_20;
    }
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self entityId];
  NSUInteger v6 = [v4 entityId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v18 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self entityId];
  if (v18)
  {
    v19 = (void *)v18;
    v20 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self entityId];
    v21 = [v4 entityId];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unsigned int v25 = *((unsigned __int8 *)&self->_isNlsContainerResult + 1);
  int v26 = (v25 >> 1) & 1;
  unsigned int v27 = v4[43];
  if (v26 == ((v27 >> 1) & 1))
  {
    if (v26)
    {
      int isAlternative = self->_isAlternative;
      if (isAlternative != [v4 isAlternative]) {
        goto LABEL_20;
      }
      unsigned int v25 = *((unsigned __int8 *)&self->_isNlsContainerResult + 1);
      unsigned int v27 = v4[43];
    }
    int v29 = (v25 >> 2) & 1;
    if (v29 == ((v27 >> 2) & 1))
    {
      if (v29)
      {
        int isNlsResult = self->_isNlsResult;
        if (isNlsResult != [v4 isNlsResult]) {
          goto LABEL_20;
        }
        unsigned int v25 = *((unsigned __int8 *)&self->_isNlsContainerResult + 1);
        unsigned int v27 = v4[43];
      }
      int v31 = (v25 >> 3) & 1;
      if (v31 == ((v27 >> 3) & 1))
      {
        if (!v31
          || (int isNlsContainerResult = self->_isNlsContainerResult,
              isNlsContainerResult == [v4 isNlsContainerResult]))
        {
          BOOL v23 = 1;
          goto LABEL_21;
        }
      }
    }
  }
LABEL_20:
  BOOL v23 = 0;
LABEL_21:

  return v23;
}

- (void)writeTo:(id)a3
{
  id v9 = a3;
  NSUInteger v4 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self title];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  uint64_t v5 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self artist];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  if (*(&self->_isNlsContainerResult + 1)) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v6 = [(FLOWSchemaFLOWMediaPlayerMediaItem *)self entityId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  char v7 = *(&self->_isNlsContainerResult + 1);
  uint64_t v8 = v9;
  if ((v7 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v8 = v9;
    char v7 = *(&self->_isNlsContainerResult + 1);
    if ((v7 & 4) == 0)
    {
LABEL_11:
      if ((v7 & 8) == 0) {
        goto LABEL_13;
      }
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isNlsContainerResult + 1) & 4) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  uint64_t v8 = v9;
  if ((*(&self->_isNlsContainerResult + 1) & 8) != 0)
  {
LABEL_12:
    PBDataWriterWriteBOOLField();
    uint64_t v8 = v9;
  }
LABEL_13:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMediaPlayerMediaItemReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsNlsContainerResult
{
  *(&self->_isNlsContainerResult + 1) &= ~8u;
}

- (void)setHasIsNlsContainerResult:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isNlsContainerResult + 1) = *(&self->_isNlsContainerResult + 1) & 0xF7 | v3;
}

- (BOOL)hasIsNlsContainerResult
{
  return (*((unsigned __int8 *)&self->_isNlsContainerResult + 1) >> 3) & 1;
}

- (void)setIsNlsContainerResult:(BOOL)a3
{
  *(&self->_isNlsContainerResult + 1) |= 8u;
  self->_int isNlsContainerResult = a3;
}

- (void)deleteIsNlsResult
{
  *(&self->_isNlsContainerResult + 1) &= ~4u;
}

- (void)setHasIsNlsResult:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isNlsContainerResult + 1) = *(&self->_isNlsContainerResult + 1) & 0xFB | v3;
}

- (BOOL)hasIsNlsResult
{
  return (*((unsigned __int8 *)&self->_isNlsContainerResult + 1) >> 2) & 1;
}

- (void)setIsNlsResult:(BOOL)a3
{
  *(&self->_isNlsContainerResult + 1) |= 4u;
  self->_int isNlsResult = a3;
}

- (void)deleteIsAlternative
{
  *(&self->_isNlsContainerResult + 1) &= ~2u;
}

- (void)setHasIsAlternative:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isNlsContainerResult + 1) = *(&self->_isNlsContainerResult + 1) & 0xFD | v3;
}

- (BOOL)hasIsAlternative
{
  return (*((unsigned __int8 *)&self->_isNlsContainerResult + 1) >> 1) & 1;
}

- (void)setIsAlternative:(BOOL)a3
{
  *(&self->_isNlsContainerResult + 1) |= 2u;
  self->_int isAlternative = a3;
}

- (void)deleteEntityId
{
}

- (BOOL)hasEntityId
{
  return self->_entityId != 0;
}

- (void)deleteMediaType
{
  *(&self->_isNlsContainerResult + 1) &= ~1u;
}

- (void)setHasMediaType:(BOOL)a3
{
  *(&self->_isNlsContainerResult + 1) = *(&self->_isNlsContainerResult + 1) & 0xFE | a3;
}

- (BOOL)hasMediaType
{
  return *(&self->_isNlsContainerResult + 1);
}

- (void)setMediaType:(int)a3
{
  *(&self->_isNlsContainerResult + 1) |= 1u;
  self->_int mediaType = a3;
}

- (void)deleteArtist
{
}

- (BOOL)hasArtist
{
  return self->_artist != 0;
}

- (void)deleteTitle
{
}

- (BOOL)hasTitle
{
  return self->_title != 0;
}

@end
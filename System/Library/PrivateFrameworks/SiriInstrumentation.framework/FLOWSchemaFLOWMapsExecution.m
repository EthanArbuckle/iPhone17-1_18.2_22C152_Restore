@interface FLOWSchemaFLOWMapsExecution
- (BOOL)hasIsProxySearchResult;
- (BOOL)hasIsSearchAlongRouteRequest;
- (BOOL)hasIsSpellCorrected;
- (BOOL)hasMapsFeature;
- (BOOL)hasMapsQueryLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)isProxySearchResult;
- (BOOL)isSearchAlongRouteRequest;
- (BOOL)isSpellCorrected;
- (BOOL)readFrom:(id)a3;
- (FLOWSchemaFLOWMapsExecution)initWithDictionary:(id)a3;
- (FLOWSchemaFLOWMapsExecution)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)mapsFeature;
- (int)mapsQueryLabel;
- (unint64_t)hash;
- (void)deleteIsProxySearchResult;
- (void)deleteIsSearchAlongRouteRequest;
- (void)deleteIsSpellCorrected;
- (void)deleteMapsFeature;
- (void)deleteMapsQueryLabel;
- (void)setHasIsProxySearchResult:(BOOL)a3;
- (void)setHasIsSearchAlongRouteRequest:(BOOL)a3;
- (void)setHasIsSpellCorrected:(BOOL)a3;
- (void)setHasMapsFeature:(BOOL)a3;
- (void)setHasMapsQueryLabel:(BOOL)a3;
- (void)setIsProxySearchResult:(BOOL)a3;
- (void)setIsSearchAlongRouteRequest:(BOOL)a3;
- (void)setIsSpellCorrected:(BOOL)a3;
- (void)setMapsFeature:(int)a3;
- (void)setMapsQueryLabel:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation FLOWSchemaFLOWMapsExecution

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isSpellCorrected
{
  return self->_isSpellCorrected;
}

- (BOOL)isProxySearchResult
{
  return self->_isProxySearchResult;
}

- (BOOL)isSearchAlongRouteRequest
{
  return self->_isSearchAlongRouteRequest;
}

- (int)mapsQueryLabel
{
  return self->_mapsQueryLabel;
}

- (int)mapsFeature
{
  return self->_mapsFeature;
}

- (FLOWSchemaFLOWMapsExecution)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)FLOWSchemaFLOWMapsExecution;
  v5 = [(FLOWSchemaFLOWMapsExecution *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mapsFeature"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMapsExecution setMapsFeature:](v5, "setMapsFeature:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"mapsQueryLabel"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMapsExecution setMapsQueryLabel:](v5, "setMapsQueryLabel:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isSearchAlongRouteRequest"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMapsExecution setIsSearchAlongRouteRequest:](v5, "setIsSearchAlongRouteRequest:", [v8 BOOLValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"isProxySearchResult"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMapsExecution setIsProxySearchResult:](v5, "setIsProxySearchResult:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isSpellCorrected"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[FLOWSchemaFLOWMapsExecution setIsSpellCorrected:](v5, "setIsSpellCorrected:", [v10 BOOLValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (FLOWSchemaFLOWMapsExecution)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(FLOWSchemaFLOWMapsExecution *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(FLOWSchemaFLOWMapsExecution *)self dictionaryRepresentation];
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
  char v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 8) != 0)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMapsExecution isProxySearchResult](self, "isProxySearchResult"));
    [v3 setObject:v5 forKeyedSubscript:@"isProxySearchResult"];

    char v4 = *(&self->_isSpellCorrected + 1);
    if ((v4 & 4) == 0)
    {
LABEL_3:
      if ((v4 & 0x10) == 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else if ((*(&self->_isSpellCorrected + 1) & 4) == 0)
  {
    goto LABEL_3;
  }
  v6 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMapsExecution isSearchAlongRouteRequest](self, "isSearchAlongRouteRequest"));
  [v3 setObject:v6 forKeyedSubscript:@"isSearchAlongRouteRequest"];

  char v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 0x10) == 0)
  {
LABEL_4:
    if ((v4 & 1) == 0) {
      goto LABEL_5;
    }
LABEL_10:
    unsigned int v8 = [(FLOWSchemaFLOWMapsExecution *)self mapsFeature] - 1;
    if (v8 > 0xB) {
      v9 = @"FLOWMAPSFEATURE_UNKNOWN";
    }
    else {
      v9 = off_1E5EB9E50[v8];
    }
    [v3 setObject:v9 forKeyedSubscript:@"mapsFeature"];
    if ((*(&self->_isSpellCorrected + 1) & 2) == 0) {
      goto LABEL_18;
    }
    goto LABEL_14;
  }
LABEL_9:
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithBool:", -[FLOWSchemaFLOWMapsExecution isSpellCorrected](self, "isSpellCorrected"));
  [v3 setObject:v7 forKeyedSubscript:@"isSpellCorrected"];

  char v4 = *(&self->_isSpellCorrected + 1);
  if (v4) {
    goto LABEL_10;
  }
LABEL_5:
  if ((v4 & 2) != 0)
  {
LABEL_14:
    unsigned int v10 = [(FLOWSchemaFLOWMapsExecution *)self mapsQueryLabel] - 1;
    if (v10 > 0xA) {
      v11 = @"FLOWMAPSQUERYLABEL_UNKNOWN";
    }
    else {
      v11 = off_1E5EB9EB0[v10];
    }
    [v3 setObject:v11 forKeyedSubscript:@"mapsQueryLabel"];
  }
LABEL_18:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isSpellCorrected + 1))
  {
    uint64_t v2 = 2654435761 * self->_mapsFeature;
    if ((*(&self->_isSpellCorrected + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_mapsQueryLabel;
      if ((*(&self->_isSpellCorrected + 1) & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(&self->_isSpellCorrected + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(&self->_isSpellCorrected + 1) & 4) != 0)
  {
LABEL_4:
    uint64_t v4 = 2654435761 * self->_isSearchAlongRouteRequest;
    if ((*(&self->_isSpellCorrected + 1) & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v5 = 0;
    if ((*(&self->_isSpellCorrected + 1) & 0x10) != 0) {
      goto LABEL_6;
    }
LABEL_11:
    uint64_t v6 = 0;
    return v3 ^ v2 ^ v4 ^ v5 ^ v6;
  }
LABEL_9:
  uint64_t v4 = 0;
  if ((*(&self->_isSpellCorrected + 1) & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_isProxySearchResult;
  if ((*(&self->_isSpellCorrected + 1) & 0x10) == 0) {
    goto LABEL_11;
  }
LABEL_6:
  uint64_t v6 = 2654435761 * self->_isSpellCorrected;
  return v3 ^ v2 ^ v4 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
  unsigned int v6 = v4[19];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (v5)
  {
    int mapsFeature = self->_mapsFeature;
    if (mapsFeature != [v4 mapsFeature]) {
      goto LABEL_22;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
    unsigned int v6 = v4[19];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_22;
  }
  if (v8)
  {
    int mapsQueryLabel = self->_mapsQueryLabel;
    if (mapsQueryLabel != [v4 mapsQueryLabel]) {
      goto LABEL_22;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
    unsigned int v6 = v4[19];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_22;
  }
  if (v10)
  {
    int isSearchAlongRouteRequest = self->_isSearchAlongRouteRequest;
    if (isSearchAlongRouteRequest != [v4 isSearchAlongRouteRequest]) {
      goto LABEL_22;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
    unsigned int v6 = v4[19];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_22;
  }
  if (v12)
  {
    int isProxySearchResult = self->_isProxySearchResult;
    if (isProxySearchResult == [v4 isProxySearchResult])
    {
      unsigned int v5 = *((unsigned __int8 *)&self->_isSpellCorrected + 1);
      unsigned int v6 = v4[19];
      goto LABEL_18;
    }
LABEL_22:
    BOOL v16 = 0;
    goto LABEL_23;
  }
LABEL_18:
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_22;
  }
  if (v14)
  {
    int isSpellCorrected = self->_isSpellCorrected;
    if (isSpellCorrected != [v4 isSpellCorrected]) {
      goto LABEL_22;
    }
  }
  BOOL v16 = 1;
LABEL_23:

  return v16;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char v4 = *(&self->_isSpellCorrected + 1);
  if (v4)
  {
    PBDataWriterWriteInt32Field();
    char v4 = *(&self->_isSpellCorrected + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_12;
    }
  }
  else if ((*(&self->_isSpellCorrected + 1) & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_13;
  }
LABEL_12:
  PBDataWriterWriteBOOLField();
  char v4 = *(&self->_isSpellCorrected + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_13:
  PBDataWriterWriteBOOLField();
  if ((*(&self->_isSpellCorrected + 1) & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
}

- (BOOL)readFrom:(id)a3
{
  return FLOWSchemaFLOWMapsExecutionReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsSpellCorrected
{
  *(&self->_isSpellCorrected + 1) &= ~0x10u;
}

- (void)setHasIsSpellCorrected:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xEF | v3;
}

- (BOOL)hasIsSpellCorrected
{
  return (*((unsigned __int8 *)&self->_isSpellCorrected + 1) >> 4) & 1;
}

- (void)setIsSpellCorrected:(BOOL)a3
{
  *(&self->_isSpellCorrected + 1) |= 0x10u;
  self->_int isSpellCorrected = a3;
}

- (void)deleteIsProxySearchResult
{
  *(&self->_isSpellCorrected + 1) &= ~8u;
}

- (void)setHasIsProxySearchResult:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xF7 | v3;
}

- (BOOL)hasIsProxySearchResult
{
  return (*((unsigned __int8 *)&self->_isSpellCorrected + 1) >> 3) & 1;
}

- (void)setIsProxySearchResult:(BOOL)a3
{
  *(&self->_isSpellCorrected + 1) |= 8u;
  self->_int isProxySearchResult = a3;
}

- (void)deleteIsSearchAlongRouteRequest
{
  *(&self->_isSpellCorrected + 1) &= ~4u;
}

- (void)setHasIsSearchAlongRouteRequest:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xFB | v3;
}

- (BOOL)hasIsSearchAlongRouteRequest
{
  return (*((unsigned __int8 *)&self->_isSpellCorrected + 1) >> 2) & 1;
}

- (void)setIsSearchAlongRouteRequest:(BOOL)a3
{
  *(&self->_isSpellCorrected + 1) |= 4u;
  self->_int isSearchAlongRouteRequest = a3;
}

- (void)deleteMapsQueryLabel
{
  *(&self->_isSpellCorrected + 1) &= ~2u;
}

- (void)setHasMapsQueryLabel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xFD | v3;
}

- (BOOL)hasMapsQueryLabel
{
  return (*((unsigned __int8 *)&self->_isSpellCorrected + 1) >> 1) & 1;
}

- (void)setMapsQueryLabel:(int)a3
{
  *(&self->_isSpellCorrected + 1) |= 2u;
  self->_int mapsQueryLabel = a3;
}

- (void)deleteMapsFeature
{
  *(&self->_isSpellCorrected + 1) &= ~1u;
}

- (void)setHasMapsFeature:(BOOL)a3
{
  *(&self->_isSpellCorrected + 1) = *(&self->_isSpellCorrected + 1) & 0xFE | a3;
}

- (BOOL)hasMapsFeature
{
  return *(&self->_isSpellCorrected + 1);
}

- (void)setMapsFeature:(int)a3
{
  *(&self->_isSpellCorrected + 1) |= 1u;
  self->_int mapsFeature = a3;
}

@end
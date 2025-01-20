@interface INFERENCESchemaINFERENCEContactHandleSignalSet
- (BOOL)hasHistoryStats;
- (BOOL)hasIsAllowedType;
- (BOOL)hasIsFaceTimeable;
- (BOOL)hasIsFavorite;
- (BOOL)hasIsNotFaceTimeable;
- (BOOL)hasIsPartialQueryValueMatch;
- (BOOL)hasIsPreferredType;
- (BOOL)hasIsQueryExactMatch;
- (BOOL)hasIsQueryMatch;
- (BOOL)hasIsRecentInAnyGroup;
- (BOOL)hasIsRecentInSameGroup;
- (BOOL)hasIsSuggestedHandle;
- (BOOL)isAllowedType;
- (BOOL)isEqual:(id)a3;
- (BOOL)isFaceTimeable;
- (BOOL)isFavorite;
- (BOOL)isNotFaceTimeable;
- (BOOL)isPartialQueryValueMatch;
- (BOOL)isPreferredType;
- (BOOL)isQueryExactMatch;
- (BOOL)isQueryMatch;
- (BOOL)isRecentInAnyGroup;
- (BOOL)isRecentInSameGroup;
- (BOOL)isSuggestedHandle;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEContactHandleSignalSet)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEContactHandleSignalSet)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStats;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteHistoryStats;
- (void)deleteIsAllowedType;
- (void)deleteIsFaceTimeable;
- (void)deleteIsFavorite;
- (void)deleteIsNotFaceTimeable;
- (void)deleteIsPartialQueryValueMatch;
- (void)deleteIsPreferredType;
- (void)deleteIsQueryExactMatch;
- (void)deleteIsQueryMatch;
- (void)deleteIsRecentInAnyGroup;
- (void)deleteIsRecentInSameGroup;
- (void)deleteIsSuggestedHandle;
- (void)setHasHistoryStats:(BOOL)a3;
- (void)setHasIsAllowedType:(BOOL)a3;
- (void)setHasIsFaceTimeable:(BOOL)a3;
- (void)setHasIsFavorite:(BOOL)a3;
- (void)setHasIsNotFaceTimeable:(BOOL)a3;
- (void)setHasIsPartialQueryValueMatch:(BOOL)a3;
- (void)setHasIsPreferredType:(BOOL)a3;
- (void)setHasIsQueryExactMatch:(BOOL)a3;
- (void)setHasIsQueryMatch:(BOOL)a3;
- (void)setHasIsRecentInAnyGroup:(BOOL)a3;
- (void)setHasIsRecentInSameGroup:(BOOL)a3;
- (void)setHasIsSuggestedHandle:(BOOL)a3;
- (void)setHistoryStats:(id)a3;
- (void)setIsAllowedType:(BOOL)a3;
- (void)setIsFaceTimeable:(BOOL)a3;
- (void)setIsFavorite:(BOOL)a3;
- (void)setIsNotFaceTimeable:(BOOL)a3;
- (void)setIsPartialQueryValueMatch:(BOOL)a3;
- (void)setIsPreferredType:(BOOL)a3;
- (void)setIsQueryExactMatch:(BOOL)a3;
- (void)setIsQueryMatch:(BOOL)a3;
- (void)setIsRecentInAnyGroup:(BOOL)a3;
- (void)setIsRecentInSameGroup:(BOOL)a3;
- (void)setIsSuggestedHandle:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEContactHandleSignalSet

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCEContactHandleSignalSet;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self historyStats];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self deleteHistoryStats];
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
}

- (void)setHasHistoryStats:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (BOOL)isNotFaceTimeable
{
  return self->_isNotFaceTimeable;
}

- (BOOL)isFaceTimeable
{
  return self->_isFaceTimeable;
}

- (BOOL)isAllowedType
{
  return self->_isAllowedType;
}

- (BOOL)isPreferredType
{
  return self->_isPreferredType;
}

- (BOOL)isRecentInSameGroup
{
  return self->_isRecentInSameGroup;
}

- (BOOL)isRecentInAnyGroup
{
  return self->_isRecentInAnyGroup;
}

- (void)setHistoryStats:(id)a3
{
}

- (INFERENCESchemaINFERENCEPrivatizedHistoryStats)historyStats
{
  return self->_historyStats;
}

- (BOOL)isPartialQueryValueMatch
{
  return self->_isPartialQueryValueMatch;
}

- (BOOL)isQueryMatch
{
  return self->_isQueryMatch;
}

- (BOOL)isQueryExactMatch
{
  return self->_isQueryExactMatch;
}

- (BOOL)isFavorite
{
  return self->_isFavorite;
}

- (BOOL)isSuggestedHandle
{
  return self->_isSuggestedHandle;
}

- (INFERENCESchemaINFERENCEContactHandleSignalSet)initWithDictionary:(id)a3
{
  id v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)INFERENCESchemaINFERENCEContactHandleSignalSet;
  v5 = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)&v27 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isSuggestedHandle"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsSuggestedHandle:](v5, "setIsSuggestedHandle:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isFavorite"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsFavorite:](v5, "setIsFavorite:", [v7 BOOLValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"isQueryExactMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsQueryExactMatch:](v5, "setIsQueryExactMatch:", [v8 BOOLValue]);
    }
    objc_super v9 = [v4 objectForKeyedSubscript:@"isQueryMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsQueryMatch:](v5, "setIsQueryMatch:", [v9 BOOLValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"isPartialQueryValueMatch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsPartialQueryValueMatch:](v5, "setIsPartialQueryValueMatch:", [v10 BOOLValue]);
    }
    v23 = v10;
    uint64_t v11 = [v4 objectForKeyedSubscript:@"historyStats"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v12 = [[INFERENCESchemaINFERENCEPrivatizedHistoryStats alloc] initWithDictionary:v11];
      [(INFERENCESchemaINFERENCEContactHandleSignalSet *)v5 setHistoryStats:v12];
    }
    v22 = (void *)v11;
    v13 = [v4 objectForKeyedSubscript:@"isRecentInAnyGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsRecentInAnyGroup:](v5, "setIsRecentInAnyGroup:", [v13 BOOLValue]);
    }
    v14 = [v4 objectForKeyedSubscript:@"isRecentInSameGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsRecentInSameGroup:](v5, "setIsRecentInSameGroup:", [v14 BOOLValue]);
    }
    v26 = v6;
    v15 = [v4 objectForKeyedSubscript:@"isPreferredType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsPreferredType:](v5, "setIsPreferredType:", [v15 BOOLValue]);
    }
    v24 = v9;
    v25 = v7;
    v16 = [v4 objectForKeyedSubscript:@"isAllowedType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsAllowedType:](v5, "setIsAllowedType:", [v16 BOOLValue]);
    }
    v17 = v8;
    v18 = [v4 objectForKeyedSubscript:@"isFaceTimeable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsFaceTimeable:](v5, "setIsFaceTimeable:", [v18 BOOLValue]);
    }
    v19 = [v4 objectForKeyedSubscript:@"isNotFaceTimeable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactHandleSignalSet setIsNotFaceTimeable:](v5, "setIsNotFaceTimeable:", [v19 BOOLValue]);
    }
    v20 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEContactHandleSignalSet)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self dictionaryRepresentation];
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
  if (self->_historyStats)
  {
    id v4 = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self historyStats];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"historyStats"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"historyStats"];
    }
  }
  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x100) != 0)
  {
    v10 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isAllowedType](self, "isAllowedType"));
    [v3 setObject:v10 forKeyedSubscript:@"isAllowedType"];

    __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
    if ((v7 & 0x200) == 0)
    {
LABEL_8:
      if ((v7 & 2) == 0) {
        goto LABEL_9;
      }
      goto LABEL_23;
    }
  }
  else if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x200) == 0)
  {
    goto LABEL_8;
  }
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isFaceTimeable](self, "isFaceTimeable"));
  [v3 setObject:v11 forKeyedSubscript:@"isFaceTimeable"];

  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 2) == 0)
  {
LABEL_9:
    if ((v7 & 0x400) == 0) {
      goto LABEL_10;
    }
    goto LABEL_24;
  }
LABEL_23:
  v12 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isFavorite](self, "isFavorite"));
  [v3 setObject:v12 forKeyedSubscript:@"isFavorite"];

  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x400) == 0)
  {
LABEL_10:
    if ((v7 & 0x10) == 0) {
      goto LABEL_11;
    }
    goto LABEL_25;
  }
LABEL_24:
  v13 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isNotFaceTimeable](self, "isNotFaceTimeable"));
  [v3 setObject:v13 forKeyedSubscript:@"isNotFaceTimeable"];

  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x10) == 0)
  {
LABEL_11:
    if ((v7 & 0x80) == 0) {
      goto LABEL_12;
    }
    goto LABEL_26;
  }
LABEL_25:
  v14 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isPartialQueryValueMatch](self, "isPartialQueryValueMatch"));
  [v3 setObject:v14 forKeyedSubscript:@"isPartialQueryValueMatch"];

  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x80) == 0)
  {
LABEL_12:
    if ((v7 & 4) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  v15 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isPreferredType](self, "isPreferredType"));
  [v3 setObject:v15 forKeyedSubscript:@"isPreferredType"];

  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 4) == 0)
  {
LABEL_13:
    if ((v7 & 8) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  v16 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isQueryExactMatch](self, "isQueryExactMatch"));
  [v3 setObject:v16 forKeyedSubscript:@"isQueryExactMatch"];

  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 8) == 0)
  {
LABEL_14:
    if ((v7 & 0x20) == 0) {
      goto LABEL_15;
    }
    goto LABEL_29;
  }
LABEL_28:
  v17 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isQueryMatch](self, "isQueryMatch"));
  [v3 setObject:v17 forKeyedSubscript:@"isQueryMatch"];

  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x20) == 0)
  {
LABEL_15:
    if ((v7 & 0x40) == 0) {
      goto LABEL_16;
    }
    goto LABEL_30;
  }
LABEL_29:
  v18 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isRecentInAnyGroup](self, "isRecentInAnyGroup"));
  [v3 setObject:v18 forKeyedSubscript:@"isRecentInAnyGroup"];

  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x40) == 0)
  {
LABEL_16:
    if ((v7 & 1) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
LABEL_30:
  v19 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isRecentInSameGroup](self, "isRecentInSameGroup"));
  [v3 setObject:v19 forKeyedSubscript:@"isRecentInSameGroup"];

  if (*(_WORD *)(&self->_isNotFaceTimeable + 1))
  {
LABEL_17:
    v8 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactHandleSignalSet isSuggestedHandle](self, "isSuggestedHandle"));
    [v3 setObject:v8 forKeyedSubscript:@"isSuggestedHandle"];
  }
LABEL_18:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  __int16 v3 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if (v3)
  {
    uint64_t v4 = 2654435761 * self->_isSuggestedHandle;
    if ((v3 & 2) != 0)
    {
LABEL_3:
      uint64_t v5 = 2654435761 * self->_isFavorite;
      if ((v3 & 4) != 0) {
        goto LABEL_4;
      }
      goto LABEL_9;
    }
  }
  else
  {
    uint64_t v4 = 0;
    if ((v3 & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v5 = 0;
  if ((v3 & 4) != 0)
  {
LABEL_4:
    uint64_t v6 = 2654435761 * self->_isQueryExactMatch;
    if ((v3 & 8) != 0) {
      goto LABEL_5;
    }
LABEL_10:
    uint64_t v7 = 0;
    if ((v3 & 0x10) != 0) {
      goto LABEL_6;
    }
    goto LABEL_11;
  }
LABEL_9:
  uint64_t v6 = 0;
  if ((v3 & 8) == 0) {
    goto LABEL_10;
  }
LABEL_5:
  uint64_t v7 = 2654435761 * self->_isQueryMatch;
  if ((v3 & 0x10) != 0)
  {
LABEL_6:
    uint64_t v8 = 2654435761 * self->_isPartialQueryValueMatch;
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v8 = 0;
LABEL_12:
  unint64_t v9 = [(INFERENCESchemaINFERENCEPrivatizedHistoryStats *)self->_historyStats hash];
  __int16 v10 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v10 & 0x20) != 0)
  {
    uint64_t v11 = 2654435761 * self->_isRecentInAnyGroup;
    if ((v10 & 0x40) != 0)
    {
LABEL_14:
      uint64_t v12 = 2654435761 * self->_isRecentInSameGroup;
      if ((v10 & 0x80) != 0) {
        goto LABEL_15;
      }
      goto LABEL_21;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((v10 & 0x40) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v12 = 0;
  if ((v10 & 0x80) != 0)
  {
LABEL_15:
    uint64_t v13 = 2654435761 * self->_isPreferredType;
    if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x100) != 0) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }
LABEL_21:
  uint64_t v13 = 0;
  if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x100) != 0)
  {
LABEL_16:
    uint64_t v14 = 2654435761 * self->_isAllowedType;
    if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x200) != 0) {
      goto LABEL_17;
    }
LABEL_23:
    uint64_t v15 = 0;
    if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x400) != 0) {
      goto LABEL_18;
    }
LABEL_24:
    uint64_t v16 = 0;
    return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v9;
  }
LABEL_22:
  uint64_t v14 = 0;
  if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x200) == 0) {
    goto LABEL_23;
  }
LABEL_17:
  uint64_t v15 = 2654435761 * self->_isFaceTimeable;
  if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x400) == 0) {
    goto LABEL_24;
  }
LABEL_18:
  uint64_t v16 = 2654435761 * self->_isNotFaceTimeable;
  return v5 ^ v4 ^ v6 ^ v7 ^ v8 ^ v11 ^ v12 ^ v13 ^ v14 ^ v15 ^ v16 ^ v9;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int16 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_51;
  }
  unsigned int v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
  unsigned int v6 = v4[15];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_51;
  }
  if (v5)
  {
    int isSuggestedHandle = self->_isSuggestedHandle;
    if (isSuggestedHandle != [v4 isSuggestedHandle]) {
      goto LABEL_51;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    unsigned int v6 = v4[15];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_51;
  }
  if (v8)
  {
    int isFavorite = self->_isFavorite;
    if (isFavorite != [v4 isFavorite]) {
      goto LABEL_51;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    unsigned int v6 = v4[15];
  }
  int v10 = (v5 >> 2) & 1;
  if (v10 != ((v6 >> 2) & 1)) {
    goto LABEL_51;
  }
  if (v10)
  {
    int isQueryExactMatch = self->_isQueryExactMatch;
    if (isQueryExactMatch != [v4 isQueryExactMatch]) {
      goto LABEL_51;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    unsigned int v6 = v4[15];
  }
  int v12 = (v5 >> 3) & 1;
  if (v12 != ((v6 >> 3) & 1)) {
    goto LABEL_51;
  }
  if (v12)
  {
    int isQueryMatch = self->_isQueryMatch;
    if (isQueryMatch != [v4 isQueryMatch]) {
      goto LABEL_51;
    }
    unsigned int v5 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    unsigned int v6 = v4[15];
  }
  int v14 = (v5 >> 4) & 1;
  if (v14 != ((v6 >> 4) & 1)) {
    goto LABEL_51;
  }
  if (v14)
  {
    int isPartialQueryValueMatch = self->_isPartialQueryValueMatch;
    if (isPartialQueryValueMatch != [v4 isPartialQueryValueMatch]) {
      goto LABEL_51;
    }
  }
  uint64_t v16 = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self historyStats];
  v17 = [v4 historyStats];
  v18 = v17;
  if ((v16 == 0) == (v17 != 0))
  {

    goto LABEL_51;
  }
  uint64_t v19 = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self historyStats];
  if (v19)
  {
    v20 = (void *)v19;
    v21 = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self historyStats];
    v22 = [v4 historyStats];
    int v23 = [v21 isEqual:v22];

    if (!v23) {
      goto LABEL_51;
    }
  }
  else
  {
  }
  unsigned int v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
  int v25 = (v24 >> 5) & 1;
  unsigned int v26 = v4[15];
  if (v25 != ((v26 >> 5) & 1))
  {
LABEL_51:
    BOOL v38 = 0;
    goto LABEL_52;
  }
  if (v25)
  {
    int isRecentInAnyGroup = self->_isRecentInAnyGroup;
    if (isRecentInAnyGroup != [v4 isRecentInAnyGroup]) {
      goto LABEL_51;
    }
    unsigned int v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    unsigned int v26 = v4[15];
  }
  int v28 = (v24 >> 6) & 1;
  if (v28 != ((v26 >> 6) & 1)) {
    goto LABEL_51;
  }
  if (v28)
  {
    int isRecentInSameGroup = self->_isRecentInSameGroup;
    if (isRecentInSameGroup != [v4 isRecentInSameGroup]) {
      goto LABEL_51;
    }
    unsigned int v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    unsigned int v26 = v4[15];
  }
  int v30 = (v24 >> 7) & 1;
  if (v30 != ((v26 >> 7) & 1)) {
    goto LABEL_51;
  }
  if (v30)
  {
    int isPreferredType = self->_isPreferredType;
    if (isPreferredType != [v4 isPreferredType]) {
      goto LABEL_51;
    }
    unsigned int v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    unsigned int v26 = v4[15];
  }
  int v32 = (v24 >> 8) & 1;
  if (v32 != ((v26 >> 8) & 1)) {
    goto LABEL_51;
  }
  if (v32)
  {
    int isAllowedType = self->_isAllowedType;
    if (isAllowedType != [v4 isAllowedType]) {
      goto LABEL_51;
    }
    unsigned int v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
    unsigned int v26 = v4[15];
  }
  int v34 = (v24 >> 9) & 1;
  if (v34 != ((v26 >> 9) & 1)) {
    goto LABEL_51;
  }
  if (v34)
  {
    int isFaceTimeable = self->_isFaceTimeable;
    if (isFaceTimeable == [v4 isFaceTimeable])
    {
      unsigned int v24 = *(unsigned __int16 *)(&self->_isNotFaceTimeable + 1);
      unsigned int v26 = v4[15];
      goto LABEL_47;
    }
    goto LABEL_51;
  }
LABEL_47:
  int v36 = (v24 >> 10) & 1;
  if (v36 != ((v26 >> 10) & 1)) {
    goto LABEL_51;
  }
  if (v36)
  {
    int isNotFaceTimeable = self->_isNotFaceTimeable;
    if (isNotFaceTimeable != [v4 isNotFaceTimeable]) {
      goto LABEL_51;
    }
  }
  BOOL v38 = 1;
LABEL_52:

  return v38;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  __int16 v4 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if (v4)
  {
    PBDataWriterWriteBOOLField();
    __int16 v4 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
    if ((v4 & 2) == 0)
    {
LABEL_3:
      if ((v4 & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_21;
    }
  }
  else if ((v4 & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteBOOLField();
  __int16 v4 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v4 & 4) == 0)
  {
LABEL_4:
    if ((v4 & 8) == 0) {
      goto LABEL_5;
    }
    goto LABEL_22;
  }
LABEL_21:
  PBDataWriterWriteBOOLField();
  __int16 v4 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v4 & 8) == 0)
  {
LABEL_5:
    if ((v4 & 0x10) == 0) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
LABEL_22:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x10) != 0) {
LABEL_6:
  }
    PBDataWriterWriteBOOLField();
LABEL_7:
  unsigned int v5 = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self historyStats];

  if (v5)
  {
    unsigned int v6 = [(INFERENCESchemaINFERENCEContactHandleSignalSet *)self historyStats];
    PBDataWriterWriteSubmessage();
  }
  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x20) != 0)
  {
    PBDataWriterWriteBOOLField();
    __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
    if ((v7 & 0x40) == 0)
    {
LABEL_11:
      if ((v7 & 0x80) == 0) {
        goto LABEL_12;
      }
      goto LABEL_26;
    }
  }
  else if ((v7 & 0x40) == 0)
  {
    goto LABEL_11;
  }
  PBDataWriterWriteBOOLField();
  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x80) == 0)
  {
LABEL_12:
    if ((v7 & 0x100) == 0) {
      goto LABEL_13;
    }
    goto LABEL_27;
  }
LABEL_26:
  PBDataWriterWriteBOOLField();
  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x100) == 0)
  {
LABEL_13:
    if ((v7 & 0x200) == 0) {
      goto LABEL_14;
    }
    goto LABEL_28;
  }
LABEL_27:
  PBDataWriterWriteBOOLField();
  __int16 v7 = *(_WORD *)(&self->_isNotFaceTimeable + 1);
  if ((v7 & 0x200) == 0)
  {
LABEL_14:
    if ((v7 & 0x400) == 0) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
LABEL_28:
  PBDataWriterWriteBOOLField();
  if ((*(_WORD *)(&self->_isNotFaceTimeable + 1) & 0x400) != 0) {
LABEL_15:
  }
    PBDataWriterWriteBOOLField();
LABEL_16:
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactHandleSignalSetReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsNotFaceTimeable
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x400u;
}

- (void)setHasIsNotFaceTimeable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 1024;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFBFF | v3;
}

- (BOOL)hasIsNotFaceTimeable
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 10) & 1;
}

- (void)setIsNotFaceTimeable:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x400u;
  self->_int isNotFaceTimeable = a3;
}

- (void)deleteIsFaceTimeable
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x200u;
}

- (void)setHasIsFaceTimeable:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 512;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFDFF | v3;
}

- (BOOL)hasIsFaceTimeable
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 9) & 1;
}

- (void)setIsFaceTimeable:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x200u;
  self->_int isFaceTimeable = a3;
}

- (void)deleteIsAllowedType
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x100u;
}

- (void)setHasIsAllowedType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 256;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFEFF | v3;
}

- (BOOL)hasIsAllowedType
{
  return HIBYTE(*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1)) & 1;
}

- (void)setIsAllowedType:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x100u;
  self->_int isAllowedType = a3;
}

- (void)deleteIsPreferredType
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x80u;
}

- (void)setHasIsPreferredType:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 128;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFF7F | v3;
}

- (BOOL)hasIsPreferredType
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 7) & 1;
}

- (void)setIsPreferredType:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x80u;
  self->_int isPreferredType = a3;
}

- (void)deleteIsRecentInSameGroup
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x40u;
}

- (void)setHasIsRecentInSameGroup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 64;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFBF | v3;
}

- (BOOL)hasIsRecentInSameGroup
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 6) & 1;
}

- (void)setIsRecentInSameGroup:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x40u;
  self->_int isRecentInSameGroup = a3;
}

- (void)deleteIsRecentInAnyGroup
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x20u;
}

- (void)setHasIsRecentInAnyGroup:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 32;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFDF | v3;
}

- (BOOL)hasIsRecentInAnyGroup
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 5) & 1;
}

- (void)setIsRecentInAnyGroup:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x20u;
  self->_int isRecentInAnyGroup = a3;
}

- (void)deleteHistoryStats
{
}

- (BOOL)hasHistoryStats
{
  return self->_historyStats != 0;
}

- (void)deleteIsPartialQueryValueMatch
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~0x10u;
}

- (void)setHasIsPartialQueryValueMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 16;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFEF | v3;
}

- (BOOL)hasIsPartialQueryValueMatch
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 4) & 1;
}

- (void)setIsPartialQueryValueMatch:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 0x10u;
  self->_int isPartialQueryValueMatch = a3;
}

- (void)deleteIsQueryMatch
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~8u;
}

- (void)setHasIsQueryMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 8;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFF7 | v3;
}

- (BOOL)hasIsQueryMatch
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 3) & 1;
}

- (void)setIsQueryMatch:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 8u;
  self->_int isQueryMatch = a3;
}

- (void)deleteIsQueryExactMatch
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~4u;
}

- (void)setHasIsQueryExactMatch:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFFB | v3;
}

- (BOOL)hasIsQueryExactMatch
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 2) & 1;
}

- (void)setIsQueryExactMatch:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 4u;
  self->_int isQueryExactMatch = a3;
}

- (void)deleteIsFavorite
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~2u;
}

- (void)setHasIsFavorite:(BOOL)a3
{
  if (a3) {
    __int16 v3 = 2;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFFD | v3;
}

- (BOOL)hasIsFavorite
{
  return (*(unsigned __int16 *)(&self->_isNotFaceTimeable + 1) >> 1) & 1;
}

- (void)setIsFavorite:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 2u;
  self->_int isFavorite = a3;
}

- (void)deleteIsSuggestedHandle
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) &= ~1u;
}

- (void)setHasIsSuggestedHandle:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) = *(_WORD *)(&self->_isNotFaceTimeable + 1) & 0xFFFE | a3;
}

- (BOOL)hasIsSuggestedHandle
{
  return *(_WORD *)(&self->_isNotFaceTimeable + 1) & 1;
}

- (void)setIsSuggestedHandle:(BOOL)a3
{
  *(_WORD *)(&self->_isNotFaceTimeable + 1) |= 1u;
  self->_int isSuggestedHandle = a3;
}

@end
@interface ODDSiriSchemaODDOptInProperties
- (BOOL)hasDataSharingOptInStatus;
- (BOOL)hasIsMteUploadEnabled;
- (BOOL)hasIsServerUserDataSyncEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMteUploadEnabled;
- (BOOL)isServerUserDataSyncEnabled;
- (BOOL)readFrom:(id)a3;
- (NSArray)gradingOptInStateChanges;
- (NSData)jsonData;
- (ODDSiriSchemaODDOptInProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDOptInProperties)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)gradingOptInStateChangesAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)dataSharingOptInStatus;
- (unint64_t)gradingOptInStateChangesCount;
- (unint64_t)hash;
- (void)addGradingOptInStateChanges:(id)a3;
- (void)clearGradingOptInStateChanges;
- (void)deleteDataSharingOptInStatus;
- (void)deleteIsMteUploadEnabled;
- (void)deleteIsServerUserDataSyncEnabled;
- (void)setDataSharingOptInStatus:(int)a3;
- (void)setGradingOptInStateChanges:(id)a3;
- (void)setHasDataSharingOptInStatus:(BOOL)a3;
- (void)setHasIsMteUploadEnabled:(BOOL)a3;
- (void)setHasIsServerUserDataSyncEnabled:(BOOL)a3;
- (void)setIsMteUploadEnabled:(BOOL)a3;
- (void)setIsServerUserDataSyncEnabled:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDOptInProperties

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)ODDSiriSchemaODDOptInProperties;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDOptInProperties *)self gradingOptInStateChanges];
  v7 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v6 underConditions:v4];

  [(ODDSiriSchemaODDOptInProperties *)self setGradingOptInStateChanges:v7];
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

- (BOOL)isServerUserDataSyncEnabled
{
  return self->_isServerUserDataSyncEnabled;
}

- (void)setGradingOptInStateChanges:(id)a3
{
}

- (NSArray)gradingOptInStateChanges
{
  return self->_gradingOptInStateChanges;
}

- (int)dataSharingOptInStatus
{
  return self->_dataSharingOptInStatus;
}

- (BOOL)isMteUploadEnabled
{
  return self->_isMteUploadEnabled;
}

- (ODDSiriSchemaODDOptInProperties)initWithDictionary:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)ODDSiriSchemaODDOptInProperties;
  v5 = [(ODDSiriSchemaODDOptInProperties *)&v25 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isMteUploadEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDOptInProperties setIsMteUploadEnabled:](v5, "setIsMteUploadEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"dataSharingOptInStatus"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDOptInProperties setDataSharingOptInStatus:](v5, "setDataSharingOptInStatus:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"gradingOptInStateChanges"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = v7;
      v20 = v6;
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      id v9 = v8;
      uint64_t v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      if (v10)
      {
        uint64_t v11 = v10;
        uint64_t v12 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v22 != v12) {
              objc_enumerationMutation(v9);
            }
            uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v15 = [[SISchemaGradingOptInStateChange alloc] initWithDictionary:v14];
              [(ODDSiriSchemaODDOptInProperties *)v5 addGradingOptInStateChanges:v15];
            }
          }
          uint64_t v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
        }
        while (v11);
      }

      v7 = v19;
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"isServerUserDataSyncEnabled", v19, v20, (void)v21);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDOptInProperties setIsServerUserDataSyncEnabled:](v5, "setIsServerUserDataSyncEnabled:", [v16 BOOLValue]);
    }
    v17 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDOptInProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDOptInProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDOptInProperties *)self dictionaryRepresentation];
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
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ((*(&self->_isServerUserDataSyncEnabled + 1) & 2) != 0)
  {
    unsigned int v4 = [(ODDSiriSchemaODDOptInProperties *)self dataSharingOptInStatus] - 1;
    if (v4 > 2) {
      v5 = @"UNKNOWN";
    }
    else {
      v5 = off_1E5EBD7A0[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"dataSharingOptInStatus"];
  }
  if ([(NSArray *)self->_gradingOptInStateChanges count])
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v7 = self->_gradingOptInStateChanges;
    uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          if (v12)
          {
            [v6 addObject:v12];
          }
          else
          {
            v13 = [MEMORY[0x1E4F1CA98] null];
            [v6 addObject:v13];
          }
        }
        uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKeyedSubscript:@"gradingOptInStateChanges"];
  }
  char v14 = *(&self->_isServerUserDataSyncEnabled + 1);
  if (v14)
  {
    v15 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDOptInProperties isMteUploadEnabled](self, "isMteUploadEnabled"));
    [v3 setObject:v15 forKeyedSubscript:@"isMteUploadEnabled"];

    char v14 = *(&self->_isServerUserDataSyncEnabled + 1);
  }
  if ((v14 & 4) != 0)
  {
    v16 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDOptInProperties isServerUserDataSyncEnabled](self, "isServerUserDataSyncEnabled"));
    [v3 setObject:v16 forKeyedSubscript:@"isServerUserDataSyncEnabled"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isServerUserDataSyncEnabled + 1))
  {
    uint64_t v3 = 2654435761 * self->_isMteUploadEnabled;
    if ((*(&self->_isServerUserDataSyncEnabled + 1) & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v3 = 0;
    if ((*(&self->_isServerUserDataSyncEnabled + 1) & 2) != 0)
    {
LABEL_3:
      uint64_t v4 = 2654435761 * self->_dataSharingOptInStatus;
      goto LABEL_6;
    }
  }
  uint64_t v4 = 0;
LABEL_6:
  uint64_t v5 = [(NSArray *)self->_gradingOptInStateChanges hash];
  if ((*(&self->_isServerUserDataSyncEnabled + 1) & 4) != 0) {
    uint64_t v6 = 2654435761 * self->_isServerUserDataSyncEnabled;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  unsigned int v5 = *((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1);
  unsigned int v6 = v4[25];
  if ((v5 & 1) != (v6 & 1)) {
    goto LABEL_19;
  }
  if (v5)
  {
    int isMteUploadEnabled = self->_isMteUploadEnabled;
    if (isMteUploadEnabled != [v4 isMteUploadEnabled])
    {
LABEL_19:
      BOOL v20 = 0;
      goto LABEL_20;
    }
    unsigned int v5 = *((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1);
    unsigned int v6 = v4[25];
  }
  int v8 = (v5 >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_19;
  }
  if (v8)
  {
    int dataSharingOptInStatus = self->_dataSharingOptInStatus;
    if (dataSharingOptInStatus != [v4 dataSharingOptInStatus]) {
      goto LABEL_19;
    }
  }
  uint64_t v10 = [(ODDSiriSchemaODDOptInProperties *)self gradingOptInStateChanges];
  uint64_t v11 = [v4 gradingOptInStateChanges];
  uint64_t v12 = v11;
  if ((v10 == 0) == (v11 != 0))
  {

    goto LABEL_19;
  }
  uint64_t v13 = [(ODDSiriSchemaODDOptInProperties *)self gradingOptInStateChanges];
  if (v13)
  {
    char v14 = (void *)v13;
    v15 = [(ODDSiriSchemaODDOptInProperties *)self gradingOptInStateChanges];
    v16 = [v4 gradingOptInStateChanges];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  int v18 = (*((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1) >> 2) & 1;
  if (v18 != ((v4[25] >> 2) & 1)) {
    goto LABEL_19;
  }
  if (v18)
  {
    int isServerUserDataSyncEnabled = self->_isServerUserDataSyncEnabled;
    if (isServerUserDataSyncEnabled != [v4 isServerUserDataSyncEnabled]) {
      goto LABEL_19;
    }
  }
  BOOL v20 = 1;
LABEL_20:

  return v20;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = *(&self->_isServerUserDataSyncEnabled + 1);
  if (v5)
  {
    PBDataWriterWriteBOOLField();
    char v5 = *(&self->_isServerUserDataSyncEnabled + 1);
  }
  if ((v5 & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_gradingOptInStateChanges;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  if ((*(&self->_isServerUserDataSyncEnabled + 1) & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDOptInPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsServerUserDataSyncEnabled
{
  *(&self->_isServerUserDataSyncEnabled + 1) &= ~4u;
}

- (void)setHasIsServerUserDataSyncEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isServerUserDataSyncEnabled + 1) = *(&self->_isServerUserDataSyncEnabled + 1) & 0xFB | v3;
}

- (BOOL)hasIsServerUserDataSyncEnabled
{
  return (*((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1) >> 2) & 1;
}

- (void)setIsServerUserDataSyncEnabled:(BOOL)a3
{
  *(&self->_isServerUserDataSyncEnabled + 1) |= 4u;
  self->_int isServerUserDataSyncEnabled = a3;
}

- (id)gradingOptInStateChangesAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_gradingOptInStateChanges objectAtIndexedSubscript:a3];
}

- (unint64_t)gradingOptInStateChangesCount
{
  return [(NSArray *)self->_gradingOptInStateChanges count];
}

- (void)addGradingOptInStateChanges:(id)a3
{
  id v4 = a3;
  gradingOptInStateChanges = self->_gradingOptInStateChanges;
  id v8 = v4;
  if (!gradingOptInStateChanges)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_gradingOptInStateChanges;
    self->_gradingOptInStateChanges = v6;

    id v4 = v8;
    gradingOptInStateChanges = self->_gradingOptInStateChanges;
  }
  [(NSArray *)gradingOptInStateChanges addObject:v4];
}

- (void)clearGradingOptInStateChanges
{
}

- (void)deleteDataSharingOptInStatus
{
  *(&self->_isServerUserDataSyncEnabled + 1) &= ~2u;
}

- (void)setHasDataSharingOptInStatus:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isServerUserDataSyncEnabled + 1) = *(&self->_isServerUserDataSyncEnabled + 1) & 0xFD | v3;
}

- (BOOL)hasDataSharingOptInStatus
{
  return (*((unsigned __int8 *)&self->_isServerUserDataSyncEnabled + 1) >> 1) & 1;
}

- (void)setDataSharingOptInStatus:(int)a3
{
  *(&self->_isServerUserDataSyncEnabled + 1) |= 2u;
  self->_int dataSharingOptInStatus = a3;
}

- (void)deleteIsMteUploadEnabled
{
  *(&self->_isServerUserDataSyncEnabled + 1) &= ~1u;
}

- (void)setHasIsMteUploadEnabled:(BOOL)a3
{
  *(&self->_isServerUserDataSyncEnabled + 1) = *(&self->_isServerUserDataSyncEnabled + 1) & 0xFE | a3;
}

- (BOOL)hasIsMteUploadEnabled
{
  return *(&self->_isServerUserDataSyncEnabled + 1);
}

- (void)setIsMteUploadEnabled:(BOOL)a3
{
  *(&self->_isServerUserDataSyncEnabled + 1) |= 1u;
  self->_int isMteUploadEnabled = a3;
}

@end
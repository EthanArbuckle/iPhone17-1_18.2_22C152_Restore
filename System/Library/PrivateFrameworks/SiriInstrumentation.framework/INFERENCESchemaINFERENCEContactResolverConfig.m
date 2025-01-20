@interface INFERENCESchemaINFERENCEContactResolverConfig
- (BOOL)hasActionType;
- (BOOL)hasContactSearchSuggestedType;
- (BOOL)hasDomainsToSearchForHistory;
- (BOOL)hasIsSearchingFirstPartyContacts;
- (BOOL)isEqual:(id)a3;
- (BOOL)isSearchingFirstPartyContacts;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEContactResolverConfig)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEContactResolverConfig)initWithJSON:(id)a3;
- (NSArray)appBundleIds;
- (NSData)jsonData;
- (id)appBundleIdsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)actionType;
- (int)contactSearchSuggestedType;
- (int)domainsToSearchForHistory;
- (unint64_t)appBundleIdsCount;
- (unint64_t)hash;
- (void)addAppBundleIds:(id)a3;
- (void)clearAppBundleIds;
- (void)deleteActionType;
- (void)deleteContactSearchSuggestedType;
- (void)deleteDomainsToSearchForHistory;
- (void)deleteIsSearchingFirstPartyContacts;
- (void)setActionType:(int)a3;
- (void)setAppBundleIds:(id)a3;
- (void)setContactSearchSuggestedType:(int)a3;
- (void)setDomainsToSearchForHistory:(int)a3;
- (void)setHasActionType:(BOOL)a3;
- (void)setHasContactSearchSuggestedType:(BOOL)a3;
- (void)setHasDomainsToSearchForHistory:(BOOL)a3;
- (void)setHasIsSearchingFirstPartyContacts:(BOOL)a3;
- (void)setIsSearchingFirstPartyContacts:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEContactResolverConfig

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setAppBundleIds:(id)a3
{
}

- (NSArray)appBundleIds
{
  return self->_appBundleIds;
}

- (int)actionType
{
  return self->_actionType;
}

- (int)domainsToSearchForHistory
{
  return self->_domainsToSearchForHistory;
}

- (int)contactSearchSuggestedType
{
  return self->_contactSearchSuggestedType;
}

- (BOOL)isSearchingFirstPartyContacts
{
  return self->_isSearchingFirstPartyContacts;
}

- (INFERENCESchemaINFERENCEContactResolverConfig)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)INFERENCESchemaINFERENCEContactResolverConfig;
  v5 = [(INFERENCESchemaINFERENCEContactResolverConfig *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isSearchingFirstPartyContacts"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactResolverConfig setIsSearchingFirstPartyContacts:](v5, "setIsSearchingFirstPartyContacts:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"contactSearchSuggestedType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactResolverConfig setContactSearchSuggestedType:](v5, "setContactSearchSuggestedType:", [v7 intValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"domainsToSearchForHistory"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactResolverConfig setDomainsToSearchForHistory:](v5, "setDomainsToSearchForHistory:", [v8 intValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"actionType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactResolverConfig setActionType:](v5, "setActionType:", [v9 intValue]);
    }
    v10 = [v4 objectForKeyedSubscript:@"appBundleIds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v8;
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v11 = v10;
      uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v12)
      {
        uint64_t v13 = v12;
        uint64_t v14 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v13; ++i)
          {
            if (*(void *)v23 != v14) {
              objc_enumerationMutation(v11);
            }
            v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v17 = (void *)[v16 copy];
              [(INFERENCESchemaINFERENCEContactResolverConfig *)v5 addAppBundleIds:v17];
            }
          }
          uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v13);
      }

      v6 = v21;
      v8 = v20;
    }
    v18 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEContactResolverConfig)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEContactResolverConfig *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEContactResolverConfig *)self dictionaryRepresentation];
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
  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
    unsigned int v4 = [(INFERENCESchemaINFERENCEContactResolverConfig *)self actionType] - 1;
    if (v4 > 4) {
      v5 = @"INFERENCECONTACTACTIONTYPE_UNKNOWN";
    }
    else {
      v5 = off_1E5EB0E20[v4];
    }
    [v3 setObject:v5 forKeyedSubscript:@"actionType"];
  }
  if (self->_appBundleIds)
  {
    v6 = [(INFERENCESchemaINFERENCEContactResolverConfig *)self appBundleIds];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"appBundleIds"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unsigned int v11 = [(INFERENCESchemaINFERENCEContactResolverConfig *)self contactSearchSuggestedType]- 1;
    if (v11 > 2) {
      uint64_t v12 = @"INFERENCECONTACTSEARCHSUGGESTEDTYPE_UNKNOWN";
    }
    else {
      uint64_t v12 = off_1E5EB0E48[v11];
    }
    [v3 setObject:v12 forKeyedSubscript:@"contactSearchSuggestedType"];
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_10:
      if ((has & 1) == 0) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_10;
  }
  unsigned int v13 = [(INFERENCESchemaINFERENCEContactResolverConfig *)self domainsToSearchForHistory]
      - 1;
  if (v13 > 2) {
    uint64_t v14 = @"INFERENCECONTACTRESOLUTIONDOMAIN_UNKNOWN";
  }
  else {
    uint64_t v14 = off_1E5EB0E60[v13];
  }
  [v3 setObject:v14 forKeyedSubscript:@"domainsToSearchForHistory"];
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_12;
  }
LABEL_11:
  v9 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactResolverConfig isSearchingFirstPartyContacts](self, "isSearchingFirstPartyContacts"));
  [v3 setObject:v9 forKeyedSubscript:@"isSearchingFirstPartyContacts"];

LABEL_12:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v2 = 2654435761 * self->_isSearchingFirstPartyContacts;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_contactSearchSuggestedType;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      uint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5 ^ [(NSArray *)self->_appBundleIds hash];
    }
  }
  else
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_domainsToSearchForHistory;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  uint64_t v5 = 2654435761 * self->_actionType;
  return v3 ^ v2 ^ v4 ^ v5 ^ [(NSArray *)self->_appBundleIds hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  $9D597AAFD6F3F9600E35DFB3DDD0CBD1 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_22;
  }
  if (*(unsigned char *)&has)
  {
    int isSearchingFirstPartyContacts = self->_isSearchingFirstPartyContacts;
    if (isSearchingFirstPartyContacts != [v4 isSearchingFirstPartyContacts]) {
      goto LABEL_22;
    }
    $9D597AAFD6F3F9600E35DFB3DDD0CBD1 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      int contactSearchSuggestedType = self->_contactSearchSuggestedType;
      if (contactSearchSuggestedType != [v4 contactSearchSuggestedType]) {
        goto LABEL_22;
      }
      $9D597AAFD6F3F9600E35DFB3DDD0CBD1 has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (v10)
      {
        int domainsToSearchForHistory = self->_domainsToSearchForHistory;
        if (domainsToSearchForHistory != [v4 domainsToSearchForHistory]) {
          goto LABEL_22;
        }
        $9D597AAFD6F3F9600E35DFB3DDD0CBD1 has = self->_has;
        unsigned int v6 = v4[32];
      }
      int v12 = (*(unsigned int *)&has >> 3) & 1;
      if (v12 == ((v6 >> 3) & 1))
      {
        if (!v12 || (int actionType = self->_actionType, actionType == [v4 actionType]))
        {
          uint64_t v14 = [(INFERENCESchemaINFERENCEContactResolverConfig *)self appBundleIds];
          v15 = [v4 appBundleIds];
          v16 = v15;
          if ((v14 == 0) != (v15 != 0))
          {
            uint64_t v17 = [(INFERENCESchemaINFERENCEContactResolverConfig *)self appBundleIds];
            if (!v17)
            {

LABEL_25:
              BOOL v22 = 1;
              goto LABEL_23;
            }
            v18 = (void *)v17;
            v19 = [(INFERENCESchemaINFERENCEContactResolverConfig *)self appBundleIds];
            v20 = [v4 appBundleIds];
            char v21 = [v19 isEqual:v20];

            if (v21) {
              goto LABEL_25;
            }
          }
          else
          {
          }
        }
      }
    }
  }
LABEL_22:
  BOOL v22 = 0;
LABEL_23:

  return v22;
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteInt32Field();
LABEL_6:
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unsigned int v6 = self->_appBundleIds;
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
        PBDataWriterWriteStringField();
      }
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactResolverConfigReadFrom(self, (uint64_t)a3);
}

- (id)appBundleIdsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_appBundleIds objectAtIndexedSubscript:a3];
}

- (unint64_t)appBundleIdsCount
{
  return [(NSArray *)self->_appBundleIds count];
}

- (void)addAppBundleIds:(id)a3
{
  id v4 = a3;
  appBundleIds = self->_appBundleIds;
  id v8 = v4;
  if (!appBundleIds)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_appBundleIds;
    self->_appBundleIds = v6;

    id v4 = v8;
    appBundleIds = self->_appBundleIds;
  }
  [(NSArray *)appBundleIds addObject:v4];
}

- (void)clearAppBundleIds
{
}

- (void)deleteActionType
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasActionType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasActionType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setActionType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int actionType = a3;
}

- (void)deleteDomainsToSearchForHistory
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasDomainsToSearchForHistory:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasDomainsToSearchForHistory
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setDomainsToSearchForHistory:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int domainsToSearchForHistory = a3;
}

- (void)deleteContactSearchSuggestedType
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasContactSearchSuggestedType:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasContactSearchSuggestedType
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setContactSearchSuggestedType:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int contactSearchSuggestedType = a3;
}

- (void)deleteIsSearchingFirstPartyContacts
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsSearchingFirstPartyContacts:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsSearchingFirstPartyContacts
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsSearchingFirstPartyContacts:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isSearchingFirstPartyContacts = a3;
}

@end
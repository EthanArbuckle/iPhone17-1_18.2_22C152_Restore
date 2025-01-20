@interface ODDSiriSchemaODDiOSAssistantProperties
- (BOOL)hasAccessibility;
- (BOOL)hasAnnounce;
- (BOOL)hasAutoSendMessage;
- (BOOL)hasCarPlay;
- (BOOL)hasHeadGestures;
- (BOOL)hasIsAllowSiriWhenLockedEnabled;
- (BOOL)hasIsPressSideButtonForSiriEnabled;
- (BOOL)hasResponse;
- (BOOL)hasSiriInCall;
- (BOOL)isAllowSiriWhenLockedEnabled;
- (BOOL)isEqual:(id)a3;
- (BOOL)isPressSideButtonForSiriEnabled;
- (BOOL)readFrom:(id)a3;
- (NSArray)activeSubscriptions;
- (NSData)jsonData;
- (ODDSiriSchemaODDAnnounceProperties)announce;
- (ODDSiriSchemaODDAutoSendMessageProperties)autoSendMessage;
- (ODDSiriSchemaODDCarPlayProperties)carPlay;
- (ODDSiriSchemaODDHeadGestureProperties)headGestures;
- (ODDSiriSchemaODDSiriInCallProperties)siriInCall;
- (ODDSiriSchemaODDiOSAccessibilityProperties)accessibility;
- (ODDSiriSchemaODDiOSAssistantProperties)initWithDictionary:(id)a3;
- (ODDSiriSchemaODDiOSAssistantProperties)initWithJSON:(id)a3;
- (ODDSiriSchemaODDiOSResponseProperties)response;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)activeSubscriptionsAtIndex:(unint64_t)a3;
- (unint64_t)activeSubscriptionsCount;
- (unint64_t)hash;
- (void)addActiveSubscriptions:(int)a3;
- (void)clearActiveSubscriptions;
- (void)deleteAccessibility;
- (void)deleteAnnounce;
- (void)deleteAutoSendMessage;
- (void)deleteCarPlay;
- (void)deleteHeadGestures;
- (void)deleteIsAllowSiriWhenLockedEnabled;
- (void)deleteIsPressSideButtonForSiriEnabled;
- (void)deleteResponse;
- (void)deleteSiriInCall;
- (void)setAccessibility:(id)a3;
- (void)setActiveSubscriptions:(id)a3;
- (void)setAnnounce:(id)a3;
- (void)setAutoSendMessage:(id)a3;
- (void)setCarPlay:(id)a3;
- (void)setHasAccessibility:(BOOL)a3;
- (void)setHasAnnounce:(BOOL)a3;
- (void)setHasAutoSendMessage:(BOOL)a3;
- (void)setHasCarPlay:(BOOL)a3;
- (void)setHasHeadGestures:(BOOL)a3;
- (void)setHasIsAllowSiriWhenLockedEnabled:(BOOL)a3;
- (void)setHasIsPressSideButtonForSiriEnabled:(BOOL)a3;
- (void)setHasResponse:(BOOL)a3;
- (void)setHasSiriInCall:(BOOL)a3;
- (void)setHeadGestures:(id)a3;
- (void)setIsAllowSiriWhenLockedEnabled:(BOOL)a3;
- (void)setIsPressSideButtonForSiriEnabled:(BOOL)a3;
- (void)setResponse:(id)a3;
- (void)setSiriInCall:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ODDSiriSchemaODDiOSAssistantProperties

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v28.receiver = self;
  v28.super_class = (Class)ODDSiriSchemaODDiOSAssistantProperties;
  v5 = [(SISchemaInstrumentationMessage *)&v28 applySensitiveConditionsPolicy:v4];
  v6 = [(ODDSiriSchemaODDiOSAssistantProperties *)self response];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(ODDSiriSchemaODDiOSAssistantProperties *)self deleteResponse];
  }
  v9 = [(ODDSiriSchemaODDiOSAssistantProperties *)self accessibility];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(ODDSiriSchemaODDiOSAssistantProperties *)self deleteAccessibility];
  }
  v12 = [(ODDSiriSchemaODDiOSAssistantProperties *)self carPlay];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(ODDSiriSchemaODDiOSAssistantProperties *)self deleteCarPlay];
  }
  v15 = [(ODDSiriSchemaODDiOSAssistantProperties *)self siriInCall];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(ODDSiriSchemaODDiOSAssistantProperties *)self deleteSiriInCall];
  }
  v18 = [(ODDSiriSchemaODDiOSAssistantProperties *)self announce];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(ODDSiriSchemaODDiOSAssistantProperties *)self deleteAnnounce];
  }
  v21 = [(ODDSiriSchemaODDiOSAssistantProperties *)self autoSendMessage];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(ODDSiriSchemaODDiOSAssistantProperties *)self deleteAutoSendMessage];
  }
  v24 = [(ODDSiriSchemaODDiOSAssistantProperties *)self headGestures];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(ODDSiriSchemaODDiOSAssistantProperties *)self deleteHeadGestures];
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
  objc_storeStrong((id *)&self->_headGestures, 0);
  objc_storeStrong((id *)&self->_activeSubscriptions, 0);
  objc_storeStrong((id *)&self->_autoSendMessage, 0);
  objc_storeStrong((id *)&self->_announce, 0);
  objc_storeStrong((id *)&self->_siriInCall, 0);
  objc_storeStrong((id *)&self->_carPlay, 0);
  objc_storeStrong((id *)&self->_accessibility, 0);
  objc_storeStrong((id *)&self->_response, 0);
}

- (void)setHasHeadGestures:(BOOL)a3
{
  self->_hasSiriInCall = a3;
}

- (void)setHasAutoSendMessage:(BOOL)a3
{
  self->_hasCarPlay = a3;
}

- (void)setHasAnnounce:(BOOL)a3
{
  self->_hasAccessibility = a3;
}

- (void)setHasSiriInCall:(BOOL)a3
{
  self->_hasResponse = a3;
}

- (void)setHasCarPlay:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (void)setHasAccessibility:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasResponse:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHeadGestures:(id)a3
{
}

- (ODDSiriSchemaODDHeadGestureProperties)headGestures
{
  return self->_headGestures;
}

- (void)setActiveSubscriptions:(id)a3
{
}

- (NSArray)activeSubscriptions
{
  return self->_activeSubscriptions;
}

- (void)setAutoSendMessage:(id)a3
{
}

- (ODDSiriSchemaODDAutoSendMessageProperties)autoSendMessage
{
  return self->_autoSendMessage;
}

- (void)setAnnounce:(id)a3
{
}

- (ODDSiriSchemaODDAnnounceProperties)announce
{
  return self->_announce;
}

- (void)setSiriInCall:(id)a3
{
}

- (ODDSiriSchemaODDSiriInCallProperties)siriInCall
{
  return self->_siriInCall;
}

- (void)setCarPlay:(id)a3
{
}

- (ODDSiriSchemaODDCarPlayProperties)carPlay
{
  return self->_carPlay;
}

- (void)setAccessibility:(id)a3
{
}

- (ODDSiriSchemaODDiOSAccessibilityProperties)accessibility
{
  return self->_accessibility;
}

- (void)setResponse:(id)a3
{
}

- (ODDSiriSchemaODDiOSResponseProperties)response
{
  return self->_response;
}

- (BOOL)isAllowSiriWhenLockedEnabled
{
  return self->_isAllowSiriWhenLockedEnabled;
}

- (BOOL)isPressSideButtonForSiriEnabled
{
  return self->_isPressSideButtonForSiriEnabled;
}

- (ODDSiriSchemaODDiOSAssistantProperties)initWithDictionary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v42.receiver = self;
  v42.super_class = (Class)ODDSiriSchemaODDiOSAssistantProperties;
  v5 = [(ODDSiriSchemaODDiOSAssistantProperties *)&v42 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isPressSideButtonForSiriEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDiOSAssistantProperties setIsPressSideButtonForSiriEnabled:](v5, "setIsPressSideButtonForSiriEnabled:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"isAllowSiriWhenLockedEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[ODDSiriSchemaODDiOSAssistantProperties setIsAllowSiriWhenLockedEnabled:](v5, "setIsAllowSiriWhenLockedEnabled:", [v7 BOOLValue]);
    }
    int v8 = [v4 objectForKeyedSubscript:@"response"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[ODDSiriSchemaODDiOSResponseProperties alloc] initWithDictionary:v8];
      [(ODDSiriSchemaODDiOSAssistantProperties *)v5 setResponse:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"accessibility"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[ODDSiriSchemaODDiOSAccessibilityProperties alloc] initWithDictionary:v10];
      [(ODDSiriSchemaODDiOSAssistantProperties *)v5 setAccessibility:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"carPlay"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[ODDSiriSchemaODDCarPlayProperties alloc] initWithDictionary:v12];
      [(ODDSiriSchemaODDiOSAssistantProperties *)v5 setCarPlay:v13];
    }
    uint64_t v14 = [v4 objectForKeyedSubscript:@"siriInCall"];
    objc_opt_class();
    v37 = (void *)v14;
    if (objc_opt_isKindOfClass())
    {
      v15 = [[ODDSiriSchemaODDSiriInCallProperties alloc] initWithDictionary:v14];
      [(ODDSiriSchemaODDiOSAssistantProperties *)v5 setSiriInCall:v15];
    }
    v35 = (void *)v12;
    uint64_t v16 = [v4 objectForKeyedSubscript:@"announce"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[ODDSiriSchemaODDAnnounceProperties alloc] initWithDictionary:v16];
      [(ODDSiriSchemaODDiOSAssistantProperties *)v5 setAnnounce:v17];
    }
    v34 = (void *)v16;
    v36 = (void *)v10;
    v18 = [v4 objectForKeyedSubscript:@"autoSendMessage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[ODDSiriSchemaODDAutoSendMessageProperties alloc] initWithDictionary:v18];
      [(ODDSiriSchemaODDiOSAssistantProperties *)v5 setAutoSendMessage:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"activeSubscriptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v31 = v8;
      v32 = v7;
      v33 = v6;
      long long v40 = 0u;
      long long v41 = 0u;
      long long v38 = 0u;
      long long v39 = 0u;
      id v21 = v20;
      uint64_t v22 = [v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
      if (v22)
      {
        uint64_t v23 = v22;
        uint64_t v24 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v23; ++i)
          {
            if (*(void *)v39 != v24) {
              objc_enumerationMutation(v21);
            }
            int v26 = *(void **)(*((void *)&v38 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              -[ODDSiriSchemaODDiOSAssistantProperties addActiveSubscriptions:](v5, "addActiveSubscriptions:", [v26 intValue]);
            }
          }
          uint64_t v23 = [v21 countByEnumeratingWithState:&v38 objects:v43 count:16];
        }
        while (v23);
      }

      v7 = v32;
      v6 = v33;
      int v8 = v31;
    }
    v27 = [v4 objectForKeyedSubscript:@"headGestures"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v28 = [[ODDSiriSchemaODDHeadGestureProperties alloc] initWithDictionary:v27];
      [(ODDSiriSchemaODDiOSAssistantProperties *)v5 setHeadGestures:v28];
    }
    v29 = v5;
  }
  return v5;
}

- (ODDSiriSchemaODDiOSAssistantProperties)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ODDSiriSchemaODDiOSAssistantProperties *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ODDSiriSchemaODDiOSAssistantProperties *)self dictionaryRepresentation];
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
  if (self->_accessibility)
  {
    id v4 = [(ODDSiriSchemaODDiOSAssistantProperties *)self accessibility];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"accessibility"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"accessibility"];
    }
  }
  if ([(NSArray *)self->_activeSubscriptions count])
  {
    uint64_t v7 = [(ODDSiriSchemaODDiOSAssistantProperties *)self activeSubscriptions];
    int v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"activeSubscriptions"];
  }
  if (self->_announce)
  {
    v9 = [(ODDSiriSchemaODDiOSAssistantProperties *)self announce];
    uint64_t v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"announce"];
    }
    else
    {
      int v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"announce"];
    }
  }
  if (self->_autoSendMessage)
  {
    uint64_t v12 = [(ODDSiriSchemaODDiOSAssistantProperties *)self autoSendMessage];
    v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"autoSendMessage"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"autoSendMessage"];
    }
  }
  if (self->_carPlay)
  {
    v15 = [(ODDSiriSchemaODDiOSAssistantProperties *)self carPlay];
    uint64_t v16 = [v15 dictionaryRepresentation];
    if (v16)
    {
      [v3 setObject:v16 forKeyedSubscript:@"carPlay"];
    }
    else
    {
      int v17 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v17 forKeyedSubscript:@"carPlay"];
    }
  }
  if (self->_headGestures)
  {
    v18 = [(ODDSiriSchemaODDiOSAssistantProperties *)self headGestures];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"headGestures"];
    }
    else
    {
      int v20 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v20 forKeyedSubscript:@"headGestures"];
    }
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    uint64_t v22 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDiOSAssistantProperties isAllowSiriWhenLockedEnabled](self, "isAllowSiriWhenLockedEnabled"));
    [v3 setObject:v22 forKeyedSubscript:@"isAllowSiriWhenLockedEnabled"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v23 = objc_msgSend(NSNumber, "numberWithBool:", -[ODDSiriSchemaODDiOSAssistantProperties isPressSideButtonForSiriEnabled](self, "isPressSideButtonForSiriEnabled"));
    [v3 setObject:v23 forKeyedSubscript:@"isPressSideButtonForSiriEnabled"];
  }
  if (self->_response)
  {
    uint64_t v24 = [(ODDSiriSchemaODDiOSAssistantProperties *)self response];
    v25 = [v24 dictionaryRepresentation];
    if (v25)
    {
      [v3 setObject:v25 forKeyedSubscript:@"response"];
    }
    else
    {
      int v26 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v26 forKeyedSubscript:@"response"];
    }
  }
  if (self->_siriInCall)
  {
    v27 = [(ODDSiriSchemaODDiOSAssistantProperties *)self siriInCall];
    objc_super v28 = [v27 dictionaryRepresentation];
    if (v28)
    {
      [v3 setObject:v28 forKeyedSubscript:@"siriInCall"];
    }
    else
    {
      v29 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v29 forKeyedSubscript:@"siriInCall"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v3 = 2654435761 * self->_isPressSideButtonForSiriEnabled;
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
  uint64_t v4 = 2654435761 * self->_isAllowSiriWhenLockedEnabled;
LABEL_6:
  unint64_t v5 = v4 ^ v3 ^ [(ODDSiriSchemaODDiOSResponseProperties *)self->_response hash];
  unint64_t v6 = [(ODDSiriSchemaODDiOSAccessibilityProperties *)self->_accessibility hash];
  unint64_t v7 = v5 ^ v6 ^ [(ODDSiriSchemaODDCarPlayProperties *)self->_carPlay hash];
  unint64_t v8 = [(ODDSiriSchemaODDSiriInCallProperties *)self->_siriInCall hash];
  unint64_t v9 = v8 ^ [(ODDSiriSchemaODDAnnounceProperties *)self->_announce hash];
  unint64_t v10 = v7 ^ v9 ^ [(ODDSiriSchemaODDAutoSendMessageProperties *)self->_autoSendMessage hash];
  uint64_t v11 = [(NSArray *)self->_activeSubscriptions hash];
  return v10 ^ v11 ^ [(ODDSiriSchemaODDHeadGestureProperties *)self->_headGestures hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_49;
  }
  $D474A29A4B6CA4DA5C3495753A56B993 has = self->_has;
  unsigned int v6 = v4[80];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_49;
  }
  if (*(unsigned char *)&has)
  {
    int isPressSideButtonForSiriEnabled = self->_isPressSideButtonForSiriEnabled;
    if (isPressSideButtonForSiriEnabled != [v4 isPressSideButtonForSiriEnabled]) {
      goto LABEL_49;
    }
    $D474A29A4B6CA4DA5C3495753A56B993 has = self->_has;
    unsigned int v6 = v4[80];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 != ((v6 >> 1) & 1)) {
    goto LABEL_49;
  }
  if (v8)
  {
    int isAllowSiriWhenLockedEnabled = self->_isAllowSiriWhenLockedEnabled;
    if (isAllowSiriWhenLockedEnabled != [v4 isAllowSiriWhenLockedEnabled]) {
      goto LABEL_49;
    }
  }
  unint64_t v10 = [(ODDSiriSchemaODDiOSAssistantProperties *)self response];
  uint64_t v11 = [v4 response];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_48;
  }
  uint64_t v12 = [(ODDSiriSchemaODDiOSAssistantProperties *)self response];
  if (v12)
  {
    v13 = (void *)v12;
    uint64_t v14 = [(ODDSiriSchemaODDiOSAssistantProperties *)self response];
    v15 = [v4 response];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ODDSiriSchemaODDiOSAssistantProperties *)self accessibility];
  uint64_t v11 = [v4 accessibility];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_48;
  }
  uint64_t v17 = [(ODDSiriSchemaODDiOSAssistantProperties *)self accessibility];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(ODDSiriSchemaODDiOSAssistantProperties *)self accessibility];
    int v20 = [v4 accessibility];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ODDSiriSchemaODDiOSAssistantProperties *)self carPlay];
  uint64_t v11 = [v4 carPlay];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_48;
  }
  uint64_t v22 = [(ODDSiriSchemaODDiOSAssistantProperties *)self carPlay];
  if (v22)
  {
    uint64_t v23 = (void *)v22;
    uint64_t v24 = [(ODDSiriSchemaODDiOSAssistantProperties *)self carPlay];
    v25 = [v4 carPlay];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ODDSiriSchemaODDiOSAssistantProperties *)self siriInCall];
  uint64_t v11 = [v4 siriInCall];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_48;
  }
  uint64_t v27 = [(ODDSiriSchemaODDiOSAssistantProperties *)self siriInCall];
  if (v27)
  {
    objc_super v28 = (void *)v27;
    v29 = [(ODDSiriSchemaODDiOSAssistantProperties *)self siriInCall];
    v30 = [v4 siriInCall];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ODDSiriSchemaODDiOSAssistantProperties *)self announce];
  uint64_t v11 = [v4 announce];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_48;
  }
  uint64_t v32 = [(ODDSiriSchemaODDiOSAssistantProperties *)self announce];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(ODDSiriSchemaODDiOSAssistantProperties *)self announce];
    v35 = [v4 announce];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ODDSiriSchemaODDiOSAssistantProperties *)self autoSendMessage];
  uint64_t v11 = [v4 autoSendMessage];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_48;
  }
  uint64_t v37 = [(ODDSiriSchemaODDiOSAssistantProperties *)self autoSendMessage];
  if (v37)
  {
    long long v38 = (void *)v37;
    long long v39 = [(ODDSiriSchemaODDiOSAssistantProperties *)self autoSendMessage];
    long long v40 = [v4 autoSendMessage];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ODDSiriSchemaODDiOSAssistantProperties *)self activeSubscriptions];
  uint64_t v11 = [v4 activeSubscriptions];
  if ((v10 == 0) == (v11 != 0)) {
    goto LABEL_48;
  }
  uint64_t v42 = [(ODDSiriSchemaODDiOSAssistantProperties *)self activeSubscriptions];
  if (v42)
  {
    v43 = (void *)v42;
    uint64_t v44 = [(ODDSiriSchemaODDiOSAssistantProperties *)self activeSubscriptions];
    v45 = [v4 activeSubscriptions];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_49;
    }
  }
  else
  {
  }
  unint64_t v10 = [(ODDSiriSchemaODDiOSAssistantProperties *)self headGestures];
  uint64_t v11 = [v4 headGestures];
  if ((v10 == 0) != (v11 != 0))
  {
    uint64_t v47 = [(ODDSiriSchemaODDiOSAssistantProperties *)self headGestures];
    if (!v47)
    {

LABEL_52:
      BOOL v52 = 1;
      goto LABEL_50;
    }
    v48 = (void *)v47;
    v49 = [(ODDSiriSchemaODDiOSAssistantProperties *)self headGestures];
    v50 = [v4 headGestures];
    char v51 = [v49 isEqual:v50];

    if (v51) {
      goto LABEL_52;
    }
  }
  else
  {
LABEL_48:
  }
LABEL_49:
  BOOL v52 = 0;
LABEL_50:

  return v52;
}

- (void)writeTo:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteBOOLField();
  }
  unsigned int v6 = [(ODDSiriSchemaODDiOSAssistantProperties *)self response];

  if (v6)
  {
    unint64_t v7 = [(ODDSiriSchemaODDiOSAssistantProperties *)self response];
    PBDataWriterWriteSubmessage();
  }
  int v8 = [(ODDSiriSchemaODDiOSAssistantProperties *)self accessibility];

  if (v8)
  {
    unint64_t v9 = [(ODDSiriSchemaODDiOSAssistantProperties *)self accessibility];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v10 = [(ODDSiriSchemaODDiOSAssistantProperties *)self carPlay];

  if (v10)
  {
    uint64_t v11 = [(ODDSiriSchemaODDiOSAssistantProperties *)self carPlay];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(ODDSiriSchemaODDiOSAssistantProperties *)self siriInCall];

  if (v12)
  {
    v13 = [(ODDSiriSchemaODDiOSAssistantProperties *)self siriInCall];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v14 = [(ODDSiriSchemaODDiOSAssistantProperties *)self announce];

  if (v14)
  {
    v15 = [(ODDSiriSchemaODDiOSAssistantProperties *)self announce];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(ODDSiriSchemaODDiOSAssistantProperties *)self autoSendMessage];

  if (v16)
  {
    uint64_t v17 = [(ODDSiriSchemaODDiOSAssistantProperties *)self autoSendMessage];
    PBDataWriterWriteSubmessage();
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  v18 = self->_activeSubscriptions;
  uint64_t v19 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v26;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v26 != v21) {
          objc_enumerationMutation(v18);
        }
        objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "intValue", (void)v25);
        PBDataWriterWriteInt32Field();
      }
      uint64_t v20 = [(NSArray *)v18 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v20);
  }

  uint64_t v23 = [(ODDSiriSchemaODDiOSAssistantProperties *)self headGestures];

  if (v23)
  {
    uint64_t v24 = [(ODDSiriSchemaODDiOSAssistantProperties *)self headGestures];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return ODDSiriSchemaODDiOSAssistantPropertiesReadFrom(self, (uint64_t)a3);
}

- (void)deleteHeadGestures
{
}

- (BOOL)hasHeadGestures
{
  return self->_headGestures != 0;
}

- (int)activeSubscriptionsAtIndex:(unint64_t)a3
{
  uint64_t v3 = [(NSArray *)self->_activeSubscriptions objectAtIndexedSubscript:a3];
  int v4 = [v3 intValue];

  return v4;
}

- (unint64_t)activeSubscriptionsCount
{
  return [(NSArray *)self->_activeSubscriptions count];
}

- (void)addActiveSubscriptions:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  activeSubscriptions = self->_activeSubscriptions;
  if (!activeSubscriptions)
  {
    unsigned int v6 = [MEMORY[0x1E4F1CA48] array];
    unint64_t v7 = self->_activeSubscriptions;
    self->_activeSubscriptions = v6;

    activeSubscriptions = self->_activeSubscriptions;
  }
  id v8 = [NSNumber numberWithInt:v3];
  [(NSArray *)activeSubscriptions addObject:v8];
}

- (void)clearActiveSubscriptions
{
}

- (void)deleteAutoSendMessage
{
}

- (BOOL)hasAutoSendMessage
{
  return self->_autoSendMessage != 0;
}

- (void)deleteAnnounce
{
}

- (BOOL)hasAnnounce
{
  return self->_announce != 0;
}

- (void)deleteSiriInCall
{
}

- (BOOL)hasSiriInCall
{
  return self->_siriInCall != 0;
}

- (void)deleteCarPlay
{
}

- (BOOL)hasCarPlay
{
  return self->_carPlay != 0;
}

- (void)deleteAccessibility
{
}

- (BOOL)hasAccessibility
{
  return self->_accessibility != 0;
}

- (void)deleteResponse
{
}

- (BOOL)hasResponse
{
  return self->_response != 0;
}

- (void)deleteIsAllowSiriWhenLockedEnabled
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasIsAllowSiriWhenLockedEnabled:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIsAllowSiriWhenLockedEnabled
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setIsAllowSiriWhenLockedEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int isAllowSiriWhenLockedEnabled = a3;
}

- (void)deleteIsPressSideButtonForSiriEnabled
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasIsPressSideButtonForSiriEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasIsPressSideButtonForSiriEnabled
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIsPressSideButtonForSiriEnabled:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int isPressSideButtonForSiriEnabled = a3;
}

@end
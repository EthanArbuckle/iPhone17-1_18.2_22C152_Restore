@interface SISchemaInvocation
- (BOOL)hasBluetoothCarInvocationContext;
- (BOOL)hasCarPlayInvocationContext;
- (BOOL)hasCardInvocationContext;
- (BOOL)hasHardwareButtonInvocationContext;
- (BOOL)hasInvocationAction;
- (BOOL)hasInvocationSource;
- (BOOL)hasIsDeviceLocked;
- (BOOL)hasKeyboardInvocationContext;
- (BOOL)hasLinkId;
- (BOOL)hasTapToEditContext;
- (BOOL)hasTvRemoteInvocationContext;
- (BOOL)hasViewContainer;
- (BOOL)isDeviceLocked;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaBluetoothCarInvocationContext)bluetoothCarInvocationContext;
- (SISchemaCarPlayInvocationContext)carPlayInvocationContext;
- (SISchemaCardSectionKeyboardInvocationContext)keyboardInvocationContext;
- (SISchemaHardwareButtonInvocationContext)hardwareButtonInvocationContext;
- (SISchemaInvocation)initWithDictionary:(id)a3;
- (SISchemaInvocation)initWithJSON:(id)a3;
- (SISchemaTVRemoteInvocationContext)tvRemoteInvocationContext;
- (SISchemaTapToEditInvocationContext)tapToEditContext;
- (SISchemaUUID)linkId;
- (SISchemaVerticalLayoutCardSectionInvocationContext)cardInvocationContext;
- (SISchemaViewContainer)viewContainer;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)invocationAction;
- (int)invocationSource;
- (unint64_t)hash;
- (unint64_t)whichInvocationcontext;
- (void)deleteBluetoothCarInvocationContext;
- (void)deleteCarPlayInvocationContext;
- (void)deleteCardInvocationContext;
- (void)deleteHardwareButtonInvocationContext;
- (void)deleteInvocationAction;
- (void)deleteInvocationSource;
- (void)deleteIsDeviceLocked;
- (void)deleteKeyboardInvocationContext;
- (void)deleteLinkId;
- (void)deleteTapToEditContext;
- (void)deleteTvRemoteInvocationContext;
- (void)deleteViewContainer;
- (void)setBluetoothCarInvocationContext:(id)a3;
- (void)setCarPlayInvocationContext:(id)a3;
- (void)setCardInvocationContext:(id)a3;
- (void)setHardwareButtonInvocationContext:(id)a3;
- (void)setHasBluetoothCarInvocationContext:(BOOL)a3;
- (void)setHasCarPlayInvocationContext:(BOOL)a3;
- (void)setHasCardInvocationContext:(BOOL)a3;
- (void)setHasHardwareButtonInvocationContext:(BOOL)a3;
- (void)setHasInvocationAction:(BOOL)a3;
- (void)setHasInvocationSource:(BOOL)a3;
- (void)setHasIsDeviceLocked:(BOOL)a3;
- (void)setHasKeyboardInvocationContext:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasTapToEditContext:(BOOL)a3;
- (void)setHasTvRemoteInvocationContext:(BOOL)a3;
- (void)setHasViewContainer:(BOOL)a3;
- (void)setInvocationAction:(int)a3;
- (void)setInvocationSource:(int)a3;
- (void)setIsDeviceLocked:(BOOL)a3;
- (void)setKeyboardInvocationContext:(id)a3;
- (void)setLinkId:(id)a3;
- (void)setTapToEditContext:(id)a3;
- (void)setTvRemoteInvocationContext:(id)a3;
- (void)setViewContainer:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaInvocation

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SISchemaInvocation;
  v5 = [(SISchemaInstrumentationMessage *)&v34 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaInvocation *)self viewContainer];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaInvocation *)self deleteViewContainer];
  }
  v9 = [(SISchemaInvocation *)self carPlayInvocationContext];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaInvocation *)self deleteCarPlayInvocationContext];
  }
  v12 = [(SISchemaInvocation *)self cardInvocationContext];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaInvocation *)self deleteCardInvocationContext];
  }
  v15 = [(SISchemaInvocation *)self tvRemoteInvocationContext];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SISchemaInvocation *)self deleteTvRemoteInvocationContext];
  }
  v18 = [(SISchemaInvocation *)self keyboardInvocationContext];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(SISchemaInvocation *)self deleteKeyboardInvocationContext];
  }
  v21 = [(SISchemaInvocation *)self hardwareButtonInvocationContext];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(SISchemaInvocation *)self deleteHardwareButtonInvocationContext];
  }
  v24 = [(SISchemaInvocation *)self bluetoothCarInvocationContext];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(SISchemaInvocation *)self deleteBluetoothCarInvocationContext];
  }
  v27 = [(SISchemaInvocation *)self tapToEditContext];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(SISchemaInvocation *)self deleteTapToEditContext];
  }
  v30 = [(SISchemaInvocation *)self linkId];
  v31 = [v30 applySensitiveConditionsPolicy:v4];
  int v32 = [v31 suppressMessage];

  if (v32) {
    [(SISchemaInvocation *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_linkId, 0);
  objc_storeStrong((id *)&self->_tapToEditContext, 0);
  objc_storeStrong((id *)&self->_bluetoothCarInvocationContext, 0);
  objc_storeStrong((id *)&self->_hardwareButtonInvocationContext, 0);
  objc_storeStrong((id *)&self->_keyboardInvocationContext, 0);
  objc_storeStrong((id *)&self->_tvRemoteInvocationContext, 0);
  objc_storeStrong((id *)&self->_cardInvocationContext, 0);
  objc_storeStrong((id *)&self->_carPlayInvocationContext, 0);
  objc_storeStrong((id *)&self->_viewContainer, 0);
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasHardwareButtonInvocationContext = a3;
}

- (void)setHasTapToEditContext:(BOOL)a3
{
  self->_hasKeyboardInvocationContext = a3;
}

- (BOOL)hasTapToEditContext
{
  return self->_hasKeyboardInvocationContext;
}

- (void)setHasBluetoothCarInvocationContext:(BOOL)a3
{
  self->_hasTvRemoteInvocationContext = a3;
}

- (BOOL)hasBluetoothCarInvocationContext
{
  return self->_hasTvRemoteInvocationContext;
}

- (void)setHasHardwareButtonInvocationContext:(BOOL)a3
{
  self->_hasCardInvocationContext = a3;
}

- (BOOL)hasHardwareButtonInvocationContext
{
  return self->_hasCardInvocationContext;
}

- (void)setHasKeyboardInvocationContext:(BOOL)a3
{
  self->_hasCarPlayInvocationContext = a3;
}

- (BOOL)hasKeyboardInvocationContext
{
  return self->_hasCarPlayInvocationContext;
}

- (void)setHasTvRemoteInvocationContext:(BOOL)a3
{
  self->_hasViewContainer = a3;
}

- (BOOL)hasTvRemoteInvocationContext
{
  return self->_hasViewContainer;
}

- (void)setHasCardInvocationContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 3) = a3;
}

- (BOOL)hasCardInvocationContext
{
  return *((unsigned char *)&self->_has + 3);
}

- (void)setHasCarPlayInvocationContext:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (BOOL)hasCarPlayInvocationContext
{
  return *((unsigned char *)&self->_has + 2);
}

- (void)setHasViewContainer:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (BOOL)isDeviceLocked
{
  return self->_isDeviceLocked;
}

- (void)setViewContainer:(id)a3
{
}

- (SISchemaViewContainer)viewContainer
{
  return self->_viewContainer;
}

- (int)invocationSource
{
  return self->_invocationSource;
}

- (int)invocationAction
{
  return self->_invocationAction;
}

- (unint64_t)whichInvocationcontext
{
  return self->_whichInvocationcontext;
}

- (SISchemaInvocation)initWithDictionary:(id)a3
{
  id v4 = a3;
  v34.receiver = self;
  v34.super_class = (Class)SISchemaInvocation;
  v5 = [(SISchemaInvocation *)&v34 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"invocationAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaInvocation setInvocationAction:](v5, "setInvocationAction:", [v6 intValue]);
    }
    v33 = v6;
    v7 = [v4 objectForKeyedSubscript:@"invocationSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaInvocation setInvocationSource:](v5, "setInvocationSource:", [v7 intValue]);
    }
    int v32 = v7;
    uint64_t v8 = [v4 objectForKeyedSubscript:@"viewContainer"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaViewContainer alloc] initWithDictionary:v8];
      [(SISchemaInvocation *)v5 setViewContainer:v9];
    }
    uint64_t v10 = [v4 objectForKeyedSubscript:@"carPlayInvocationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaCarPlayInvocationContext alloc] initWithDictionary:v10];
      [(SISchemaInvocation *)v5 setCarPlayInvocationContext:v11];
    }
    uint64_t v12 = [v4 objectForKeyedSubscript:@"cardInvocationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaVerticalLayoutCardSectionInvocationContext alloc] initWithDictionary:v12];
      [(SISchemaInvocation *)v5 setCardInvocationContext:v13];
    }
    int v29 = (void *)v12;
    int v14 = [v4 objectForKeyedSubscript:@"tvRemoteInvocationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaTVRemoteInvocationContext alloc] initWithDictionary:v14];
      [(SISchemaInvocation *)v5 setTvRemoteInvocationContext:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"keyboardInvocationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[SISchemaCardSectionKeyboardInvocationContext alloc] initWithDictionary:v16];
      [(SISchemaInvocation *)v5 setKeyboardInvocationContext:v17];
    }
    v31 = (void *)v8;
    v18 = [v4 objectForKeyedSubscript:@"hardwareButtonInvocationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[SISchemaHardwareButtonInvocationContext alloc] initWithDictionary:v18];
      [(SISchemaInvocation *)v5 setHardwareButtonInvocationContext:v19];
    }
    v30 = (void *)v10;
    int v20 = [v4 objectForKeyedSubscript:@"bluetoothCarInvocationContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[SISchemaBluetoothCarInvocationContext alloc] initWithDictionary:v20];
      [(SISchemaInvocation *)v5 setBluetoothCarInvocationContext:v21];
    }
    v22 = [v4 objectForKeyedSubscript:@"tapToEditContext"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v23 = [[SISchemaTapToEditInvocationContext alloc] initWithDictionary:v22];
      [(SISchemaInvocation *)v5 setTapToEditContext:v23];
    }
    v24 = [v4 objectForKeyedSubscript:@"isDeviceLocked"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaInvocation setIsDeviceLocked:](v5, "setIsDeviceLocked:", [v24 BOOLValue]);
    }
    v25 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v26 = [[SISchemaUUID alloc] initWithDictionary:v25];
      [(SISchemaInvocation *)v5 setLinkId:v26];
    }
    v27 = v5;
  }
  return v5;
}

- (SISchemaInvocation)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaInvocation *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaInvocation *)self dictionaryRepresentation];
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
  if (self->_bluetoothCarInvocationContext)
  {
    id v4 = [(SISchemaInvocation *)self bluetoothCarInvocationContext];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"bluetoothCarInvocationContext"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"bluetoothCarInvocationContext"];
    }
  }
  if (self->_carPlayInvocationContext)
  {
    uint64_t v7 = [(SISchemaInvocation *)self carPlayInvocationContext];
    uint64_t v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"carPlayInvocationContext"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"carPlayInvocationContext"];
    }
  }
  if (self->_cardInvocationContext)
  {
    uint64_t v10 = [(SISchemaInvocation *)self cardInvocationContext];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"cardInvocationContext"];
    }
    else
    {
      uint64_t v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"cardInvocationContext"];
    }
  }
  if (self->_hardwareButtonInvocationContext)
  {
    v13 = [(SISchemaInvocation *)self hardwareButtonInvocationContext];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"hardwareButtonInvocationContext"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"hardwareButtonInvocationContext"];
    }
  }
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v20 = [(SISchemaInvocation *)self invocationAction] - 1;
    if (v20 > 0xE) {
      v21 = @"INVOCATIONACTION_UNKNOWN_INVOCATION_ACTION";
    }
    else {
      v21 = off_1E5EB7C00[v20];
    }
    [v3 setObject:v21 forKeyedSubscript:@"invocationAction"];
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_23:
      if ((has & 4) == 0) {
        goto LABEL_25;
      }
      goto LABEL_24;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_23;
  }
  unsigned int v25 = [(SISchemaInvocation *)self invocationSource] - 1;
  if (v25 > 0x62) {
    int v26 = @"INVOCATIONSOURCE_UNKNOWN_INVOCATION_SOURCE";
  }
  else {
    int v26 = off_1E5EB7C78[v25];
  }
  [v3 setObject:v26 forKeyedSubscript:@"invocationSource"];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_24:
    int v17 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaInvocation isDeviceLocked](self, "isDeviceLocked"));
    [v3 setObject:v17 forKeyedSubscript:@"isDeviceLocked"];
  }
LABEL_25:
  if (self->_keyboardInvocationContext)
  {
    v18 = [(SISchemaInvocation *)self keyboardInvocationContext];
    v19 = [v18 dictionaryRepresentation];
    if (v19)
    {
      [v3 setObject:v19 forKeyedSubscript:@"keyboardInvocationContext"];
    }
    else
    {
      v22 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v22 forKeyedSubscript:@"keyboardInvocationContext"];
    }
  }
  if (self->_linkId)
  {
    int v23 = [(SISchemaInvocation *)self linkId];
    v24 = [v23 dictionaryRepresentation];
    if (v24)
    {
      [v3 setObject:v24 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_tapToEditContext)
  {
    v28 = [(SISchemaInvocation *)self tapToEditContext];
    int v29 = [v28 dictionaryRepresentation];
    if (v29)
    {
      [v3 setObject:v29 forKeyedSubscript:@"tapToEditContext"];
    }
    else
    {
      v30 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v30 forKeyedSubscript:@"tapToEditContext"];
    }
  }
  if (self->_tvRemoteInvocationContext)
  {
    v31 = [(SISchemaInvocation *)self tvRemoteInvocationContext];
    int v32 = [v31 dictionaryRepresentation];
    if (v32)
    {
      [v3 setObject:v32 forKeyedSubscript:@"tvRemoteInvocationContext"];
    }
    else
    {
      v33 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v33 forKeyedSubscript:@"tvRemoteInvocationContext"];
    }
  }
  if (self->_viewContainer)
  {
    objc_super v34 = [(SISchemaInvocation *)self viewContainer];
    v35 = [v34 dictionaryRepresentation];
    if (v35)
    {
      [v3 setObject:v35 forKeyedSubscript:@"viewContainer"];
    }
    else
    {
      v36 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v36 forKeyedSubscript:@"viewContainer"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v14 = 2654435761 * self->_invocationAction;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      uint64_t v3 = 2654435761 * self->_invocationSource;
      goto LABEL_6;
    }
  }
  uint64_t v3 = 0;
LABEL_6:
  unint64_t v4 = [(SISchemaViewContainer *)self->_viewContainer hash];
  unint64_t v5 = [(SISchemaCarPlayInvocationContext *)self->_carPlayInvocationContext hash];
  unint64_t v6 = [(SISchemaVerticalLayoutCardSectionInvocationContext *)self->_cardInvocationContext hash];
  unint64_t v7 = [(SISchemaTVRemoteInvocationContext *)self->_tvRemoteInvocationContext hash];
  unint64_t v8 = [(SISchemaCardSectionKeyboardInvocationContext *)self->_keyboardInvocationContext hash];
  unint64_t v9 = [(SISchemaHardwareButtonInvocationContext *)self->_hardwareButtonInvocationContext hash];
  unint64_t v10 = [(SISchemaBluetoothCarInvocationContext *)self->_bluetoothCarInvocationContext hash];
  unint64_t v11 = [(SISchemaTapToEditInvocationContext *)self->_tapToEditContext hash];
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v12 = 2654435761 * self->_isDeviceLocked;
  }
  else {
    uint64_t v12 = 0;
  }
  return v3 ^ v14 ^ v4 ^ v5 ^ v6 ^ v7 ^ v8 ^ v9 ^ v10 ^ v11 ^ v12 ^ [(SISchemaUUID *)self->_linkId hash];
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_58;
  }
  unint64_t whichInvocationcontext = self->_whichInvocationcontext;
  if (whichInvocationcontext != [v4 whichInvocationcontext]) {
    goto LABEL_58;
  }
  $684B5420274F32909B46D7467F0F2B05 has = self->_has;
  unsigned int v7 = v4[96];
  if ((*(unsigned char *)&has & 1) != (v7 & 1)) {
    goto LABEL_58;
  }
  if (*(unsigned char *)&has)
  {
    int invocationAction = self->_invocationAction;
    if (invocationAction != [v4 invocationAction]) {
      goto LABEL_58;
    }
    $684B5420274F32909B46D7467F0F2B05 has = self->_has;
    unsigned int v7 = v4[96];
  }
  int v9 = (*(unsigned int *)&has >> 1) & 1;
  if (v9 != ((v7 >> 1) & 1)) {
    goto LABEL_58;
  }
  if (v9)
  {
    int invocationSource = self->_invocationSource;
    if (invocationSource != [v4 invocationSource]) {
      goto LABEL_58;
    }
  }
  unint64_t v11 = [(SISchemaInvocation *)self viewContainer];
  uint64_t v12 = [v4 viewContainer];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_57;
  }
  uint64_t v13 = [(SISchemaInvocation *)self viewContainer];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    v15 = [(SISchemaInvocation *)self viewContainer];
    v16 = [v4 viewContainer];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v11 = [(SISchemaInvocation *)self carPlayInvocationContext];
  uint64_t v12 = [v4 carPlayInvocationContext];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_57;
  }
  uint64_t v18 = [(SISchemaInvocation *)self carPlayInvocationContext];
  if (v18)
  {
    v19 = (void *)v18;
    unsigned int v20 = [(SISchemaInvocation *)self carPlayInvocationContext];
    v21 = [v4 carPlayInvocationContext];
    int v22 = [v20 isEqual:v21];

    if (!v22) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v11 = [(SISchemaInvocation *)self cardInvocationContext];
  uint64_t v12 = [v4 cardInvocationContext];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_57;
  }
  uint64_t v23 = [(SISchemaInvocation *)self cardInvocationContext];
  if (v23)
  {
    v24 = (void *)v23;
    unsigned int v25 = [(SISchemaInvocation *)self cardInvocationContext];
    int v26 = [v4 cardInvocationContext];
    int v27 = [v25 isEqual:v26];

    if (!v27) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v11 = [(SISchemaInvocation *)self tvRemoteInvocationContext];
  uint64_t v12 = [v4 tvRemoteInvocationContext];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_57;
  }
  uint64_t v28 = [(SISchemaInvocation *)self tvRemoteInvocationContext];
  if (v28)
  {
    int v29 = (void *)v28;
    v30 = [(SISchemaInvocation *)self tvRemoteInvocationContext];
    v31 = [v4 tvRemoteInvocationContext];
    int v32 = [v30 isEqual:v31];

    if (!v32) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v11 = [(SISchemaInvocation *)self keyboardInvocationContext];
  uint64_t v12 = [v4 keyboardInvocationContext];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_57;
  }
  uint64_t v33 = [(SISchemaInvocation *)self keyboardInvocationContext];
  if (v33)
  {
    objc_super v34 = (void *)v33;
    v35 = [(SISchemaInvocation *)self keyboardInvocationContext];
    v36 = [v4 keyboardInvocationContext];
    int v37 = [v35 isEqual:v36];

    if (!v37) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v11 = [(SISchemaInvocation *)self hardwareButtonInvocationContext];
  uint64_t v12 = [v4 hardwareButtonInvocationContext];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_57;
  }
  uint64_t v38 = [(SISchemaInvocation *)self hardwareButtonInvocationContext];
  if (v38)
  {
    v39 = (void *)v38;
    v40 = [(SISchemaInvocation *)self hardwareButtonInvocationContext];
    v41 = [v4 hardwareButtonInvocationContext];
    int v42 = [v40 isEqual:v41];

    if (!v42) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v11 = [(SISchemaInvocation *)self bluetoothCarInvocationContext];
  uint64_t v12 = [v4 bluetoothCarInvocationContext];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_57;
  }
  uint64_t v43 = [(SISchemaInvocation *)self bluetoothCarInvocationContext];
  if (v43)
  {
    v44 = (void *)v43;
    v45 = [(SISchemaInvocation *)self bluetoothCarInvocationContext];
    v46 = [v4 bluetoothCarInvocationContext];
    int v47 = [v45 isEqual:v46];

    if (!v47) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  unint64_t v11 = [(SISchemaInvocation *)self tapToEditContext];
  uint64_t v12 = [v4 tapToEditContext];
  if ((v11 == 0) == (v12 != 0)) {
    goto LABEL_57;
  }
  uint64_t v48 = [(SISchemaInvocation *)self tapToEditContext];
  if (v48)
  {
    v49 = (void *)v48;
    v50 = [(SISchemaInvocation *)self tapToEditContext];
    v51 = [v4 tapToEditContext];
    int v52 = [v50 isEqual:v51];

    if (!v52) {
      goto LABEL_58;
    }
  }
  else
  {
  }
  int v53 = (*(unsigned char *)&self->_has >> 2) & 1;
  if (v53 != ((v4[96] >> 2) & 1)) {
    goto LABEL_58;
  }
  if (v53)
  {
    int isDeviceLocked = self->_isDeviceLocked;
    if (isDeviceLocked != [v4 isDeviceLocked]) {
      goto LABEL_58;
    }
  }
  unint64_t v11 = [(SISchemaInvocation *)self linkId];
  uint64_t v12 = [v4 linkId];
  if ((v11 == 0) != (v12 != 0))
  {
    uint64_t v55 = [(SISchemaInvocation *)self linkId];
    if (!v55)
    {

LABEL_61:
      BOOL v60 = 1;
      goto LABEL_59;
    }
    v56 = (void *)v55;
    v57 = [(SISchemaInvocation *)self linkId];
    v58 = [v4 linkId];
    char v59 = [v57 isEqual:v58];

    if (v59) {
      goto LABEL_61;
    }
  }
  else
  {
LABEL_57:
  }
LABEL_58:
  BOOL v60 = 0;
LABEL_59:

  return v60;
}

- (void)writeTo:(id)a3
{
  id v24 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteInt32Field();
    char has = (char)self->_has;
  }
  if ((has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
  unint64_t v5 = [(SISchemaInvocation *)self viewContainer];

  if (v5)
  {
    unint64_t v6 = [(SISchemaInvocation *)self viewContainer];
    PBDataWriterWriteSubmessage();
  }
  unsigned int v7 = [(SISchemaInvocation *)self carPlayInvocationContext];

  if (v7)
  {
    unint64_t v8 = [(SISchemaInvocation *)self carPlayInvocationContext];
    PBDataWriterWriteSubmessage();
  }
  int v9 = [(SISchemaInvocation *)self cardInvocationContext];

  if (v9)
  {
    unint64_t v10 = [(SISchemaInvocation *)self cardInvocationContext];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v11 = [(SISchemaInvocation *)self tvRemoteInvocationContext];

  if (v11)
  {
    uint64_t v12 = [(SISchemaInvocation *)self tvRemoteInvocationContext];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v13 = [(SISchemaInvocation *)self keyboardInvocationContext];

  if (v13)
  {
    uint64_t v14 = [(SISchemaInvocation *)self keyboardInvocationContext];
    PBDataWriterWriteSubmessage();
  }
  v15 = [(SISchemaInvocation *)self hardwareButtonInvocationContext];

  if (v15)
  {
    v16 = [(SISchemaInvocation *)self hardwareButtonInvocationContext];
    PBDataWriterWriteSubmessage();
  }
  int v17 = [(SISchemaInvocation *)self bluetoothCarInvocationContext];

  if (v17)
  {
    uint64_t v18 = [(SISchemaInvocation *)self bluetoothCarInvocationContext];
    PBDataWriterWriteSubmessage();
  }
  v19 = [(SISchemaInvocation *)self tapToEditContext];

  if (v19)
  {
    unsigned int v20 = [(SISchemaInvocation *)self tapToEditContext];
    PBDataWriterWriteSubmessage();
  }
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteBOOLField();
  }
  v21 = [(SISchemaInvocation *)self linkId];

  int v22 = v24;
  if (v21)
  {
    uint64_t v23 = [(SISchemaInvocation *)self linkId];
    PBDataWriterWriteSubmessage();

    int v22 = v24;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaInvocationReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

- (void)deleteIsDeviceLocked
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasIsDeviceLocked:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasIsDeviceLocked
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setIsDeviceLocked:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int isDeviceLocked = a3;
}

- (void)deleteTapToEditContext
{
  if (self->_whichInvocationcontext == 11)
  {
    self->_unint64_t whichInvocationcontext = 0;
    self->_tapToEditContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaTapToEditInvocationContext)tapToEditContext
{
  if (self->_whichInvocationcontext == 11) {
    v2 = self->_tapToEditContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTapToEditContext:(id)a3
{
  unint64_t v4 = (SISchemaTapToEditInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  unint64_t v11 = 11;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichInvocationcontext = v11;
  tapToEditContext = self->_tapToEditContext;
  self->_tapToEditContext = v4;
}

- (void)deleteBluetoothCarInvocationContext
{
  if (self->_whichInvocationcontext == 10)
  {
    self->_unint64_t whichInvocationcontext = 0;
    self->_bluetoothCarInvocationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaBluetoothCarInvocationContext)bluetoothCarInvocationContext
{
  if (self->_whichInvocationcontext == 10) {
    v2 = self->_bluetoothCarInvocationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setBluetoothCarInvocationContext:(id)a3
{
  unint64_t v4 = (SISchemaBluetoothCarInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  tapToEditContext = self->_tapToEditContext;
  self->_tapToEditContext = 0;

  unint64_t v11 = 10;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichInvocationcontext = v11;
  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = v4;
}

- (void)deleteHardwareButtonInvocationContext
{
  if (self->_whichInvocationcontext == 9)
  {
    self->_unint64_t whichInvocationcontext = 0;
    self->_hardwareButtonInvocationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaHardwareButtonInvocationContext)hardwareButtonInvocationContext
{
  if (self->_whichInvocationcontext == 9) {
    v2 = self->_hardwareButtonInvocationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setHardwareButtonInvocationContext:(id)a3
{
  unint64_t v4 = (SISchemaHardwareButtonInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  tapToEditContext = self->_tapToEditContext;
  self->_tapToEditContext = 0;

  unint64_t v11 = 9;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichInvocationcontext = v11;
  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = v4;
}

- (void)deleteKeyboardInvocationContext
{
  if (self->_whichInvocationcontext == 8)
  {
    self->_unint64_t whichInvocationcontext = 0;
    self->_keyboardInvocationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaCardSectionKeyboardInvocationContext)keyboardInvocationContext
{
  if (self->_whichInvocationcontext == 8) {
    v2 = self->_keyboardInvocationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setKeyboardInvocationContext:(id)a3
{
  unint64_t v4 = (SISchemaCardSectionKeyboardInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  tapToEditContext = self->_tapToEditContext;
  self->_tapToEditContext = 0;

  self->_unint64_t whichInvocationcontext = 8 * (v4 != 0);
  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = v4;
}

- (void)deleteTvRemoteInvocationContext
{
  if (self->_whichInvocationcontext == 7)
  {
    self->_unint64_t whichInvocationcontext = 0;
    self->_tvRemoteInvocationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaTVRemoteInvocationContext)tvRemoteInvocationContext
{
  if (self->_whichInvocationcontext == 7) {
    v2 = self->_tvRemoteInvocationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setTvRemoteInvocationContext:(id)a3
{
  unint64_t v4 = (SISchemaTVRemoteInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  tapToEditContext = self->_tapToEditContext;
  self->_tapToEditContext = 0;

  unint64_t v11 = 7;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichInvocationcontext = v11;
  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = v4;
}

- (void)deleteCardInvocationContext
{
  if (self->_whichInvocationcontext == 5)
  {
    self->_unint64_t whichInvocationcontext = 0;
    self->_cardInvocationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaVerticalLayoutCardSectionInvocationContext)cardInvocationContext
{
  if (self->_whichInvocationcontext == 5) {
    v2 = self->_cardInvocationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCardInvocationContext:(id)a3
{
  unint64_t v4 = (SISchemaVerticalLayoutCardSectionInvocationContext *)a3;
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  tapToEditContext = self->_tapToEditContext;
  self->_tapToEditContext = 0;

  unint64_t v11 = 5;
  if (!v4) {
    unint64_t v11 = 0;
  }
  self->_unint64_t whichInvocationcontext = v11;
  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = v4;
}

- (void)deleteCarPlayInvocationContext
{
  if (self->_whichInvocationcontext == 4)
  {
    self->_unint64_t whichInvocationcontext = 0;
    self->_carPlayInvocationContext = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (SISchemaCarPlayInvocationContext)carPlayInvocationContext
{
  if (self->_whichInvocationcontext == 4) {
    v2 = self->_carPlayInvocationContext;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setCarPlayInvocationContext:(id)a3
{
  unint64_t v4 = (SISchemaCarPlayInvocationContext *)a3;
  cardInvocationContext = self->_cardInvocationContext;
  self->_cardInvocationContext = 0;

  tvRemoteInvocationContext = self->_tvRemoteInvocationContext;
  self->_tvRemoteInvocationContext = 0;

  keyboardInvocationContext = self->_keyboardInvocationContext;
  self->_keyboardInvocationContext = 0;

  hardwareButtonInvocationContext = self->_hardwareButtonInvocationContext;
  self->_hardwareButtonInvocationContext = 0;

  bluetoothCarInvocationContext = self->_bluetoothCarInvocationContext;
  self->_bluetoothCarInvocationContext = 0;

  tapToEditContext = self->_tapToEditContext;
  self->_tapToEditContext = 0;

  self->_unint64_t whichInvocationcontext = 4 * (v4 != 0);
  carPlayInvocationContext = self->_carPlayInvocationContext;
  self->_carPlayInvocationContext = v4;
}

- (void)deleteViewContainer
{
}

- (BOOL)hasViewContainer
{
  return self->_viewContainer != 0;
}

- (void)deleteInvocationSource
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasInvocationSource:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasInvocationSource
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setInvocationSource:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int invocationSource = a3;
}

- (void)deleteInvocationAction
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasInvocationAction:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasInvocationAction
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setInvocationAction:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int invocationAction = a3;
}

@end
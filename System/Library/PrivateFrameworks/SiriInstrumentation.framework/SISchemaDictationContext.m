@interface SISchemaDictationContext
- (BOOL)hasBundleId;
- (BOOL)hasDictationLocale;
- (BOOL)hasKeyboardLanguage;
- (BOOL)hasKeyboardLocale;
- (BOOL)hasSiriSelectedLocale;
- (BOOL)hasTextInputSessionId;
- (BOOL)hasUserSelectedLocale;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)dictationLocalesEnableds;
- (NSArray)keyboardLocalesEnableds;
- (NSData)jsonData;
- (NSString)bundleId;
- (NSString)keyboardLanguage;
- (SISchemaDictationContext)initWithDictionary:(id)a3;
- (SISchemaDictationContext)initWithJSON:(id)a3;
- (SISchemaLocaleIdentifier)dictationLocale;
- (SISchemaLocaleIdentifier)keyboardLocale;
- (SISchemaLocaleIdentifier)siriSelectedLocale;
- (SISchemaLocaleIdentifier)userSelectedLocale;
- (SISchemaUUID)textInputSessionId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictationLocalesEnabledAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (id)keyboardLocalesEnabledAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (unint64_t)dictationLocalesEnabledCount;
- (unint64_t)hash;
- (unint64_t)keyboardLocalesEnabledCount;
- (void)addDictationLocalesEnabled:(id)a3;
- (void)addKeyboardLocalesEnabled:(id)a3;
- (void)clearDictationLocalesEnabled;
- (void)clearKeyboardLocalesEnabled;
- (void)deleteBundleId;
- (void)deleteDictationLocale;
- (void)deleteKeyboardLanguage;
- (void)deleteKeyboardLocale;
- (void)deleteSiriSelectedLocale;
- (void)deleteTextInputSessionId;
- (void)deleteUserSelectedLocale;
- (void)setBundleId:(id)a3;
- (void)setDictationLocale:(id)a3;
- (void)setDictationLocalesEnableds:(id)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasDictationLocale:(BOOL)a3;
- (void)setHasKeyboardLanguage:(BOOL)a3;
- (void)setHasKeyboardLocale:(BOOL)a3;
- (void)setHasSiriSelectedLocale:(BOOL)a3;
- (void)setHasTextInputSessionId:(BOOL)a3;
- (void)setHasUserSelectedLocale:(BOOL)a3;
- (void)setKeyboardLanguage:(id)a3;
- (void)setKeyboardLocale:(id)a3;
- (void)setKeyboardLocalesEnableds:(id)a3;
- (void)setSiriSelectedLocale:(id)a3;
- (void)setTextInputSessionId:(id)a3;
- (void)setUserSelectedLocale:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaDictationContext

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SISchemaDictationContext;
  v5 = [(SISchemaInstrumentationMessage *)&v26 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaDictationContext *)self keyboardLocale];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(SISchemaDictationContext *)self deleteKeyboardLocale];
  }
  v9 = [(SISchemaDictationContext *)self dictationLocale];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(SISchemaDictationContext *)self deleteDictationLocale];
  }
  v12 = [(SISchemaDictationContext *)self userSelectedLocale];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(SISchemaDictationContext *)self deleteUserSelectedLocale];
  }
  v15 = [(SISchemaDictationContext *)self siriSelectedLocale];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(SISchemaDictationContext *)self deleteSiriSelectedLocale];
  }
  v18 = [(SISchemaDictationContext *)self keyboardLocalesEnableds];
  v19 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v18 underConditions:v4];
  [(SISchemaDictationContext *)self setKeyboardLocalesEnableds:v19];

  v20 = [(SISchemaDictationContext *)self dictationLocalesEnableds];
  v21 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v20 underConditions:v4];
  [(SISchemaDictationContext *)self setDictationLocalesEnableds:v21];

  v22 = [(SISchemaDictationContext *)self textInputSessionId];
  v23 = [v22 applySensitiveConditionsPolicy:v4];
  int v24 = [v23 suppressMessage];

  if (v24) {
    [(SISchemaDictationContext *)self deleteTextInputSessionId];
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
  objc_storeStrong((id *)&self->_textInputSessionId, 0);
  objc_storeStrong((id *)&self->_bundleId, 0);
  objc_storeStrong((id *)&self->_dictationLocalesEnableds, 0);
  objc_storeStrong((id *)&self->_keyboardLocalesEnableds, 0);
  objc_storeStrong((id *)&self->_siriSelectedLocale, 0);
  objc_storeStrong((id *)&self->_userSelectedLocale, 0);
  objc_storeStrong((id *)&self->_dictationLocale, 0);
  objc_storeStrong((id *)&self->_keyboardLocale, 0);
  objc_storeStrong((id *)&self->_keyboardLanguage, 0);
}

- (void)setHasTextInputSessionId:(BOOL)a3
{
  self->_hasTextInputSessionId = a3;
}

- (void)setHasBundleId:(BOOL)a3
{
  self->_hasBundleId = a3;
}

- (void)setHasSiriSelectedLocale:(BOOL)a3
{
  self->_hasSiriSelectedLocale = a3;
}

- (void)setHasUserSelectedLocale:(BOOL)a3
{
  self->_hasUserSelectedLocale = a3;
}

- (void)setHasDictationLocale:(BOOL)a3
{
  self->_hasDictationLocale = a3;
}

- (void)setHasKeyboardLocale:(BOOL)a3
{
  self->_hasKeyboardLocale = a3;
}

- (void)setHasKeyboardLanguage:(BOOL)a3
{
  self->_hasKeyboardLanguage = a3;
}

- (void)setTextInputSessionId:(id)a3
{
}

- (SISchemaUUID)textInputSessionId
{
  return self->_textInputSessionId;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (void)setDictationLocalesEnableds:(id)a3
{
}

- (NSArray)dictationLocalesEnableds
{
  return self->_dictationLocalesEnableds;
}

- (void)setKeyboardLocalesEnableds:(id)a3
{
}

- (NSArray)keyboardLocalesEnableds
{
  return self->_keyboardLocalesEnableds;
}

- (void)setSiriSelectedLocale:(id)a3
{
}

- (SISchemaLocaleIdentifier)siriSelectedLocale
{
  return self->_siriSelectedLocale;
}

- (void)setUserSelectedLocale:(id)a3
{
}

- (SISchemaLocaleIdentifier)userSelectedLocale
{
  return self->_userSelectedLocale;
}

- (void)setDictationLocale:(id)a3
{
}

- (SISchemaLocaleIdentifier)dictationLocale
{
  return self->_dictationLocale;
}

- (void)setKeyboardLocale:(id)a3
{
}

- (SISchemaLocaleIdentifier)keyboardLocale
{
  return self->_keyboardLocale;
}

- (void)setKeyboardLanguage:(id)a3
{
}

- (NSString)keyboardLanguage
{
  return self->_keyboardLanguage;
}

- (SISchemaDictationContext)initWithDictionary:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v51.receiver = self;
  v51.super_class = (Class)SISchemaDictationContext;
  v5 = [(SISchemaDictationContext *)&v51 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"keyboardLanguage"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaDictationContext *)v5 setKeyboardLanguage:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"keyboardLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v8];
      [(SISchemaDictationContext *)v5 setKeyboardLocale:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"dictationLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v10];
      [(SISchemaDictationContext *)v5 setDictationLocale:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"userSelectedLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v12];
      [(SISchemaDictationContext *)v5 setUserSelectedLocale:v13];
    }
    v41 = v6;
    uint64_t v14 = [v4 objectForKeyedSubscript:@"siriSelectedLocale"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v14];
      [(SISchemaDictationContext *)v5 setSiriSelectedLocale:v15];
    }
    v16 = objc_msgSend(v4, "objectForKeyedSubscript:", @"keyboardLocalesEnabled", v14);
    objc_opt_class();
    v42 = v16;
    v40 = v8;
    v39 = v12;
    if (objc_opt_isKindOfClass())
    {
      long long v49 = 0u;
      long long v50 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      id v17 = v16;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v48;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v48 != v20) {
              objc_enumerationMutation(v17);
            }
            uint64_t v22 = *(void *)(*((void *)&v47 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v23 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v22];
              [(SISchemaDictationContext *)v5 addKeyboardLocalesEnabled:v23];
            }
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v19);
      }

      int v8 = v40;
      v12 = v39;
    }
    int v24 = [v4 objectForKeyedSubscript:@"dictationLocalesEnabled"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v25 = v24;
      uint64_t v26 = [v25 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v26)
      {
        uint64_t v27 = v26;
        uint64_t v28 = *(void *)v44;
        do
        {
          for (uint64_t j = 0; j != v27; ++j)
          {
            if (*(void *)v44 != v28) {
              objc_enumerationMutation(v25);
            }
            uint64_t v30 = *(void *)(*((void *)&v43 + 1) + 8 * j);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v31 = [[SISchemaLocaleIdentifier alloc] initWithDictionary:v30];
              [(SISchemaDictationContext *)v5 addDictationLocalesEnabled:v31];
            }
          }
          uint64_t v27 = [v25 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v27);
      }

      int v8 = v40;
      v12 = v39;
    }
    v32 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v33 = (void *)[v32 copy];
      [(SISchemaDictationContext *)v5 setBundleId:v33];
    }
    v34 = [v4 objectForKeyedSubscript:@"textInputSessionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v35 = [[SISchemaUUID alloc] initWithDictionary:v34];
      [(SISchemaDictationContext *)v5 setTextInputSessionId:v35];
    }
    v36 = v5;
  }
  return v5;
}

- (SISchemaDictationContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaDictationContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaDictationContext *)self dictionaryRepresentation];
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
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if (self->_bundleId)
  {
    id v4 = [(SISchemaDictationContext *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (self->_dictationLocale)
  {
    v6 = [(SISchemaDictationContext *)self dictationLocale];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"dictationLocale"];
    }
    else
    {
      int v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"dictationLocale"];
    }
  }
  if ([(NSArray *)self->_dictationLocalesEnableds count])
  {
    v9 = [MEMORY[0x1E4F1CA48] array];
    long long v44 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    v10 = self->_dictationLocalesEnableds;
    uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v45;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v45 != v13) {
            objc_enumerationMutation(v10);
          }
          v15 = [*(id *)(*((void *)&v44 + 1) + 8 * i) dictionaryRepresentation];
          if (v15)
          {
            [v9 addObject:v15];
          }
          else
          {
            v16 = [MEMORY[0x1E4F1CA98] null];
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v44 objects:v49 count:16];
      }
      while (v12);
    }

    [v3 setObject:v9 forKeyedSubscript:@"dictationLocalesEnabled"];
  }
  if (self->_keyboardLanguage)
  {
    id v17 = [(SISchemaDictationContext *)self keyboardLanguage];
    uint64_t v18 = (void *)[v17 copy];
    [v3 setObject:v18 forKeyedSubscript:@"keyboardLanguage"];
  }
  if (self->_keyboardLocale)
  {
    uint64_t v19 = [(SISchemaDictationContext *)self keyboardLocale];
    uint64_t v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"keyboardLocale"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"keyboardLocale"];
    }
  }
  if ([(NSArray *)self->_keyboardLocalesEnableds count])
  {
    uint64_t v22 = [MEMORY[0x1E4F1CA48] array];
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    v23 = self->_keyboardLocalesEnableds;
    uint64_t v24 = [(NSArray *)v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v41;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v41 != v26) {
            objc_enumerationMutation(v23);
          }
          uint64_t v28 = objc_msgSend(*(id *)(*((void *)&v40 + 1) + 8 * j), "dictionaryRepresentation", (void)v40);
          if (v28)
          {
            [v22 addObject:v28];
          }
          else
          {
            v29 = [MEMORY[0x1E4F1CA98] null];
            [v22 addObject:v29];
          }
        }
        uint64_t v25 = [(NSArray *)v23 countByEnumeratingWithState:&v40 objects:v48 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKeyedSubscript:@"keyboardLocalesEnabled"];
  }
  if (self->_siriSelectedLocale)
  {
    uint64_t v30 = [(SISchemaDictationContext *)self siriSelectedLocale];
    v31 = [v30 dictionaryRepresentation];
    if (v31)
    {
      [v3 setObject:v31 forKeyedSubscript:@"siriSelectedLocale"];
    }
    else
    {
      v32 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v32 forKeyedSubscript:@"siriSelectedLocale"];
    }
  }
  if (self->_textInputSessionId)
  {
    v33 = [(SISchemaDictationContext *)self textInputSessionId];
    v34 = [v33 dictionaryRepresentation];
    if (v34)
    {
      [v3 setObject:v34 forKeyedSubscript:@"textInputSessionId"];
    }
    else
    {
      v35 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v35 forKeyedSubscript:@"textInputSessionId"];
    }
  }
  if (self->_userSelectedLocale)
  {
    v36 = [(SISchemaDictationContext *)self userSelectedLocale];
    v37 = [v36 dictionaryRepresentation];
    if (v37)
    {
      [v3 setObject:v37 forKeyedSubscript:@"userSelectedLocale"];
    }
    else
    {
      v38 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v38 forKeyedSubscript:@"userSelectedLocale"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v40);
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_keyboardLanguage hash];
  unint64_t v4 = [(SISchemaLocaleIdentifier *)self->_keyboardLocale hash] ^ v3;
  unint64_t v5 = [(SISchemaLocaleIdentifier *)self->_dictationLocale hash];
  unint64_t v6 = v4 ^ v5 ^ [(SISchemaLocaleIdentifier *)self->_userSelectedLocale hash];
  unint64_t v7 = [(SISchemaLocaleIdentifier *)self->_siriSelectedLocale hash];
  uint64_t v8 = v7 ^ [(NSArray *)self->_keyboardLocalesEnableds hash];
  uint64_t v9 = v6 ^ v8 ^ [(NSArray *)self->_dictationLocalesEnableds hash];
  NSUInteger v10 = [(NSString *)self->_bundleId hash];
  return v9 ^ v10 ^ [(SISchemaUUID *)self->_textInputSessionId hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_47;
  }
  unint64_t v5 = [(SISchemaDictationContext *)self keyboardLanguage];
  unint64_t v6 = [v4 keyboardLanguage];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v7 = [(SISchemaDictationContext *)self keyboardLanguage];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    uint64_t v9 = [(SISchemaDictationContext *)self keyboardLanguage];
    NSUInteger v10 = [v4 keyboardLanguage];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDictationContext *)self keyboardLocale];
  unint64_t v6 = [v4 keyboardLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v12 = [(SISchemaDictationContext *)self keyboardLocale];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(SISchemaDictationContext *)self keyboardLocale];
    v15 = [v4 keyboardLocale];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDictationContext *)self dictationLocale];
  unint64_t v6 = [v4 dictationLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v17 = [(SISchemaDictationContext *)self dictationLocale];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    uint64_t v19 = [(SISchemaDictationContext *)self dictationLocale];
    uint64_t v20 = [v4 dictationLocale];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDictationContext *)self userSelectedLocale];
  unint64_t v6 = [v4 userSelectedLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v22 = [(SISchemaDictationContext *)self userSelectedLocale];
  if (v22)
  {
    v23 = (void *)v22;
    uint64_t v24 = [(SISchemaDictationContext *)self userSelectedLocale];
    uint64_t v25 = [v4 userSelectedLocale];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDictationContext *)self siriSelectedLocale];
  unint64_t v6 = [v4 siriSelectedLocale];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v27 = [(SISchemaDictationContext *)self siriSelectedLocale];
  if (v27)
  {
    uint64_t v28 = (void *)v27;
    v29 = [(SISchemaDictationContext *)self siriSelectedLocale];
    uint64_t v30 = [v4 siriSelectedLocale];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDictationContext *)self keyboardLocalesEnableds];
  unint64_t v6 = [v4 keyboardLocalesEnableds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v32 = [(SISchemaDictationContext *)self keyboardLocalesEnableds];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(SISchemaDictationContext *)self keyboardLocalesEnableds];
    v35 = [v4 keyboardLocalesEnableds];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDictationContext *)self dictationLocalesEnableds];
  unint64_t v6 = [v4 dictationLocalesEnableds];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v37 = [(SISchemaDictationContext *)self dictationLocalesEnableds];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(SISchemaDictationContext *)self dictationLocalesEnableds];
    long long v40 = [v4 dictationLocalesEnableds];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDictationContext *)self bundleId];
  unint64_t v6 = [v4 bundleId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_46;
  }
  uint64_t v42 = [(SISchemaDictationContext *)self bundleId];
  if (v42)
  {
    long long v43 = (void *)v42;
    long long v44 = [(SISchemaDictationContext *)self bundleId];
    long long v45 = [v4 bundleId];
    int v46 = [v44 isEqual:v45];

    if (!v46) {
      goto LABEL_47;
    }
  }
  else
  {
  }
  unint64_t v5 = [(SISchemaDictationContext *)self textInputSessionId];
  unint64_t v6 = [v4 textInputSessionId];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v47 = [(SISchemaDictationContext *)self textInputSessionId];
    if (!v47)
    {

LABEL_50:
      BOOL v52 = 1;
      goto LABEL_48;
    }
    long long v48 = (void *)v47;
    long long v49 = [(SISchemaDictationContext *)self textInputSessionId];
    uint64_t v50 = [v4 textInputSessionId];
    char v51 = [v49 isEqual:v50];

    if (v51) {
      goto LABEL_50;
    }
  }
  else
  {
LABEL_46:
  }
LABEL_47:
  BOOL v52 = 0;
LABEL_48:

  return v52;
}

- (void)writeTo:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(SISchemaDictationContext *)self keyboardLanguage];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  unint64_t v6 = [(SISchemaDictationContext *)self keyboardLocale];

  if (v6)
  {
    uint64_t v7 = [(SISchemaDictationContext *)self keyboardLocale];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v8 = [(SISchemaDictationContext *)self dictationLocale];

  if (v8)
  {
    uint64_t v9 = [(SISchemaDictationContext *)self dictationLocale];
    PBDataWriterWriteSubmessage();
  }
  NSUInteger v10 = [(SISchemaDictationContext *)self userSelectedLocale];

  if (v10)
  {
    int v11 = [(SISchemaDictationContext *)self userSelectedLocale];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(SISchemaDictationContext *)self siriSelectedLocale];

  if (v12)
  {
    uint64_t v13 = [(SISchemaDictationContext *)self siriSelectedLocale];
    PBDataWriterWriteSubmessage();
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v14 = self->_keyboardLocalesEnableds;
  uint64_t v15 = [(NSArray *)v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v32;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v32 != v17) {
          objc_enumerationMutation(v14);
        }
        PBDataWriterWriteSubmessage();
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = [(NSArray *)v14 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v16);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v19 = self->_dictationLocalesEnableds;
  uint64_t v20 = [(NSArray *)v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v28;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(v19);
        }
        PBDataWriterWriteSubmessage();
        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [(NSArray *)v19 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v21);
  }

  uint64_t v24 = [(SISchemaDictationContext *)self bundleId];

  if (v24) {
    PBDataWriterWriteStringField();
  }
  uint64_t v25 = [(SISchemaDictationContext *)self textInputSessionId];

  if (v25)
  {
    int v26 = [(SISchemaDictationContext *)self textInputSessionId];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaDictationContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteTextInputSessionId
{
}

- (BOOL)hasTextInputSessionId
{
  return self->_textInputSessionId != 0;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

- (id)dictationLocalesEnabledAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_dictationLocalesEnableds objectAtIndexedSubscript:a3];
}

- (unint64_t)dictationLocalesEnabledCount
{
  return [(NSArray *)self->_dictationLocalesEnableds count];
}

- (void)addDictationLocalesEnabled:(id)a3
{
  id v4 = a3;
  dictationLocalesEnableds = self->_dictationLocalesEnableds;
  id v8 = v4;
  if (!dictationLocalesEnableds)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_dictationLocalesEnableds;
    self->_dictationLocalesEnableds = v6;

    id v4 = v8;
    dictationLocalesEnableds = self->_dictationLocalesEnableds;
  }
  [(NSArray *)dictationLocalesEnableds addObject:v4];
}

- (void)clearDictationLocalesEnabled
{
}

- (id)keyboardLocalesEnabledAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_keyboardLocalesEnableds objectAtIndexedSubscript:a3];
}

- (unint64_t)keyboardLocalesEnabledCount
{
  return [(NSArray *)self->_keyboardLocalesEnableds count];
}

- (void)addKeyboardLocalesEnabled:(id)a3
{
  id v4 = a3;
  keyboardLocalesEnableds = self->_keyboardLocalesEnableds;
  id v8 = v4;
  if (!keyboardLocalesEnableds)
  {
    unint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_keyboardLocalesEnableds;
    self->_keyboardLocalesEnableds = v6;

    id v4 = v8;
    keyboardLocalesEnableds = self->_keyboardLocalesEnableds;
  }
  [(NSArray *)keyboardLocalesEnableds addObject:v4];
}

- (void)clearKeyboardLocalesEnabled
{
}

- (void)deleteSiriSelectedLocale
{
}

- (BOOL)hasSiriSelectedLocale
{
  return self->_siriSelectedLocale != 0;
}

- (void)deleteUserSelectedLocale
{
}

- (BOOL)hasUserSelectedLocale
{
  return self->_userSelectedLocale != 0;
}

- (void)deleteDictationLocale
{
}

- (BOOL)hasDictationLocale
{
  return self->_dictationLocale != 0;
}

- (void)deleteKeyboardLocale
{
}

- (BOOL)hasKeyboardLocale
{
  return self->_keyboardLocale != 0;
}

- (void)deleteKeyboardLanguage
{
}

- (BOOL)hasKeyboardLanguage
{
  return self->_keyboardLanguage != 0;
}

@end
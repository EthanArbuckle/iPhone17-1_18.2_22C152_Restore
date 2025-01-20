@interface PEGASUSSchemaPEGASUSRequestEndedTier1
- (BOOL)hasAudioExecutionTier1;
- (BOOL)hasIntentTier1;
- (BOOL)hasKgQAExecutionTier1;
- (BOOL)hasLinkId;
- (BOOL)hasMapsExecutionTier1;
- (BOOL)hasSportsExecutionTier1;
- (BOOL)hasVideoExecutionTier1;
- (BOOL)hasWebAnswerExecutionTier1;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PEGASUSSchemaPEGASUSAudioExecutionTier1)audioExecutionTier1;
- (PEGASUSSchemaPEGASUSIntentTier1)intentTier1;
- (PEGASUSSchemaPEGASUSKGQAExecutionTier1)kgQAExecutionTier1;
- (PEGASUSSchemaPEGASUSMapsExecutionTier1)mapsExecutionTier1;
- (PEGASUSSchemaPEGASUSRequestEndedTier1)initWithDictionary:(id)a3;
- (PEGASUSSchemaPEGASUSRequestEndedTier1)initWithJSON:(id)a3;
- (PEGASUSSchemaPEGASUSSportsExecutionTier1)sportsExecutionTier1;
- (PEGASUSSchemaPEGASUSVideoExecutionTier1)videoExecutionTier1;
- (PEGASUSSchemaPEGASUSWebAnswerExecutionTier1)webAnswerExecutionTier1;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteAudioExecutionTier1;
- (void)deleteIntentTier1;
- (void)deleteKgQAExecutionTier1;
- (void)deleteLinkId;
- (void)deleteMapsExecutionTier1;
- (void)deleteSportsExecutionTier1;
- (void)deleteVideoExecutionTier1;
- (void)deleteWebAnswerExecutionTier1;
- (void)setAudioExecutionTier1:(id)a3;
- (void)setHasAudioExecutionTier1:(BOOL)a3;
- (void)setHasIntentTier1:(BOOL)a3;
- (void)setHasKgQAExecutionTier1:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasMapsExecutionTier1:(BOOL)a3;
- (void)setHasSportsExecutionTier1:(BOOL)a3;
- (void)setHasVideoExecutionTier1:(BOOL)a3;
- (void)setHasWebAnswerExecutionTier1:(BOOL)a3;
- (void)setIntentTier1:(id)a3;
- (void)setKgQAExecutionTier1:(id)a3;
- (void)setLinkId:(id)a3;
- (void)setMapsExecutionTier1:(id)a3;
- (void)setSportsExecutionTier1:(id)a3;
- (void)setVideoExecutionTier1:(id)a3;
- (void)setWebAnswerExecutionTier1:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PEGASUSSchemaPEGASUSRequestEndedTier1

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)PEGASUSSchemaPEGASUSRequestEndedTier1;
  v5 = [(SISchemaInstrumentationMessage *)&v31 applySensitiveConditionsPolicy:v4];
  v6 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self deleteLinkId];
  }
  v9 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self intentTier1];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self deleteIntentTier1];
  }
  v12 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self kgQAExecutionTier1];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self deleteKgQAExecutionTier1];
  }
  v15 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self webAnswerExecutionTier1];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self deleteWebAnswerExecutionTier1];
  }
  v18 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self sportsExecutionTier1];
  v19 = [v18 applySensitiveConditionsPolicy:v4];
  int v20 = [v19 suppressMessage];

  if (v20) {
    [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self deleteSportsExecutionTier1];
  }
  v21 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self mapsExecutionTier1];
  v22 = [v21 applySensitiveConditionsPolicy:v4];
  int v23 = [v22 suppressMessage];

  if (v23) {
    [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self deleteMapsExecutionTier1];
  }
  v24 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self audioExecutionTier1];
  v25 = [v24 applySensitiveConditionsPolicy:v4];
  int v26 = [v25 suppressMessage];

  if (v26) {
    [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self deleteAudioExecutionTier1];
  }
  v27 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self videoExecutionTier1];
  v28 = [v27 applySensitiveConditionsPolicy:v4];
  int v29 = [v28 suppressMessage];

  if (v29) {
    [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self deleteVideoExecutionTier1];
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
  objc_storeStrong((id *)&self->_videoExecutionTier1, 0);
  objc_storeStrong((id *)&self->_audioExecutionTier1, 0);
  objc_storeStrong((id *)&self->_mapsExecutionTier1, 0);
  objc_storeStrong((id *)&self->_sportsExecutionTier1, 0);
  objc_storeStrong((id *)&self->_webAnswerExecutionTier1, 0);
  objc_storeStrong((id *)&self->_kgQAExecutionTier1, 0);
  objc_storeStrong((id *)&self->_intentTier1, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasVideoExecutionTier1:(BOOL)a3
{
  self->_hasVideoExecutionTier1 = a3;
}

- (void)setHasAudioExecutionTier1:(BOOL)a3
{
  self->_hasAudioExecutionTier1 = a3;
}

- (void)setHasMapsExecutionTier1:(BOOL)a3
{
  self->_hasMapsExecutionTier1 = a3;
}

- (void)setHasSportsExecutionTier1:(BOOL)a3
{
  self->_hasSportsExecutionTier1 = a3;
}

- (void)setHasWebAnswerExecutionTier1:(BOOL)a3
{
  self->_hasWebAnswerExecutionTier1 = a3;
}

- (void)setHasKgQAExecutionTier1:(BOOL)a3
{
  self->_hasKgQAExecutionTier1 = a3;
}

- (void)setHasIntentTier1:(BOOL)a3
{
  self->_hasIntentTier1 = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  self->_hasLinkId = a3;
}

- (void)setVideoExecutionTier1:(id)a3
{
}

- (PEGASUSSchemaPEGASUSVideoExecutionTier1)videoExecutionTier1
{
  return self->_videoExecutionTier1;
}

- (void)setAudioExecutionTier1:(id)a3
{
}

- (PEGASUSSchemaPEGASUSAudioExecutionTier1)audioExecutionTier1
{
  return self->_audioExecutionTier1;
}

- (void)setMapsExecutionTier1:(id)a3
{
}

- (PEGASUSSchemaPEGASUSMapsExecutionTier1)mapsExecutionTier1
{
  return self->_mapsExecutionTier1;
}

- (void)setSportsExecutionTier1:(id)a3
{
}

- (PEGASUSSchemaPEGASUSSportsExecutionTier1)sportsExecutionTier1
{
  return self->_sportsExecutionTier1;
}

- (void)setWebAnswerExecutionTier1:(id)a3
{
}

- (PEGASUSSchemaPEGASUSWebAnswerExecutionTier1)webAnswerExecutionTier1
{
  return self->_webAnswerExecutionTier1;
}

- (void)setKgQAExecutionTier1:(id)a3
{
}

- (PEGASUSSchemaPEGASUSKGQAExecutionTier1)kgQAExecutionTier1
{
  return self->_kgQAExecutionTier1;
}

- (void)setIntentTier1:(id)a3
{
}

- (PEGASUSSchemaPEGASUSIntentTier1)intentTier1
{
  return self->_intentTier1;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (PEGASUSSchemaPEGASUSRequestEndedTier1)initWithDictionary:(id)a3
{
  id v4 = a3;
  v25.receiver = self;
  v25.super_class = (Class)PEGASUSSchemaPEGASUSRequestEndedTier1;
  v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)&v25 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)v5 setLinkId:v7];
    }
    v24 = (void *)v6;
    int v8 = [v4 objectForKeyedSubscript:@"intentTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PEGASUSSchemaPEGASUSIntentTier1 alloc] initWithDictionary:v8];
      [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)v5 setIntentTier1:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"kgQAExecutionTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[PEGASUSSchemaPEGASUSKGQAExecutionTier1 alloc] initWithDictionary:v10];
      [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)v5 setKgQAExecutionTier1:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"webAnswerExecutionTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 alloc] initWithDictionary:v12];
      [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)v5 setWebAnswerExecutionTier1:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"sportsExecutionTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v15 = [[PEGASUSSchemaPEGASUSSportsExecutionTier1 alloc] initWithDictionary:v14];
      [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)v5 setSportsExecutionTier1:v15];
    }
    v16 = [v4 objectForKeyedSubscript:@"mapsExecutionTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v17 = [[PEGASUSSchemaPEGASUSMapsExecutionTier1 alloc] initWithDictionary:v16];
      [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)v5 setMapsExecutionTier1:v17];
    }
    v18 = [v4 objectForKeyedSubscript:@"audioExecutionTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v19 = [[PEGASUSSchemaPEGASUSAudioExecutionTier1 alloc] initWithDictionary:v18];
      [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)v5 setAudioExecutionTier1:v19];
    }
    int v20 = [v4 objectForKeyedSubscript:@"videoExecutionTier1"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v21 = [[PEGASUSSchemaPEGASUSVideoExecutionTier1 alloc] initWithDictionary:v20];
      [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)v5 setVideoExecutionTier1:v21];
    }
    v22 = v5;
  }
  return v5;
}

- (PEGASUSSchemaPEGASUSRequestEndedTier1)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self dictionaryRepresentation];
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
  if (self->_audioExecutionTier1)
  {
    id v4 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self audioExecutionTier1];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"audioExecutionTier1"];
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"audioExecutionTier1"];
    }
  }
  if (self->_intentTier1)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self intentTier1];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"intentTier1"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"intentTier1"];
    }
  }
  if (self->_kgQAExecutionTier1)
  {
    v10 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self kgQAExecutionTier1];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"kgQAExecutionTier1"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"kgQAExecutionTier1"];
    }
  }
  if (self->_linkId)
  {
    v13 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self linkId];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"linkId"];
    }
  }
  if (self->_mapsExecutionTier1)
  {
    v16 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self mapsExecutionTier1];
    int v17 = [v16 dictionaryRepresentation];
    if (v17)
    {
      [v3 setObject:v17 forKeyedSubscript:@"mapsExecutionTier1"];
    }
    else
    {
      v18 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v18 forKeyedSubscript:@"mapsExecutionTier1"];
    }
  }
  if (self->_sportsExecutionTier1)
  {
    v19 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self sportsExecutionTier1];
    int v20 = [v19 dictionaryRepresentation];
    if (v20)
    {
      [v3 setObject:v20 forKeyedSubscript:@"sportsExecutionTier1"];
    }
    else
    {
      v21 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v21 forKeyedSubscript:@"sportsExecutionTier1"];
    }
  }
  if (self->_videoExecutionTier1)
  {
    v22 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self videoExecutionTier1];
    int v23 = [v22 dictionaryRepresentation];
    if (v23)
    {
      [v3 setObject:v23 forKeyedSubscript:@"videoExecutionTier1"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"videoExecutionTier1"];
    }
  }
  if (self->_webAnswerExecutionTier1)
  {
    objc_super v25 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self webAnswerExecutionTier1];
    int v26 = [v25 dictionaryRepresentation];
    if (v26)
    {
      [v3 setObject:v26 forKeyedSubscript:@"webAnswerExecutionTier1"];
    }
    else
    {
      v27 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v27 forKeyedSubscript:@"webAnswerExecutionTier1"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  unint64_t v4 = [(PEGASUSSchemaPEGASUSIntentTier1 *)self->_intentTier1 hash] ^ v3;
  unint64_t v5 = [(PEGASUSSchemaPEGASUSKGQAExecutionTier1 *)self->_kgQAExecutionTier1 hash];
  unint64_t v6 = v4 ^ v5 ^ [(PEGASUSSchemaPEGASUSWebAnswerExecutionTier1 *)self->_webAnswerExecutionTier1 hash];
  unint64_t v7 = [(PEGASUSSchemaPEGASUSSportsExecutionTier1 *)self->_sportsExecutionTier1 hash];
  unint64_t v8 = v7 ^ [(PEGASUSSchemaPEGASUSMapsExecutionTier1 *)self->_mapsExecutionTier1 hash];
  unint64_t v9 = v6 ^ v8 ^ [(PEGASUSSchemaPEGASUSAudioExecutionTier1 *)self->_audioExecutionTier1 hash];
  return v9 ^ [(PEGASUSSchemaPEGASUSVideoExecutionTier1 *)self->_videoExecutionTier1 hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_42;
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self linkId];
  unint64_t v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v7 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self linkId];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    unint64_t v9 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self linkId];
    v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self intentTier1];
  unint64_t v6 = [v4 intentTier1];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self intentTier1];
  if (v12)
  {
    v13 = (void *)v12;
    int v14 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self intentTier1];
    v15 = [v4 intentTier1];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self kgQAExecutionTier1];
  unint64_t v6 = [v4 kgQAExecutionTier1];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v17 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self kgQAExecutionTier1];
  if (v17)
  {
    v18 = (void *)v17;
    v19 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self kgQAExecutionTier1];
    int v20 = [v4 kgQAExecutionTier1];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self webAnswerExecutionTier1];
  unint64_t v6 = [v4 webAnswerExecutionTier1];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v22 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self webAnswerExecutionTier1];
  if (v22)
  {
    int v23 = (void *)v22;
    v24 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self webAnswerExecutionTier1];
    objc_super v25 = [v4 webAnswerExecutionTier1];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self sportsExecutionTier1];
  unint64_t v6 = [v4 sportsExecutionTier1];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v27 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self sportsExecutionTier1];
  if (v27)
  {
    v28 = (void *)v27;
    int v29 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self sportsExecutionTier1];
    v30 = [v4 sportsExecutionTier1];
    int v31 = [v29 isEqual:v30];

    if (!v31) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self mapsExecutionTier1];
  unint64_t v6 = [v4 mapsExecutionTier1];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v32 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self mapsExecutionTier1];
  if (v32)
  {
    v33 = (void *)v32;
    v34 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self mapsExecutionTier1];
    v35 = [v4 mapsExecutionTier1];
    int v36 = [v34 isEqual:v35];

    if (!v36) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self audioExecutionTier1];
  unint64_t v6 = [v4 audioExecutionTier1];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_41;
  }
  uint64_t v37 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self audioExecutionTier1];
  if (v37)
  {
    v38 = (void *)v37;
    v39 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self audioExecutionTier1];
    v40 = [v4 audioExecutionTier1];
    int v41 = [v39 isEqual:v40];

    if (!v41) {
      goto LABEL_42;
    }
  }
  else
  {
  }
  unint64_t v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self videoExecutionTier1];
  unint64_t v6 = [v4 videoExecutionTier1];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v42 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self videoExecutionTier1];
    if (!v42)
    {

LABEL_45:
      BOOL v47 = 1;
      goto LABEL_43;
    }
    v43 = (void *)v42;
    v44 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self videoExecutionTier1];
    v45 = [v4 videoExecutionTier1];
    char v46 = [v44 isEqual:v45];

    if (v46) {
      goto LABEL_45;
    }
  }
  else
  {
LABEL_41:
  }
LABEL_42:
  BOOL v47 = 0;
LABEL_43:

  return v47;
}

- (void)writeTo:(id)a3
{
  id v20 = a3;
  id v4 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self linkId];

  if (v4)
  {
    unint64_t v5 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self intentTier1];

  if (v6)
  {
    uint64_t v7 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self intentTier1];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self kgQAExecutionTier1];

  if (v8)
  {
    unint64_t v9 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self kgQAExecutionTier1];
    PBDataWriterWriteSubmessage();
  }
  v10 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self webAnswerExecutionTier1];

  if (v10)
  {
    int v11 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self webAnswerExecutionTier1];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v12 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self sportsExecutionTier1];

  if (v12)
  {
    v13 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self sportsExecutionTier1];
    PBDataWriterWriteSubmessage();
  }
  int v14 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self mapsExecutionTier1];

  if (v14)
  {
    v15 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self mapsExecutionTier1];
    PBDataWriterWriteSubmessage();
  }
  int v16 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self audioExecutionTier1];

  if (v16)
  {
    uint64_t v17 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self audioExecutionTier1];
    PBDataWriterWriteSubmessage();
  }
  v18 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self videoExecutionTier1];

  if (v18)
  {
    v19 = [(PEGASUSSchemaPEGASUSRequestEndedTier1 *)self videoExecutionTier1];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PEGASUSSchemaPEGASUSRequestEndedTier1ReadFrom(self, (uint64_t)a3);
}

- (void)deleteVideoExecutionTier1
{
}

- (BOOL)hasVideoExecutionTier1
{
  return self->_videoExecutionTier1 != 0;
}

- (void)deleteAudioExecutionTier1
{
}

- (BOOL)hasAudioExecutionTier1
{
  return self->_audioExecutionTier1 != 0;
}

- (void)deleteMapsExecutionTier1
{
}

- (BOOL)hasMapsExecutionTier1
{
  return self->_mapsExecutionTier1 != 0;
}

- (void)deleteSportsExecutionTier1
{
}

- (BOOL)hasSportsExecutionTier1
{
  return self->_sportsExecutionTier1 != 0;
}

- (void)deleteWebAnswerExecutionTier1
{
}

- (BOOL)hasWebAnswerExecutionTier1
{
  return self->_webAnswerExecutionTier1 != 0;
}

- (void)deleteKgQAExecutionTier1
{
}

- (BOOL)hasKgQAExecutionTier1
{
  return self->_kgQAExecutionTier1 != 0;
}

- (void)deleteIntentTier1
{
}

- (BOOL)hasIntentTier1
{
  return self->_intentTier1 != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end
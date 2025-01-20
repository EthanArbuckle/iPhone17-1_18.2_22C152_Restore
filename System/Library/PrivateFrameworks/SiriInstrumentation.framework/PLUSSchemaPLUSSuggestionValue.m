@interface PLUSSchemaPLUSSuggestionValue
- (BOOL)hasMediaSuggestion;
- (BOOL)hasUniversalSuggestion;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSMediaSuggestion)mediaSuggestion;
- (PLUSSchemaPLUSSuggestionValue)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggestionValue)initWithJSON:(id)a3;
- (PLUSSchemaPLUSUniversalSuggestion)universalSuggestion;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichSuggestion;
- (void)deleteMediaSuggestion;
- (void)deleteUniversalSuggestion;
- (void)setHasMediaSuggestion:(BOOL)a3;
- (void)setHasUniversalSuggestion:(BOOL)a3;
- (void)setMediaSuggestion:(id)a3;
- (void)setUniversalSuggestion:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggestionValue

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLUSSchemaPLUSSuggestionValue;
  v5 = [(SISchemaInstrumentationMessage *)&v13 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggestionValue *)self universalSuggestion];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(PLUSSchemaPLUSSuggestionValue *)self deleteUniversalSuggestion];
  }
  v9 = [(PLUSSchemaPLUSSuggestionValue *)self mediaSuggestion];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(PLUSSchemaPLUSSuggestionValue *)self deleteMediaSuggestion];
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
  objc_storeStrong((id *)&self->_mediaSuggestion, 0);
  objc_storeStrong((id *)&self->_universalSuggestion, 0);
}

- (void)setHasMediaSuggestion:(BOOL)a3
{
  self->_hasMediaSuggestion = a3;
}

- (BOOL)hasMediaSuggestion
{
  return self->_hasMediaSuggestion;
}

- (void)setHasUniversalSuggestion:(BOOL)a3
{
  self->_hasUniversalSuggestion = a3;
}

- (BOOL)hasUniversalSuggestion
{
  return self->_hasUniversalSuggestion;
}

- (unint64_t)whichSuggestion
{
  return self->_whichSuggestion;
}

- (PLUSSchemaPLUSSuggestionValue)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)PLUSSchemaPLUSSuggestionValue;
  v5 = [(PLUSSchemaPLUSSuggestionValue *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"universalSuggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSUniversalSuggestion alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggestionValue *)v5 setUniversalSuggestion:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"mediaSuggestion"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[PLUSSchemaPLUSMediaSuggestion alloc] initWithDictionary:v8];
      [(PLUSSchemaPLUSSuggestionValue *)v5 setMediaSuggestion:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggestionValue)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggestionValue *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggestionValue *)self dictionaryRepresentation];
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
  if (self->_mediaSuggestion)
  {
    id v4 = [(PLUSSchemaPLUSSuggestionValue *)self mediaSuggestion];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"mediaSuggestion"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"mediaSuggestion"];
    }
  }
  if (self->_universalSuggestion)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestionValue *)self universalSuggestion];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"universalSuggestion"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"universalSuggestion"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(PLUSSchemaPLUSUniversalSuggestion *)self->_universalSuggestion hash];
  return [(PLUSSchemaPLUSMediaSuggestion *)self->_mediaSuggestion hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_13;
  }
  unint64_t whichSuggestion = self->_whichSuggestion;
  if (whichSuggestion != [v4 whichSuggestion]) {
    goto LABEL_13;
  }
  v6 = [(PLUSSchemaPLUSSuggestionValue *)self universalSuggestion];
  uint64_t v7 = [v4 universalSuggestion];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_12;
  }
  uint64_t v8 = [(PLUSSchemaPLUSSuggestionValue *)self universalSuggestion];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(PLUSSchemaPLUSSuggestionValue *)self universalSuggestion];
    int v11 = [v4 universalSuggestion];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_13;
    }
  }
  else
  {
  }
  v6 = [(PLUSSchemaPLUSSuggestionValue *)self mediaSuggestion];
  uint64_t v7 = [v4 mediaSuggestion];
  if ((v6 == 0) != (v7 != 0))
  {
    uint64_t v13 = [(PLUSSchemaPLUSSuggestionValue *)self mediaSuggestion];
    if (!v13)
    {

LABEL_16:
      BOOL v18 = 1;
      goto LABEL_14;
    }
    v14 = (void *)v13;
    v15 = [(PLUSSchemaPLUSSuggestionValue *)self mediaSuggestion];
    v16 = [v4 mediaSuggestion];
    char v17 = [v15 isEqual:v16];

    if (v17) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_12:
  }
LABEL_13:
  BOOL v18 = 0;
LABEL_14:

  return v18;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(PLUSSchemaPLUSSuggestionValue *)self universalSuggestion];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSSuggestionValue *)self universalSuggestion];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(PLUSSchemaPLUSSuggestionValue *)self mediaSuggestion];

  if (v6)
  {
    uint64_t v7 = [(PLUSSchemaPLUSSuggestionValue *)self mediaSuggestion];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionValueReadFrom(self, (uint64_t)a3);
}

- (void)deleteMediaSuggestion
{
  if (self->_whichSuggestion == 101)
  {
    self->_unint64_t whichSuggestion = 0;
    self->_mediaSuggestion = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSMediaSuggestion)mediaSuggestion
{
  if (self->_whichSuggestion == 101) {
    v2 = self->_mediaSuggestion;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMediaSuggestion:(id)a3
{
  id v4 = (PLUSSchemaPLUSMediaSuggestion *)a3;
  universalSuggestion = self->_universalSuggestion;
  self->_universalSuggestion = 0;

  unint64_t v6 = 101;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichSuggestion = v6;
  mediaSuggestion = self->_mediaSuggestion;
  self->_mediaSuggestion = v4;
}

- (void)deleteUniversalSuggestion
{
  if (self->_whichSuggestion == 100)
  {
    self->_unint64_t whichSuggestion = 0;
    self->_universalSuggestion = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSUniversalSuggestion)universalSuggestion
{
  if (self->_whichSuggestion == 100) {
    v2 = self->_universalSuggestion;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setUniversalSuggestion:(id)a3
{
  id v4 = (PLUSSchemaPLUSUniversalSuggestion *)a3;
  mediaSuggestion = self->_mediaSuggestion;
  self->_mediaSuggestion = 0;

  unint64_t v6 = 100;
  if (!v4) {
    unint64_t v6 = 0;
  }
  self->_unint64_t whichSuggestion = v6;
  universalSuggestion = self->_universalSuggestion;
  self->_universalSuggestion = v4;
}

@end
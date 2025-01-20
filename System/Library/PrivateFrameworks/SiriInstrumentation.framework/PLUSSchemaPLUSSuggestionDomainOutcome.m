@interface PLUSSchemaPLUSSuggestionDomainOutcome
- (BOOL)hasMediaOutcome;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSMediaSuggestionOutcome)mediaOutcome;
- (PLUSSchemaPLUSSuggestionDomainOutcome)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggestionDomainOutcome)initWithJSON:(id)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichDomainsuggestionoutcome;
- (void)deleteMediaOutcome;
- (void)setHasMediaOutcome:(BOOL)a3;
- (void)setMediaOutcome:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggestionDomainOutcome

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSSuggestionDomainOutcome;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggestionDomainOutcome *)self mediaOutcome];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSSuggestionDomainOutcome *)self deleteMediaOutcome];
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

- (void)setHasMediaOutcome:(BOOL)a3
{
  self->_hasMediaOutcome = a3;
}

- (BOOL)hasMediaOutcome
{
  return self->_hasMediaOutcome;
}

- (unint64_t)whichDomainsuggestionoutcome
{
  return self->_whichDomainsuggestionoutcome;
}

- (PLUSSchemaPLUSSuggestionDomainOutcome)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSSuggestionDomainOutcome;
  v5 = [(PLUSSchemaPLUSSuggestionDomainOutcome *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mediaOutcome"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSMediaSuggestionOutcome alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggestionDomainOutcome *)v5 setMediaOutcome:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggestionDomainOutcome)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggestionDomainOutcome *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggestionDomainOutcome *)self dictionaryRepresentation];
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
  if (self->_mediaOutcome)
  {
    id v4 = [(PLUSSchemaPLUSSuggestionDomainOutcome *)self mediaOutcome];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"mediaOutcome"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"mediaOutcome"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(PLUSSchemaPLUSMediaSuggestionOutcome *)self->_mediaOutcome hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichDomainsuggestionoutcome = self->_whichDomainsuggestionoutcome;
    if (whichDomainsuggestionoutcome == [v4 whichDomainsuggestionoutcome])
    {
      v6 = [(PLUSSchemaPLUSSuggestionDomainOutcome *)self mediaOutcome];
      uint64_t v7 = [v4 mediaOutcome];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(PLUSSchemaPLUSSuggestionDomainOutcome *)self mediaOutcome];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(PLUSSchemaPLUSSuggestionDomainOutcome *)self mediaOutcome];
        v12 = [v4 mediaOutcome];
        char v13 = [v11 isEqual:v12];

        if (v13) {
          goto LABEL_11;
        }
      }
      else
      {
      }
    }
  }
  BOOL v14 = 0;
LABEL_9:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  id v4 = [(PLUSSchemaPLUSSuggestionDomainOutcome *)self mediaOutcome];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSSuggestionDomainOutcome *)self mediaOutcome];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggestionDomainOutcomeReadFrom(self, (uint64_t)a3);
}

- (void)deleteMediaOutcome
{
  if (self->_whichDomainsuggestionoutcome == 100)
  {
    self->_unint64_t whichDomainsuggestionoutcome = 0;
    self->_mediaOutcome = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSMediaSuggestionOutcome)mediaOutcome
{
  if (self->_whichDomainsuggestionoutcome == 100) {
    v2 = self->_mediaOutcome;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMediaOutcome:(id)a3
{
  unint64_t v3 = 100;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichDomainsuggestionoutcome = v3;
  objc_storeStrong((id *)&self->_mediaOutcome, a3);
}

@end
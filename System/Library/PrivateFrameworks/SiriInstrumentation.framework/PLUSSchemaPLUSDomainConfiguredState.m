@interface PLUSSchemaPLUSDomainConfiguredState
- (BOOL)hasMediaState;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSDomainConfiguredState)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSDomainConfiguredState)initWithJSON:(id)a3;
- (PLUSSchemaPLUSMediaConfiguredState)mediaState;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichDomainstate;
- (void)deleteMediaState;
- (void)setHasMediaState:(BOOL)a3;
- (void)setMediaState:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSDomainConfiguredState

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSDomainConfiguredState;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSDomainConfiguredState *)self mediaState];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSDomainConfiguredState *)self deleteMediaState];
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

- (void)setHasMediaState:(BOOL)a3
{
  self->_hasMediaState = a3;
}

- (BOOL)hasMediaState
{
  return self->_hasMediaState;
}

- (unint64_t)whichDomainstate
{
  return self->_whichDomainstate;
}

- (PLUSSchemaPLUSDomainConfiguredState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSDomainConfiguredState;
  v5 = [(PLUSSchemaPLUSDomainConfiguredState *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mediaState"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSMediaConfiguredState alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSDomainConfiguredState *)v5 setMediaState:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSDomainConfiguredState)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSDomainConfiguredState *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSDomainConfiguredState *)self dictionaryRepresentation];
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
  if (self->_mediaState)
  {
    id v4 = [(PLUSSchemaPLUSDomainConfiguredState *)self mediaState];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"mediaState"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"mediaState"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(PLUSSchemaPLUSMediaConfiguredState *)self->_mediaState hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichDomainstate = self->_whichDomainstate;
    if (whichDomainstate == [v4 whichDomainstate])
    {
      v6 = [(PLUSSchemaPLUSDomainConfiguredState *)self mediaState];
      uint64_t v7 = [v4 mediaState];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(PLUSSchemaPLUSDomainConfiguredState *)self mediaState];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(PLUSSchemaPLUSDomainConfiguredState *)self mediaState];
        v12 = [v4 mediaState];
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
  id v4 = [(PLUSSchemaPLUSDomainConfiguredState *)self mediaState];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSDomainConfiguredState *)self mediaState];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSDomainConfiguredStateReadFrom(self, (uint64_t)a3);
}

- (void)deleteMediaState
{
  if (self->_whichDomainstate == 100)
  {
    self->_unint64_t whichDomainstate = 0;
    self->_mediaState = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSMediaConfiguredState)mediaState
{
  if (self->_whichDomainstate == 100) {
    v2 = self->_mediaState;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMediaState:(id)a3
{
  unint64_t v3 = 100;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichDomainstate = v3;
  objc_storeStrong((id *)&self->_mediaState, a3);
}

@end
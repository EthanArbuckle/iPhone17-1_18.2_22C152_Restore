@interface SISchemaTapToEditInvocationContext
- (BOOL)hasIsTranscriptEdited;
- (BOOL)isEqual:(id)a3;
- (BOOL)isTranscriptEdited;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaTapToEditInvocationContext)initWithDictionary:(id)a3;
- (SISchemaTapToEditInvocationContext)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteIsTranscriptEdited;
- (void)setHasIsTranscriptEdited:(BOOL)a3;
- (void)setIsTranscriptEdited:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaTapToEditInvocationContext

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (BOOL)isTranscriptEdited
{
  return self->_isTranscriptEdited;
}

- (SISchemaTapToEditInvocationContext)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SISchemaTapToEditInvocationContext;
  v5 = [(SISchemaTapToEditInvocationContext *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"isTranscriptEdited"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaTapToEditInvocationContext setIsTranscriptEdited:](v5, "setIsTranscriptEdited:", [v6 BOOLValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (SISchemaTapToEditInvocationContext)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaTapToEditInvocationContext *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaTapToEditInvocationContext *)self dictionaryRepresentation];
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
  if (*(&self->_isTranscriptEdited + 1))
  {
    id v4 = objc_msgSend(NSNumber, "numberWithBool:", -[SISchemaTapToEditInvocationContext isTranscriptEdited](self, "isTranscriptEdited"));
    [v3 setObject:v4 forKeyedSubscript:@"isTranscriptEdited"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(&self->_isTranscriptEdited + 1)) {
    return 2654435761 * self->_isTranscriptEdited;
  }
  else {
    return 0;
  }
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  BOOL v6 = 0;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if (*(&self->_isTranscriptEdited + 1) == (v4[9] & 1))
    {
      if (!*(&self->_isTranscriptEdited + 1)
        || (int isTranscriptEdited = self->_isTranscriptEdited,
            isTranscriptEdited == [v4 isTranscriptEdited]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(&self->_isTranscriptEdited + 1)) {
    PBDataWriterWriteBOOLField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaTapToEditInvocationContextReadFrom(self, (uint64_t)a3);
}

- (void)deleteIsTranscriptEdited
{
  *(&self->_isTranscriptEdited + 1) &= ~1u;
}

- (void)setHasIsTranscriptEdited:(BOOL)a3
{
  *(&self->_isTranscriptEdited + 1) = *(&self->_isTranscriptEdited + 1) & 0xFE | a3;
}

- (BOOL)hasIsTranscriptEdited
{
  return *(&self->_isTranscriptEdited + 1);
}

- (void)setIsTranscriptEdited:(BOOL)a3
{
  *(&self->_isTranscriptEdited + 1) |= 1u;
  self->_int isTranscriptEdited = a3;
}

@end
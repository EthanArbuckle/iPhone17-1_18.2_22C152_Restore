@interface SISchemaEnrolledUserState
- (BOOL)hasPersonalization;
- (BOOL)hasSiriLinkedSpeechID;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)siriLinkedSpeechID;
- (SISchemaEnrolledUserState)initWithDictionary:(id)a3;
- (SISchemaEnrolledUserState)initWithJSON:(id)a3;
- (SISchemaPersonalization)personalization;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deletePersonalization;
- (void)deleteSiriLinkedSpeechID;
- (void)setHasPersonalization:(BOOL)a3;
- (void)setHasSiriLinkedSpeechID:(BOOL)a3;
- (void)setPersonalization:(id)a3;
- (void)setSiriLinkedSpeechID:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaEnrolledUserState

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaEnrolledUserState;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaEnrolledUserState *)self personalization];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaEnrolledUserState *)self deletePersonalization];
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
  objc_storeStrong((id *)&self->_personalization, 0);
  objc_storeStrong((id *)&self->_siriLinkedSpeechID, 0);
}

- (void)setHasPersonalization:(BOOL)a3
{
  self->_hasPersonalization = a3;
}

- (void)setHasSiriLinkedSpeechID:(BOOL)a3
{
  self->_hasSiriLinkedSpeechID = a3;
}

- (void)setPersonalization:(id)a3
{
}

- (SISchemaPersonalization)personalization
{
  return self->_personalization;
}

- (void)setSiriLinkedSpeechID:(id)a3
{
}

- (NSString)siriLinkedSpeechID
{
  return self->_siriLinkedSpeechID;
}

- (SISchemaEnrolledUserState)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SISchemaEnrolledUserState;
  v5 = [(SISchemaEnrolledUserState *)&v12 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"siriLinkedSpeechID"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(SISchemaEnrolledUserState *)v5 setSiriLinkedSpeechID:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"personalization"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = [[SISchemaPersonalization alloc] initWithDictionary:v8];
      [(SISchemaEnrolledUserState *)v5 setPersonalization:v9];
    }
    v10 = v5;
  }
  return v5;
}

- (SISchemaEnrolledUserState)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaEnrolledUserState *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaEnrolledUserState *)self dictionaryRepresentation];
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
  if (self->_personalization)
  {
    id v4 = [(SISchemaEnrolledUserState *)self personalization];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"personalization"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"personalization"];
    }
  }
  if (self->_siriLinkedSpeechID)
  {
    uint64_t v7 = [(SISchemaEnrolledUserState *)self siriLinkedSpeechID];
    v8 = (void *)[v7 copy];
    [v3 setObject:v8 forKeyedSubscript:@"siriLinkedSpeechID"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_siriLinkedSpeechID hash];
  return [(SISchemaPersonalization *)self->_personalization hash] ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(SISchemaEnrolledUserState *)self siriLinkedSpeechID];
  v6 = [v4 siriLinkedSpeechID];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(SISchemaEnrolledUserState *)self siriLinkedSpeechID];
  if (v7)
  {
    v8 = (void *)v7;
    objc_super v9 = [(SISchemaEnrolledUserState *)self siriLinkedSpeechID];
    v10 = [v4 siriLinkedSpeechID];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  v5 = [(SISchemaEnrolledUserState *)self personalization];
  v6 = [v4 personalization];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v12 = [(SISchemaEnrolledUserState *)self personalization];
    if (!v12)
    {

LABEL_15:
      BOOL v17 = 1;
      goto LABEL_13;
    }
    v13 = (void *)v12;
    v14 = [(SISchemaEnrolledUserState *)self personalization];
    v15 = [v4 personalization];
    char v16 = [v14 isEqual:v15];

    if (v16) {
      goto LABEL_15;
    }
  }
  else
  {
LABEL_11:
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  id v4 = [(SISchemaEnrolledUserState *)self siriLinkedSpeechID];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(SISchemaEnrolledUserState *)self personalization];

  if (v5)
  {
    v6 = [(SISchemaEnrolledUserState *)self personalization];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaEnrolledUserStateReadFrom(self, (uint64_t)a3);
}

- (void)deletePersonalization
{
}

- (BOOL)hasPersonalization
{
  return self->_personalization != 0;
}

- (void)deleteSiriLinkedSpeechID
{
}

- (BOOL)hasSiriLinkedSpeechID
{
  return self->_siriLinkedSpeechID != 0;
}

@end
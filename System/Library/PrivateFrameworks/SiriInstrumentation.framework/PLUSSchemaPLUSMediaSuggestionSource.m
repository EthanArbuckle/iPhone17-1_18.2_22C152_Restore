@interface PLUSSchemaPLUSMediaSuggestionSource
- (BOOL)hasSourceType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSMediaSuggestionSource)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSMediaSuggestionSource)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)sourceType;
- (unint64_t)hash;
- (void)deleteSourceType;
- (void)setHasSourceType:(BOOL)a3;
- (void)setSourceType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSMediaSuggestionSource

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int)sourceType
{
  return self->_sourceType;
}

- (PLUSSchemaPLUSMediaSuggestionSource)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSMediaSuggestionSource;
  v5 = [(PLUSSchemaPLUSMediaSuggestionSource *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"sourceType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[PLUSSchemaPLUSMediaSuggestionSource setSourceType:](v5, "setSourceType:", [v6 intValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSMediaSuggestionSource)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSMediaSuggestionSource *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSMediaSuggestionSource *)self dictionaryRepresentation];
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
  if (*(unsigned char *)&self->_has)
  {
    if ([(PLUSSchemaPLUSMediaSuggestionSource *)self sourceType] == 1) {
      id v4 = @"PLUSMEDIASUGGESTIONSOURCE_PLUS_INFERRED_MEDIA_SUGGESTER";
    }
    else {
      id v4 = @"PLUSMEDIASUGGESTIONSOURCE_UNKNOWN";
    }
    [v3 setObject:v4 forKeyedSubscript:@"sourceType"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_sourceType;
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
    if ((*(unsigned char *)&self->_has & 1) == (v4[12] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int sourceType = self->_sourceType, sourceType == [v4 sourceType]))
      {
        BOOL v6 = 1;
      }
    }
  }

  return v6;
}

- (void)writeTo:(id)a3
{
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSMediaSuggestionSourceReadFrom(self, (uint64_t)a3);
}

- (void)deleteSourceType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSourceType:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSourceType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSourceType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int sourceType = a3;
}

@end
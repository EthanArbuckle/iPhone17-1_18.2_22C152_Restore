@interface POMMESSchemaPOMMESPegasusSearchQueryUserSpan
- (BOOL)hasLabel;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)label;
- (POMMESSchemaPOMMESPegasusSearchQueryUserSpan)initWithDictionary:(id)a3;
- (POMMESSchemaPOMMESPegasusSearchQueryUserSpan)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteLabel;
- (void)setHasLabel:(BOOL)a3;
- (void)setLabel:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation POMMESSchemaPOMMESPegasusSearchQueryUserSpan

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasLabel:(BOOL)a3
{
  self->_hasLabel = a3;
}

- (void)setLabel:(id)a3
{
}

- (NSString)label
{
  return self->_label;
}

- (POMMESSchemaPOMMESPegasusSearchQueryUserSpan)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)POMMESSchemaPOMMESPegasusSearchQueryUserSpan;
  v5 = [(POMMESSchemaPOMMESPegasusSearchQueryUserSpan *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"label"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(POMMESSchemaPOMMESPegasusSearchQueryUserSpan *)v5 setLabel:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (POMMESSchemaPOMMESPegasusSearchQueryUserSpan)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(POMMESSchemaPOMMESPegasusSearchQueryUserSpan *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(POMMESSchemaPOMMESPegasusSearchQueryUserSpan *)self dictionaryRepresentation];
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
  if (self->_label)
  {
    id v4 = [(POMMESSchemaPOMMESPegasusSearchQueryUserSpan *)self label];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"label"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(NSString *)self->_label hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = [(POMMESSchemaPOMMESPegasusSearchQueryUserSpan *)self label];
    v6 = [v4 label];
    uint64_t v7 = v6;
    if ((v5 == 0) != (v6 != 0))
    {
      uint64_t v8 = [(POMMESSchemaPOMMESPegasusSearchQueryUserSpan *)self label];
      if (!v8)
      {

LABEL_10:
        BOOL v13 = 1;
        goto LABEL_8;
      }
      v9 = (void *)v8;
      objc_super v10 = [(POMMESSchemaPOMMESPegasusSearchQueryUserSpan *)self label];
      v11 = [v4 label];
      char v12 = [v10 isEqual:v11];

      if (v12) {
        goto LABEL_10;
      }
    }
    else
    {
    }
  }
  BOOL v13 = 0;
LABEL_8:

  return v13;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  id v4 = [(POMMESSchemaPOMMESPegasusSearchQueryUserSpan *)self label];

  if (v4) {
    PBDataWriterWriteStringField();
  }
}

- (BOOL)readFrom:(id)a3
{
  return POMMESSchemaPOMMESPegasusSearchQueryUserSpanReadFrom(self, (uint64_t)a3);
}

- (void)deleteLabel
{
}

- (BOOL)hasLabel
{
  return self->_label != 0;
}

@end
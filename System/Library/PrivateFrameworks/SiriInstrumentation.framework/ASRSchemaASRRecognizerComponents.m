@interface ASRSchemaASRRecognizerComponents
- (ASRSchemaASRRecognizerComponents)initWithDictionary:(id)a3;
- (ASRSchemaASRRecognizerComponents)initWithJSON:(id)a3;
- (BOOL)hasDecodable;
- (BOOL)hasDecoder;
- (BOOL)hasFrontend;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)decodable;
- (NSString)decoder;
- (NSString)frontend;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteDecodable;
- (void)deleteDecoder;
- (void)deleteFrontend;
- (void)setDecodable:(id)a3;
- (void)setDecoder:(id)a3;
- (void)setFrontend:(id)a3;
- (void)setHasDecodable:(BOOL)a3;
- (void)setHasDecoder:(BOOL)a3;
- (void)setHasFrontend:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation ASRSchemaASRRecognizerComponents

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_decoder, 0);
  objc_storeStrong((id *)&self->_decodable, 0);
  objc_storeStrong((id *)&self->_frontend, 0);
}

- (void)setHasDecoder:(BOOL)a3
{
  self->_hasDecoder = a3;
}

- (void)setHasDecodable:(BOOL)a3
{
  self->_hasDecodable = a3;
}

- (void)setHasFrontend:(BOOL)a3
{
  self->_hasFrontend = a3;
}

- (void)setDecoder:(id)a3
{
}

- (NSString)decoder
{
  return self->_decoder;
}

- (void)setDecodable:(id)a3
{
}

- (NSString)decodable
{
  return self->_decodable;
}

- (void)setFrontend:(id)a3
{
}

- (NSString)frontend
{
  return self->_frontend;
}

- (ASRSchemaASRRecognizerComponents)initWithDictionary:(id)a3
{
  id v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)ASRSchemaASRRecognizerComponents;
  v5 = [(ASRSchemaASRRecognizerComponents *)&v14 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"frontend"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(ASRSchemaASRRecognizerComponents *)v5 setFrontend:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"decodable"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(ASRSchemaASRRecognizerComponents *)v5 setDecodable:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"decoder"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = (void *)[v10 copy];
      [(ASRSchemaASRRecognizerComponents *)v5 setDecoder:v11];
    }
    v12 = v5;
  }
  return v5;
}

- (ASRSchemaASRRecognizerComponents)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(ASRSchemaASRRecognizerComponents *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(ASRSchemaASRRecognizerComponents *)self dictionaryRepresentation];
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
  if (self->_decodable)
  {
    id v4 = [(ASRSchemaASRRecognizerComponents *)self decodable];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"decodable"];
  }
  if (self->_decoder)
  {
    v6 = [(ASRSchemaASRRecognizerComponents *)self decoder];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"decoder"];
  }
  if (self->_frontend)
  {
    v8 = [(ASRSchemaASRRecognizerComponents *)self frontend];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"frontend"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_frontend hash];
  NSUInteger v4 = [(NSString *)self->_decodable hash] ^ v3;
  return v4 ^ [(NSString *)self->_decoder hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_17;
  }
  v5 = [(ASRSchemaASRRecognizerComponents *)self frontend];
  v6 = [v4 frontend];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v7 = [(ASRSchemaASRRecognizerComponents *)self frontend];
  if (v7)
  {
    v8 = (void *)v7;
    v9 = [(ASRSchemaASRRecognizerComponents *)self frontend];
    v10 = [v4 frontend];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRRecognizerComponents *)self decodable];
  v6 = [v4 decodable];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_16;
  }
  uint64_t v12 = [(ASRSchemaASRRecognizerComponents *)self decodable];
  if (v12)
  {
    v13 = (void *)v12;
    objc_super v14 = [(ASRSchemaASRRecognizerComponents *)self decodable];
    v15 = [v4 decodable];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_17;
    }
  }
  else
  {
  }
  v5 = [(ASRSchemaASRRecognizerComponents *)self decoder];
  v6 = [v4 decoder];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v17 = [(ASRSchemaASRRecognizerComponents *)self decoder];
    if (!v17)
    {

LABEL_20:
      BOOL v22 = 1;
      goto LABEL_18;
    }
    v18 = (void *)v17;
    v19 = [(ASRSchemaASRRecognizerComponents *)self decoder];
    v20 = [v4 decoder];
    char v21 = [v19 isEqual:v20];

    if (v21) {
      goto LABEL_20;
    }
  }
  else
  {
LABEL_16:
  }
LABEL_17:
  BOOL v22 = 0;
LABEL_18:

  return v22;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  id v4 = [(ASRSchemaASRRecognizerComponents *)self frontend];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  v5 = [(ASRSchemaASRRecognizerComponents *)self decodable];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(ASRSchemaASRRecognizerComponents *)self decoder];

  uint64_t v7 = v8;
  if (v6)
  {
    PBDataWriterWriteStringField();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return ASRSchemaASRRecognizerComponentsReadFrom(self, (uint64_t)a3);
}

- (void)deleteDecoder
{
}

- (BOOL)hasDecoder
{
  return self->_decoder != 0;
}

- (void)deleteDecodable
{
}

- (BOOL)hasDecodable
{
  return self->_decodable != 0;
}

- (void)deleteFrontend
{
}

- (BOOL)hasFrontend
{
  return self->_frontend != 0;
}

@end
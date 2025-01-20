@interface PLUSSchemaPLUSSuggesterDomainSuggestionMetadata
- (BOOL)hasMediaMetadata;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (PLUSSchemaPLUSSuggesterDomainSuggestionMetadata)initWithDictionary:(id)a3;
- (PLUSSchemaPLUSSuggesterDomainSuggestionMetadata)initWithJSON:(id)a3;
- (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata)mediaMetadata;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichDomainsuggestionmetadata;
- (void)deleteMediaMetadata;
- (void)setHasMediaMetadata:(BOOL)a3;
- (void)setMediaMetadata:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation PLUSSchemaPLUSSuggesterDomainSuggestionMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)PLUSSchemaPLUSSuggesterDomainSuggestionMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self mediaMetadata];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self deleteMediaMetadata];
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

- (void)setHasMediaMetadata:(BOOL)a3
{
  self->_hasMediaMetadata = a3;
}

- (BOOL)hasMediaMetadata
{
  return self->_hasMediaMetadata;
}

- (unint64_t)whichDomainsuggestionmetadata
{
  return self->_whichDomainsuggestionmetadata;
}

- (PLUSSchemaPLUSSuggesterDomainSuggestionMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLUSSchemaPLUSSuggesterDomainSuggestionMetadata;
  v5 = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"mediaMetadata"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[PLUSSchemaPLUSSuggesterMediaSuggestionMetadata alloc] initWithDictionary:v6];
      [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)v5 setMediaMetadata:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (PLUSSchemaPLUSSuggesterDomainSuggestionMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self dictionaryRepresentation];
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
  if (self->_mediaMetadata)
  {
    id v4 = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self mediaMetadata];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"mediaMetadata"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"mediaMetadata"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(PLUSSchemaPLUSSuggesterMediaSuggestionMetadata *)self->_mediaMetadata hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichDomainsuggestionmetadata = self->_whichDomainsuggestionmetadata;
    if (whichDomainsuggestionmetadata == [v4 whichDomainsuggestionmetadata])
    {
      v6 = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self mediaMetadata];
      uint64_t v7 = [v4 mediaMetadata];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self mediaMetadata];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self mediaMetadata];
        v12 = [v4 mediaMetadata];
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
  id v4 = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self mediaMetadata];

  if (v4)
  {
    v5 = [(PLUSSchemaPLUSSuggesterDomainSuggestionMetadata *)self mediaMetadata];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return PLUSSchemaPLUSSuggesterDomainSuggestionMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteMediaMetadata
{
  if (self->_whichDomainsuggestionmetadata == 100)
  {
    self->_unint64_t whichDomainsuggestionmetadata = 0;
    self->_mediaMetadata = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (PLUSSchemaPLUSSuggesterMediaSuggestionMetadata)mediaMetadata
{
  if (self->_whichDomainsuggestionmetadata == 100) {
    v2 = self->_mediaMetadata;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setMediaMetadata:(id)a3
{
  unint64_t v3 = 100;
  if (!a3) {
    unint64_t v3 = 0;
  }
  self->_unint64_t whichDomainsuggestionmetadata = v3;
  objc_storeStrong((id *)&self->_mediaMetadata, a3);
}

@end
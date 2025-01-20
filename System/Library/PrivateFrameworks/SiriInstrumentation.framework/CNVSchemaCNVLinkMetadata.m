@interface CNVSchemaCNVLinkMetadata
- (BOOL)hasLinkActionId;
- (BOOL)hasLinkId;
- (BOOL)hasSystemProtocol;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (CNVSchemaCNVLinkMetadata)initWithDictionary:(id)a3;
- (CNVSchemaCNVLinkMetadata)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)linkActionId;
- (SISchemaUUID)linkId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)systemProtocol;
- (unint64_t)hash;
- (void)deleteLinkActionId;
- (void)deleteLinkId;
- (void)deleteSystemProtocol;
- (void)setHasLinkActionId:(BOOL)a3;
- (void)setHasLinkId:(BOOL)a3;
- (void)setHasSystemProtocol:(BOOL)a3;
- (void)setLinkActionId:(id)a3;
- (void)setLinkId:(id)a3;
- (void)setSystemProtocol:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation CNVSchemaCNVLinkMetadata

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)CNVSchemaCNVLinkMetadata;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(CNVSchemaCNVLinkMetadata *)self linkId];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(CNVSchemaCNVLinkMetadata *)self deleteLinkId];
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
  objc_storeStrong((id *)&self->_linkActionId, 0);
  objc_storeStrong((id *)&self->_linkId, 0);
}

- (void)setHasLinkActionId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasLinkId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)systemProtocol
{
  return self->_systemProtocol;
}

- (void)setLinkActionId:(id)a3
{
}

- (NSString)linkActionId
{
  return self->_linkActionId;
}

- (void)setLinkId:(id)a3
{
}

- (SISchemaUUID)linkId
{
  return self->_linkId;
}

- (CNVSchemaCNVLinkMetadata)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)CNVSchemaCNVLinkMetadata;
  v5 = [(CNVSchemaCNVLinkMetadata *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[SISchemaUUID alloc] initWithDictionary:v6];
      [(CNVSchemaCNVLinkMetadata *)v5 setLinkId:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"linkActionId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_super v9 = (void *)[v8 copy];
      [(CNVSchemaCNVLinkMetadata *)v5 setLinkActionId:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"systemProtocol"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[CNVSchemaCNVLinkMetadata setSystemProtocol:](v5, "setSystemProtocol:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (CNVSchemaCNVLinkMetadata)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(CNVSchemaCNVLinkMetadata *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(CNVSchemaCNVLinkMetadata *)self dictionaryRepresentation];
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
  if (self->_linkActionId)
  {
    id v4 = [(CNVSchemaCNVLinkMetadata *)self linkActionId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"linkActionId"];
  }
  if (self->_linkId)
  {
    v6 = [(CNVSchemaCNVLinkMetadata *)self linkId];
    uint64_t v7 = [v6 dictionaryRepresentation];
    if (v7)
    {
      [v3 setObject:v7 forKeyedSubscript:@"linkId"];
    }
    else
    {
      v8 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v8 forKeyedSubscript:@"linkId"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int v9 = [(CNVSchemaCNVLinkMetadata *)self systemProtocol] - 1;
    if (v9 > 0x19) {
      v10 = @"LINKSYSTEMACTIONPROTOCOL_UNKNOWN";
    }
    else {
      v10 = off_1E5EAD830[v9];
    }
    [v3 setObject:v10 forKeyedSubscript:@"systemProtocol"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(SISchemaUUID *)self->_linkId hash];
  NSUInteger v4 = [(NSString *)self->_linkActionId hash];
  if (*(unsigned char *)&self->_has) {
    uint64_t v5 = 2654435761 * self->_systemProtocol;
  }
  else {
    uint64_t v5 = 0;
  }
  return v4 ^ v3 ^ v5;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  uint64_t v5 = [(CNVSchemaCNVLinkMetadata *)self linkId];
  v6 = [v4 linkId];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_11;
  }
  uint64_t v7 = [(CNVSchemaCNVLinkMetadata *)self linkId];
  if (v7)
  {
    v8 = (void *)v7;
    unsigned int v9 = [(CNVSchemaCNVLinkMetadata *)self linkId];
    v10 = [v4 linkId];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  uint64_t v5 = [(CNVSchemaCNVLinkMetadata *)self linkActionId];
  v6 = [v4 linkActionId];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_11:

    goto LABEL_12;
  }
  uint64_t v12 = [(CNVSchemaCNVLinkMetadata *)self linkActionId];
  if (v12)
  {
    objc_super v13 = (void *)v12;
    v14 = [(CNVSchemaCNVLinkMetadata *)self linkActionId];
    v15 = [v4 linkActionId];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) == (v4[28] & 1))
  {
    if ((*(unsigned char *)&self->_has & 1) == 0
      || (int systemProtocol = self->_systemProtocol, systemProtocol == [v4 systemProtocol]))
    {
      BOOL v17 = 1;
      goto LABEL_13;
    }
  }
LABEL_12:
  BOOL v17 = 0;
LABEL_13:

  return v17;
}

- (void)writeTo:(id)a3
{
  id v8 = a3;
  NSUInteger v4 = [(CNVSchemaCNVLinkMetadata *)self linkId];

  if (v4)
  {
    uint64_t v5 = [(CNVSchemaCNVLinkMetadata *)self linkId];
    PBDataWriterWriteSubmessage();
  }
  v6 = [(CNVSchemaCNVLinkMetadata *)self linkActionId];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  uint64_t v7 = v8;
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteInt32Field();
    uint64_t v7 = v8;
  }
}

- (BOOL)readFrom:(id)a3
{
  return CNVSchemaCNVLinkMetadataReadFrom(self, (uint64_t)a3);
}

- (void)deleteSystemProtocol
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasSystemProtocol:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSystemProtocol
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSystemProtocol:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int systemProtocol = a3;
}

- (void)deleteLinkActionId
{
}

- (BOOL)hasLinkActionId
{
  return self->_linkActionId != 0;
}

- (void)deleteLinkId
{
}

- (BOOL)hasLinkId
{
  return self->_linkId != 0;
}

@end
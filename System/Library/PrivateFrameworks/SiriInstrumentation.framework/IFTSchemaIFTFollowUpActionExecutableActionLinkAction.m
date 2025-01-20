@interface IFTSchemaIFTFollowUpActionExecutableActionLinkAction
- (BOOL)hasBundleId;
- (BOOL)hasLinkShowOutputActionOptions;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTFollowUpActionExecutableActionLinkAction)initWithDictionary:(id)a3;
- (IFTSchemaIFTFollowUpActionExecutableActionLinkAction)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)bundleId;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)linkShowOutputActionOptions;
- (void)deleteBundleId;
- (void)deleteLinkShowOutputActionOptions;
- (void)setBundleId:(id)a3;
- (void)setHasBundleId:(BOOL)a3;
- (void)setHasLinkShowOutputActionOptions:(BOOL)a3;
- (void)setLinkShowOutputActionOptions:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTFollowUpActionExecutableActionLinkAction

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)IFTSchemaIFTFollowUpActionExecutableActionLinkAction;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v8 applySensitiveConditionsPolicy:v4];
  int v6 = objc_msgSend(v4, "isConditionSet:", 4, v8.receiver, v8.super_class);

  if (v6) {
    [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)self deleteBundleId];
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

- (void)setHasBundleId:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unint64_t)linkShowOutputActionOptions
{
  return self->_linkShowOutputActionOptions;
}

- (void)setBundleId:(id)a3
{
}

- (NSString)bundleId
{
  return self->_bundleId;
}

- (IFTSchemaIFTFollowUpActionExecutableActionLinkAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)IFTSchemaIFTFollowUpActionExecutableActionLinkAction;
  v5 = [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)&v11 init];
  if (v5)
  {
    int v6 = [v4 objectForKeyedSubscript:@"bundleId"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)v5 setBundleId:v7];
    }
    objc_super v8 = [v4 objectForKeyedSubscript:@"linkShowOutputActionOptions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTFollowUpActionExecutableActionLinkAction setLinkShowOutputActionOptions:](v5, "setLinkShowOutputActionOptions:", [v8 unsignedLongLongValue]);
    }
    v9 = v5;
  }
  return v5;
}

- (IFTSchemaIFTFollowUpActionExecutableActionLinkAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)self dictionaryRepresentation];
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
  if (self->_bundleId)
  {
    id v4 = [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)self bundleId];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"bundleId"];
  }
  if (*(unsigned char *)&self->_has)
  {
    int v6 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[IFTSchemaIFTFollowUpActionExecutableActionLinkAction linkShowOutputActionOptions](self, "linkShowOutputActionOptions"));
    [v3 setObject:v6 forKeyedSubscript:@"linkShowOutputActionOptions"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_bundleId hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v4 = 2654435761u * self->_linkShowOutputActionOptions;
  }
  else {
    unint64_t v4 = 0;
  }
  return v4 ^ v3;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  v5 = [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)self bundleId];
  int v6 = [v4 bundleId];
  uint64_t v7 = v6;
  if ((v5 == 0) == (v6 != 0))
  {

LABEL_12:
    BOOL v14 = 0;
    goto LABEL_13;
  }
  uint64_t v8 = [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)self bundleId];
  if (v8)
  {
    v9 = (void *)v8;
    v10 = [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)self bundleId];
    objc_super v11 = [v4 bundleId];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_12;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[24] & 1)) {
    goto LABEL_12;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t linkShowOutputActionOptions = self->_linkShowOutputActionOptions;
    if (linkShowOutputActionOptions != [v4 linkShowOutputActionOptions]) {
      goto LABEL_12;
    }
  }
  BOOL v14 = 1;
LABEL_13:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  unint64_t v4 = [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)self bundleId];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTFollowUpActionExecutableActionLinkActionReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkShowOutputActionOptions
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasLinkShowOutputActionOptions:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasLinkShowOutputActionOptions
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setLinkShowOutputActionOptions:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unint64_t linkShowOutputActionOptions = a3;
}

- (void)deleteBundleId
{
}

- (BOOL)hasBundleId
{
  return self->_bundleId != 0;
}

@end
@interface IFTSchemaIFTFollowUpActionExecutableAction
- (BOOL)hasLinkAction;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTFollowUpActionExecutableAction)initWithDictionary:(id)a3;
- (IFTSchemaIFTFollowUpActionExecutableAction)initWithJSON:(id)a3;
- (IFTSchemaIFTFollowUpActionExecutableActionLinkAction)linkAction;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichOneof_Followupactionexecutableaction;
- (void)deleteLinkAction;
- (void)setHasLinkAction:(BOOL)a3;
- (void)setLinkAction:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTFollowUpActionExecutableAction

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTFollowUpActionExecutableAction;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaIFTFollowUpActionExecutableAction *)self linkAction];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(IFTSchemaIFTFollowUpActionExecutableAction *)self deleteLinkAction];
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

- (void)setHasLinkAction:(BOOL)a3
{
  self->_hasLinkAction = a3;
}

- (BOOL)hasLinkAction
{
  return self->_hasLinkAction;
}

- (unint64_t)whichOneof_Followupactionexecutableaction
{
  return self->_whichOneof_Followupactionexecutableaction;
}

- (IFTSchemaIFTFollowUpActionExecutableAction)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaIFTFollowUpActionExecutableAction;
  v5 = [(IFTSchemaIFTFollowUpActionExecutableAction *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"linkAction"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[IFTSchemaIFTFollowUpActionExecutableActionLinkAction alloc] initWithDictionary:v6];
      [(IFTSchemaIFTFollowUpActionExecutableAction *)v5 setLinkAction:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (IFTSchemaIFTFollowUpActionExecutableAction)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTFollowUpActionExecutableAction *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTFollowUpActionExecutableAction *)self dictionaryRepresentation];
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
  if (self->_linkAction)
  {
    id v4 = [(IFTSchemaIFTFollowUpActionExecutableAction *)self linkAction];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"linkAction"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"linkAction"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(IFTSchemaIFTFollowUpActionExecutableActionLinkAction *)self->_linkAction hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichOneof_Followupactionexecutableaction = self->_whichOneof_Followupactionexecutableaction;
    if (whichOneof_Followupactionexecutableaction == objc_msgSend(v4, "whichOneof_Followupactionexecutableaction"))
    {
      v6 = [(IFTSchemaIFTFollowUpActionExecutableAction *)self linkAction];
      uint64_t v7 = [v4 linkAction];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(IFTSchemaIFTFollowUpActionExecutableAction *)self linkAction];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(IFTSchemaIFTFollowUpActionExecutableAction *)self linkAction];
        v12 = [v4 linkAction];
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
  id v4 = [(IFTSchemaIFTFollowUpActionExecutableAction *)self linkAction];

  if (v4)
  {
    v5 = [(IFTSchemaIFTFollowUpActionExecutableAction *)self linkAction];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTFollowUpActionExecutableActionReadFrom(self, (uint64_t)a3);
}

- (void)deleteLinkAction
{
  if (self->_whichOneof_Followupactionexecutableaction == 1)
  {
    self->_unint64_t whichOneof_Followupactionexecutableaction = 0;
    self->_linkAction = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (IFTSchemaIFTFollowUpActionExecutableActionLinkAction)linkAction
{
  if (self->_whichOneof_Followupactionexecutableaction == 1) {
    v2 = self->_linkAction;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLinkAction:(id)a3
{
  self->_unint64_t whichOneof_Followupactionexecutableaction = a3 != 0;
  objc_storeStrong((id *)&self->_linkAction, a3);
}

@end
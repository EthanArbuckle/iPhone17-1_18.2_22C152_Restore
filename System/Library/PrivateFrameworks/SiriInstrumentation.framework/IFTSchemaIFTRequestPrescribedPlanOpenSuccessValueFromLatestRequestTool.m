@interface IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool
- (BOOL)hasElementAtIndex;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool)initWithDictionary:(id)a3;
- (IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)elementAtIndex;
- (unint64_t)hash;
- (void)deleteElementAtIndex;
- (void)setElementAtIndex:(int64_t)a3;
- (void)setHasElementAtIndex:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (int64_t)elementAtIndex
{
  return self->_elementAtIndex;
}

- (IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool)initWithDictionary:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool;
  v5 = [(IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool *)&v9 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"elementAtIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool setElementAtIndex:](v5, "setElementAtIndex:", [v6 longLongValue]);
    }
    v7 = v5;
  }
  return v5;
}

- (IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool *)self dictionaryRepresentation];
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
    id v4 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestTool elementAtIndex](self, "elementAtIndex"));
    [v3 setObject:v4 forKeyedSubscript:@"elementAtIndex"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    return 2654435761 * self->_elementAtIndex;
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
    if ((*(unsigned char *)&self->_has & 1) == (v4[16] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int64_t elementAtIndex = self->_elementAtIndex, elementAtIndex == [v4 elementAtIndex]))
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
    PBDataWriterWriteInt64Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaIFTRequestPrescribedPlanOpenSuccessValueFromLatestRequestToolReadFrom(self, (uint64_t)a3);
}

- (void)deleteElementAtIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasElementAtIndex:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasElementAtIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setElementAtIndex:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t elementAtIndex = a3;
}

@end
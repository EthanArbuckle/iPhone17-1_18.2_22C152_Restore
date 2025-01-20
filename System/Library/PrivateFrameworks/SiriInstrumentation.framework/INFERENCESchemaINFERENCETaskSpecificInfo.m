@interface INFERENCESchemaINFERENCETaskSpecificInfo
- (BOOL)hasLongRunningTaskInfo;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCELongRunningTaskInfo)longRunningTaskInfo;
- (INFERENCESchemaINFERENCETaskSpecificInfo)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCETaskSpecificInfo)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)whichTaskinfo;
- (void)deleteLongRunningTaskInfo;
- (void)setHasLongRunningTaskInfo:(BOOL)a3;
- (void)setLongRunningTaskInfo:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCETaskSpecificInfo

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)INFERENCESchemaINFERENCETaskSpecificInfo;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCETaskSpecificInfo *)self longRunningTaskInfo];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(INFERENCESchemaINFERENCETaskSpecificInfo *)self deleteLongRunningTaskInfo];
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

- (void)setHasLongRunningTaskInfo:(BOOL)a3
{
  self->_hasLongRunningTaskInfo = a3;
}

- (BOOL)hasLongRunningTaskInfo
{
  return self->_hasLongRunningTaskInfo;
}

- (unint64_t)whichTaskinfo
{
  return self->_whichTaskinfo;
}

- (INFERENCESchemaINFERENCETaskSpecificInfo)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)INFERENCESchemaINFERENCETaskSpecificInfo;
  v5 = [(INFERENCESchemaINFERENCETaskSpecificInfo *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"longRunningTaskInfo"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCELongRunningTaskInfo alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCETaskSpecificInfo *)v5 setLongRunningTaskInfo:v7];
    }
    v8 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCETaskSpecificInfo)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCETaskSpecificInfo *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCETaskSpecificInfo *)self dictionaryRepresentation];
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
  if (self->_longRunningTaskInfo)
  {
    id v4 = [(INFERENCESchemaINFERENCETaskSpecificInfo *)self longRunningTaskInfo];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"longRunningTaskInfo"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"longRunningTaskInfo"];
    }
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  return [(INFERENCESchemaINFERENCELongRunningTaskInfo *)self->_longRunningTaskInfo hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    unint64_t whichTaskinfo = self->_whichTaskinfo;
    if (whichTaskinfo == [v4 whichTaskinfo])
    {
      v6 = [(INFERENCESchemaINFERENCETaskSpecificInfo *)self longRunningTaskInfo];
      uint64_t v7 = [v4 longRunningTaskInfo];
      v8 = v7;
      if ((v6 == 0) != (v7 != 0))
      {
        uint64_t v9 = [(INFERENCESchemaINFERENCETaskSpecificInfo *)self longRunningTaskInfo];
        if (!v9)
        {

LABEL_11:
          BOOL v14 = 1;
          goto LABEL_9;
        }
        objc_super v10 = (void *)v9;
        v11 = [(INFERENCESchemaINFERENCETaskSpecificInfo *)self longRunningTaskInfo];
        v12 = [v4 longRunningTaskInfo];
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
  id v4 = [(INFERENCESchemaINFERENCETaskSpecificInfo *)self longRunningTaskInfo];

  if (v4)
  {
    v5 = [(INFERENCESchemaINFERENCETaskSpecificInfo *)self longRunningTaskInfo];
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCETaskSpecificInfoReadFrom(self, (uint64_t)a3);
}

- (void)deleteLongRunningTaskInfo
{
  if (self->_whichTaskinfo == 1)
  {
    self->_unint64_t whichTaskinfo = 0;
    self->_longRunningTaskInfo = 0;
    MEMORY[0x1F41817F8]();
  }
}

- (INFERENCESchemaINFERENCELongRunningTaskInfo)longRunningTaskInfo
{
  if (self->_whichTaskinfo == 1) {
    v2 = self->_longRunningTaskInfo;
  }
  else {
    v2 = 0;
  }
  return v2;
}

- (void)setLongRunningTaskInfo:(id)a3
{
  self->_unint64_t whichTaskinfo = a3 != 0;
  objc_storeStrong((id *)&self->_longRunningTaskInfo, a3);
}

@end
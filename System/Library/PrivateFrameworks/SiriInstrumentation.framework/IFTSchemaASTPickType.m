@interface IFTSchemaASTPickType
- (BOOL)hasIndex;
- (BOOL)hasNone;
- (BOOL)isEqual:(id)a3;
- (BOOL)none;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaASTPickType)initWithDictionary:(id)a3;
- (IFTSchemaASTPickType)initWithJSON:(id)a3;
- (NSData)jsonData;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)index;
- (unint64_t)hash;
- (unint64_t)whichOneof_Astpicktype;
- (void)deleteIndex;
- (void)deleteNone;
- (void)setHasIndex:(BOOL)a3;
- (void)setHasNone:(BOOL)a3;
- (void)setIndex:(int64_t)a3;
- (void)setNone:(BOOL)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaASTPickType

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)setHasNone:(BOOL)a3
{
  self->_hasNone = a3;
}

- (BOOL)hasNone
{
  return self->_hasNone;
}

- (void)setHasIndex:(BOOL)a3
{
  self->_hasIndex = a3;
}

- (BOOL)hasIndex
{
  return self->_hasIndex;
}

- (unint64_t)whichOneof_Astpicktype
{
  return self->_whichOneof_Astpicktype;
}

- (IFTSchemaASTPickType)initWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)IFTSchemaASTPickType;
  v5 = [(IFTSchemaASTPickType *)&v10 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"index"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaASTPickType setIndex:](v5, "setIndex:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"none"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaASTPickType setNone:](v5, "setNone:", [v7 BOOLValue]);
    }
    v8 = v5;
  }
  return v5;
}

- (IFTSchemaASTPickType)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaASTPickType *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaASTPickType *)self dictionaryRepresentation];
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
  unint64_t whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  if (whichOneof_Astpicktype == 1)
  {
    v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[IFTSchemaASTPickType index](self, "index"));
    [v3 setObject:v5 forKeyedSubscript:@"index"];

    unint64_t whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  }
  if (whichOneof_Astpicktype == 3)
  {
    v6 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaASTPickType none](self, "none"));
    [v3 setObject:v6 forKeyedSubscript:@"none"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  if (whichOneof_Astpicktype == 3) {
    return 2654435761 * self->_none;
  }
  if (whichOneof_Astpicktype == 1) {
    return 2654435761 * self->_index;
  }
  return 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && (unint64_t whichOneof_Astpicktype = self->_whichOneof_Astpicktype,
        whichOneof_Astpicktype == objc_msgSend(v4, "whichOneof_Astpicktype"))
    && (int64_t index = self->_index, index == [v4 index]))
  {
    int none = self->_none;
    BOOL v8 = none == [v4 none];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  unint64_t whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  id v6 = v4;
  if (whichOneof_Astpicktype == 1)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
    unint64_t whichOneof_Astpicktype = self->_whichOneof_Astpicktype;
  }
  if (whichOneof_Astpicktype == 3)
  {
    PBDataWriterWriteBOOLField();
    id v4 = v6;
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaASTPickTypeReadFrom(self, (uint64_t)a3);
}

- (void)deleteNone
{
  if (self->_whichOneof_Astpicktype == 3)
  {
    self->_unint64_t whichOneof_Astpicktype = 0;
    self->_int none = 0;
  }
}

- (BOOL)none
{
  return self->_whichOneof_Astpicktype == 3 && self->_none;
}

- (void)setNone:(BOOL)a3
{
  self->_int64_t index = 0;
  self->_unint64_t whichOneof_Astpicktype = 3;
  self->_int none = a3;
}

- (void)deleteIndex
{
  if (self->_whichOneof_Astpicktype == 1)
  {
    self->_unint64_t whichOneof_Astpicktype = 0;
    self->_int64_t index = 0;
  }
}

- (int64_t)index
{
  if (self->_whichOneof_Astpicktype == 1) {
    return self->_index;
  }
  else {
    return 0;
  }
}

- (void)setIndex:(int64_t)a3
{
  self->_int none = 0;
  self->_unint64_t whichOneof_Astpicktype = 1;
  self->_int64_t index = a3;
}

@end
@interface IFTSchemaASTFlatExprUpdateVariant
- (BOOL)exists;
- (BOOL)hasExists;
- (BOOL)hasKind;
- (BOOL)hasLhs;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (IFTSchemaASTFlatExprUpdateVariant)initWithDictionary:(id)a3;
- (IFTSchemaASTFlatExprUpdateVariant)initWithJSON:(id)a3;
- (IFTSchemaIFTStatementId)lhs;
- (NSArray)paths;
- (NSData)jsonData;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)pathAtIndex:(unint64_t)a3;
- (id)suppressMessageUnderConditions;
- (int)kind;
- (unint64_t)hash;
- (unint64_t)pathCount;
- (void)addPath:(id)a3;
- (void)clearPath;
- (void)deleteExists;
- (void)deleteKind;
- (void)deleteLhs;
- (void)setExists:(BOOL)a3;
- (void)setHasExists:(BOOL)a3;
- (void)setHasKind:(BOOL)a3;
- (void)setHasLhs:(BOOL)a3;
- (void)setKind:(int)a3;
- (void)setLhs:(id)a3;
- (void)setPaths:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation IFTSchemaASTFlatExprUpdateVariant

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)IFTSchemaASTFlatExprUpdateVariant;
  v5 = [(SISchemaInstrumentationMessage *)&v12 applySensitiveConditionsPolicy:v4];
  v6 = [(IFTSchemaASTFlatExprUpdateVariant *)self lhs];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(IFTSchemaASTFlatExprUpdateVariant *)self deleteLhs];
  }
  v9 = [(IFTSchemaASTFlatExprUpdateVariant *)self paths];
  v10 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v9 underConditions:v4];
  [(IFTSchemaASTFlatExprUpdateVariant *)self setPaths:v10];

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
  objc_storeStrong((id *)&self->_paths, 0);
  objc_storeStrong((id *)&self->_lhs, 0);
}

- (void)setHasLhs:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)kind
{
  return self->_kind;
}

- (void)setPaths:(id)a3
{
}

- (NSArray)paths
{
  return self->_paths;
}

- (void)setLhs:(id)a3
{
}

- (IFTSchemaIFTStatementId)lhs
{
  return self->_lhs;
}

- (BOOL)exists
{
  return self->_exists;
}

- (IFTSchemaASTFlatExprUpdateVariant)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)IFTSchemaASTFlatExprUpdateVariant;
  v5 = [(IFTSchemaASTFlatExprUpdateVariant *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"exists"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaASTFlatExprUpdateVariant setExists:](v5, "setExists:", [v6 BOOLValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"lhs"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v8 = [[IFTSchemaIFTStatementId alloc] initWithDictionary:v7];
      [(IFTSchemaASTFlatExprUpdateVariant *)v5 setLhs:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"path"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v7;
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v10 = v9;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v23;
        do
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v23 != v13) {
              objc_enumerationMutation(v10);
            }
            uint64_t v15 = *(void *)(*((void *)&v22 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v16 = [[IFTSchemaASTPath alloc] initWithDictionary:v15];
              [(IFTSchemaASTFlatExprUpdateVariant *)v5 addPath:v16];
            }
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v12);
      }

      v7 = v20;
    }
    v17 = objc_msgSend(v4, "objectForKeyedSubscript:", @"kind", v20, v21, (void)v22);
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[IFTSchemaASTFlatExprUpdateVariant setKind:](v5, "setKind:", [v17 intValue]);
    }
    v18 = v5;
  }
  return v5;
}

- (IFTSchemaASTFlatExprUpdateVariant)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(IFTSchemaASTFlatExprUpdateVariant *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(IFTSchemaASTFlatExprUpdateVariant *)self dictionaryRepresentation];
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
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v5 = objc_msgSend(NSNumber, "numberWithBool:", -[IFTSchemaASTFlatExprUpdateVariant exists](self, "exists"));
    [v3 setObject:v5 forKeyedSubscript:@"exists"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    int v6 = [(IFTSchemaASTFlatExprUpdateVariant *)self kind];
    uint64_t v7 = @"ASTUPDATEKIND_UNKNOWN";
    if (v6 == 1) {
      uint64_t v7 = @"ASTUPDATEKIND_APPEND";
    }
    if (v6 == 2) {
      int v8 = @"ASTUPDATEKIND_REPLACE";
    }
    else {
      int v8 = v7;
    }
    [v3 setObject:v8 forKeyedSubscript:@"kind"];
  }
  if (self->_lhs)
  {
    v9 = [(IFTSchemaASTFlatExprUpdateVariant *)self lhs];
    id v10 = [v9 dictionaryRepresentation];
    if (v10)
    {
      [v3 setObject:v10 forKeyedSubscript:@"lhs"];
    }
    else
    {
      uint64_t v11 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v11 forKeyedSubscript:@"lhs"];
    }
  }
  if ([(NSArray *)self->_paths count])
  {
    uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v13 = self->_paths;
    uint64_t v14 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v22;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v22 != v16) {
            objc_enumerationMutation(v13);
          }
          v18 = objc_msgSend(*(id *)(*((void *)&v21 + 1) + 8 * i), "dictionaryRepresentation", (void)v21);
          if (v18)
          {
            [v12 addObject:v18];
          }
          else
          {
            v19 = [MEMORY[0x1E4F1CA98] null];
            [v12 addObject:v19];
          }
        }
        uint64_t v15 = [(NSArray *)v13 countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v15);
    }

    [v3 setObject:v12 forKeyedSubscript:@"path"];
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v21);
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_exists;
  }
  else {
    uint64_t v3 = 0;
  }
  unint64_t v4 = [(IFTSchemaIFTStatementId *)self->_lhs hash];
  uint64_t v5 = [(NSArray *)self->_paths hash];
  if ((*(unsigned char *)&self->_has & 2) != 0) {
    uint64_t v6 = 2654435761 * self->_kind;
  }
  else {
    uint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_15;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[36] & 1)) {
    goto LABEL_15;
  }
  if (*(unsigned char *)&self->_has)
  {
    int exists = self->_exists;
    if (exists != [v4 exists]) {
      goto LABEL_15;
    }
  }
  uint64_t v6 = [(IFTSchemaASTFlatExprUpdateVariant *)self lhs];
  uint64_t v7 = [v4 lhs];
  if ((v6 == 0) == (v7 != 0)) {
    goto LABEL_14;
  }
  uint64_t v8 = [(IFTSchemaASTFlatExprUpdateVariant *)self lhs];
  if (v8)
  {
    v9 = (void *)v8;
    id v10 = [(IFTSchemaASTFlatExprUpdateVariant *)self lhs];
    uint64_t v11 = [v4 lhs];
    int v12 = [v10 isEqual:v11];

    if (!v12) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  uint64_t v6 = [(IFTSchemaASTFlatExprUpdateVariant *)self paths];
  uint64_t v7 = [v4 paths];
  if ((v6 == 0) == (v7 != 0))
  {
LABEL_14:

    goto LABEL_15;
  }
  uint64_t v13 = [(IFTSchemaASTFlatExprUpdateVariant *)self paths];
  if (v13)
  {
    uint64_t v14 = (void *)v13;
    uint64_t v15 = [(IFTSchemaASTFlatExprUpdateVariant *)self paths];
    uint64_t v16 = [v4 paths];
    int v17 = [v15 isEqual:v16];

    if (!v17) {
      goto LABEL_15;
    }
  }
  else
  {
  }
  int v20 = (*(unsigned char *)&self->_has >> 1) & 1;
  if (v20 == ((v4[36] >> 1) & 1))
  {
    if (!v20 || (int kind = self->_kind, kind == [v4 kind]))
    {
      BOOL v18 = 1;
      goto LABEL_16;
    }
  }
LABEL_15:
  BOOL v18 = 0;
LABEL_16:

  return v18;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteBOOLField();
  }
  uint64_t v5 = [(IFTSchemaASTFlatExprUpdateVariant *)self lhs];

  if (v5)
  {
    uint64_t v6 = [(IFTSchemaASTFlatExprUpdateVariant *)self lhs];
    PBDataWriterWriteSubmessage();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_paths;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        PBDataWriterWriteSubmessage();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return IFTSchemaASTFlatExprUpdateVariantReadFrom(self, (uint64_t)a3);
}

- (void)deleteKind
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasKind:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasKind
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setKind:(int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_int kind = a3;
}

- (id)pathAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_paths objectAtIndexedSubscript:a3];
}

- (unint64_t)pathCount
{
  return [(NSArray *)self->_paths count];
}

- (void)addPath:(id)a3
{
  id v4 = a3;
  paths = self->_paths;
  id v8 = v4;
  if (!paths)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_paths;
    self->_paths = v6;

    id v4 = v8;
    paths = self->_paths;
  }
  [(NSArray *)paths addObject:v4];
}

- (void)clearPath
{
}

- (void)deleteLhs
{
}

- (BOOL)hasLhs
{
  return self->_lhs != 0;
}

- (void)deleteExists
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasExists:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasExists
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setExists:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int exists = a3;
}

@end
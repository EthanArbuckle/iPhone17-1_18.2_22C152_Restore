@interface RRSchemaRRAnnotatedEntity
- (BOOL)hasGroup;
- (BOOL)hasHasReference;
- (BOOL)hasReference;
- (BOOL)hasSaliencyComputedAtTimestampInSeconds;
- (BOOL)hasSaliencyScore;
- (BOOL)hasSwiftClassName;
- (BOOL)hasUsoGraph;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)annotations;
- (NSData)jsonData;
- (NSString)swiftClassName;
- (RRSchemaRRAnnotatedEntity)initWithDictionary:(id)a3;
- (RRSchemaRRAnnotatedEntity)initWithJSON:(id)a3;
- (RRSchemaRRGroupIdentifier)group;
- (USOSchemaUSOGraph)usoGraph;
- (float)saliencyScore;
- (id)annotationsAtIndex:(unint64_t)a3;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)annotationsCount;
- (unint64_t)hash;
- (unint64_t)saliencyComputedAtTimestampInSeconds;
- (void)addAnnotations:(id)a3;
- (void)clearAnnotations;
- (void)deleteGroup;
- (void)deleteHasReference;
- (void)deleteSaliencyComputedAtTimestampInSeconds;
- (void)deleteSaliencyScore;
- (void)deleteSwiftClassName;
- (void)deleteUsoGraph;
- (void)setAnnotations:(id)a3;
- (void)setGroup:(id)a3;
- (void)setHasGroup:(BOOL)a3;
- (void)setHasHasReference:(BOOL)a3;
- (void)setHasReference:(BOOL)a3;
- (void)setHasSaliencyComputedAtTimestampInSeconds:(BOOL)a3;
- (void)setHasSaliencyScore:(BOOL)a3;
- (void)setHasSwiftClassName:(BOOL)a3;
- (void)setHasUsoGraph:(BOOL)a3;
- (void)setSaliencyComputedAtTimestampInSeconds:(unint64_t)a3;
- (void)setSaliencyScore:(float)a3;
- (void)setSwiftClassName:(id)a3;
- (void)setUsoGraph:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation RRSchemaRRAnnotatedEntity

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)RRSchemaRRAnnotatedEntity;
  v5 = [(SISchemaInstrumentationMessage *)&v15 applySensitiveConditionsPolicy:v4];
  v6 = [(RRSchemaRRAnnotatedEntity *)self usoGraph];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(RRSchemaRRAnnotatedEntity *)self deleteUsoGraph];
  }
  v9 = [(RRSchemaRRAnnotatedEntity *)self group];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(RRSchemaRRAnnotatedEntity *)self deleteGroup];
  }
  v12 = [(RRSchemaRRAnnotatedEntity *)self annotations];
  v13 = [(SISchemaInstrumentationMessage *)self _pruneSuppressedMessagesFromArray:v12 underConditions:v4];
  [(RRSchemaRRAnnotatedEntity *)self setAnnotations:v13];

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
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_swiftClassName, 0);
  objc_storeStrong((id *)&self->_usoGraph, 0);
}

- (void)setHasGroup:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasSwiftClassName:(BOOL)a3
{
  *(&self->_hasReference + 3) = a3;
}

- (void)setHasUsoGraph:(BOOL)a3
{
  *(&self->_hasReference + 2) = a3;
}

- (BOOL)hasReference
{
  return self->_hasReference;
}

- (unint64_t)saliencyComputedAtTimestampInSeconds
{
  return self->_saliencyComputedAtTimestampInSeconds;
}

- (float)saliencyScore
{
  return self->_saliencyScore;
}

- (void)setAnnotations:(id)a3
{
}

- (NSArray)annotations
{
  return self->_annotations;
}

- (void)setGroup:(id)a3
{
}

- (RRSchemaRRGroupIdentifier)group
{
  return self->_group;
}

- (void)setSwiftClassName:(id)a3
{
}

- (NSString)swiftClassName
{
  return self->_swiftClassName;
}

- (void)setUsoGraph:(id)a3
{
}

- (USOSchemaUSOGraph)usoGraph
{
  return self->_usoGraph;
}

- (RRSchemaRRAnnotatedEntity)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)RRSchemaRRAnnotatedEntity;
  v5 = [(RRSchemaRRAnnotatedEntity *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"usoGraph"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[USOSchemaUSOGraph alloc] initWithDictionary:v6];
      [(RRSchemaRRAnnotatedEntity *)v5 setUsoGraph:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"swiftClassName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(RRSchemaRRAnnotatedEntity *)v5 setSwiftClassName:v9];
    }
    v26 = (void *)v6;
    v10 = [v4 objectForKeyedSubscript:@"group"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[RRSchemaRRGroupIdentifier alloc] initWithDictionary:v10];
      [(RRSchemaRRAnnotatedEntity *)v5 setGroup:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"annotations"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v25 = v10;
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = v12;
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
      if (v14)
      {
        uint64_t v15 = v14;
        uint64_t v16 = *(void *)v28;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v28 != v16) {
              objc_enumerationMutation(v13);
            }
            uint64_t v18 = *(void *)(*((void *)&v27 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              v19 = [[RRSchemaRRAnnotation alloc] initWithDictionary:v18];
              [(RRSchemaRRAnnotatedEntity *)v5 addAnnotations:v19];
            }
          }
          uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v32 count:16];
        }
        while (v15);
      }

      v10 = v25;
    }
    v20 = [v4 objectForKeyedSubscript:@"saliencyScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v20 floatValue];
      -[RRSchemaRRAnnotatedEntity setSaliencyScore:](v5, "setSaliencyScore:");
    }
    v21 = [v4 objectForKeyedSubscript:@"saliencyComputedAtTimestampInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaRRAnnotatedEntity setSaliencyComputedAtTimestampInSeconds:](v5, "setSaliencyComputedAtTimestampInSeconds:", [v21 unsignedLongLongValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"hasReference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaRRAnnotatedEntity setHasReference:](v5, "setHasReference:", [v22 BOOLValue]);
    }
    v23 = v5;
  }
  return v5;
}

- (RRSchemaRRAnnotatedEntity)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaRRAnnotatedEntity *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaRRAnnotatedEntity *)self dictionaryRepresentation];
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
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  if ([(NSArray *)self->_annotations count])
  {
    id v4 = [MEMORY[0x1E4F1CA48] array];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    v5 = self->_annotations;
    uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v27 != v8) {
            objc_enumerationMutation(v5);
          }
          v10 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "dictionaryRepresentation", (void)v26);
          if (v10)
          {
            [v4 addObject:v10];
          }
          else
          {
            int v11 = [MEMORY[0x1E4F1CA98] null];
            [v4 addObject:v11];
          }
        }
        uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v26 objects:v30 count:16];
      }
      while (v7);
    }

    [v3 setObject:v4 forKeyedSubscript:@"annotations"];
  }
  if (self->_group)
  {
    v12 = [(RRSchemaRRAnnotatedEntity *)self group];
    id v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"group"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v14 forKeyedSubscript:@"group"];
    }
  }
  char v15 = *(&self->_hasReference + 1);
  if ((v15 & 4) != 0)
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[RRSchemaRRAnnotatedEntity hasReference](self, "hasReference"));
    [v3 setObject:v22 forKeyedSubscript:@"hasReference"];

    char v15 = *(&self->_hasReference + 1);
    if ((v15 & 2) == 0)
    {
LABEL_20:
      if ((v15 & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(&self->_hasReference + 1) & 2) == 0)
  {
    goto LABEL_20;
  }
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RRSchemaRRAnnotatedEntity saliencyComputedAtTimestampInSeconds](self, "saliencyComputedAtTimestampInSeconds", (void)v26));
  [v3 setObject:v23 forKeyedSubscript:@"saliencyComputedAtTimestampInSeconds"];

  if (*(&self->_hasReference + 1))
  {
LABEL_21:
    uint64_t v16 = NSNumber;
    [(RRSchemaRRAnnotatedEntity *)self saliencyScore];
    v17 = objc_msgSend(v16, "numberWithFloat:");
    [v3 setObject:v17 forKeyedSubscript:@"saliencyScore"];
  }
LABEL_22:
  if (self->_swiftClassName)
  {
    uint64_t v18 = [(RRSchemaRRAnnotatedEntity *)self swiftClassName];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"swiftClassName"];
  }
  if (self->_usoGraph)
  {
    v20 = [(RRSchemaRRAnnotatedEntity *)self usoGraph];
    v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"usoGraph"];
    }
    else
    {
      v24 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v24 forKeyedSubscript:@"usoGraph"];
    }
  }
  -[SISchemaInstrumentationMessage willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v26);
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(USOSchemaUSOGraph *)self->_usoGraph hash];
  NSUInteger v4 = [(NSString *)self->_swiftClassName hash];
  unint64_t v5 = [(RRSchemaRRGroupIdentifier *)self->_group hash];
  uint64_t v6 = [(NSArray *)self->_annotations hash];
  char v7 = *(&self->_hasReference + 1);
  if (v7)
  {
    float saliencyScore = self->_saliencyScore;
    double v10 = saliencyScore;
    if (saliencyScore < 0.0) {
      double v10 = -saliencyScore;
    }
    long double v11 = floor(v10 + 0.5);
    double v12 = (v10 - v11) * 1.84467441e19;
    unint64_t v8 = 2654435761u * (unint64_t)fmod(v11, 1.84467441e19);
    if (v12 >= 0.0)
    {
      if (v12 > 0.0) {
        v8 += (unint64_t)v12;
      }
    }
    else
    {
      v8 -= (unint64_t)fabs(v12);
    }
  }
  else
  {
    unint64_t v8 = 0;
  }
  if ((v7 & 2) != 0)
  {
    unint64_t v13 = 2654435761u * self->_saliencyComputedAtTimestampInSeconds;
    if ((v7 & 4) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14;
  }
  unint64_t v13 = 0;
  if ((v7 & 4) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v14 = 2654435761 * self->_hasReference;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(RRSchemaRRAnnotatedEntity *)self usoGraph];
  uint64_t v6 = [v4 usoGraph];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(RRSchemaRRAnnotatedEntity *)self usoGraph];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(RRSchemaRRAnnotatedEntity *)self usoGraph];
    double v10 = [v4 usoGraph];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(RRSchemaRRAnnotatedEntity *)self swiftClassName];
  uint64_t v6 = [v4 swiftClassName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(RRSchemaRRAnnotatedEntity *)self swiftClassName];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    uint64_t v14 = [(RRSchemaRRAnnotatedEntity *)self swiftClassName];
    char v15 = [v4 swiftClassName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(RRSchemaRRAnnotatedEntity *)self group];
  uint64_t v6 = [v4 group];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(RRSchemaRRAnnotatedEntity *)self group];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(RRSchemaRRAnnotatedEntity *)self group];
    v20 = [v4 group];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(RRSchemaRRAnnotatedEntity *)self annotations];
  uint64_t v6 = [v4 annotations];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(RRSchemaRRAnnotatedEntity *)self annotations];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(RRSchemaRRAnnotatedEntity *)self annotations];
    v25 = [v4 annotations];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unsigned int v29 = *((unsigned __int8 *)&self->_hasReference + 1);
  unsigned int v30 = v4[57];
  if ((v29 & 1) == (v30 & 1))
  {
    if (v29)
    {
      float saliencyScore = self->_saliencyScore;
      [v4 saliencyScore];
      if (saliencyScore != v32) {
        goto LABEL_22;
      }
      unsigned int v29 = *((unsigned __int8 *)&self->_hasReference + 1);
      unsigned int v30 = v4[57];
    }
    int v33 = (v29 >> 1) & 1;
    if (v33 == ((v30 >> 1) & 1))
    {
      if (v33)
      {
        unint64_t saliencyComputedAtTimestampInSeconds = self->_saliencyComputedAtTimestampInSeconds;
        if (saliencyComputedAtTimestampInSeconds != [v4 saliencyComputedAtTimestampInSeconds]) {
          goto LABEL_22;
        }
        unsigned int v29 = *((unsigned __int8 *)&self->_hasReference + 1);
        unsigned int v30 = v4[57];
      }
      int v35 = (v29 >> 2) & 1;
      if (v35 == ((v30 >> 2) & 1))
      {
        if (!v35
          || (int hasReference = self->_hasReference, hasReference == [v4 hasReference]))
        {
          BOOL v27 = 1;
          goto LABEL_23;
        }
      }
    }
  }
LABEL_22:
  BOOL v27 = 0;
LABEL_23:

  return v27;
}

- (void)writeTo:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(RRSchemaRRAnnotatedEntity *)self usoGraph];

  if (v5)
  {
    uint64_t v6 = [(RRSchemaRRAnnotatedEntity *)self usoGraph];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(RRSchemaRRAnnotatedEntity *)self swiftClassName];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  unint64_t v8 = [(RRSchemaRRAnnotatedEntity *)self group];

  if (v8)
  {
    v9 = [(RRSchemaRRAnnotatedEntity *)self group];
    PBDataWriterWriteSubmessage();
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  double v10 = self->_annotations;
  uint64_t v11 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v17 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v12 = [(NSArray *)v10 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v12);
  }

  char v15 = *(&self->_hasReference + 1);
  if ((v15 & 1) == 0)
  {
    if ((*(&self->_hasReference + 1) & 2) == 0) {
      goto LABEL_16;
    }
LABEL_20:
    PBDataWriterWriteUint64Field();
    if ((*(&self->_hasReference + 1) & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  PBDataWriterWriteFloatField();
  char v15 = *(&self->_hasReference + 1);
  if ((v15 & 2) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  if ((v15 & 4) != 0) {
LABEL_17:
  }
    PBDataWriterWriteBOOLField();
LABEL_18:
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaRRAnnotatedEntityReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteHasReference
{
  *(&self->_hasReference + 1) &= ~4u;
}

- (void)setHasHasReference:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasReference + 1) = *(&self->_hasReference + 1) & 0xFB | v3;
}

- (BOOL)hasHasReference
{
  return (*((unsigned __int8 *)&self->_hasReference + 1) >> 2) & 1;
}

- (void)setHasReference:(BOOL)a3
{
  *(&self->_hasReference + 1) |= 4u;
  self->_int hasReference = a3;
}

- (void)deleteSaliencyComputedAtTimestampInSeconds
{
  *(&self->_hasReference + 1) &= ~2u;
}

- (void)setHasSaliencyComputedAtTimestampInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_hasReference + 1) = *(&self->_hasReference + 1) & 0xFD | v3;
}

- (BOOL)hasSaliencyComputedAtTimestampInSeconds
{
  return (*((unsigned __int8 *)&self->_hasReference + 1) >> 1) & 1;
}

- (void)setSaliencyComputedAtTimestampInSeconds:(unint64_t)a3
{
  *(&self->_hasReference + 1) |= 2u;
  self->_unint64_t saliencyComputedAtTimestampInSeconds = a3;
}

- (void)deleteSaliencyScore
{
  *(&self->_hasReference + 1) &= ~1u;
}

- (void)setHasSaliencyScore:(BOOL)a3
{
  *(&self->_hasReference + 1) = *(&self->_hasReference + 1) & 0xFE | a3;
}

- (BOOL)hasSaliencyScore
{
  return *(&self->_hasReference + 1);
}

- (void)setSaliencyScore:(float)a3
{
  *(&self->_hasReference + 1) |= 1u;
  self->_float saliencyScore = a3;
}

- (id)annotationsAtIndex:(unint64_t)a3
{
  return [(NSArray *)self->_annotations objectAtIndexedSubscript:a3];
}

- (unint64_t)annotationsCount
{
  return [(NSArray *)self->_annotations count];
}

- (void)addAnnotations:(id)a3
{
  id v4 = a3;
  annotations = self->_annotations;
  id v8 = v4;
  if (!annotations)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_annotations;
    self->_annotations = v6;

    id v4 = v8;
    annotations = self->_annotations;
  }
  [(NSArray *)annotations addObject:v4];
}

- (void)clearAnnotations
{
}

- (void)deleteGroup
{
}

- (BOOL)hasGroup
{
  return self->_group != 0;
}

- (void)deleteSwiftClassName
{
}

- (BOOL)hasSwiftClassName
{
  return self->_swiftClassName != 0;
}

- (void)deleteUsoGraph
{
}

- (BOOL)hasUsoGraph
{
  return self->_usoGraph != 0;
}

@end
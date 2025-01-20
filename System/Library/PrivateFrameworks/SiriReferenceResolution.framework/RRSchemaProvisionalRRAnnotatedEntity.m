@interface RRSchemaProvisionalRRAnnotatedEntity
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
- (RRSchemaProvisionalRRAnnotatedEntity)initWithDictionary:(id)a3;
- (RRSchemaProvisionalRRAnnotatedEntity)initWithJSON:(id)a3;
- (RRSchemaProvisionalRRGroupIdentifier)group;
- (USOSchemaUSOGraph)usoGraph;
- (float)saliencyScore;
- (id)annotationsAtIndex:(unint64_t)a3;
- (id)dictionaryRepresentation;
- (unint64_t)annotationsCount;
- (unint64_t)hash;
- (unint64_t)saliencyComputedAtTimestampInSeconds;
- (void)addAnnotations:(id)a3;
- (void)clearAnnotations;
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

@implementation RRSchemaProvisionalRRAnnotatedEntity

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_annotations, 0);
  objc_storeStrong((id *)&self->_group, 0);
  objc_storeStrong((id *)&self->_swiftClassName, 0);
  objc_storeStrong((id *)&self->_usoGraph, 0);
}

- (void)setHasGroup:(BOOL)a3
{
  self->_hasGroup = a3;
}

- (void)setHasSwiftClassName:(BOOL)a3
{
  self->_hasSwiftClassName = a3;
}

- (void)setHasUsoGraph:(BOOL)a3
{
  self->_hasUsoGraph = a3;
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

- (RRSchemaProvisionalRRGroupIdentifier)group
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

- (RRSchemaProvisionalRRAnnotatedEntity)initWithDictionary:(id)a3
{
  uint64_t v33 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v31.receiver = self;
  v31.super_class = (Class)RRSchemaProvisionalRRAnnotatedEntity;
  v5 = [(RRSchemaProvisionalRRAnnotatedEntity *)&v31 init];
  if (v5)
  {
    uint64_t v6 = [v4 objectForKeyedSubscript:@"usoGraph"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[objc_alloc(MEMORY[0x263F6F180]) initWithDictionary:v6];
      [(RRSchemaProvisionalRRAnnotatedEntity *)v5 setUsoGraph:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"swiftClassName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(RRSchemaProvisionalRRAnnotatedEntity *)v5 setSwiftClassName:v9];
    }
    v26 = (void *)v6;
    v10 = [v4 objectForKeyedSubscript:@"group"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v11 = [[RRSchemaProvisionalRRGroupIdentifier alloc] initWithDictionary:v10];
      [(RRSchemaProvisionalRRAnnotatedEntity *)v5 setGroup:v11];
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
              v19 = [[RRSchemaProvisionalRRAnnotation alloc] initWithDictionary:v18];
              [(RRSchemaProvisionalRRAnnotatedEntity *)v5 addAnnotations:v19];
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
      -[RRSchemaProvisionalRRAnnotatedEntity setSaliencyScore:](v5, "setSaliencyScore:");
    }
    v21 = [v4 objectForKeyedSubscript:@"saliencyComputedAtTimestampInSeconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaProvisionalRRAnnotatedEntity setSaliencyComputedAtTimestampInSeconds:](v5, "setSaliencyComputedAtTimestampInSeconds:", [v21 unsignedLongLongValue]);
    }
    v22 = [v4 objectForKeyedSubscript:@"hasReference"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[RRSchemaProvisionalRRAnnotatedEntity setHasReference:](v5, "setHasReference:", [v22 BOOLValue]);
    }
    v23 = v5;
  }
  return v5;
}

- (RRSchemaProvisionalRRAnnotatedEntity)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x263F08900] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(RRSchemaProvisionalRRAnnotatedEntity *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(RRSchemaProvisionalRRAnnotatedEntity *)self dictionaryRepresentation];
  if ([MEMORY[0x263F08900] isValidJSONObject:v2])
  {
    v3 = [MEMORY[0x263F08900] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    v3 = 0;
  }

  return (NSData *)v3;
}

- (id)dictionaryRepresentation
{
  uint64_t v31 = *MEMORY[0x263EF8340];
  v3 = [MEMORY[0x263EFF9A0] dictionary];
  if ([(NSArray *)self->_annotations count])
  {
    id v4 = [MEMORY[0x263EFF980] array];
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
            v11 = [MEMORY[0x263EFF9D0] null];
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
    v12 = [(RRSchemaProvisionalRRAnnotatedEntity *)self group];
    id v13 = [v12 dictionaryRepresentation];
    if (v13)
    {
      [v3 setObject:v13 forKeyedSubscript:@"group"];
    }
    else
    {
      uint64_t v14 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v14 forKeyedSubscript:@"group"];
    }
  }
  char has = (char)self->_has;
  if ((has & 4) != 0)
  {
    v22 = objc_msgSend(NSNumber, "numberWithBool:", -[RRSchemaProvisionalRRAnnotatedEntity hasReference](self, "hasReference"));
    [v3 setObject:v22 forKeyedSubscript:@"hasReference"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_20:
      if ((has & 1) == 0) {
        goto LABEL_22;
      }
      goto LABEL_21;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_20;
  }
  v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[RRSchemaProvisionalRRAnnotatedEntity saliencyComputedAtTimestampInSeconds](self, "saliencyComputedAtTimestampInSeconds", (void)v26));
  [v3 setObject:v23 forKeyedSubscript:@"saliencyComputedAtTimestampInSeconds"];

  if (*(unsigned char *)&self->_has)
  {
LABEL_21:
    uint64_t v16 = NSNumber;
    [(RRSchemaProvisionalRRAnnotatedEntity *)self saliencyScore];
    v17 = objc_msgSend(v16, "numberWithFloat:");
    [v3 setObject:v17 forKeyedSubscript:@"saliencyScore"];
  }
LABEL_22:
  if (self->_swiftClassName)
  {
    uint64_t v18 = [(RRSchemaProvisionalRRAnnotatedEntity *)self swiftClassName];
    v19 = (void *)[v18 copy];
    [v3 setObject:v19 forKeyedSubscript:@"swiftClassName"];
  }
  if (self->_usoGraph)
  {
    v20 = [(RRSchemaProvisionalRRAnnotatedEntity *)self usoGraph];
    v21 = [v20 dictionaryRepresentation];
    if (v21)
    {
      [v3 setObject:v21 forKeyedSubscript:@"usoGraph"];
    }
    else
    {
      v24 = [MEMORY[0x263EFF9D0] null];
      [v3 setObject:v24 forKeyedSubscript:@"usoGraph"];
    }
  }
  -[RRSchemaProvisionalRRAnnotatedEntity willProduceDictionaryRepresentation:](self, "willProduceDictionaryRepresentation:", v3, (void)v26);
  return v3;
}

- (unint64_t)hash
{
  uint64_t v3 = [(USOSchemaUSOGraph *)self->_usoGraph hash];
  NSUInteger v4 = [(NSString *)self->_swiftClassName hash];
  unint64_t v5 = [(RRSchemaProvisionalRRGroupIdentifier *)self->_group hash];
  uint64_t v6 = [(NSArray *)self->_annotations hash];
  char has = (char)self->_has;
  if (has)
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
  if ((has & 2) != 0)
  {
    unint64_t v13 = 2654435761u * self->_saliencyComputedAtTimestampInSeconds;
    if ((has & 4) != 0) {
      goto LABEL_11;
    }
LABEL_13:
    uint64_t v14 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14;
  }
  unint64_t v13 = 0;
  if ((has & 4) == 0) {
    goto LABEL_13;
  }
LABEL_11:
  uint64_t v14 = 2654435761 * self->_hasReference;
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(RRSchemaProvisionalRRAnnotatedEntity *)self usoGraph];
  uint64_t v6 = [v4 usoGraph];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(RRSchemaProvisionalRRAnnotatedEntity *)self usoGraph];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(RRSchemaProvisionalRRAnnotatedEntity *)self usoGraph];
    double v10 = [v4 usoGraph];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(RRSchemaProvisionalRRAnnotatedEntity *)self swiftClassName];
  uint64_t v6 = [v4 swiftClassName];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(RRSchemaProvisionalRRAnnotatedEntity *)self swiftClassName];
  if (v12)
  {
    unint64_t v13 = (void *)v12;
    uint64_t v14 = [(RRSchemaProvisionalRRAnnotatedEntity *)self swiftClassName];
    uint64_t v15 = [v4 swiftClassName];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(RRSchemaProvisionalRRAnnotatedEntity *)self group];
  uint64_t v6 = [v4 group];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(RRSchemaProvisionalRRAnnotatedEntity *)self group];
  if (v17)
  {
    uint64_t v18 = (void *)v17;
    v19 = [(RRSchemaProvisionalRRAnnotatedEntity *)self group];
    v20 = [v4 group];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(RRSchemaProvisionalRRAnnotatedEntity *)self annotations];
  uint64_t v6 = [v4 annotations];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(RRSchemaProvisionalRRAnnotatedEntity *)self annotations];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(RRSchemaProvisionalRRAnnotatedEntity *)self annotations];
    v25 = [v4 annotations];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  char has = (char)self->_has;
  char v30 = v4[60];
  if ((v30 & 1) == (has & 1))
  {
    if (*(unsigned char *)&self->_has)
    {
      float saliencyScore = self->_saliencyScore;
      [v4 saliencyScore];
      if (saliencyScore != v32) {
        goto LABEL_22;
      }
      char has = (char)self->_has;
      char v30 = v4[60];
    }
    char v33 = v30 ^ has;
    if ((v33 & 2) == 0)
    {
      if ((has & 2) != 0)
      {
        unint64_t saliencyComputedAtTimestampInSeconds = self->_saliencyComputedAtTimestampInSeconds;
        if (saliencyComputedAtTimestampInSeconds != [v4 saliencyComputedAtTimestampInSeconds]) {
          goto LABEL_22;
        }
        char has = (char)self->_has;
        char v33 = v4[60] ^ has;
      }
      if ((v33 & 4) == 0)
      {
        if ((has & 4) == 0
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
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v4 = a3;
  unint64_t v5 = [(RRSchemaProvisionalRRAnnotatedEntity *)self usoGraph];

  if (v5)
  {
    uint64_t v6 = [(RRSchemaProvisionalRRAnnotatedEntity *)self usoGraph];
    PBDataWriterWriteSubmessage();
  }
  uint64_t v7 = [(RRSchemaProvisionalRRAnnotatedEntity *)self swiftClassName];

  if (v7) {
    PBDataWriterWriteStringField();
  }
  unint64_t v8 = [(RRSchemaProvisionalRRAnnotatedEntity *)self group];

  if (v8)
  {
    v9 = [(RRSchemaProvisionalRRAnnotatedEntity *)self group];
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

  char has = (char)self->_has;
  if ((has & 1) == 0)
  {
    if ((*(unsigned char *)&self->_has & 2) == 0) {
      goto LABEL_16;
    }
LABEL_20:
    PBDataWriterWriteUint64Field();
    if ((*(unsigned char *)&self->_has & 4) == 0) {
      goto LABEL_18;
    }
    goto LABEL_17;
  }
  PBDataWriterWriteFloatField();
  char has = (char)self->_has;
  if ((has & 2) != 0) {
    goto LABEL_20;
  }
LABEL_16:
  if ((has & 4) != 0) {
LABEL_17:
  }
    PBDataWriterWriteBOOLField();
LABEL_18:
}

- (BOOL)readFrom:(id)a3
{
  return RRSchemaProvisionalRRAnnotatedEntityReadFrom(self, (uint64_t)a3, v3);
}

- (void)setHasHasReference:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasHasReference
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasReference:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int hasReference = a3;
}

- (void)setHasSaliencyComputedAtTimestampInSeconds:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasSaliencyComputedAtTimestampInSeconds
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setSaliencyComputedAtTimestampInSeconds:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_unint64_t saliencyComputedAtTimestampInSeconds = a3;
}

- (void)setHasSaliencyScore:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasSaliencyScore
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setSaliencyScore:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
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
    uint64_t v6 = [MEMORY[0x263EFF980] array];
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

- (BOOL)hasGroup
{
  return self->_group != 0;
}

- (BOOL)hasSwiftClassName
{
  return self->_swiftClassName != 0;
}

- (BOOL)hasUsoGraph
{
  return self->_usoGraph != 0;
}

@end
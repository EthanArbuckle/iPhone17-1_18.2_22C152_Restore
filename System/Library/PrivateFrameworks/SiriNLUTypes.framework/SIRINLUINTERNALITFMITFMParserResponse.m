@interface SIRINLUINTERNALITFMITFMParserResponse
+ (Class)hypothesesType;
- (BOOL)classificationLabel;
- (BOOL)hasClassificationLabel;
- (BOOL)hasClassificationProbability;
- (BOOL)hasParser;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)hypotheses;
- (SIRINLUEXTERNALParser)parser;
- (float)classificationProbability;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)hypothesesAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)hypothesesCount;
- (void)addHypotheses:(id)a3;
- (void)clearHypotheses;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setClassificationLabel:(BOOL)a3;
- (void)setClassificationProbability:(float)a3;
- (void)setHasClassificationLabel:(BOOL)a3;
- (void)setHasClassificationProbability:(BOOL)a3;
- (void)setHypotheses:(id)a3;
- (void)setParser:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUINTERNALITFMITFMParserResponse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_hypotheses, 0);
}

- (void)setHypotheses:(id)a3
{
}

- (NSMutableArray)hypotheses
{
  return self->_hypotheses;
}

- (void)setParser:(id)a3
{
}

- (SIRINLUEXTERNALParser)parser
{
  return self->_parser;
}

- (float)classificationProbability
{
  return self->_classificationProbability;
}

- (BOOL)classificationLabel
{
  return self->_classificationLabel;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  char v6 = *((unsigned char *)v4 + 36);
  if ((v6 & 2) != 0)
  {
    self->_classificationLabel = *((unsigned char *)v4 + 32);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v4 + 36);
  }
  if (v6)
  {
    self->_classificationProbability = *((float *)v4 + 2);
    *(unsigned char *)&self->_has |= 1u;
  }
  parser = self->_parser;
  uint64_t v8 = *((void *)v5 + 3);
  if (parser)
  {
    if (v8) {
      -[SIRINLUEXTERNALParser mergeFrom:](parser, "mergeFrom:");
    }
  }
  else if (v8)
  {
    -[SIRINLUINTERNALITFMITFMParserResponse setParser:](self, "setParser:");
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = *((id *)v5 + 2);
  uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v15 != v12) {
          objc_enumerationMutation(v9);
        }
        -[SIRINLUINTERNALITFMITFMParserResponse addHypotheses:](self, "addHypotheses:", *(void *)(*((void *)&v14 + 1) + 8 * i), (void)v14);
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v11);
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    uint64_t v3 = 2654435761 * self->_classificationLabel;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_3;
    }
LABEL_8:
    unint64_t v8 = 0;
    goto LABEL_11;
  }
  uint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_3:
  float classificationProbability = self->_classificationProbability;
  float v5 = -classificationProbability;
  if (classificationProbability >= 0.0) {
    float v5 = self->_classificationProbability;
  }
  float v6 = floorf(v5 + 0.5);
  float v7 = (float)(v5 - v6) * 1.8447e19;
  unint64_t v8 = 2654435761u * (unint64_t)fmodf(v6, 1.8447e19);
  if (v7 >= 0.0)
  {
    if (v7 > 0.0) {
      v8 += (unint64_t)v7;
    }
  }
  else
  {
    v8 -= (unint64_t)fabsf(v7);
  }
LABEL_11:
  unint64_t v9 = v8 ^ v3 ^ [(SIRINLUEXTERNALParser *)self->_parser hash];
  return v9 ^ [(NSMutableArray *)self->_hypotheses hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 36) & 2) != 0)
    {
      if (self->_classificationLabel)
      {
        if (!*((unsigned char *)v4 + 32)) {
          goto LABEL_19;
        }
        goto LABEL_10;
      }
      if (!*((unsigned char *)v4 + 32)) {
        goto LABEL_10;
      }
    }
LABEL_19:
    char v7 = 0;
    goto LABEL_20;
  }
  if ((*((unsigned char *)v4 + 36) & 2) != 0) {
    goto LABEL_19;
  }
LABEL_10:
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 36) & 1) == 0 || self->_classificationProbability != *((float *)v4 + 2)) {
      goto LABEL_19;
    }
  }
  else if (*((unsigned char *)v4 + 36))
  {
    goto LABEL_19;
  }
  parser = self->_parser;
  if ((unint64_t)parser | *((void *)v4 + 3) && !-[SIRINLUEXTERNALParser isEqual:](parser, "isEqual:")) {
    goto LABEL_19;
  }
  hypotheses = self->_hypotheses;
  if ((unint64_t)hypotheses | *((void *)v4 + 2)) {
    char v7 = -[NSMutableArray isEqual:](hypotheses, "isEqual:");
  }
  else {
    char v7 = 1;
  }
LABEL_20:

  return v7;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  float v6 = (void *)v5;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *(unsigned char *)(v5 + 32) = self->_classificationLabel;
    *(unsigned char *)(v5 + 36) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)(v5 + 8) = self->_classificationProbability;
    *(unsigned char *)(v5 + 36) |= 1u;
  }
  id v8 = [(SIRINLUEXTERNALParser *)self->_parser copyWithZone:a3];
  unint64_t v9 = (void *)v6[3];
  v6[3] = v8;

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_hypotheses;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = objc_msgSend(*(id *)(*((void *)&v17 + 1) + 8 * i), "copyWithZone:", a3, (void)v17);
        [v6 addHypotheses:v15];
      }
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v4[32] = self->_classificationLabel;
    v4[36] |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((_DWORD *)v4 + 2) = LODWORD(self->_classificationProbability);
    v4[36] |= 1u;
  }
  id v10 = v4;
  if (self->_parser) {
    objc_msgSend(v4, "setParser:");
  }
  if ([(SIRINLUINTERNALITFMITFMParserResponse *)self hypothesesCount])
  {
    [v10 clearHypotheses];
    unint64_t v6 = [(SIRINLUINTERNALITFMITFMParserResponse *)self hypothesesCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        unint64_t v9 = [(SIRINLUINTERNALITFMITFMParserResponse *)self hypothesesAtIndex:i];
        [v10 addHypotheses:v9];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteFloatField();
  }
  if (self->_parser) {
    PBDataWriterWriteSubmessage();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_hypotheses;
  uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUINTERNALITFMITFMParserResponseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    unint64_t v6 = [NSNumber numberWithBool:self->_classificationLabel];
    [v3 setObject:v6 forKey:@"classification_label"];

    char has = (char)self->_has;
  }
  if (has)
  {
    *(float *)&double v4 = self->_classificationProbability;
    uint64_t v7 = [NSNumber numberWithFloat:v4];
    [v3 setObject:v7 forKey:@"classification_probability"];
  }
  parser = self->_parser;
  if (parser)
  {
    uint64_t v9 = [(SIRINLUEXTERNALParser *)parser dictionaryRepresentation];
    [v3 setObject:v9 forKey:@"parser"];
  }
  if ([(NSMutableArray *)self->_hypotheses count])
  {
    id v10 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_hypotheses, "count"));
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v11 = self->_hypotheses;
    uint64_t v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "dictionaryRepresentation", (void)v18);
          [v10 addObject:v16];
        }
        uint64_t v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"hypotheses"];
  }
  return v3;
}

- (id)description
{
  uint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUINTERNALITFMITFMParserResponse;
  double v4 = [(SIRINLUINTERNALITFMITFMParserResponse *)&v8 description];
  uint64_t v5 = [(SIRINLUINTERNALITFMITFMParserResponse *)self dictionaryRepresentation];
  unint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)hypothesesAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_hypotheses objectAtIndex:a3];
}

- (unint64_t)hypothesesCount
{
  return [(NSMutableArray *)self->_hypotheses count];
}

- (void)addHypotheses:(id)a3
{
  id v4 = a3;
  hypotheses = self->_hypotheses;
  id v8 = v4;
  if (!hypotheses)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_hypotheses;
    self->_hypotheses = v6;

    id v4 = v8;
    hypotheses = self->_hypotheses;
  }
  [(NSMutableArray *)hypotheses addObject:v4];
}

- (void)clearHypotheses
{
}

- (BOOL)hasParser
{
  return self->_parser != 0;
}

- (BOOL)hasClassificationProbability
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasClassificationProbability:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setClassificationProbability:(float)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_float classificationProbability = a3;
}

- (BOOL)hasClassificationLabel
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasClassificationLabel:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setClassificationLabel:(BOOL)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_classificationLabel = a3;
}

+ (Class)hypothesesType
{
  return (Class)objc_opt_class();
}

@end
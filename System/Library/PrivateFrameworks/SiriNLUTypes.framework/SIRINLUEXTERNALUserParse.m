@interface SIRINLUEXTERNALUserParse
+ (Class)userDialogActsType;
- (BOOL)hasComparableProbability;
- (BOOL)hasCorrectionOutcome;
- (BOOL)hasIdA;
- (BOOL)hasParser;
- (BOOL)hasParserId;
- (BOOL)hasProbability;
- (BOOL)hasRepetitionResult;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)userDialogActs;
- (NSString)parserId;
- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome;
- (SIRINLUEXTERNALParser)parser;
- (SIRINLUEXTERNALRepetitionResult)repetitionResult;
- (SIRINLUEXTERNALUUID)idA;
- (double)comparableProbability;
- (double)probability;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)userDialogActsAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)userDialogActsCount;
- (void)addUserDialogActs:(id)a3;
- (void)clearUserDialogActs;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setComparableProbability:(double)a3;
- (void)setCorrectionOutcome:(id)a3;
- (void)setHasComparableProbability:(BOOL)a3;
- (void)setHasProbability:(BOOL)a3;
- (void)setIdA:(id)a3;
- (void)setParser:(id)a3;
- (void)setParserId:(id)a3;
- (void)setProbability:(double)a3;
- (void)setRepetitionResult:(id)a3;
- (void)setUserDialogActs:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SIRINLUEXTERNALUserParse

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDialogActs, 0);
  objc_storeStrong((id *)&self->_repetitionResult, 0);
  objc_storeStrong((id *)&self->_parserId, 0);
  objc_storeStrong((id *)&self->_parser, 0);
  objc_storeStrong((id *)&self->_idA, 0);
  objc_storeStrong((id *)&self->_correctionOutcome, 0);
}

- (void)setCorrectionOutcome:(id)a3
{
}

- (SIRINLUEXTERNALCorrectionOutcome)correctionOutcome
{
  return self->_correctionOutcome;
}

- (double)comparableProbability
{
  return self->_comparableProbability;
}

- (void)setParser:(id)a3
{
}

- (SIRINLUEXTERNALParser)parser
{
  return self->_parser;
}

- (void)setRepetitionResult:(id)a3
{
}

- (SIRINLUEXTERNALRepetitionResult)repetitionResult
{
  return self->_repetitionResult;
}

- (void)setParserId:(id)a3
{
}

- (NSString)parserId
{
  return self->_parserId;
}

- (double)probability
{
  return self->_probability;
}

- (void)setUserDialogActs:(id)a3
{
}

- (NSMutableArray)userDialogActs
{
  return self->_userDialogActs;
}

- (void)setIdA:(id)a3
{
}

- (SIRINLUEXTERNALUUID)idA
{
  return self->_idA;
}

- (void)mergeFrom:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  idA = self->_idA;
  uint64_t v6 = *((void *)v4 + 4);
  if (idA)
  {
    if (v6) {
      -[SIRINLUEXTERNALUUID mergeFrom:](idA, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[SIRINLUEXTERNALUserParse setIdA:](self, "setIdA:");
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = *((id *)v4 + 8);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SIRINLUEXTERNALUserParse addUserDialogActs:](self, "addUserDialogActs:", *(void *)(*((void *)&v18 + 1) + 8 * i), (void)v18);
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v9);
  }

  if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
    self->_probability = *((double *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 6)) {
    -[SIRINLUEXTERNALUserParse setParserId:](self, "setParserId:");
  }
  repetitionResult = self->_repetitionResult;
  uint64_t v13 = *((void *)v4 + 7);
  if (repetitionResult)
  {
    if (v13) {
      -[SIRINLUEXTERNALRepetitionResult mergeFrom:](repetitionResult, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[SIRINLUEXTERNALUserParse setRepetitionResult:](self, "setRepetitionResult:");
  }
  parser = self->_parser;
  uint64_t v15 = *((void *)v4 + 5);
  if (parser)
  {
    if (v15) {
      -[SIRINLUEXTERNALParser mergeFrom:](parser, "mergeFrom:");
    }
  }
  else if (v15)
  {
    -[SIRINLUEXTERNALUserParse setParser:](self, "setParser:");
  }
  if (*((unsigned char *)v4 + 72))
  {
    self->_comparableProbability = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  correctionOutcome = self->_correctionOutcome;
  uint64_t v17 = *((void *)v4 + 3);
  if (correctionOutcome)
  {
    if (v17) {
      -[SIRINLUEXTERNALCorrectionOutcome mergeFrom:](correctionOutcome, "mergeFrom:");
    }
  }
  else if (v17)
  {
    -[SIRINLUEXTERNALUserParse setCorrectionOutcome:](self, "setCorrectionOutcome:");
  }
}

- (unint64_t)hash
{
  unint64_t v3 = [(SIRINLUEXTERNALUUID *)self->_idA hash];
  uint64_t v4 = [(NSMutableArray *)self->_userDialogActs hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    double probability = self->_probability;
    double v7 = -probability;
    if (probability >= 0.0) {
      double v7 = self->_probability;
    }
    long double v8 = floor(v7 + 0.5);
    double v9 = (v7 - v8) * 1.84467441e19;
    unint64_t v5 = 2654435761u * (unint64_t)fmod(v8, 1.84467441e19);
    if (v9 >= 0.0)
    {
      if (v9 > 0.0) {
        v5 += (unint64_t)v9;
      }
    }
    else
    {
      v5 -= (unint64_t)fabs(v9);
    }
  }
  else
  {
    unint64_t v5 = 0;
  }
  NSUInteger v10 = [(NSString *)self->_parserId hash];
  unint64_t v11 = [(SIRINLUEXTERNALRepetitionResult *)self->_repetitionResult hash];
  unint64_t v12 = [(SIRINLUEXTERNALParser *)self->_parser hash];
  if (*(unsigned char *)&self->_has)
  {
    double comparableProbability = self->_comparableProbability;
    double v15 = -comparableProbability;
    if (comparableProbability >= 0.0) {
      double v15 = self->_comparableProbability;
    }
    long double v16 = floor(v15 + 0.5);
    double v17 = (v15 - v16) * 1.84467441e19;
    unint64_t v13 = 2654435761u * (unint64_t)fmod(v16, 1.84467441e19);
    if (v17 >= 0.0)
    {
      if (v17 > 0.0) {
        v13 += (unint64_t)v17;
      }
    }
    else
    {
      v13 -= (unint64_t)fabs(v17);
    }
  }
  else
  {
    unint64_t v13 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v10 ^ v11 ^ v12 ^ v13 ^ [(SIRINLUEXTERNALCorrectionOutcome *)self->_correctionOutcome hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_24;
  }
  idA = self->_idA;
  if ((unint64_t)idA | *((void *)v4 + 4))
  {
    if (!-[SIRINLUEXTERNALUUID isEqual:](idA, "isEqual:")) {
      goto LABEL_24;
    }
  }
  userDialogActs = self->_userDialogActs;
  if ((unint64_t)userDialogActs | *((void *)v4 + 8))
  {
    if (!-[NSMutableArray isEqual:](userDialogActs, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 72) & 2) == 0 || self->_probability != *((double *)v4 + 2)) {
      goto LABEL_24;
    }
  }
  else if ((*((unsigned char *)v4 + 72) & 2) != 0)
  {
LABEL_24:
    char v11 = 0;
    goto LABEL_25;
  }
  parserId = self->_parserId;
  if ((unint64_t)parserId | *((void *)v4 + 6) && !-[NSString isEqual:](parserId, "isEqual:")) {
    goto LABEL_24;
  }
  repetitionResult = self->_repetitionResult;
  if ((unint64_t)repetitionResult | *((void *)v4 + 7))
  {
    if (!-[SIRINLUEXTERNALRepetitionResult isEqual:](repetitionResult, "isEqual:")) {
      goto LABEL_24;
    }
  }
  parser = self->_parser;
  if ((unint64_t)parser | *((void *)v4 + 5))
  {
    if (!-[SIRINLUEXTERNALParser isEqual:](parser, "isEqual:")) {
      goto LABEL_24;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 72) & 1) == 0 || self->_comparableProbability != *((double *)v4 + 1)) {
      goto LABEL_24;
    }
  }
  else if (*((unsigned char *)v4 + 72))
  {
    goto LABEL_24;
  }
  correctionOutcome = self->_correctionOutcome;
  if ((unint64_t)correctionOutcome | *((void *)v4 + 3)) {
    char v11 = -[SIRINLUEXTERNALCorrectionOutcome isEqual:](correctionOutcome, "isEqual:");
  }
  else {
    char v11 = 1;
  }
LABEL_25:

  return v11;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(SIRINLUEXTERNALUUID *)self->_idA copyWithZone:a3];
  double v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long double v8 = self->_userDialogActs;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v24;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v24 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * v12), "copyWithZone:", a3, (void)v23);
        [(id)v5 addUserDialogActs:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v10);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *(double *)(v5 + 16) = self->_probability;
    *(unsigned char *)(v5 + 72) |= 2u;
  }
  uint64_t v14 = -[NSString copyWithZone:](self->_parserId, "copyWithZone:", a3, (void)v23);
  double v15 = *(void **)(v5 + 48);
  *(void *)(v5 + 48) = v14;

  id v16 = [(SIRINLUEXTERNALRepetitionResult *)self->_repetitionResult copyWithZone:a3];
  double v17 = *(void **)(v5 + 56);
  *(void *)(v5 + 56) = v16;

  id v18 = [(SIRINLUEXTERNALParser *)self->_parser copyWithZone:a3];
  long long v19 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v18;

  if (*(unsigned char *)&self->_has)
  {
    *(double *)(v5 + 8) = self->_comparableProbability;
    *(unsigned char *)(v5 + 72) |= 1u;
  }
  id v20 = [(SIRINLUEXTERNALCorrectionOutcome *)self->_correctionOutcome copyWithZone:a3];
  long long v21 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v20;

  return (id)v5;
}

- (void)copyTo:(id)a3
{
  id v9 = a3;
  if (self->_idA) {
    objc_msgSend(v9, "setIdA:");
  }
  if ([(SIRINLUEXTERNALUserParse *)self userDialogActsCount])
  {
    [v9 clearUserDialogActs];
    unint64_t v4 = [(SIRINLUEXTERNALUserParse *)self userDialogActsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        double v7 = [(SIRINLUEXTERNALUserParse *)self userDialogActsAtIndex:i];
        [v9 addUserDialogActs:v7];
      }
    }
  }
  long double v8 = v9;
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    *((void *)v9 + 2) = *(void *)&self->_probability;
    *((unsigned char *)v9 + 72) |= 2u;
  }
  if (self->_parserId)
  {
    objc_msgSend(v9, "setParserId:");
    long double v8 = v9;
  }
  if (self->_repetitionResult)
  {
    objc_msgSend(v9, "setRepetitionResult:");
    long double v8 = v9;
  }
  if (self->_parser)
  {
    objc_msgSend(v9, "setParser:");
    long double v8 = v9;
  }
  if (*(unsigned char *)&self->_has)
  {
    v8[1] = *(void *)&self->_comparableProbability;
    *((unsigned char *)v8 + 72) |= 1u;
  }
  if (self->_correctionOutcome)
  {
    objc_msgSend(v9, "setCorrectionOutcome:");
    long double v8 = v9;
  }
}

- (void)writeTo:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_idA) {
    PBDataWriterWriteSubmessage();
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  unint64_t v5 = self->_userDialogActs;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }

  if ((*(unsigned char *)&self->_has & 2) != 0) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_parserId) {
    PBDataWriterWriteStringField();
  }
  if (self->_repetitionResult) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_parser) {
    PBDataWriterWriteSubmessage();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  if (self->_correctionOutcome) {
    PBDataWriterWriteSubmessage();
  }
}

- (BOOL)readFrom:(id)a3
{
  return SIRINLUEXTERNALUserParseReadFrom((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  idA = self->_idA;
  if (idA)
  {
    unint64_t v5 = [(SIRINLUEXTERNALUUID *)idA dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"id_a"];
  }
  if ([(NSMutableArray *)self->_userDialogActs count])
  {
    uint64_t v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_userDialogActs, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    uint64_t v7 = self->_userDialogActs;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v24 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v12 = objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "dictionaryRepresentation", (void)v23);
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"user_dialog_acts"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    long long v13 = [NSNumber numberWithDouble:self->_probability];
    [v3 setObject:v13 forKey:@"probability"];
  }
  parserId = self->_parserId;
  if (parserId) {
    [v3 setObject:parserId forKey:@"parser_id"];
  }
  repetitionResult = self->_repetitionResult;
  if (repetitionResult)
  {
    id v16 = [(SIRINLUEXTERNALRepetitionResult *)repetitionResult dictionaryRepresentation];
    [v3 setObject:v16 forKey:@"repetition_result"];
  }
  parser = self->_parser;
  if (parser)
  {
    id v18 = [(SIRINLUEXTERNALParser *)parser dictionaryRepresentation];
    [v3 setObject:v18 forKey:@"parser"];
  }
  if (*(unsigned char *)&self->_has)
  {
    long long v19 = [NSNumber numberWithDouble:self->_comparableProbability];
    [v3 setObject:v19 forKey:@"comparable_probability"];
  }
  correctionOutcome = self->_correctionOutcome;
  if (correctionOutcome)
  {
    long long v21 = [(SIRINLUEXTERNALCorrectionOutcome *)correctionOutcome dictionaryRepresentation];
    [v3 setObject:v21 forKey:@"correction_outcome"];
  }
  return v3;
}

- (id)description
{
  unint64_t v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)SIRINLUEXTERNALUserParse;
  id v4 = [(SIRINLUEXTERNALUserParse *)&v8 description];
  unint64_t v5 = [(SIRINLUEXTERNALUserParse *)self dictionaryRepresentation];
  uint64_t v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (BOOL)hasCorrectionOutcome
{
  return self->_correctionOutcome != 0;
}

- (BOOL)hasComparableProbability
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasComparableProbability:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setComparableProbability:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double comparableProbability = a3;
}

- (BOOL)hasParser
{
  return self->_parser != 0;
}

- (BOOL)hasRepetitionResult
{
  return self->_repetitionResult != 0;
}

- (BOOL)hasParserId
{
  return self->_parserId != 0;
}

- (BOOL)hasProbability
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasProbability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setProbability:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double probability = a3;
}

- (id)userDialogActsAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userDialogActs objectAtIndex:a3];
}

- (unint64_t)userDialogActsCount
{
  return [(NSMutableArray *)self->_userDialogActs count];
}

- (void)addUserDialogActs:(id)a3
{
  id v4 = a3;
  userDialogActs = self->_userDialogActs;
  id v8 = v4;
  if (!userDialogActs)
  {
    uint64_t v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v7 = self->_userDialogActs;
    self->_userDialogActs = v6;

    id v4 = v8;
    userDialogActs = self->_userDialogActs;
  }
  [(NSMutableArray *)userDialogActs addObject:v4];
}

- (void)clearUserDialogActs
{
}

- (BOOL)hasIdA
{
  return self->_idA != 0;
}

+ (Class)userDialogActsType
{
  return (Class)objc_opt_class();
}

@end
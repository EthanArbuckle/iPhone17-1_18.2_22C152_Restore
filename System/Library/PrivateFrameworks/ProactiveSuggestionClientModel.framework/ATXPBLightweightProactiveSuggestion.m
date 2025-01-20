@interface ATXPBLightweightProactiveSuggestion
- (ATXPBProactiveSuggestionScoreSpecification)scoreSpecification;
- (BOOL)hasExecutableIdentifier;
- (BOOL)hasExecutableType;
- (BOOL)hasPredictionReasons;
- (BOOL)hasScoreSpecification;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSString)executableIdentifier;
- (NSString)executableType;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (unint64_t)hash;
- (unint64_t)predictionReasons;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setExecutableIdentifier:(id)a3;
- (void)setExecutableType:(id)a3;
- (void)setHasPredictionReasons:(BOOL)a3;
- (void)setPredictionReasons:(unint64_t)a3;
- (void)setScoreSpecification:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation ATXPBLightweightProactiveSuggestion

- (BOOL)hasExecutableIdentifier
{
  return self->_executableIdentifier != 0;
}

- (BOOL)hasExecutableType
{
  return self->_executableType != 0;
}

- (BOOL)hasScoreSpecification
{
  return self->_scoreSpecification != 0;
}

- (void)setPredictionReasons:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_predictionReasons = a3;
}

- (void)setHasPredictionReasons:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasPredictionReasons
{
  return *(unsigned char *)&self->_has & 1;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)ATXPBLightweightProactiveSuggestion;
  v4 = [(ATXPBLightweightProactiveSuggestion *)&v8 description];
  v5 = [(ATXPBLightweightProactiveSuggestion *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  executableIdentifier = self->_executableIdentifier;
  if (executableIdentifier) {
    [v3 setObject:executableIdentifier forKey:@"executableIdentifier"];
  }
  executableType = self->_executableType;
  if (executableType) {
    [v4 setObject:executableType forKey:@"executableType"];
  }
  scoreSpecification = self->_scoreSpecification;
  if (scoreSpecification)
  {
    objc_super v8 = [(ATXPBProactiveSuggestionScoreSpecification *)scoreSpecification dictionaryRepresentation];
    [v4 setObject:v8 forKey:@"scoreSpecification"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v9 = [NSNumber numberWithUnsignedLongLong:self->_predictionReasons];
    [v4 setObject:v9 forKey:@"predictionReasons"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return ATXPBLightweightProactiveSuggestionReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_executableIdentifier)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_executableType)
  {
    PBDataWriterWriteStringField();
    id v4 = v5;
  }
  if (self->_scoreSpecification)
  {
    PBDataWriterWriteSubmessage();
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    PBDataWriterWriteUint64Field();
    id v4 = v5;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_executableIdentifier)
  {
    objc_msgSend(v4, "setExecutableIdentifier:");
    id v4 = v5;
  }
  if (self->_executableType)
  {
    objc_msgSend(v5, "setExecutableType:");
    id v4 = v5;
  }
  if (self->_scoreSpecification)
  {
    objc_msgSend(v5, "setScoreSpecification:");
    id v4 = v5;
  }
  if (*(unsigned char *)&self->_has)
  {
    *((void *)v4 + 1) = self->_predictionReasons;
    *((unsigned char *)v4 + 40) |= 1u;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_executableIdentifier copyWithZone:a3];
  v7 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v6;

  uint64_t v8 = [(NSString *)self->_executableType copyWithZone:a3];
  v9 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v8;

  id v10 = [(ATXPBProactiveSuggestionScoreSpecification *)self->_scoreSpecification copyWithZone:a3];
  v11 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v10;

  if (*(unsigned char *)&self->_has)
  {
    *(void *)(v5 + 8) = self->_predictionReasons;
    *(unsigned char *)(v5 + 40) |= 1u;
  }
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_12;
  }
  executableIdentifier = self->_executableIdentifier;
  if ((unint64_t)executableIdentifier | *((void *)v4 + 2))
  {
    if (!-[NSString isEqual:](executableIdentifier, "isEqual:")) {
      goto LABEL_12;
    }
  }
  executableType = self->_executableType;
  if ((unint64_t)executableType | *((void *)v4 + 3))
  {
    if (!-[NSString isEqual:](executableType, "isEqual:")) {
      goto LABEL_12;
    }
  }
  scoreSpecification = self->_scoreSpecification;
  if ((unint64_t)scoreSpecification | *((void *)v4 + 4))
  {
    if (!-[ATXPBProactiveSuggestionScoreSpecification isEqual:](scoreSpecification, "isEqual:")) {
      goto LABEL_12;
    }
  }
  BOOL v8 = (*((unsigned char *)v4 + 40) & 1) == 0;
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 40) & 1) != 0 && self->_predictionReasons == *((void *)v4 + 1))
    {
      BOOL v8 = 1;
      goto LABEL_13;
    }
LABEL_12:
    BOOL v8 = 0;
  }
LABEL_13:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_executableIdentifier hash];
  NSUInteger v4 = [(NSString *)self->_executableType hash];
  unint64_t v5 = [(ATXPBProactiveSuggestionScoreSpecification *)self->_scoreSpecification hash];
  if (*(unsigned char *)&self->_has) {
    unint64_t v6 = 2654435761u * self->_predictionReasons;
  }
  else {
    unint64_t v6 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6;
}

- (void)mergeFrom:(id)a3
{
  NSUInteger v4 = a3;
  uint64_t v5 = v4[2];
  BOOL v8 = v4;
  if (v5)
  {
    -[ATXPBLightweightProactiveSuggestion setExecutableIdentifier:](self, "setExecutableIdentifier:", v5, v4);
    NSUInteger v4 = v8;
  }
  if (v4[3])
  {
    -[ATXPBLightweightProactiveSuggestion setExecutableType:](self, "setExecutableType:");
    NSUInteger v4 = v8;
  }
  scoreSpecification = self->_scoreSpecification;
  v7 = (void *)v4[4];
  if (scoreSpecification)
  {
    if (!v7) {
      goto LABEL_11;
    }
    -[ATXPBProactiveSuggestionScoreSpecification mergeFrom:]((uint64_t)scoreSpecification, v7);
  }
  else
  {
    if (!v7) {
      goto LABEL_11;
    }
    [(ATXPBLightweightProactiveSuggestion *)self setScoreSpecification:v4[4]];
  }
  NSUInteger v4 = v8;
LABEL_11:
  if (v4[5])
  {
    self->_predictionReasons = v4[1];
    *(unsigned char *)&self->_has |= 1u;
  }
  MEMORY[0x1F4181870]();
}

- (NSString)executableIdentifier
{
  return self->_executableIdentifier;
}

- (void)setExecutableIdentifier:(id)a3
{
}

- (NSString)executableType
{
  return self->_executableType;
}

- (void)setExecutableType:(id)a3
{
}

- (ATXPBProactiveSuggestionScoreSpecification)scoreSpecification
{
  return self->_scoreSpecification;
}

- (void)setScoreSpecification:(id)a3
{
}

- (unint64_t)predictionReasons
{
  return self->_predictionReasons;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scoreSpecification, 0);
  objc_storeStrong((id *)&self->_executableType, 0);
  objc_storeStrong((id *)&self->_executableIdentifier, 0);
}

@end
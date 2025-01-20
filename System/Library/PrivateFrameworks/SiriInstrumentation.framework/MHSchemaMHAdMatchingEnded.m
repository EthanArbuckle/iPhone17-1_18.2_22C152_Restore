@interface MHSchemaMHAdMatchingEnded
- (BOOL)hasAdBlockerDismissalType;
- (BOOL)hasAdBlockerSource;
- (BOOL)hasAdName;
- (BOOL)hasShazamScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (MHSchemaMHAdMatchingEnded)initWithDictionary:(id)a3;
- (MHSchemaMHAdMatchingEnded)initWithJSON:(id)a3;
- (NSData)jsonData;
- (NSString)adName;
- (float)shazamScore;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)adBlockerDismissalType;
- (int)adBlockerSource;
- (unint64_t)hash;
- (void)deleteAdBlockerDismissalType;
- (void)deleteAdBlockerSource;
- (void)deleteAdName;
- (void)deleteShazamScore;
- (void)setAdBlockerDismissalType:(int)a3;
- (void)setAdBlockerSource:(int)a3;
- (void)setAdName:(id)a3;
- (void)setHasAdBlockerDismissalType:(BOOL)a3;
- (void)setHasAdBlockerSource:(BOOL)a3;
- (void)setHasAdName:(BOOL)a3;
- (void)setHasShazamScore:(BOOL)a3;
- (void)setShazamScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation MHSchemaMHAdMatchingEnded

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasAdName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (int)adBlockerSource
{
  return self->_adBlockerSource;
}

- (float)shazamScore
{
  return self->_shazamScore;
}

- (void)setAdName:(id)a3
{
}

- (NSString)adName
{
  return self->_adName;
}

- (int)adBlockerDismissalType
{
  return self->_adBlockerDismissalType;
}

- (MHSchemaMHAdMatchingEnded)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)MHSchemaMHAdMatchingEnded;
  v5 = [(MHSchemaMHAdMatchingEnded *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"adBlockerDismissalType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAdMatchingEnded setAdBlockerDismissalType:](v5, "setAdBlockerDismissalType:", [v6 intValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"adName"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(MHSchemaMHAdMatchingEnded *)v5 setAdName:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"shazamScore"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 floatValue];
      -[MHSchemaMHAdMatchingEnded setShazamScore:](v5, "setShazamScore:");
    }
    v10 = [v4 objectForKeyedSubscript:@"adBlockerSource"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[MHSchemaMHAdMatchingEnded setAdBlockerSource:](v5, "setAdBlockerSource:", [v10 intValue]);
    }
    v11 = v5;
  }
  return v5;
}

- (MHSchemaMHAdMatchingEnded)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(MHSchemaMHAdMatchingEnded *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(MHSchemaMHAdMatchingEnded *)self dictionaryRepresentation];
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
  char has = (char)self->_has;
  if (has)
  {
    unsigned int v5 = [(MHSchemaMHAdMatchingEnded *)self adBlockerDismissalType] - 1;
    if (v5 > 3) {
      v6 = @"ADBLOCKERDISMISSALTYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EB1120[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"adBlockerDismissalType"];
    char has = (char)self->_has;
  }
  if ((has & 4) != 0)
  {
    int v7 = [(MHSchemaMHAdMatchingEnded *)self adBlockerSource];
    v8 = @"MHADBLOCKERSOURCE_UNKNOWN";
    if (v7 == 1) {
      v8 = @"MHADBLOCKERSOURCE_BUILTIN";
    }
    if (v7 == 2) {
      v9 = @"MHADBLOCKERSOURCE_ENDPOINT";
    }
    else {
      v9 = v8;
    }
    [v3 setObject:v9 forKeyedSubscript:@"adBlockerSource"];
  }
  if (self->_adName)
  {
    v10 = [(MHSchemaMHAdMatchingEnded *)self adName];
    v11 = (void *)[v10 copy];
    [v3 setObject:v11 forKeyedSubscript:@"adName"];
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    v12 = NSNumber;
    [(MHSchemaMHAdMatchingEnded *)self shazamScore];
    objc_super v13 = objc_msgSend(v12, "numberWithFloat:");
    [v3 setObject:v13 forKeyedSubscript:@"shazamScore"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_adBlockerDismissalType;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_adName hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    float shazamScore = self->_shazamScore;
    double v8 = shazamScore;
    if (shazamScore < 0.0) {
      double v8 = -shazamScore;
    }
    long double v9 = floor(v8 + 0.5);
    double v10 = (v8 - v9) * 1.84467441e19;
    unint64_t v6 = 2654435761u * (unint64_t)fmod(v9, 1.84467441e19);
    if (v10 >= 0.0)
    {
      if (v10 > 0.0) {
        v6 += (unint64_t)v10;
      }
    }
    else
    {
      v6 -= (unint64_t)fabs(v10);
    }
  }
  else
  {
    unint64_t v6 = 0;
  }
  if ((has & 4) != 0) {
    uint64_t v11 = 2654435761 * self->_adBlockerSource;
  }
  else {
    uint64_t v11 = 0;
  }
  return v4 ^ v3 ^ v6 ^ v11;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[32] & 1)) {
    goto LABEL_19;
  }
  if (*(unsigned char *)&self->_has)
  {
    int adBlockerDismissalType = self->_adBlockerDismissalType;
    if (adBlockerDismissalType != [v4 adBlockerDismissalType]) {
      goto LABEL_19;
    }
  }
  unint64_t v6 = [(MHSchemaMHAdMatchingEnded *)self adName];
  int v7 = [v4 adName];
  double v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_19;
  }
  uint64_t v9 = [(MHSchemaMHAdMatchingEnded *)self adName];
  if (v9)
  {
    double v10 = (void *)v9;
    uint64_t v11 = [(MHSchemaMHAdMatchingEnded *)self adName];
    v12 = [v4 adName];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_19;
    }
  }
  else
  {
  }
  $73EB44B0B05169248299CBFE4D2A7E72 has = self->_has;
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v16 = v4[32];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_19:
    BOOL v21 = 0;
    goto LABEL_20;
  }
  if (v15)
  {
    float shazamScore = self->_shazamScore;
    [v4 shazamScore];
    if (shazamScore == v18)
    {
      $73EB44B0B05169248299CBFE4D2A7E72 has = self->_has;
      unsigned int v16 = v4[32];
      goto LABEL_15;
    }
    goto LABEL_19;
  }
LABEL_15:
  int v19 = (*(unsigned int *)&has >> 2) & 1;
  if (v19 != ((v16 >> 2) & 1)) {
    goto LABEL_19;
  }
  if (v19)
  {
    int adBlockerSource = self->_adBlockerSource;
    if (adBlockerSource != [v4 adBlockerSource]) {
      goto LABEL_19;
    }
  }
  BOOL v21 = 1;
LABEL_20:

  return v21;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt32Field();
  }
  NSUInteger v4 = [(MHSchemaMHAdMatchingEnded *)self adName];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteFloatField();
    char has = (char)self->_has;
  }
  if ((has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
}

- (BOOL)readFrom:(id)a3
{
  return MHSchemaMHAdMatchingEndedReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteAdBlockerSource
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasAdBlockerSource:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasAdBlockerSource
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setAdBlockerSource:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int adBlockerSource = a3;
}

- (void)deleteShazamScore
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasShazamScore:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasShazamScore
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setShazamScore:(float)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_float shazamScore = a3;
}

- (void)deleteAdName
{
}

- (BOOL)hasAdName
{
  return self->_adName != 0;
}

- (void)deleteAdBlockerDismissalType
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasAdBlockerDismissalType:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasAdBlockerDismissalType
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setAdBlockerDismissalType:(int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int adBlockerDismissalType = a3;
}

@end
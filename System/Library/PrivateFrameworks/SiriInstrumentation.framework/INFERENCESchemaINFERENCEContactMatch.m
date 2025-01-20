@interface INFERENCESchemaINFERENCEContactMatch
- (BOOL)hasBackgroundSignalSet;
- (BOOL)hasContactSignalSet;
- (BOOL)hasContactValue;
- (BOOL)hasFeatureSet;
- (BOOL)hasIsShownToUser;
- (BOOL)hasScore;
- (BOOL)isEqual:(id)a3;
- (BOOL)isShownToUser;
- (BOOL)readFrom:(id)a3;
- (INFERENCESchemaINFERENCEBackgroundContactSignalSet)backgroundSignalSet;
- (INFERENCESchemaINFERENCEContact)contactValue;
- (INFERENCESchemaINFERENCEContactFeatureSet)featureSet;
- (INFERENCESchemaINFERENCEContactMatch)initWithDictionary:(id)a3;
- (INFERENCESchemaINFERENCEContactMatch)initWithJSON:(id)a3;
- (INFERENCESchemaINFERENCEContactSignalSet)contactSignalSet;
- (NSData)jsonData;
- (float)score;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (void)deleteBackgroundSignalSet;
- (void)deleteContactSignalSet;
- (void)deleteContactValue;
- (void)deleteFeatureSet;
- (void)deleteIsShownToUser;
- (void)deleteScore;
- (void)setBackgroundSignalSet:(id)a3;
- (void)setContactSignalSet:(id)a3;
- (void)setContactValue:(id)a3;
- (void)setFeatureSet:(id)a3;
- (void)setHasBackgroundSignalSet:(BOOL)a3;
- (void)setHasContactSignalSet:(BOOL)a3;
- (void)setHasContactValue:(BOOL)a3;
- (void)setHasFeatureSet:(BOOL)a3;
- (void)setHasIsShownToUser:(BOOL)a3;
- (void)setHasScore:(BOOL)a3;
- (void)setIsShownToUser:(BOOL)a3;
- (void)setScore:(float)a3;
- (void)writeTo:(id)a3;
@end

@implementation INFERENCESchemaINFERENCEContactMatch

- (id)applySensitiveConditionsPolicy:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)INFERENCESchemaINFERENCEContactMatch;
  v5 = [(SISchemaInstrumentationMessage *)&v19 applySensitiveConditionsPolicy:v4];
  v6 = [(INFERENCESchemaINFERENCEContactMatch *)self contactValue];
  v7 = [v6 applySensitiveConditionsPolicy:v4];
  int v8 = [v7 suppressMessage];

  if (v8) {
    [(INFERENCESchemaINFERENCEContactMatch *)self deleteContactValue];
  }
  v9 = [(INFERENCESchemaINFERENCEContactMatch *)self contactSignalSet];
  v10 = [v9 applySensitiveConditionsPolicy:v4];
  int v11 = [v10 suppressMessage];

  if (v11) {
    [(INFERENCESchemaINFERENCEContactMatch *)self deleteContactSignalSet];
  }
  v12 = [(INFERENCESchemaINFERENCEContactMatch *)self backgroundSignalSet];
  v13 = [v12 applySensitiveConditionsPolicy:v4];
  int v14 = [v13 suppressMessage];

  if (v14) {
    [(INFERENCESchemaINFERENCEContactMatch *)self deleteBackgroundSignalSet];
  }
  v15 = [(INFERENCESchemaINFERENCEContactMatch *)self featureSet];
  v16 = [v15 applySensitiveConditionsPolicy:v4];
  int v17 = [v16 suppressMessage];

  if (v17) {
    [(INFERENCESchemaINFERENCEContactMatch *)self deleteFeatureSet];
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
  objc_storeStrong((id *)&self->_featureSet, 0);
  objc_storeStrong((id *)&self->_backgroundSignalSet, 0);
  objc_storeStrong((id *)&self->_contactSignalSet, 0);
  objc_storeStrong((id *)&self->_contactValue, 0);
}

- (void)setHasFeatureSet:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setHasBackgroundSignalSet:(BOOL)a3
{
  *(unsigned char *)&self->_has = a3;
}

- (void)setHasContactSignalSet:(BOOL)a3
{
  *(&self->_isShownToUser + 3) = a3;
}

- (void)setHasContactValue:(BOOL)a3
{
  *(&self->_isShownToUser + 2) = a3;
}

- (BOOL)isShownToUser
{
  return self->_isShownToUser;
}

- (float)score
{
  return self->_score;
}

- (void)setFeatureSet:(id)a3
{
}

- (INFERENCESchemaINFERENCEContactFeatureSet)featureSet
{
  return self->_featureSet;
}

- (void)setBackgroundSignalSet:(id)a3
{
}

- (INFERENCESchemaINFERENCEBackgroundContactSignalSet)backgroundSignalSet
{
  return self->_backgroundSignalSet;
}

- (void)setContactSignalSet:(id)a3
{
}

- (INFERENCESchemaINFERENCEContactSignalSet)contactSignalSet
{
  return self->_contactSignalSet;
}

- (void)setContactValue:(id)a3
{
}

- (INFERENCESchemaINFERENCEContact)contactValue
{
  return self->_contactValue;
}

- (INFERENCESchemaINFERENCEContactMatch)initWithDictionary:(id)a3
{
  id v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)INFERENCESchemaINFERENCEContactMatch;
  v5 = [(INFERENCESchemaINFERENCEContactMatch *)&v18 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"contactValue"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [[INFERENCESchemaINFERENCEContact alloc] initWithDictionary:v6];
      [(INFERENCESchemaINFERENCEContactMatch *)v5 setContactValue:v7];
    }
    int v8 = [v4 objectForKeyedSubscript:@"contactSignalSet"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = [[INFERENCESchemaINFERENCEContactSignalSet alloc] initWithDictionary:v8];
      [(INFERENCESchemaINFERENCEContactMatch *)v5 setContactSignalSet:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"backgroundSignalSet"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v11 = [[INFERENCESchemaINFERENCEBackgroundContactSignalSet alloc] initWithDictionary:v10];
      [(INFERENCESchemaINFERENCEContactMatch *)v5 setBackgroundSignalSet:v11];
    }
    v12 = [v4 objectForKeyedSubscript:@"featureSet"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v13 = [[INFERENCESchemaINFERENCEContactFeatureSet alloc] initWithDictionary:v12];
      [(INFERENCESchemaINFERENCEContactMatch *)v5 setFeatureSet:v13];
    }
    int v14 = [v4 objectForKeyedSubscript:@"score"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v14 floatValue];
      -[INFERENCESchemaINFERENCEContactMatch setScore:](v5, "setScore:");
    }
    v15 = [v4 objectForKeyedSubscript:@"isShownToUser"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[INFERENCESchemaINFERENCEContactMatch setIsShownToUser:](v5, "setIsShownToUser:", [v15 BOOLValue]);
    }
    v16 = v5;
  }
  return v5;
}

- (INFERENCESchemaINFERENCEContactMatch)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(INFERENCESchemaINFERENCEContactMatch *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(INFERENCESchemaINFERENCEContactMatch *)self dictionaryRepresentation];
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
  if (self->_backgroundSignalSet)
  {
    id v4 = [(INFERENCESchemaINFERENCEContactMatch *)self backgroundSignalSet];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"backgroundSignalSet"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"backgroundSignalSet"];
    }
  }
  if (self->_contactSignalSet)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCEContactMatch *)self contactSignalSet];
    int v8 = [v7 dictionaryRepresentation];
    if (v8)
    {
      [v3 setObject:v8 forKeyedSubscript:@"contactSignalSet"];
    }
    else
    {
      v9 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v9 forKeyedSubscript:@"contactSignalSet"];
    }
  }
  if (self->_contactValue)
  {
    v10 = [(INFERENCESchemaINFERENCEContactMatch *)self contactValue];
    int v11 = [v10 dictionaryRepresentation];
    if (v11)
    {
      [v3 setObject:v11 forKeyedSubscript:@"contactValue"];
    }
    else
    {
      v12 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v12 forKeyedSubscript:@"contactValue"];
    }
  }
  if (self->_featureSet)
  {
    v13 = [(INFERENCESchemaINFERENCEContactMatch *)self featureSet];
    int v14 = [v13 dictionaryRepresentation];
    if (v14)
    {
      [v3 setObject:v14 forKeyedSubscript:@"featureSet"];
    }
    else
    {
      v15 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v15 forKeyedSubscript:@"featureSet"];
    }
  }
  char v16 = *(&self->_isShownToUser + 1);
  if ((v16 & 2) != 0)
  {
    int v17 = objc_msgSend(NSNumber, "numberWithBool:", -[INFERENCESchemaINFERENCEContactMatch isShownToUser](self, "isShownToUser"));
    [v3 setObject:v17 forKeyedSubscript:@"isShownToUser"];

    char v16 = *(&self->_isShownToUser + 1);
  }
  if (v16)
  {
    objc_super v18 = NSNumber;
    [(INFERENCESchemaINFERENCEContactMatch *)self score];
    objc_super v19 = objc_msgSend(v18, "numberWithFloat:");
    [v3 setObject:v19 forKeyedSubscript:@"score"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  unint64_t v3 = [(INFERENCESchemaINFERENCEContact *)self->_contactValue hash];
  unint64_t v4 = [(INFERENCESchemaINFERENCEContactSignalSet *)self->_contactSignalSet hash];
  unint64_t v5 = [(INFERENCESchemaINFERENCEBackgroundContactSignalSet *)self->_backgroundSignalSet hash];
  unint64_t v6 = [(INFERENCESchemaINFERENCEContactFeatureSet *)self->_featureSet hash];
  char v7 = *(&self->_isShownToUser + 1);
  if (v7)
  {
    float score = self->_score;
    double v10 = score;
    if (score < 0.0) {
      double v10 = -score;
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
  if ((v7 & 2) != 0) {
    uint64_t v13 = 2654435761 * self->_isShownToUser;
  }
  else {
    uint64_t v13 = 0;
  }
  return v4 ^ v3 ^ v5 ^ v6 ^ v8 ^ v13;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactMatch *)self contactValue];
  unint64_t v6 = [v4 contactValue];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v7 = [(INFERENCESchemaINFERENCEContactMatch *)self contactValue];
  if (v7)
  {
    unint64_t v8 = (void *)v7;
    v9 = [(INFERENCESchemaINFERENCEContactMatch *)self contactValue];
    double v10 = [v4 contactValue];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactMatch *)self contactSignalSet];
  unint64_t v6 = [v4 contactSignalSet];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v12 = [(INFERENCESchemaINFERENCEContactMatch *)self contactSignalSet];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    int v14 = [(INFERENCESchemaINFERENCEContactMatch *)self contactSignalSet];
    v15 = [v4 contactSignalSet];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactMatch *)self backgroundSignalSet];
  unint64_t v6 = [v4 backgroundSignalSet];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_21;
  }
  uint64_t v17 = [(INFERENCESchemaINFERENCEContactMatch *)self backgroundSignalSet];
  if (v17)
  {
    objc_super v18 = (void *)v17;
    objc_super v19 = [(INFERENCESchemaINFERENCEContactMatch *)self backgroundSignalSet];
    v20 = [v4 backgroundSignalSet];
    int v21 = [v19 isEqual:v20];

    if (!v21) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unint64_t v5 = [(INFERENCESchemaINFERENCEContactMatch *)self featureSet];
  unint64_t v6 = [v4 featureSet];
  if ((v5 == 0) == (v6 != 0))
  {
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v22 = [(INFERENCESchemaINFERENCEContactMatch *)self featureSet];
  if (v22)
  {
    v23 = (void *)v22;
    v24 = [(INFERENCESchemaINFERENCEContactMatch *)self featureSet];
    v25 = [v4 featureSet];
    int v26 = [v24 isEqual:v25];

    if (!v26) {
      goto LABEL_22;
    }
  }
  else
  {
  }
  unsigned int v29 = *((unsigned __int8 *)&self->_isShownToUser + 1);
  unsigned int v30 = v4[45];
  if ((v29 & 1) == (v30 & 1))
  {
    if (v29)
    {
      float score = self->_score;
      [v4 score];
      if (score != v32) {
        goto LABEL_22;
      }
      unsigned int v29 = *((unsigned __int8 *)&self->_isShownToUser + 1);
      unsigned int v30 = v4[45];
    }
    int v33 = (v29 >> 1) & 1;
    if (v33 == ((v30 >> 1) & 1))
    {
      if (!v33
        || (int isShownToUser = self->_isShownToUser, isShownToUser == [v4 isShownToUser]))
      {
        BOOL v27 = 1;
        goto LABEL_23;
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
  id v14 = a3;
  unint64_t v4 = [(INFERENCESchemaINFERENCEContactMatch *)self contactValue];

  if (v4)
  {
    unint64_t v5 = [(INFERENCESchemaINFERENCEContactMatch *)self contactValue];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v6 = [(INFERENCESchemaINFERENCEContactMatch *)self contactSignalSet];

  if (v6)
  {
    uint64_t v7 = [(INFERENCESchemaINFERENCEContactMatch *)self contactSignalSet];
    PBDataWriterWriteSubmessage();
  }
  unint64_t v8 = [(INFERENCESchemaINFERENCEContactMatch *)self backgroundSignalSet];

  if (v8)
  {
    v9 = [(INFERENCESchemaINFERENCEContactMatch *)self backgroundSignalSet];
    PBDataWriterWriteSubmessage();
  }
  double v10 = [(INFERENCESchemaINFERENCEContactMatch *)self featureSet];

  if (v10)
  {
    int v11 = [(INFERENCESchemaINFERENCEContactMatch *)self featureSet];
    PBDataWriterWriteSubmessage();
  }
  char v12 = *(&self->_isShownToUser + 1);
  if (v12)
  {
    PBDataWriterWriteFloatField();
    char v12 = *(&self->_isShownToUser + 1);
  }
  uint64_t v13 = v14;
  if ((v12 & 2) != 0)
  {
    PBDataWriterWriteBOOLField();
    uint64_t v13 = v14;
  }
}

- (BOOL)readFrom:(id)a3
{
  return INFERENCESchemaINFERENCEContactMatchReadFrom(self, (uint64_t)a3, v3);
}

- (void)deleteIsShownToUser
{
  *(&self->_isShownToUser + 1) &= ~2u;
}

- (void)setHasIsShownToUser:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(&self->_isShownToUser + 1) = *(&self->_isShownToUser + 1) & 0xFD | v3;
}

- (BOOL)hasIsShownToUser
{
  return (*((unsigned __int8 *)&self->_isShownToUser + 1) >> 1) & 1;
}

- (void)setIsShownToUser:(BOOL)a3
{
  *(&self->_isShownToUser + 1) |= 2u;
  self->_int isShownToUser = a3;
}

- (void)deleteScore
{
  *(&self->_isShownToUser + 1) &= ~1u;
}

- (void)setHasScore:(BOOL)a3
{
  *(&self->_isShownToUser + 1) = *(&self->_isShownToUser + 1) & 0xFE | a3;
}

- (BOOL)hasScore
{
  return *(&self->_isShownToUser + 1);
}

- (void)setScore:(float)a3
{
  *(&self->_isShownToUser + 1) |= 1u;
  self->_float score = a3;
}

- (void)deleteFeatureSet
{
}

- (BOOL)hasFeatureSet
{
  return self->_featureSet != 0;
}

- (void)deleteBackgroundSignalSet
{
}

- (BOOL)hasBackgroundSignalSet
{
  return self->_backgroundSignalSet != 0;
}

- (void)deleteContactSignalSet
{
}

- (BOOL)hasContactSignalSet
{
  return self->_contactSignalSet != 0;
}

- (void)deleteContactValue
{
}

- (BOOL)hasContactValue
{
  return self->_contactValue != 0;
}

@end
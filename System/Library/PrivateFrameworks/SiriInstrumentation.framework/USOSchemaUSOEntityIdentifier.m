@interface USOSchemaUSOEntityIdentifier
- (BOOL)hasBackingAppBundleType;
- (BOOL)hasGroupIndex;
- (BOOL)hasIdentifierNamespace;
- (BOOL)hasInterpretationGroup;
- (BOOL)hasNodeIndex;
- (BOOL)hasProbability;
- (BOOL)hasSourceNluComponent;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)identifierNamespace;
- (USOSchemaUSOEntityIdentifier)initWithDictionary:(id)a3;
- (USOSchemaUSOEntityIdentifier)initWithJSON:(id)a3;
- (double)probability;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int)backingAppBundleType;
- (int)sourceNluComponent;
- (unint64_t)hash;
- (unsigned)groupIndex;
- (unsigned)interpretationGroup;
- (unsigned)nodeIndex;
- (void)deleteBackingAppBundleType;
- (void)deleteGroupIndex;
- (void)deleteIdentifierNamespace;
- (void)deleteInterpretationGroup;
- (void)deleteNodeIndex;
- (void)deleteProbability;
- (void)deleteSourceNluComponent;
- (void)setBackingAppBundleType:(int)a3;
- (void)setGroupIndex:(unsigned int)a3;
- (void)setHasBackingAppBundleType:(BOOL)a3;
- (void)setHasGroupIndex:(BOOL)a3;
- (void)setHasIdentifierNamespace:(BOOL)a3;
- (void)setHasInterpretationGroup:(BOOL)a3;
- (void)setHasNodeIndex:(BOOL)a3;
- (void)setHasProbability:(BOOL)a3;
- (void)setHasSourceNluComponent:(BOOL)a3;
- (void)setIdentifierNamespace:(id)a3;
- (void)setInterpretationGroup:(unsigned int)a3;
- (void)setNodeIndex:(unsigned int)a3;
- (void)setProbability:(double)a3;
- (void)setSourceNluComponent:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation USOSchemaUSOEntityIdentifier

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
}

- (void)setHasIdentifierNamespace:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (unsigned)interpretationGroup
{
  return self->_interpretationGroup;
}

- (unsigned)groupIndex
{
  return self->_groupIndex;
}

- (int)backingAppBundleType
{
  return self->_backingAppBundleType;
}

- (int)sourceNluComponent
{
  return self->_sourceNluComponent;
}

- (double)probability
{
  return self->_probability;
}

- (void)setIdentifierNamespace:(id)a3
{
}

- (NSString)identifierNamespace
{
  return self->_identifierNamespace;
}

- (unsigned)nodeIndex
{
  return self->_nodeIndex;
}

- (USOSchemaUSOEntityIdentifier)initWithDictionary:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)USOSchemaUSOEntityIdentifier;
  v5 = [(USOSchemaUSOEntityIdentifier *)&v16 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"nodeIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntityIdentifier setNodeIndex:](v5, "setNodeIndex:", [v6 unsignedIntValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"identifierNamespace"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = (void *)[v7 copy];
      [(USOSchemaUSOEntityIdentifier *)v5 setIdentifierNamespace:v8];
    }
    v9 = [v4 objectForKeyedSubscript:@"probability"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v9 doubleValue];
      -[USOSchemaUSOEntityIdentifier setProbability:](v5, "setProbability:");
    }
    v10 = [v4 objectForKeyedSubscript:@"sourceNluComponent"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntityIdentifier setSourceNluComponent:](v5, "setSourceNluComponent:", [v10 intValue]);
    }
    v11 = [v4 objectForKeyedSubscript:@"backingAppBundleType"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntityIdentifier setBackingAppBundleType:](v5, "setBackingAppBundleType:", [v11 intValue]);
    }
    v12 = [v4 objectForKeyedSubscript:@"groupIndex"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntityIdentifier setGroupIndex:](v5, "setGroupIndex:", [v12 unsignedIntValue]);
    }
    v13 = [v4 objectForKeyedSubscript:@"interpretationGroup"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[USOSchemaUSOEntityIdentifier setInterpretationGroup:](v5, "setInterpretationGroup:", [v13 unsignedIntValue]);
    }
    v14 = v5;
  }
  return v5;
}

- (USOSchemaUSOEntityIdentifier)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USOSchemaUSOEntityIdentifier *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USOSchemaUSOEntityIdentifier *)self dictionaryRepresentation];
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
  if ((has & 8) != 0)
  {
    unsigned int v5 = [(USOSchemaUSOEntityIdentifier *)self backingAppBundleType] - 1;
    if (v5 > 0x18) {
      v6 = @"USOBACKINGAPPBUNDLETYPE_UNKNOWN";
    }
    else {
      v6 = off_1E5EB9BD8[v5];
    }
    [v3 setObject:v6 forKeyedSubscript:@"backingAppBundleType"];
    char has = (char)self->_has;
  }
  if ((has & 0x10) != 0)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEntityIdentifier groupIndex](self, "groupIndex"));
    [v3 setObject:v7 forKeyedSubscript:@"groupIndex"];
  }
  if (self->_identifierNamespace)
  {
    v8 = [(USOSchemaUSOEntityIdentifier *)self identifierNamespace];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"identifierNamespace"];
  }
  char v10 = (char)self->_has;
  if ((v10 & 0x20) != 0)
  {
    v11 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEntityIdentifier interpretationGroup](self, "interpretationGroup"));
    [v3 setObject:v11 forKeyedSubscript:@"interpretationGroup"];

    char v10 = (char)self->_has;
    if ((v10 & 1) == 0)
    {
LABEL_12:
      if ((v10 & 2) == 0) {
        goto LABEL_13;
      }
LABEL_17:
      v13 = NSNumber;
      [(USOSchemaUSOEntityIdentifier *)self probability];
      v14 = objc_msgSend(v13, "numberWithDouble:");
      [v3 setObject:v14 forKeyedSubscript:@"probability"];

      if ((*(unsigned char *)&self->_has & 4) == 0) {
        goto LABEL_22;
      }
LABEL_18:
      unsigned int v15 = [(USOSchemaUSOEntityIdentifier *)self sourceNluComponent] - 1;
      if (v15 > 6) {
        objc_super v16 = @"USOENTITYIDENTIFIERNLUCOMPONENT_UNKNOWN";
      }
      else {
        objc_super v16 = off_1E5EB9CA0[v15];
      }
      [v3 setObject:v16 forKeyedSubscript:@"sourceNluComponent"];
      goto LABEL_22;
    }
  }
  else if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    goto LABEL_12;
  }
  v12 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[USOSchemaUSOEntityIdentifier nodeIndex](self, "nodeIndex"));
  [v3 setObject:v12 forKeyedSubscript:@"nodeIndex"];

  char v10 = (char)self->_has;
  if ((v10 & 2) != 0) {
    goto LABEL_17;
  }
LABEL_13:
  if ((v10 & 4) != 0) {
    goto LABEL_18;
  }
LABEL_22:
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v3 = 2654435761 * self->_nodeIndex;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_identifierNamespace hash];
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    double probability = self->_probability;
    double v8 = -probability;
    if (probability >= 0.0) {
      double v8 = self->_probability;
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
  if ((has & 4) != 0)
  {
    uint64_t v11 = 2654435761 * self->_sourceNluComponent;
    if ((has & 8) != 0)
    {
LABEL_14:
      uint64_t v12 = 2654435761 * self->_backingAppBundleType;
      if ((has & 0x10) != 0) {
        goto LABEL_15;
      }
LABEL_19:
      uint64_t v13 = 0;
      if ((has & 0x20) != 0) {
        goto LABEL_16;
      }
LABEL_20:
      uint64_t v14 = 0;
      return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14;
    }
  }
  else
  {
    uint64_t v11 = 0;
    if ((has & 8) != 0) {
      goto LABEL_14;
    }
  }
  uint64_t v12 = 0;
  if ((has & 0x10) == 0) {
    goto LABEL_19;
  }
LABEL_15:
  uint64_t v13 = 2654435761 * self->_groupIndex;
  if ((has & 0x20) == 0) {
    goto LABEL_20;
  }
LABEL_16:
  uint64_t v14 = 2654435761 * self->_interpretationGroup;
  return v4 ^ v3 ^ v6 ^ v11 ^ v12 ^ v13 ^ v14;
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_31;
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[48] & 1)) {
    goto LABEL_31;
  }
  if (*(unsigned char *)&self->_has)
  {
    unsigned int nodeIndex = self->_nodeIndex;
    if (nodeIndex != [v4 nodeIndex]) {
      goto LABEL_31;
    }
  }
  unint64_t v6 = [(USOSchemaUSOEntityIdentifier *)self identifierNamespace];
  uint64_t v7 = [v4 identifierNamespace];
  double v8 = v7;
  if ((v6 == 0) == (v7 != 0))
  {

    goto LABEL_31;
  }
  uint64_t v9 = [(USOSchemaUSOEntityIdentifier *)self identifierNamespace];
  if (v9)
  {
    double v10 = (void *)v9;
    uint64_t v11 = [(USOSchemaUSOEntityIdentifier *)self identifierNamespace];
    uint64_t v12 = [v4 identifierNamespace];
    int v13 = [v11 isEqual:v12];

    if (!v13) {
      goto LABEL_31;
    }
  }
  else
  {
  }
  $E49C7143624BDCD2738345100E1F9314 has = self->_has;
  int v15 = (*(unsigned int *)&has >> 1) & 1;
  unsigned int v16 = v4[48];
  if (v15 != ((v16 >> 1) & 1))
  {
LABEL_31:
    BOOL v27 = 0;
    goto LABEL_32;
  }
  if (v15)
  {
    double probability = self->_probability;
    [v4 probability];
    if (probability != v18) {
      goto LABEL_31;
    }
    $E49C7143624BDCD2738345100E1F9314 has = self->_has;
    unsigned int v16 = v4[48];
  }
  int v19 = (*(unsigned int *)&has >> 2) & 1;
  if (v19 != ((v16 >> 2) & 1)) {
    goto LABEL_31;
  }
  if (v19)
  {
    int sourceNluComponent = self->_sourceNluComponent;
    if (sourceNluComponent != [v4 sourceNluComponent]) {
      goto LABEL_31;
    }
    $E49C7143624BDCD2738345100E1F9314 has = self->_has;
    unsigned int v16 = v4[48];
  }
  int v21 = (*(unsigned int *)&has >> 3) & 1;
  if (v21 != ((v16 >> 3) & 1)) {
    goto LABEL_31;
  }
  if (v21)
  {
    int backingAppBundleType = self->_backingAppBundleType;
    if (backingAppBundleType != [v4 backingAppBundleType]) {
      goto LABEL_31;
    }
    $E49C7143624BDCD2738345100E1F9314 has = self->_has;
    unsigned int v16 = v4[48];
  }
  int v23 = (*(unsigned int *)&has >> 4) & 1;
  if (v23 != ((v16 >> 4) & 1)) {
    goto LABEL_31;
  }
  if (v23)
  {
    unsigned int groupIndex = self->_groupIndex;
    if (groupIndex == [v4 groupIndex])
    {
      $E49C7143624BDCD2738345100E1F9314 has = self->_has;
      unsigned int v16 = v4[48];
      goto LABEL_27;
    }
    goto LABEL_31;
  }
LABEL_27:
  int v25 = (*(unsigned int *)&has >> 5) & 1;
  if (v25 != ((v16 >> 5) & 1)) {
    goto LABEL_31;
  }
  if (v25)
  {
    unsigned int interpretationGroup = self->_interpretationGroup;
    if (interpretationGroup != [v4 interpretationGroup]) {
      goto LABEL_31;
    }
  }
  BOOL v27 = 1;
LABEL_32:

  return v27;
}

- (void)writeTo:(id)a3
{
  id v6 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteUint32Field();
  }
  NSUInteger v4 = [(USOSchemaUSOEntityIdentifier *)self identifierNamespace];

  if (v4) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteDoubleField();
    char has = (char)self->_has;
    if ((has & 4) == 0)
    {
LABEL_7:
      if ((has & 8) == 0) {
        goto LABEL_8;
      }
      goto LABEL_16;
    }
  }
  else if ((*(unsigned char *)&self->_has & 4) == 0)
  {
    goto LABEL_7;
  }
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 8) == 0)
  {
LABEL_8:
    if ((has & 0x10) == 0) {
      goto LABEL_9;
    }
    goto LABEL_17;
  }
LABEL_16:
  PBDataWriterWriteInt32Field();
  char has = (char)self->_has;
  if ((has & 0x10) == 0)
  {
LABEL_9:
    if ((has & 0x20) == 0) {
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_17:
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 0x20) != 0) {
LABEL_10:
  }
    PBDataWriterWriteUint32Field();
LABEL_11:
}

- (BOOL)readFrom:(id)a3
{
  return USOSchemaUSOEntityIdentifierReadFrom(self, (uint64_t)a3);
}

- (void)deleteInterpretationGroup
{
  *(unsigned char *)&self->_has &= ~0x20u;
}

- (void)setHasInterpretationGroup:(BOOL)a3
{
  if (a3) {
    char v3 = 32;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xDF | v3;
}

- (BOOL)hasInterpretationGroup
{
  return (*(unsigned char *)&self->_has >> 5) & 1;
}

- (void)setInterpretationGroup:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x20u;
  self->_unsigned int interpretationGroup = a3;
}

- (void)deleteGroupIndex
{
  *(unsigned char *)&self->_has &= ~0x10u;
}

- (void)setHasGroupIndex:(BOOL)a3
{
  if (a3) {
    char v3 = 16;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xEF | v3;
}

- (BOOL)hasGroupIndex
{
  return (*(unsigned char *)&self->_has >> 4) & 1;
}

- (void)setGroupIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 0x10u;
  self->_unsigned int groupIndex = a3;
}

- (void)deleteBackingAppBundleType
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (void)setHasBackingAppBundleType:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (BOOL)hasBackingAppBundleType
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setBackingAppBundleType:(int)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_int backingAppBundleType = a3;
}

- (void)deleteSourceNluComponent
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasSourceNluComponent:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasSourceNluComponent
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setSourceNluComponent:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int sourceNluComponent = a3;
}

- (void)deleteProbability
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasProbability:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasProbability
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setProbability:(double)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_double probability = a3;
}

- (void)deleteIdentifierNamespace
{
}

- (BOOL)hasIdentifierNamespace
{
  return self->_identifierNamespace != 0;
}

- (void)deleteNodeIndex
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasNodeIndex:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasNodeIndex
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setNodeIndex:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_unsigned int nodeIndex = a3;
}

@end
@interface POWSchemaProvisionalPOWProcessUsage
- (BOOL)hasCpuCycles;
- (BOOL)hasCpuInstructions;
- (BOOL)hasGpuCycles;
- (BOOL)hasMemoryFootprint;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (POWSchemaProvisionalPOWProcessUsage)initWithDictionary:(id)a3;
- (POWSchemaProvisionalPOWProcessUsage)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (unint64_t)cpuCycles;
- (unint64_t)cpuInstructions;
- (unint64_t)gpuCycles;
- (unint64_t)hash;
- (unint64_t)memoryFootprint;
- (void)deleteCpuCycles;
- (void)deleteCpuInstructions;
- (void)deleteGpuCycles;
- (void)deleteMemoryFootprint;
- (void)setCpuCycles:(unint64_t)a3;
- (void)setCpuInstructions:(unint64_t)a3;
- (void)setGpuCycles:(unint64_t)a3;
- (void)setHasCpuCycles:(BOOL)a3;
- (void)setHasCpuInstructions:(BOOL)a3;
- (void)setHasGpuCycles:(BOOL)a3;
- (void)setHasMemoryFootprint:(BOOL)a3;
- (void)setMemoryFootprint:(unint64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation POWSchemaProvisionalPOWProcessUsage

- (void)setCpuCycles:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_cpuCycles = a3;
}

- (BOOL)hasCpuCycles
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasCpuCycles:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)deleteCpuCycles
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setCpuInstructions:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_cpuInstructions = a3;
}

- (BOOL)hasCpuInstructions
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasCpuInstructions:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)deleteCpuInstructions
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setGpuCycles:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_gpuCycles = a3;
}

- (BOOL)hasGpuCycles
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasGpuCycles:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)deleteGpuCycles
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setMemoryFootprint:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 8u;
  self->_memoryFootprint = a3;
}

- (BOOL)hasMemoryFootprint
{
  return (*(unsigned char *)&self->_has >> 3) & 1;
}

- (void)setHasMemoryFootprint:(BOOL)a3
{
  if (a3) {
    char v3 = 8;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xF7 | v3;
}

- (void)deleteMemoryFootprint
{
  *(unsigned char *)&self->_has &= ~8u;
}

- (BOOL)readFrom:(id)a3
{
  return POWSchemaProvisionalPOWProcessUsageReadFrom(self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v5 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint64Field();
  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  PBDataWriterWriteUint64Field();
  if ((*(unsigned char *)&self->_has & 8) != 0) {
LABEL_5:
  }
    PBDataWriterWriteUint64Field();
LABEL_6:
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  char has = (char)self->_has;
  char v6 = v4[40];
  if ((v6 & 1) != (has & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&self->_has)
  {
    unint64_t cpuCycles = self->_cpuCycles;
    if (cpuCycles != [v4 cpuCycles]) {
      goto LABEL_18;
    }
    char has = (char)self->_has;
    char v6 = v4[40];
  }
  char v8 = v6 ^ has;
  if ((v8 & 2) != 0) {
    goto LABEL_18;
  }
  if ((has & 2) != 0)
  {
    unint64_t cpuInstructions = self->_cpuInstructions;
    if (cpuInstructions != [v4 cpuInstructions]) {
      goto LABEL_18;
    }
    char has = (char)self->_has;
    char v8 = v4[40] ^ has;
  }
  if ((v8 & 4) != 0) {
    goto LABEL_18;
  }
  if ((has & 4) != 0)
  {
    unint64_t gpuCycles = self->_gpuCycles;
    if (gpuCycles == [v4 gpuCycles])
    {
      char has = (char)self->_has;
      char v8 = v4[40] ^ has;
      goto LABEL_14;
    }
LABEL_18:
    BOOL v12 = 0;
    goto LABEL_19;
  }
LABEL_14:
  if ((v8 & 8) != 0) {
    goto LABEL_18;
  }
  if ((has & 8) != 0)
  {
    unint64_t memoryFootprint = self->_memoryFootprint;
    if (memoryFootprint != [v4 memoryFootprint]) {
      goto LABEL_18;
    }
  }
  BOOL v12 = 1;
LABEL_19:

  return v12;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has)
  {
    unint64_t v2 = 2654435761u * self->_cpuCycles;
    if ((*(unsigned char *)&self->_has & 2) != 0)
    {
LABEL_3:
      unint64_t v3 = 2654435761u * self->_cpuInstructions;
      if ((*(unsigned char *)&self->_has & 4) != 0) {
        goto LABEL_4;
      }
LABEL_8:
      unint64_t v4 = 0;
      if ((*(unsigned char *)&self->_has & 8) != 0) {
        goto LABEL_5;
      }
LABEL_9:
      unint64_t v5 = 0;
      return v3 ^ v2 ^ v4 ^ v5;
    }
  }
  else
  {
    unint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
  }
  unint64_t v3 = 0;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_8;
  }
LABEL_4:
  unint64_t v4 = 2654435761u * self->_gpuCycles;
  if ((*(unsigned char *)&self->_has & 8) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  unint64_t v5 = 2654435761u * self->_memoryFootprint;
  return v3 ^ v2 ^ v4 ^ v5;
}

- (id)dictionaryRepresentation
{
  unint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  char has = (char)self->_has;
  if (has)
  {
    v7 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[POWSchemaProvisionalPOWProcessUsage cpuCycles](self, "cpuCycles"));
    [v3 setObject:v7 forKeyedSubscript:@"cpuCycles"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_4;
      }
      goto LABEL_11;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  char v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[POWSchemaProvisionalPOWProcessUsage cpuInstructions](self, "cpuInstructions"));
  [v3 setObject:v8 forKeyedSubscript:@"cpuInstructions"];

  char has = (char)self->_has;
  if ((has & 4) == 0)
  {
LABEL_4:
    if ((has & 8) == 0) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
LABEL_11:
  v9 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[POWSchemaProvisionalPOWProcessUsage gpuCycles](self, "gpuCycles"));
  [v3 setObject:v9 forKeyedSubscript:@"gpuCycles"];

  if ((*(unsigned char *)&self->_has & 8) != 0)
  {
LABEL_5:
    unint64_t v5 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", -[POWSchemaProvisionalPOWProcessUsage memoryFootprint](self, "memoryFootprint"));
    [v3 setObject:v5 forKeyedSubscript:@"memoryFootprint"];
  }
LABEL_6:
  [(POWSchemaProvisionalPOWProcessUsage *)self willProduceDictionaryRepresentation:v3];

  return v3;
}

- (NSData)jsonData
{
  unint64_t v2 = [(POWSchemaProvisionalPOWProcessUsage *)self dictionaryRepresentation];
  if ([MEMORY[0x1E4F28D90] isValidJSONObject:v2])
  {
    unint64_t v3 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v2 options:0 error:0];
  }
  else
  {
    unint64_t v3 = 0;
  }

  return (NSData *)v3;
}

- (POWSchemaProvisionalPOWProcessUsage)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  unint64_t v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    unint64_t v5 = 0;
  }
  else
  {
    self = [(POWSchemaProvisionalPOWProcessUsage *)self initWithDictionary:v4];
    unint64_t v5 = self;
  }

  return v5;
}

- (POWSchemaProvisionalPOWProcessUsage)initWithDictionary:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)POWSchemaProvisionalPOWProcessUsage;
  unint64_t v5 = [(POWSchemaProvisionalPOWProcessUsage *)&v12 init];
  if (v5)
  {
    char v6 = [v4 objectForKeyedSubscript:@"cpuCycles"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POWSchemaProvisionalPOWProcessUsage setCpuCycles:](v5, "setCpuCycles:", [v6 unsignedLongLongValue]);
    }
    uint64_t v7 = [v4 objectForKeyedSubscript:@"cpuInstructions"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POWSchemaProvisionalPOWProcessUsage setCpuInstructions:](v5, "setCpuInstructions:", [v7 unsignedLongLongValue]);
    }
    char v8 = [v4 objectForKeyedSubscript:@"gpuCycles"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POWSchemaProvisionalPOWProcessUsage setGpuCycles:](v5, "setGpuCycles:", [v8 unsignedLongLongValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"memoryFootprint"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[POWSchemaProvisionalPOWProcessUsage setMemoryFootprint:](v5, "setMemoryFootprint:", [v9 unsignedLongLongValue]);
    }
    v10 = v5;
  }
  return v5;
}

- (unint64_t)cpuCycles
{
  return self->_cpuCycles;
}

- (unint64_t)cpuInstructions
{
  return self->_cpuInstructions;
}

- (unint64_t)gpuCycles
{
  return self->_gpuCycles;
}

- (unint64_t)memoryFootprint
{
  return self->_memoryFootprint;
}

@end
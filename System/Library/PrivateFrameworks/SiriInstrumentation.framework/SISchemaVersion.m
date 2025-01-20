@interface SISchemaVersion
- (BOOL)hasMajor;
- (BOOL)hasMinor;
- (BOOL)hasPatch;
- (BOOL)hasPrerelease;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (NSString)prerelease;
- (SISchemaVersion)initWithDictionary:(id)a3;
- (SISchemaVersion)initWithJSON:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unsigned)major;
- (unsigned)minor;
- (unsigned)patch;
- (void)deleteMajor;
- (void)deleteMinor;
- (void)deletePatch;
- (void)deletePrerelease;
- (void)setHasMajor:(BOOL)a3;
- (void)setHasMinor:(BOOL)a3;
- (void)setHasPatch:(BOOL)a3;
- (void)setHasPrerelease:(BOOL)a3;
- (void)setMajor:(unsigned int)a3;
- (void)setMinor:(unsigned int)a3;
- (void)setPatch:(unsigned int)a3;
- (void)setPrerelease:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaVersion

- (void).cxx_destruct
{
}

- (void)setPatch:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_patch = a3;
}

- (void)setMinor:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_minor = a3;
}

- (void)setMajor:(unsigned int)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_major = a3;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteUint32Field();
    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  PBDataWriterWriteUint32Field();
  if ((*(unsigned char *)&self->_has & 4) != 0) {
LABEL_4:
  }
    PBDataWriterWriteUint32Field();
LABEL_5:
  v5 = [(SISchemaVersion *)self prerelease];

  v6 = v7;
  if (v5)
  {
    PBDataWriterWriteStringField();
    v6 = v7;
  }
}

- (NSString)prerelease
{
  return self->_prerelease;
}

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void)setHasPrerelease:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setPrerelease:(id)a3
{
}

- (unsigned)patch
{
  return self->_patch;
}

- (unsigned)minor
{
  return self->_minor;
}

- (unsigned)major
{
  return self->_major;
}

- (SISchemaVersion)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SISchemaVersion;
  v5 = [(SISchemaVersion *)&v13 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"major"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaVersion setMajor:](v5, "setMajor:", [v6 unsignedIntValue]);
    }
    id v7 = [v4 objectForKeyedSubscript:@"minor"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaVersion setMinor:](v5, "setMinor:", [v7 unsignedIntValue]);
    }
    v8 = [v4 objectForKeyedSubscript:@"patch"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaVersion setPatch:](v5, "setPatch:", [v8 unsignedIntValue]);
    }
    v9 = [v4 objectForKeyedSubscript:@"prerelease"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v10 = (void *)[v9 copy];
      [(SISchemaVersion *)v5 setPrerelease:v10];
    }
    v11 = v5;
  }
  return v5;
}

- (SISchemaVersion)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaVersion *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaVersion *)self dictionaryRepresentation];
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
    v9 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaVersion major](self, "major"));
    [v3 setObject:v9 forKeyedSubscript:@"major"];

    char has = (char)self->_has;
    if ((has & 2) == 0)
    {
LABEL_3:
      if ((has & 4) == 0) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  else if ((*(unsigned char *)&self->_has & 2) == 0)
  {
    goto LABEL_3;
  }
  v10 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaVersion minor](self, "minor"));
  [v3 setObject:v10 forKeyedSubscript:@"minor"];

  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
LABEL_4:
    v5 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SISchemaVersion patch](self, "patch"));
    [v3 setObject:v5 forKeyedSubscript:@"patch"];
  }
LABEL_5:
  if (self->_prerelease)
  {
    v6 = [(SISchemaVersion *)self prerelease];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"prerelease"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 1) == 0)
  {
    uint64_t v2 = 0;
    if ((*(unsigned char *)&self->_has & 2) != 0) {
      goto LABEL_3;
    }
LABEL_6:
    uint64_t v3 = 0;
    if ((*(unsigned char *)&self->_has & 4) != 0) {
      goto LABEL_4;
    }
LABEL_7:
    uint64_t v4 = 0;
    return v3 ^ v2 ^ v4 ^ [(NSString *)self->_prerelease hash];
  }
  uint64_t v2 = 2654435761 * self->_major;
  if ((*(unsigned char *)&self->_has & 2) == 0) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v3 = 2654435761 * self->_minor;
  if ((*(unsigned char *)&self->_has & 4) == 0) {
    goto LABEL_7;
  }
LABEL_4:
  uint64_t v4 = 2654435761 * self->_patch;
  return v3 ^ v2 ^ v4 ^ [(NSString *)self->_prerelease hash];
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (unsigned __int8 *)a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  $2CD5129B3692A3D0A2ED2AD034419021 has = self->_has;
  unsigned int v6 = v4[32];
  if ((*(unsigned char *)&has & 1) != (v6 & 1)) {
    goto LABEL_18;
  }
  if (*(unsigned char *)&has)
  {
    unsigned int major = self->_major;
    if (major != [v4 major]) {
      goto LABEL_18;
    }
    $2CD5129B3692A3D0A2ED2AD034419021 has = self->_has;
    unsigned int v6 = v4[32];
  }
  int v8 = (*(unsigned int *)&has >> 1) & 1;
  if (v8 == ((v6 >> 1) & 1))
  {
    if (v8)
    {
      unsigned int minor = self->_minor;
      if (minor != [v4 minor]) {
        goto LABEL_18;
      }
      $2CD5129B3692A3D0A2ED2AD034419021 has = self->_has;
      unsigned int v6 = v4[32];
    }
    int v10 = (*(unsigned int *)&has >> 2) & 1;
    if (v10 == ((v6 >> 2) & 1))
    {
      if (!v10 || (unsigned int patch = self->_patch, patch == [v4 patch]))
      {
        v12 = [(SISchemaVersion *)self prerelease];
        objc_super v13 = [v4 prerelease];
        v14 = v13;
        if ((v12 == 0) != (v13 != 0))
        {
          uint64_t v15 = [(SISchemaVersion *)self prerelease];
          if (!v15)
          {

LABEL_21:
            BOOL v20 = 1;
            goto LABEL_19;
          }
          v16 = (void *)v15;
          v17 = [(SISchemaVersion *)self prerelease];
          v18 = [v4 prerelease];
          char v19 = [v17 isEqual:v18];

          if (v19) {
            goto LABEL_21;
          }
        }
        else
        {
        }
      }
    }
  }
LABEL_18:
  BOOL v20 = 0;
LABEL_19:

  return v20;
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaVersionReadFrom(self, (uint64_t)a3);
}

- (void)deletePrerelease
{
}

- (BOOL)hasPrerelease
{
  return self->_prerelease != 0;
}

- (void)deletePatch
{
  *(unsigned char *)&self->_has &= ~4u;
}

- (void)setHasPatch:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$2CD5129B3692A3D0A2ED2AD034419021 has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (BOOL)hasPatch
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)deleteMinor
{
  *(unsigned char *)&self->_has &= ~2u;
}

- (void)setHasMinor:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_$2CD5129B3692A3D0A2ED2AD034419021 has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasMinor
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)deleteMajor
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasMajor:(BOOL)a3
{
  *(unsigned char *)&self->_$2CD5129B3692A3D0A2ED2AD034419021 has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasMajor
{
  return *(unsigned char *)&self->_has & 1;
}

@end
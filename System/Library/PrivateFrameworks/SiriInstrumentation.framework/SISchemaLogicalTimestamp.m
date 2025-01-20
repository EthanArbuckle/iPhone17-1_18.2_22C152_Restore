@interface SISchemaLogicalTimestamp
- (BOOL)hasClockIdentifier;
- (BOOL)hasTimestampInNanoseconds;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)jsonData;
- (SISchemaLogicalTimestamp)initWithDictionary:(id)a3;
- (SISchemaLogicalTimestamp)initWithJSON:(id)a3;
- (SISchemaUUID)clockIdentifier;
- (id)applySensitiveConditionsPolicy:(id)a3;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (int64_t)timestampInNanoseconds;
- (unint64_t)hash;
- (void)deleteClockIdentifier;
- (void)deleteTimestampInNanoseconds;
- (void)setClockIdentifier:(id)a3;
- (void)setHasClockIdentifier:(BOOL)a3;
- (void)setHasTimestampInNanoseconds:(BOOL)a3;
- (void)setTimestampInNanoseconds:(int64_t)a3;
- (void)writeTo:(id)a3;
@end

@implementation SISchemaLogicalTimestamp

- (id)applySensitiveConditionsPolicy:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)SISchemaLogicalTimestamp;
  id v4 = a3;
  v5 = [(SISchemaInstrumentationMessage *)&v9 applySensitiveConditionsPolicy:v4];
  v6 = [(SISchemaLogicalTimestamp *)self clockIdentifier];
  v7 = [v6 applySensitiveConditionsPolicy:v4];

  LODWORD(v4) = [v7 suppressMessage];
  if (v4) {
    [(SISchemaLogicalTimestamp *)self deleteClockIdentifier];
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
}

- (void)setHasClockIdentifier:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setClockIdentifier:(id)a3
{
}

- (SISchemaUUID)clockIdentifier
{
  return self->_clockIdentifier;
}

- (int64_t)timestampInNanoseconds
{
  return self->_timestampInNanoseconds;
}

- (SISchemaLogicalTimestamp)initWithDictionary:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SISchemaLogicalTimestamp;
  v5 = [(SISchemaLogicalTimestamp *)&v11 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"timestampInNanoseconds"];
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      -[SISchemaLogicalTimestamp setTimestampInNanoseconds:](v5, "setTimestampInNanoseconds:", [v6 longLongValue]);
    }
    v7 = [v4 objectForKeyedSubscript:@"clockIdentifier"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v8 = [[SISchemaUUID alloc] initWithDictionary:v7];
      [(SISchemaLogicalTimestamp *)v5 setClockIdentifier:v8];
    }
    objc_super v9 = v5;
  }
  return v5;
}

- (SISchemaLogicalTimestamp)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(SISchemaLogicalTimestamp *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(SISchemaLogicalTimestamp *)self dictionaryRepresentation];
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
  if (self->_clockIdentifier)
  {
    id v4 = [(SISchemaLogicalTimestamp *)self clockIdentifier];
    v5 = [v4 dictionaryRepresentation];
    if (v5)
    {
      [v3 setObject:v5 forKeyedSubscript:@"clockIdentifier"];
    }
    else
    {
      v6 = [MEMORY[0x1E4F1CA98] null];
      [v3 setObject:v6 forKeyedSubscript:@"clockIdentifier"];
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    uint64_t v7 = objc_msgSend(NSNumber, "numberWithLongLong:", -[SISchemaLogicalTimestamp timestampInNanoseconds](self, "timestampInNanoseconds"));
    [v3 setObject:v7 forKeyedSubscript:@"timestampInNanoseconds"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  if (*(unsigned char *)&self->_has) {
    uint64_t v2 = 2654435761 * self->_timestampInNanoseconds;
  }
  else {
    uint64_t v2 = 0;
  }
  return [(SISchemaUUID *)self->_clockIdentifier hash] ^ v2;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()])
  {
    if ((*(unsigned char *)&self->_has & 1) == (v4[24] & 1))
    {
      if ((*(unsigned char *)&self->_has & 1) == 0
        || (int64_t timestampInNanoseconds = self->_timestampInNanoseconds,
            timestampInNanoseconds == [v4 timestampInNanoseconds]))
      {
        v6 = [(SISchemaLogicalTimestamp *)self clockIdentifier];
        uint64_t v7 = [v4 clockIdentifier];
        v8 = v7;
        if ((v6 == 0) != (v7 != 0))
        {
          uint64_t v9 = [(SISchemaLogicalTimestamp *)self clockIdentifier];
          if (!v9)
          {

LABEL_13:
            BOOL v14 = 1;
            goto LABEL_11;
          }
          v10 = (void *)v9;
          objc_super v11 = [(SISchemaLogicalTimestamp *)self clockIdentifier];
          v12 = [v4 clockIdentifier];
          char v13 = [v11 isEqual:v12];

          if (v13) {
            goto LABEL_13;
          }
        }
        else
        {
        }
      }
    }
  }
  BOOL v14 = 0;
LABEL_11:

  return v14;
}

- (void)writeTo:(id)a3
{
  id v7 = a3;
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteInt64Field();
  }
  id v4 = [(SISchemaLogicalTimestamp *)self clockIdentifier];

  v5 = v7;
  if (v4)
  {
    v6 = [(SISchemaLogicalTimestamp *)self clockIdentifier];
    PBDataWriterWriteSubmessage();

    v5 = v7;
  }
}

- (BOOL)readFrom:(id)a3
{
  return SISchemaLogicalTimestampReadFrom(self, (uint64_t)a3);
}

- (void)deleteClockIdentifier
{
}

- (BOOL)hasClockIdentifier
{
  return self->_clockIdentifier != 0;
}

- (void)deleteTimestampInNanoseconds
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasTimestampInNanoseconds:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasTimestampInNanoseconds
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setTimestampInNanoseconds:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_int64_t timestampInNanoseconds = a3;
}

@end
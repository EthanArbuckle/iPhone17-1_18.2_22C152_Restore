@interface USPSchemaUSPMetric
- (BOOL)hasName;
- (BOOL)hasUnit;
- (BOOL)hasValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSArray)iterationValues;
- (NSData)jsonData;
- (NSString)name;
- (NSString)unit;
- (USPSchemaUSPMetric)initWithDictionary:(id)a3;
- (USPSchemaUSPMetric)initWithJSON:(id)a3;
- (double)iterationValuesAtIndex:(unint64_t)a3;
- (double)value;
- (id)dictionaryRepresentation;
- (id)suppressMessageUnderConditions;
- (unint64_t)hash;
- (unint64_t)iterationValuesCount;
- (void)addIterationValues:(double)a3;
- (void)clearIterationValues;
- (void)deleteName;
- (void)deleteUnit;
- (void)deleteValue;
- (void)setHasName:(BOOL)a3;
- (void)setHasUnit:(BOOL)a3;
- (void)setHasValue:(BOOL)a3;
- (void)setIterationValues:(id)a3;
- (void)setName:(id)a3;
- (void)setUnit:(id)a3;
- (void)setValue:(double)a3;
- (void)writeTo:(id)a3;
@end

@implementation USPSchemaUSPMetric

- (id)suppressMessageUnderConditions
{
  v2 = objc_alloc_init(SISensitiveConditionsSet);
  [(SISensitiveConditionsSet *)v2 addCondition:1];
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iterationValues, 0);
  objc_storeStrong((id *)&self->_unit, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

- (void)setHasUnit:(BOOL)a3
{
  *((unsigned char *)&self->_has + 2) = a3;
}

- (void)setHasName:(BOOL)a3
{
  *((unsigned char *)&self->_has + 1) = a3;
}

- (void)setIterationValues:(id)a3
{
}

- (NSArray)iterationValues
{
  return self->_iterationValues;
}

- (double)value
{
  return self->_value;
}

- (void)setUnit:(id)a3
{
}

- (NSString)unit
{
  return self->_unit;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (USPSchemaUSPMetric)initWithDictionary:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)USPSchemaUSPMetric;
  v5 = [(USPSchemaUSPMetric *)&v26 init];
  if (v5)
  {
    v6 = [v4 objectForKeyedSubscript:@"name"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = (void *)[v6 copy];
      [(USPSchemaUSPMetric *)v5 setName:v7];
    }
    v8 = [v4 objectForKeyedSubscript:@"unit"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v9 = (void *)[v8 copy];
      [(USPSchemaUSPMetric *)v5 setUnit:v9];
    }
    v10 = [v4 objectForKeyedSubscript:@"value"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      -[USPSchemaUSPMetric setValue:](v5, "setValue:");
    }
    v11 = [v4 objectForKeyedSubscript:@"iterationValues"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v20 = v8;
      v21 = v6;
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v12 = v11;
      uint64_t v13 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
      if (v13)
      {
        uint64_t v14 = v13;
        uint64_t v15 = *(void *)v23;
        do
        {
          uint64_t v16 = 0;
          do
          {
            if (*(void *)v23 != v15) {
              objc_enumerationMutation(v12);
            }
            v17 = *(void **)(*((void *)&v22 + 1) + 8 * v16);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              [v17 doubleValue];
              -[USPSchemaUSPMetric addIterationValues:](v5, "addIterationValues:");
            }
            ++v16;
          }
          while (v14 != v16);
          uint64_t v14 = [v12 countByEnumeratingWithState:&v22 objects:v27 count:16];
        }
        while (v14);
      }

      v8 = v20;
      v6 = v21;
    }
    v18 = v5;
  }
  return v5;
}

- (USPSchemaUSPMetric)initWithJSON:(id)a3
{
  uint64_t v7 = 0;
  id v4 = [MEMORY[0x1E4F28D90] JSONObjectWithData:a3 options:0 error:&v7];
  if (v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    v5 = 0;
  }
  else
  {
    self = [(USPSchemaUSPMetric *)self initWithDictionary:v4];
    v5 = self;
  }

  return v5;
}

- (NSData)jsonData
{
  v2 = [(USPSchemaUSPMetric *)self dictionaryRepresentation];
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
  if ([(NSArray *)self->_iterationValues count])
  {
    id v4 = [(USPSchemaUSPMetric *)self iterationValues];
    v5 = (void *)[v4 copy];
    [v3 setObject:v5 forKeyedSubscript:@"iterationValues"];
  }
  if (self->_name)
  {
    v6 = [(USPSchemaUSPMetric *)self name];
    uint64_t v7 = (void *)[v6 copy];
    [v3 setObject:v7 forKeyedSubscript:@"name"];
  }
  if (self->_unit)
  {
    v8 = [(USPSchemaUSPMetric *)self unit];
    v9 = (void *)[v8 copy];
    [v3 setObject:v9 forKeyedSubscript:@"unit"];
  }
  if (*(unsigned char *)&self->_has)
  {
    v10 = NSNumber;
    [(USPSchemaUSPMetric *)self value];
    v11 = objc_msgSend(v10, "numberWithDouble:");
    [v3 setObject:v11 forKeyedSubscript:@"value"];
  }
  [(SISchemaInstrumentationMessage *)self willProduceDictionaryRepresentation:v3];
  return v3;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  NSUInteger v4 = [(NSString *)self->_unit hash];
  if (*(unsigned char *)&self->_has)
  {
    double value = self->_value;
    double v7 = -value;
    if (value >= 0.0) {
      double v7 = self->_value;
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
  return v4 ^ v3 ^ v5 ^ [(NSArray *)self->_iterationValues hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_20;
  }
  unint64_t v5 = [(USPSchemaUSPMetric *)self name];
  v6 = [v4 name];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v7 = [(USPSchemaUSPMetric *)self name];
  if (v7)
  {
    long double v8 = (void *)v7;
    double v9 = [(USPSchemaUSPMetric *)self name];
    v10 = [v4 name];
    int v11 = [v9 isEqual:v10];

    if (!v11) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  unint64_t v5 = [(USPSchemaUSPMetric *)self unit];
  v6 = [v4 unit];
  if ((v5 == 0) == (v6 != 0)) {
    goto LABEL_19;
  }
  uint64_t v12 = [(USPSchemaUSPMetric *)self unit];
  if (v12)
  {
    uint64_t v13 = (void *)v12;
    uint64_t v14 = [(USPSchemaUSPMetric *)self unit];
    uint64_t v15 = [v4 unit];
    int v16 = [v14 isEqual:v15];

    if (!v16) {
      goto LABEL_20;
    }
  }
  else
  {
  }
  if ((*(unsigned char *)&self->_has & 1) != (v4[40] & 1)) {
    goto LABEL_20;
  }
  if (*(unsigned char *)&self->_has)
  {
    double value = self->_value;
    [v4 value];
    if (value != v18) {
      goto LABEL_20;
    }
  }
  unint64_t v5 = [(USPSchemaUSPMetric *)self iterationValues];
  v6 = [v4 iterationValues];
  if ((v5 == 0) != (v6 != 0))
  {
    uint64_t v19 = [(USPSchemaUSPMetric *)self iterationValues];
    if (!v19)
    {

LABEL_23:
      BOOL v24 = 1;
      goto LABEL_21;
    }
    v20 = (void *)v19;
    v21 = [(USPSchemaUSPMetric *)self iterationValues];
    long long v22 = [v4 iterationValues];
    char v23 = [v21 isEqual:v22];

    if (v23) {
      goto LABEL_23;
    }
  }
  else
  {
LABEL_19:
  }
LABEL_20:
  BOOL v24 = 0;
LABEL_21:

  return v24;
}

- (void)writeTo:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  unint64_t v5 = [(USPSchemaUSPMetric *)self name];

  if (v5) {
    PBDataWriterWriteStringField();
  }
  v6 = [(USPSchemaUSPMetric *)self unit];

  if (v6) {
    PBDataWriterWriteStringField();
  }
  if (*(unsigned char *)&self->_has) {
    PBDataWriterWriteDoubleField();
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v7 = self->_iterationValues;
  uint64_t v8 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v11), "doubleValue", (void)v12);
        PBDataWriterWriteDoubleField();
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [(NSArray *)v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (BOOL)readFrom:(id)a3
{
  return USPSchemaUSPMetricReadFrom(self, (uint64_t)a3);
}

- (double)iterationValuesAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(NSArray *)self->_iterationValues objectAtIndexedSubscript:a3];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (unint64_t)iterationValuesCount
{
  return [(NSArray *)self->_iterationValues count];
}

- (void)addIterationValues:(double)a3
{
  iterationValues = self->_iterationValues;
  if (!iterationValues)
  {
    v6 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v7 = self->_iterationValues;
    self->_iterationValues = v6;

    iterationValues = self->_iterationValues;
  }
  id v8 = [NSNumber numberWithDouble:a3];
  [(NSArray *)iterationValues addObject:v8];
}

- (void)clearIterationValues
{
}

- (void)deleteValue
{
  *(unsigned char *)&self->_has &= ~1u;
}

- (void)setHasValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_double value = a3;
}

- (void)deleteUnit
{
}

- (BOOL)hasUnit
{
  return self->_unit != 0;
}

- (void)deleteName
{
}

- (BOOL)hasName
{
  return self->_name != 0;
}

@end
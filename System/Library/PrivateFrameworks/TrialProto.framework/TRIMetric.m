@interface TRIMetric
+ (id)metricWithName:(id)a3;
+ (id)metricWithName:(id)a3 categoricalValue:(id)a4;
+ (id)metricWithName:(id)a3 doubleValue:(double)a4;
+ (id)metricWithName:(id)a3 integerValue:(int64_t)a4;
+ (id)metricWithName:(id)a3 userDefinedValue:(id)a4;
- (BOOL)hasCategoricalValue;
- (BOOL)hasDoubleValue;
- (BOOL)hasIntegerValue;
- (BOOL)hasName;
- (BOOL)hasUserDefinedValue;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSData)userDefinedValue;
- (NSString)categoricalValue;
- (NSString)name;
- (double)doubleValue;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (int64_t)integerValue;
- (unint64_t)hash;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setCategoricalValue:(id)a3;
- (void)setDoubleValue:(double)a3;
- (void)setHasDoubleValue:(BOOL)a3;
- (void)setHasIntegerValue:(BOOL)a3;
- (void)setIntegerValue:(int64_t)a3;
- (void)setName:(id)a3;
- (void)setUserDefinedValue:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRIMetric

+ (id)metricWithName:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    [v8 handleFailureInMethod:a2, a1, @"TRIMetric+Factory.m", 14, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v6 = objc_opt_new();
  [v6 setName:v5];

  return v6;
}

+ (id)metricWithName:(id)a3 doubleValue:(double)a4
{
  id v7 = a3;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"TRIMetric+Factory.m", 21, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v8 = objc_opt_new();
  [v8 setName:v7];
  [v8 setDoubleValue:a4];

  return v8;
}

+ (id)metricWithName:(id)a3 integerValue:(int64_t)a4
{
  id v7 = a3;
  if (!v7)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2, a1, @"TRIMetric+Factory.m", 29, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];
  }
  v8 = objc_opt_new();
  [v8 setName:v7];
  [v8 setIntegerValue:a4];

  return v8;
}

+ (id)metricWithName:(id)a3 categoricalValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"TRIMetric+Factory.m", 37, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, a1, @"TRIMetric+Factory.m", 38, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

LABEL_3:
  v10 = objc_opt_new();
  [v10 setName:v7];
  [v10 setCategoricalValue:v9];

  return v10;
}

+ (id)metricWithName:(id)a3 userDefinedValue:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = v8;
  if (v7)
  {
    if (v8) {
      goto LABEL_3;
    }
  }
  else
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, a1, @"TRIMetric+Factory.m", 46, @"Invalid parameter not satisfying: %@", @"name" object file lineNumber description];

    if (v9) {
      goto LABEL_3;
    }
  }
  v13 = [MEMORY[0x1E4F28B00] currentHandler];
  [v13 handleFailureInMethod:a2, a1, @"TRIMetric+Factory.m", 47, @"Invalid parameter not satisfying: %@", @"value" object file lineNumber description];

LABEL_3:
  v10 = objc_opt_new();
  [v10 setName:v7];
  [v10 setUserDefinedValue:v9];

  return v10;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (void)setDoubleValue:(double)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_doubleValue = a3;
}

- (void)setHasDoubleValue:(BOOL)a3
{
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (BOOL)hasDoubleValue
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setIntegerValue:(int64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_integerValue = a3;
}

- (void)setHasIntegerValue:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (BOOL)hasIntegerValue
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (BOOL)hasCategoricalValue
{
  return self->_categoricalValue != 0;
}

- (BOOL)hasUserDefinedValue
{
  return self->_userDefinedValue != 0;
}

- (id)description
{
  char v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRIMetric;
  v4 = [(TRIMetric *)&v8 description];
  id v5 = [(TRIMetric *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  char v3 = [MEMORY[0x1E4F1CA60] dictionary];
  v4 = v3;
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char has = (char)self->_has;
  if (has)
  {
    id v7 = [NSNumber numberWithDouble:self->_doubleValue];
    [v4 setObject:v7 forKey:@"double_value"];

    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    objc_super v8 = [NSNumber numberWithLongLong:self->_integerValue];
    [v4 setObject:v8 forKey:@"integer_value"];
  }
  categoricalValue = self->_categoricalValue;
  if (categoricalValue) {
    [v4 setObject:categoricalValue forKey:@"categorical_value"];
  }
  userDefinedValue = self->_userDefinedValue;
  if (userDefinedValue) {
    [v4 setObject:userDefinedValue forKey:@"user_defined_value"];
  }
  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return TRIMetricReadFrom((uint64_t)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_name)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    PBDataWriterWriteDoubleField();
    id v4 = v6;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    PBDataWriterWriteInt64Field();
    id v4 = v6;
  }
  if (self->_categoricalValue)
  {
    PBDataWriterWriteStringField();
    id v4 = v6;
  }
  if (self->_userDefinedValue)
  {
    PBDataWriterWriteDataField();
    id v4 = v6;
  }
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (self->_name)
  {
    objc_msgSend(v4, "setName:");
    id v4 = v6;
  }
  char has = (char)self->_has;
  if (has)
  {
    *((void *)v4 + 1) = *(void *)&self->_doubleValue;
    *((unsigned char *)v4 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_integerValue;
    *((unsigned char *)v4 + 48) |= 2u;
  }
  if (self->_categoricalValue)
  {
    objc_msgSend(v6, "setCategoricalValue:");
    id v4 = v6;
  }
  if (self->_userDefinedValue)
  {
    objc_msgSend(v6, "setUserDefinedValue:");
    id v4 = v6;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSString *)self->_name copyWithZone:a3];
  id v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  char has = (char)self->_has;
  if (has)
  {
    *(double *)(v5 + 8) = self->_doubleValue;
    *(unsigned char *)(v5 + 48) |= 1u;
    char has = (char)self->_has;
  }
  if ((has & 2) != 0)
  {
    *(void *)(v5 + 16) = self->_integerValue;
    *(unsigned char *)(v5 + 48) |= 2u;
  }
  uint64_t v9 = [(NSString *)self->_categoricalValue copyWithZone:a3];
  v10 = *(void **)(v5 + 24);
  *(void *)(v5 + 24) = v9;

  uint64_t v11 = [(NSData *)self->_userDefinedValue copyWithZone:a3];
  v12 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v11;

  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_18;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:")) {
      goto LABEL_18;
    }
  }
  if (*(unsigned char *)&self->_has)
  {
    if ((*((unsigned char *)v4 + 48) & 1) == 0 || self->_doubleValue != *((double *)v4 + 1)) {
      goto LABEL_18;
    }
  }
  else if (*((unsigned char *)v4 + 48))
  {
LABEL_18:
    char v8 = 0;
    goto LABEL_19;
  }
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    if ((*((unsigned char *)v4 + 48) & 2) == 0 || self->_integerValue != *((void *)v4 + 2)) {
      goto LABEL_18;
    }
  }
  else if ((*((unsigned char *)v4 + 48) & 2) != 0)
  {
    goto LABEL_18;
  }
  categoricalValue = self->_categoricalValue;
  if ((unint64_t)categoricalValue | *((void *)v4 + 3)
    && !-[NSString isEqual:](categoricalValue, "isEqual:"))
  {
    goto LABEL_18;
  }
  userDefinedValue = self->_userDefinedValue;
  if ((unint64_t)userDefinedValue | *((void *)v4 + 5)) {
    char v8 = -[NSData isEqual:](userDefinedValue, "isEqual:");
  }
  else {
    char v8 = 1;
  }
LABEL_19:

  return v8;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_name hash];
  char has = (char)self->_has;
  if (has)
  {
    double doubleValue = self->_doubleValue;
    double v7 = -doubleValue;
    if (doubleValue >= 0.0) {
      double v7 = self->_doubleValue;
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
  if ((has & 2) != 0) {
    uint64_t v10 = 2654435761 * self->_integerValue;
  }
  else {
    uint64_t v10 = 0;
  }
  NSUInteger v11 = v5 ^ v3 ^ v10 ^ [(NSString *)self->_categoricalValue hash];
  return v11 ^ [(NSData *)self->_userDefinedValue hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  id v6 = v4;
  if (*((void *)v4 + 4))
  {
    -[TRIMetric setName:](self, "setName:");
    id v4 = v6;
  }
  char v5 = *((unsigned char *)v4 + 48);
  if (v5)
  {
    self->_double doubleValue = *((double *)v4 + 1);
    *(unsigned char *)&self->_has |= 1u;
    char v5 = *((unsigned char *)v4 + 48);
  }
  if ((v5 & 2) != 0)
  {
    self->_integerValue = *((void *)v4 + 2);
    *(unsigned char *)&self->_has |= 2u;
  }
  if (*((void *)v4 + 3))
  {
    -[TRIMetric setCategoricalValue:](self, "setCategoricalValue:");
    id v4 = v6;
  }
  if (*((void *)v4 + 5))
  {
    -[TRIMetric setUserDefinedValue:](self, "setUserDefinedValue:");
    id v4 = v6;
  }
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
}

- (double)doubleValue
{
  return self->_doubleValue;
}

- (int64_t)integerValue
{
  return self->_integerValue;
}

- (NSString)categoricalValue
{
  return self->_categoricalValue;
}

- (void)setCategoricalValue:(id)a3
{
}

- (NSData)userDefinedValue
{
  return self->_userDefinedValue;
}

- (void)setUserDefinedValue:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDefinedValue, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_categoricalValue, 0);
}

@end
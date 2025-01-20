@interface SECC2MPGenericEvent
+ (Class)metricType;
- (BOOL)hasName;
- (BOOL)hasTimestampEnd;
- (BOOL)hasTimestampStart;
- (BOOL)hasType;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)metrics;
- (NSString)name;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricAtIndex:(unint64_t)a3;
- (id)typeAsString:(int)a3;
- (int)StringAsType:(id)a3;
- (int)type;
- (unint64_t)hash;
- (unint64_t)metricsCount;
- (unint64_t)timestampEnd;
- (unint64_t)timestampStart;
- (void)addMetric:(id)a3;
- (void)clearMetrics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setHasTimestampEnd:(BOOL)a3;
- (void)setHasTimestampStart:(BOOL)a3;
- (void)setHasType:(BOOL)a3;
- (void)setMetrics:(id)a3;
- (void)setName:(id)a3;
- (void)setTimestampEnd:(unint64_t)a3;
- (void)setTimestampStart:(unint64_t)a3;
- (void)setType:(int)a3;
- (void)writeTo:(id)a3;
@end

@implementation SECC2MPGenericEvent

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);

  objc_storeStrong((id *)&self->_metrics, 0);
}

- (void)setMetrics:(id)a3
{
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (unint64_t)timestampEnd
{
  return self->_timestampEnd;
}

- (unint64_t)timestampStart
{
  return self->_timestampStart;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)mergeFrom:(id)a3
{
  v4 = a3;
  id v5 = v4;
  if ((v4[11] & 4) != 0)
  {
    self->_type = v4[10];
    *(unsigned char *)&self->_has |= 4u;
  }
  if (*((void *)v4 + 4)) {
    -[SECC2MPGenericEvent setName:](self, "setName:");
  }
  char v6 = *((unsigned char *)v5 + 44);
  if ((v6 & 2) != 0)
  {
    self->_timestampStart = *((void *)v5 + 2);
    *(unsigned char *)&self->_has |= 2u;
    char v6 = *((unsigned char *)v5 + 44);
  }
  if (v6)
  {
    self->_timestampEnd = *((void *)v5 + 1);
    *(unsigned char *)&self->_has |= 1u;
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = *((id *)v5 + 3);
  id v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    id v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        -[SECC2MPGenericEvent addMetric:](self, "addMetric:", *(void *)(*((void *)&v12 + 1) + 8 * i), (void)v12);
      }
      id v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (unint64_t)hash
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    uint64_t v3 = 2654435761 * self->_type;
  }
  else {
    uint64_t v3 = 0;
  }
  NSUInteger v4 = [(NSString *)self->_name hash];
  if ((*(unsigned char *)&self->_has & 2) != 0)
  {
    unint64_t v5 = 2654435761u * self->_timestampStart;
    if (*(unsigned char *)&self->_has) {
      goto LABEL_6;
    }
LABEL_8:
    unint64_t v6 = 0;
    return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)[(NSMutableArray *)self->_metrics hash];
  }
  unint64_t v5 = 0;
  if ((*(unsigned char *)&self->_has & 1) == 0) {
    goto LABEL_8;
  }
LABEL_6:
  unint64_t v6 = 2654435761u * self->_timestampEnd;
  return v4 ^ v3 ^ v5 ^ v6 ^ (unint64_t)[(NSMutableArray *)self->_metrics hash];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  if (![v4 isMemberOfClass:objc_opt_class()]) {
    goto LABEL_22;
  }
  char has = (char)self->_has;
  char v6 = *((unsigned char *)v4 + 44);
  if ((has & 4) != 0)
  {
    if ((*((unsigned char *)v4 + 44) & 4) == 0 || self->_type != *((_DWORD *)v4 + 10)) {
      goto LABEL_22;
    }
  }
  else if ((*((unsigned char *)v4 + 44) & 4) != 0)
  {
    goto LABEL_22;
  }
  name = self->_name;
  if ((unint64_t)name | *((void *)v4 + 4))
  {
    if (!-[NSString isEqual:](name, "isEqual:"))
    {
LABEL_22:
      unsigned __int8 v9 = 0;
      goto LABEL_23;
    }
    char has = (char)self->_has;
    char v6 = *((unsigned char *)v4 + 44);
  }
  if ((has & 2) != 0)
  {
    if ((v6 & 2) == 0 || self->_timestampStart != *((void *)v4 + 2)) {
      goto LABEL_22;
    }
  }
  else if ((v6 & 2) != 0)
  {
    goto LABEL_22;
  }
  if (has)
  {
    if ((v6 & 1) == 0 || self->_timestampEnd != *((void *)v4 + 1)) {
      goto LABEL_22;
    }
  }
  else if (v6)
  {
    goto LABEL_22;
  }
  metrics = self->_metrics;
  if ((unint64_t)metrics | *((void *)v4 + 3)) {
    unsigned __int8 v9 = -[NSMutableArray isEqual:](metrics, "isEqual:");
  }
  else {
    unsigned __int8 v9 = 1;
  }
LABEL_23:

  return v9;
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[[objc_opt_class() allocWithZone:a3] init];
  char v6 = v5;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v5[10] = self->_type;
    *((unsigned char *)v5 + 44) |= 4u;
  }
  id v7 = [(NSString *)self->_name copyWithZone:a3];
  id v8 = (void *)v6[4];
  v6[4] = v7;

  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    v6[2] = self->_timestampStart;
    *((unsigned char *)v6 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    v6[1] = self->_timestampEnd;
    *((unsigned char *)v6 + 44) |= 1u;
  }
  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v10 = self->_metrics;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v17 + 1) + 8 * i) copyWithZone:a3];
        [v6 addMetric:v15];
      }
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  return v6;
}

- (void)copyTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    v4[10] = self->_type;
    *((unsigned char *)v4 + 44) |= 4u;
  }
  uint64_t v10 = v4;
  if (self->_name)
  {
    [v4 setName:];
    id v4 = v10;
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    *((void *)v4 + 2) = self->_timestampStart;
    *((unsigned char *)v4 + 44) |= 2u;
    char has = (char)self->_has;
  }
  if (has)
  {
    *((void *)v4 + 1) = self->_timestampEnd;
    *((unsigned char *)v4 + 44) |= 1u;
  }
  if ([(SECC2MPGenericEvent *)self metricsCount])
  {
    [v10 clearMetrics];
    unint64_t v6 = [(SECC2MPGenericEvent *)self metricsCount];
    if (v6)
    {
      unint64_t v7 = v6;
      for (uint64_t i = 0; i != v7; ++i)
      {
        unsigned __int8 v9 = [(SECC2MPGenericEvent *)self metricAtIndex:i];
        [v10 addMetric:v9];
      }
    }
  }
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    PBDataWriterWriteInt32Field();
  }
  if (self->_name) {
    PBDataWriterWriteStringField();
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    PBDataWriterWriteUint64Field();
    char has = (char)self->_has;
  }
  if (has) {
    PBDataWriterWriteUint64Field();
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  unint64_t v6 = self->_metrics;
  unint64_t v7 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        PBDataWriterWriteSubmessage();
      }
      id v8 = (char *)[(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }
}

- (BOOL)readFrom:(id)a3
{
  return sub_1000B00E8((uint64_t)self, (uint64_t)a3);
}

- (id)dictionaryRepresentation
{
  uint64_t v3 = +[NSMutableDictionary dictionary];
  if ((*(unsigned char *)&self->_has & 4) != 0)
  {
    int type = self->_type;
    if (type > 200)
    {
      if (type == 201)
      {
        unint64_t v5 = @"cloudkit_client";
        goto LABEL_12;
      }
      if (type == 301)
      {
        unint64_t v5 = @"server";
        goto LABEL_12;
      }
    }
    else
    {
      if (!type)
      {
        unint64_t v5 = @"none";
        goto LABEL_12;
      }
      if (type == 101)
      {
        unint64_t v5 = @"cloudkit";
LABEL_12:
        [v3 setObject:v5 forKey:@"type"];

        goto LABEL_13;
      }
    }
    unint64_t v5 = +[NSString stringWithFormat:@"(unknown: %i)", self->_type];
    goto LABEL_12;
  }
LABEL_13:
  name = self->_name;
  if (name) {
    [v3 setObject:name forKey:@"name"];
  }
  char has = (char)self->_has;
  if ((has & 2) != 0)
  {
    id v8 = +[NSNumber numberWithUnsignedLongLong:self->_timestampStart];
    [v3 setObject:v8 forKey:@"timestamp_start"];

    char has = (char)self->_has;
  }
  if (has)
  {
    uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:self->_timestampEnd];
    [v3 setObject:v9 forKey:@"timestamp_end"];
  }
  if ([(NSMutableArray *)self->_metrics count])
  {
    id v10 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_metrics, "count")];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v11 = self->_metrics;
    id v12 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v19 != v14) {
            objc_enumerationMutation(v11);
          }
          v16 = [*(id *)(*((void *)&v18 + 1) + 8 * i) dictionaryRepresentation];
          [v10 addObject:v16];
        }
        id v13 = [(NSMutableArray *)v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v13);
    }

    [v3 setObject:v10 forKey:@"metric"];
  }

  return v3;
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)SECC2MPGenericEvent;
  uint64_t v3 = [(SECC2MPGenericEvent *)&v7 description];
  id v4 = [(SECC2MPGenericEvent *)self dictionaryRepresentation];
  unint64_t v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)metricAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_metrics objectAtIndex:a3];
}

- (unint64_t)metricsCount
{
  return (unint64_t)[(NSMutableArray *)self->_metrics count];
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  metrics = self->_metrics;
  id v8 = v4;
  if (!metrics)
  {
    unint64_t v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    objc_super v7 = self->_metrics;
    self->_metrics = v6;

    id v4 = v8;
    metrics = self->_metrics;
  }
  [(NSMutableArray *)metrics addObject:v4];
}

- (void)clearMetrics
{
}

- (BOOL)hasTimestampEnd
{
  return *(unsigned char *)&self->_has & 1;
}

- (void)setHasTimestampEnd:(BOOL)a3
{
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFE | a3;
}

- (void)setTimestampEnd:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 1u;
  self->_timestampEnd = a3;
}

- (BOOL)hasTimestampStart
{
  return (*(unsigned char *)&self->_has >> 1) & 1;
}

- (void)setHasTimestampStart:(BOOL)a3
{
  if (a3) {
    char v3 = 2;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFD | v3;
}

- (void)setTimestampStart:(unint64_t)a3
{
  *(unsigned char *)&self->_has |= 2u;
  self->_timestampStart = a3;
}

- (BOOL)hasName
{
  return self->_name != 0;
}

- (int)StringAsType:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"none"])
  {
    int v4 = 0;
  }
  else if ([v3 isEqualToString:@"cloudkit"])
  {
    int v4 = 101;
  }
  else if ([v3 isEqualToString:@"cloudkit_client"])
  {
    int v4 = 201;
  }
  else if ([v3 isEqualToString:@"server"])
  {
    int v4 = 301;
  }
  else
  {
    int v4 = 0;
  }

  return v4;
}

- (id)typeAsString:(int)a3
{
  if (a3 > 200)
  {
    if (a3 == 201)
    {
      int v4 = @"cloudkit_client";
    }
    else
    {
      if (a3 != 301)
      {
LABEL_12:
        int v4 = +[NSString stringWithFormat:@"(unknown: %i)", *(void *)&a3];
        return v4;
      }
      int v4 = @"server";
    }
  }
  else
  {
    if (a3)
    {
      if (a3 == 101)
      {
        int v4 = @"cloudkit";
        return v4;
      }
      goto LABEL_12;
    }
    int v4 = @"none";
  }
  return v4;
}

- (BOOL)hasType
{
  return (*(unsigned char *)&self->_has >> 2) & 1;
}

- (void)setHasType:(BOOL)a3
{
  if (a3) {
    char v3 = 4;
  }
  else {
    char v3 = 0;
  }
  *(unsigned char *)&self->_char has = *(unsigned char *)&self->_has & 0xFB | v3;
}

- (void)setType:(int)a3
{
  *(unsigned char *)&self->_has |= 4u;
  self->_int type = a3;
}

- (int)type
{
  if ((*(unsigned char *)&self->_has & 4) != 0) {
    return self->_type;
  }
  else {
    return 0;
  }
}

+ (Class)metricType
{
  return (Class)objc_opt_class();
}

@end
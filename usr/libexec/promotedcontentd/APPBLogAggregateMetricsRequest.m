@interface APPBLogAggregateMetricsRequest
+ (Class)distributionMetricsType;
+ (Class)scalarMetricsType;
+ (id)options;
- (BOOL)hasDeviceModel;
- (BOOL)hasOperatingSystemDescription;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)distributionMetrics;
- (NSMutableArray)scalarMetrics;
- (NSString)deviceModel;
- (NSString)operatingSystemDescription;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)distributionMetricsAtIndex:(unint64_t)a3;
- (id)scalarMetricsAtIndex:(unint64_t)a3;
- (unint64_t)distributionMetricsCount;
- (unint64_t)hash;
- (unint64_t)scalarMetricsCount;
- (void)addDistributionMetrics:(id)a3;
- (void)addScalarMetrics:(id)a3;
- (void)clearDistributionMetrics;
- (void)clearScalarMetrics;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setDeviceModel:(id)a3;
- (void)setDistributionMetrics:(id)a3;
- (void)setOperatingSystemDescription:(id)a3;
- (void)setScalarMetrics:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation APPBLogAggregateMetricsRequest

+ (id)options
{
  if (qword_100289950 != -1) {
    dispatch_once(&qword_100289950, &stru_100235680);
  }
  v2 = (void *)qword_100289948;

  return v2;
}

- (BOOL)hasDeviceModel
{
  return self->_deviceModel != 0;
}

- (BOOL)hasOperatingSystemDescription
{
  return self->_operatingSystemDescription != 0;
}

- (void)clearDistributionMetrics
{
}

- (void)addDistributionMetrics:(id)a3
{
  id v4 = a3;
  distributionMetrics = self->_distributionMetrics;
  id v8 = v4;
  if (!distributionMetrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_distributionMetrics;
    self->_distributionMetrics = v6;

    id v4 = v8;
    distributionMetrics = self->_distributionMetrics;
  }
  [(NSMutableArray *)distributionMetrics addObject:v4];
}

- (unint64_t)distributionMetricsCount
{
  return (unint64_t)[(NSMutableArray *)self->_distributionMetrics count];
}

- (id)distributionMetricsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_distributionMetrics objectAtIndex:a3];
}

+ (Class)distributionMetricsType
{
  return (Class)objc_opt_class();
}

- (void)clearScalarMetrics
{
}

- (void)addScalarMetrics:(id)a3
{
  id v4 = a3;
  scalarMetrics = self->_scalarMetrics;
  id v8 = v4;
  if (!scalarMetrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    v7 = self->_scalarMetrics;
    self->_scalarMetrics = v6;

    id v4 = v8;
    scalarMetrics = self->_scalarMetrics;
  }
  [(NSMutableArray *)scalarMetrics addObject:v4];
}

- (unint64_t)scalarMetricsCount
{
  return (unint64_t)[(NSMutableArray *)self->_scalarMetrics count];
}

- (id)scalarMetricsAtIndex:(unint64_t)a3
{
  return [(NSMutableArray *)self->_scalarMetrics objectAtIndex:a3];
}

+ (Class)scalarMetricsType
{
  return (Class)objc_opt_class();
}

- (id)description
{
  v7.receiver = self;
  v7.super_class = (Class)APPBLogAggregateMetricsRequest;
  v3 = [(APPBLogAggregateMetricsRequest *)&v7 description];
  id v4 = [(APPBLogAggregateMetricsRequest *)self dictionaryRepresentation];
  v5 = +[NSString stringWithFormat:@"%@ %@", v3, v4];

  return v5;
}

- (id)dictionaryRepresentation
{
  v3 = +[NSMutableDictionary dictionary];
  id v4 = v3;
  deviceModel = self->_deviceModel;
  if (deviceModel) {
    [v3 setObject:deviceModel forKey:@"deviceModel"];
  }
  operatingSystemDescription = self->_operatingSystemDescription;
  if (operatingSystemDescription) {
    [v4 setObject:operatingSystemDescription forKey:@"operatingSystemDescription"];
  }
  if ([(NSMutableArray *)self->_distributionMetrics count])
  {
    id v7 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_distributionMetrics, "count")];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v8 = self->_distributionMetrics;
    id v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v27;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v27 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = [*(id *)(*((void *)&v26 + 1) + 8 * i) dictionaryRepresentation];
          [v7 addObject:v13];
        }
        id v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v26 objects:v31 count:16];
      }
      while (v10);
    }

    [v4 setObject:v7 forKey:@"distributionMetrics"];
  }
  if ([(NSMutableArray *)self->_scalarMetrics count])
  {
    id v14 = [objc_alloc((Class)NSMutableArray) initWithCapacity:-[NSMutableArray count](self->_scalarMetrics, "count")];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    v15 = self->_scalarMetrics;
    id v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    if (v16)
    {
      id v17 = v16;
      uint64_t v18 = *(void *)v23;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(void *)v23 != v18) {
            objc_enumerationMutation(v15);
          }
          v20 = [*(id *)(*((void *)&v22 + 1) + 8 * (void)j) dictionaryRepresentation:v22];
          [v14 addObject:v20];
        }
        id v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
      }
      while (v17);
    }

    [v4 setObject:v14 forKey:@"scalarMetrics"];
  }

  return v4;
}

- (BOOL)readFrom:(id)a3
{
  return APPBLogAggregateMetricsRequestReadFrom((char *)self, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  id v4 = a3;
  if (self->_deviceModel) {
    PBDataWriterWriteStringField();
  }
  if (self->_operatingSystemDescription) {
    PBDataWriterWriteStringField();
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = self->_distributionMetrics;
  v6 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      id v7 = (char *)[(NSMutableArray *)v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = self->_scalarMetrics;
  uint64_t v11 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      v12 = (char *)[(NSMutableArray *)v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (void)copyTo:(id)a3
{
  id v12 = a3;
  if (self->_deviceModel) {
    [v12 setDeviceModel:];
  }
  if (self->_operatingSystemDescription) {
    [v12 setOperatingSystemDescription:];
  }
  if ([(APPBLogAggregateMetricsRequest *)self distributionMetricsCount])
  {
    [v12 clearDistributionMetrics];
    unint64_t v4 = [(APPBLogAggregateMetricsRequest *)self distributionMetricsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        id v7 = [(APPBLogAggregateMetricsRequest *)self distributionMetricsAtIndex:i];
        [v12 addDistributionMetrics:v7];
      }
    }
  }
  if ([(APPBLogAggregateMetricsRequest *)self scalarMetricsCount])
  {
    [v12 clearScalarMetrics];
    unint64_t v8 = [(APPBLogAggregateMetricsRequest *)self scalarMetricsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(APPBLogAggregateMetricsRequest *)self scalarMetricsAtIndex:j];
        [v12 addScalarMetrics:v11];
      }
    }
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  unint64_t v5 = [[objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3) init];
  id v6 = [(NSString *)self->_deviceModel copyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  id v8 = [(NSString *)self->_operatingSystemDescription copyWithZone:a3];
  unint64_t v9 = (void *)v5[3];
  v5[3] = v8;

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v10 = self->_distributionMetrics;
  id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v28;
    do
    {
      id v14 = 0;
      do
      {
        if (*(void *)v28 != v13) {
          objc_enumerationMutation(v10);
        }
        id v15 = [*(id *)(*((void *)&v27 + 1) + 8 * (void)v14) copyWithZone:a3];
        [v5 addDistributionMetrics:v15];

        id v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      id v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v12);
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v16 = self->_scalarMetrics;
  id v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v17)
  {
    id v18 = v17;
    uint64_t v19 = *(void *)v24;
    do
    {
      long long v20 = 0;
      do
      {
        if (*(void *)v24 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = [[*(id *)(*((void *)&v23 + 1) + 8 * (void)v20) copyWithZone:a3];
        [v5 addScalarMetrics:v21];

        long long v20 = (char *)v20 + 1;
      }
      while (v18 != v20);
      id v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v18);
  }

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((deviceModel = self->_deviceModel, !((unint64_t)deviceModel | v4[1]))
     || -[NSString isEqual:](deviceModel, "isEqual:"))
    && ((operatingSystemDescription = self->_operatingSystemDescription,
         !((unint64_t)operatingSystemDescription | v4[3]))
     || -[NSString isEqual:](operatingSystemDescription, "isEqual:"))
    && ((distributionMetrics = self->_distributionMetrics, !((unint64_t)distributionMetrics | v4[2]))
     || -[NSMutableArray isEqual:](distributionMetrics, "isEqual:")))
  {
    scalarMetrics = self->_scalarMetrics;
    if ((unint64_t)scalarMetrics | v4[4]) {
      unsigned __int8 v9 = -[NSMutableArray isEqual:](scalarMetrics, "isEqual:");
    }
    else {
      unsigned __int8 v9 = 1;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (unint64_t)hash
{
  NSUInteger v3 = [(NSString *)self->_deviceModel hash];
  unint64_t v4 = [(NSString *)self->_operatingSystemDescription hash] ^ v3;
  unint64_t v5 = (unint64_t)[(NSMutableArray *)self->_distributionMetrics hash];
  return v4 ^ v5 ^ (unint64_t)[(NSMutableArray *)self->_scalarMetrics hash];
}

- (void)mergeFrom:(id)a3
{
  id v4 = a3;
  if (*((void *)v4 + 1)) {
    -[APPBLogAggregateMetricsRequest setDeviceModel:](self, "setDeviceModel:");
  }
  if (*((void *)v4 + 3)) {
    -[APPBLogAggregateMetricsRequest setOperatingSystemDescription:](self, "setOperatingSystemDescription:");
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v5 = *((id *)v4 + 2);
  id v6 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        [(APPBLogAggregateMetricsRequest *)self addDistributionMetrics:*(void *)(*((void *)&v19 + 1) + 8 * i)];
      }
      id v7 = [v5 countByEnumeratingWithState:&v19 objects:v24 count:16];
    }
    while (v7);
  }

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v10 = *((id *)v4 + 4);
  id v11 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v16;
    do
    {
      for (uint64_t j = 0; j != v12; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v16 != v13) {
          objc_enumerationMutation(v10);
        }
        -[APPBLogAggregateMetricsRequest addScalarMetrics:](self, "addScalarMetrics:", *(void *)(*((void *)&v15 + 1) + 8 * (void)j), (void)v15);
      }
      id v12 = [v10 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v12);
  }
}

- (NSString)deviceModel
{
  return self->_deviceModel;
}

- (void)setDeviceModel:(id)a3
{
}

- (NSString)operatingSystemDescription
{
  return self->_operatingSystemDescription;
}

- (void)setOperatingSystemDescription:(id)a3
{
}

- (NSMutableArray)distributionMetrics
{
  return self->_distributionMetrics;
}

- (void)setDistributionMetrics:(id)a3
{
}

- (NSMutableArray)scalarMetrics
{
  return self->_scalarMetrics;
}

- (void)setScalarMetrics:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scalarMetrics, 0);
  objc_storeStrong((id *)&self->_operatingSystemDescription, 0);
  objc_storeStrong((id *)&self->_distributionMetrics, 0);

  objc_storeStrong((id *)&self->_deviceModel, 0);
}

@end
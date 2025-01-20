@interface MTPerfBaseMeasurement
- (MTPerfBaseMeasurement)initWithMeasurementTransformer:(id)a3 eventData:(id)a4;
- (MTPerfBaseMeasurementTransformation)measurementTransformer;
- (NSArray)additionalFields;
- (NSArray)eventData;
- (NSMutableDictionary)measurementSpecificData;
- (NSMutableDictionary)timestamps;
- (id)getAdditionalData;
- (id)metricsData;
- (id)record;
- (void)addFields:(id)a3;
- (void)addFieldsWithDictionary:(id)a3;
- (void)addFieldsWithPromise:(id)a3;
- (void)setMeasurementSpecificData:(id)a3;
- (void)setMeasurementTransformer:(id)a3;
- (void)setTimestamps:(id)a3;
@end

@implementation MTPerfBaseMeasurement

- (void)addFields:(id)a3
{
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = [(MTPerfBaseMeasurement *)v5 getAdditionalData];
  v12 = (id *)&v13;
  id v7 = v4;
  v8 = v7;
  if (v7)
  {
    v9 = v7;
    do
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [v6 addObjectsFromArray:v9];
      }
      else {
        [v6 addObject:v9];
      }
      v10 = v12++;
      id v11 = *v10;

      v9 = v11;
    }
    while (v11);
  }

  objc_sync_exit(v5);
}

- (id)getAdditionalData
{
  additionalData = self->_additionalData;
  if (!additionalData)
  {
    id v4 = [MEMORY[0x263EFF980] array];
    v5 = self->_additionalData;
    self->_additionalData = v4;

    additionalData = self->_additionalData;
  }

  return additionalData;
}

- (NSMutableDictionary)timestamps
{
  return self->_timestamps;
}

- (id)record
{
  v2 = [(MTPerfBaseMeasurement *)self metricsData];
  v3 = [v2 recordEvent];

  return v3;
}

- (id)metricsData
{
  v3 = [(MTPerfBaseMeasurement *)self measurementTransformer];
  id v4 = [v3 metricsDataWithPerfMeasurement:self];

  [v4 setAnonymous:1];

  return v4;
}

- (MTPerfBaseMeasurementTransformation)measurementTransformer
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_measurementTransformer);

  return (MTPerfBaseMeasurementTransformation *)WeakRetained;
}

- (MTPerfBaseMeasurement)initWithMeasurementTransformer:(id)a3 eventData:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v17.receiver = self;
  v17.super_class = (Class)MTPerfBaseMeasurement;
  v8 = [(MTPerfBaseMeasurement *)&v17 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_measurementTransformer, v6);
    uint64_t v10 = objc_msgSend(v7, "mt_deepCopy");
    eventData = v9->_eventData;
    v9->_eventData = (NSArray *)v10;

    uint64_t v12 = [MEMORY[0x263EFF9A0] dictionary];
    timestamps = v9->_timestamps;
    v9->_timestamps = (NSMutableDictionary *)v12;

    uint64_t v14 = [MEMORY[0x263EFF9A0] dictionary];
    measurementSpecificData = v9->_measurementSpecificData;
    v9->_measurementSpecificData = (NSMutableDictionary *)v14;
  }
  return v9;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_measurementTransformer);
  objc_storeStrong((id *)&self->_measurementSpecificData, 0);
  objc_storeStrong((id *)&self->_timestamps, 0);
  objc_storeStrong((id *)&self->_eventData, 0);

  objc_storeStrong((id *)&self->_additionalData, 0);
}

- (NSArray)additionalFields
{
  v2 = (void *)[(NSMutableArray *)self->_additionalData copy];

  return (NSArray *)v2;
}

- (NSArray)eventData
{
  v3 = [MEMORY[0x263EFF980] array];
  if ([(NSArray *)self->_eventData count]) {
    [v3 addObjectsFromArray:self->_eventData];
  }
  id v4 = [(MTPerfBaseMeasurement *)self timestamps];
  uint64_t v5 = [v4 count];

  if (v5)
  {
    id v6 = [(MTPerfBaseMeasurement *)self timestamps];
    id v7 = (void *)[v6 copy];
    [v3 addObject:v7];
  }
  v8 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
  uint64_t v9 = [v8 count];

  if (v9)
  {
    uint64_t v10 = [(MTPerfBaseMeasurement *)self measurementSpecificData];
    id v11 = (void *)[v10 copy];
    [v3 addObject:v11];
  }
  uint64_t v12 = (void *)[v3 copy];

  return (NSArray *)v12;
}

- (void)addFieldsWithDictionary:(id)a3
{
}

- (void)addFieldsWithPromise:(id)a3
{
}

- (void)setTimestamps:(id)a3
{
}

- (NSMutableDictionary)measurementSpecificData
{
  return self->_measurementSpecificData;
}

- (void)setMeasurementSpecificData:(id)a3
{
}

- (void)setMeasurementTransformer:(id)a3
{
}

@end
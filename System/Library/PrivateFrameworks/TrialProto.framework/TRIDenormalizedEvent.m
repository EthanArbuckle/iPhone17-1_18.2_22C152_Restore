@interface TRIDenormalizedEvent
+ (Class)metricType;
+ (Class)treatmentType;
+ (Class)userDimensionType;
- (BOOL)hasMlruntimeDimensions;
- (BOOL)hasSubject;
- (BOOL)hasSystemDimensions;
- (BOOL)hasTrialSystemTelemetry;
- (BOOL)isEqual:(id)a3;
- (BOOL)readFrom:(id)a3;
- (NSMutableArray)metrics;
- (NSMutableArray)treatments;
- (NSMutableArray)userDimensions;
- (TRIMLRuntimeDimensions)mlruntimeDimensions;
- (TRISubject)subject;
- (TRISystemDimensions)systemDimensions;
- (TRITrialSystemTelemetry)trialSystemTelemetry;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)metricAtIndex:(unint64_t)a3;
- (id)treatmentAtIndex:(unint64_t)a3;
- (id)userDimensionAtIndex:(unint64_t)a3;
- (unint64_t)hash;
- (unint64_t)metricsCount;
- (unint64_t)treatmentsCount;
- (unint64_t)userDimensionsCount;
- (void)addMetric:(id)a3;
- (void)addTreatment:(id)a3;
- (void)addUserDimension:(id)a3;
- (void)clearMetrics;
- (void)clearTreatments;
- (void)clearUserDimensions;
- (void)copyTo:(id)a3;
- (void)mergeFrom:(id)a3;
- (void)setMetrics:(id)a3;
- (void)setMlruntimeDimensions:(id)a3;
- (void)setSubject:(id)a3;
- (void)setSystemDimensions:(id)a3;
- (void)setTreatments:(id)a3;
- (void)setTrialSystemTelemetry:(id)a3;
- (void)setUserDimensions:(id)a3;
- (void)writeTo:(id)a3;
@end

@implementation TRIDenormalizedEvent

- (BOOL)hasSubject
{
  return self->_subject != 0;
}

- (void)clearTreatments
{
}

- (void)addTreatment:(id)a3
{
  id v4 = a3;
  treatments = self->_treatments;
  id v8 = v4;
  if (!treatments)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_treatments;
    self->_treatments = v6;

    id v4 = v8;
    treatments = self->_treatments;
  }
  [(NSMutableArray *)treatments addObject:v4];
}

- (unint64_t)treatmentsCount
{
  return [(NSMutableArray *)self->_treatments count];
}

- (id)treatmentAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_treatments objectAtIndex:a3];
}

+ (Class)treatmentType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasSystemDimensions
{
  return self->_systemDimensions != 0;
}

- (void)clearUserDimensions
{
}

- (void)addUserDimension:(id)a3
{
  id v4 = a3;
  userDimensions = self->_userDimensions;
  id v8 = v4;
  if (!userDimensions)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_userDimensions;
    self->_userDimensions = v6;

    id v4 = v8;
    userDimensions = self->_userDimensions;
  }
  [(NSMutableArray *)userDimensions addObject:v4];
}

- (unint64_t)userDimensionsCount
{
  return [(NSMutableArray *)self->_userDimensions count];
}

- (id)userDimensionAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_userDimensions objectAtIndex:a3];
}

+ (Class)userDimensionType
{
  return (Class)objc_opt_class();
}

- (void)clearMetrics
{
}

- (void)addMetric:(id)a3
{
  id v4 = a3;
  metrics = self->_metrics;
  id v8 = v4;
  if (!metrics)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    v7 = self->_metrics;
    self->_metrics = v6;

    id v4 = v8;
    metrics = self->_metrics;
  }
  [(NSMutableArray *)metrics addObject:v4];
}

- (unint64_t)metricsCount
{
  return [(NSMutableArray *)self->_metrics count];
}

- (id)metricAtIndex:(unint64_t)a3
{
  return (id)[(NSMutableArray *)self->_metrics objectAtIndex:a3];
}

+ (Class)metricType
{
  return (Class)objc_opt_class();
}

- (BOOL)hasTrialSystemTelemetry
{
  return self->_trialSystemTelemetry != 0;
}

- (BOOL)hasMlruntimeDimensions
{
  return self->_mlruntimeDimensions != 0;
}

- (id)description
{
  v3 = NSString;
  v8.receiver = self;
  v8.super_class = (Class)TRIDenormalizedEvent;
  id v4 = [(TRIDenormalizedEvent *)&v8 description];
  v5 = [(TRIDenormalizedEvent *)self dictionaryRepresentation];
  v6 = [v3 stringWithFormat:@"%@ %@", v4, v5];

  return v6;
}

- (id)dictionaryRepresentation
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v3 = [MEMORY[0x1E4F1CA60] dictionary];
  subject = self->_subject;
  if (subject)
  {
    v5 = [(TRISubject *)subject dictionaryRepresentation];
    [v3 setObject:v5 forKey:@"subject"];
  }
  if ([(NSMutableArray *)self->_treatments count])
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_treatments, "count"));
    long long v42 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    v7 = self->_treatments;
    uint64_t v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v43 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v42 + 1) + 8 * i) dictionaryRepresentation];
          [v6 addObject:v12];
        }
        uint64_t v9 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v42 objects:v48 count:16];
      }
      while (v9);
    }

    [v3 setObject:v6 forKey:@"treatment"];
  }
  systemDimensions = self->_systemDimensions;
  if (systemDimensions)
  {
    v14 = [(TRISystemDimensions *)systemDimensions dictionaryRepresentation];
    [v3 setObject:v14 forKey:@"system_dimensions"];
  }
  if ([(NSMutableArray *)self->_userDimensions count])
  {
    v15 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_userDimensions, "count"));
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    v16 = self->_userDimensions;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v39;
      do
      {
        for (uint64_t j = 0; j != v18; ++j)
        {
          if (*(void *)v39 != v19) {
            objc_enumerationMutation(v16);
          }
          v21 = [*(id *)(*((void *)&v38 + 1) + 8 * j) dictionaryRepresentation];
          [v15 addObject:v21];
        }
        uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v38 objects:v47 count:16];
      }
      while (v18);
    }

    [v3 setObject:v15 forKey:@"user_dimension"];
  }
  if ([(NSMutableArray *)self->_metrics count])
  {
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableArray count](self->_metrics, "count"));
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    v23 = self->_metrics;
    uint64_t v24 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v35;
      do
      {
        for (uint64_t k = 0; k != v25; ++k)
        {
          if (*(void *)v35 != v26) {
            objc_enumerationMutation(v23);
          }
          v28 = objc_msgSend(*(id *)(*((void *)&v34 + 1) + 8 * k), "dictionaryRepresentation", (void)v34);
          [v22 addObject:v28];
        }
        uint64_t v25 = [(NSMutableArray *)v23 countByEnumeratingWithState:&v34 objects:v46 count:16];
      }
      while (v25);
    }

    [v3 setObject:v22 forKey:@"metric"];
  }
  trialSystemTelemetry = self->_trialSystemTelemetry;
  if (trialSystemTelemetry)
  {
    v30 = [(TRITrialSystemTelemetry *)trialSystemTelemetry dictionaryRepresentation];
    [v3 setObject:v30 forKey:@"trial_system_telemetry"];
  }
  mlruntimeDimensions = self->_mlruntimeDimensions;
  if (mlruntimeDimensions)
  {
    v32 = [(TRIMLRuntimeDimensions *)mlruntimeDimensions dictionaryRepresentation];
    [v3 setObject:v32 forKey:@"mlruntime_dimensions"];
  }
  return v3;
}

- (BOOL)readFrom:(id)a3
{
  return TRIDenormalizedEventReadFrom((id *)&self->super.super.isa, (uint64_t)a3);
}

- (void)writeTo:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_subject) {
    PBDataWriterWriteSubmessage();
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  v5 = self->_treatments;
  uint64_t v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v29;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v29 != v8) {
          objc_enumerationMutation(v5);
        }
        PBDataWriterWriteSubmessage();
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v28 objects:v34 count:16];
    }
    while (v7);
  }

  if (self->_systemDimensions) {
    PBDataWriterWriteSubmessage();
  }
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v10 = self->_userDimensions;
  uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v25;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v25 != v13) {
          objc_enumerationMutation(v10);
        }
        PBDataWriterWriteSubmessage();
        ++v14;
      }
      while (v12 != v14);
      uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v12);
  }

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v15 = self->_metrics;
  uint64_t v16 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v21;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v21 != v18) {
          objc_enumerationMutation(v15);
        }
        PBDataWriterWriteSubmessage();
        ++v19;
      }
      while (v17 != v19);
      uint64_t v17 = [(NSMutableArray *)v15 countByEnumeratingWithState:&v20 objects:v32 count:16];
    }
    while (v17);
  }

  if (self->_trialSystemTelemetry) {
    PBDataWriterWriteSubmessage();
  }
  if (self->_mlruntimeDimensions) {
    PBDataWriterWriteSubmessage();
  }
}

- (void)copyTo:(id)a3
{
  id v17 = a3;
  if (self->_subject) {
    objc_msgSend(v17, "setSubject:");
  }
  if ([(TRIDenormalizedEvent *)self treatmentsCount])
  {
    [v17 clearTreatments];
    unint64_t v4 = [(TRIDenormalizedEvent *)self treatmentsCount];
    if (v4)
    {
      unint64_t v5 = v4;
      for (uint64_t i = 0; i != v5; ++i)
      {
        uint64_t v7 = [(TRIDenormalizedEvent *)self treatmentAtIndex:i];
        [v17 addTreatment:v7];
      }
    }
  }
  if (self->_systemDimensions) {
    objc_msgSend(v17, "setSystemDimensions:");
  }
  if ([(TRIDenormalizedEvent *)self userDimensionsCount])
  {
    [v17 clearUserDimensions];
    unint64_t v8 = [(TRIDenormalizedEvent *)self userDimensionsCount];
    if (v8)
    {
      unint64_t v9 = v8;
      for (uint64_t j = 0; j != v9; ++j)
      {
        uint64_t v11 = [(TRIDenormalizedEvent *)self userDimensionAtIndex:j];
        [v17 addUserDimension:v11];
      }
    }
  }
  if ([(TRIDenormalizedEvent *)self metricsCount])
  {
    [v17 clearMetrics];
    unint64_t v12 = [(TRIDenormalizedEvent *)self metricsCount];
    if (v12)
    {
      unint64_t v13 = v12;
      for (uint64_t k = 0; k != v13; ++k)
      {
        v15 = [(TRIDenormalizedEvent *)self metricAtIndex:k];
        [v17 addMetric:v15];
      }
    }
  }
  if (self->_trialSystemTelemetry) {
    objc_msgSend(v17, "setTrialSystemTelemetry:");
  }
  uint64_t v16 = v17;
  if (self->_mlruntimeDimensions)
  {
    objc_msgSend(v17, "setMlruntimeDimensions:");
    uint64_t v16 = v17;
  }
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  id v6 = [(TRISubject *)self->_subject copyWithZone:a3];
  uint64_t v7 = (void *)v5[3];
  v5[3] = v6;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  unint64_t v8 = self->_treatments;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v42;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v42 != v11) {
          objc_enumerationMutation(v8);
        }
        unint64_t v13 = (void *)[*(id *)(*((void *)&v41 + 1) + 8 * v12) copyWithZone:a3];
        [v5 addTreatment:v13];

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v10);
  }

  id v14 = [(TRISystemDimensions *)self->_systemDimensions copyWithZone:a3];
  v15 = (void *)v5[4];
  v5[4] = v14;

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v16 = self->_userDimensions;
  uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v38;
    do
    {
      uint64_t v20 = 0;
      do
      {
        if (*(void *)v38 != v19) {
          objc_enumerationMutation(v16);
        }
        long long v21 = (void *)[*(id *)(*((void *)&v37 + 1) + 8 * v20) copyWithZone:a3];
        [v5 addUserDimension:v21];

        ++v20;
      }
      while (v18 != v20);
      uint64_t v18 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v37 objects:v46 count:16];
    }
    while (v18);
  }

  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v22 = self->_metrics;
  uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v34;
    do
    {
      uint64_t v26 = 0;
      do
      {
        if (*(void *)v34 != v25) {
          objc_enumerationMutation(v22);
        }
        long long v27 = objc_msgSend(*(id *)(*((void *)&v33 + 1) + 8 * v26), "copyWithZone:", a3, (void)v33);
        [v5 addMetric:v27];

        ++v26;
      }
      while (v24 != v26);
      uint64_t v24 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v33 objects:v45 count:16];
    }
    while (v24);
  }

  id v28 = [(TRITrialSystemTelemetry *)self->_trialSystemTelemetry copyWithZone:a3];
  long long v29 = (void *)v5[6];
  v5[6] = v28;

  id v30 = [(TRIMLRuntimeDimensions *)self->_mlruntimeDimensions copyWithZone:a3];
  long long v31 = (void *)v5[2];
  v5[2] = v30;

  return v5;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  if ([v4 isMemberOfClass:objc_opt_class()]
    && ((subject = self->_subject, !((unint64_t)subject | v4[3])) || -[TRISubject isEqual:](subject, "isEqual:"))
    && ((treatments = self->_treatments, !((unint64_t)treatments | v4[5]))
     || -[NSMutableArray isEqual:](treatments, "isEqual:"))
    && ((systemDimensions = self->_systemDimensions, !((unint64_t)systemDimensions | v4[4]))
     || -[TRISystemDimensions isEqual:](systemDimensions, "isEqual:"))
    && ((userDimensions = self->_userDimensions, !((unint64_t)userDimensions | v4[7]))
     || -[NSMutableArray isEqual:](userDimensions, "isEqual:"))
    && ((metrics = self->_metrics, !((unint64_t)metrics | v4[1]))
     || -[NSMutableArray isEqual:](metrics, "isEqual:"))
    && ((trialSystemTelemetry = self->_trialSystemTelemetry, !((unint64_t)trialSystemTelemetry | v4[6]))
     || -[TRITrialSystemTelemetry isEqual:](trialSystemTelemetry, "isEqual:")))
  {
    mlruntimeDimensions = self->_mlruntimeDimensions;
    if ((unint64_t)mlruntimeDimensions | v4[2]) {
      char v12 = -[TRIMLRuntimeDimensions isEqual:](mlruntimeDimensions, "isEqual:");
    }
    else {
      char v12 = 1;
    }
  }
  else
  {
    char v12 = 0;
  }

  return v12;
}

- (unint64_t)hash
{
  unint64_t v3 = [(TRISubject *)self->_subject hash];
  uint64_t v4 = [(NSMutableArray *)self->_treatments hash] ^ v3;
  unint64_t v5 = [(TRISystemDimensions *)self->_systemDimensions hash];
  uint64_t v6 = v4 ^ v5 ^ [(NSMutableArray *)self->_userDimensions hash];
  uint64_t v7 = [(NSMutableArray *)self->_metrics hash];
  unint64_t v8 = v7 ^ [(TRITrialSystemTelemetry *)self->_trialSystemTelemetry hash];
  return v6 ^ v8 ^ [(TRIMLRuntimeDimensions *)self->_mlruntimeDimensions hash];
}

- (void)mergeFrom:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  subject = self->_subject;
  uint64_t v6 = *((void *)v4 + 3);
  if (subject)
  {
    if (v6) {
      -[TRISubject mergeFrom:](subject, "mergeFrom:");
    }
  }
  else if (v6)
  {
    -[TRIDenormalizedEvent setSubject:](self, "setSubject:");
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = *((id *)v4 + 5);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(v7);
        }
        [(TRIDenormalizedEvent *)self addTreatment:*(void *)(*((void *)&v36 + 1) + 8 * i)];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v36 objects:v42 count:16];
    }
    while (v9);
  }

  systemDimensions = self->_systemDimensions;
  uint64_t v13 = *((void *)v4 + 4);
  if (systemDimensions)
  {
    if (v13) {
      -[TRISystemDimensions mergeFrom:](systemDimensions, "mergeFrom:");
    }
  }
  else if (v13)
  {
    -[TRIDenormalizedEvent setSystemDimensions:](self, "setSystemDimensions:");
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v14 = *((id *)v4 + 7);
  uint64_t v15 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v33;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v33 != v17) {
          objc_enumerationMutation(v14);
        }
        [(TRIDenormalizedEvent *)self addUserDimension:*(void *)(*((void *)&v32 + 1) + 8 * j)];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v32 objects:v41 count:16];
    }
    while (v16);
  }

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v19 = *((id *)v4 + 1);
  uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v29;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(v19);
        }
        -[TRIDenormalizedEvent addMetric:](self, "addMetric:", *(void *)(*((void *)&v28 + 1) + 8 * k), (void)v28);
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v40 count:16];
    }
    while (v21);
  }

  trialSystemTelemetry = self->_trialSystemTelemetry;
  uint64_t v25 = *((void *)v4 + 6);
  if (trialSystemTelemetry)
  {
    if (v25) {
      -[TRITrialSystemTelemetry mergeFrom:](trialSystemTelemetry, "mergeFrom:");
    }
  }
  else if (v25)
  {
    -[TRIDenormalizedEvent setTrialSystemTelemetry:](self, "setTrialSystemTelemetry:");
  }
  mlruntimeDimensions = self->_mlruntimeDimensions;
  uint64_t v27 = *((void *)v4 + 2);
  if (mlruntimeDimensions)
  {
    if (v27) {
      -[TRIMLRuntimeDimensions mergeFrom:](mlruntimeDimensions, "mergeFrom:");
    }
  }
  else if (v27)
  {
    -[TRIDenormalizedEvent setMlruntimeDimensions:](self, "setMlruntimeDimensions:");
  }
}

- (TRISubject)subject
{
  return self->_subject;
}

- (void)setSubject:(id)a3
{
}

- (NSMutableArray)treatments
{
  return self->_treatments;
}

- (void)setTreatments:(id)a3
{
}

- (TRISystemDimensions)systemDimensions
{
  return self->_systemDimensions;
}

- (void)setSystemDimensions:(id)a3
{
}

- (NSMutableArray)userDimensions
{
  return self->_userDimensions;
}

- (void)setUserDimensions:(id)a3
{
}

- (NSMutableArray)metrics
{
  return self->_metrics;
}

- (void)setMetrics:(id)a3
{
}

- (TRITrialSystemTelemetry)trialSystemTelemetry
{
  return self->_trialSystemTelemetry;
}

- (void)setTrialSystemTelemetry:(id)a3
{
}

- (TRIMLRuntimeDimensions)mlruntimeDimensions
{
  return self->_mlruntimeDimensions;
}

- (void)setMlruntimeDimensions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userDimensions, 0);
  objc_storeStrong((id *)&self->_trialSystemTelemetry, 0);
  objc_storeStrong((id *)&self->_treatments, 0);
  objc_storeStrong((id *)&self->_systemDimensions, 0);
  objc_storeStrong((id *)&self->_subject, 0);
  objc_storeStrong((id *)&self->_mlruntimeDimensions, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
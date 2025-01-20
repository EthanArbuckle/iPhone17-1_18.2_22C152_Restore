@interface REDuetEvent
+ (id)eventWithInterval:(id)a3 value:(id)a4 confidence:(double)a5;
- (BOOL)isEqual:(id)a3;
- (NSDateInterval)interval;
- (REFeatureValue)value;
- (double)confidence;
- (unint64_t)hash;
@end

@implementation REDuetEvent

+ (id)eventWithInterval:(id)a3 value:(id)a4 confidence:(double)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = objc_opt_new();
  v10 = *(void **)(v9 + 8);
  *(void *)(v9 + 8) = v7;
  id v11 = v7;

  uint64_t v12 = [v8 copy];
  v13 = *(void **)(v9 + 16);
  *(void *)(v9 + 16) = v12;

  *(double *)(v9 + 24) = a5;
  return (id)v9;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSDateInterval *)self->_interval hash];
  unint64_t v4 = [(REFeatureValue *)self->_value hash] ^ v3;
  v5 = [NSNumber numberWithDouble:self->_confidence];
  unint64_t v6 = v4 ^ [v5 hash];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (REDuetEvent *)a3;
  if (v4 == self)
  {
    BOOL v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      interval = self->_interval;
      id v7 = v5->_interval;
      if (interval == v7)
      {
      }
      else
      {
        id v8 = v7;
        uint64_t v9 = interval;
        int v10 = [(NSDateInterval *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_11;
        }
      }
      value = self->_value;
      v13 = v5->_value;
      if (value == v13)
      {
      }
      else
      {
        v14 = v13;
        v15 = value;
        BOOL v16 = [(REFeatureValue *)v15 isEqual:v14];

        if (!v16)
        {
LABEL_11:
          BOOL v11 = 0;
LABEL_16:

          goto LABEL_17;
        }
      }
      double v17 = self->_confidence - v5->_confidence;
      if (v17 < 0.0) {
        double v17 = -v17;
      }
      BOOL v11 = v17 < 0.00000011920929;
      goto LABEL_16;
    }
    BOOL v11 = 0;
  }
LABEL_17:

  return v11;
}

- (NSDateInterval)interval
{
  return self->_interval;
}

- (REFeatureValue)value
{
  return self->_value;
}

- (double)confidence
{
  return self->_confidence;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_interval, 0);
}

@end
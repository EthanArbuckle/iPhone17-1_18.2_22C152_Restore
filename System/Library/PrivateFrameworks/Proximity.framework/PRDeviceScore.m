@interface PRDeviceScore
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPRDeviceScore:(id)a3;
- (NSData)btAddress;
- (PRAngleMeasurement)angle;
- (PRDeviceScore)init;
- (PRDeviceScore)initWithValues:(id)a3 proximity:(int64_t)a4 range:(id)a5 angle:(id)a6 score:(double)a7 scoreUncertainty:(double)a8;
- (PRRangeMeasurement)range;
- (double)score;
- (double)scoreUncertainty;
- (double)timestamp;
- (int64_t)proximity;
- (void)setTimestamp:(double)a3;
@end

@implementation PRDeviceScore

- (PRDeviceScore)init
{
  return 0;
}

- (PRDeviceScore)initWithValues:(id)a3 proximity:(int64_t)a4 range:(id)a5 angle:(id)a6 score:(double)a7 scoreUncertainty:(double)a8
{
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  if (!v15)
  {
    v26 = [MEMORY[0x1E4F28B00] currentHandler];
    [v26 handleFailureInMethod:a2, self, @"PRDeviceScore.m", 25, @"Invalid parameter not satisfying: %@", @"btAddress" object file lineNumber description];
  }
  v27.receiver = self;
  v27.super_class = (Class)PRDeviceScore;
  v18 = [(PRDeviceScore *)&v27 init];
  if (v18)
  {
    uint64_t v19 = [v15 copy];
    btAddress = v18->_btAddress;
    v18->_btAddress = (NSData *)v19;

    v18->_proximity = a4;
    uint64_t v21 = [v16 copy];
    range = v18->_range;
    v18->_range = (PRRangeMeasurement *)v21;

    uint64_t v23 = [v17 copy];
    angle = v18->_angle;
    v18->_angle = (PRAngleMeasurement *)v23;

    v18->_score = a7;
    v18->_scoreUncertainty = a8;
  }

  return v18;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (PRDeviceScore *)a3;
  v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PRDeviceScore *)self isEqualToPRDeviceScore:v5];

  return v6;
}

- (BOOL)isEqualToPRDeviceScore:(id)a3
{
  v4 = (PRDeviceScore *)a3;
  v5 = v4;
  if (self != v4)
  {
    btAddress = self->_btAddress;
    v7 = [(PRDeviceScore *)v4 btAddress];
    LODWORD(btAddress) = [(NSData *)btAddress isEqual:v7];

    if (!btAddress) {
      goto LABEL_17;
    }
    int64_t v8 = [(PRDeviceScore *)self proximity];
    if (v8 != [(PRDeviceScore *)v5 proximity]) {
      goto LABEL_17;
    }
    uint64_t v9 = [(PRDeviceScore *)self range];
    if (v9
      && (v10 = (void *)v9,
          [(PRDeviceScore *)v5 range],
          v11 = objc_claimAutoreleasedReturnValue(),
          v11,
          v10,
          v11))
    {
      v12 = [(PRDeviceScore *)self range];
      v13 = [(PRDeviceScore *)v5 range];
      char v14 = [v12 isEqual:v13];

      if ((v14 & 1) == 0) {
        goto LABEL_17;
      }
    }
    else
    {
      id v16 = [(PRDeviceScore *)self range];
      if (v16) {
        goto LABEL_16;
      }
      id v17 = [(PRDeviceScore *)v5 range];

      if (v17) {
        goto LABEL_17;
      }
    }
    uint64_t v18 = [(PRDeviceScore *)self angle];
    if (v18)
    {
      uint64_t v19 = (void *)v18;
      v20 = [(PRDeviceScore *)v5 angle];

      if (v20)
      {
        uint64_t v21 = [(PRDeviceScore *)self angle];
        v22 = [(PRDeviceScore *)v5 angle];
        char v23 = [v21 isEqual:v22];

        if (v23)
        {
LABEL_20:
          [(PRDeviceScore *)self score];
          double v27 = v26;
          [(PRDeviceScore *)v5 score];
          if (v27 == v28)
          {
            [(PRDeviceScore *)self scoreUncertainty];
            double v30 = v29;
            [(PRDeviceScore *)v5 scoreUncertainty];
            BOOL v15 = v30 == v31;
            goto LABEL_18;
          }
        }
LABEL_17:
        BOOL v15 = 0;
        goto LABEL_18;
      }
    }
    id v16 = [(PRDeviceScore *)self angle];
    if (!v16)
    {
      v25 = [(PRDeviceScore *)v5 angle];

      if (!v25) {
        goto LABEL_20;
      }
      goto LABEL_17;
    }
LABEL_16:

    goto LABEL_17;
  }
  BOOL v15 = 1;
LABEL_18:

  return v15;
}

- (NSData)btAddress
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)proximity
{
  return self->_proximity;
}

- (PRRangeMeasurement)range
{
  return (PRRangeMeasurement *)objc_getProperty(self, a2, 24, 1);
}

- (PRAngleMeasurement)angle
{
  return (PRAngleMeasurement *)objc_getProperty(self, a2, 32, 1);
}

- (double)score
{
  return self->_score;
}

- (double)scoreUncertainty
{
  return self->_scoreUncertainty;
}

- (double)timestamp
{
  return self->_timestamp;
}

- (void)setTimestamp:(double)a3
{
  self->_timestamp = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_angle, 0);
  objc_storeStrong((id *)&self->_range, 0);
  objc_storeStrong((id *)&self->_btAddress, 0);
}

@end
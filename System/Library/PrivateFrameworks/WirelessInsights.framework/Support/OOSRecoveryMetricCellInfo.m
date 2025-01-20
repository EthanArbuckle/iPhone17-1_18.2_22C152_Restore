@interface OOSRecoveryMetricCellInfo
- (NSNumber)band;
- (NSNumber)tacOrLac;
- (NSString)gci;
- (NSString)rat;
- (OOSRecoveryMetricCellInfo)initWithTimestamp:(unint64_t)a3 rat:(id)a4 tacOrLac:(id)a5 gci:(id)a6 band:(id)a7;
- (id)description;
- (unint64_t)timestamp;
- (void)updateTimestampTo:(unint64_t)a3;
@end

@implementation OOSRecoveryMetricCellInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_band, 0);
  objc_storeStrong((id *)&self->_gci, 0);
  objc_storeStrong((id *)&self->_tacOrLac, 0);

  objc_storeStrong((id *)&self->_rat, 0);
}

- (OOSRecoveryMetricCellInfo)initWithTimestamp:(unint64_t)a3 rat:(id)a4 tacOrLac:(id)a5 gci:(id)a6 band:(id)a7
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v21.receiver = self;
  v21.super_class = (Class)OOSRecoveryMetricCellInfo;
  v17 = [(OOSRecoveryMetricCellInfo *)&v21 init];
  v18 = v17;
  if (v17)
  {
    v17->_timestamp = a3;
    objc_storeStrong((id *)&v17->_rat, a4);
    objc_storeStrong((id *)&v18->_tacOrLac, a5);
    objc_storeStrong((id *)&v18->_gci, a6);
    objc_storeStrong((id *)&v18->_band, a7);
    v19 = v18;
  }

  return v18;
}

- (void)updateTimestampTo:(unint64_t)a3
{
  self->_timestamp = a3;
}

- (id)description
{
  unint64_t v3 = [(OOSRecoveryMetricCellInfo *)self timestamp];
  v4 = [(OOSRecoveryMetricCellInfo *)self rat];
  v5 = [(OOSRecoveryMetricCellInfo *)self band];
  v6 = +[NSString stringWithFormat:@"timestamp %llu, rat %@, band %@", v3, v4, v5];

  return v6;
}

- (unint64_t)timestamp
{
  return self->_timestamp;
}

- (NSString)rat
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSNumber)tacOrLac
{
  return (NSNumber *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)gci
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (NSNumber)band
{
  return (NSNumber *)objc_getProperty(self, a2, 40, 1);
}

@end